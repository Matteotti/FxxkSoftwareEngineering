<script setup lang="ts">
import WelcomeItem from '../components/TheWelcome.vue'
import LoginRegisterSelection from '../components/LoginRegisterSelection.vue'
import web_header from '../components/WebHeader.vue'
</script>

<template>
  <main>
    <div>
      <WelcomeItem />
      <web_header />
      <LoginRegisterSelection />
    </div>
  </main>
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
  min-width: 2048px;
  max-width: 2048px;
  width: 2048px;
  position: absolute;
  max-height: 1024px;
}
.web_header {
  background-color: lightskyblue;
  position: fixed;
  min-height: 10%;
  min-width: 100%;
  top: 0%;
  margin: 0;
  padding: 0;
}
.container {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 50px;
  display: flex;
}
button {
  display: inline-block;
  border-radius: 20px;
  background-color: #f4511e;
  border: none;
  color: #ffff;
  text-align: center;
  font-size: 28px;
  font-weight: 400;
  padding: 18px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: auto;
  height: 100px;
  vertical-align: middle;
}
button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
button span::after {
  content: '>';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
button:hover span {
  padding-right: 30px;
}
button:hover span::after {
  opacity: 1;
  right: 0;
}
/* @media (min-width: 2048px) {
    .v-application {
        max-width: 2048px;
        margin-left: calc((100vw - 2048px) / 2);
    }

    .v-navigation-drawer--right {
        right: calc((100vw - 2048px) / 2);
    }
} */
</style>
