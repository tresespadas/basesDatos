DROP DATABASE IF EXISTS practica6;
CREATE DATABASE practica6 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE practica6;

CREATE TABLE Fabricante (
  id_fab INT NOT NULL,
  nombre VARCHAR(20),
  pais VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  PRIMARY KEY (id_fab)
) ENGINE=InnoDB;

CREATE TABLE Programa (
  codigo INT NOT NULL,
  nombre VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  version VARCHAR(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE Comercio (
  cif INT NOT NULL,
  nombre VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  ciudad VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  PRIMARY KEY (cif)
) ENGINE=InnoDB;

CREATE TABLE Cliente (
  dni INT NOT NULL,
  nombre VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  edad INT,
  PRIMARY KEY (dni)
) ENGINE=InnoDB;

CREATE TABLE Desarrolla (
  id_fab INT NOT NULL,
  codigo INT NOT NULL,
  PRIMARY KEY (id_fab, codigo),
  FOREIGN KEY (id_fab) REFERENCES Fabricante (id_fab),
  FOREIGN KEY (codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

CREATE TABLE Distribuye (
  cif INT NOT NULL,
  codigo INT NOT NULL,
  cantidad INT,
  PRIMARY KEY(cif, codigo),
  FOREIGN KEY (cif) REFERENCES Comercio (cif),
  FOREIGN KEY (codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

CREATE TABLE Registra (
  cif INT NOT NULL,
  dni INT NOT NULL,
  codigo INT NOT NULL,
  medio VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci, -- Ensure this column supports UTF-8 characters
  PRIMARY KEY(cif, dni, codigo),
  FOREIGN KEY(cif) REFERENCES Comercio (cif),
  FOREIGN KEY(dni) REFERENCES Cliente (dni),
  FOREIGN KEY(codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

-- Insert data into tables (note that you can keep your existing INSERT statements)

INSERT INTO Fabricante VALUES (1, 'Oracle', 'Estados Unidos');
INSERT INTO Fabricante VALUES (2, 'Microsoft', 'Estados Unidos');
INSERT INTO Fabricante VALUES (3, 'IBM', 'Estados Unidos');
INSERT INTO Fabricante VALUES (4, 'Dinamic', 'España');  -- Corrected character encoding issue
INSERT INTO Fabricante VALUES (5, 'Borland', 'Estados Unidos');
INSERT INTO Fabricante VALUES (6, 'Symantec', 'Estados Unidos');

INSERT INTO Programa VALUES (1, 'Application Server', '9i');
INSERT INTO Programa VALUES (2, 'Database', '8i');
INSERT INTO Programa VALUES (3, 'Database', '9i');
INSERT INTO Programa VALUES (4, 'Database', '10g');
INSERT INTO Programa VALUES (5, 'Developer', '6i');
INSERT INTO Programa VALUES (6, 'Access', '97');
INSERT INTO Programa VALUES (7, 'Access', '2000');
INSERT INTO Programa VALUES (8, 'Access', 'XP');
INSERT INTO Programa VALUES (9, 'Windows', '98');
INSERT INTO Programa VALUES (10, 'Windows', 'XP Professional');
INSERT INTO Programa VALUES (11, 'Windows', 'XP Home Edition');
INSERT INTO Programa VALUES (12, 'Windows', '2003 Server');
INSERT INTO Programa VALUES (13, 'Norton Internet Security', '2004');
INSERT INTO Programa VALUES (14, 'Freddy Hardest', '-');
INSERT INTO Programa VALUES (15, 'Paradox', '2');
INSERT INTO Programa VALUES (16, 'C++ Builder', '55');
INSERT INTO Programa VALUES (17, 'DB/2', '20');
INSERT INTO Programa VALUES (18, 'OS/2', '10');
INSERT INTO Programa VALUES (19, 'JBuilder', 'X');
INSERT INTO Programa VALUES (20, 'La Prisión', '10'); -- Corrected character encoding issue

INSERT INTO Comercio VALUES (1, 'El Corte Ingles', 'Sevilla');
INSERT INTO Comercio VALUES (2, 'El Corte Ingles', 'Madrid');
INSERT INTO Comercio VALUES (3, 'Jump', 'Valencia');
INSERT INTO Comercio VALUES (4, 'Centro Mail', 'Sevilla');
INSERT INTO Comercio VALUES (5, 'FNAC', 'Barcelona');

INSERT INTO Cliente VALUES (1, 'Pepe Pérez', 45);  -- Corrected character encoding issue
INSERT INTO Cliente VALUES (2, 'Juan González', 45);  -- Corrected character encoding issue
INSERT INTO Cliente VALUES (3, 'Maria Gómez', 33);  -- Corrected character encoding issue
INSERT INTO Cliente VALUES (4, 'Javier Casado', 18);
INSERT INTO Cliente VALUES (5, 'Nuria Sánchez', 29);  -- Corrected character encoding issue
INSERT INTO Cliente VALUES (6, 'Antonio Navarro', 58);

INSERT INTO Desarrolla VALUES (1, 1);
INSERT INTO Desarrolla VALUES (1, 2);
INSERT INTO Desarrolla VALUES (1, 3);
INSERT INTO Desarrolla VALUES (1, 4);
INSERT INTO Desarrolla VALUES (1, 5);
INSERT INTO Desarrolla VALUES (2, 6);
INSERT INTO Desarrolla VALUES (2, 7);
INSERT INTO Desarrolla VALUES (2, 8);
INSERT INTO Desarrolla VALUES (2, 9);
INSERT INTO Desarrolla VALUES (2, 10);
INSERT INTO Desarrolla VALUES (2, 11);
INSERT INTO Desarrolla VALUES (2, 12);
INSERT INTO Desarrolla VALUES (6, 13);
INSERT INTO Desarrolla VALUES (4, 14);
INSERT INTO Desarrolla VALUES (5, 15);
INSERT INTO Desarrolla VALUES (5, 16);
INSERT INTO Desarrolla VALUES (3, 17);
INSERT INTO Desarrolla VALUES (3, 18);
INSERT INTO Desarrolla VALUES (5, 19);
INSERT INTO Desarrolla VALUES (4, 20);

INSERT INTO Distribuye values (1, 1, 10);
INSERT INTO Distribuye values (1, 2, 11);
INSERT INTO Distribuye values (1, 6, 5);
INSERT INTO Distribuye values (1, 7, 3);
INSERT INTO Distribuye values (1, 10, 5);
INSERT INTO Distribuye values (1, 13, 7);
INSERT INTO Distribuye values (2, 1, 6);
INSERT INTO Distribuye values (2, 2, 6);
INSERT INTO Distribuye values (2, 6, 4);
INSERT INTO Distribuye values (2, 7, 7);
INSERT INTO Distribuye values (3, 10, 8);
INSERT INTO Distribuye values (3, 13, 5);
INSERT INTO Distribuye values (4, 14, 3);
INSERT INTO Distribuye values (4, 20, 6);
INSERT INTO Distribuye values (5, 15, 8);
INSERT INTO Distribuye values (5, 16, 2);
INSERT INTO Distribuye values (5, 17, 3);
INSERT INTO Distribuye values (5, 19, 6);
INSERT INTO Distribuye values (5, 8, 8);

INSERT INTO Registra VALUES (1, 1, 1, 'Internet');
INSERT INTO Registra VALUES (1, 3, 4, 'Tarjeta Postal');
INSERT INTO Registra VALUES (4, 2, 10, 'Telefono');
INSERT INTO Registra VALUES (4, 1, 10, 'Tarjeta Postal');
INSERT INTO Registra VALUES (5, 2, 12, 'Internet');
INSERT INTO Registra VALUES (2, 4, 15, 'Internet');

/* Apartado 1 */
SELECT dni, nombre
FROM Cliente;

/* Apartado 2 */
SELECT *
FROM Programa;

/* Apartado 3 */
SELECT nombre
FROM Programa;

/* Apartado 4 */
SELECT nombre
FROM Comercio;

/* Apartado 5 */
SELECT DISTINCT ciudad 
FROM Comercio;

/* Apartado 6 */
SELECT DISTINCT nombre
FROM Programa;

/* Apartado 7 */
SELECT dni+4
FROM Cliente;

/* Apartado 8 */
SELECT codigo*7, nombre
FROM Programa;

/* Apartado 9 */
SELECT *
FROM Programa
WHERE codigo<=10;

/* Apartado 10 */
SELECT *
FROM Programa
WHERE codigo=11;

/* Apartado 11 */
SELECT *
FROM Fabricante
WHERE pais='Estados Unidos';

/* Apartado 12 */
SELECT *
FROM Fabricante
WHERE pais NOT LIKE 'España';

/* Apartado 13 */
SELECT codigo
FROM Programa
WHERE nombre='Windows';

/* Apartado 14 */
SELECT ciudad
FROM Comercio
WHERE nombre='El Corte Ingles';

/* Apartado 15 */
SELECT *
FROM Comercio
WHERE nombre<>'El Corte Ingles';

/* Apartado 16 */
SELECT codigo
FROM Programa
WHERE nombre='Windows' OR nombre='Access';

/* Apartado 17 */
SELECT nombre
FROM Cliente
WHERE edad BETWEEN 10 AND 25 OR edad>50;

/* Apartado 18 */
SELECT DISTINCT nombre
FROM Comercio
WHERE ciudad='Sevilla' OR ciudad='Madrid';

/* Apartado 19 */
SELECT nombre
FROM Cliente
WHERE nombre LIKE '%o';

/* Apartado 20 */
SELECT nombre
FROM Cliente
WHERE nombre LIKE '%o' AND edad>30;

/* Apartado 21 */
SELECT nombre
FROM Programa
WHERE version LIKE '%i' OR nombre LIKE 'A%' OR nombre LIKE 'W%';

/* Apartado 22 */
SELECT nombre
FROM Programa
WHERE version LIKE '%i' OR nombre LIKE 'A%S';

/* Apartado 23 */
SELECT nombre
FROM Programa
WHERE version LIKE '%i' AND nombre NOT LIKE 'A%';

/* Apartado 24 */
SELECT *
FROM Fabricante
ORDER BY nombre ASC;

/* Apartado 25 */
SELECT *
FROM Fabricante
ORDER BY nombre DESC;

/* Apartado 26 */
SELECT nombre, version
FROM Programa
ORDER BY version DESC;

/* Apartado 27 */
SELECT Programa.codigo, Programa.nombre
FROM Desarrolla
JOIN Fabricante
ON (Fabricante.id_fab=Desarrolla.id_fab)
JOIN Programa
ON (Programa.codigo=Desarrolla.codigo)
WHERE Fabricante.nombre='Oracle';

/* Apartado 28 */
SELECT Comercio.nombre
FROM Distribuye
JOIN Comercio
ON (Comercio.cif=Distribuye.cif)
JOIN Programa
ON (Programa.codigo=Distribuye.codigo)
WHERE Programa.nombre='Windows';

/* Apartado 29 */ 
SELECT Programa.nombre, Distribuye.cantidad
FROM Distribuye
JOIN Comercio
ON (Distribuye.cif=Comercio.cif)
JOIN Programa
ON (Programa.codigo=Distribuye.codigo)
WHERE Comercio.nombre='El Corte Ingles' AND Comercio.ciudad='Madrid';

/* Apartado 30 */
SELECT Fabricante.nombre
FROM Desarrolla
JOIN Fabricante
ON (Fabricante.id_fab=Desarrolla.id_fab)
JOIN Programa
ON (Programa.codigo=Desarrolla.codigo)
WHERE Programa.nombre='Freddy Hardest';

/* Apartado 31 */
SELECT Programa.nombre, Programa.version
FROM Registra
JOIN Programa
ON (Registra.codigo=Programa.codigo)
WHERE Registra.medio='Internet';

/* Apartado 32 */
SELECT Cliente.nombre
FROM Registra
JOIN Cliente
ON (Registra.dni=Cliente.dni)
WHERE Registra.medio='Internet';

/* Apartado 33 */
SELECT Registra.medio
FROM Registra
JOIN Cliente
ON (Cliente.dni=Registra.dni)
WHERE Cliente.nombre='Pepe Pérez';

/* Apartado 34 */
SELECT Cliente.dni
FROM Registra
JOIN Cliente
ON (Registra.dni=Cliente.dni)
WHERE Registra.medio='Internet';

/* Apartado 35 */
SELECT Programa.nombre, Programa.version
FROM Registra
JOIN Programa
ON (Registra.codigo=Programa.codigo)
WHERE Registra.medio='Tarjeta Postal';

/* Apartado 36 */
SELECT Comercio.ciudad
FROM Distribuye
JOIN Comercio
ON (Distribuye.cif=Comercio.cif)
JOIN Registra
ON (Registra.codigo=Distribuye.codigo)
WHERE Registra.medio='Internet';

/* Apartado 37 */
SELECT Cliente.nombre, Programa.nombre
FROM Registra
JOIN Cliente
ON (Registra.dni=Cliente.dni)
JOIN Programa
ON (Registra.codigo=Programa.codigo)
WHERE Registra.medio='Internet';

/* Apartado 38 */
SELECT Cliente.nombre, Programa.nombre, Registra.medio, Comercio.nombre
FROM Registra
JOIN Cliente
ON (Registra.dni=Cliente.dni)
JOIN Programa
ON (Registra.codigo=Programa.codigo)
JOIN Comercio
ON (Registra.cif=Comercio.cif);

/* Apartado 39 */ -- Duda
SELECT DISTINCT Comercio.ciudad
FROM Distribuye
JOIN Comercio
ON (Distribuye.cif=Comercio.cif)
JOIN Desarrolla
ON (Distribuye.codigo=Desarrolla.codigo)
WHERE Desarrolla.id_fab=1;

/* Apartado 40 */
SELECT Cliente.nombre
FROM Registra
JOIN Programa
ON (Registra.codigo=Programa.codigo)
JOIN Cliente
ON (Registra.dni=Cliente.dni)
WHERE Programa.nombre='Access' AND Programa.version='XP';

/* Apartado 41 */
SELECT Fabricante.nombre
FROM Fabricante
WHERE Fabricante.nombre <> 'Oracle' AND Fabricante.pais = (
  SELECT Fabricante.pais
  FROM Fabricante
  WHERE Fabricante.nombre='Oracle'
);

/* Apartado 42 */
SELECT Cliente.nombre
FROM Cliente
WHERE Cliente.nombre <> 'Pepe Pérez' AND Cliente.edad = (
  SELECT Cliente.edad
  FROM Cliente
  WHERE Cliente.nombre='Pepe Pérez'
);

/* Apartado 43 */
SELECT Comercio.*
FROM Comercio
WHERE Comercio.nombre <> 'FNAC' AND Comercio.Ciudad IN (
  SELECT Comercio.Ciudad
  FROM Comercio
  WHERE Comercio.nombre='FNAC'
);

/* Apartado 44 */
SELECT Cliente.nombre
FROM Cliente
JOIN Registra
ON (Cliente.dni=Registra.dni)
WHERE Cliente.nombre <> 'Pepe Pérez' AND Registra.medio IN (
  SELECT Registra.medio
  FROM Registra
  JOIN Cliente
  ON (Registra.dni=Cliente.dni)
  WHERE Cliente.nombre='Pepe Pérez'
);

/* Apartado 44 */ -- SIN JOINs
SELECT Cliente.nombre
FROM Cliente
WHERE Cliente.nombre <> 'Pepe Pérez' AND Cliente.dni IN (
  SELECT Registra.dni
  FROM Registra
  WHERE Registra.medio IN (
    SELECT Registra.medio
    FROM Registra
    WHERE Registra.dni = (
      SELECT Cliente.dni
      FROM Cliente
      WHERE Cliente.nombre='Pepe Pérez'
    )
  )
);

