<template>
  <div>
    <input
      type="text"
      v-model="todoTitle"
      placeholder="请输入任务"
      @keyup.enter="addTodo"
    />
  </div>
  <!-- todo 列表 -->
  <ul>
    <li
      v-for="item in computedDodos"
      :key="item.id"
      :class="{ complete: item.complete, editing: item === editTodo }"
    >
      <!-- 绑定完成状态 -->
      <div class="view">
        <input
          type="checkbox"
          v-model="item.complete"
          @click="item.complete !== item.complete"
        />
        <label @click="todoEdit(item)">{{ item.title }} </label>
        <button @click="removeTodo(item)">X</button>
      </div>
      <!-- 编辑待办 -->
      <div class="edit">
        <input
          type="text"
          v-model="item.title"
          v-todo-focus="item === editTodo"
          @blur="doneEdit(item)"
          @keyup.enter="doneEdit(item)"
          @keyup.esc="cancelEdit(item)"
        />
      </div>
    </li>
  </ul>
  <div class="filter-panel">
    <span
      :class="{ status: completeStatus === 'all' }"
      @click="completeStatus = 'all'"
    >
      全部
    </span>
    <span
      :class="{ status: completeStatus === 'active' }"
      @click="completeStatus = 'active'"
    >
      进行中
    </span>
    <span
      :class="{ status: completeStatus === 'complete' }"
      @click="completeStatus = 'complete'"
    >
      已完成
    </span>
  </div>
</template>

<script>
import { reactive, toRefs, computed, watchEffect } from "vue"

const todoStorage = {
  fetch() {
    return JSON.parse(localStorage.getItem("vue3-todos") || "[]")
  },
  save(todos) {
    localStorage.setItem("vue3-todos", JSON.stringify(todos))
  },
}
const filter = {
  all(todos) {
    return todos
  },
  active(todos) {
    return todos.filter((item) => !item.complete)
  },
  complete(todos) {
    return todos.filter((item) => item.complete)
  },
}
export default {
  setup() {
    const state = reactive({
      todos: todoStorage.fetch(),
      computedDodos: computed(() => filter[state.completeStatus](state.todos)),
      todoTitle: "",
      beforeEditToDoTitle: null,
      editTodo: null,
      completeStatus: "all",
    })
    function addTodo() {
      state.todos.push({
        title: state.todoTitle,
        id: state.todos.length + 1,
        complete: false,
      })
      state.todoTitle = ""
    }
    function removeTodo(todo) {
      state.todos.splice(state.todos.indexOf(todo), 1)
    }
    function todoEdit(todo) {
      state.beforeEditToDoTitle = todo.title
      state.editTodo = todo
    }
    function doneEdit() {
      state.editTodo = null
    }
    function cancelEdit(todo) {
      todo.title = state.beforeEditToDoTitle
      state.editTodo = null
    }
    watchEffect(() => todoStorage.save(state.todos))
    return {
      ...toRefs(state),
      addTodo,
      removeTodo,
      todoEdit,
      doneEdit,
      cancelEdit,
    }
  },
  directives: {
    "todo-focus": (el, { value }) => {
      if (value) {
        el.focus()
      }
    },
  },
}
</script>

<style scoped>
.complete {
  color: red;
  text-decoration: line-through;
}
.edit,
.editing .view {
  display: none;
}
.view,
.editing .edit {
  display: block;
}
.status {
  color: red;
}
.filter-panel {
}
</style>
