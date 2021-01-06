<template>
  <div>{{ state.foo }}</div>
  <div>{{ state.test }}</div>
</template>
<script>
import { getCurrentInstance, onMounted, reactive } from "vue"
export default {
  props: {
    a: {
      type: String,
      default: "aaa",
    },
  },
  data() {
    return {
      foo: "foo",
    }
  },
  setup(props, ctx) {
    console.log(props, ctx)
    // getCurrentInstance().emit('emit')
    // 和 ctx.emit 一样
    ctx.emit("emit", props)
    const state = reactive({
      foo: "foo",
    })
    // getCurrentInstance()可以获取组件实例
    const instance = getCurrentInstance()
    console.log("instance", instance)
    onMounted(() => {
      // 组件实例的上下文才是我们熟悉的this
      state.test = instance.ctx.foo
      console.log(instance.ctx.foo)
      console.log(instance.data.foo)
      console.log(instance.ctx.bar()) // '我是bar方法'
    })
    return { state }
  },
  methods: {
    bar() {
      console.log("我是bar方法")
    },
  },
}
</script>
