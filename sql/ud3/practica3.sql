-- Práctica 3 - Crear y modificar tablas en MySql III
DROP DATABASE IF EXISTS practica3;
CREATE DATABASE practica3;
USE practica3;

CREATE TABLE articulos(
  cod_articulo INT, 
  cod_fabricante INT, 
  peso INT,
  categoria INT,
  PRIMARY KEY (cod_articulo, cod_fabricante, peso, categoria)
) ENGINE=InnoDB;

SHOW TABLES;
DESCRIBE articulos;

CREATE TABLE fabricantes(
  cod_fabricante INT AUTO_INCREMENT,
  nombre VARCHAR(25),
  pais VARCHAR(25),
  PRIMARY KEY (cod_fabricante)
) ENGINE=InnoDB;

DESCRIBE fabricantes;

ALTER TABLE articulos DROP PRIMARY KEY;
ALTER TABLE articulos ADD FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante)
ON DELETE CASCADE;
ALTER TABLE articulos ADD PRIMARY KEY (cod_articulo, peso, categoria);

DESCRIBE articulos;

CREATE TABLE personas_vehiculos(
  dni VARCHAR(9),
  codigoVehiculo INT,
  PRIMARY KEY (dni, codigoVehiculo)
) ENGINE=InnoDB;

ALTER TABLE personas_vehiculos ADD fechaCompra DATE;

DESCRIBE personas_vehiculos;

CREATE TABLE personas(
  dni VARCHAR(9),
  nombre VARCHAR(25),
  apellido1 VARCHAR(25),
  apellido2 VARCHAR(25),
  PRIMARY KEY (dni, nombre, apellido1, apellido2)
) ENGINE=InnoDB;

ALTER TABLE personas DROP PRIMARY KEY;
ALTER TABLE personas MODIFY nombre VARCHAR(100);
ALTER TABLE personas ADD PRIMARY KEY (dni, nombre, apellido1, apellido2);

DESCRIBE personas;

ALTER TABLE personas ADD domicilio VARCHAR(100);

DESCRIBE personas;

CREATE TABLE vehiculos(
  codigoVehiculo INT,
  marca VARCHAR(10),
  modelo VARCHAR(10),
  cilindrada VARCHAR(10),
  PRIMARY KEY (codigoVehiculo, marca, modelo, cilindrada)
) ENGINE=InnoDB;

ALTER TABLE vehiculos MODIFY modelo INT;

DESCRIBE vehiculos;

CREATE TABLE paciente(
  dni VARCHAR(9),
  nombre VARCHAR(10),
  apellidos VARCHAR(20),
  cod_postal CHAR(5),
  tfno CHAR(9),
  PRIMARY KEY (dni)
) ENGINE=InnoDB;

ALTER TABLE paciente DROP cod_postal;

DESCRIBE paciente;

CREATE TABLE profesores(
  dni VARCHAR(9),
  nombre VARCHAR(10),
  especialidad VARCHAR(10),
  codigoCentro INT
) ENGINE=InnoDB;

ALTER TABLE profesores ADD PRIMARY KEY (dni);

DESCRIBE profesores;

ALTER TABLE fabricantes MODIFY cod_fabricante INT; -- Cambio el AUTO_INCREMENT
ALTER TABLE articulos DROP FOREIGN KEY articulos_ibfk_1; -- Borro la vinculación de cod_fabricante
ALTER TABLE articulos DROP PRIMARY KEY; -- Borro la PK de la tabla vinculada
ALTER TABLE fabricantes DROP PRIMARY KEY; -- Borro la PK de la propia tabla
ALTER TABLE articulos ADD PRIMARY KEY (cod_articulo, peso, categoria); -- Reestablezco la PK de la vinculada

DESCRIBE fabricantes;
DESCRIBE articulos;
