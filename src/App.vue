<template>
  <Todos />
  <Map1Vue />
  <!-- <getCurrentInstance /> -->
  <!-- <Teleports /> -->
  <!-- <ToRefs /> -->
  <!-- <img alt="Vue logo" src="./assets/logo.png" /> -->
  <!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
</template>

<script>
import Todos from "./components/compositionApi/Todos"
import Map1Vue from "./components/Map1.vue"
// import ToRefs from "./components/compositionApi/toRefs"
// import Teleports from "./components/compositionApi/Teleports.vue"
// import getCurrentInstance from "./components/compositionApi/getCurrentInstance"

export default {
  name: "App",
  components: {
    // HelloWorld,
    // ToRefs,
    // Teleports,
    // getCurrentInstance,
    Todos,
    Map1Vue
  },
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
