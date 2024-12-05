-- Práctica 4




---  IMPORTANTE CAMBIAR EL ORDEN DE LAS TABLAS (PRIMERO LA QUE NO TIENE FOREIGN KEY)
DROP DATABASE IF EXISTS practica4;
CREATE DATABASE practica4;
USE practica4;

CREATE TABLE habitaciones(
  id_habitacion INT PRIMARY KEY,
  tipo VARCHAR(20),
  id_hotel INT,
  DNI_cliente VARCHAR(9),
  id_agencia INT,
  FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel) NOT NULL,
  FOREIGN KEY (id_agencia) REFERENCES agencias_viajes (id_agencia)
)

CREATE TABLE hotel(
  id_hotel INT PRIMARY KEY,
  nombre VARCHAR(20),
  domicilio VARCHAR(20),
  telefono CHAR(9) NOT NULL,
  anno_construccion INT,
  id_categoria INT NOT NULL,
  FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) NOT NULL,
)


CREATE TABLE agencias_viajes(
  id_agencia INT,
  DNI_cliente VARCHAR(9),
  nombre VARCHAR(20),
  direccion VARCHAR(20),
  telefono CHAR(9) NOT NULL,
  FOREIGN KEY (DNI_cliente) REFERENCES particulares (DNI_cliente)
)

CREATE TABLE particulares(
  DNI_cliente VARCHAR(9),
  nombre VARCHAR(20),
  direccion VARCHAR(20),
  telefono CHAR(9)
)

CREATE TABLE categoria(
  id_categoria INT PRIMARY KEY,
  iva INT DEFAULT '21',
  descripcion TEXT
)

SHOW TABLES;
DESCRIBRE particulares;
DESCRIBE habitaciones;
DESCRIBE hotel;
