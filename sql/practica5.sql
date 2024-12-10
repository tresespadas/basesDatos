-- Practica 5
DROP DATABASE IF EXISTS practica5;
CREATE DATABASE practica5;
USE practica5;

CREATE TABLE aerolineas(
  id_aerolinea INT UNIQUE PRIMARY KEY,
  nombre VARCHAR(20),
  pais VARCHAR(20),
  telefono CHAR(9)
) ENGINE=InnoDB;

CREATE TABLE pasajeros(
  codigo INT PRIMARY KEY,
  nombre VARCHAR(10),
  apellido VARCHAR(10),
  dni VARCHAR(9),
  telefono CHAR(9)
) ENGINE=InnoDB;

CREATE TABLE vuelos(
  id_vuelo INT PRIMARY KEY,
  origen VARCHAR(10),
  destino VARCHAR(10),
  fecha DATE,
  hora TIME,
  aerolinea INT,
  FOREIGN KEY (aerolinea) REFERENCES aerolineas (id_aerolinea)
  ON UPDATE CASCADE
  ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE reservas(
  id_revervas INT PRIMARY KEY,
  cod_vuelo INT,
  id_pasajero INT,
  asiento CHAR(3),
  estado VARCHAR(10),
  FOREIGN KEY (cod_vuelo) REFERENCES vuelos (id_vuelo)
  ON UPDATE NO ACTION
  ON DELETE CASCADE,
  FOREIGN KEY (id_pasajero) REFERENCES pasajeros (codigo)
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
) ENGINE=InnoDB;

DESCRIBE aerolineas;
DESCRIBE pasajeros;
DESCRIBE vuelos;
DESCRIBE reservas;
