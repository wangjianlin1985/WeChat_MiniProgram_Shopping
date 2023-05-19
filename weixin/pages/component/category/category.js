var utils = require("../../../utils/common.js");

Page({
  data: {
    category: [
      { name: '水果', id: 'shuiguo', goodsType: '1' },
      { name: '零食', id: 'lingshi', goodsType: '2' },
      { name: '干货', id: 'ganhuo', goodsType: '3' }
    ],
    goodsList: [],//分类产品列表
    curIndex: 0,
    isScroll: false,
    toView: 'shuiguo',
    mianImage: '/images/d.png'
  },

  // 分类查询产品列表
  onLoad() {
    var self = this;
    var curIndex = self.data.curIndex;
    var goodsType = self.data.category[curIndex].goodsType;
    utils.sendRequest('reqProductCategory', {
      "goodsType": goodsType
    }, function (res) {
      self.setData({
        goodsList: res.data
      })
    });
  },
  switchTab(e) {
    const self = this;
    this.setData({
      isScroll: true
    })
    setTimeout(function () {
      self.setData({
        toView: e.target.dataset.id,
        curIndex: e.target.dataset.index
      })

      // 根据选择的类别查询产品列表
      self.onLoad();

    }, 0)
    setTimeout(function () {
      self.setData({
        isScroll: false
      })
    }, 1)

  }

})