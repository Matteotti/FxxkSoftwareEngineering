<script setup lang="ts">
import BackToHomeButton from '@/components/BackToHomeButton.vue';
import { onMounted, ref } from 'vue';

import { useRouter } from 'vue-router';
import axios from 'axios';
axios.defaults.baseURL = "/api"

onMounted(async () => {
    let jwtData = window.localStorage.getItem("jwtData");
    // try {
    //     const res = await axios.get("/account/balance", {
    //         headers: {
    //             'Authorization': `${jwtData}`
    //         },
    //         responseType: 'json',
    //         responseEncoding: 'utf-8'
    //     });

    //     var code = res.data["code"];
    //     var message = res.data["message"];
    //     if (code == 0) {
    //         balance.value = res.data["data"];  // 更新余额
    //         alert("查询成功，余额为" + res.data["data"]);
    //     } else {
    //         alert("查询失败，错误：" + message);
    //     }
    // } catch (err) {
    //     alert("网络环境故障，请稍后重试" + err);
    //     console.log(err);
    // }
});
</script>

<template>
    <main>
        <div>
            <br> 已预约记录
            <BackToHomeButton />
        </div>
    </main>
</template>