import { registerMicroApps, start } from 'qiankun';

registerMicroApps([
  {
    name: "VueMicroApp",
    entry: "//localhost:9527",
    container: "#frame1",
    activeRule: location => location.pathname.startsWith('/app1'),
  },
  {
    name: "VueMicro",
    entry: "//localhost:9020",
    container: "#frame1",
    activeRule: location => location.pathname.includes('/app2'),
  },
]);

start();