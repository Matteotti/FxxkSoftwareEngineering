<script setup lang="ts">
import label_input from './LabelInput.vue';
import { ref } from 'vue';
import axios from 'axios';

axios.defaults.baseURL = "/api"
</script>

<template>
  <div>
    <button @click="payBill">缴费</button>
  </div>
</template>

<script lang="ts">
export default {
  methods: {
    payBill() {
      this.$router.push('home/payBill')
    }
  }
}
</script>

