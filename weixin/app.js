// 引入登录模块
var login = require('/utils/login.js');

App({
  onLaunch: function () {
    // 小程序开启后调登录接口
    login.login(this);
  },
  globalData: {
    userInfo: null
  }
})