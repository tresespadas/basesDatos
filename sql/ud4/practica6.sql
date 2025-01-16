#Contenido de las tablas de la práctica 6
DROP DATABASE IF EXISTS practica6;
CREATE DATABASE practica6;
USE practica6;

CREATE TABLE Fabricante (
  id_fab INT NOT NULL,
  nombre VARCHAR(20),
  pais VARCHAR(30),
  PRIMARY KEY (id_fab)
) ENGINE=InnoDB;

CREATE TABLE Programa (
  codigo INT NOT NULL,
  nombre VARCHAR(30),
  version VARCHAR(35),
  PRIMARY KEY (codigo)
) ENGINE=InnoDB;

CREATE TABLE Comercio (
  cif INT NOT NULL,
  nombre VARCHAR(30),
  ciudad VARCHAR(20),
  PRIMARY KEY (cif)
) ENGINE=InnoDB;

CREATE TABLE Cliente (
  dni INT NOT NULL,
  nombre VARCHAR(30),
  edad INT,
  PRIMARY KEY (dni)
) ENGINE=InnoDB;

CREATE TABLE Desarrolla (
  id_fab INT NOT NULL,
  codigo INT NOT NULL,
  FOREIGN KEY (id_fab) REFERENCES Fabricante (id_fab),
  FOREIGN KEY (codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

CREATE TABLE Distribuye (
  cif INT NOT NULL,
  codigo INT NOT NULL,
  cantidad INT,
  FOREIGN KEY (cif) REFERENCES Comercio (cifc),
  FOREIGN KEY (codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

CREATE TABLE Registra (
  cif INT NOT NULL,
  dni INT NOT NULL,
  codigo INT NOT NULL,
  medio VARCHAR(15),
  FOREIGN KEY(cif) REFERENCES Comercio (cifc),
  FOREIGN KEY(dni) REFERENCES Cliente (dni),
  FOREIGN KEY(codigo) REFERENCES Programa (codigo)
) ENGINE=InnoDB;

INSERT INTO Fabricante VALUES (1, 'Oracle', 'Estados Unidos');
INSERT INTO Fabricante VALUES (2, 'Microsoft', 'Estados Unidos');
INSERT INTO Fabricante VALUES (3, 'IBM', 'Estados Unidos');
INSERT INTO Fabricante VALUES (4, 'Dinamic', 'España');
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
INSERT INTO Programa VALUES (20, 'La Prisión', '10');


INSERT INTO Comercio VALUES (1, 'El Corte Ingles', 'Sevilla');
INSERT INTO Comercio VALUES (2, 'El Corte Ingles', 'Madrid');
INSERT INTO Comercio VALUES (3, 'Jump', 'Valencia');
INSERT INTO Comercio VALUES (4, 'Centro Mail', 'Sevilla');
INSERT INTO Comercio VALUES (5, 'FNAC', 'Barcelona');

INSERT INTO Cliente VALUES (1, 'Pepe Pérez', 45);
INSERT INTO Cliente VALUES (2, 'Juan González', 45);
INSERT INTO Cliente VALUES (3, 'Maria Gómez', 33);
INSERT INTO Cliente VALUES (4, 'Javier Casado', 18);
INSERT INTO Cliente VALUES (5, 'Nuria Sánchez', 29);
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
