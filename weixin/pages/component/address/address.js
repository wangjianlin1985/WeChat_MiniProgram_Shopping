var utils = require("../../../utils/common.js");

Page({
  data: {
    address: {},
    hasAddress: false,
    isDefault: false
  },

  onLoad: function(option) {
    const id = option.id;
    const self = this;
    if (id) {
      // 查询地址显示-用于修改
      utils.sendRequest('reqAddrDetail', {
        "id": id
      }, function (res) {
        var isDefault = false;
        if (res.data && res.data.defaultAttr == 1) {
          isDefault = true;
        }
        self.setData({
          address: res.data,
          hasAddress: true,
          isDefault: isDefault
        });
      });
    }
  },

  switchChange(e) {
    const isDefault = e.detail.value;
    const self = this;
    self.setData({
      isDefault: isDefault
    });
  },

  formSubmit(e) {
    const value = e.detail.value;
    const self = this;
    const address = self.data.address;
    const isDefault = self.data.isDefault;
    var defaultAddr = 0;
    if (isDefault) {
      defaultAddr = 1;
    }
    if (value.linkMan && value.linkPhone && value.linkAddr) {
      // 保存地址
      utils.sendRequest('addAddr', {
        "linkMan": value.linkMan,
        "linkPhone": value.linkPhone,
        "linkAddr": value.linkAddr,
        "defaultAddr": defaultAddr
      }, function(res) {
        // 保存成功返回上一页面
        wx.navigateBack();
      });

      // 更新地址
      if (address && address.id) {
        utils.sendRequest('updateAddr', {
          "id": address.id,
          "linkMan": value.linkMan,
          "linkPhone": value.linkPhone,
          "linkAddr": value.linkAddr,
          "defaultAddr": defaultAddr
        }, function (res) {
          // 保存成功返回上一页面
          wx.navigateBack();
        });
      }
    } else {
      wx.showModal({
        title: '操作提示',
        content: '请填写完整资料',
        showCancel: false
      })
    }
  }
})