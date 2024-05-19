<script setup lang="ts">
import { useRoute } from 'vue-router';
import { reactive,ref } from 'vue';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import axios from 'axios';
import label_input from '../components/LabelInput.vue';
const billId = ref('');
const payBill = async () => {
  let jwtData = window.localStorage.getItem("jwtData");
  // first check if the bill has been paid or not
  // flag == '是' means the bill has been paid
  // use "/bill/findbypano" to get the bill information
  try {
    const res = await axios.get('/bill/findbypano', {
      headers: {
        'Authorization': `${jwtData}`,
        'Content-Type': "application/x-www-form-urlencoded"
      }
    });
    const code = res.data["code"];
    const message = res.data["message"];
    var billBelongToSelf = false;
    if (code === 0) {
      const items = res.data["data"]["items"];
      for (let i = 0; i < items.length; i++) {
        if (items[i]["bino"] === Number(billId.value)) {
          billBelongToSelf = true;
          if (items[i]["flag"] === "是") {
            alert("The bill has been paid");
            return;
          }
        }
      }
    } else {
      alert("Fail to get bill information with error message = " + message);
    }
    if (!billBelongToSelf) {
      alert("The bill does not belong to you");
      return;
    }
    const payRes = await axios({
      method: 'post',
      url: '/bill/payment',
      headers: {
        'Authorization': `${jwtData}`,
        'Content-Type': "application/x-www-form-urlencoded"
      },
      data: {
        bino: billId.value,
      },
      responseType: 'json',
      responseEncoding: 'utf-8'
    });
    const payCode = payRes.data["code"];
    const payMessage = payRes.data["message"];
    if (payCode === 0) {
      alert("successfully make payment");
    } else {
      alert("Fail to make payment with error message = " + payMessage);
    }
  } catch (err) {
    alert("网络环境故障，请稍后重试");
    console.log(err);
  }
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