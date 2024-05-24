<script setup lang="ts">
import label_input from './LabelInput.vue';
import { ref } from 'vue';
import axios from 'axios';

axios.defaults.baseURL = "/api"
</script>

<template>
  <div>
    <button @click="makeComplaint">提交投诉</button>
  </div>
</template>

<script lang="ts">
export default {
  methods: {
    makeComplaint() {
      this.$router.push('home/makeComplaint')
    }
  }
}
</script>

