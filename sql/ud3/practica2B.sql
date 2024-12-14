-- Practica 2 - Ejercicio 2 - Crear y modificar tablas en MySql I
DROP DATABASE IF EXISTS practica2b;
CREATE DATABASE practica2b;
USE practica2b;

CREATE TABLE familia(
  codigoFamilia INT PRIMARY KEY,
  descripcionFamilia TEXT
);

CREATE TABLE personas(
  dni VARCHAR(10) NOT NULL PRIMARY KEY, 
  nombre VARCHAR(10), 
  apellido1 VARCHAR(10),
  apellido2 VARCHAR(10),
  codigoFamilia INT,
  FOREIGN KEY (codigoFamilia) REFERENCES familia (codigoFamilia)
);

CREATE TABLE vehiculos(
  codigoVehiculo INT NOT NULL PRIMARY KEY,
  marca VARCHAR(10),
  modelo VARCHAR(10),
  cilindrada INT
);


CREATE TABLE personas_vehiculos(
  dni VARCHAR(10),
  codigoVehiculo INT,
  FOREIGN KEY (dni) REFERENCES personas (dni)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (codigoVehiculo) REFERENCES vehiculos (codigoVehiculo)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

SHOW TABLES;
DESCRIBE personas;
DESCRIBE vehiculos;
DESCRIBE familia;
DESCRIBE personas_vehiculos;
