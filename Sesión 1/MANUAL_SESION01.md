# 📘 MANUAL DIDÁCTICO PASO A PASO DEL APRENDIZ — SESIÓN 1
## Modelo Relacional, Cardinalidad, Diagramas E-R y Normalización 3FN
### Evidencias: GA6-220501096-AA1-EV01 & GA6-220501096-AA1-EV02
**Programa:** Tecnología en Análisis y Desarrollo de Software (ADSO)  
**Ficha:** 3389010 — Modalidad Virtual | SENA Regional Huila — CADPH (Garzón)  
**Fase del Proyecto:** Fase 3: Ejecución | Actividad de Proyecto 6 (AP6)  
**Instructor Líder:** Julián Andrés Trujillo Morales  

---

## 📌 1. FICHA TÉCNICA Y CONTEXTO NORMATIVO EN LA GUÍA 6

En el ciclo de vida del desarrollo de software, la base de datos es la base estructural sobre la cual se soportan las operaciones de negocio, la seguridad y la consistencia transaccional del sistema. Un diseño relacional deficiente ocasiona redundancia masiva de datos, anomalías en la actualización de registros e inconsistencias que degradan la experiencia del usuario.

En esta primera sesión técnica de la **Fase 3: Ejecución**, abordamos la **Actividad de Aprendizaje GA6-220501096-AA1**: *"Crear un modelo de base de datos, con base a los requerimientos del cliente"*, la cual evalúa el **Resultado de Aprendizaje (RAP) 220501096-02**: *"Construir la base de datos para el software a partir del modelo de datos"*.

### 🎯 Evidencias a Desarrollar:
1. **GA6-220501096-AA1-EV01 (Evidencia de Conocimiento):**
   * *Nombre:* Resolución de problemas aplicando el modelo relacional, cardinalidad y normalización.
   * *Producto a entregar:* Documento técnico escrito en **formato PDF** que detalle la resolución del caso de estudio mediante la aplicación rigurosa de la 1FN, 2FN y 3FN, matriz de cardinalidad y diccionario de datos.
2. **GA6-220501096-AA1-EV02 (Evidencia de Desempeño):**
   * *Nombre:* Modelo entidad relación de caso.
   * *Producto a entregar:* Documento en **formato PDF** con el Diagrama Entidad-Relación (E-R / EER) modelado en una herramienta CASE formal (MySQL Workbench, dbdiagram.io o StarUML), con todas sus entidades, atributos, claves primarias (PK), foráneas (FK) y cardinalidades.

### 🗓️ Plazos y Estrategia de Evaluación:
* **Estrategia pedagógica:** Ambas evidencias pertenecen al **Bloque 1: Bases de Datos Relacionales (SQL)**.
* 🟧 **Fecha Límite en Zajuna (Corte 1):** **Domingo, 25 de Octubre de 2026 (11:59 PM)**.
* **Criterio de Evaluación Institucional:** *IE-GA6-220501096-AA1-EV01* y *IE-GA6-220501096-AA1-EV02* ("Define esquemas de seguridad e integridad en la base de datos para mantener la coherencia de la información").

---

## 🏛️ 2. ESTRUCTURA REGLAMENTARIA DEL DOCUMENTO DE ENTREGA (SENA AVA V5)

Para obtener una calificación de **Aprobado (A)**, el aprendiz debe estructurar su archivo respetando los estándares institucionales de presentación de trabajos escritos.

```
📁 Estructura Obligatoria del Documento PDF:
├── 1. Portada Institucional Reglamentaria (Modelo Oficial a Color)
├── 2. Introducción Técnica Contextualizada
├── 3. Objetivos (General y Específicos)
├── 4. Desarrollo Técnico Guiado:
│   ├── 4.1 Planteamiento del Problema (Estado 0FN No Normalizado)
│   ├── 4.2 Detección de Anomalías Relacionales
│   ├── 4.3 Aplicación Metódica de la 1FN (Atomicidad)
│   ├── 4.4 Aplicación Metódica de la 2FN (Dependencias Parciales)
│   ├── 4.5 Aplicación Metódica de la 3FN (Dependencias Transitivas)
│   ├── 4.6 Matriz de Relaciones y Cardinalidades
│   └── 4.7 Diccionario de Datos Normalizado
├── 5. Diagrama Entidad-Relación Exportado en Alta Definición (Para EV02)
├── 6. Conclusiones Técnicas Profesionales
└── 7. Referencias Bibliográficas (Normas APA 7ma Edición)
```

