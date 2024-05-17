<script setup lang="ts">
import { useRoute } from 'vue-router';
import { reactive,ref } from 'vue';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import axios from 'axios';
import label_input from '../components/LabelInput.vue';
const billId = ref('');
const payBill = () => {
  let jwtData = window.localStorage.getItem("jwtData");
  axios({
    method: 'post',
    url: '/bill/payment',
    headers: {
      'Authorization': `${jwtData}`,
      'Content-Type': "application/x-www-form-urlencoded"
    },
    data: {
      bino: billId.value,
      // text: complaintText.value
    },
    responseType: 'json',
    responseEncoding: 'utf-8'
  }).then(res => {
      const code = res.data["code"];
      const message = res.data["message"];

      if (code === 0) {
        alert("successfully make payment");
      } else {
        alert("Fail to make payment with error message = " + message);
      }
    })
    .catch(err => {
      alert("网络环境故障，请稍后重试");
      console.log(err);
    });
}
</script>


<template>
  <div class="payment">
    <!--    <MakeComplaintView /> 投诉填写内容：-->
    <h1 class="white" align="center">{{ "缴费" }}</h1>
    <label_input v-model="billId" msg="缴费单号" nameAttr="Doctor ID" />
<!--    <label_input v-model="complaintText" msg="投诉内容" nameAttr="Complaint" />-->
    <!-- <div class="label">{{ complaintStatus }}</div> -->
    <div id="button_holder">
      <button type="button" @click="payBill" align="center">确认缴费</button>
    </div>
  </div>
  <BackToHomeButton />
</template>