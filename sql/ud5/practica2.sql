DROP DATABASE IF EXISTS practica2_ud5;
CREATE DATABASE practica2_ud5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE practica2_ud5;

CREATE TABLE almacenes (
  codigo INT PRIMARY KEY,
  lugar VARCHAR(100),
  capacidad INT UNSIGNED
);

CREATE TABLE cajas (
    numreferencia CHAR(5) PRIMARY KEY,
    contenido VARCHAR(100),
    valor INT UNSIGNED,
    almacen INT,
    FOREIGN KEY (almacen) REFERENCES almacenes(codigo)
);

/* Apartado 1 */
INSERT INTO almacenes
VALUES 
(1, 'Barcelona', 3);

/* Apartado 2 */
INSERT INTO cajas
VALUES
('H5RT','Papel',200, 2);

/* Apartado 3 */
UPDATE cajas
SET valor=valor*0.85;

/* Apartado 4 */
UPDATE cajas
SET valor=0.80*(
  SELECT AVG(valor)
  FROM cajas
);

/* Apartado 5 */
DELETE
FROM cajas
WHERE valor < 100;

/* Apartado 6 */
UPDATE almacenes
SET capacidad=0
WHERE capacidad<(
  SELECT COUNT(*)
  FROM cajas
  WHERE cajas.almacen = almacenes.codigo
);
