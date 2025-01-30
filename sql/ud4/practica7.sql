DROP DATABASE IF EXISTS practica7;
CREATE DATABASE practica7;
USE practica7;

CREATE TABLE fabricante (
  codigo INT,
  nombre VARCHAR(100),
  PRIMARY KEY(codigo)
)ENGINE=InnoDB;

CREATE TABLE producto (
  codigo INT,
  nombre VARCHAR(100),
  precio FLOAT,
  codigo_fabricante INT,
  PRIMARY KEY(codigo),
  FOREIGN KEY(codigo_fabricante) REFERENCES fabricante(codigo)
  ON UPDATE CASCADE
  ON DELETE CASCADE
)ENGINE=InnoDB;

INSERT INTO fabricante (codigo, nombre)
VALUES
(1,'Asus'),
(2,'Lenovo'),
(3,'Hewlett-Packard'),
(4,'Samsung'),
(5,'Seagate'),
(6,'Crucial'),
(7,'Gigabyte'),
(8,'Huawei'),
(9,'Xiaomi');

INSERT INTO producto (codigo, nombre, precio, codigo_fabricante)
VALUES
(1,'Disco duro SATA3 1TB',86.99,5),
(2,'Memoria RAM DDR4 8GB',120,6),
(3,'Disco SSD 1 TB',150.99,4),
(4,'GeForce GTX 1050Ti',185,7),
(5,'GeForce GTX 1080 Xtreme',755,6),
(6,'Monitor 24 LED Full HD',202,1),
(7,'Monitor 27 LED Full HD',245.99,1),
(8,'Portatil Yoga 520',559,2),
(9,'Portatil Ideapd 320',444,2),
(10,'Impresora HP Deskjet 3720',59.99,3),
(11,'Impresora HP Laserjet Pro M26nw',180,3);

/* Apartado A */
SELECT fabricante.*, producto.nombre
FROM fabricante 
LEFT JOIN producto
ON (fabricante.codigo=producto.codigo_fabricante);

/* Apartado B */
SELECT DISTINCT fabricante.codigo, fabricante.nombre
FROM fabricante
JOIN producto
ON (fabricante.codigo=producto.codigo_fabricante);

/* Apartado C */
SELECT fabricante.*
FROM fabricante 
LEFT JOIN producto
ON (fabricante.codigo=producto.codigo_fabricante)
WHERE producto.codigo_fabricante IS NULL;

/* Consulta de prueba */
SELECT fabricante.nombre
FROM fabricante
JOIN producto
ON (fabricante.codigo=producto.codigo_fabricante)
WHERE fabricante.nombre LIKE 'S%'
GROUP BY producto.codigo_fabricante
HAVING AVG(producto.precio)>20;


/* Apartado D */
-- No, si se tiene en cuenta que la tabla 'fabricantes' refleja a todos los posibles fabricantes, no tiene sentido que exista un producto que no esté relacionado con un fabricante. Esto es debido a la relación 1:N entre fabricante y producto y a la integridad relacional de las tablas.
