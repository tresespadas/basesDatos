-- Práctica 4

---  IMPORTANTE CAMBIAR EL ORDEN DE LAS TABLAS (PRIMERO LA QUE NO TIENE FOREIGN KEY)
DROP DATABASE IF EXISTS practica4;
CREATE DATABASE practica4;
USE practica4;

CREATE TABLE categorias(
  id_categoria INT PRIMARY KEY,
  iva INT DEFAULT '21',
  descripcion TEXT
) ENGINE=InnoDB;

CREATE TABLE particulares(
  dni_cliente VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(20),
  direccion VARCHAR(20),
  telefono CHAR(9) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE hotel(
  id_hotel INT PRIMARY KEY,
  nombre VARCHAR(20),
  direccion VARCHAR(20),
  telefono CHAR(9),
  anno_construccion CHAR(4),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria)
  ON UPDATE CASCADE
  ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE agencias_viajes(
  id_agencia INT PRIMARY KEY,
  dni_cliente VARCHAR(9),
  nombre VARCHAR(20),
  direccion VARCHAR(20),
  telefono CHAR(9),
  FOREIGN KEY (dni_cliente) REFERENCES particulares (dni_cliente)
  ON UPDATE NO ACTION
  ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE habitaciones(
  id_habitacion INT PRIMARY KEY,
  tipo VARCHAR(20),
  id_hotel INT,
  dni_cliente VARCHAR(9),
  id_agencia INT,
  FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  FOREIGN KEY (dni_cliente) REFERENCES particulares (dni_cliente)
  ON UPDATE NO ACTION
  ON DELETE CASCADE,
  FOREIGN KEY (id_agencia) REFERENCES agencias_viajes (id_agencia)
  ON UPDATE NO ACTION
  ON DELETE CASCADE
) ENGINE=InnoDB;

DESCRIBE categorias;
DESCRIBE particulares;
DESCRIBE hotel;
DESCRIBE agencias_viajes;
DESCRIBE habitaciones;
