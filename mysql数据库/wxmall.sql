/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : wxmall

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2019-07-31 16:23:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wx_access_log`
-- ----------------------------
DROP TABLE IF EXISTS `wx_access_log`;
CREATE TABLE `wx_access_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户名',
  `operate_type` varchar(8) DEFAULT NULL COMMENT '操作类型',
  `operate_name` varchar(64) DEFAULT NULL COMMENT '操作名称',
  `operate_method` varchar(128) DEFAULT NULL COMMENT '请求方法名',
  `url` varchar(128) DEFAULT NULL COMMENT '请求URL',
  `req_param` text COMMENT '请求参数',
  `res_result` text COMMENT '响应结果',
  `execute_time` bigint(20) DEFAULT NULL COMMENT '执行时长',
  `ip` varchar(16) DEFAULT NULL COMMENT '访问IP',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='访问日志';

-- ----------------------------
-- Records of wx_access_log
-- ----------------------------
INSERT INTO `wx_access_log` VALUES ('1', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"f8f1a336d2c34e7ca9b3bebd6640c78c\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '10', '0:0:0:0:0:0:0:1', '1', '2019-07-31 12:49:53', '1', '2019-07-31 12:49:53', '1', null);
INSERT INTO `wx_access_log` VALUES ('2', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"aa25215eca204399be4feeedc748b1de\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '13', '0:0:0:0:0:0:0:1', '1', '2019-07-31 13:11:20', '1', '2019-07-31 13:11:20', '1', null);
INSERT INTO `wx_access_log` VALUES ('3', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"c5e3b93b5f9e49bb921382052a171a18\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '31', '0:0:0:0:0:0:0:1', '1', '2019-07-31 14:58:21', '1', '2019-07-31 14:58:21', '1', null);
INSERT INTO `wx_access_log` VALUES ('4', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"c5e3b93b5f9e49bb921382052a171a18\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '17', '0:0:0:0:0:0:0:1', '1', '2019-07-31 15:00:44', '1', '2019-07-31 15:00:44', '1', null);
INSERT INTO `wx_access_log` VALUES ('5', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"31ccf5f7cbfe45ffaadf270ce823352c\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '63', '0:0:0:0:0:0:0:1', '1', '2019-07-31 15:09:30', '1', '2019-07-31 15:09:30', '1', null);
INSERT INTO `wx_access_log` VALUES ('6', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"e6307b628de44346bf836277b3499dfa\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '12', '0:0:0:0:0:0:0:1', '1', '2019-07-31 15:12:49', '1', '2019-07-31 15:12:49', '1', null);
INSERT INTO `wx_access_log` VALUES ('7', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"e54e44a1e38945f2aab9ed9015946c03\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '9', '0:0:0:0:0:0:0:1', '1', '2019-07-31 15:29:51', '1', '2019-07-31 15:29:51', '1', null);
INSERT INTO `wx_access_log` VALUES ('8', '1', 'admin', '4', '查询个人登录信息', 'com.yun.smart.controller.UserInfoControllergetBaseInfo', '/smart/userInfo/pc/v1/getBaseInfo', '{\"token\":\"ea98d5f1970c4111b62efd9b2d4d4d89\"}', '{\"code\":\"0000\",\"msg\":\"成功完成操作。\",\"data\":{\"userRole\":\"超级管理员\",\"userName\":\"admin\",\"userMsg\":0}}', '8', '0:0:0:0:0:0:0:1', '1', '2019-07-31 16:14:33', '1', '2019-07-31 16:14:33', '1', null);

-- ----------------------------
-- Table structure for `wx_address_list`
-- ----------------------------
DROP TABLE IF EXISTS `wx_address_list`;
CREATE TABLE `wx_address_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `link_man` varchar(16) DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `link_addr` varchar(256) DEFAULT NULL COMMENT '联系地址',
  `default_addr` tinyint(1) DEFAULT '0' COMMENT '默认地址：0=非默认，1=默认',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地址';

-- ----------------------------
-- Records of wx_address_list
-- ----------------------------
INSERT INTO `wx_address_list` VALUES ('1', '3', '张三', '13866668888', '广东省广州市天河区白云大道南112号', '0', '3', '2019-05-14 13:59:35', '1', '2019-07-31 16:19:32', '1', null);
INSERT INTO `wx_address_list` VALUES ('5', '3', '林哥', '13981239342', '四川达州滨江路', '1', '3', '2019-07-31 14:55:18', '3', '2019-07-31 14:56:26', '1', null);
INSERT INTO `wx_address_list` VALUES ('6', '3', '林哥', '13981239342', '四川达州滨江路', '0', '3', '2019-07-31 14:56:26', '3', '2019-07-31 14:56:38', '0', null);

-- ----------------------------
-- Table structure for `wx_dic_info`
-- ----------------------------
DROP TABLE IF EXISTS `wx_dic_info`;
CREATE TABLE `wx_dic_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父节点ID  默认0',
  `dic_name` varchar(32) DEFAULT NULL COMMENT '字典名词',
  `dic_value` varchar(64) DEFAULT NULL COMMENT '字典值',
  `dic_text` varchar(128) DEFAULT NULL COMMENT '字典词',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='字典';

-- ----------------------------
-- Records of wx_dic_info
-- ----------------------------
INSERT INTO `wx_dic_info` VALUES ('1', null, '', null, '用户类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('2', null, '', null, '图片类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('3', null, '', null, '反馈类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('4', null, '', null, '消息类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('5', null, '', null, '商品状态', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('6', null, '', null, '商品类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('7', null, '', null, '订单状态', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('8', null, '', null, '公告类型', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('9', null, '', null, '消息状态', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('10', null, '', null, '评分等级', null, '2019-05-14 13:12:51', null, null, '1', null);
INSERT INTO `wx_dic_info` VALUES ('11', '1', 'user_type', '1', '超级管理员', '1', '2019-05-14 13:16:14', '1', '2019-05-14 13:16:14', '1', null);
INSERT INTO `wx_dic_info` VALUES ('12', '1', 'user_type', '2', '授权管理员', '1', '2019-05-14 13:16:31', '1', '2019-05-14 13:16:31', '1', null);
INSERT INTO `wx_dic_info` VALUES ('13', '1', 'user_type', '3', '用户', '1', '2019-05-14 13:16:31', '1', '2019-05-14 13:16:31', '1', null);
INSERT INTO `wx_dic_info` VALUES ('14', '2', 'image_biz_type', '1', '商品图', '1', '2019-05-14 13:17:53', '1', '2019-05-14 13:17:53', '1', null);
INSERT INTO `wx_dic_info` VALUES ('15', '2', 'image_biz_type', '2', '评论图', '1', '2019-05-14 13:17:53', '1', '2019-05-14 13:17:53', '1', null);
INSERT INTO `wx_dic_info` VALUES ('16', '2', 'image_biz_type', '3', '售后图', '1', '2019-05-14 13:17:53', '1', '2019-05-14 13:17:53', '1', null);
INSERT INTO `wx_dic_info` VALUES ('17', '3', 'comment_type', '1', '评论', '1', '2019-05-14 13:18:40', '1', '2019-05-14 13:18:40', '1', null);
INSERT INTO `wx_dic_info` VALUES ('18', '3', 'comment_type', '2', '售后', '1', '2019-05-14 13:18:40', '1', '2019-05-14 13:18:40', '1', null);
INSERT INTO `wx_dic_info` VALUES ('19', '4', 'tips_biz_type', '1', '小贴士', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('20', '4', 'tips_biz_type', '2', '通知', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('21', '5', 'goods_sell_status', '1', '有货', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('22', '5', 'goods_sell_status', '2', '无货', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('23', '5', 'goods_sell_status', '3', '下架', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('24', '5', 'goods_sell_status', '4', '活动', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('25', '6', 'goods_type', '1', '水果', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('26', '6', 'goods_type', '2', '零食', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('27', '6', 'goods_type', '3', '干货', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:26:26', '1', null);
INSERT INTO `wx_dic_info` VALUES ('28', '7', 'order_status', '1', '购物车', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('29', '7', 'order_status', '2', '待付款', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('30', '7', 'order_status', '3', '待发货', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('31', '7', 'order_status', '4', '已发货', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('32', '7', 'order_status', '5', '已取消', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('33', '7', 'order_status', '6', '已完成', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('34', '7', 'order_status', '7', '售后中', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('35', '8', 'notice_type', '1', '已付款', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('36', '8', 'notice_type', '2', '申请售后', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('37', '9', 'notice_status', '1', '未读', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('38', '9', 'notice_status', '2', '已读', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('39', '10', 'goods_star', '1', '一颗星', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('40', '10', 'goods_star', '2', '两颗星', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('41', '10', 'goods_star', '3', '三颗星', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('42', '10', 'goods_star', '4', '四颗星', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);
INSERT INTO `wx_dic_info` VALUES ('43', '10', 'goods_star', '5', '五颗星', '1', '2019-05-14 13:19:17', '1', '2019-05-14 13:19:17', '1', null);

-- ----------------------------
-- Table structure for `wx_express_info`
-- ----------------------------
DROP TABLE IF EXISTS `wx_express_info`;
CREATE TABLE `wx_express_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `express_name` varchar(32) DEFAULT NULL COMMENT '快递公司',
  `express_code` varchar(32) DEFAULT NULL COMMENT '快递公司代号',
  `express_no` varchar(64) DEFAULT NULL COMMENT '快递单号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单快递信息';

-- ----------------------------
-- Records of wx_express_info
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_file_image`
-- ----------------------------
DROP TABLE IF EXISTS `wx_file_image`;
CREATE TABLE `wx_file_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_name` varchar(256) DEFAULT NULL COMMENT '名称',
  `file_path` varchar(256) DEFAULT NULL COMMENT '路径',
  `biz_type` varchar(2) DEFAULT NULL COMMENT '类型：1=商品图 2=评论图 3=售后图',
  `biz_no` varchar(32) DEFAULT NULL COMMENT '业务编号或主键ID',
  `main_logo` tinyint(1) DEFAULT '0' COMMENT '主图标识：0=非主图，1=主图',
  `top_show` tinyint(1) DEFAULT NULL COMMENT '顶部展示图：0=不是，1=是',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='图片';

-- ----------------------------
-- Records of wx_file_image
-- ----------------------------
INSERT INTO `wx_file_image` VALUES ('1', '澳洲进口红提', 'http://localhost:8080/public/images/1557812526242.jpg', '1', 'GN1128173238452080641', '1', '1', '1', '2019-05-14 13:42:06', '1', '2019-05-14 13:47:26', '1', null);
INSERT INTO `wx_file_image` VALUES ('2', '进口纯牛奶', 'http://localhost:8080/public/images/1557812802947.jpg', '1', 'GN1128173238452080642', '1', '1', '1', '2019-05-14 13:46:43', '1', '2019-05-14 13:47:24', '1', null);
INSERT INTO `wx_file_image` VALUES ('3', '奶油草莓', 'http://localhost:8080/public/images/1557813024049.jpg', '1', 'GN1128175625216565249', '1', '1', '1', '2019-05-14 13:50:24', '1', '2019-05-14 13:50:39', '1', null);
INSERT INTO `wx_file_image` VALUES ('4', null, 'http://localhost:8080/public/images/1557813801872.jpg', '2', 'OR1128177813221384193', '1', null, '2', '2019-05-14 14:03:22', '2', '2019-05-14 14:03:22', '1', null);
INSERT INTO `wx_file_image` VALUES ('5', null, 'http://localhost:8080/public/images/1557813934537.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:05:35', '2', '2019-05-14 14:05:35', '1', null);
INSERT INTO `wx_file_image` VALUES ('6', null, 'http://localhost:8080/public/images/1557814007536.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:06:48', '2', '2019-05-14 14:06:48', '1', null);
INSERT INTO `wx_file_image` VALUES ('7', null, 'http://localhost:8080/public/images/1557814269433.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:11:09', '2', '2019-05-14 14:11:09', '1', null);
INSERT INTO `wx_file_image` VALUES ('8', null, 'http://localhost:8080/public/images/1557814277514.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:11:18', '2', '2019-05-14 14:11:18', '1', null);
INSERT INTO `wx_file_image` VALUES ('9', null, 'http://localhost:8080/public/images/1557814285852.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:11:26', '2', '2019-05-14 14:11:26', '1', null);
INSERT INTO `wx_file_image` VALUES ('10', null, 'http://localhost:8080/public/images/1557814303770.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:11:44', '2', '2019-05-14 14:11:44', '1', null);
INSERT INTO `wx_file_image` VALUES ('11', null, 'http://localhost:8080/public/images/1557814367470.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:12:47', '2', '2019-05-14 14:12:47', '1', null);
INSERT INTO `wx_file_image` VALUES ('12', null, 'http://localhost:8080/public/images/1557814417544.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:13:38', '2', '2019-05-14 14:13:38', '1', null);
INSERT INTO `wx_file_image` VALUES ('13', null, 'http://localhost:8080/public/images/1557814465487.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:14:25', '2', '2019-05-14 14:14:25', '1', null);
INSERT INTO `wx_file_image` VALUES ('14', null, 'http://localhost:8080/public/images/1557814545638.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:15:46', '2', '2019-05-14 14:15:46', '1', null);
INSERT INTO `wx_file_image` VALUES ('15', null, 'http://localhost:8080/public/images/1557814833331.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:20:34', '2', '2019-05-14 14:20:34', '1', null);
INSERT INTO `wx_file_image` VALUES ('16', null, 'http://localhost:8080/public/images/1557814917287.jpg', '2', 'OR1128177813221384193', '0', null, '2', '2019-05-14 14:21:57', '2', '2019-05-14 14:21:57', '1', null);

-- ----------------------------
-- Table structure for `wx_file_tips`
-- ----------------------------
DROP TABLE IF EXISTS `wx_file_tips`;
CREATE TABLE `wx_file_tips` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `biz_type` varchar(2) DEFAULT NULL COMMENT '类型：1=小贴士 2=通知',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';

-- ----------------------------
-- Records of wx_file_tips
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_goods_info`
-- ----------------------------
DROP TABLE IF EXISTS `wx_goods_info`;
CREATE TABLE `wx_goods_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goods_no` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `name` varchar(32) DEFAULT NULL COMMENT '商品名称',
  `original_price` decimal(4,1) DEFAULT NULL COMMENT '进价',
  `agent_price` decimal(4,1) DEFAULT NULL COMMENT '代理价',
  `sell_price` decimal(4,1) DEFAULT NULL COMMENT '售价',
  `discount_price` decimal(4,1) DEFAULT NULL COMMENT '活动价',
  `weight` decimal(4,1) DEFAULT NULL COMMENT '起售重量',
  `weight_unit` varchar(8) DEFAULT NULL COMMENT '重量单位：斤，kg，盒，包，袋，个 等等',
  `grow_place` varchar(16) DEFAULT NULL COMMENT '产地',
  `send_place` varchar(16) DEFAULT NULL COMMENT '发货地',
  `send_term` varchar(16) DEFAULT NULL COMMENT '发货时间：3天内，一周内等等',
  `send_addition` varchar(128) DEFAULT NULL COMMENT '发货说明：东三省不发货，北京快递费+3 等等',
  `express` varchar(16) DEFAULT NULL COMMENT '快递：顺丰，中通等等',
  `express_price` decimal(4,1) DEFAULT NULL COMMENT '快递费',
  `before_sell` text COMMENT '售前须知',
  `after_sell` text COMMENT '售后须知',
  `sell_status` varchar(2) DEFAULT NULL COMMENT '状态：1=有货 2=无货 3=下架 4=活动',
  `goods_type` varchar(2) DEFAULT NULL COMMENT '类型：1=水果 2=零食 3=干货',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wx_goods_info_goods_no_idx` (`goods_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='产品信息';

-- ----------------------------
-- Records of wx_goods_info
-- ----------------------------
INSERT INTO `wx_goods_info` VALUES ('1', 'GN1128173238452080641', '澳洲进口红提', '80.0', '83.0', '93.0', null, '3.0', '斤', '澳洲', '海南', '一周内', '东三省不发货', '顺风', '0.0', '水果难保存，运输过程中难免有所损害，需及时跟进，坏果理赔。', '水果难保存，运输过程中难免有所损害，需及时跟进，坏果理赔。', '1', '1', '1', '2019-05-14 13:30:10', '1', '2019-05-14 13:30:10', '1', '好吃不贵');
INSERT INTO `wx_goods_info` VALUES ('2', 'GN1128173238452080642', '进口纯牛奶', '56.0', '58.0', '70.0', null, '5.0', 'L', '日本', '山东', '一周内', '无', '顺风', '0.0', '奶制品不易保存，运输过程中如有破损，需拍照留存，上报理赔。', '奶制品不易保存，运输过程中如有破损，需拍照留存，上报理赔。', '1', '2', '1', '2019-05-14 13:40:35', '1', '2019-05-14 13:40:35', '1', '健康饮品');
INSERT INTO `wx_goods_info` VALUES ('3', 'GN1128175625216565249', '奶油草莓', '35.0', '38.0', '45.0', null, '5.0', '斤', '山东', '山东', '3天内', '无', '顺风', '3.0', '个别草莓会酸，超过5颗可以申请理赔。', '个别草莓会酸，超过5颗可以申请理赔。', '1', '1', '1', '2019-05-14 13:50:04', '1', '2019-05-14 13:50:04', '1', '个头大，很甜');

-- ----------------------------
-- Table structure for `wx_order_comment`
-- ----------------------------
DROP TABLE IF EXISTS `wx_order_comment`;
CREATE TABLE `wx_order_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `goods_no` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `content` text COMMENT '评论内容：500字以内',
  `goods_star` int(1) DEFAULT NULL COMMENT '评分等级：1到5分',
  `response_content` text COMMENT '商家回复',
  `response_time` datetime DEFAULT NULL COMMENT '商家回复时间',
  `comment_type` varchar(2) DEFAULT NULL COMMENT '类型：1=评论 2=售后',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of wx_order_comment
-- ----------------------------
INSERT INTO `wx_order_comment` VALUES ('1', '2', 'OR1128177813221384193', 'GN1128173238452080642', '很好喝，家人都很喜欢。', '5', null, null, '1', '2', '2019-05-14 14:28:09', '2', '2019-05-14 14:28:09', '1', null);
INSERT INTO `wx_order_comment` VALUES ('2', '3', 'OR1156473103300173826', 'GN1128175625216565249', '物流很快！！', '5', null, null, '1', '3', '2019-07-31 16:11:19', '3', '2019-07-31 16:11:19', '1', null);

-- ----------------------------
-- Table structure for `wx_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `wx_order_info`;
CREATE TABLE `wx_order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `goods_no` varchar(32) DEFAULT NULL COMMENT '产品编号',
  `total_price` decimal(4,1) DEFAULT NULL COMMENT '应付款',
  `goods_num` int(4) DEFAULT NULL COMMENT '购买数量',
  `addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
  `order_status` varchar(2) DEFAULT NULL COMMENT '订单状态：1=购物车 2=待付款 3=待发货 4=待收货 5=已取消 6=已完成 7=售后中',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wx_order_info_order_no_idx` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of wx_order_info
-- ----------------------------
INSERT INTO `wx_order_info` VALUES ('1', 'OR1128177773778149378', '2', 'GN1128173238452080641', '93.0', '1', '1', '3', '2', '2019-05-14 13:58:36', '2', '2019-05-14 13:58:36', '1', null);
INSERT INTO `wx_order_info` VALUES ('2', 'OR1128177813221384193', '2', 'GN1128173238452080642', '70.0', '1', '1', '6', '2', '2019-05-14 13:58:46', '2', '2019-05-14 13:58:46', '1', null);
INSERT INTO `wx_order_info` VALUES ('3', 'OR1128178082021744642', '2', 'GN1128175625216565249', '90.0', '2', null, '1', '2', '2019-05-14 13:59:50', '2', '2019-05-14 13:59:50', '1', null);
INSERT INTO `wx_order_info` VALUES ('6', 'OR1156463217740881921', '3', 'GN1128173238452080641', '93.0', '1', '5', '6', '3', '2019-07-31 15:14:52', '3', '2019-07-31 15:23:08', '1', null);
INSERT INTO `wx_order_info` VALUES ('7', 'OR1156463249080721410', '3', 'GN1128173238452080642', '140.0', '2', '5', '6', '3', '2019-07-31 15:14:59', '1', '2019-07-31 15:19:34', '1', null);
INSERT INTO `wx_order_info` VALUES ('8', 'OR1156473064091820034', '3', 'GN1128173238452080641', '93.0', '1', '5', '6', '3', '2019-07-31 15:53:59', '3', '2019-07-31 16:08:42', '1', null);
INSERT INTO `wx_order_info` VALUES ('9', 'OR1156473103300173826', '3', 'GN1128175625216565249', '90.0', '2', '5', '6', '3', '2019-07-31 15:54:09', '3', '2019-07-31 16:08:52', '1', null);

-- ----------------------------
-- Table structure for `wx_order_notice`
-- ----------------------------
DROP TABLE IF EXISTS `wx_order_notice`;
CREATE TABLE `wx_order_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `order_no` varchar(32) DEFAULT NULL COMMENT '订单编号',
  `content` text COMMENT '内容',
  `notice_type` varchar(2) DEFAULT NULL COMMENT '通知类型：1=待发货 2=申请售后',
  `notice_status` varchar(2) DEFAULT '1' COMMENT '状态：1=未读 2=已读',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of wx_order_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `wx_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_info`;
CREATE TABLE `wx_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `passwd` varchar(64) DEFAULT NULL COMMENT '密码',
  `wx_account` varchar(32) DEFAULT NULL COMMENT '微信号',
  `wx_openid` varchar(32) DEFAULT NULL COMMENT '微信小程序openid',
  `user_type` varchar(2) DEFAULT NULL COMMENT '类型：1=超级管理员 2=授权管理员 3=用户',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enable` tinyint(1) DEFAULT '1' COMMENT '删除标识：0为已删除，1为未删除',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of wx_user_info
-- ----------------------------
INSERT INTO `wx_user_info` VALUES ('1', 'admin', '13866668888', '2XTe/tXTZj3XdwIUI4UFSQ==', null, null, '1', null, '2019-05-14 12:47:08', null, null, '1', '管理员');
INSERT INTO `wx_user_info` VALUES ('2', null, null, null, null, 'odksN5B8VcHc-VlfuRDb1XUhRkxA', null, null, '2019-05-14 13:53:53', null, '2019-05-14 13:53:53', '1', null);
INSERT INTO `wx_user_info` VALUES ('3', null, null, null, null, 'oM7Mu5XyeVJSc8roaUCRlcz_IP9k', null, null, '2019-07-31 13:55:39', null, '2019-07-31 13:55:39', '1', null);
INSERT INTO `wx_user_info` VALUES ('4', '林哥', '13613439834', null, 'linge', 'oM7Mu5XyeVJSc8roaUCRlcz_vafa', '3', '1', '2019-07-31 15:40:02', '1', '2019-07-31 15:40:02', '1', null);
