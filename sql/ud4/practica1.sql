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
  precio DECIMAL(7,2) DEFAULT 10000.00, -- Y luego cómo se escribe en el INSERT?
  disponible BOOLEAN
) ENGINE=InnoDB;

INSERT INTO coches (modelo, potencia, fecha, precio, disponible)
VALUES
('afent', 100, '1999-12-12', 10000.00, TRUE), 
('clio', 70, '1999-12-12', 10000.00, TRUE),
('fiat brava', 90, '1999-12-12', 10000.00, FALSE),
('fiat punto', 70, '1995-09-09', 10000.00, TRUE),
('for focus', 89, '2001-01-01', 10000.00, TRUE),
('Kia Rio', 90, '2005-01-03', 10000.00, TRUE),
('laguna', 200,  '2004-03-01', 10000.00, FALSE),
('marbella', 65, '1996-01-05', 10000.00, TRUE),
('megane', 100, '2003-03-01', 10000.00, TRUE),
('Mercedes 300', 150, '2005-02-10', 10000.00, TRUE),
('Mercedes 500', 200, '1999-12-12', 10000.00, TRUE),
('opel kadet', 89, '1999-12-12', 10000.00, TRUE),
('r-18', 80, '1995-02-10', 10000.00, TRUE),
('Santa fe', 150, '1999-12-12', 10000.00, TRUE),
('Santia', 200, '2000-02-01', 10000.00, TRUE),
('smart', 60, '2002-01-02', 10000.00, FALSE),
('Space', 200, '1999-12-12', 10000.00, TRUE),
('toyota corola', 100, '1999-12-12', 10000.00, TRUE);

CREATE TABLE productos(
  codigo_prod INT, -- Creía que codigo_prod era PK
  mes VARCHAR(10),
  ingresos INT
) ENGINE=InnoDB;

INSERT INTO productos (codigo_prod, mes, ingresos)
VALUES
(1, 'enero', 100),
(1, 'enero', 400),
(1, 'abril', 900),
(4, 'enero', 2000),
(4, 'febrero', 1200),
(7, 'marzo', 230),
(7, 'mayo', 500),
(7, 'mayo', 600),
(7, 'abril', 234),
(7, 'marzo', 1000),
(8, 'enero', 600),
(8, 'enero', 1290),
(9, 'marzo', 2400);

SHOW TABLES;
DESCRIBE clientes;
DESCRIBE coches;
DESCRIBE productos;

SELECT * FROM clientes;
SELECT modelo, potencia, DATE_FORMAT(fecha, '%d/%m/%y') AS fecha, precio, disponible FROM coches;
SELECT * FROM productos;
