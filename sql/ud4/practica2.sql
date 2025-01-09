USE practica1;
/* Apartado 1 */
SELECT * 
FROM clientes 
ORDER BY apellido1 DESC;

/* Apartado 2 */
SELECT apellido1, apellido2, población 
FROM clientes 
ORDER BY apellido2 ASC;

/* Apartado 3 */
SELECT * 
FROM clientes 
WHERE cod_cliente>2;

/* Apartado 4 */
SELECT *
FROM clientes
WHERE cod_cliente BETWEEN 2 AND 4;

/* Apartado 5 */
/* Hay que cambiar potencia a INT */
ALTER TABLE coches MODIFY potencia INT;

SELECT * 
FROM coches
WHERE precio BETWEEN 1000 AND 15000 AND potencia>100;

/* Apartado 6 */
SELECT * 
FROM coches
WHERE precio BETWEEN 1000 AND 15000 OR potencia>100;

/* Apartado 7 */
SELECT *
FROM coches
WHERE modelo LIKE 's%';

/* Apartado 8 */
SELECT *
FROM coches
WHERE modelo LIKE '%a';

/* Apartado 9 */
SELECT *
FROM coches
WHERE modelo LIKE '%a' AND precio>120.00;

/* Apartado 10 */
SELECT *
FROM coches
WHERE modelo LIKE '%a' OR precio>120.00;

/* Apartado 11 */
SELECT modelo, potencia, precio
FROM coches
WHERE potencia=90 OR potencia=100 OR potencia=200
ORDER BY potencia DESC;

/* Apartado 12 */
SELECT modelo, potencia, fecha, precio, precio*0.21 AS iva, disponible 
FROM coches 
ORDER BY precio ASC;
