# 📊 Proyecto de Base de Datos Relacional – Bootcamp

![Imagen principal](./assets/pgadmin.png)

## 🧠 Descripción del Proyecto

Este proyecto consiste en el diseño e implementación de una **base de datos relacional normalizada** a partir de datos no estructurados de estudiantes y profesores de un bootcamp.

El objetivo es aplicar conceptos clave como:

* Modelado Entidad-Relación (E/R)
* Normalización de datos
* Diseño lógico de bases de datos
* Implementación en PostgreSQL
* Consultas SQL para explotación de datos

---

## 🏗️ Estructura del Proyecto

```
📁 root
 ├── README.md
 └── queries.sql
 └──assets
     └──pgadming.png
```

* **README.md** → Documentación del proyecto
* **queries.sql** → Scripts de creación, inserción y consultas

---

## 🧩 Modelo Entidad-Relación y normalización

![Diagrama ER](./assets/er-diagram.png)

---

## 🗃️ Modelo Lógico

![Modelo lógico](./assets/entidad_relacion.png)
El modelo lógico se ha construido a partir del diseño E/R, definiendo:

* Tablas normalizadas
* Claves primarias (PK)
* Claves foráneas (FK)
* Relaciones entre entidades

### Entidades principales:

* `alumnos`
* `promoción`
* `campus`
* `proyecto`

---

## 🔄 Normalización

Se ha aplicado hasta **3ª Forma Normal (3NF)** para:

* Eliminar redundancias
* Garantizar integridad referencial
* Mejorar escalabilidad

---

## 🐘 Implementación en PostgreSQL

La base de datos ha sido implementada en PostgreSQL incluyendo:

* Creación de tablas (`CREATE TABLE`)
* Inserción de datos (`INSERT`)
* Consultas (`SELECT`)

📄 Todo el código SQL se encuentra en:

```
queries.sql
```

---

## 🚀 Escalabilidad

El diseño permite crecimiento en:

* 📍 Campus (Madrid, Valencia, etc.)
* 🎓 Promociones (Septiembre, Febrero...)
* 🧑‍💻 Verticales (Data Science, Full Stack...)
* 🏫 Modalidades (Online, Presencial)
* 📚 Nuevos proyectos y evaluaciones

---

## 🔍 Ejemplos de Consultas

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

## 👥 Equipo

Proyecto realizado por un equipo mixto de:

* 💻 Full Stack Developers
* 📊 Data Scientists

---

## ⚖️ Licencia y Derechos de Autor

Este proyecto ha sido desarrollado con fines educativos por estudiantes.

Se distribuye bajo la licencia MIT, lo que permite su uso, copia, modificación y distribución, siempre que se incluya la atribución correspondiente a los autores.

© 2026 – Karina Rojas, Marco Guevara, Pablo da Cunha, Nadia Llamoca, James Guarnizo

---