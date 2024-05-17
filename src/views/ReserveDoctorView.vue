<template>
    <main>
        <div>
            <h2>预约列表</h2>
            <select v-model="selectedDoctor">
                <option disabled value="">请选择需要预约的医生</option>
                <option v-for="(doctor, index) in doctorList" :key="index" :value="doctor">
                    {{ doctor.dono }} - {{ doctor.name }} - {{ doctor.age }} - {{ doctor.phone }} - {{ doctor.expert }}
                </option>
            </select>
            <button @click="reserveCurrent">预约该医生</button>
            <BackToHomeButton />
        </div>
    </main>
</template>

<script setup lang="ts">
import BackToHomeButton from '@/components/BackToHomeButton.vue';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
const router = useRouter();
import { useRoute } from 'vue-router';
const route = useRoute();
import axios from 'axios';
axios.defaults.baseURL = "/api"

interface Doctor {
    dono: number;
    age: number;
    phone: string;
    name: string;
    expert: string;
}

const doctorList = ref<Doctor[]>([]);
const selectedDoctor = ref(null);

const pano = ref(0);
const denoVal = ref(0);

onMounted(async () => {
    const jwtData = window.localStorage.getItem("jwtData");
    try {
        const res = await axios.post("/department/doctorlist",
            { deno: route.query.department },
            {
                headers: {
                    'Content-Type': "application/x-www-form-urlencoded",
                    'Authorization': jwtData
                },
                responseType: 'json',
                responseEncoding: 'utf-8'
            }
        );

        const code = res.data["code"];
        const message = res.data["message"];
        if (code === 0) {
            doctorList.value = res.data.data.items
        } else {
            alert("查询失败，错误：" + message);
        }
    } catch (err) {
        alert("网络环境故障，请稍后重试，错误：" + err);
        console.log(err);
    }
    try {
        const res = await axios.get("/patient/information",
            {
                headers: {
                    'Authorization': jwtData
                },
                responseType: 'json',
                responseEncoding: 'utf-8'
            }
        );

        const code = res.data["code"];
        const message = res.data["message"];
        if (code === 0) {
            pano.value = res.data.data.pano
        } else {
            alert("查询失败，错误：" + message);
        }
    } catch (err) {
        alert("网络环境故障，请稍后重试，错误：" + err);
        console.log(err);
    }
});

const reserveCurrent = async () => {
    if (selectedDoctor.value) {
        const jwtData = window.localStorage.getItem("jwtData");
        try {
            const res = await axios.post("/registration/register",
                {
                    pano: pano.value,
                    deno: route.query.department,
                    dono: selectedDoctor.value.dono
                },
                {
                    headers: {
                        'Content-Type': "application/x-www-form-urlencoded",
                        'Authorization': jwtData
                    },
                    responseType: 'json',
                    responseEncoding: 'utf-8'
                }
            );

            const code = res.data["code"];
            const message = res.data["message"];
            if (code === 0) {
                const serial = res.data.data
                alert("预约成功！当前就诊号次：" + `${serial} ` + "您可在预约记录中查看号次");
            } else {
                alert("查询失败，错误：" + message);
            }
        } catch (err) {
            alert("网络环境故障，请稍后重试，错误：" + err);
            console.log(err);
        }
    } else {
        alert('请选择需要预约的医生');
    }
};
</script>