<script setup lang="ts">
import BackToHomeButton from '@/components/BackToHomeButton.vue';
import { onMounted, ref } from 'vue';

import { useRouter } from 'vue-router';
import axios from 'axios';
axios.defaults.baseURL = "/api"

interface Reserve {
    department: string;
    doctor: string;
    time: string;
    serial: number;
    state: string;
}

const serial = ref(0);

onMounted(async () => {
    let jwtData = window.localStorage.getItem("jwtData");
    try {
        const res = await axios.get("/treatmentqueue/currentSerialpatient", {
            headers: {
                'Authorization': `${jwtData}`
            },
            responseType: 'json',
            responseEncoding: 'utf-8'
        });

        var code = res.data["code"];
        var message = res.data["message"];
        if (code == 0) {
            serial.value = res.data.data || 1;
        } else {
            alert("查询失败，错误：" + message);
        }
    } catch (err) {
        alert("网络环境故障，请稍后重试" + err);
        console.log(err);
    }
});
</script>

<template>
    <main>
        <div>
            <br /> 当前号次：{{ serial }}
            <br /> 最近一次预约
            <br /> 已预约记录
            <BackToHomeButton />
        </div>
    </main>
</template>