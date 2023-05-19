var utils = require("../../../utils/common.js");

Page({
  data: {
    // 产品轮播图
    imgUrls: [],
    indicatorDots: false,
    autoplay: false,
    interval: 3000,
    duration: 800,
    goodsInfo: null,
    imageList: [],
    num: 1, //当前产品总数
    totalNum: 0, //购物车内商品总数
    hasCarts: false, //购物车内是否有商品
    curIndex: 0,
    scaleCart: false,
    winWidth: 0,
    winHeight: 0
  },

  // 传值
  onLoad: function(option) {
    const self = this;
    const goodsNo = option.goodsNo;
    console.log("查看产品传参：" + goodsNo);
    utils.sendRequest('reqProductDetail', {
      "goodsNo": goodsNo
    }, function(res) {
      self.setData({
        imgUrls: res.data.showList,
        goodsInfo: res.data.goodsInfo,
        imageList: res.data.imageList
      })
    });

  },

  addCount() {
    let num = this.data.num;
    num++;
    this.setData({
      num: num
    })
  },

  // 添加产品到购物车
  addToCart() {
    const self = this;
    const num = this.data.num;
    let total = this.data.totalNum;
    
    // 调用后台接口，保存数据
    utils.sendRequest('addToCart', {
      "goodsNo": self.data.goodsInfo.goodsNo,
      "goodsNum": 1
    }, function (res) {
      setTimeout(function () {
        self.setData({
          scaleCart: true
        })
        setTimeout(function () {
          self.setData({
            scaleCart: false,
            hasCarts: true,
            totalNum: num + total
          })
        }, 200)
      }, 300)
    });

  },

  bindTap(e) {
    const index = parseInt(e.currentTarget.dataset.index);
    this.setData({
      curIndex: index
    })
  },

  goToCart: function () {
    wx.switchTab({
      url: '../cart/cart'
    })
  },

  // 立即购买
  setModalStatus: function (e) {
    // 先加入购物车，再跳转到确认页
    const self = this;
    const num = this.data.num;
    let total = this.data.totalNum;
    utils.sendRequest('orderBuy', {
      "goodsNo": self.data.goodsInfo.goodsNo,
      "goodsNum": 1
    }, function (res) {
      wx.navigateTo({
        url: '../orders/orders?orderNos=' + res.data.orderNo
      })
    });
  }

})