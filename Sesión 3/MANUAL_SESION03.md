# 📘 MANUAL DEL APRENDIZ — SESIÓN 3: BASES DE DATOS NOSQL Y ESQUEMAS JSON/BSON EN MONGODB

**Programa:** Análisis y Desarrollo de Software (ADSO)  
**Ficha:** 3389010 — Virtual  
**Guía de Aprendizaje:** GA6 — Competencia 220501096  
**Evidencia Cubierta:** `GA6-220501096-AA1-EV03`: Esquema de colecciones y documentos NoSQL en formato JSON/BSON (Producto).  
**Fecha Sincrónica:** Martes, 20 de Octubre de 2026 (6:30 p. m. – 8:30 p. m.)  
**Fecha Límite Corte 1:** Domingo, 25 de Octubre de 2026 (11:59 p. m.)

---

## 1. PARADIGMA NOSQL ORIENTADO A DOCUMENTOS

A diferencia de las bases de datos relacionales basadas en tablas y columnas rígidas, las bases de datos orientadas a documentos (como MongoDB) almacenan registros como documentos auto-contenidos e independientes.

### Equivalencias Clave:
* **Database (Base de Datos):** Contenedor de colecciones (ej. `techstore_nosql`).
* **Collection (Colección):** Agrupación de documentos análoga a la tabla relacional.
* **Document (Documento BSON):** Unidad de almacenamiento individual análoga a la fila relacional.
* **Field (Campo):** Par clave-valor análogo a la columna.
* **_id (ObjectId):** Llave primaria hexadecimal de 12 bytes única en la colección.

---

## 2. DIFERENCIA TÉCNICA ENTRE JSON Y BSON

* **JSON (JavaScript Object Notation):** Formato de texto ligero y legible por humanos, utilizado para intercambio de datos cliente-servidor.
* **BSON (Binary JSON):** Serialización binaria de documentos JSON que utiliza MongoDB internamente para almacenar tipos de datos enriquecidos:
  * `ObjectId`: Identificador único con timestamp integrado.
  * `ISODate`: Objeto fecha UTC con soporte para operaciones temporales.
  * `NumberDecimal`: Valores flotantes de alta precisión para precios e impuestos.
  * `Subdocumentos Embebidos`: Objetos anidados dentro de otro documento.
  * `Arreglos`: Listas indexables de cadenas, números o subdocumentos.

---

## 3. REGLA DE ORO: EMBEBIDO VS REFERENCIADO

### ¿Cuándo Embeber (Embedding)?
* Relaciones 1 a 1 fuertemente acopladas.
* Relaciones 1 a Pocos donde los hijos siempre se consultan junto con el padre.
* Información estática e inmutable en el tiempo (ej. datos de envío en un pedido ya facturado).

**Ejemplo Embebido (usuario_embebido.json):**
```json
{
  "_id": ObjectId("67158f918e77a1a4b9240101"),
  "nombre": "Carlos Pérez",
  "direccion": {
    "ciudad": "Garzón",
    "departamento": "Huila",
    "calle": "Cra 10 # 14 - 28"
  },
  "telefonos": ["3101234567", "3159876543"]
}
```

### ¿Cuándo Referenciar (Referencing)?
* Relaciones 1 a Muchos ilimitados (para no sobrepasar el límite de 16MB por documento).
* Entidades con ciclos de vida independientes y alta tasa de actualización aislada.

**Ejemplo Referenciado (orden_referenciada.json):**
```json
{
  "_id": ObjectId("67158f918e77a1a4b9240301"),
  "numero_orden": "ORD-2026-0091",
  "id_usuario": ObjectId("67158f918e77a1a4b9240101"),
  "total": 5200000.00,
  "fecha": ISODate("2026-10-20T20:15:00Z")
}
```

---

## 4. CASO DE ESTUDIO TECHSTORE PRO

### Esquema Colección `productos`:
```json
{
  "_id": ObjectId("67158f918e77a1a4b9240201"),
  "sku": "LAP-PRO-01",
  "titulo": "Portátil Developer Extreme 16 Pulgadas",
  "precio": 5200000.00,
  "especificaciones": {
    "procesador": "AMD Ryzen 7 7840HS",
    "ram_gb": 32,
    "almacenamiento": "1TB NVMe Gen4"
  },
  "etiquetas": ["desarrollo", "adso", "gamer"],
  "stock": 15,
  "activo": true
}
```

---

## 5. PASO A PASO PARA LA ENTREGA DE LA EVIDENCIA AA1-EV03

Para aprobar la evidencia con calificación de 100 puntos en Zajuna:
1. Diseñar el esquema no relacional de mínimo 3 colecciones asociadas a tu proyecto formativo.
2. Implementar al menos una relación con subdocumento embebido y un campo tipo arreglo.
3. Crear la base de datos en MongoDB Compass y registrar al menos 3 documentos por colección.
4. Exportar los archivos `.json` de tus colecciones.
5. Elaborar el informe técnico membretado en formato PDF y cargarlo en Zajuna antes del 25 de Octubre.
