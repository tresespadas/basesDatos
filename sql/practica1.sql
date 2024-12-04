-- Práctica 1 - Crear tablas en MySQL
DROP DATABASE IF EXISTS CrearTablasMysql1;
CREATE DATABASE CrearTablasMysql1;
USE CrearTablasMysql1;


CREATE TABLE escritor(
  id_escritor INT PRIMARY KEY,
  nombre VARCHAR(30),
  apellidos VARCHAR(40),
  direccion VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE poema(
  id_poema INT PRIMARY KEY,
  titulo VARCHAR(50),
  contenido TEXT,
  id_escritor INT,
  FOREIGN KEY (id_escritor) REFERENCES escritor (id_escritor)
) ENGINE=InnoDB;

CREATE TABLE libro(
  id_libro INT PRIMARY KEY,
  titulo VARCHAR(100),
  precio NUMERIC(5,2)
) ENGINE=InnoDB;

CREATE TABLE poema_libro(
  id_poema INT,
  id_libro INT,
  FOREIGN KEY (id_poema) REFERENCES poema (id_poema),
  FOREIGN KEY (id_libro) REFERENCES libro (id_libro)
) ENGINE=InnoDB;

SHOW TABLES;
DESCRIBE escritor;
DESCRIBE poema;
DESCRIBE libro;
DESCRIBE poema_libro;
