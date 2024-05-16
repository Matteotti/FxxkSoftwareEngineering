<template>
  <div>
    <h1>我的投诉记录</h1>
    <table>
      <thead>
        <tr>
          <th>主键</th>
          <th>病人主键</th>
          <th>医生主键</th>
          <th>投诉内容</th>
          <th>状态</th>
          <th>结果反馈</th>
          <th>投诉日期</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="record in records" :key="record.cono">
          <td>{{ record.cono }}</td>
          <td>{{ record.pano }}</td>
          <td>{{ record.dono }}</td>
          <td>{{ record.text }}</td>
          <td>{{ record.state }}</td>
          <td>{{ record.result }}</td>
          <td>{{ record.time }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from "axios";

const jwtToken = "your_jwt_token_here";

export default {
  data() {
    return {
      records: [],
    };
  },
  methods: {
    getComplaintRecords() {
      axios
        .get("/complaint/findbypano", {
          headers: {
            
          },
        })
        .then((response) => {
          if (response.data.code === 0) {
            this.records = response.data.data.items;
          } else {
            this.handleError(response.data.message);
          }
        })
        .catch((error) => {
          this.handleError(error.toString());
        });
    },
    handleError(message) {
      console.error(message);
      alert(message);
    },
  },
  mounted() {
    this.getComplaintRecords();
  },
};
</script>

<style>
table {
  width: 100%;
  border: 1px solid #000;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #000;
  padding: 8px;
}

tbody tr:nth-child(odd) {
  background-color: #f2f2f2;
}
</style>