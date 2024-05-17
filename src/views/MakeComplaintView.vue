<script setup lang="ts">
import { useRoute } from 'vue-router';
import BackToHomeButton from '../components/BackToHomeButton.vue';
// import QueryComplaint from '../components/QueryComplaintButton.vue'
// const route = useRoute();
// const complaintResult = QueryComplaint.queryComplaint();

</script>

<template>
  <main>
    <div>
      <!-- <QueryComplaint />  -->
      投诉完成 
      <!-- {{ complaintResult.value }} -->
      <!-- // 在这里显示投诉结果 -->
        <!-- <div v-if="complaintResult.value">
            <div v-for="(item, index) in complaintResult.value" :key="index">
                <p>{{ `cono: ${item.cono}` }}</p>
                <p>{{ `pano: ${item.pano}` }}</p>
                <p>{{ `dono: ${item.dono}` }}</p>
                <p>{{ `text: ${item.text}` }}</p>
                <p>{{ `state: ${item.state}` }}</p>
                <p>{{ `result: ${item.result}` }}</p>
                <p>{{ `time: ${item.time}` }}</p>
            </div>
        </div> -->
      <br>
      <BackToHomeButton />
    </div>
  </main>
</template>

<script></script>
