<script setup lang="ts">
import UserInfoTable from '../components/UserInfo.vue'
import HospitalInfoButton from '../components/HospitalInfoButton.vue'
import MedicalInsuranceButton from '../components/MedicalInsuranceButton.vue';
import ReserveButton from '@/components/ReserveButton.vue';
import ReserveRecordButton from '@/components/ReserveRecordButton.vue';
</script>

<template>
    <main>
        <div>
            主页面
            <HospitalInfoButton />
            <MedicalInsuranceButton />
            <UserInfoTable />
            <ReserveButton />
            <ReserveRecordButton />
        </div>
    </main>
</template>
