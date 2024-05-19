<script setup lang="ts">
import BackToHomeButton from '@/components/BackToHomeButton.vue';
import { onMounted, ref } from 'vue';

import { useRouter } from 'vue-router';
import axios from 'axios';
axios.defaults.baseURL = "/api"

const balance = ref(0);  // 初始化余额为 0 

onMounted(async () => {
    let jwtData = window.localStorage.getItem("jwtData");
    try {
        const res = await axios.get("/account/balance", {
            headers: {
                'Authorization': `${jwtData}`
            },
            responseType: 'json',
            responseEncoding: 'utf-8'
        });

        var code = res.data["code"];
        var message = res.data["message"];
        if (code == 0) {
            balance.value = res.data["data"];
        } else {
            alert("查询失败，错误：" + message);
        }
    } catch (err) {
        alert("网络环境故障，请稍后重试，错误:" + err);
        console.log(err);
    }
});
</script>

<template>
    <main>
        <div>
            <br> 医保余额: {{ balance }}
            <BackToHomeButton />
        </div>
    </main>
</template>