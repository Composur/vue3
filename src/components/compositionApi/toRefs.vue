<template>
  <div>
    <p>counter: {{counter}}</p>
    <p>doubleCounter: {{doubleCounter}}</p>
    <p ref="desc"></p>
  </div>
</template>

<script>
import {
  reactive,
  computed,
  watch,
  ref,
  toRefs,
  onMounted,
  onUnmounted,
} from "vue";

export default {
  setup() {
    const data = reactive({
      counter: 1,
      doubleCounter: computed(() => data.counter * 2),
    });

    let timer

    onMounted(() => {
      timer = setInterval(() => {
        data.counter++
      }, 1000);
    })

    onUnmounted(() => {
      clearInterval(timer)
    })

    const desc = ref(null)

    watch(()=>data.counter, (val,oldVal)=>{
      // console.log(`counter change from ${oldVal} to ${val}`);
      desc.value.textContent = `counter change from ${oldVal} to ${val}`
    })
    
    return {...toRefs(data), desc};
  },
};
</script>
