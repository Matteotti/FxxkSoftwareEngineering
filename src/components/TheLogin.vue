<script setup lang="ts">
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import {md5} from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
defineProps({
    msg: {
        type: String,
        required: true
    },
})
const username_input = ref();
const password_input = ref();
const recaptcha_input = ref();
var recaptcha_src = "";
var login_msg = "";
var login_msg_show = reactive({data:{value:false}});
var timeout = 0;
var id_radio:String="patient";
const username_component = ref("");
const password_component = ref("");
const recaptcha_component = ref("");
const login = () => {
    var isVerified = true;
    var _account = username_input.value;
    var password = password_input.value;
    if (_account == null || _account==='') {
        username_component.value.showLabel(true);
        isVerified=false;
    }
    else username_component.value.showLabel(false);
    if (password == null || password==='') {
        password_component.value.showLabel(true);
        isVerified=false;
    }
    else password_component.value.showLabel(false);
    if (!isVerified) return;
    axios({
        method: "post",
        url: "/"+id_radio+"/login",
        headers: {
            'Content-Type': "application/x-www-form-urlencoded"
        },
        data: {
            account: _account,
            password: md5(password)
        },
        responseType: 'json',
        responseEncoding: 'utf-8'
    }).then(res => {
        var code = res.data["code"]
        login_msg = res.data["message"];
        login_msg_show.data.value = true;
        if (timeout) clearTimeout(timeout);
        timeout = setTimeout(() => login_msg_show.data.value = false, 1000);
        console.log(typeof(code));
        if (code == 0) {
            window.localStorage.setItem("jwtData", res.data["data"]);
            setTimeout(()=>window.location.href="/home",1000);
        }
        else {
            username_component.value.clearText();
            password_component.value.clearText();
        }
    }, err => {
        alert("网络环境故障，请稍后重试");
        console.log(err);
    })
}
</script>

<template>
    <div class="login">
        <h1 class="white" align="center">{{ msg }}</h1>
        <label_input ref="username_component" v-model="username_input" msg="用户名" nameAttr="username"
            _autocomplete="username" />
        <label_input ref="password_component" v-model="password_input" msg="密码" nameAttr="password"
            _autocomplete="current-password" type="password" />
        <div class="recaptcha">
            <label_input ref="recaptcha_component" msg="验证码" nameAttr="recaptcha" v-model="recaptcha_input">
            </label_input><img :src="recaptcha_src"></img>
        </div>
        <div style="display: flex;margin:0 auto">
            <label>
                <input type="radio" name="id_radio" v-model="id_radio" value="patient" checked/>
                病人
            </label>
            <label>
                <input type="radio" name="id_radio" v-model="id_radio" value="docter"/>
                医生
            </label>
            <label>
                <input type="radio" name="id_radio" v-model="id_radio" value="admin"/>
                管理员
            </label>
        </div>
        <div class="label" v-show="login_msg_show.data.value">{{ login_msg }}</div>
        <div id="button_holder">
            <button type="button" @click="login()" align="center">登录</button>
        </div>
    </div>
</template>

