# 📘 MANUAL DEL APRENDIZ — SESIÓN 2: SQL COMPLETO (DDL, DML Y SCRIPT EN MYSQL)

**Programa:** Análisis y Desarrollo de Software (ADSO)  
**Ficha:** 3389010 — Virtual  
**Guía de Aprendizaje:** GA6 — Competencia 220501096  
**Resultado de Aprendizaje (RAP):** 220501096-02 — Construir la base de datos para el software a partir del modelo de datos.  
**Evidencias Cubiertas (Corte 1 — 25/10/2026):**
- `GA6-220501096-AA2-EV01`: Destrezas y conocimientos en el manejo de sentencias DDL y DML de SQL.
- `GA6-220501096-AA2-EV02`: Creación de la estructura de la base de datos y aplicación de restricciones.
- `GA6-220501096-AA2-EV03`: Script de la base de datos del proyecto formativo (.sql).

---

## 1. INTRODUCCIÓN A SQL: DDL VS DML

El lenguaje SQL (*Structured Query Language*) se divide en dos grandes subconjuntos para la administración relacional:
1. **DDL (Data Definition Language):** Sentencias que definen, modifican y eliminan la estructura física y metadatos de las tablas (`CREATE`, `ALTER`, `DROP`, `TRUNCATE`).
2. **DML (Data Manipulation Language):** Sentencias que gestionan los registros o datos almacenados dentro de dichas estructuras (`INSERT`, `SELECT`, `UPDATE`, `DELETE`).

---

## 2. SENTENCIAS DDL PRINCIPALES

### 2.1. CREATE DATABASE / SCHEMA
Establece la base de datos contenedora en el servidor con codificación UTF-8 internacional:
```sql
CREATE DATABASE IF NOT EXISTS techstore_db
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE techstore_db;
```

### 2.2. CREATE TABLE CON RESTRICCIONES
Define una tabla con sus columnas, tipos de datos y reglas de integridad:
```sql
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    documento VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    estado ENUM('Activo', 'Inactivo', 'Bloqueado') DEFAULT 'Activo',
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### 2.3. ALTER TABLE & DROP TABLE
Permite modificar columnas existentes o eliminar tablas:
```sql
-- Agregar nueva columna
ALTER TABLE usuarios ADD COLUMN telefono VARCHAR(20) AFTER email;

-- Modificar tipo de dato
ALTER TABLE usuarios MODIFY COLUMN telefono VARCHAR(25);

-- Eliminar tabla de forma segura si existe
DROP TABLE IF EXISTS usuarios_inactivos;
```

---

## 3. RESTRICCIONES DE INTEGRIDAD (CONSTRAINTS)

Las restricciones aseguran la validez y consistencia lógica de la información en el SGBD:

1. **PRIMARY KEY (PK):** Identificador único e inmutable por fila.
2. **FOREIGN KEY (FK):** Establece la relación referencial con la clave primaria de otra tabla.
3. **NOT NULL:** Impide valores vacíos o nulos en un campo obligatorio.
4. **UNIQUE:** Garantiza que no existan valores duplicados en la columna.
5. **CHECK:** Valida una condición lógica antes de permitir la inserción o actualización (ej. `CHECK (precio > 0)`).
6. **DEFAULT:** Asigna un valor automático si el campo no se especifica.
7. **ON DELETE CASCADE / RESTRICT:** Determina si los registros hijos se eliminan al borrar el padre (`CASCADE`) o si el SGBD bloquea la eliminación para proteger los datos (`RESTRICT`).

---

## 4. ESTRUCTURA COMPLETA DEL CASO TECHSTORE PRO REACT

```sql
-- Tabla Categorías
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla Productos con Llave Foránea y Restricciones CHECK
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    sku VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    id_categoria INT NOT NULL,
    CONSTRAINT chk_precio_positivo CHECK (precio > 0),
    CONSTRAINT chk_stock_positivo CHECK (stock >= 0),
    CONSTRAINT fk_productos_categorias 
        FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla Pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    estado ENUM('Pendiente', 'Pagado', 'Enviado', 'Cancelado') DEFAULT 'Pendiente',
    CONSTRAINT fk_pedidos_usuarios
        FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla Intermedia Detalle de Pedido (Relación N:M)
CREATE TABLE detalle_pedidos (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED,
    CONSTRAINT chk_cantidad_positiva CHECK (cantidad > 0),
    CONSTRAINT fk_detalle_pedidos
        FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalle_productos
        FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
        ON DELETE RESTRICT ON UPDATE CASCADE
);
```

---

## 5. MANIPULACIÓN DML (INSERT, SELECT, UPDATE, DELETE)

### 5.1. INSERT INTO (Poblamiento de Datos)
```sql
-- Inserción de categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Portátiles', 'Equipos portátiles para desarrollo y productividad'),
('Accesorios', 'Periféricos, teclados mecánicos y pantallas');

-- Inserción de productos
INSERT INTO productos (sku, nombre, precio, stock, id_categoria) VALUES
('TECH-LAP-001', 'MacBook Pro M3 Max 32GB', 14500000.00, 10, 1),
('TECH-MOU-002', 'Mouse Logitech MX Master 3S', 480000.00, 25, 2);
```

### 5.2. SELECT CON INNER JOIN (Consultas Relacionales)
```sql
-- Listar productos con el nombre de su categoría
SELECT 
    p.id_producto,
    p.sku,
    p.nombre AS producto,
    p.precio,
    p.stock,
    c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC;
```

### 5.3. UPDATE Y DELETE SEGURO
```sql
-- Actualizar precio de un producto
UPDATE productos 
SET precio = 13999900.00 
WHERE sku = 'TECH-LAP-001';

-- Eliminación controlada con condición WHERE
DELETE FROM categorias 
WHERE id_categoria = 99;
```

---

## 6. RÚBRICA Y ENTREGABLES DE APRENDIZAJE (CORTE 1 — 25/10/2026)

Para culminar las evidencias del Bloque SQL en plataforma Zajuna:
1. **AA2-EV01 (Taller DDL/DML):** Documento PDF resolviendo las sentencias solicitadas en la guía.
2. **AA2-EV02 (Estructura y Restricciones):** Archivo ZIP conteniendo el informe técnico y el modelo exportado de MySQL Workbench.
3. **AA2-EV03 (Script del Proyecto):** Archivo ZIP con el script ejecutable `.sql` completo probado en MySQL Workbench.

---
*Material preparado para los aprendices de la ficha ADSO 3389010 - SENA Virtual.*
