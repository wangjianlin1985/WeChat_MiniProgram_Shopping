var config = require("config.js");

var utils = {

  /**
   * 封装网络请求
   * method: 方法名
   * data: 参数
   * successCallback：成功回调
   * failCallback：失败回调-可以统一处理
   * completeCallback:完成回调
   */
  sendRequest: function (method, data, successCallback, failCallback) {
    wx.showNavigationBarLoading();//显示进度条
    var authToken = wx.getStorageSync('authToken');
    wx.request({
      url: config.api[method],
      data: data,
      method: 'post',
      header: {
        'Content-type': 'application/x-www-form-urlencoded',
        "x-auth-token": authToken
      },
      success: function (res) {
        var result = res.data;
        if (result && result.code == '0000') {
          successCallback(result);// 成功回调
        }
        else if (result && result.code == '90001') {
          // TODO 提示用户登录
          console.info("用户未登录：" + result.msg);
        }
        else {
          wx.showToast({ title: result.msg || '系统错误', icon: 'none' });
          failCallback && failCallback(result);// 失败回调;
        }
      },
      fail: function (err) {
        wx.showToast({ title: '访问出错...', icon: 'none' });
      },
      complete: function (res) {
        wx.hideNavigationBarLoading();//停止进度条
      },
    })
  },

  /**
   * 封装网络请求
   * method: 方法名
   * data: 参数
   * successCallback：成功回调
   * failCallback：失败回调-可以统一处理
   * completeCallback:完成回调
   */
  sendJsonRequest: function (method, data, successCallback, failCallback) {
    wx.showNavigationBarLoading();//显示进度条
    var authToken = wx.getStorageSync('authToken');
    wx.request({
      url: config.api[method],
      data: data,
      method: 'post',
      header: {
        'Content-type': 'application/json',
        "x-auth-token": authToken
      },
      success: function (res) {
        var result = res.data;
        if (result && result.code == '0000') {
          successCallback(result);// 成功回调
        }
        else if (result && result.code == '90001') {
          // TODO 提示用户登录
          console.info("用户未登录：" + result.msg);
        }
        else {
          wx.showToast({ title: result.msg || '系统错误', icon: 'none' });
          failCallback && failCallback(result);// 失败回调;
        }
      },
      fail: function (err) {
        wx.showToast({ title: '访问出错...', icon: 'none' });
      },
      complete: function (res) {
        wx.hideNavigationBarLoading();//停止进度条
      },
    })
  },

  /**
   * 封装网络请求
   * method: 方法名
   * data: 参数
   * successCallback：成功回调
   * failCallback：失败回调-可以统一处理
   * completeCallback:完成回调
   */
  sendUploadFile: function (method, data, successCallback, failCallback) {
    wx.showNavigationBarLoading();//显示进度条
    var authToken = wx.getStorageSync('authToken');
    wx.uploadFile({
      url: config.api[method],
      filePath: data.filePath,
      name: 'fileImage',
      formData: data.paramData,
      method: 'post',
      header: {
        'Content-type': 'application/x-www-form-urlencoded',
        "x-auth-token": authToken
      },
      success: function (res) {
        var result = res.data;
        if (result && result.code == '0000') {
          successCallback(result);// 成功回调
        }
        else if (result && result.code == '90001') {
          // TODO 提示用户登录
          console.info("用户未登录：" + result.msg);
        }
        else {
          wx.showToast({ title: result.msg || '系统错误', icon: 'none' });
          failCallback && failCallback(result);// 失败回调;
        }
      },
      fail: function (err) {
        wx.showToast({ title: '访问出错...', icon: 'none' });
      },
      complete: function (res) {
        wx.hideNavigationBarLoading();//停止进度条
      },
    })
  }
}


module.exports = utils;