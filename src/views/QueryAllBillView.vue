<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import label_input from './LabelInput.vue';
import { onMounted, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
interface BillRecord {
    bino: number;
    type: string;
    name: string;
    num: number;
    describe: string;
    cost: number;
    flag: string;
    time: string;
}
const allBillResult = ref<BillRecord[]>([]);
const getBillRecords = async () => {
    const jwt = window.localStorage.getItem("jwtData");
    var recordTime = true;
    // start timer to record the time consumed
    const timer = new Date().getTime();
    const allBillRes = await axios.get("/bill/findbypano", {
        headers: {
            authorization: jwt,
        },
    });
    if (allBillRes.data.code === 0) {
        allBillResult.value = allBillRes.data.data.items;
    } else {
        console.error(allBillRes.data.message);
    }
    // end timer to record the time consumed: end - start
    if(recordTime)
      console.log("Time consumed: ", new Date().getTime() - timer);
};
onMounted(getBillRecords);
</script>

<template>
  <main>
    <div>
      <QueryAllBill /> 所有缴费记录如下： <br>
      <div v-for="record in allBillResult":key = "record.bino">
        <hr />
        <div>缴费编号: {{ record.bino }}</div>
        <div>缴费类型: {{ record.type }}</div>
        <div>缴费名称: {{ record.name }}</div>
        <div>缴费数量: {{ record.num }}</div>
        <div>缴费描述: {{ record.describe }}</div>
        <div>缴费金额: {{ record.cost }}</div>
        <div>缴费状态: {{ record.flag }}</div>
        <div>缴费时间: {{ record.time }}</div>
      </div>
      <BackToHomeButton />
    </div>
  </main>
</template>

<script></script>