---

## 🎨 3. PLANTILLAS INSTITUCIONALES MODELO (COPIA RÁPIDA)

### 3.1. Plantilla 1: Portada Institucional Reglamentaria
Copia este bloque de texto al inicio de tu documento de Word o Google Docs:

```text
================================================================================
SERVICIO NACIONAL DE APRENDIZAJE (SENA)
REGIONAL HUILA — CENTRO AGROEMPRESARIAL Y DESARROLLO PECUARIO DEL HUILA (GARZÓN)
TECNOLOGÍA EN ANÁLISIS Y DESARROLLO DE SOFTWARE (ADSO)
FICHA DE CARACTERIZACIÓN: 3389010 — MODALIDAD VIRTUAL

FASE 3: EJECUCIÓN
ACTIVIDAD DE PROYECTO 6 (AP6): Desarrollar la estructura de datos y la interfaz de usuario del software.

EVIDENCIA: GA6-220501096-AA1-EV01
RESOLUCIÓN DE PROBLEMAS APLICANDO EL MODELO RELACIONAL, CARDINALIDAD Y NORMALIZACIÓN
[O bien: GA6-220501096-AA1-EV02 — MODELO ENTIDAD RELACIÓN DE CASO]

COMPETENCIA: 220501096 — Construir la solución de software de acuerdo con el diseño y metodologías de desarrollo.
RESULTADO DE APRENDIZAJE: 220501096-02 — Construir la base de datos para el software a partir del modelo de datos.

PROYECTO FORMATIVO BASE: TechStore Pro React (E-Commerce MERN)

DATOS DEL APRENDIZ:
Nombre Completo: [NOMBRES Y APELLIDOS COMPLETOS DEL APRENDIZ]
Documento de Identidad: C.C. / T.I. [NÚMERO DE DOCUMENTO]
Correo Institucional: [aprendiz@soy.sena.edu.co]

EQUIPO EJECUTOR DE FORMACIÓN:
Instructor Líder: JULIÁN ANDRÉS TRUJILLO MORALES
Rol: Instructor Técnico de Desarrollo de Software

GARZÓN (HUILA) / COLOMBIA — OCTUBRE DE 2026
================================================================================
```

### 3.2. Plantilla 2: Introducción Técnica Modelo
> *"El presente informe técnico expone el proceso de diseño conceptual, lógico y estructuración relacional de la base de datos para el proyecto formativo **TechStore Pro React**, correspondiente a la plataforma web de comercio electrónico desarrollada durante la Fase 3: Ejecución de la Tecnología en Análisis y Desarrollo de Software (ADSO — Ficha 3389010).*  
> *A través de la aplicación metódica de las reglas de normalización (Primera, Segunda y Tercera Forma Normal), se busca transformar un esquema plano con redundancias y riesgos de inconsistencia en una estructura de datos robusta, escalable y optimizada. Asimismo, se determinan con precisión las claves primarias (PK), claves foráneas (FK) y cardinalidades relacionales, garantizando la integridad referencial y preparando el sistema para su posterior implementación física en el motor de base de datos MySQL."*

### 3.3. Plantilla 3: Objetivos del Documento
* **Objetivo General:**  
  Diseñar la estructura lógica y conceptual de la base de datos relacional para el sistema TechStore Pro React mediante técnicas formales de normalización hasta 3FN y diagramación Entidad-Relación, garantizando la consistencia e integridad de los datos.
