var utils = require("../../../utils/common.js");

Page({
  data:{
    thumb:'',
    nickname:'',
    orderInfo:{}
  },
  onLoad(){
    var self = this;
    /**
     * 获取用户信息
     */
    wx.getUserInfo({
      success: function(res){
        self.setData({
          thumb: res.userInfo.avatarUrl,
          nickname: res.userInfo.nickName
        })
      }
    })   
  },

  // 每次进入都重新加载
  onShow() {
    const self = this;
    utils.sendRequest('reqOrderTotal', {}, function (res) {
      self.setData({
        orderInfo: res.data
      });
    });
  }
})