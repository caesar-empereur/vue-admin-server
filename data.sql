/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : vue_admin

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2020-05-28 16:22:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(36) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `buyer_name` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `sku_id` varchar(255) DEFAULT NULL,
  `sku_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('03e97f1e-57cf-48f8-bdf0-2badc9ba7cf9', '6000', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('05c5e373-0ca7-4da6-a431-ecd3abcbaf8e', '6000', '刘先生', '2020-05-06 20:34:20', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('0df2cf3f-695e-46da-9001-b7a049cb197b', '6000', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('0f8ef847-faaf-486c-9e21-e3f7ed004b8e', '6000', '刘先生', '2020-05-06 20:34:17', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('173b749b-fa0a-4a9e-a79f-fb43e802deb3', '451', '刘先生', '2020-05-06 20:34:20', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('1a0b8e56-6a2a-4683-bea5-7169e143c698', '657', '刘先生', '2020-05-06 20:34:07', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('21170761-1464-47a7-a806-5f8e09bf214c', '132', '刘先生', '2020-05-06 20:34:20', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8', 'CANCEL');
INSERT INTO `t_order` VALUES ('2fe7fee7-c858-4f4e-a48e-4753ded3af96', '487', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('367f0f20-a67c-4730-8035-17f8054f8898', '240', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('444cfe4a-2fce-4536-902a-1b540b0d76a6', '640', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('462536b9-769b-4a10-9f46-0f2dba846f2b', '680', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('4ebbf543-3fb7-4751-b9f9-d5777e723b49', '579', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('4f9574a0-cad2-4ecd-9030-24a6fc359d54', '854', '刘先生', '2020-05-06 20:34:21', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('532b7905-828a-4dd5-9699-4c54b0f7bcd7', '733', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('5493652a-13dd-4eed-863e-4a67d6c9aa83', '205', '刘先生', '2020-05-06 20:34:08', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone 8 plus', 'FINISHED');
INSERT INTO `t_order` VALUES ('55479ec9-9fe1-4f0f-b397-2f2f79dc83d6', '625', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('5ec9c525-c09d-4009-b450-b1ee19d7ae64', '711', '刘先生', '2020-05-06 20:34:20', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('70b8eb14-6fe4-4090-9552-c0ec016d4c3c', '779', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('717f16ed-02d6-466a-994e-17fae69a62b6', '861', '刘先生', '2020-05-06 20:34:07', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('7c0c1fa7-ce85-47b6-8c89-ed503d7596db', '170', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('843e1b77-68cc-42e0-b72e-be6f9231cf7c', '66', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('876bccf0-f121-48ce-8b0b-83006775613d', '720', '刘先生', '2020-05-06 20:34:07', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'PAID');
INSERT INTO `t_order` VALUES ('87fe0be9-f1d2-463a-8daa-876b8bf26a01', '703', '刘先生', '2020-05-06 20:34:21', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'SHIPED');
INSERT INTO `t_order` VALUES ('8f29aeaa-ae07-4c7f-abf5-593375d078ec', '455', '刘先生', '2020-05-06 20:34:17', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xs max', 'SHIPED');
INSERT INTO `t_order` VALUES ('91f3752c-1bc5-43a6-beaf-29c1f822fde6', '165', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('981bb0f3-3467-468c-ae00-fbcaa3b77070', '361', '刘先生', '2020-05-06 20:34:17', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('a3d09dd8-7cfc-433e-93d3-67ce87301bdd', '408', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('a4df0790-0afc-4f64-8a0e-fc666b7a2f65', '6000', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('a9273d0c-feb4-426b-9636-703b030c0183', '6000', '刘先生', '2020-05-06 20:34:07', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('aed771bf-a68f-429e-84a8-8c583647f9ea', '451', '刘先生', '2020-05-06 20:34:20', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('b858a2ae-e588-4230-9098-d3481a958b55', '657', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'SHIPED');
INSERT INTO `t_order` VALUES ('bcff4f41-25d1-4cab-88c9-cc882e979652', '132', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone xr', 'CREATED');
INSERT INTO `t_order` VALUES ('c1e68eda-4706-4a8b-84b7-899915b82b47', '487', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('c24c463d-7731-4c71-901a-bcc3e87d7c34', '240', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('cb26c3c6-6241-47ab-9eb1-29da16a0946f', '640', '刘先生', '2020-05-06 20:34:17', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('d643c1c6-9ca2-4493-828d-75b4c687711b', '680', '刘先生', '2020-05-06 20:34:21', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('d64feaa2-d90c-4748-b3ce-7a294e4d337b', '579', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('e7c8b1fb-0936-408d-b664-12df311d40b6', '854', '刘先生', '2020-05-06 20:34:18', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('eea688e8-5a67-4268-bc04-9bebbf65f95d', '733', '刘先生', '2020-05-06 20:34:19', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('f09cea82-3b62-455c-a97d-3828133ceb9f', '205', '刘先生', '2020-05-06 20:34:21', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('fcb94cf7-235a-4645-845e-f178a6af1701', '625', '刘先生', '2020-05-06 20:34:23', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('fcf7bb9b-2a8c-4ae1-8794-3a67ab1c79af', '711', '刘先生', '2020-05-06 20:34:21', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');
INSERT INTO `t_order` VALUES ('fdca2798-6480-4c9c-9bbc-88cf01c4764e', '779', '刘先生', '2020-05-06 20:34:22', 'ORDERNO2020050766', '李先生', '1b18f988-f276-4643-98e8-c21122aceb48', 'iphone-xs', 'CREATED');

-- ----------------------------
-- Table structure for t_sku
-- ----------------------------
DROP TABLE IF EXISTS `t_sku`;
CREATE TABLE `t_sku` (
  `id` varchar(36) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `ship_fee` int(11) DEFAULT NULL,
  `spec` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sku
-- ----------------------------
INSERT INTO `t_sku` VALUES ('09472bc7-d9d9-4241-b5f9-32e558ae2df9', '451', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '451', '10', '黑色');
INSERT INTO `t_sku` VALUES ('0f59a5bf-63b0-43fd-835c-1512a5e99f55', '657', '2020-05-06 20:27:27', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '657', '10', '黑色');
INSERT INTO `t_sku` VALUES ('13616a4d-7925-4231-94fe-a5b4d9162d88', '132', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '132', '10', '黑色');
INSERT INTO `t_sku` VALUES ('189ddf4b-f5d6-4765-b670-5ffa9cf76f51', '487', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '487', '10', '黑色');
INSERT INTO `t_sku` VALUES ('1b18f988-f276-4643-98e8-c21122aceb48', '240', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '240', '10', '黑色');
INSERT INTO `t_sku` VALUES ('20467d88-4150-45cb-be9f-c4bde2ce971b', '640', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '640', '10', '黑色');
INSERT INTO `t_sku` VALUES ('2100e092-0c8b-48a3-b566-01cb147fe5c0', '680', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8', '680', '10', '黑色');
INSERT INTO `t_sku` VALUES ('21d19fe6-ac09-46d9-9d8b-4c2c4e167e0a', '579', '2020-05-06 20:27:33', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '579', '10', '黑色');
INSERT INTO `t_sku` VALUES ('2a370eb4-fac2-4fd6-b2bc-b6f499d8dade', '854', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '854', '10', '黑色');
INSERT INTO `t_sku` VALUES ('333a3b76-c118-4e7e-831d-63d3b4c7d1dd', '733', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '733', '10', '黑色');
INSERT INTO `t_sku` VALUES ('3ba384ba-e8ac-4857-ba0a-ff586951806b', '205', '2020-05-06 20:27:33', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '205', '10', '黑色');
INSERT INTO `t_sku` VALUES ('3f4dd267-788f-494d-83eb-f6f9c27634ff', '625', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '625', '10', '金色');
INSERT INTO `t_sku` VALUES ('40ad0a6c-711f-4441-9ffc-6cce2f945a55', '711', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '711', '10', '金色');
INSERT INTO `t_sku` VALUES ('411ee4a8-fc0c-47ac-b6a9-eee330446289', '779', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '779', '10', '金色');
INSERT INTO `t_sku` VALUES ('5104a0cc-8872-4c8c-81f6-510e3f1f858b', '861', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone 8 plus', '861', '10', '金色');
INSERT INTO `t_sku` VALUES ('51600bf9-ab09-48a1-9dc6-1fbfaba138fd', '170', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '170', '10', '金色');
INSERT INTO `t_sku` VALUES ('6922f77c-43ce-4389-acb8-19ec263da37c', '66', '2020-05-06 20:27:40', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '66', '10', '金色');
INSERT INTO `t_sku` VALUES ('6d88f119-4956-4bfc-8911-8e96496581c5', '720', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '720', '10', '银色');
INSERT INTO `t_sku` VALUES ('713f20cb-423f-4ddf-8753-e132177822a4', '703', '2020-05-06 20:27:40', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '703', '10', '银色');
INSERT INTO `t_sku` VALUES ('78104dcc-3d32-4a09-9179-e180e42acc8e', '455', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '455', '10', '银色');
INSERT INTO `t_sku` VALUES ('7aff894a-0690-4b0c-85ec-a71df5e44811', '165', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '165', '10', '银色');
INSERT INTO `t_sku` VALUES ('7db66f45-954c-4962-8f9f-a0bfcc54e8e8', '361', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '361', '10', '银色');
INSERT INTO `t_sku` VALUES ('824551d2-4021-4ec7-9a07-1092238888aa', '408', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '408', '10', '银色');
INSERT INTO `t_sku` VALUES ('851fd5ab-12c4-4803-a97c-91d4ead02730', '59', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xs max', '59', '10', '银色');
INSERT INTO `t_sku` VALUES ('857b99d7-42bd-4458-b871-80e89fb38530', '872', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '872', '10', '银色');
INSERT INTO `t_sku` VALUES ('92052ef7-2020-4f82-904d-37863558e81d', '583', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '583', '10', '银色');
INSERT INTO `t_sku` VALUES ('a7b73385-694a-41d0-87ce-10adfe5d9415', '298', '2020-05-06 20:27:40', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '298', '10', '红色');
INSERT INTO `t_sku` VALUES ('c198214c-97af-4840-9393-0bc1743bacf9', '641', '2020-05-06 20:27:42', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '641', '10', '红色');
INSERT INTO `t_sku` VALUES ('d381643c-45ab-4800-9680-cb2a24b65ec4', '509', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '509', '10', '红色');
INSERT INTO `t_sku` VALUES ('d41b7bb5-a5d1-4b2d-a0e4-82a81c7154b9', '623', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '623', '10', '红色');
INSERT INTO `t_sku` VALUES ('d7149007-bd25-4f9c-9848-5e72cbb674c7', '690', '2020-05-06 20:27:32', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '690', '10', '红色');
INSERT INTO `t_sku` VALUES ('db616997-90ed-4c0a-814f-32b1e4456ee4', '681', '2020-05-06 20:27:41', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone xr', '681', '10', '红色');
INSERT INTO `t_sku` VALUES ('ddc89ebf-8ad2-4ee1-a398-a9d360ea66d1', '433', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '433', '10', '红色');
INSERT INTO `t_sku` VALUES ('e3cf1933-4332-4aa0-b5b3-cbab3d908aa8', '124', '2020-05-06 20:27:33', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '124', '10', '红色');
INSERT INTO `t_sku` VALUES ('e59b70b5-8cb3-42f5-80fc-0ed56bbd3b05', '220', '2020-05-06 20:27:29', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '220', '10', '红色');
INSERT INTO `t_sku` VALUES ('ed8fa599-acc9-41a6-8506-d8ff8668e3d6', '728', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '728', '10', '红色');
INSERT INTO `t_sku` VALUES ('f1aec4dc-b2c3-4a48-98fc-2099ddc2abc5', '281', '2020-05-06 20:27:31', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '281', '10', '红色');
INSERT INTO `t_sku` VALUES ('fefc04ea-f3e3-4399-a96a-e801e9ebbb14', '122', '2020-05-06 20:27:30', 'https://lin-xin.gitee.io/images/post/node3.png', 'iphone-xs', '122', '10', '红色');
