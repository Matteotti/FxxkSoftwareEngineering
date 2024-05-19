<script setup lang="ts">
import { useRouter } from 'vue-router';
const router = useRouter();
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"

const queryMedicalInsurance = () => {
    router.push('/home/medicalInsurance');
}
</script>

<template>
    <div>
        <button @click="queryMedicalInsurance">查询医保余额</button>
    </div>
</template>