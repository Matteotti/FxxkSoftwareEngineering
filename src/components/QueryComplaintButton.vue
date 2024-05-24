<script setup lang="ts">
import label_input from './LabelInput.vue';
import { reactive, ref } from 'vue';
import { md5 } from 'js-md5';
import axios from 'axios';
axios.defaults.baseURL = "/api"
</script>

<template>
    <div>
        <button @click="queryComplaint">投诉查询</button>
    </div>
</template>

<script lang="ts">
export default {
    methods: {
        queryComplaint() {
            this.$router.push('home/queryComplaint')
        }
    }
}
</script>