var utils = require("../../../utils/common.js");
var app = getApp();
Page({
  data: {
    winWidth: 0,
    winHeight: 0,
    pingjia: false,
    subpingjia: false,
    focus: false,
    inputValue: '',
    // tab切换
    currentTab: 0,
    orderList2: [],
    orderList3: [],
    orderList4: [],
    orderList5: [],
    orderList6: [],
    orderList7: []
  },

  onLoad: function(options) {
    this.initSystemInfo(); //宽高
    const currentTab = parseInt(options.currentTab);
    if (currentTab) {
      this.setData({
        currentTab: parseInt(options.currentTab),//数据
      });
    }
    this.loadOrderList();
  },

  //页面加载的时候加载数据
  loadOrderList: function() {
    const self = this;
    const currentTab = self.data.currentTab;
    var orderStatus = '';
    if (currentTab == 0) {
      orderStatus = '2';
    } else if (currentTab == 1) {
      orderStatus = '3';
    } else if (currentTab == 2) {
      orderStatus = '4';
    } else if (currentTab == 3) {
      orderStatus = '5';
    } else if (currentTab == 4) {
      orderStatus = '6';
    } else if (currentTab == 5) {
      orderStatus = '7';
    }
    utils.sendRequest('reqOrderList', {
      "orderStatus": orderStatus
    }, function(res) {
      //没有数据就进行加载
      var orderList = res.data;
      if (orderList && orderList.length > 0) {
        for (let i = 0; i < orderList.length; i++) {
          orderList[i].pingjia = true;
          orderList[i].subpingjia = true;
          orderList[i].content = '';
        }
        switch (orderStatus) {
          case '2':
            self.setData({
              orderList2: orderList
            });
            break;
          case '3':
            self.setData({
              orderList3: orderList
            });
            break;
          case '4':
            self.setData({
              orderList4: orderList
            });
            break;
          case '5':
            self.setData({
              orderList5: orderList
            });
            break;
          case '6':
            self.setData({
              orderList6: orderList
            });
            break;
          case '7':
            self.setData({
              orderList7: orderList
            });
            break;
        }
      }
    });
  },

  // 确认收货
  true_shouhuo: function(e) {
    const self = this;
    var id = e.currentTarget.dataset.id;
    wx.showModal({
      title: '提示',
      content: '请确认您已收到货物。',
      success: function (res) {
        res.confirm && utils.sendRequest('updateOrder', {
          "id": id,
          "orderStatus": "6"
        }, function (res) {
          // 重新加载数据
          self.loadOrderList();
        })

      }
    });

  },

  // 撤销售后申请
  rollbackOrder: function(e) {
    const self = this;
    var id = e.currentTarget.dataset.id;
    wx.showModal({
      title: '提示',
      content: '确认撤销该订单的售后申请？',
      success: function (res) {
        res.confirm && utils.sendRequest('updateOrder', {
          "id": id,
          "orderStatus": "6"
        }, function (res) {
          // 重新加载数据
          self.loadOrderList();
        })

      }
    });

  },

  //取消订单
  removeOrder: function(e) {
    const self = this;
    var id = e.currentTarget.dataset.id;
    wx.showModal({
      title: '提示',
      content: '确定要取消该订单吗？',
      success: function(res) {
        res.confirm && utils.sendRequest('updateOrder', {
          "id": id,
          "orderStatus": "5"
        }, function(res) {
          // 重新加载数据
          self.loadOrderList();
        })

      }
    });
  },

  //删除订单
  deleteOrder: function(e) {
    const self = this;
    var id = e.currentTarget.dataset.id;
    wx.showModal({
      title: '提示',
      content: '确定要删除该订单吗？',
      success: function(res) {
        res.confirm && utils.sendRequest('deleteOrder', {
          "id": id
        }, function(res) {
          // 重新加载数据
          self.loadOrderList();
        })

      }
    });
  },

  //滑动事件，渲染
  slide: function(e) {
    const self = this;
    const current = e.detail.current;
    self.setData({
      currentTab: current
    });
    //没有数据就进行加载
    self.loadOrderList();
  },

  //点击事件，渲染
  tab_click: function(e) {
    const self = this;
    var current = e.currentTarget.dataset.current;
    if (self.data.currentTab === current) {
      return false;
    } else {
      self.setData({
        currentTab: current
      });      
      //没有数据的导航就进行加载
      self.loadOrderList();
    };
  },

  //获取窗口宽高
  initSystemInfo: function() {
    const self = this;
    wx.getSystemInfo({
      success: function(res) {
        self.setData({
          winWidth: res.windowWidth,
          winHeight: res.windowHeight
        });
      }
    });
  },
})