* **Objetivos Específicos:**
  1. Identificar las entidades primarias, atributos y restricciones a partir de los requerimientos de la plataforma e-commerce.
  2. Aplicar sistemáticamente la 1FN, 2FN y 3FN para eliminar redundancias y anomalías de inserción, actualización y borrado.
  3. Establecer las cardinalidades (1:1, 1:N y N:M descompuesta) entre los componentes de usuarios, productos, órdenes y transacciones.
  4. Construir el diagrama Entidad-Relación en la herramienta CASE formal y documentar el diccionario de datos correspondiente.

---

## 🛠️ 4. PASO A PASO DIDÁCTICO PARA LA EVIDENCIA EV01 (NORMALIZACIÓN)

A continuación se desarrolla de forma integral el caso práctico de **TechStore Pro React**, sirviendo de guía metodológica para que el aprendiz resuelva su entrega.

---

### PASO 1: Planteamiento del Problema en Estado No Normalizado (0FN)

Imaginemos que el sistema registra sus transacciones comerciales en una sola tabla plana unificada, denominada `Factura_Global`:

```text
Factura_Global (
    id_factura, fecha_emision, cedula_cliente, nombre_cliente, email_cliente, 
    telefono_cliente, direccion_cliente, ciudad_cliente, 
    productos_comprados [id_prod, nombre_prod, categoria_prod, precio_prod, cantidad], 
    subtotal, iva, total_factura, metodo_pago, estado_pago, referencia_transaccion
)
```

#### 🚨 Detección de Anomalías Relacionales:
1. **Anomalía de Inserción:** No es posible registrar a un nuevo cliente en el sistema si aún no ha realizado ninguna compra, ya que los campos de factura y producto quedarían nulos (`NULL`), violando la integridad de la clave primaria. Del mismo modo, no se puede registrar un nuevo producto en catálogo si aún no ha sido facturado.
2. **Anomalía de Modificación/Actualización:** Si el cliente cambia su número telefónico o dirección de residencia, se debe actualizar dicho dato en cada una de las compras históricas registradas. Si se omite una fila, la base de datos quedará en un estado inconsistente.
3. **Anomalía de Eliminación/Borrado:** Si se decide cancelar o anular la única compra registrada de un cliente, se eliminarán accidentalmente todos los datos de contacto de dicho cliente de la base de datos.

---

### PASO 2: Aplicación de la Primera Forma Normal (1FN)

#### 📋 Regla Teórica de la 1FN:
Una tabla se encuentra en **1FN** si y solo si:
1. Todos los atributos contienen **valores atómicos** (indivisibles, sin listas, arrays o campos compuestos).
2. No existen grupos repetitivos ni columnas duplicadas (como `producto1`, `producto2`, `producto3`).
3. Se define de manera inequívoca una **Clave Primaria (PK)** que identifique cada fila.

#### 🔧 Procedimiento Práctico Aplicado:
* Descomponemos la lista `productos_comprados` creando filas individuales por cada producto adquirido.
* Descomponemos el atributo compuesto `nombre_cliente` en `primer_nombre` y `primer_apellido`.
* La clave primaria pasa a ser compuesta: `(id_factura, id_producto)`.

#### 📊 Tabla Resultante en 1FN:
`Ventas_1FN (id_factura [PK], id_producto [PK], fecha_emision, cedula_cliente, primer_nombre, primer_apellido, email_cliente, telefono_cliente, ciudad_cliente, nombre_producto, categoria_producto, precio_unitario, cantidad_comprada, total_linea, metodo_pago, estado_pago)`

> 💡 **Diagnóstico tras 1FN:** Aunque los valores son atómicos, se repiten los datos del cliente y de la factura en tantas filas como productos se hayan comprado. Pasamos a 2FN.

---

### PASO 3: Aplicación de la Segunda Forma Normal (2FN)

