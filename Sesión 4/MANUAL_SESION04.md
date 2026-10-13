# 📘 MANUAL DEL APRENDIZ — SESIÓN 4: BASES DE DATOS NOSQL Y MODELADO DOCUMENTAL JSON

**Programa:** ADSO 3389010  
**Guía de Aprendizaje:** GA6 — Competencia 220501096  
**Evidencia Cubierta:** `GA6-220501096-AA1-EV03`: Creación de los objetos de la base de datos (NoSQL / JSON).

---

## 1. INTRODUCCIÓN A LAS BASES DE DATOS NOSQL

Las bases de datos NoSQL (Not Only SQL) están diseñadas para manejar grandes volúmenes de datos no estructurados o semiestructurados, permitiendo un escalamiento horizontal masivo y esquemas dinámicos (schema-less).

### Diferencias Clave entre SQL y NoSQL

| Concepto | SQL (Relacional) | NoSQL (Documental) |
|---|---|---|
| **Estructura** | Tablas con filas y columnas rígidas. | Colecciones con documentos JSON/BSON flexibles. |
| **Relaciones** | Claves Foráneas (FK) e Integrity Constraints. | Documentos embebidos o referencias manuales. |
| **Escalamiento** | Vertical (Hardware más potente). | Horizontal (Distribuido en clústeres). |

---

## 2. FORMATO JSON Y ESTRUCTURA DE DOCUMENTOS

JSON (JavaScript Object Notation) es un formato ligero de intercambio de datos compuesto por pares clave-valor y arreglos.

### Ejemplo de Especificación para la Evidencia GA6-220501096-AA1-EV03:
Requisito del taller institucional: Crear un objeto JSON que modele los datos de un vehículo/parque automotor.

```json
{
  "placa": "XYZ-987",
  "numero_serie": "N1234567890ABC",
  "modelo": "2025",
  "marca": "Mazda",
  "kilometraje": 25000,
  "tipo": "Camioneta SUV",
  "caracteristicas": {
    "color": "Rojo Cristal",
    "transmision": "Automática",
    "combustible": "Híbrido"
  },
  "propietarios_anteriores": ["Juan Pérez", "Ana María Silva"]
}
```

---

## 3. INSTRUCCIONES PARA LA ENTREGA EV03

Para cumplir con la evidencia **EV03**:
1. Elabora un documento escrito en formato PDF.
2. Incluye la portada, introducción y objetivos.
3. Presenta la sintaxis JSON del caso de estudio (Vehículo/Parque Automotor o módulo del proyecto).
4. Redacta las sentencias para:
   - Crear la colección.
   - Insertar 5 registros en formato JSON.
   - Realizar la consulta de todos los registros.
   - Actualizar los datos de un registro.
