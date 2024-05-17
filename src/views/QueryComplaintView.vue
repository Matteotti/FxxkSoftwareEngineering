<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import label_input from './LabelInput.vue';
import { onMounted, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
interface complaint {
    cono: number;
    pano: number;
    dono: number;
    text: string;
    state: string;
    result: string;
    time: string;
}
const allComplaints = ref<complaint[]>([]);
const getComplaints = async () => {
    const jwt = window.localStorage.getItem("jwtData");
    const allComplaintsRes = await axios.get("/complaint/findbypano", {
        headers: {
            authorization: jwt,
        },
    });

    if (allComplaintsRes.data.code === 0) {
        var totalNumber = allComplaintsRes.data["data"]["total"];
        allComplaints.value = allComplaintsRes.data.data.items;
    } else {
        console.error(allComplaintsRes.data.message);
    }
};
onMounted(getComplaints);


//
// const complaintResult = ref(null); // 定义一个ref对象用于储存投诉结果
// const queryComplaint = () => {
//     let jwtData = window.localStorage.getItem("jwtData");
//     axios({
//         method: "get",
//         url: "/complaint/findbypano",
//         headers: {
//             'Authorization': `${jwtData}`
//         },
//         responseType: 'json',
//         responseEncoding: 'utf-8'
//     }).then(res => {
//         var code = res.data["code"];
//         var message = res.data["message"];
//         if (code == 0) {
//             var totalNumber = res.data["data"]["total"];
//             var items = res.data["data"]["items"];
//
//             // 把需要的信息储存到complaintResult中
//             complaintResult.value = items.map(item => ({
//                 cono: item.cono,
//                 pano: item.pano,
//                 dono: item.dono,
//                 text: item.text,
//                 state: item.state,
//                 result: item.result,
//                 time: item.time
//             }));
//             alert("Success, total = " + totalNumber);
//         } else {
//             alert("查询失败, 错误:" + message);
//         }
//     }, err => {
//         alert("网络环境故障，请稍后重试" + err);
//         console.log(err);
//     });
//     // return complaintResult;
// }
</script>

<template>
  <main>
    <div>
      <QueryComplaint /> 投诉结果是: <br>
        <div v-for="complaint in allComplaints" :key="complaint.cono">
          <hr />
          <div>投诉编号: {{ complaint.cono }}</div>
          <div>患者编号: {{ complaint.pano }}</div>
          <div>医生编号: {{ complaint.dono }}</div>
          <div>投诉内容: {{ complaint.text }}</div>
          <div>状态: {{ complaint.state }}</div>
          <div>结果: {{ complaint.result }}</div>
          <div>时间: {{ complaint.time }}</div>
        </div>
      <BackToHomeButton />
    </div>
  </main>
</template>

<script></script>