#### 📋 Regla Teórica de la 2FN:
Una tabla se encuentra en **2FN** si:
1. Se encuentra previamente en **1FN**.
2. Todos los atributos que no forman parte de la clave primaria tienen **dependencia funcional completa** de la clave primaria. Esto significa que ningún campo dependa únicamente de una parte de la clave primaria cuando esta es compuesta.

#### 🔧 Procedimiento Práctico Aplicado:
Analizamos la dependencia respecto a la clave compuesta `(id_factura, id_producto)`:
* Los datos `cedula_cliente`, `fecha_emision` y `metodo_pago` dependen **únicamente de `id_factura`**, no de `id_producto` (Dependencia Parcial).
* Los datos `nombre_producto`, `categoria_producto` y `precio_unitario` dependen **únicamente de `id_producto`**, no de `id_factura` (Dependencia Parcial).
* Solo `cantidad_comprada` y `precio_unitario_venta` dependen de **ambos a la vez** `(id_factura, id_producto)`.

Por lo tanto, separamos en tres tablas independientes:

1. **Tabla `ordenes`:**
   * Clave Primaria: `id_orden`
   * Columnas: `id_orden`, `fecha_orden`, `cedula_cliente`, `nombre_cliente`, `email_cliente`, `telefono_cliente`, `ciudad_cliente`, `metodo_pago`, `estado_pago`.
2. **Tabla `productos`:**
   * Clave Primaria: `id_producto`
   * Columnas: `id_producto`, `nombre_producto`, `categoria_producto`, `precio_unitario`, `stock`.
3. **Tabla `detalle_orden` (Tabla asociativa que resuelve la relación N:M):**
   * Clave Primaria Compuesta: `(id_orden, id_producto)`
   * Columnas: `id_orden`, `id_producto`, `cantidad`, `precio_unitario_venta`.

---

### PASO 4: Aplicación de la Tercera Forma Normal (3FN)

#### 📋 Regla Teórica de la 3FN:
Una tabla se encuentra en **3FN** si:
1. Se encuentra previamente en **2FN**.
2. No existen **dependencias funcionales transitivas**. Esto significa que ningún atributo no clave dependa de otro atributo no clave ($A \rightarrow B$ y $B \rightarrow C$).

#### 🔧 Procedimiento Práctico Aplicado:
1. En la tabla `ordenes`:
   * `id_orden` $\rightarrow$ `cedula_cliente` $\rightarrow$ (`nombre_cliente`, `email_cliente`, `telefono_cliente`).
   * Los datos del cliente dependen de la `cedula_cliente`, no directamente de la orden.
   * **Solución:** Extraer la tabla independiente `clientes` o `usuarios` y dejar en `ordenes` únicamente la clave foránea `id_cliente`.
2. En la tabla `productos`:
   * `id_producto` $\rightarrow$ `categoria_producto` $\rightarrow$ `descripcion_categoria`.
   * **Solución:** Extraer la tabla de catálogo `categorias` y dejar en `productos` la clave foránea `id_categoria`.
3. En la tabla `ordenes`:
   * La gestión de pasarelas de pago (`metodo_pago`, `referencia_transaccion`) constituye una transacción financiera independiente.
   * **Solución:** Crear la tabla `transacciones` vinculada mediante clave foránea a `id_orden`.

---

### 🌟 ESQUEMA RELACIONAL FINAL DEPURA EN 3FN (6 TABLAS)

1. **`usuarios`** (`id_usuario` [PK], `tipo_documento`, `numero_documento`, `nombres`, `apellidos`, `email`, `password_hash`, `telefono`, `direccion`, `rol`, `fecha_registro`).
2. **`categorias`** (`id_categoria` [PK], `nombre_categoria`, `descripcion`, `estado_activo`).
3. **`productos`** (`id_producto` [PK], `codigo_sku`, `nombre_producto`, `descripcion`, `precio_base`, `stock_disponible`, `id_categoria` [FK]).
4. **`ordenes`** (`id_orden` [PK], `id_usuario` [FK], `fecha_creacion`, `subtotal`, `impuestos`, `costo_envio`, `total_orden`, `estado_orden`).
5. **`detalle_orden`** (`id_orden` [PK, FK], `id_producto` [PK, FK], `cantidad`, `precio_unitario_venta`, `subtotal_linea`).
6. **`transacciones`** (`id_transaccion` [PK], `id_orden` [FK], `pasarela_pago`, `referencia_pago`, `monto_pagado`, `estado_transaccion`, `fecha_pago`).

