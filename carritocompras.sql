/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : carritocompras

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-11-02 17:26:15
*/

SET FOREIGN_KEY_CHECKS=0;
drop database if exists carritocompras;
create database carritocompras;
use carritocompras;
-- ----------------------------
-- Table structure for categoria
-- ----------------------------
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `nombre_EN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of categoria
-- ----------------------------
INSERT INTO `categoria` VALUES ('1', 'Reposter&iacute;a', 'Pastry');
INSERT INTO `categoria` VALUES ('2', 'Decoraci&oacute;n', 'Decoration');
INSERT INTO `categoria` VALUES ('3', 'Cuberter&iacute;a', 'Cutlery');
INSERT INTO `categoria` VALUES ('4', 'Pi&ntildeatas', 'Pi&ntildeatas');
INSERT INTO `categoria` VALUES ('5', 'Dulces', 'Candy');
INSERT INTO `categoria` VALUES ('6', 'Animadores', 'Party Animators');

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `numeroventa` int(11) NOT NULL,
  `cantidad` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `subtotal` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `idproducto` (`idproducto`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `fk_compras_productos` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_compras_usuarios` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES ('20', '6', '2', '14', '1', '9.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('21', '8', '2', '14', '1', '4.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('22', '1', '2', '14', '1', '10.5', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('23', '5', '2', '15', '1', '9.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('24', '4', '1', '16', '1', '3.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('25', '8', '2', '17', '1', '4.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('26', '5', '2', '18', '1', '9.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('27', '8', '2', '18', '2', '9.98', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('28', '5', '2', '19', '1', '9.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('29', '3', '2', '19', '1', '7.99', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('30', '1', '2', '19', '1', '10.5', '2015-11-02 14:54:28');
INSERT INTO `compras` VALUES ('31', '5', '2', '20', '1', '9.99', '2015-11-02 14:54:50');
INSERT INTO `compras` VALUES ('32', '1', '2', '21', '1', '10.5', '2015-11-02 15:02:54');
INSERT INTO `compras` VALUES ('33', '3', '2', '22', '1', '7.99', '2015-11-02 15:53:52');
INSERT INTO `compras` VALUES ('34', '1', '2', '23', '1', '10.5', '2015-11-02 16:15:47');
INSERT INTO `compras` VALUES ('35', '3', '2', '24', '1', '7.99', '2015-11-02 16:24:53');
INSERT INTO `compras` VALUES ('36', '8', '2', '24', '1', '4.99', '2015-11-02 16:24:53');
INSERT INTO `compras` VALUES ('37', '8', '2', '25', '1', '4.99', '2015-11-02 16:43:12');
INSERT INTO `compras` VALUES ('38', '2', '2', '25', '1', '5.99', '2015-11-02 16:43:12');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) DEFAULT NULL,
  `nombre` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `nombre_EN` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion_EN` varchar(255) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `imagen` text COLLATE utf8mb4_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`idcategoria`),
  CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES ('1', '5', 'Bolsa de gomitas azucaradas', 'Sugary Jelly Beans', 'Tan saborsas como coloridas<br>1 bolsa de 0.5 lbs de gomitas azucaradas para fiestas, aniversarios, reuniones, etc.', 'As yummy as colorful <br> 1 bag of 0.5 lbs of jelly beans for parties, anniversaries, reunions, etc.', 'gomitas.jpg', '10.5');
INSERT INTO `productos` VALUES ('2', '5', 'Paquete dulces cute', 'Cute Candies Package', 'Dulces cute, la mejor forma de expresar lo que sientes es con dulces<br>Paquete 1 lb de dulces cute <br>Sabores: <ul><li>Fresa</li><li>Uva</li><li>Melocot&oacute;n</li><li>Manzana</li></ul>', 'Cute candies, the best way of express your feelings is with candies <br> 1 lb Package of Cute candies <br> Flavours: <ul><li>Strawberry</li><li>Grape</li><li>Watermelon</li><li>Apple</li></ul>', 'cute.png', '5.99');
INSERT INTO `productos` VALUES ('3', '2', 'Globos 10 pulgadas x50', 'Ballons 10 inch x50', 'Paquete de globos de 10 pulgadas inflados para celebraciones y cumplea&ntilde;os.<br>El paquete contiene 50 unidades', 'Balloons Package of 10 inch when inflated for any kind of celebrations and birthdays. <br> The package contains 50 units', 'globos.jpg', '7.99');
INSERT INTO `productos` VALUES ('4', '3', 'Utensilios de mesa blancos', 'White Tablewares', 'Utensilios de mesa de plastico color blanco', 'Tablewares color: white', 'curbeteria.jpg', '3.99');
INSERT INTO `productos` VALUES ('5', '1', 'Orden de cupcakes', 'Cupckakes Order', 'Orden de cupcakes de chocolate con toping de caramelo, listos para servir <br> Para fiestas, celebraciones, aniversarios, bodas o por degustaci&oacute;n propia', 'Cupcakes Order of chocolate with caramel topping, ready to serve.<br> For parties, celebrations, anniversaries, weddings o just for tasting', 'cupcake.jpg', '9.99');
INSERT INTO `productos` VALUES ('6', '4', 'Pi&ntilde;ata de minion', 'Minion Piñata', 'Pi&ntilde;ata de minion para celebraciones de fiestas de cumplea&ntilde;os o aniversarios<br>Dimensiones: 0.5 m alto', 'Minion pi&ntilde;ata for celebration parties, bithday parties o arnniversaries. <br> Dimensions: 0.5 m high', 'pinata-minion.jpg', '9.99');
INSERT INTO `productos` VALUES ('7', '6', 'Animador Titiritero Don\'t Hug Me I\'m Scared', 'Animator Don\'t Hug Me I\'m Scared Puppeter', 'Titiritero con su serie de marionetas Don\'t Hug Me I\'m Scared <br> Ofrece varios actos con los titeres: <br> - Yellow Guy <br> - Red Guy y <br> - Green Guy ', 'Puppeter with the puppets of the series Don\'t Hug Me I\'m Scared <br> Offers varios performances whith the following puppets: <br>  - Yellow Guy <br> - Red Guy y <br> - Green Guy ', 'hugme.jpg', '49.99');
INSERT INTO `productos` VALUES ('8', '2', 'Guirnaldas Cumplea&ntilde;eras', 'Birthday Garlands', 'Guirnaldas para decoraci&oacute;n en fiestas de cumplea&ntilde;os, paquete surtido con distintas formas y colores', 'Garlands for birthdays celebration, this package containts various colours and shapes of garlands', 'guirnalda.jpg', '4.99');
INSERT INTO `productos` VALUES ('9', '5', 'M&M Personalizados', 'Custom M&M', 'M&M personalizados para adaptarse a la fiesta o situacion correcta, disponible en rosado y azul', 'Custom M&M available in pink and blue whener the situation demands it', 'm and m.jpg', '2.99');
INSERT INTO `productos` VALUES ('10', '1', 'Pastel de Cumplea&ntilde;os', 'Birthday cake', 'Pastel de cumplea&ntilde;os de chocolate con cubierta de vainilla tama&ntilde;o mediano<br>Incluye dedicatoria, velas y decoracion', 'Chocolate Birthday cake with a layer of vanilla, medium size.<br>Includes a quote, candles and decoration', 'birthday-cake.jpg', '14.99');
INSERT INTO `productos` VALUES ('11', '1', 'Pastel de Arcoiris', 'Rainbow Cake', 'Pastel de arcoiris con tantos sabores como colores tiene el arcoiris<br>Perfecto para fiestas de cumplea&ntilde;os y/o aniversarios', 'Rainbow cake with flavors as color has the rainbow<br> Perfect for birthday parties and/or aniversaries', 'rainbow-cake.jpg', '14.99');
INSERT INTO `productos` VALUES ('12', '2', 'Florero de origami', 'Origami flower base', 'Florero de oigami para decorar fiestas con o sin tem&aacute;tica<br><br> Se ofrece diferentes tipos de colores y estilos de flores', 'Origami flower base for party decoration with or without theme<br><br>We offer different types of flowers en multiple colors', 'florero.jpg', '4.99');
INSERT INTO `productos` VALUES ('13', '3', 'Cubiertos decorados', 'Decorated Cutlery', 'Cubiertos de plastico decorados con listones de colores', 'Decorated clutery with coloful ribbons', 'cubierto-decorado.jpg', '3.99');
INSERT INTO `productos` VALUES ('14', '4', 'Pi&ntilde;ata para fiestas tradicional', 'Traditional party pi&ntilde;ata', 'Pi&ntilde;ata para fiestas tradicional, no incluye dulces<br>Dimensiones: 0.5 m alto', 'Traditional party pi&ntilde;ata, candies not included<br>Dimensions: 0.5 m tall', 'pinata-fiestas.png', '9.99');
INSERT INTO `productos` VALUES ('15', '6', 'Animadores pantilla Yo Gabba Gabba', 'Yo Gabba Gabba crew Animators', 'Animadores de la famosa serie de televisi&oacute;n infantil Yo Gabba Gabba', 'Animator form the famous tv show Yo Gabba Gabba', 'yo-gabba.jpg', '49.99');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Imagen` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'Moises', 'Montano', 'Moises', '123', 'imagen.jpg');
INSERT INTO `usuarios` VALUES ('2', 'Luis', 'Jovel', 'luis_jovel', '123456', '');

-- ----------------------------
-- Table structure for visita
-- ----------------------------
DROP TABLE IF EXISTS `visita`;
CREATE TABLE `visita` (
  `idvisita` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idvisita`),
  KEY `idproducto` (`idproducto`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of visita
-- ----------------------------
INSERT INTO `visita` VALUES ('1', '5', '2', '2015-11-01 20:08:09');
INSERT INTO `visita` VALUES ('15', '5', '2', '2015-11-01 20:15:31');
INSERT INTO `visita` VALUES ('16', '5', '2', '2015-11-01 20:16:37');
INSERT INTO `visita` VALUES ('17', '5', '2', '2015-11-01 20:16:40');
INSERT INTO `visita` VALUES ('18', '5', '2', '2015-11-01 20:16:54');
INSERT INTO `visita` VALUES ('19', '5', '2', '2015-11-01 20:17:26');
INSERT INTO `visita` VALUES ('20', '5', '2', '2015-11-01 20:17:48');
INSERT INTO `visita` VALUES ('21', '5', '2', '2015-11-01 20:17:59');
INSERT INTO `visita` VALUES ('22', '5', '2', '2015-11-01 20:18:06');
INSERT INTO `visita` VALUES ('23', '5', '2', '2015-11-01 20:21:01');
INSERT INTO `visita` VALUES ('24', '5', '2', '2015-11-01 20:27:24');
INSERT INTO `visita` VALUES ('25', '3', '2', '2015-11-01 22:08:02');
INSERT INTO `visita` VALUES ('26', '3', '2', '2015-11-01 22:08:12');
INSERT INTO `visita` VALUES ('27', '8', '2', '2015-11-01 22:08:20');
INSERT INTO `visita` VALUES ('28', '8', '2', '2015-11-01 22:08:24');
INSERT INTO `visita` VALUES ('29', '4', '2', '2015-11-01 22:08:36');
INSERT INTO `visita` VALUES ('30', '6', '2', '2015-11-01 22:08:47');
INSERT INTO `visita` VALUES ('31', '2', '2', '2015-11-01 22:08:57');
INSERT INTO `visita` VALUES ('32', '2', '2', '2015-11-01 22:11:40');
INSERT INTO `visita` VALUES ('33', '2', '2', '2015-11-01 22:13:49');
INSERT INTO `visita` VALUES ('34', '2', '2', '2015-11-01 22:14:11');
INSERT INTO `visita` VALUES ('35', '2', '2', '2015-11-01 22:26:41');
INSERT INTO `visita` VALUES ('36', '2', '2', '2015-11-01 22:26:56');
INSERT INTO `visita` VALUES ('37', '2', '2', '2015-11-01 22:27:02');
INSERT INTO `visita` VALUES ('38', '2', '2', '2015-11-01 22:27:46');
INSERT INTO `visita` VALUES ('39', '2', '2', '2015-11-01 22:27:47');
INSERT INTO `visita` VALUES ('40', '2', '2', '2015-11-01 22:27:47');
INSERT INTO `visita` VALUES ('41', '2', '2', '2015-11-01 22:27:48');
INSERT INTO `visita` VALUES ('42', '2', '2', '2015-11-01 22:27:48');
INSERT INTO `visita` VALUES ('43', '2', '2', '2015-11-01 22:27:49');
INSERT INTO `visita` VALUES ('44', '2', '2', '2015-11-01 22:28:38');
INSERT INTO `visita` VALUES ('45', '2', '2', '2015-11-01 22:28:41');
INSERT INTO `visita` VALUES ('46', '2', '2', '2015-11-01 22:28:55');
INSERT INTO `visita` VALUES ('47', '2', '2', '2015-11-01 22:30:34');
INSERT INTO `visita` VALUES ('48', '2', '2', '2015-11-01 22:30:35');
INSERT INTO `visita` VALUES ('49', '2', '2', '2015-11-01 22:30:36');
INSERT INTO `visita` VALUES ('50', '2', '2', '2015-11-01 22:31:22');
INSERT INTO `visita` VALUES ('51', '2', '2', '2015-11-01 22:31:23');
INSERT INTO `visita` VALUES ('52', '2', '2', '2015-11-01 22:31:23');
INSERT INTO `visita` VALUES ('53', '2', '2', '2015-11-01 22:31:23');
INSERT INTO `visita` VALUES ('54', '2', '2', '2015-11-01 22:31:24');
INSERT INTO `visita` VALUES ('55', '2', '2', '2015-11-01 22:31:24');
INSERT INTO `visita` VALUES ('56', '2', '2', '2015-11-01 22:32:23');
INSERT INTO `visita` VALUES ('57', '2', '2', '2015-11-01 22:32:24');
INSERT INTO `visita` VALUES ('58', '2', '2', '2015-11-01 22:32:24');
INSERT INTO `visita` VALUES ('59', '2', '2', '2015-11-01 22:32:25');
INSERT INTO `visita` VALUES ('60', '8', '2', '2015-11-01 22:36:09');
INSERT INTO `visita` VALUES ('61', '6', '2', '2015-11-01 22:36:14');
INSERT INTO `visita` VALUES ('62', '4', '2', '2015-11-01 22:37:41');
INSERT INTO `visita` VALUES ('63', '4', '2', '2015-11-01 22:38:41');
INSERT INTO `visita` VALUES ('64', '4', '2', '2015-11-01 22:38:42');
INSERT INTO `visita` VALUES ('65', '5', '2', '2015-11-01 22:38:49');
INSERT INTO `visita` VALUES ('66', '8', '2', '2015-11-01 22:38:53');
INSERT INTO `visita` VALUES ('67', '2', '2', '2015-11-01 22:43:39');
INSERT INTO `visita` VALUES ('68', '5', '2', '2015-11-01 22:44:09');
INSERT INTO `visita` VALUES ('69', '4', '2', '2015-11-01 22:44:18');
INSERT INTO `visita` VALUES ('70', '4', '2', '2015-11-01 22:44:46');
INSERT INTO `visita` VALUES ('71', '4', '2', '2015-11-01 22:45:35');
INSERT INTO `visita` VALUES ('72', '4', '2', '2015-11-01 22:46:19');
INSERT INTO `visita` VALUES ('73', '4', '2', '2015-11-01 22:50:13');
INSERT INTO `visita` VALUES ('74', '4', '2', '2015-11-01 22:50:13');
INSERT INTO `visita` VALUES ('75', '4', '2', '2015-11-01 22:50:14');
INSERT INTO `visita` VALUES ('76', '4', '2', '2015-11-01 22:50:14');
INSERT INTO `visita` VALUES ('77', '4', '2', '2015-11-01 22:50:15');
INSERT INTO `visita` VALUES ('78', '4', '2', '2015-11-01 22:50:16');
INSERT INTO `visita` VALUES ('79', '4', '2', '2015-11-01 22:50:17');
INSERT INTO `visita` VALUES ('80', '1', '2', '2015-11-01 22:51:01');
INSERT INTO `visita` VALUES ('81', '7', '2', '2015-11-01 22:51:24');
INSERT INTO `visita` VALUES ('82', '2', '2', '2015-11-01 22:51:41');
INSERT INTO `visita` VALUES ('83', '3', '2', '2015-11-01 22:51:56');
INSERT INTO `visita` VALUES ('84', '3', '2', '2015-11-01 22:52:08');
INSERT INTO `visita` VALUES ('85', '3', '2', '2015-11-01 22:52:10');
INSERT INTO `visita` VALUES ('86', '8', '2', '2015-11-01 22:52:21');
INSERT INTO `visita` VALUES ('87', '6', '2', '2015-11-01 22:53:12');
INSERT INTO `visita` VALUES ('88', '3', '2', '2015-11-01 22:53:21');
INSERT INTO `visita` VALUES ('89', '3', '2', '2015-11-01 22:54:36');
INSERT INTO `visita` VALUES ('90', '2', '2', '2015-11-01 22:54:45');
INSERT INTO `visita` VALUES ('91', '3', '2', '2015-11-01 22:54:48');
INSERT INTO `visita` VALUES ('92', '5', '2', '2015-11-01 22:54:51');
INSERT INTO `visita` VALUES ('93', '1', '2', '2015-11-01 22:54:55');
INSERT INTO `visita` VALUES ('94', '3', '2', '2015-11-01 22:55:45');
INSERT INTO `visita` VALUES ('95', '8', '2', '2015-11-01 22:57:18');
INSERT INTO `visita` VALUES ('96', '8', '2', '2015-11-01 22:57:28');
INSERT INTO `visita` VALUES ('97', '8', '2', '2015-11-01 23:03:55');
INSERT INTO `visita` VALUES ('98', '8', '2', '2015-11-01 23:20:59');
INSERT INTO `visita` VALUES ('99', '8', '2', '2015-11-01 23:21:18');
INSERT INTO `visita` VALUES ('100', '8', '2', '2015-11-01 23:21:19');
INSERT INTO `visita` VALUES ('101', '8', '2', '2015-11-01 23:21:21');
INSERT INTO `visita` VALUES ('102', '3', '2', '2015-11-01 23:21:23');
INSERT INTO `visita` VALUES ('103', '5', '2', '2015-11-01 23:21:25');
INSERT INTO `visita` VALUES ('104', '5', '1', '2015-11-01 23:21:52');
INSERT INTO `visita` VALUES ('105', '3', '1', '2015-11-01 23:21:55');
INSERT INTO `visita` VALUES ('106', '8', '1', '2015-11-01 23:21:58');
INSERT INTO `visita` VALUES ('107', '4', '1', '2015-11-01 23:22:01');
INSERT INTO `visita` VALUES ('108', '7', '1', '2015-11-01 23:22:09');
INSERT INTO `visita` VALUES ('109', '5', '1', '2015-11-01 23:22:14');
INSERT INTO `visita` VALUES ('110', '3', '1', '2015-11-01 23:34:36');
INSERT INTO `visita` VALUES ('111', '1', '2', '2015-11-02 01:34:47');
INSERT INTO `visita` VALUES ('112', '3', '1', '2015-11-02 01:35:07');
INSERT INTO `visita` VALUES ('113', '5', '1', '2015-11-02 01:35:09');
INSERT INTO `visita` VALUES ('114', '7', '1', '2015-11-02 01:35:10');
INSERT INTO `visita` VALUES ('115', '4', '1', '2015-11-02 01:35:11');
INSERT INTO `visita` VALUES ('116', '8', '1', '2015-11-02 01:35:14');
INSERT INTO `visita` VALUES ('117', '8', '1', '2015-11-02 01:46:29');
INSERT INTO `visita` VALUES ('118', '5', '1', '2015-11-02 01:46:31');
INSERT INTO `visita` VALUES ('119', '5', '1', '2015-11-02 01:48:52');
INSERT INTO `visita` VALUES ('120', '6', '1', '2015-11-02 02:04:09');
INSERT INTO `visita` VALUES ('121', '6', '1', '2015-11-02 02:04:49');
INSERT INTO `visita` VALUES ('122', '6', '1', '2015-11-02 02:05:13');
INSERT INTO `visita` VALUES ('123', '6', '1', '2015-11-02 02:05:23');
INSERT INTO `visita` VALUES ('124', '1', '2', '2015-11-02 02:51:49');
INSERT INTO `visita` VALUES ('125', '5', '1', '2015-11-02 02:53:35');
INSERT INTO `visita` VALUES ('126', '7', '1', '2015-11-02 02:53:37');
INSERT INTO `visita` VALUES ('127', '5', '2', '2015-11-02 13:41:50');
INSERT INTO `visita` VALUES ('128', '5', '2', '2015-11-02 13:43:50');
INSERT INTO `visita` VALUES ('129', '5', '2', '2015-11-02 13:48:14');
INSERT INTO `visita` VALUES ('130', '5', '2', '2015-11-02 13:48:35');
INSERT INTO `visita` VALUES ('131', '5', '2', '2015-11-02 13:51:27');
INSERT INTO `visita` VALUES ('132', '5', '2', '2015-11-02 13:51:28');
INSERT INTO `visita` VALUES ('133', '5', '2', '2015-11-02 13:54:00');
INSERT INTO `visita` VALUES ('134', '5', '2', '2015-11-02 13:54:02');
INSERT INTO `visita` VALUES ('135', '5', '2', '2015-11-02 13:54:12');
INSERT INTO `visita` VALUES ('136', '5', '2', '2015-11-02 13:54:20');
INSERT INTO `visita` VALUES ('137', '5', '2', '2015-11-02 13:54:25');
INSERT INTO `visita` VALUES ('138', '5', '2', '2015-11-02 13:55:20');
INSERT INTO `visita` VALUES ('139', '3', '2', '2015-11-02 13:55:36');
INSERT INTO `visita` VALUES ('140', '1', '2', '2015-11-02 13:55:46');
INSERT INTO `visita` VALUES ('141', '5', '2', '2015-11-02 14:54:46');
INSERT INTO `visita` VALUES ('142', '1', '2', '2015-11-02 15:02:48');
INSERT INTO `visita` VALUES ('143', '5', '2', '2015-11-02 15:42:20');
INSERT INTO `visita` VALUES ('144', '3', '2', '2015-11-02 15:42:32');
INSERT INTO `visita` VALUES ('145', '8', '2', '2015-11-02 15:54:21');
INSERT INTO `visita` VALUES ('146', '3', '2', '2015-11-02 15:54:25');
INSERT INTO `visita` VALUES ('147', '3', '2', '2015-11-02 15:54:32');
INSERT INTO `visita` VALUES ('148', '3', '2', '2015-11-02 15:55:39');
INSERT INTO `visita` VALUES ('149', '1', '2', '2015-11-02 16:15:42');
INSERT INTO `visita` VALUES ('150', '3', '2', '2015-11-02 16:24:45');
INSERT INTO `visita` VALUES ('151', '3', '2', '2015-11-02 16:24:49');
INSERT INTO `visita` VALUES ('152', '8', '2', '2015-11-02 16:24:50');
INSERT INTO `visita` VALUES ('153', '2', '2', '2015-11-02 16:43:10');
INSERT INTO `visita` VALUES ('154', '9', '2', '2015-11-02 16:54:52');
INSERT INTO `visita` VALUES ('155', '9', '2', '2015-11-02 16:55:03');
INSERT INTO `visita` VALUES ('156', '11', '2', '2015-11-02 17:01:14');
INSERT INTO `visita` VALUES ('157', '11', '2', '2015-11-02 17:01:48');
INSERT INTO `visita` VALUES ('158', '10', '2', '2015-11-02 17:01:50');
INSERT INTO `visita` VALUES ('159', '12', '2', '2015-11-02 17:12:21');
INSERT INTO `visita` VALUES ('160', '12', '2', '2015-11-02 17:12:38');
INSERT INTO `visita` VALUES ('161', '13', '2', '2015-11-02 17:13:05');
INSERT INTO `visita` VALUES ('162', '14', '2', '2015-11-02 17:18:10');
INSERT INTO `visita` VALUES ('163', '15', '2', '2015-11-02 17:23:27');
INSERT INTO `visita` VALUES ('164', '15', '2', '2015-11-02 17:24:03');
INSERT INTO `visita` VALUES ('165', '14', '2', '2015-11-02 17:24:11');
