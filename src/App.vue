<template>
  <Todos />
  <!-- <getCurrentInstance /> -->
  <!-- <Teleports /> -->
  <!-- <ToRefs /> -->
  <!-- <img alt="Vue logo" src="./assets/logo.png" /> -->
  <!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
  <!-- <div id="frame"></div> -->
  <div @click="createPicture">
    <div>截图</div>
  </div>
</template>

<script>
import Todos from "./components/compositionApi/Todos"
// import ToRefs from "./components/compositionApi/toRefs"
// import Teleports from "./components/compositionApi/Teleports.vue"
// import getCurrentInstance from "./components/compositionApi/getCurrentInstance"
import html2canvas from 'html2canvas';

export default {
  name: "App",
  components: {
    // HelloWorld,
    // ToRefs,
    // Teleports,
    // getCurrentInstance,
    Todos,
  },
  mounted() {

  },
  methods: {
    getImg() {
      html2canvas(document.body).then(function (canvas) {
        document.body.appendChild(canvas);
      });
    },
    createPicture() {
      html2canvas(document.getElementById('app'), {
        backgroundColor: '#FFF',
        sacle: 4,
        useCORS: true,
        width: window.screen.width,
        height: window.screen.height,
      }).then(canvas => {
        var imgData = canvas.toDataURL("image/jpeg");
        this.fileDownload(imgData);
      });
    },
    //下载图片
    fileDownload(downloadUrl) {
      let aLink = document.createElement("a");
      aLink.style.display = "none";
      aLink.href = downloadUrl;
      aLink.download = "test.png";
      // 触发点击-然后移除
      document.body.appendChild(aLink);
      aLink.click();
      document.body.removeChild(aLink);
    }
  }
}
</script>

<style>
#frame {
  width: 100%;
  height: 100%;
}
</style>
