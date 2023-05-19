var utils = require("../../../utils/common.js");

Page({
  data: {
    orderInfo: {},//订单信息
    orderExpress: {},//物流信息
    orderComment1: {},//评论
    orderComment2: {},//售后
    orderImages: [],//评论和售后的图片
  },

  onLoad: function (option) {
    const orderNo = option.orderNo;
    const self = this;
    // 查询订单详情
    utils.sendRequest('reqOrderDetail', {
      "orderNo": orderNo
    }, function (res) {
      const result = res.data;
      self.setData({
        orderInfo: result.orderInfo,
        orderExpress: result.orderExpress,
        orderComment1: result.orderComment1,
        orderComment2: result.orderComment2,
        orderImages: result.orderImages
      });
    });
  }

  
})