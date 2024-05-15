<script lang="ts" setup>
import label_input from './LabelInput.vue'
import { reactive, ref } from 'vue'
import md5 from 'js-md5'
import axios from 'axios'
axios.defaults.baseURL = '/api'
// Vue.prototype.$axios = axios
defineProps({
  msg: {
    type: String,
    required: true
  }
})
const username_input = ref()
const password = ref()
var reg_msg: String = ''
const reg_msg_show = reactive({ data: { value: false } })
var timeout = null
var duplicate_password = ref()
var email_input: string
var name_input: string
const username_component = ref()
const password_component = ref()
const dup_pwd_component = ref()
const name_component = ref()
const email_component = ref()
const username_regex = /^[A-Za-z0-9]*$/
const email_regex = /^[^\s@]*@[^.\s].[^\s]*$/
const register = () => {
  var _account: string = username_input.value
  var _password: string = password.value
  var _duplicate_password = duplicate_password.value
  var isVerified: boolean = true
  if (_account == null) {
    username_component.value.showLabel(true, '请输入账户')
    isVerified = false
  } else if (!username_regex.test(_account)) {
    username_component.value.showLabel(true, '用户名必须由纯英文字符和数字构成')
    isVerified = false
  }
  if (password.value == null) {
    password_component.value.showLabel(true)
    isVerified = false
  }
  if (duplicate_password.value == null) {
    duplicate_password.value.showLabel(true, '请重复密码')
    isVerified = false
  }
  if (name_input == null) {
    name_component.value.showLabel(true)
    isVerified = false
  }
  if (email_input == null) {
    email_component.value.showLabel(true, '请输入邮箱')
    isVerified = false
  } else if (!email_regex.test(email_input)) {
    email_component.value.showLabel(true, '请输入正确的邮箱')
    isVerified = false
  }
  if (_duplicate_password != _password) {
    duplicate_password.value.showLabel(true, '两次密码不一致')
    isVerified = false
  }

  if (!isVerified) return
  axios({
    method: 'post',
    url: '/patient/register',
    data: {
      account: _account,
      password: md5(_password),
      name: name_input,
      email: email_input
    },
    responseType: 'json',
    responseEncoding: 'utf-8'
  }).then(
    (res) => {
      var code = res.data['code']
      reg_msg = res.data['message']
      reg_msg_show.data.value = true
      if (timeout) clearTimeout(timeout)
      timeout = setTimeout(() => (reg_msg_show.data.value = false), 1000)
      if (code == 0) {
        setTimeout(() => (window.location.href = '/login'), 1000)
      }
    },
    (err) => {
      alert('网络环境故障，请稍后重试')
      console.log(err)
    }
  )
}
</script>

<template>
  <div class="register">
    <h1 class="white" align="center">{{ msg }}</h1>
    <label_input
      ref="username_component"
      v-model="username_input"
      msg="用户名"
      nameAttr="username"
      _autocomplete="username"
    />
    <label_input
      ref="password_component"
      msg="密码"
      nameAttr="password"
      v-model="password"
      _autocomplete="new-password"
      type="password"
    />
    <label_input
      ref="dup_pwd_component"
      msg="重复密码"
      nameAttr="duplicate_password"
      v-model="duplicate_password"
      _autocomplete="new-password"
      type="password"
    />
    <label_input
      ref="name_component"
      v-model="name_input"
      msg="姓名"
      nameAttr="name_input"
      _autocomplete="name"
    />
    <label_input
      ref="email_component"
      v-model="email_input"
      msg="电子邮件"
      nameAttr="email_input"
      _autocomplete="email"
    />
    <div class="label" v-show="reg_msg_show.data.value">{{ reg_msg }}</div>
    <div id="button_holder">
      <button type="button" @click="register()">{{ msg }}</button>
    </div>
  </div>
</template>
<style scoped>
h1 {
  font-weight: 500;
  font-size: 1.6rem;
  position: relative;
  font-family: YaHei;
  top: -10px;
}

.label_input.label {
  text-align: left;
  font-size: 1.2rem;
}

.label_input {
  display: flex;
}

.recaptcha {
  display: none;
}
#button_holder {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
}
button {
  background-color: darkturquoise;
  text-align: center;
  padding: 10px;
  min-width: 100px;
  margin-top: 40px;
  border-radius: 10px;
  grid-column: 3;
}

button:hover {
  background-color: lightblue;
  text-align: center;
  padding: 10px;
  min-width: 100px;
  margin-top: 40px;
  border-radius: 10px;
}

.register {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
  padding: 20% 0;
  width: 100%;
}
</style>
