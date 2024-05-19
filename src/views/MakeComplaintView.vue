<script setup lang="ts">
import { useRoute } from 'vue-router';
import { reactive,ref } from 'vue';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import axios from 'axios';
import label_input from '../components/LabelInput.vue';


const doctorId = ref('');
const complaintText = ref('');
// const complaintStatus = ref('');

const makeComplaint = () => {
  let jwtData = window.localStorage.getItem("jwtData");
  // if complaint text is null, show error msg
  if (complaintText.value === '') {
    alert("投诉内容不能为空");
    return;
  }
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
      alert("successfully make complaint");
    } else {
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
  <!--    <MakeComplaintView /> 投诉填写内容：-->
    <h1 class="white" align="center">{{ "提交投诉" }}</h1>
    <label_input v-model="doctorId" msg="医生ID" nameAttr="Doctor ID" />
    <label_input v-model="complaintText" msg="投诉内容" nameAttr="Complaint" />
    <!-- <div class="label">{{ complaintStatus }}</div> -->
    <div id="button_holder">
      <button type="button" @click="makeComplaint" align="center">提交投诉</button>
    </div>
  </div>
  <BackToHomeButton />
</template>
<!--<template>-->
<!--  <div class="complaint" style="display: flex; flex-direction: column; align-items: center;">-->
<!--    <h1 class="white" align="center">{{ "提交投诉" }}</h1>-->
<!--    <label_input v-model="doctorId" msg="医生ID" nameAttr="Doctor ID" />-->
<!--    <label_input v-model="complaintText" msg="投诉内容" nameAttr="Complaint" />-->
<!--    <div id="button_holder">-->
<!--      <button type="button" @click="makeComplaint" align="center">提交投诉</button>-->
<!--    </div>-->
<!--    <BackToHomeButton />-->
<!--  </div>-->
<!--</template>-->