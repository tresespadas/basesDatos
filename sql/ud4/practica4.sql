-- IMPORTANTE: CAMBIAR EL ORDEN DE LA CREACION DE TABLAS POR LA CULPA DE FOREIGN KEY --
DROP DATABASE IF EXISTS Practica4;
CREATE DATABASE Practica4; 
USE Practica4;

CREATE TABLE Marcas (
	cifm int PRIMARY KEY,
	Nombre varchar(50),
	Ciudad varchar(50)
) ENGINE=InnoDB;

CREATE TABLE Clientes (
	dni int PRIMARY KEY,
	Nombre varchar(50),
	Apellido varchar(50),
	Ciudad varchar(50)
) ENGINE=InnoDB;

CREATE TABLE Concesionarios (
	cifc int PRIMARY KEY,
	nombre varchar(50),
	Ciudad varchar(50)
) ENGINE=InnoDB;

CREATE TABLE Coches (
	codcoche int PRIMARY KEY,
	Nombre varchar(40),
	modelo varchar(40)
) ENGINE=InnoDB;

CREATE TABLE Ventas (
	cifc int,
	dni int,
	codcoche int,
	color varchar(40),
  PRIMARY KEY (cifc, dni, codcoche),
  FOREIGN KEY (cifc) REFERENCES Concesionarios (cifc)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (dni) REFERENCES Clientes (dni)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (codcoche) REFERENCES Coches (codcoche)
  ON UPDATE CASCADE
  ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Marco (
	cifm int,
	codcoche int,
  PRIMARY KEY (cifm, codcoche),
  FOREIGN KEY (cifm) REFERENCES Marcas (cifm)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (codcoche) REFERENCES Coches (codcoche)
  ON UPDATE CASCADE
  ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Distribucion (
	cifc int,
	codcoche int,
	cantidad int,	
  PRIMARY KEY (cifc, codcoche),
  FOREIGN KEY (cifc) REFERENCES Concesionarios (cifc)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (codcoche) REFERENCES Coches (codcoche)
  ON UPDATE CASCADE
  ON DELETE CASCADE
) ENGINE=InnoDB;


INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0001", "seat", "Madrid");
INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0002", "renault", "Barcelona");
INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0003", "citroen", "Valencia");
INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0004", "audi", "Madrid");
INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0005", "opel", "Bilbao");
INSERT INTO Marcas (cifm, nombre, ciudad) VALUES ("0006", "bmw", "Barcelona");

INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0001", "Luis", "Garcia", "Madrid");
INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0002", "Antonio", "Lopez", "Valencia");
INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0003", "Juan", "Martin", "Madrid");
INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0004", "Maria", "Garcia", "Madrid");
INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0005", "Javier", "Gonzalez", "Barcelona");
INSERT INTO Clientes (dni, nombre, apellido, ciudad) VALUES ("0006", "Ana", "Lopez", "Barcelona");

INSERT INTO Concesionarios (cifc, nombre, ciudad) VALUES ("0001", "acar", "Madrid");
INSERT INTO Concesionarios (cifc, nombre, ciudad) VALUES ("0002", "bcar", "Madrid");
INSERT INTO Concesionarios (cifc, nombre, ciudad) VALUES ("0003", "ccar", "Barcelona");
INSERT INTO Concesionarios (cifc, nombre, ciudad) VALUES ("0004", "dcar", "Valencia");
INSERT INTO Concesionarios (cifc, nombre, ciudad) VALUES ("0005", "ecar", "Bilbao");

INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0001", "ibiza", "glx");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0002", "ibiza", "gti");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0003", "ibiza", "gtd");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0004", "toledo", "gtd");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0005", "cordoba", "gti");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0006", "megane", "1.6");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0007", "megane", "gti");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0008", "laguna", "gtd");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0009", "laguna", "td");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0010", "zx", "16v");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0011", "zx", "td");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0012", "xantia", "gtd");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0013", "a4", "1.8");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0014", "a4", "2.8");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0015", "astra", "caravan");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0016", "astra", "gti");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0017", "corsa", "1.4");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0018", "300", "316i");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0019", "500", "525i");
INSERT INTO Coches (codcoche, nombre, modelo) VALUES ("0020", "700", "750i");

INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0001", "0001", "0001", "Blanco");
INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0001", "0002", "0005", "rojo");
INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0002", "0003", "0008", "Blanco");
INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0002", "0001", "0006", "rojo");
INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0003", "0004", "0011", "rojo");
INSERT INTO Ventas (cifc, dni, codcoche, color) VALUES ("0004", "0005", "0014", "verde");

