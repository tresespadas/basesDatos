USE practica1;
/* Apartado 1 */
SELECT COUNT(potencia) AS coches_potentes
FROM coches
WHERE potencia>100;

/* Apartado 4 */
SELECT MIN(potencia) AS potencia_min, MAX(precio) AS precio_max, AVG(potencia) AS potencia_media, SUM(precio) AS precio_total
FROM coches
WHERE potencia>100;
