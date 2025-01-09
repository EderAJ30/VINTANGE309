SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS vintange309;
CREATE DATABASE IF NOT EXISTS hoteles DEFAULT CHARACTER SET UTF8MB4;
USE vintange309;

CREATE TABLE `roles` (
  `id_rol` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo` varchar(30)
);

CREATE TABLE `usuarios` (
  `id_usuario` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) UNIQUE NOT NULL,
  `numero` varchar(10) UNIQUE NOT NULL,
  `contrasenia` varchar(10) NOT NULL,
  `token` varchar(50) NOT NULL,
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `id_rol` int,
  `id_direccion` int,
  `id_tarjetas` innt
);

CREATE TABLE `direcciones` (
  `id_direccion` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `estado` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `codigo_postal` int(5) NOT NULL,
  `instrucciones` text NOT NULL,
  `tipo` ENUM(Principal,Secundaria) NOT NULL,
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'
);

CREATE TABLE `metodo_de_envio` (
  `id_envio` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `estado` ENUM(Activo,Inactivo) NOT NULL,
  `id_direccion` int
);

CREATE TABLE `tarjetas` (
  `id_tarjeta` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre_en_tarjeta` varchar(30) NOT NULL,
  `numero_en_tarjeta` varchar(19) NOT NULL,
  `vencimiento` DATE NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `direccion` varchar(100)
);

CREATE TABLE `metodo_de_pago` (
  `id_pago` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `estado` ENUM(Principal,Secundaria) NOT NULL,
  `tipo_pago` ENUM(tarjeta,transferencia,paypal),
  `id_tarjeta` int
);

CREATE TABLE `pedidos` (
  `id_pedido` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fecha_de_pedido` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` ENUM(pendiente,completado),
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `id_pago` int,
  `id_envio` int,
  `id_usuario` int
);

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_pedido` int,
  `id_producto` int
);

CREATE TABLE `productos` (
  `id_producto` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `stock` int(4) NOT NULL,
  `estado` ENUM(Activo,Inactivo) NOT NULL,
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `id_marca` int
);

CREATE TABLE `productos_categorias` (
  `id_producto` int,
  `id_categoria` int,
  `PRIMARY` KEY(id_producto,id_categoria) UNIQUE
);

CREATE TABLE `categorias` (
  `id_categoria` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo_categoria` ENUM(playera,chamarra,pantalon,gorra) NOT NULL
);

CREATE TABLE `productos_tallas` (
  `stock_talla` int NOT NULL,
  `id_producto` int,
  `id_talla` int,
  `PRIMARY` KEY(id_producto,id_talla) UNIQUE
);

CREATE TABLE `tallas` (
  `id_talla` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tipo_talla` ENUM(S,M,L,XL) NOT NULL
);

CREATE TABLE `marcas` (
  `id_marca` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL
);

CREATE TABLE `carrito` (
  `id_carrito` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `estado` ENUM(Activo,Inactivo) NOT NULL,
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `id_usuario` int
);

CREATE TABLE `detalle_carrito` (
  `id_detalle_carrito` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_carrito` int,
  `id_producto` int
);

CREATE TABLE `historial_compras` (
  `id_historial` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` ENUM(pendiente,enviado,entregado,cancelado) NOT NULL,
  `creado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP',
  `actualizado_en` datetime COMMENT 'NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
  `id_usuario` int,
  `id_pedido` int
);

ALTER TABLE `usuarios` ADD FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);

ALTER TABLE `direcciones` ADD FOREIGN KEY (`id_direccion`) REFERENCES `usuarios` (`id_direccion`);

ALTER TABLE `tarjetas` ADD FOREIGN KEY (`id_tarjeta`) REFERENCES `usuarios` (`id_tarjetas`);

ALTER TABLE `metodo_de_envio` ADD FOREIGN KEY (`id_direccion`) REFERENCES `direcciones` (`id_direccion`);

ALTER TABLE `metodo_de_pago` ADD FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjetas` (`id_tarjeta`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_pago`) REFERENCES `metodo_de_pago` (`id_pago`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_envio`) REFERENCES `metodo_de_envio` (`id_envio`);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `detalle_pedidos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

ALTER TABLE `productos` ADD FOREIGN KEY (`id_producto`) REFERENCES `detalle_pedidos` (`id_producto`);

ALTER TABLE `productos` ADD FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);

ALTER TABLE `productos_categorias` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `productos_categorias` ADD FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

ALTER TABLE `productos_tallas` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `productos_tallas` ADD FOREIGN KEY (`id_talla`) REFERENCES `tallas` (`id_talla`);

ALTER TABLE `carrito` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `detalle_carrito` ADD FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`);

ALTER TABLE `detalle_carrito` ADD FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`);

ALTER TABLE `historial_compras` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `historial_compras` ADD FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

#insertamos datos