INSERT INTO Marco (cifm, codcoche) VALUES ("0001", "0001");
INSERT INTO Marco (cifm, codcoche) VALUES ("0001", "0002");
INSERT INTO Marco (cifm, codcoche) VALUES ("0001", "0003");
INSERT INTO Marco (cifm, codcoche) VALUES ("0001", "0004");
INSERT INTO Marco (cifm, codcoche) VALUES ("0001", "0005");
INSERT INTO Marco (cifm, codcoche) VALUES ("0002", "0006");
INSERT INTO Marco (cifm, codcoche) VALUES ("0002", "0007");
INSERT INTO Marco (cifm, codcoche) VALUES ("0002", "0008");
INSERT INTO Marco (cifm, codcoche) VALUES ("0002", "0009");
INSERT INTO Marco (cifm, codcoche) VALUES ("0003", "0010");
INSERT INTO Marco (cifm, codcoche) VALUES ("0003", "0011");
INSERT INTO Marco (cifm, codcoche) VALUES ("0003", "0012");
INSERT INTO Marco (cifm, codcoche) VALUES ("0004", "0013");
INSERT INTO Marco (cifm, codcoche) VALUES ("0004", "0014");
INSERT INTO Marco (cifm, codcoche) VALUES ("0005", "0015");
INSERT INTO Marco (cifm, codcoche) VALUES ("0005", "0016");
INSERT INTO Marco (cifm, codcoche) VALUES ("0005", "0017");
INSERT INTO Marco (cifm, codcoche) VALUES ("0006", "0018");
INSERT INTO Marco (cifm, codcoche) VALUES ("0006", "0019");
INSERT INTO Marco (cifm, codcoche) VALUES ("0006", "0020");

INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0001", "0001", "3");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0001", "0005", "7");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0001", "0006", "7");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0002", "0006", "5");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0002", "0008", "10");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0002", "0009", "10");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0003", "0010", "5");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0003", "0011", "3");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0003", "0012", "5");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0004", "0013", "10");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0004", "0014", "5");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0005", "0015", "10");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0005", "0016", "20");
INSERT INTO Distribucion (cifc, codcoche, cantidad) VALUES ("0005", "0017", "8");

-- Apartado 4
SELECT *
FROM Concesionarios;

-- Apartado 5
SELECT *
FROM Clientes
WHERE ciudad='Madrid';

-- Apartado 6
SELECT nombre
FROM Marcas
ORDER BY nombre ASC;

-- Apartado 7
SELECT cifc
FROM Distribucion
WHERE cantidad>18;

-- Apartado 8
SELECT cifc
FROM Distribucion
WHERE cantidad BETWEEN 10 AND 18;

-- Apartado 9 - Duda?
SELECT cifc
FROM Distribucion
WHERE cantidad>10 OR cantidad<5;

-- Apartado 10

-- Apartado 14
SELECT codcoche
FROM Coches
WHERE nombre LIKE 'c%';

-- Apartado 15
SELECT codcoche
FROM Coches
WHERE nombre NOT LIKE '%a%';

-- Apartado 16
SELECT COUNT(*)
from Marcas
WHERE ciudad = 'Madrid';

-- Apartado 17
SELECT AVG(cantidad)
FROM Distribucion;

-- Apartado 18
SELECT MAX(dni)
FROM Clientes
WHERE ciudad = 'Madrid';

-- Apartado 19
SELECT MIN(dni)
from Ventas
WHERE color = 'Blanco';

-- Apartado 20
SELECT DISTINCT cifc
FROM Distribucion
WHERE cantidad IS NOT NULL;

-- Apartado 21
SELECT cifm, nombre
FROM Marcas
WHERE ciudad LIKE '_i%';

-- Apartado 22
SELECT DISTINCT Ventas.dni
FROM Ventas
JOIN Concesionarios
ON (Concesionarios.cifc=Ventas.cifc)
WHERE Concesionarios.ciudad='Madrid';

-- Apartado 23
SELECT Ventas.color
FROM Ventas
JOIN Concesionarios
ON (Ventas.cifc=Concesionarios.cifc)
WHERE Concesionarios.nombre='acar';

-- Apartado 24
SELECT Ventas.codcoche
FROM Ventas
JOIN Concesionarios
ON (Ventas.cifc=Concesionarios.cifc)
WHERE Concesionarios.ciudad='Madrid';

-- Apartado 29
SELECT cifc, AVG(cantidad) AS media_stock
FROM Distribucion
GROUP BY cifc;

-- Apartado 30
SELECT cifc, SUM(cantidad) AS total_stock
FROM Distribucion
GROUP BY cifc;

-- Apartado 25
SELECT Nombre, Apellido
FROM Clientes
WHERE dni < (
  SELECT dni
  FROM Clientes
  WHERE Nombre='Juan' AND Apellido='Martin'
);

-- Apartado 26
SELECT Nombre, Apellido
FROM Clientes
WHERE dni <ALL (
  SELECT dni
  FROM Clientes
  WHERE Ciudad='Barcelona'
);

-- Apartado 27 -- Se puede hacer con >ALL
SELECT Nombre, Apellido
FROM Clientes
WHERE Nombre LIKE 'A%' AND dni > (
  SELECT MAX(dni) 
  FROM Clientes
  WHERE Ciudad='Madrid'
);

-- Apartado 27 con ALL
SELECT Nombre, Apellido
FROM Clientes
WHERE Nombre LIKE 'A%' AND dni >ALL(
  SELECT dni
  FROM Clientes
  WHERE Ciudad='Madrid'
);

-- Apartado 28
SELECT Nombre, Apellido
FROM Clientes
WHERE Nombre LIKE 'A%' AND dni >ANY (
  SELECT dni
  FROM Clientes
  WHERE Ciudad='Madrid'
);

