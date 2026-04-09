## CREATE ##
CREATE TABLE proyecto (
    id_proyecto VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE rol (
    id_rol VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE campus (
    id_campus VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE vertical (
    id_vertical VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE modalidad (
    id_modalidad VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE profesor (
    id_profesor VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE promocion (
    id_promocion VARCHAR(50) PRIMARY KEY,
    fecha_comienzo DATE,
    nombre_promocion VARCHAR(50),
    id_vertical VARCHAR(50),
    id_campus VARCHAR(50),
    id_modalidad VARCHAR(50),
    FOREIGN KEY (id_vertical) REFERENCES vertical (id_vertical),
    FOREIGN KEY (id_campus) REFERENCES campus (id_campus),
    FOREIGN KEY (id_modalidad) REFERENCES modalidad (id_modalidad)
);

CREATE TABLE alumno (
    id_alumno VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    id_promocion VARCHAR(50),
    FOREIGN KEY (id_promocion) REFERENCES promocion (id_promocion)
);

CREATE TABLE calificacion (
    id_proyecto VARCHAR(50),
    id_alumno VARCHAR(50),
    nota VARCHAR(50),
    PRIMARY KEY (id_proyecto, id_alumno),
    FOREIGN KEY (id_proyecto) REFERENCES proyecto (id_proyecto),
    FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno)
);

CREATE TABLE promocion_profesor (
    id_profesor VARCHAR(50),
    id_promocion VARCHAR(50),
    id_rol VARCHAR(50),
    PRIMARY KEY (
        id_profesor,
        id_promocion,
        id_rol
    ),
    FOREIGN KEY (id_profesor) REFERENCES profesor (id_profesor),
    FOREIGN KEY (id_promocion) REFERENCES promocion (id_promocion),
    FOREIGN KEY (id_rol) REFERENCES rol (id_rol)
);

## INSERT INTO ##
INSERT INTO campus (id_campus, nombre) VALUES ('C1','Madrid'), ('C2','Valencia');

INSERT INTO rol (id_rol, nombre) VALUES ('R1', 'TA'), ('R2', 'LI');

INSERT INTO
    modalidad (id_modalidad, nombre)
VALUES ('M1', 'Presencial'),
    ('M2', 'Online')

INSERT INTO
    proyecto (id_proyecto, nombre)
VALUES ('P1', 'Proyecto_HLF'),
    ('P2', 'Proyecto_EDA'),
    ('P3', 'Proyecto_BBDD'),
    ('P4', 'Proyecto_ML'),
    ('P5', 'Proyecto_Deployment'),
    ('P6', 'Proyecto_WebDev'),
    ('P7', 'Proyecto_FrontEnd'),
    ('P8', 'Proyecto_Backend'),
    ('P9', 'Proyecto_React'),
    ('P10', 'Proyecto_FullStack');

INSERT INTO
    promocion (
        id_promocion,
        fecha_comienzo,
        modalidad,
        id_campus
    )
VALUES (
        'PR1',
        '2023-09-18',
        'M1',
        'C1'
    ),
    (
        'PR2',
        '2024-02-12',
        'M1',
        'C1'
    ),
    (
        'PR3',
        '2023-09-18',
        'M1',
        'C1'
    ),
    (
        'PR4',
        '2024-02-12',
        'M1',
        'C2'
    );

INSERT INTO profesor (id_profesor, nombre, id_rol) VALUES 
('PF1', 'Noa Yáñez', 'R1'),
('PF2', 'Saturnina Benitez','R1'),
('PF3', 'Anna Feliu','R1'),
('PF4', 'Rosalva Ayuso'.'R1');

('PF5', 'Ana Sofía Ferrer'.'R1');

('PF6', 'Angélica Corral'.'R1');

('PF7', 'Ariel Lledo'.'R1');

('PF8', 'Mario Prats'.'R2');

('PF9', 'Luis Ángel Suárez'.'R2');

('PF10', 'María Dolores Diaz'.'R2');

INSERT INTO
    profesor_promocion
VALUES (
        'PF1',
        'PR1',
        'R1',
        'M1',
        'V1'
    ),
    (
        'PF2',
        'PR1',
        'R1',
        'M1',
        'V1'
    ),
    (
        'PF3',
        'PR4',
        'R2',
        'M2',
        'V2'
    ),
    (
        'PF4',
        'PR1',
        'R2',
        'M2',
        'V1'
    );

INSERT INTO
    alumno
VALUES (
        'A1',
        'Jafet Casals',
        'Jafet_Casals@gmail.com',
        'PR1'
    ),
    (
        'A2',
        'Guillermo Borrego',
        'Guillermo_Borrego@gmail.com',
        'PR2'
    ),
    (
        'A3',
        'Amor Larrañaga',
        'Amor_Larrañaga@gmail.com',
        'PR3'
    ),
    (
        'A4',
        'Teresa Laguna',
        'Teresa_Laguna@gmail.com',
        'PR4'
    );

INSERT INTO
    promocion_profesor (
        id_profesor,
        id_promocion,
        id_rol
    )
VALUES ('Prof1', 'Prom1', 'Rol1'),
    ('Prof2', 'Prom1', 'Rol'),
    ('Prof1', 'Prom2', 'Rol1'),
    ('Prof3', 'Prom2', 'Rol3');

INSERT INTO P
## QUERIES ##

-- Listado de alumnos con su promocion y campus. ··OK!
SELECT a.nombre AS alumno, v.nombre AS vertical, c.nombre AS campus
FROM
    alumno a
    JOIN promocion p ON a.id_promocion = p.id_promocion
    JOIN vertical v ON p.id_vertical = v.id_vertical
    JOIN campus c ON p.id_campus = c.id_campus;
;

-- Profesores de una promoción especifica. ··OK!
SELECT prof.nombre AS profesor, r.nombre AS rol, v.nombre AS vertical
FROM
    promocion_profesor pp
    JOIN profesor prof ON pp.id_profesor = prof.id_profesor
    JOIN rol r ON pp.id_rol = r.id_rol
    JOIN promocion p ON pp.id_promocion = p.id_promocion
    JOIN vertical v ON p.id_vertical = v.id_vertical
WHERE
    v.nombre = 'DS';
-- O 'FS' según busques

-- Alumnos de Madrid. ··OK!
SELECT a.nombre
FROM
    alumno a
    JOIN promocion p ON a.id_promocion = p.id_promocion
    JOIN campus c ON p.id_campus = c.id_campus
WHERE
    c.nombre = 'Madrid';

-- Alumnos de Valencia. ··OK!
SELECT a.nombre
FROM
    alumno a
    JOIN promocion p ON a.id_promocion = p.id_promocion
    JOIN campus c ON p.id_campus = c.id_campus
WHERE
    c.nombre = 'Valencia';

-- Alumnos con más aptos. ··OK!
SELECT a.nombre, COUNT(*) AS total_aptos
FROM alumno a
    JOIN calificacion c ON a.id_alumno = c.id_alumno
WHERE
    c.nota = 'Apto'
GROUP BY
    a.id_alumno
ORDER BY total_aptos DESC;

-- Número de suspensos por alumno. ··OK!
SELECT p.nombre, COUNT(*) AS suspensos
FROM proyecto p
    JOIN calificacion c ON p.id_proyecto = c.id_proyecto
WHERE
    c.nota = 'No Apto'
GROUP BY
    p.id_proyecto
ORDER BY suspensos DESC;

-- Alumnos que aprovaron todo. ··OK!
SELECT a.nombre
FROM alumno a
    JOIN calificacion c ON a.id_alumno = c.id_alumno
GROUP BY
    a.id_alumno
HAVING
    SUM(
        CASE
            WHEN c.nota = 'No Apto' THEN 1
            ELSE 0
        END
    ) = 0;

-- Alumnos que tienen apto en el proyecto EDA. ··OK!
SELECT DISTINCT
    a.nombre
FROM
    alumno a
    JOIN calificacion c ON a.id_alumno = c.id_alumno
    JOIN proyecto pr ON c.id_proyecto = pr.id_proyecto
    JOIN promocion p ON a.id_promocion = p.id_promocion
    JOIN modalidad m ON p.id_modalidad = m.id_modalidad
WHERE
    pr.nombre = 'Proyecto_EDA'
    AND c.nota = 'Apto';

-- Promocion en modalidad remota. ··OK!
SELECT DISTINCT
    pr.id_promocion
FROM
    promocion pr
    JOIN promocion_profesor pp ON pr.id_promocion = pp.id_promocion
    JOIN modalidad m ON pr.id_modalidad = m.id_modalidad
WHERE
    m.nombre = 'Online';

-- Total de alumnos por vertical. ··OK!
SELECT p.id_vertical, COUNT(*) AS total_alumnos
FROM alumno a
    JOIN promocion p ON a.id_promocion = p.id_promocion
GROUP BY
    p.id_vertical;

# Alumnos no aptos en un proyecto en contreto. ··OK!
SELECT a.nombre FROM alumno a 
JOIN calificacion c ON a.id_alumno = c.id_alumno 
JOIN proyecto p ON c.id_proyecto = p.id_proyecto 
WHERE p.nombre = 'Proyecto_HLF' AND c.nota = 'No Apto';

# Alumnos que tienen todo aprovado. ··OK!
SELECT a.nombre FROM alumno a 
JOIN calificacion c ON a.id_alumno = c.id_alumno 
GROUP BY a.nombre HAVING COUNT(CASE WHEN c.nota = 'No Apto' THEN 1 END) = 0;

# Cuantos alumnos tienen  a su cargo cada profesor. ··OK!
SELECT p.nombre, COUNT(a.id_alumno) AS alumnos_a_cargo 
FROM profesor p JOIN alumno a ON p.id_promocion = a.id_promocion 
GROUP BY p.nombre;

# Listado de alumnos: Nombre, campus, vertical, modalidad y su LI asignado. ··OK!
SELECT 
    a.nombre,
    cam.nombre AS campus,
    p.id_vertical,
    p.id_modalidad,
    prof.nombre AS lead_instructor
FROM alumno a
JOIN promocion p ON a.id_promocion = p.id_promocion
JOIN campus cam ON p.id_campus = cam.id_campus
JOIN promocion_profesor pp ON p.id_promocion = pp.id_promocion
JOIN profesor prof ON pp.id_profesor = prof.id_profesor
JOIN rol r ON pp.id_rol = r.id_rol
WHERE r.nombre = 'LI'

# Calcular el ratio de éxiro por promoción-- view: aprovados_promo
SELECT p.id_promocion, p.id_vertical, 
       CAST(SUM(CASE WHEN c.nota = 'Apto' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) AS ratio_exito
FROM promocion p JOIN alumno a ON p.id_promocion = a.id_promocion 
JOIN calificacion c ON a.id_alumno = c.id_alumno 
GROUP BY p.id_promocion, p.id_vertical;

# Numero de aprovados por proyectos--
SELECT p.nombre, COUNT(*) AS aprobados
FROM proyecto p
JOIN calificacion c ON p.id_proyecto = c.id_proyecto
WHERE c.nota = 'Apto'
GROUP BY p.id_proyecto;

# Numero de suspendidos por proyectos--
SELECT p.nombre, COUNT(*) AS suspensos
FROM proyecto p
JOIN calificacion c ON p.id_proyecto = c.id_proyecto
WHERE c.nota = 'No Apto'
GROUP BY p.id_proyecto;

# Alumnos que han suspendido mas proyectos-- view: suspensos_alumno
SELECT a.nombre, COUNT(*) AS suspensos
FROM alumno a
JOIN calificacion c ON a.id_alumno = c.id_alumno
WHERE c.nota = 'No Apto'
GROUP BY a.id_alumno
HAVING COUNT(*) > 1;

# Numero de aprobados por proyecto-- FUNCIONA  view: proyectos_aprobados
SELECT id_proyecto,
       SUM(CASE WHEN nota = 'Apto' THEN 1 ELSE 0 END) AS aptos,
       SUM(CASE WHEN nota = 'No Apto' THEN 1 ELSE 0 END) AS no_aptos
FROM calificacion
GROUP BY id_proyecto;

# Proyectos con mas suspensos-- FUNCIONA view: notthesharpesttool

SELECT p.nombre, COUNT(*) AS suspensos
FROM proyecto p
JOIN calificacion c ON p.id_proyecto = c.id_proyecto
WHERE c.nota = 'No Apto'
GROUP BY p.id_proyecto
ORDER BY suspensos DESC

# Ranking de alumnos por numero de aprobados -- view: alumnos_brillantes
SELECT 
    a.nombre,
    COUNT(*) AS aprobados
FROM alumno a
JOIN calificacion c ON a.id_alumno = c.id_alumno
WHERE c.nota = 'Apto'
GROUP BY a.id_alumno
ORDER BY aprobados DESC;

# Porcentaje de aprobados por proyectos-- view: porcentaje_aprobados_proyecto
SELECT 
    p.nombre,
    ROUND(
        SUM(CASE WHEN c.nota = 'Apto' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS porcentaje_aprobados
FROM proyecto p
JOIN calificacion c ON p.id_proyecto = c.id_proyecto
GROUP BY p.id_proyecto;

# Campus con mejor rendimiento (porcentaje de aprobados) -- view: aprobados_campus
SELECT 
    c.nombre,
    ROUND(
        SUM(CASE WHEN cal.nota = 'Apto' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS porcentaje_aprobados
FROM campus c
JOIN promocion p ON c.id_campus = p.id_campus
JOIN alumno a ON p.id_promocion = a.id_promocion
JOIN calificacion cal ON a.id_alumno = cal.id_alumno
GROUP BY c.nombre
ORDER BY porcentaje_aprobados DESC;

# Alumnos con peor rendimiento (porcentaje de aprobados) -- view: peor_rendimiento
SELECT 
    a.nombre,
    ROUND(
        SUM(CASE WHEN c.nota = 'Apto' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS porcentaje
FROM alumno a
JOIN calificacion c ON a.id_alumno = c.id_alumno
GROUP BY a.id_alumno
ORDER BY porcentaje ASC
LIMIT 1;