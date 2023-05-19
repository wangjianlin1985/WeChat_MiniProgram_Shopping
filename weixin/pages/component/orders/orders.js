var utils = require("../../../utils/common.js");

Page({
  data:{
    address:{},
    hasAddress: false,
    total:0,
    orders:[],
    addrId:null //默认地址的ID
  },

  onLoad: function (option) {
    const orderNostr = option.orderNos;
    const orderNos = orderNostr.split(',');
    const self = this;
    // 查询已提交的订单，以及默认地址
    utils.sendRequest('searchSubmit', {
      "orderNos": orderNos
    }, function (res) {
      self.setData({        
        orders: res.data
      });
      // 计算总价格
      self.getTotalPrice();
    });
  },
  
  // 查询地址，初始查询默认地址，如果选择了其他地址，则根据id查询其他地址
  onShow() {
    const self = this;
    const addrId = self.data.addrId;
    var params = {};
    if (addrId) {
      params['id'] = addrId;
    } else {
      params['defaultAddr'] = '1';
    }
    // 刷新页面，查询默认地址
    utils.sendRequest('reqAddrDetail', params, function (res) {
      var defaultAddress = res.data;
      var hasDefault = false;
      if (defaultAddress) {
        self.setData({
          addrId: defaultAddress.id,
          hasAddress: true
        });
      }
      self.setData({
        address: defaultAddress
      });
    })
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let orders = this.data.orders;
    let total = 0;
    for(let i = 0; i < orders.length; i++) {
      total += orders[i].goodsNum * orders[i].sellPrice;
    }
    this.setData({
      total: total
    })
  },

  toPay() {
    var self = this;
    wx.showModal({
      title: '提示',
      content: '本系统只做演示，支付系统已屏蔽',
      text:'center',
      complete() {
        // 默认已支付
        utils.sendJsonRequest('orderSubmit', {
          "orderInfos": self.data.orders,
          "addrId": self.data.addrId,
          "payResult": "1" // 付款结果：1= 成功 2= 失败
        }, function (res) {
          // 跳转到首页
          wx.switchTab({
            url: 'pages/component/user/user'
          })
        });
      }
    })

    /*wx.requestPayment({
      timeStamp: 'String1',
      nonceStr: 'String2',
      package: 'String3',
      signType: 'MD5',
      paySign: 'String4',
      success: function (res) {
        console.log(res)
      },
      fail: function (res) {
        wx.showModal({
          title: '支付提示',
          content: '<text>',
          showCancel: false
        })
      }
    })*/
  }
})