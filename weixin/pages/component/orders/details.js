var utils = require("../../../utils/common.js");

Page({
  data: {
    orderInfo: {},//订单信息
    orderExpress: {},//物流信息
    orderComment1: {},//评论
    orderComment2: {},//售后
    orderImages: [],//评论和售后的图片
    userStars: [
      '/images/icons/star_fill_MT_UI.png',
      '/images/icons/star_line_MT_UI.png',
      '/images/icons/star_line_MT_UI.png',
      '/images/icons/star_line_MT_UI.png',
      '/images/icons/star_line_MT_UI.png'
    ],
    hasComments1: false,
    hasComments2: false,
    goodsStar: 5,
    pingjiaContent: '',
    shouhouContent: '',
    upload_pic: [],
    upload_pic_name: [],
    upload_succ: true,
    pic_length: false,
    is_upload: false,
    delete_ico: "/images/icons/delete.png",
    camera_pic: "/images/icons/camera.png"
  },

  onLoad: function (option) {
    const orderNo = option.orderNo;
    const self = this;
    // 查询订单详情
    utils.sendRequest('reqOrderDetail', {
      "orderNo": orderNo
    }, function (res) {
      const result = res.data;
      if (result.orderComment1) {
        var goodsStar = result.orderComment1.goodsStar;
        self.setData({
          hasComments1: true,
          pingjiaContent: result.orderComment1.content,
          goodsStar: goodsStar
        });
        // 显示评分
        self.showPingjia(goodsStar);
      }
      if (result.orderComment2) {
        self.setData({
          hasComments2: true,
          shouhouContent: result.orderComment2.content,
        });
      }
      self.setData({
        orderInfo: result.orderInfo,
        orderExpress: result.orderExpress,
        orderComment1: result.orderComment1,
        orderComment2: result.orderComment2,
        orderImages: result.orderImages
      });
    });
  },

  // 星星点击事件
  starTap: function (e) {
    var index = e.currentTarget.dataset.index; // 获取当前点击的是第几颗星星
    var goodsStar = parseInt(index) + 1;
    this.showPingjia(goodsStar);
    this.setData({
      goodsStar: goodsStar
    })
  },

  // 星星显示
  showPingjia: function (goodsStar) {
    var tempUserStars = this.data.userStars; // 暂存星星数组
    var len = tempUserStars.length; // 获取星星数组的长度
    for (var i = 0; i < len; i++) {
      if (i < goodsStar) { // 小于goodsStar的是满心
        tempUserStars[i] = '/images/icons/star_fill_MT_UI.png'
      } else { // 其他是空心
        tempUserStars[i] = '/images/icons/star_line_MT_UI.png'
      }
    }
    // 重新赋值就可以显示了
    this.setData({
      userStars: tempUserStars
    })
  },

  // 选择图片
  chooseImage(e) {
    var that = this;
    wx.chooseImage({
      count: 3,
      sizeType: ['original', 'compressed'],  //可选择原图或压缩后的图片
      sourceType: ['album', 'camera'], //可选择性开放访问相册、相机
      success: res => {
        var addImg = res.tempFilePaths;
        var pic_length = false;
        if (addImg.length < 3) {
          pic_length = false;
        } else {
          pic_length = true;
        }
        that.setData({
          upload_pic: addImg,
          pic_length: pic_length,
          is_upload: true
        })
      }
    })

  },

  bindinput: function (e) {
    var that = this;
    that.setData({ 
      pingjiaContent: e.detail.value 
    });
  },

  //上传评论
  onSubmit: function () {
    var that = this;
    var upload_picture_list = that.data.upload_pic;
    var pingjiaContent = that.data.pingjiaContent;
    
    if (pingjiaContent == '' && (upload_picture_list.length == 0)) {
      wx.showModal({
        title: '提示',
        content: '请输入内容或者至少选择一张图片',
        showCancel: false
      })
    }

    for (var i in upload_picture_list) {
      that.upload_file_server(that, upload_picture_list, i)
    }

    setTimeout(function () {
      if (that.data.upload_succ) {
        utils.sendRequest('addComment', {
          "orderNo": that.data.orderInfo.orderNo,
          "goodsStar": that.data.goodsStar,
          "content": pingjiaContent,
          "commentType": "1",//类型：1=评论 2=售后
        }, function (res) {
          self.setData({
            hasComments1: true
          });
        });
      }
    }, 800);
  },

  // 上传图片
  upload_file_server: function (that, upload_picture_list, i) {
    utils.sendUploadFile('uploadImage', {
      "filePath": upload_picture_list[i],
      "paramData": {
        "bizNo": that.data.orderInfo.orderNo,
        "bizType": "2" //类型：1=商品图 2=评论图 3=售后图
      }
    }, function (res) {
      console.info("上传文件返回："+ res);
      let img_name = res.data.fileName;
      that.data.upload_pic_name[i] = img_name;
      that.setData({
        upload_pic_name: that.data.upload_pic_name
      })
    }, function (res) {
      that.setData({
        upload_succ: false
      })
    });
  },

  // 删除图片
  deletePic: function (e) {
    var that = this;
    var pic_index = e.currentTarget.dataset.pic_index;
    var upload_pic = [];
    for (let i in that.data.upload_pic) {
      if (i != pic_index) {
        upload_pic.push(that.data.upload_pic[i])
      }
    }
    console.log(upload_pic)
    that.setData({
      upload_pic: upload_pic,
      pic_length: false,
      is_upload: true
    })

  }

  
})