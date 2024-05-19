<script setup lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';
axios.defaults.baseURL = "/api";

interface Reserve {
    reno: number;
    pano: number;
    deno: number;
    dono: number;
    time: string;
    serial: string;
    state: string;
}

const allRecords = ref<Reserve[]>([]);
const lastRecord = ref<Reserve | null>(null);

const getRecords = async () => {
    const jwt = window.localStorage.getItem("jwtData");
    const allRecordsRes = await axios.get("/registration/findbypano", {
        headers: {
            authorization: jwt,
        },
    });

    if (allRecordsRes.data.code === 0) {
        allRecords.value = allRecordsRes.data.data.items;
    } else {
        console.error(allRecordsRes.data.message);
    }

    const lastRecordRes = await axios.get("/registration/findtodaybypano", {
        headers: {
            authorization: jwt,
        },
    });

    if (lastRecordRes.data.code === 0) {
        lastRecord.value = lastRecordRes.data.data;
    } else {
        console.error(lastRecordRes.data.message);
    }
};

onMounted(getRecords);
</script>

<template>
    <main>
        <div>
            <h2>最新挂号记录</h2>
            <div v-if="lastRecord">
                <div>科室: {{ lastRecord.deno }}</div>
                <div>医生: {{ lastRecord.dono }}</div>
                <div>时间: {{ lastRecord.time }}</div>
                <div>号次: {{ lastRecord.serial }}</div>
                <div>状态: {{ lastRecord.state }}</div>
            </div>
            <h2>所有挂号记录</h2>
            <div v-for="record in allRecords" :key="record.reno">
                <hr />
                <div>科室: {{ record.deno }}</div>
                <div>医生: {{ record.dono }}</div>
                <div>时间: {{ record.time }}</div>
                <div>号次: {{ record.serial }}</div>
                <div>状态: {{ record.state }}</div>
            </div>
        </div>
    </main>
</template>