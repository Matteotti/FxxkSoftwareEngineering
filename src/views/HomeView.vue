<script setup lang="ts">
import UserInfoTable from '../components/UserInfo.vue'
import HospitalInfoButton from '../components/HospitalInfoButton.vue'
import QueryComplaintButton from "../components/QueryComplaintButton.vue";
import MakeComplaintButton from "../components/MakeComplaintButton.vue"
import MedicalInsuranceButton from '../components/MedicalInsuranceButton.vue';
import ReserveButton from '@/components/ReserveButton.vue';
import ReserveRecordButton from '@/components/ReserveRecordButton.vue';

import { ref } from 'vue';
import QueryAllBillButton from "@/components/QueryAllBillButton.vue";
import QueryUnpaidBillButton from "@/components/QueryUnpaidBillButton.vue";
import PayBillButton from "@/components/PayBillButton.vue";
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
            <MakeComplaintButton v-if="idRatio === 'patient'"/>
            <QueryComplaintButton v-if="idRatio === 'patient'"/>
            <QueryAllBillButton v-if="idRatio === 'patient'"/>
            <QueryUnpaidBillButton v-if="idRatio === 'patient'"/>
            <PayBillButton v-if="idRatio === 'patient'"/>
        </div>
    </main>
</template>