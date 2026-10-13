# 📘 MANUAL DEL APRENDIZ — SESIÓN 3: MANIPULACIÓN DML Y SCRIPT FÍSICO DE BASE DE DATOS

**Programa:** Análisis y Desarrollo de Software (ADSO)  
**Ficha:** 3389010 — Virtual  
**Guía de Aprendizaje:** GA6 — Competencia 220501096  
**Evidencia Cubierta:** `GA6-220501096-AA2-EV03`: Script bases de datos del proyecto (Producto).

---

## 1. MANIPULACIÓN DE DATOS (DML - DATA MANIPULATION LANGUAGE)

El lenguaje de manipulación de datos permite consultar y modificar los datos almacenados en las tablas relacionales.

### 1.1. INSERT INTO
Puebla las tablas con registros (datos semilla o información de producción).
```sql
INSERT INTO clientes (nombre, email, telefono) 
VALUES 
('Carlos Pérez', 'carlos.perez@email.com', '3001234567'),
('María Gómez', 'maria.gomez@email.com', '3109876543');
```

### 1.2. SELECT & JOINS
Recupera registros combinando múltiples tablas según claves referenciales.
```sql
SELECT 
    p.id_pedido,
    c.nombre AS cliente,
    pr.nombre AS producto,
    dp.cantidad,
    dp.precio_unitario,
    (dp.cantidad * dp.precio_unitario) AS subtotal
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN detalle_pedidos dp ON p.id_pedido = dp.id_pedido
JOIN productos pr ON dp.id_producto = pr.id_producto;
```

### 1.3. UPDATE & DELETE
Actualiza o remueve información filtrando por cláusula WHERE.
```sql
-- Actualizar stock
UPDATE productos SET stock = stock - 2 WHERE id_producto = 1;

-- Eliminar cliente inactivo (si no viola restricciones FK)
DELETE FROM clientes WHERE id_cliente = 5;
```

---

## 2. GENERACIÓN Y EXPORTACIÓN DEL SCRIPT FINAL

Para completar la evidencia **GA6-220501096-AA2-EV03**:
1. Abre MySQL Workbench.
2. Ve al menú **Server → Data Export**.
3. Selecciona la base de datos de tu proyecto formativo.
4. Selecciona las opciones: *Export to Self-Contained File* (archivo único `.sql`).
5. Incluye la estructura DDL (`Create Tables`) y los datos DML (`Insert Statements`).
6. Comprime el archivo `.sql` resultante en formato ZIP y súbelo a la plataforma Zajuna.
