<script setup lang="ts">
import { useRouter } from 'vue-router';
const router = useRouter();
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
const complaintResult = ref(null); // 定义一个ref对象用于储存投诉结果
const queryComplaint = () => {
    let jwtData = window.localStorage.getItem("jwtData");
    axios({
        method: "get",
        url: "/complaint/findbypano",
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

            // 把需要的信息储存到complaintResult中
            complaintResult.value = items.map(item => ({
                cono: item.cono,
                pano: item.pano,
                dono: item.dono,
                text: item.text,
                state: item.state,
                result: item.result,
                time: item.time
            }));
            // alert(res);
            alert("Success, total = " + totalNumber);
            // alert("Success, total = " + totalNumber
            //     + "\n cono = " + items[i].cono
            //     + "\n pano = " + items[i].pano
            //     + "\n dono = " + items[i].dono
            //     + "\n text = " + items[i].text
            //     + "\n state = " + items[i].state
            //     + "\n result = " + items[i].result
            //     + "\n time = " + items[i].time);
            // for(var i = 0; i < totalNumber; i++){
            //     alert("cono = " + items[i].cono);
            //     alert("pano = " + items[i].pano);
            //     alert("dono = " + items[i].dono);
            //     alert("text = " + items[i].text);
            //     alert("state = " + items[i].state);
            //     alert("result = " + items[i].result);
            //     alert("time = " + items[i].time);
            // }
        } else {
            alert("查询失败, 错误:" + message);
        }
    }, err => {
        alert("网络环境故障，请稍后重试" + err);
        console.log(err);
    });
    return complaintResult;
}
</script>

<template>
    <div>
        <button @click="queryComplaint">查询投诉</button>
    </div>
</template>