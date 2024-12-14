-- Práctica 2 - Crear y Modificar tablas en MySql I
DROP DATABASE IF EXISTS practica2;
CREATE DATABASE practica2;
USE practica2;

CREATE TABLE peliculas(
  cod_pelicula INT NOT NULL PRIMARY KEY,
  nombre VARCHAR(10) NOT NULL,
  fecha_alta DATE,
  stock INT DEFAULT 10, -- Duda DEFAULT se puede usar?
  precio INT NOT NULL -- Duda NOT NULL significa "requerido"?
);

CREATE TABLE clientes(
  dni_cliente VARCHAR(10) NOT NULL PRIMARY KEY,
  nombre VARCHAR(10) NOT NULL,
  direccion VARCHAR(100),
  poblacion VARCHAR(40) DEFAULT 'Madrid',
  cod_postal CHAR(5),
  fecha_nac DATE
);

CREATE TABLE compras(
  fecha_compra DATE,
  codigo_pelicula INT NOT NULL,
  dni_cliente VARCHAR(10) NOT NULL,
  FOREIGN KEY (codigo_pelicula) REFERENCES peliculas (cod_pelicula)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (dni_cliente) REFERENCES clientes (dni_cliente)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

SHOW TABLES;
DESCRIBE peliculas;
DESCRIBE clientes;
DESCRIBE compras;