---

### PASO 5: Matriz de Relaciones y Cardinalidades

| Relación | Entidad Origen | Cardinalidad | Entidad Destino | Justificación de Negocio |
|---|---|:---:|---|---|
| **R1** | `usuarios` | **1 : N** | `ordenes` | Un usuario registrado puede realizar cero o muchas órdenes de compra. Cada orden pertenece a un único usuario. |
| **R2** | `categorias` | **1 : N** | `productos` | Una categoría agrupa múltiples productos del catálogo. Cada producto pertenece estrictamente a una categoría principal. |
| **R3** | `ordenes` | **1 : N** | `detalle_orden` | Una orden se compone de uno o más renglones de compra detallados. |
| **R4** | `productos` | **1 : N** | `detalle_orden` | Un producto puede estar presente en múltiples renglones de órdenes de distintos clientes. |
| **R5** | `ordenes` | **1 : 1** | `transacciones` | Cada orden liquidada en caja electrónica genera una única transacción de pago exitosa. |
| **R6 (Intermedia)** | `ordenes` | **N : M** | `productos` | Resuelta formalmente a través de la tabla asociativa `detalle_orden`. |

---

### PASO 6: Diccionario de Datos Normalizado

#### Tabla 1: `usuarios`
| Campo | Tipo SQL | Longitud | Clave | Nulo | Descripción |
|---|---|:---:|:---:|:---:|---|
| `id_usuario` | INT | AUTO | **PK** | NOT NULL | Identificador único del usuario. |
| `numero_documento` | VARCHAR | 20 | UNIQUE | NOT NULL | Cédula o documento de identidad. |
| `nombres` | VARCHAR | 60 | - | NOT NULL | Nombres completos del cliente. |
| `apellidos` | VARCHAR | 60 | - | NOT NULL | Apellidos completos del cliente. |
| `email` | VARCHAR | 100 | UNIQUE | NOT NULL | Correo electrónico para login y notificaciones. |
| `telefono` | VARCHAR | 20 | - | NULL | Teléfono móvil de contacto. |
| `rol` | ENUM | - | - | NOT NULL | Perfil: `'Cliente'` o `'Administrador'`. |

#### Tabla 2: `productos`
| Campo | Tipo SQL | Longitud | Clave | Nulo | Descripción |
|---|---|:---:|:---:|:---:|---|
| `id_producto` | INT | AUTO | **PK** | NOT NULL | Identificador único del producto. |
| `codigo_sku` | VARCHAR | 30 | UNIQUE | NOT NULL | Código único de referencia de inventario. |
| `nombre_producto` | VARCHAR | 120 | - | NOT NULL | Denominación comercial del artículo. |
| `precio_base` | DECIMAL | (10,2) | - | NOT NULL | Precio de venta unitario en COP. |
| `stock_disponible`| INT | - | - | NOT NULL | Unidades disponibles en bodega (>= 0). |
| `id_categoria` | INT | - | **FK** | NOT NULL | Referencia a la tabla `categorias`. |

#### Tabla 3: `ordenes`
| Campo | Tipo SQL | Longitud | Clave | Nulo | Descripción |
|---|---|:---:|:---:|:---:|---|
| `id_orden` | INT | AUTO | **PK** | NOT NULL | Número consecutivo del pedido. |
| `id_usuario` | INT | - | **FK** | NOT NULL | Cliente que realizó la compra. |
| `fecha_creacion` | DATETIME | - | - | NOT NULL | Fecha y hora exacta de la compra. |
| `total_orden` | DECIMAL | (10,2) | - | NOT NULL | Valor monetario total liquidado. |
| `estado_orden` | ENUM | - | - | NOT NULL | Estado: `'Pendiente'`, `'Pagado'`, `'Enviado'`. |

