<script setup lang="ts">
import { useRouter } from 'vue-router';
// const router = useRouter();
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"

const queryMedicalInsurance = () => {
    let jwtData = window.localStorage.getItem("jwtData");
    axios({
        method: "get",
        url: "/account/balance",
        headers: {
            'Authorization': `${jwtData}`
        },
        responseType: 'json',
        responseEncoding: 'utf-8'
    }).then(res => {
        var code = res.data["code"];
        var message = res.data["message"];
        if (code == 0) {
            alert("查询成功，余额为" + res.data["data"]);
        } else {
            alert("查询失败，错误：" + message);
        }
    }, err => {
        alert("网络环境故障，请稍后重试" + err);
        console.log(err);
    });
    // router.push({
    //     name: 'MedicalInsurance',
    //     query: {
    //         Insurancevalue: '100.01',
    //     }
    // });
}
</script>

<template>
    <div>
        <button @click="queryMedicalInsurance">查询医保余额</button>
    </div>
</template>