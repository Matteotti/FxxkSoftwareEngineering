<template>
    <main>
        <div>
            <h2>预约列表</h2>
            <select v-model="selectedDepartment">
                <option disabled value="">请选择需要预约的科室</option>
                <option v-for="(department, index) in departmentList" :key="index" :value="department">
                    {{ department.deno }} - {{ department.name }} - {{ department.type }}
                </option>
            </select>
            <button @click="reserveCurrent">预约该科室</button>
            <BackToHomeButton />
        </div>
    </main>
</template>

<script setup lang="ts">
import BackToHomeButton from '@/components/BackToHomeButton.vue';
import { onMounted, ref } from 'vue';
import { useRouter } from 'vue-router';
const router = useRouter();
import axios from 'axios';
axios.defaults.baseURL = "/api"

interface Department {
    deno: number;
    type: string;
    name: string;
}

const departmentList = ref<Department[]>([]);
const selectedDepartment = ref(null);

onMounted(async () => {
    const jwtData = window.localStorage.getItem("jwtData");
    try {
        const res = await axios.get("/department/allinfor", {
            headers: {
                'Authorization': jwtData
            },
            responseType: 'json',
            responseEncoding: 'utf-8'
        });

        const code = res.data["code"];
        const message = res.data["message"];
        if (code === 0) {
            departmentList.value = res.data.data.items
        } else {
            alert("查询失败，错误：" + message);
        }
    } catch (err) {
        alert("网络环境故障，请稍后重试，错误：" + err);
        console.log(err);
    }
});

const reserveCurrent = () => {
    if (selectedDepartment.value) {
        router.replace({ name: 'reserveDoctors', query: { department: selectedDepartment.value.deno } });
    } else {
        alert('请选择需要预约的科室');
    }
};
</script>