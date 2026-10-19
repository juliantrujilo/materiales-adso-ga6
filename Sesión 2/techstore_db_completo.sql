-- =============================================================================
-- PROYECTO FORMATIVO: TECHSTORE PRO REACT (E-COMMERCE MERN STACK)
-- GUÍA DE APRENDIZAJE 6 (GA6-220501096) — SESIÓN 2: SQL COMPLETO (DDL & DML)
-- FICHA: ADSO 3389010 VIRTUAL — SERVICIO NACIONAL DE APRENDIZAJE (SENA)
-- INSTRUCTOR: JULIÁN ANDRÉS TRUJILLO MORALES
-- EVIDENCIAS: AA2-EV01, AA2-EV02, AA2-EV03 | CORTE 1: 25/10/2026
-- MOTOR COMPATIBLE: MySQL 8.0+ / MariaDB 10.4+ / phpMyAdmin / MySQL Workbench
-- =============================================================================

-- -----------------------------------------------------------------------------
-- PASO 1: DEFINICIÓN DEL SCHEMA Y JUEGO DE CARACTERES INTERNACIONAL (UTF8MB4)
-- -----------------------------------------------------------------------------
DROP DATABASE IF EXISTS techstore_db;
CREATE DATABASE techstore_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE techstore_db;

-- Desactivar temporalmente validaciones de llaves foráneas para reinicio limpio
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------------------------------
-- PASO 2: CREACIÓN DE TABLAS MAESTRAS (ORDEN DDL ESTRICTO: PADRES PRIMERO)
-- -----------------------------------------------------------------------------

-- 2.1. TABLA ROLES DE SEGURIDAD
DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    descripcion VARCHAR(150),
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB COMMENT='Catálogo de roles para control de acceso RBAC';

-- 2.2. TABLA USUARIOS (CLIENTES Y ADMINISTRADORES)
DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(60) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL COMMENT 'Hash bcrypt generado en Node.js',
    telefono VARCHAR(20),
    id_rol INT NOT NULL DEFAULT 1,
    estado ENUM('Activo', 'Inactivo', 'Bloqueado') NOT NULL DEFAULT 'Activo',
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuarios_roles
        FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Cuentas de acceso y perfiles de usuario';

-- 2.3. TABLA CATEGORÍAS DE PRODUCTOS
DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    slug VARCHAR(60) NOT NULL UNIQUE COMMENT 'Identificador URL-friendly (ej: laptops-gaming)',
    nombre VARCHAR(60) NOT NULL UNIQUE,
    descripcion TEXT,
    activo BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB COMMENT='Jerarquía de catálogo de productos';

