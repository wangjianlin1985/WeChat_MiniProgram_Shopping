var utils = require("../../../utils/common.js");

Page({
  data:{
    address: [],
    hasAddress: false,
  },

  onLoad(option){
    this.onShow();
  },

  onShow() {
    var self = this;
    // 查询地址列表
    utils.sendRequest('reqAddrList', {}, function (res) {
      var hasAddress = false;
      var addressList = res.data;
      if (addressList && addressList.length > 0) {
        hasAddress = true;
      }
      self.setData({
        address: addressList,
        hasAddress: hasAddress
      });
    });
  },
  
  // 删除
  delAddress(e) {
    const self = this;
    let address = self.data.address;
    const addrId = e.currentTarget.dataset.id;
    const index = e.currentTarget.dataset.index;
    wx.showModal({
      title: '温馨提示',
      content: '确定要删除该地址吗？',
      success: function (res) {
        res.confirm && utils.sendRequest('deleteAddr', {
          "id": addrId
        }, function (res) {
          // 删除成功移除列表     
          address.splice(index, 1);
          self.setData({
            address: address
          });
          if (!address.length) {
            self.setData({
              hasAddress: false
            });
          }
        });

      }
    });
    
  },

  // 编辑
  updateAddress(e) {
    const self = this;
    const addrId = e.currentTarget.dataset.id;
    wx.navigateTo({
      url: '../address/address?id=' + addrId
    });
  },
})