#### Tabla 4: `detalle_orden`
| Campo | Tipo SQL | Longitud | Clave | Nulo | Descripción |
|---|---|:---:|:---:|:---:|---|
| `id_orden` | INT | - | **PK, FK** | NOT NULL | Pedido al que pertenece el ítem. |
| `id_producto` | INT | - | **PK, FK** | NOT NULL | Producto comprado. |
| `cantidad` | INT | - | - | NOT NULL | Número de unidades compradas (> 0). |
| `precio_unitario_venta` | DECIMAL | (10,2) | - | NOT NULL | Precio congelado al momento de la venta. |

---

## 💻 5. GUÍA DIDÁCTICA PASO A PASO PARA LA EVIDENCIA EV02 (DIAGRAMA E-R)

La evidencia **GA6-220501096-AA1-EV02** requiere la construcción del modelo visual mediante una herramienta CASE. Recomendamos **MySQL Workbench** o **dbdiagram.io**.

### 🖥️ Tutorial en MySQL Workbench:

1. **Paso 1 — Iniciar el Modelo EER:**
   * Abre MySQL Workbench y haz clic en el ícono de modelos (`Models`).
   * Selecciona `File → New Model` (o `Ctrl + N`).
   * Haz doble clic en el ícono **"Add Diagram"** para abrir el lienzo de diseño gráfico.
2. **Paso 2 — Agregar las Tablas Físicas:**
   * En la barra de herramientas lateral izquierda, selecciona la herramienta **Place a New Table (T)** y haz clic en el lienzo.
   * Haz doble clic sobre la tabla para abrir el inspector inferior.
   * Asigna el nombre en minúscula (ej. `usuarios`) y agrega los campos (`id_usuario` con marcas **PK** y **NN**, `email` con marca **UQ** y **NN**).
   * Repite el proceso para `categorias`, `productos`, `ordenes`, `detalle_orden` y `transacciones`.
3. **Paso 3 — Establecer las Relaciones 1:N (Non-Identifying Relationship):**
   * Selecciona la herramienta **1:n Non-Identifying Relationship** (icono de línea punteada 1 a muchos).
   * Haz clic primero sobre la tabla hija (`productos`) y luego sobre la tabla padre (`categorias`). Workbench creará automáticamente la clave foránea `id_categoria`.
   * Repite el proceso entre `ordenes` y `usuarios`.
4. **Paso 4 — Crear la Tabla Asociativa con Clave Primaria Compuesta:**
   * Para la tabla `detalle_orden`, selecciona la herramienta **1:n Identifying Relationship** (icono de línea continua).
   * Haz clic en `detalle_orden` y luego en `ordenes`. Repite haciendo clic en `detalle_orden` y luego en `productos`.
   * Ambos campos (`id_orden` e `id_producto`) se marcarán simultáneamente como **PK** y **FK**.
5. **Paso 5 — Configurar Integridad Referencial:**
   * En la pestaña **Foreign Keys** de `detalle_orden`, configura:
     * Para `fk_detalle_ordenes`: `On Update: CASCADE` y `On Delete: CASCADE`.
     * Para `fk_detalle_productos`: `On Update: CASCADE` y `On Delete: RESTRICT`.
6. **Paso 6 — Exportación en Alta Definición:**
   * Ve al menú superior: `File → Export → Export as PNG...` (o `Export as PDF...`).
   * Guarda la imagen asegurando que todas las etiquetas de cardinalidad y nombres de atributos sean 100% legibles.
   * Inserta la imagen en el documento de Word centrándola en la sección *"5. Diagrama Entidad-Relación de Caso"*.

---

## 📝 6. MODELOS DE CONCLUSIONES TÉCNICAS Y REFERENCIAS

