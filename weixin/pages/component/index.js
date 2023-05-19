var utils = require("../../utils/common.js");

Page({
  data: {
    // 首页轮播图
    imgUrls: [
      '/images/a.png',
      '/images/b.png',
      '/images/c.png'
    ],
    goodsList: [],//产品列表
    salesList: [],//活动款列表
    indicatorDots: false,
    autoplay: false,
    interval: 3000,
    duration: 800,
    hasSales: false, //是否存在活动款
    searchValue: ''
  },
  // 页面加载时查询一次，不实时刷新列表
  onLoad() {
    // 初次加载清空搜索内容
    this.setData({
      searchValue: '',
    });
    this.listGoods();

  },

  // 加载商品列表
  listGoods: function() {
    var self = this;
    var goodsName = this.data.searchValue;
    utils.sendRequest('reqProductList', {
      "name": goodsName
    }, function (res) {
      var sales = false;
      if (res.data.salesList && res.data.salesList.length > 0) {
        sales = true;
      }
      self.setData({
        goodsList: res.data.goodsList,
        salesList: res.data.salesList,
        hasSales: sales
      })
    }); 
  },

  //获取搜索框的值
  searchValueInput: function (e) {
    var value = e.detail.value;
    this.setData({
      searchValue: value,
    });
  },

  // 搜索
  searchGoods: function (e) {
    this.listGoods();
  }

})