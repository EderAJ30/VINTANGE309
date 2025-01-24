SET NAMES 'UTF8MB4';
DROP DATABASE IF EXISTS vintange309;
CREATE DATABASE IF NOT EXISTS vintange309 DEFAULT CHARACTER SET UTF8MB4;
USE vintange309;

-- Crear tabla roles
CREATE TABLE roles (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Crear tabla direcciones
CREATE TABLE direcciones (
  id_direccion INT AUTO_INCREMENT PRIMARY KEY,
  calle VARCHAR(100),
  ciudad VARCHAR(50),
  estado VARCHAR(50),
  codigo_postal VARCHAR(10)
);

-- Crear tabla tarjetas
CREATE TABLE tarjetas (
  id_tarjeta INT AUTO_INCREMENT PRIMARY KEY,
  numero_tarjeta VARCHAR(16) NOT NULL,
  nombre_titular VARCHAR(50),
  fecha_expiracion DATE,
  cvv VARCHAR(4)
);

-- Crear tabla usuarios
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  correo VARCHAR(50) UNIQUE NOT NULL,
  numero VARCHAR(10) UNIQUE NOT NULL,
  contrasenia VARCHAR(10) NOT NULL,
  token VARCHAR(50) NOT NULL,
  id_rol INT,
  id_direccion INT,
  id_tarjetas INT,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_rol) REFERENCES roles(id_rol),
  FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion),
  FOREIGN KEY (id_tarjetas) REFERENCES tarjetas(id_tarjeta)
);

-- Crear tabla productos
CREATE TABLE productos (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  imagen VARCHAR(255) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(10, 2) NOT NULL,
  costo DECIMAL(10, 2) NOT NULL,
  stock INT(4) NOT NULL,
  estado ENUM('Activo', 'Inactivo') NOT NULL,
  id_marca INT,
  id_categoria INT,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Crear tabla metodo_de_pago
CREATE TABLE metodo_de_pago (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  estado ENUM('Principal', 'Secundaria') NOT NULL,
  tipo_pago ENUM('tarjeta', 'transferencia', 'paypal'),
  id_tarjeta INT,
  FOREIGN KEY (id_tarjeta) REFERENCES tarjetas(id_tarjeta)
);

-- Crear tabla metodo_de_envio
CREATE TABLE metodo_de_envio (
  id_envio INT AUTO_INCREMENT PRIMARY KEY,
  metodo VARCHAR(50) NOT NULL
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  fecha_de_pedido DATETIME NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  id_pago INT,
  id_envio INT,
  id_usuario INT,
  estado ENUM('pendiente', 'completado'),
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_pago) REFERENCES metodo_de_pago(id_pago),
  FOREIGN KEY (id_envio) REFERENCES metodo_de_envio(id_envio),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear tabla detalle_pedidos
CREATE TABLE detalle_pedidos (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_pedido INT,
  id_producto INT,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Crear tabla categorias
CREATE TABLE categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(50) NOT NULL
);

-- Crear tabla productos_categorias
CREATE TABLE productos_categorias (
  id_producto INT,
  id_categoria INT,
  PRIMARY KEY (id_producto, id_categoria),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Crear tabla tallas
CREATE TABLE tallas (
  id_talla INT AUTO_INCREMENT PRIMARY KEY,
  talla VARCHAR(10) 
);

-- Crear tabla productos_tallas
CREATE TABLE productos_tallas (
  id_producto INT,
  id_talla INT,
  stock_talla INT NOT NULL,
  PRIMARY KEY (id_producto, id_talla),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
  FOREIGN KEY (id_talla) REFERENCES tallas(id_talla)
);

-- Crear tabla historial_compras
CREATE TABLE historial_compras (
  id_historial INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  id_pedido INT,
  fecha DATETIME NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  estado ENUM('pendiente', 'enviado', 'entregado', 'cancelado') NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- Crear tabla carrito
CREATE TABLE carrito (
  id_carrito INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario INT,
  estado ENUM('Activo', 'Inactivo') NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Crear tabla detalle_carrito
CREATE TABLE detalle_carrito (
  id_detalle_carrito INT AUTO_INCREMENT PRIMARY KEY,
  id_carrito INT,
  id_producto INT,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10, 2) NOT NULL,
  subtotal DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- agregamos las tallas de los productos

INSERT INTO tallas (id_talla, talla) 
VALUES 
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'XXL');

INSERT INTO categorias (id_categoria, nombre_categoria) 
VALUES 
(1, 'Playeras'),
(2, 'Chamarras'),
(3, 'Pantalones'),
(4, 'Sudaderas'),
(5, 'Gorras'),
(6, 'Accesorios');

INSERT INTO productos (id_producto, nombre, imagen, descripcion, precio, costo, stock, estado, id_marca, id_categoria)
VALUES 
(1, 'Playera Básica', 'imagen1.jpg', 'Playera cómoda y ligera.', 199.99, 100.00, 50, 'Activo', 1, 1),
(2, 'Chamarra Casual', 'imagen2.jpg', 'Chamarra ideal para invierno.', 799.99, 400.00, 30, 'Activo', 2, 2),
(3, 'Pantalón Slim Fit', 'imagen3.jpg', 'Pantalón moderno y ajustado.', 499.99, 250.00, 40, 'Activo', 3, 3),
(4, 'Sudadera Deportiva', 'imagen4.jpg', 'Sudadera para actividades físicas.', 599.99, 300.00, 20, 'Activo', 4, 4),
(5, 'Gorra Negra', 'imagen5.jpg', 'Gorra clásica de color negro.', 149.99, 80.00, 60, 'Activo', 5, 5),
(6, 'Reloj Deportivo', 'imagen6.jpg', 'Reloj práctico y resistente.', 999.99, 500.00, 10, 'Activo', 6, 6);

INSERT INTO productos_categorias (id_producto, id_categoria)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

INSERT INTO productos_tallas (id_producto, id_talla, stock_talla)
VALUES 
(1, 1, 10), -- XS
(1, 2, 10), -- S
(1, 3, 10), -- M
(1, 4, 10), -- L
(1, 5, 5),  -- XL
(1, 6, 5),  -- XXL

(2, 1, 5),  -- XS
(2, 2, 5),  -- S
(2, 3, 5),  -- M
(2, 4, 5),  -- L
(2, 5, 5),  -- XL
(2, 6, 5),  -- XXL

(3, 1, 10), -- XS
(3, 2, 10), -- S
(3, 3, 10), -- M
(3, 4, 10), -- L
(3, 5, 5),  -- XL
(3, 6, 5),  -- XXL

(4, 1, 5),  -- XS
(4, 2, 5),  -- S
(4, 3, 5),  -- M
(4, 4, 5),  -- L
(4, 5, 5),  -- XL
(4, 6, 5),  -- XXL

(5, 1, 15), -- XS
(5, 2, 15), -- S
(5, 3, 15), -- M
(5, 4, 10), -- L
(5, 5, 10), -- XL
(5, 6, 5),  -- XXL

(6, 1, 2),  -- XS
(6, 2, 2),  -- S
(6, 3, 2),  -- M
(6, 4, 2),  -- L
(6, 5, 1),  -- XL
(6, 6, 1);  -- XXL