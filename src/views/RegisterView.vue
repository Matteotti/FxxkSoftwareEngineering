<script setup lang="ts">
import Register from '../components/TheRegister.vue'
</script>

<template>
  <body style="background-color: lightskyblue; width: 100%; position: absolute">
    <web_header />
    <div class="container">
      <img src="../resources/docter.jpg" />
      <div class="register-wrapper">
        <Register msg="注册" />
      </div>
    </div>
  </body>
</template>

<style>
html {
  height: 100%;
  width: 2048px;
  max-width: 2048px;
  display: flex;
  flex-direction: column;
  margin: 0;
  padding: 0;
}

body {
  min-width: 100%;
  max-width: 2048px;
  width: 2048px;
  background-color: lightskyblue;
  position: absolute;
  max-height: 1024px;
}
.web_header {
  position: fixed;
  min-height: 10%;
  min-width: 100%;
  top: 0%;
  margin: 0;
  padding: 0;
}

.container img {
  /* display: inline; */
  position: fixed;
  width: 70%;
  height: 100%;
  left: 30%;
  object-fit: cover;
  box-shadow:
    -20px 20px 24px inset rgba(255, 255, 255, 0.6),
    20px -20px 24px inset rgba(0, 0, 0, 0.2);
}

.container {
  /* width: 2048px; */
  width: 2048px;
  height: 90%;
  position: fixed;
  top: 50px;
}

.register-wrapper {
  background-image: linear-gradient(lightblue, white);
  width: 30%;
  height: 100%;
  padding: 0 50px;
  position: fixed;
  left: 0px;
  /* top: 50%;
    transform: translate(0, -50%); */
}
head {
  line-height: 1.5;
}
</style>
