<template>
  <Todos />
  <!-- <getCurrentInstance /> -->
  <!-- <Teleports /> -->
  <!-- <ToRefs /> -->
  <!-- <img alt="Vue logo" src="./assets/logo.png" /> -->
  <!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
</template>

<script>
import Todos from "./components/compositionApi/Todos"
// import HelloWorld from "./components/HelloWorld.vue"
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
