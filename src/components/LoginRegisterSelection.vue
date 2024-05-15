<script setup lang="ts">
import { useRouter } from 'vue-router'
</script>

<template>
  <div>
    <button @click="jmpLogin">login</button>
    <p></p>
    <button @click="jmpRegister">register</button>
  </div>
</template>

<script lang="ts">
export default {
  methods: {
    jmpLogin() {
      this.$router.push('/login')
    },
    jmpRegister() {
      this.$router.push('/register')
    }
  }
}
</script>
