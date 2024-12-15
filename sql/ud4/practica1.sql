-- Tema 4 - Práctica 1 - 
DROP DATABASE IF EXISTS practica1;
CREATE DATABASE practica1;
USE practica1;

CREATE TABLE clientes(
  cod_cliente INT PRIMARY KEY,
  nombre VARCHAR(10),
  apellido1 VARCHAR(10),
  apellido2 VARCHAR(10),
  nif CHAR(9),
  población VARCHAR(10),
  calle VARCHAR(15),
  CP CHAR(6),
  telefono CHAR(15)
) ENGINE=InnoDB;

INSERT INTO clientes (cod_cliente, nombre, apellido1, apellido2, nif, población, calle, CP, telefono)
VALUES
(1, 'Pedro', 'Juan', 'Ana', 'Esperanza', 'Madrid', 'Las huertas', '28001', '9112345678'),
(2, 'Garcia', 'Garriga', 'Jacinta', '847474747', 'Barcelona', 'Diagonal 32', '08004', '93456789'),
(3, 'Rovira', 'Sorlí', 'Galdos', '949383838', 'Malaga', 'La paz', '29001', '67845493'),
(4, 'Gonzalez', 'Aguirre', 'Rovira', '123456798', 'Cordoba', 'Julio Romero', '14001', '57474747');


CREATE TABLE coches(
  modelo VARCHAR(15) PRIMARY KEY, -- Duda PK?
  potencia CHAR(3),
  fecha DATE,
  precio DECIMAL(7,2),
  disponible BOOLEAN
) ENGINE=InnoDB;

INSERT INTO coches (modelo, potencia, fecha, precio, disponible)
VALUES
('afent', 100, '1999-12-12', 10000.00, TRUE), -- Voy por las fechas
('clio', 70, '1999-12-12', 10000.00, TRUE),
('fiat brava', 90, '1999-12-12', 10000.00, FALSE),
('fiat punto', 70, '1995-09-09', 10000.00, TRUE),
('for focus', 89, '1995-09-09', 10000.00, TRUE),
('Kia Rio', 90, '1995-09-09', 10000.00, TRUE),
('laguna', 200,  '1995-09-09', 10000.00, TRUE),
('marbella', 65, '1995-09-09', 10000.00, TRUE),
('megane', 100, '1995-09-09', 10000.00, TRUE),
('Mercedes 300', 150, '1995-09-09', 10000.00, TRUE),
('Mercedes 500', 200, '1995-09-09', 10000.00, TRUE),
('opel kadet', 89, '1995-09-09', 10000.00, TRUE),
('r-18', 80, '1995-09-09', 10000.00, TRUE),
('Santa fe', 150, '1995-09-09', 10000.00, TRUE),
('Santi', 200, '1995-09-09', 10000.00, TRUE),
('smart', 60, '1995-09-09', 10000.00, TRUE),
('Space', 200, '1995-09-09', 10000.00, TRUE),
('toyota corola', 100, '1995-09-09', 10000.00, TRUE);

CREATE TABLE productos(
  codigo_prod INT PRIMARY KEY,
  mes VARCHAR(10),
  ingresos INT
) ENGINE=InnoDB;


SHOW TABLES;
DESCRIBE clientes;
DESCRIBE coches;
DESCRIBE productos;

SELECT * FROM clientes;
SELECT modelo, potencia, DATE_FORMAT(fecha, '%d/%m/%y') AS fecha, precio, disponible FROM coches;
