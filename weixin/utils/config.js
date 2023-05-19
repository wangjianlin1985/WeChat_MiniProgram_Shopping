var url = 'http://localhost:8080';
var apiPrefix = url + '/smart';

var config = {
  name: "辰颐物语",
  wemallSession: "wemallSession",
  static: {
    imageDomain: url
  },
  api: {
    weAppLogin: '/auth/app/v1/login', //登录
    reqProductList: '/goodsInfo/app/v1/searchList', //首页-产品列表
    reqProductCategory: '/goodsInfo/app/v1/searchCategory', //分类-产品列表
    reqProductDetail: '/goodsInfo/app/v1/searchDetail', //产品明细
    reqCategoryList: '/goodsInfo/app/v1/searchList', //分类-产品列表
    addToCart: '/orderInfo/app/v1/addOne', //添加购物车
    removeCart: '/orderInfo/app/v1/removeOne', //移除购物车
    searchSubmit: '/orderInfo/app/v1/searchSubmit', //查询提交后待确认的订单
    orderSubmit: '/orderInfo/app/v1/submit', //提交订单
    orderBuy: '/orderInfo/app/v1/buyNow', //立即购买
    reqCartList: '/orderInfo/app/v1/searchList', //购物车-订单列表
    reqOrderTotal: '/orderInfo/app/v1/searchTotal', //我的-订单统计
    reqOrderList: '/orderInfo/app/v1/searchList', //我的-订单列表
    reqOrderDetail: '/orderInfo/app/v1/searchInfo', //我的-订单详情
    updateOrder: '/orderInfo/app/v1/update', //我的-订单列表-更新订单状态
    deleteOrder: '/orderInfo/app/v1/delete', //我的-订单列表-删除订单
    deleteOrders: '/orderInfo/app/v1/deleteByIds', //我的-订单列表-批量删除订单
    reqAddrList: '/addressList/app/v1/searchList', //我的-地址列表
    reqAddrDetail: '/addressList/app/v1/searchDetail', //我的-地址明细
    addAddr: '/addressList/app/v1/add', //我的-添加地址
    updateAddr: '/addressList/app/v1/update', //我的-修改地址
    deleteAddr: '/addressList/app/v1/delete', //我的-删除地址
    commentDetail: '/orderComment/app/v1/searchDetail', //我的-查看评价
    addComment: '/orderComment/app/v1/add', //我的-添加评价,
    expressDetail: '/expressInfo/app/v1/searchDetail', //我的-添加评价,
    uploadImage: '/fileImage/app/v1/uploadImage', //我的-上传图片,
  }
};

for (var key in config.api) {
  config.api[key] = apiPrefix + config.api[key];
}

module.exports = config;