<script setup lang="ts">
import { reactive, ref } from 'vue';
import {md5} from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
// defineProps({
//     msg: {
//         type: String,
//         required: true
//     },
// })
// // const username_input = ref();
// // const password_input = ref();
// // const recaptcha_input = ref();
// // var recaptcha_src = "";
// var return_msg = "";
// var login_msg_show = reactive({data:{value:false}});
// // var timeout = 0;
// // var id_radio:String="patient";
// // const username_component = ref("");
// // const password_component = ref("");
// // const recaptcha_component = ref("");
// const QueryComplaint = () => {
//     // var isVerified = true;
//     // var _account = username_input.value;
//     // var password = password_input.value;
//     // if (_account == null || _account==='') {
//     //     username_component.value.showLabel(true);
//     //     isVerified=false;
//     // }
//     // else username_component.value.showLabel(false);
//     // if (password == null || password==='') {
//     //     password_component.value.showLabel(true);
//     //     isVerified=false;
//     // }
//     // else password_component.value.showLabel(false);
//     // if (!isVerified) return;
//     axios({
//         method: "get",
//         url: "/complaint/findbypano",
//         headers: {
//             'Content-Type': "application/x-www-form-urlencoded"
//         },
//         data: {
//             // account: _account,
//             // password: md5(password)
//         },
//         responseType: 'json',
//         responseEncoding: 'utf-8'
//     }).then(res => {
//         var code = res.data["code"];
//         return_msg = res.data["message"];
//         var return_data = res.data["data"];
//         var return_data_total = return_data["total"];
//         var return_data_items = return_data["items"];
//         // login_msg_show.data.value = true;
//         // if (timeout) clearTimeout(timeout);
//         // timeout = setTimeout(() => login_msg_show.data.value = false, 1000);
//         console.log(typeof(code));
//         if (code == 0) {
//             window.localStorage.setItem("jwtData", res.data["data"]);
//             setTimeout(()=>window.location.href="/home",1000);
//             // add 
//         }
//         else {
//             // username_component.value.clearText();
//             // password_component.value.clearText();
//         }
//     }, err => {
//         alert("网络环境故障，请稍后重试");
//         console.log(err);
//     })
// }
// </script>

// <script>
export default {
  data() {
    return {
      items: []
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    getData() {
      axios({
        method: "get",
        url: "/complaint/findbypano",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        responseType: "json",
        responseEncoding: "utf-8",
      }).then((res) => {
        const code = res.data["code"];
        if (code === 0) {
          const return_data = res.data["data"];
          this.items = return_data["items"];
        }
      });
    },
  },
};
</script>


<template>
  <div>
    <table>
      <thead>
        <th>主键</th>
        <th>病人主键</th>
        <th>医生主键</th>
        <th>投诉内容</th>
        <th>状态</th>
        <th>结果反馈</th>
        <th>投诉日期</th>
      </thead>
      <tbody>
        <!-- <tr v-for="item in items" :key="item.cono"> -->
          <td>1</td>
          <td>2</td>
          <td>3</td>
          <td>"bad mannar"</td>
          <td>"finished"</td>
          <td>"ok"</td>
          <td>"2024-5-11"</td>
        <!-- </tr> -->
      </tbody>
    </table>
  </div>
</template>