-- 2.4. TABLA PRODUCTOS CON RESTRICCIONES CHECK Y FK
DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(35) NOT NULL UNIQUE COMMENT 'Stock Keeping Unit único de inventario',
    nombre VARCHAR(120) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(12,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_categoria INT NOT NULL,
    estado ENUM('Disponible', 'Agotado', 'Descontinuado') NOT NULL DEFAULT 'Disponible',
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- Restricciones de integridad a nivel de negocio
    CONSTRAINT chk_producto_precio_positivo CHECK (precio > 0.00),
    CONSTRAINT chk_producto_stock_no_negativo CHECK (stock >= 0),
    CONSTRAINT fk_productos_categorias
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Catálogo de productos e inventario físico';

-- 2.5. TABLA PEDIDOS / ÓRDENES DE COMPRA
DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    numero_orden VARCHAR(30) NOT NULL UNIQUE,
    id_usuario INT NOT NULL,
    fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(14,2) NOT NULL DEFAULT 0.00,
    metodo_pago ENUM('PSE', 'Tarjeta_Credito', 'Efecty', 'Transferencia') NOT NULL,
    estado ENUM('Pendiente', 'Pagado', 'Enviado', 'Entregado', 'Cancelado') NOT NULL DEFAULT 'Pendiente',
    direccion_envio VARCHAR(200) NOT NULL,
    ciudad_envio VARCHAR(60) NOT NULL,
    CONSTRAINT chk_pedido_total_valido CHECK (total >= 0.00),
    CONSTRAINT fk_pedidos_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Cabecera de compras realizadas por clientes';

-- 2.6. TABLA INTERMEDIA DETALLE DE PEDIDOS (RELACIÓN N:M CON CASCADE)
DROP TABLE IF EXISTS detalle_pedidos;
CREATE TABLE detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(12,2) NOT NULL,
    subtotal DECIMAL(14,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    CONSTRAINT chk_detalle_cantidad_minima CHECK (cantidad > 0),
    CONSTRAINT chk_detalle_precio_valido CHECK (precio_unitario > 0.00),
    CONSTRAINT fk_detalle_pedidos
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalle_productos
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB COMMENT='Renglones de productos incluidos en cada orden';

-- Reactivar validaciones de integridad referencial
SET FOREIGN_KEY_CHECKS = 1;

-- -----------------------------------------------------------------------------
-- PASO 3: POBLAMIENTO DML TRANSACCIONAL (DATOS SEMILLA DE PRUEBA)
-- -----------------------------------------------------------------------------

-- 3.1. Insertar Roles
INSERT INTO roles (nombre, descripcion) VALUES
('Cliente', 'Usuario final que realiza compras en el catálogo web'),
('Administrador', 'Control total de inventarios, reportes y configuración'),
('Operador', 'Gestión de bodega y despacho de órdenes');

-- 3.2. Insertar Usuarios
INSERT INTO usuarios (documento, nombres, apellidos, email, password_hash, telefono, id_rol, estado) VALUES
('1098765432', 'Carlos Andrés', 'Ramírez Peña', 'carlos.ramirez@email.com', '$2b$10$w0...hashSeguro1', '3104567890', 1, 'Activo'),
('1012345678', 'Laura María', 'Gómez Rivas', 'laura.gomez@email.com', '$2b$10$w0...hashSeguro2', '3157891234', 1, 'Activo'),
('1088776655', 'Julián Andrés', 'Trujillo Morales', 'jtrujillo@sena.edu.co', '$2b$10$w0...hashAdminMaster', '3201122334', 2, 'Activo'),
('1033445566', 'Ana Sofía', 'Martínez Vega', 'ana.martinez@email.com', '$2b$10$w0...hashSeguro3', '3189900112', 3, 'Activo');

-- 3.3. Insertar Categorías
INSERT INTO categorias (slug, nombre, descripcion, activo) VALUES
('laptops-gaming', 'Portátiles & Gaming', 'Equipos portátiles para desarrollo, IA y alto rendimiento', TRUE),
('perifericos-pro', 'Periféricos Pro', 'Teclados mecánicos, ratones ergonómicos y pantallas 4K', TRUE),
('componentes-pc', 'Componentes & Almacenamiento', 'Memorias RAM DDR5, SSD NVMe y procesadores de última generación', TRUE),
('audio-streaming', 'Audio & Streaming', 'Auriculares de estudio y micrófonos profesionales', TRUE);

-- 3.4. Insertar Productos con validación de restricciones
INSERT INTO productos (sku, nombre, descripcion, precio, stock, id_categoria, estado) VALUES
('TECH-LAP-001', 'MacBook Pro M3 Max 16"', 'Procesador 16-core, 36GB RAM unificada, 1TB SSD NVMe', 14500000.00, 8, 1, 'Disponible'),
('TECH-LAP-002', 'Lenovo ThinkPad P16 Gen 2', 'Intel Core i9-13980HX, 64GB DDR5, RTX 4080 12GB', 12800000.00, 5, 1, 'Disponible'),
('TECH-PER-003', 'Mouse Logitech MX Master 3S', 'Sensor 8K Darkfield, scroll electromagnético MagSpeed', 485000.00, 24, 2, 'Disponible'),
('TECH-PER-004', 'Teclado Keychron Q1 Pro Wireless', 'Mecánico custom 75%, switches red, chasis de aluminio', 920000.00, 14, 2, 'Disponible'),
('TECH-COM-005', 'SSD Samsung 990 PRO 2TB', 'PCIe 4.0 NVMe M.2 lectura 7450 MB/s con disipador', 890000.00, 30, 3, 'Disponible'),
('TECH-AUD-006', 'Auriculares Sony WH-1000XM5', 'Cancelación activa de ruido Noise Cancelling líder', 1490000.00, 12, 4, 'Disponible');

-- 3.5. Insertar Órdenes de Compra
INSERT INTO pedidos (numero_orden, id_usuario, total, metodo_pago, estado, direccion_envio, ciudad_envio) VALUES
('ORD-2026-0001', 1, 14985000.00, 'PSE', 'Entregado', 'Calle 100 # 15-20 Apto 402', 'Bogotá D.C.'),
('ORD-2026-0002', 2, 1810000.00, 'Tarjeta_Credito', 'Enviado', 'Carrera 43A # 1-50 Torre 2', 'Medellín');

-- 3.6. Insertar Renglones de Detalle (N:M)
INSERT INTO detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 14500000.00), -- 1x MacBook Pro
(1, 3, 1, 485000.00),   -- 1x Mouse MX Master 3S
(2, 4, 1, 920000.00),   -- 1x Teclado Keychron Q1
(2, 5, 1, 890000.00);   -- 1x SSD Samsung 2TB

-- -----------------------------------------------------------------------------
-- PASO 4: CONSULTAS DE VALIDACIÓN DML (PRUEBAS DE INTEGRIDAD Y REPORTE)
-- -----------------------------------------------------------------------------

-- 4.1. Consulta de Catálogo con INNER JOIN (Productos y Categorías)
SELECT 
    p.sku,
    p.nombre AS producto,
    CONCAT('$ ', FORMAT(p.precio, 2, 'es_CO')) AS precio_formato,
    p.stock,
    c.nombre AS categoria,
    p.estado
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC;

-- 4.2. Consulta de Pedidos Detallada (Multi-Join Clientes + Órdenes + Ítems)
SELECT 
    ped.numero_orden,
    CONCAT(u.nombres, ' ', u.apellidos) AS cliente,
    u.email,
    prod.nombre AS item_comprado,
    det.cantidad,
    CONCAT('$ ', FORMAT(det.precio_unitario, 2, 'es_CO')) AS precio_unitario,
    CONCAT('$ ', FORMAT(det.subtotal, 2, 'es_CO')) AS subtotal_calculado,
    ped.estado AS estado_orden
FROM pedidos ped
INNER JOIN usuarios u ON ped.id_usuario = u.id_usuario
INNER JOIN detalle_pedidos det ON ped.id_pedido = det.id_pedido
INNER JOIN productos prod ON det.id_producto = prod.id_producto
ORDER BY ped.id_pedido ASC, det.id_detalle ASC;

-- 4.3. Demostración de Restricción CHECK (Prueba de error controlado)
-- Si intentas ejecutar esto, MySQL arrojará el error 3819 (Check constraint 'chk_producto_precio_positivo' is violated):
-- INSERT INTO productos (sku, nombre, precio, stock, id_categoria) VALUES ('ERR-001', 'Error', -500.00, 5, 1);
