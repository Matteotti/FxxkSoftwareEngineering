<script setup lang="ts">
import UserInfoTable from '../components/UserInfo.vue'
import HospitalInfoButton from '../components/HospitalInfoButton.vue'
import QueryComplaintButton from "../components/QueryComplaintButton.vue";
</script>

<template>
    <main>
        <div>
            主页面
            <HospitalInfoButton />
            <QueryComplaintButton/>
            <UserInfoTable />
        </div>
    </main>
</template>
