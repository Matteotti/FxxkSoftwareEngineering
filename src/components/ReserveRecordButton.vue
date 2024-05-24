<script setup lang="ts">
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
</script>

<template>
    <div>
        <button @click="ReserveRecord">预约记录</button>
    </div>
</template>

<script lang="ts">
export default {
    methods: {
        ReserveRecord() {
            this.$router.push('home/reserveRecords')
        }
    }
}
</script>
