<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import label_input from './LabelInput.vue';
import { onMounted, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
interface unpaidBillRecord {
    bino: number;
    type: string;
    name: string;
    num: number;
    describe: string;
    cost: number;
    flag: string;
    time: string;
}
const allUnpaidBillResult = ref<unpaidBillRecord[]>([]);
const getUnpaidBillRecords = async () => {
    const jwt = window.localStorage.getItem("jwtData");
    const allUnpaidBillRes = await axios.get("/bill/needtopay", {
        headers: {
            authorization: jwt,
        },
    });
    if (allUnpaidBillRes.data.code === 0) {
        allUnpaidBillResult.value = allUnpaidBillRes.data.data.items;
    } else {
        console.error(allUnpaidBillRes.data.message);
    }
};
</script>

<template>
  <main>
    <div>
      <QueryUnpaidBill /> 待缴费的账单： <br>
        <div v-for="record in allUnpaidBillResult" :key="record.bino">
          <hr />
          <div>账单编号: {{ record.bino }}</div>
          <div>类型: {{ record.type }}</div>
          <div>名称: {{ record.name }}</div>
          <div>数量: {{ record.num }}</div>
          <div>描述: {{ record.describe }}</div>
          <div>费用: {{ record.cost }}</div>
          <div>状态: {{ record.flag }}</div>
          <div>时间: {{ record.time }}</div>
        </div>
      <BackToHomeButton />
    </div>
  </main>
</template>

<script></script>
