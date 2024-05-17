<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '../components/BackToHomeButton.vue';
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
const allBillResult = ref(null); // 定义一个ref对象用于储存结果
const queryAllBill = () => {
    let jwtData = window.localStorage.getItem("jwtData");
    axios({
        method: "get",
        url: "/bill/findbypano",
        headers: {
            'Authorization': `${jwtData}`
        },
        responseType: 'json',
        responseEncoding: 'utf-8'
    }).then(res => {
        var code = res.data["code"];
        var message = res.data["message"];
        if (code == 0) {
            var totalNumber = res.data["data"]["total"];
            var items = res.data["data"]["items"];

            // 把需要的信息储存到Result中
            allBillResult.value = items.map(item => ({
                bino: item.bino,
                type: item.type,
                name: item.name,
                num: item.num,
                describe: item.describe,
                cost: item.cost,
                flag: item.flag,
                time: item.time
            }));
            alert("Success, total = " + totalNumber);
        } else {
            alert("查询失败, 错误:" + message);
        }
    }, err => {
        alert("网络环境故障，请稍后重试" + err);
        console.log(err);
    });
    // return complaintResult;
}
</script>

<template>
  <main>
    <div>
      <QueryAllBill /> all bill是nhfjhcjhgcj <br>
      <!-- 在这里面加 -->
      <BackToHomeButton />
    </div>
  </main>
</template>

<script></script>
