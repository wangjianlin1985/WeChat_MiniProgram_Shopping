var utils = require("../../../utils/common.js");

Page({
  data: {
    orderExpress: {},//物流信息
  },

  onLoad: function (option) {
    const orderNo = option.orderNo;
    const self = this;
    // 查询订单物流
    utils.sendRequest('expressDetail', {
      "orderNo": orderNo
    }, function (res) {
      self.setData({
        orderExpress: res.data
      });
    });
  }

  
})