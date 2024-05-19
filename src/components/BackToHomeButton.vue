<script setup lang="ts">
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
</script>

<template>
    <div>
        <button @click="BackToHome">返回主页</button>
    </div>
</template>

<script lang="ts">
export default {
    methods: {
        BackToHome() {
            this.$router.replace('/home')
        }
    }
}
</script>
