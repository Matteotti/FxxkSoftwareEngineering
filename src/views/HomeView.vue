<script setup lang="ts">
import UserInfoTable from '../components/UserInfo.vue'
import HospitalInfoButton from '../components/HospitalInfoButton.vue'
import MedicalInsuranceButton from '../components/MedicalInsuranceButton.vue';
import ReserveButton from '@/components/ReserveButton.vue';
import ReserveRecordButton from '@/components/ReserveRecordButton.vue';

import { ref } from 'vue';

const idRatio = ref(window.localStorage.getItem("idRatio"));

</script>

<template>
    <main>
        <div>
            {{ idRatio }}主页面

            <HospitalInfoButton v-if="idRatio === 'patient'" />
            <MedicalInsuranceButton v-if="idRatio === 'patient'" />
            <UserInfoTable v-if="idRatio === 'patient'" />
            <ReserveButton v-if="idRatio === 'patient'" />
            <ReserveRecordButton v-if="idRatio === 'patient'" />
        </div>
    </main>
</template>