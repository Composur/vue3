import { createApp } from 'vue'
// import Vconsole from 'vconsole'

import App from './App.vue'

createApp(App).mount('#app')
if (process.env.NODE_ENV === 'development') {
  import('./vconsole')
}