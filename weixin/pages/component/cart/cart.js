var utils = require("../../../utils/common.js");

Page({
  data: {
    carts: [], // 购物车列表
    hasList: false, // 列表是否有数据
    totalCartsPrice: 0, // 总价，初始为0
    selectAllStatus: true, // 全选状态，默认全选
    obj: {
      name: "hello"
    }
  },

  // 查询购物车订单
  onShow() {
    const self = this;
    utils.sendRequest('reqCartList', {
      "orderStatus": 1 //订单状态：1=购物车 2=待付款 3=待发货 4=已发货 5=已取消 6=已完成 7=售后中
    }, function(res) {
      var list = res.data;
      if (list && list.length > 0) {
        // 初始默认选中
        for (let i = 0; i < list.length; i++) {
          list[i].selected = true;
        }
        self.setData({
          hasList: true,
          carts: list
        });
        // 计算总价
        self.getTotalPrice();
      }
    })
  },

  /**
   * 当前商品选中事件
   */
  selectList(e) {
    const index = e.currentTarget.dataset.index;
    let carts = this.data.carts;
    const selected = carts[index].selected;
    carts[index].selected = !selected;
    this.setData({
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 删除购物车当前商品
   */
  deleteList(e) {
    const self = this;
    const index = e.currentTarget.dataset.index;
    let carts = self.data.carts;
    // 调用删除订单接口
    utils.sendRequest('deleteOrder', {
      "id": carts[index].id
    }, function(res) {
      // 删除成功移除列表     
      carts.splice(index, 1);
      self.setData({
        carts: carts
      });
      if (!carts.length) {
        self.setData({
          hasList: false
        });
      } else {
        self.getTotalPrice();
      }
    });

  },

  /**
   * 购物车全选事件
   */
  selectAll(e) {
    let selectAllStatus = this.data.selectAllStatus;
    selectAllStatus = !selectAllStatus;
    let carts = this.data.carts;

    for (let i = 0; i < carts.length; i++) {
      carts[i].selected = selectAllStatus;
    }
    this.setData({
      selectAllStatus: selectAllStatus,
      carts: carts
    });
    this.getTotalPrice();
  },

  /**
   * 绑定加数量事件
   */
  addCount(e) {
    const self = this;
    const index = e.currentTarget.dataset.index;
    let carts = self.data.carts;
    utils.sendRequest('addToCart', {
      "goodsNo": carts[index].goodsNo,
      "goodsNum": 1
    }, function(res) {
      // 添加购物车成功后页面数量加一
      let goodsNum = carts[index].goodsNum;
      goodsNum = goodsNum + 1;
      carts[index].goodsNum = goodsNum;
      self.setData({
        carts: carts
      });
      self.getTotalPrice();
    });

  },

  /**
   * 绑定减数量事件
   */
  minusCount(e) {
    const self = this;
    const index = e.currentTarget.dataset.index;
    const obj = e.currentTarget.dataset.obj;
    let carts = self.data.carts;
    utils.sendRequest('removeCart', {
      "orderNo": carts[index].orderNo
    }, function(res) {
      let goodsNum = carts[index].goodsNum;
      if (goodsNum <= 1) {
        return false;
      }
      goodsNum = goodsNum - 1;
      carts[index].goodsNum = goodsNum;
      self.setData({
        carts: carts
      });
      self.getTotalPrice();
    });
  },

  // 提交待确认
  submitOrders() {
    const self = this;
    let carts = self.data.carts;
    var selectedOrder = [];
    for (let i = 0; i < carts.length; i++) { // 循环列表得到每个数据
      if (carts[i].selected) { // 判断选中
        selectedOrder.push(carts[i].orderNo);
      }
    }

    if (selectedOrder.length == 0) {
      wx.showToast({
        title: '未选择购买项。',
        icon: 'none'
      });
      return;
    }

    wx.navigateTo({
      url: '../orders/orders?orderNos=' + selectedOrder.join(",")
    })
  },

  /**
   * 计算总价
   */
  getTotalPrice() {
    let carts = this.data.carts; // 获取购物车列表
    let total = 0;
    for (let i = 0; i < carts.length; i++) { // 循环列表得到每个数据
      if (carts[i].selected) { // 判断选中才会计算价格
        total += carts[i].goodsNum * carts[i].sellPrice; // 所有价格加起来
      }
    }
    this.setData({ // 最后赋值到data中渲染到页面
      carts: carts,
      totalCartsPrice: total.toFixed(2)
    });
  }

})