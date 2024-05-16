import { ref } from 'vue'
import { defineStore } from 'pinia'

export const LoginStore = defineStore('login_stage', () => {
  const is_login = ref(false)
  function login() {
    is_login.value = true
  }
  function logout() {
    is_login.value = false
  }
  return { is_login, login, logout }
})

export const LoginInfo = defineStore('login_info', () => {
  const userId = ref('')
  const password = ref('')
  return { userId, password }
})
