<script setup lang="ts">
import Login from '../components/TheLogin.vue'
</script>

<template>
  <main>
    <div>
      <Login />
    </div>
  </main>
</template>

<script></script>

<style>
h1 {
  font-weight: 500;
  font-size: 1.6rem;
  position: relative;
  font-family: YaHei;
  top: -10px;
}

.label_input.label {
  text-align: left;
  font-size: 1.2rem;
}

.label_input {
  display: flex;
}

.recaptcha {
  display: none;
}
#button_holder {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
}
button {
  background-color: darkturquoise;
  text-align: center;
  padding: 10px;
  min-width: 100px;
  margin-top: 40px;
  border-radius: 10px;
  grid-column: 3;
}

button:hover {
  background-color: lightblue;
  text-align: center;
  padding: 10px;
  min-width: 100px;
  margin-top: 40px;
  border-radius: 10px;
}

.login {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100%;
  padding: 20% 0;
  width: 100%;
}
</style>

<style>
.login-container {
  max-width: 300px;
  margin: auto;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

input[type='text'],
input[type='password'] {
  width: 100%;
  padding: 8px;
  margin-top: 5px;
  margin-bottom: 10px;
  box-sizing: border-box;
}

button {
  width: 100%;
  padding: 10px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}

span {
  color: red;
  font-size: 0.8rem;
}
</style>
