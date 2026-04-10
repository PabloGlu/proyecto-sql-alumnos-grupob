# Proyecto de Base de Datos Relacional – Bootcamp

### Proyecto grupal – Bootcamp Data Science & Full Stack

![Imagen principal](./assets/pgadmin.png)

## Descripción del Proyecto

Este proyecto consiste en el diseño e implementación de una **base de datos relacional normalizada** a partir de datos no estructurados de estudiantes y profesores de un bootcamp.

El objetivo es aplicar conceptos clave como:

* Modelado Entidad-Relación (E/R)
* Normalización de datos
* Diseño lógico de bases de datos
* Implementación en PostgreSQL
* Consultas SQL para explotación de datos

---

## Equipo

Proyecto desarrollado por:

- James  
- Karina Rojas  
- Marco Guevara  
- Nadia Llamoca  
- Pablo da Cunha  

Fecha: Abril 2026

---

## Estructura del Proyecto



* **README.md** → Documentación del proyecto
* **queries.sql** → Scripts de creación, inserción y consultas

---

## Diseño del Sistema

### Entidades principales

* alumnos
* profesores
* promociones
* proyectos
* campus
* vertical
* modalidad
* rol

---

### Relaciones principales

- Un alumno pertenece a una promoción
- Una promoción pertenece a un campus, vertical y modalidad
- Un profesor puede impartir varias promociones (N:M)
- Los alumnos realizan proyectos evaluables (N:M)
- Las calificaciones se registran por alumno y proyecto

---

## Reglas de negocio

- Un alumno solo puede pertenecer a una promoción
- Cada promoción pertenece a un único campus, vertical y modalidad
- El rol del profesor depende de la promoción (no es fijo)
- Las calificaciones se registran por alumno y proyecto
- Las relaciones N:M se resuelven mediante tablas intermedias

---

## Modelo Entidad-Relación y normalización

![Diagrama ER](./assets/er-diagram.png)

---

## Modelo Lógico

![Modelo lógico](./assets/entidad_relacion.png)

### Visualización en pgAdmin

![Relaciones en pgAdmin](./assets/erd_pgadmin.png)

El modelo lógico se ha construido a partir del diseño E/R, definiendo:

* Tablas normalizadas
* Claves primarias (PK)
* Claves foráneas (FK)
* Relaciones entre entidades

---

## Normalización

Se ha aplicado hasta **3ª Forma Normal (3NF)** para:

* Eliminar redundancias
* Garantizar integridad referencial
* Mejorar escalabilidad
* Separación correcta de entidades y relaciones  

---

## Implementación en PostgreSQL

La base de datos ha sido implementada en PostgreSQL incluyendo:

* Creación de tablas (`CREATE TABLE`)
* Inserción de datos (`INSERT`)
* Consultas (`SELECT`)

Todo el código SQL se encuentra en:
`queries.sql`

---

## Escalabilidad

El diseño permite crecimiento en:

* Campus (Madrid, Valencia, etc.)
* Promociones (Septiembre, Febrero...)
* Verticales (Data Science, Full Stack...)
* Modalidades (Online, Presencial)
* Nuevos proyectos y evaluaciones

---

## Conexión a la base de datos desde pgAdmin 4

**Para conectarse desde pgAdmin local a la BD PostgreSQL en Render:**

1. En Render Dashboard → tu base de datos → **Info** → **External Database URL**  
   Copia la URL completa: `postgres://usuario:password@host:puerto/nombre_bd`

2. En pgAdmin → Clic derecho **Servers** → **Register** → **Server**

3. **Pestaña Connection**:

## Ejemplos de Consultas

Algunas queries incluidas:

```sql
-- Obtener alumnos aprobados en todos los proyectos
SELECT * FROM alumnos
WHERE ...
```

```sql
-- Número de alumnos por campus
SELECT campus, COUNT(*) 
FROM alumnos
GROUP BY campus;
```

---

## Equipo

Proyecto realizado por un equipo mixto de:

* Full Stack Developers
* Data Scientists

---

## Licencia y Derechos de Autor

Este proyecto ha sido desarrollado con fines educativos por estudiantes.

Se distribuye bajo la licencia MIT, lo que permite su uso, copia, modificación y distribución, siempre que se incluya la atribución correspondiente a los autores.

© 2026 – Karina Rojas, Marco Guevara, Pablo da Cunha, Nadia Llamoca, James Guarnizo

---

<!-- Basado en principios estándar de diseño conceptual y lógico de bases de datos relacionales.[web:17] -->
