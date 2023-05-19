var utils = require("../../../utils/common.js");

Page({
  data:{
    address: [],
    selectId: null
  },

  onLoad(option){
    const addrId = option.id;
    const self = this;
    self.setData({
      selectId: addrId
    });
    
    this.onShow();
  },

  onShow() {
    // 查询地址列表
    const self = this;
    const selectId = self.data.selectId;
    utils.sendRequest('reqAddrList', {}, function (res) {
      // 初始设置默认选中
      var list = res.data;
      for (let i = 0; i < list.length; i++) {
        if (selectId && list[i].id == selectId) {
          list[i].selected = true;
        }
      }
      self.setData({
        address: list
      });
    });
  },
  
  // 选中当前地址
  selectAddr(e) {
    const self = this;
    const addrId = e.currentTarget.dataset.id;
    // 返回上一页面，并传参
    let pages = getCurrentPages();
    let prevPage = pages[pages.length - 2];
    prevPage.setData({
      addrId: addrId,
    })
    wx.navigateBack();
  },  
})