DROP DATABASE IF EXISTS repaso_practica2_ud5;
CREATE DATABASE repaso_practica2_ud5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repaso_practica2_ud5;

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

/* Ejercicio 1 */
INSERT INTO almacenes
VALUES (1, 'BARCELONA', 3);

/* Ejercicio 2 */
INSERT INTO cajas
VALUES ('H5RT', 'Papel', 200, 2);

/* Ejercicio 3 */
UPDATE cajas
SET valor = valor*0.85;

/* Ejercicio 4 */
UPDATE cajas
SET valor = valor*0.80
WHERE valor > (
  SELECT AVG(valor)
  FROM cajas
);

/* Ejercicio 5 */
DELETE
FROM cajas
WHERE valor < 100;

/* Ejercicio 6 */
DELETE 
FROM cajas
WHERE almacen IN (
  SELECT codigo
  FROM almacenes
  WHERE capacidad < (
    SELECT COUNT(*)
    FROM cajas
    WHERE almacenes.codigo = cajas.almacen
  )
);
