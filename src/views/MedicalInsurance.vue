<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '@/components/BackToHomeButton.vue';

const route = useRoute();
const insuranceValue = parseFloat(route.query.Insurancevalue as string);
</script>

<template>
    <main>
        <div>
            <br> 医保余额: {{ insuranceValue }}
            <BackToHomeButton />
        </div>
    </main>
</template>