### Modelos de Conclusiones:
1. **Garantía de Integridad y Eliminación de Anomalías:**  
   *"La aplicación rigurosa de las tres primeras formas normales (1FN, 2FN y 3FN) permitió descomponer la estructura plana original en un modelo relacional de seis entidades coherentes. Este proceso eliminó por completo las anomalías de inserción, actualización y borrado, asegurando que los datos de clientes y productos permanezcan consistentes aun cuando se modifiquen los históricos de órdenes."*
2. **Eficiencia en el Almacenamiento y Mantenimiento:**  
   *"Al aislar las dependencias transitivas en tablas maestras como `categorias` y `transacciones`, se reduce drásticamente el espacio de almacenamiento físico y se facilita la evolución futura del software, permitiendo incorporar nuevos métodos de pago o atributos descriptivos sin alterar las tablas centrales de facturación."*
3. **Escalabilidad y Preparación para el Desarrollo Backend:**  
   *"El diagrama Entidad-Relación construido en la herramienta CASE constituye el plano exacto para la ejecución del script SQL DDL durante la siguiente fase de desarrollo. La definición explícita de claves foráneas y reglas de integridad en cascada garantiza la robustez del sistema frente a transacciones concurrentes en el entorno web."*

### Referencias Bibliográficas (Normas APA 7ma Edición):
* Elmasri, R., & Navathe, S. B. (2017). *Fundamentals of Database Systems* (7th ed.). Pearson Education.
* Silberschatz, A., Korth, H. F., & Sudarshan, S. (2020). *Database System Concepts* (7th ed.). McGraw-Hill Education.
* Servicio Nacional de Aprendizaje — SENA. (2024). *Componente Formativo: Bases de datos: SQL y NoSQL*. Ecosistema de Recursos Educativos Digitales.
* MySQL Documentation Team. (2024). *MySQL Workbench Manual: Visual Database Design*. Oracle Corporation. https://dev.mysql.com/doc/workbench/en/

---

## ✅ 7. LISTA DE CHEQUEO DE AUTOCONTROL DEL APRENDIZ (ANTI-RECHAZO)

Antes de exportar y cargar tus archivos en la plataforma **Zajuna**, verifica el cumplimiento de cada uno de estos ítems:

| # | Pregunta de Control Anti-Hallazgo | Estado | ¿Dónde verificar en tu documento? |
|:---:|---|:---:|---|
| **1** | ¿El documento incluye la Portada Institucional reglamentaria con todos los datos personales y de la ficha 3389010? | [ ] SÍ | Página 1 del archivo. |
| **2** | ¿Incluye Introducción técnica y Objetivos (General y Específicos) contextualizados al proyecto de software? | [ ] SÍ | Página 2 del archivo. |
| **3** | ¿Se describe claramente la tabla sin normalizar (0FN) y se justifican las anomalías que presentaba? | [ ] SÍ | Sección 4.1 y 4.2. |
| **4** | ¿Se demuestra el proceso paso a paso de 1FN, 2FN y 3FN indicando qué tablas nacen en cada etapa? | [ ] SÍ | Sección 4.3, 4.4 y 4.5. |
| **5** | ¿Se especifican con claridad las Claves Primarias (PK) y Foráneas (FK) de cada tabla? | [ ] SÍ | En las tablas y Diccionario de Datos. |
| **6** | ¿Para la EV02 se incluye la imagen del Diagrama E-R exportado en alta resolución y con todas sus conexiones? | [ ] SÍ | Sección 5 del documento EV02. |
| **7** | ¿Incluye Conclusiones técnicas profesionales y Referencias bibliográficas en formato APA? | [ ] SÍ | Sección 6 y 7. |
| **8** | ¿El archivo fue exportado en **formato PDF** y tiene un peso adecuado para cargar en Zajuna? | [ ] SÍ | Propiedades del archivo `.pdf`. |

---
*Manual didáctico oficial para la Ficha 3389010 ADSO — SENA Virtual. Elaborado y supervisado por el Instructor Líder Julián Andrés Trujillo Morales.*
