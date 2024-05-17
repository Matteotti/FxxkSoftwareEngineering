<script setup lang="ts">
import label_input from './LabelInput.vue';
import { ref } from 'vue';
import axios from 'axios';

axios.defaults.baseURL = "/api"

const doctorId = ref('');
const complaintText = ref('');
// const complaintStatus = ref('');

const makeComplaint = () => {
    let jwtData = window.localStorage.getItem("jwtData");
    axios({
        method: 'post',
        url: '/complaint/submit',
        headers: {
            'Authorization': `${jwtData}`,
            'Content-Type': "application/x-www-form-urlencoded"
        },
        data: {
            dono: doctorId.value,
            text: complaintText.value
        },
        responseType: 'json',
        responseEncoding: 'utf-8'
    })
        .then(res => {
            const code = res.data["code"];
            const message = res.data["message"];

            if (code === 0) {
                // complaintStatus.value = "投诉成功！";
                alert("successfully make complaint");
                // setTimeout(() => {
                //     complaintStatus.value = '';
                //     doctorId.value = '';
                //     complaintText.value = '';
                // }, 2000);
            } else {
                // complaintStatus.value = "投诉失败，错误: " + message;
                alert("Fail to make complaint with error message = " + message);
            }
        })
        .catch(err => {
            alert("网络环境故障，请稍后重试");
            console.log(err);
        });
}
</script>

<template>
    <div class="complaint">
        <h1 class="white" align="center">{{ "提交投诉" }}</h1>
        <label_input v-model="doctorId" msg="医生ID" nameAttr="Doctor ID" />
        <label_input v-model="complaintText" msg="投诉内容" nameAttr="Complaint" />
        <!-- <div class="label">{{ complaintStatus }}</div> -->
        <div id="button_holder">
            <button type="button" @click="makeComplaint" align="center">提交投诉</button>
        </div>
    </div>
</template>