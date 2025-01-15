USE practica1;
/* Apartado 1 */
SELECT COUNT(potencia) AS coches_potentes
FROM coches
WHERE potencia>100;

/* Apartado 2 */
SELECT mes, AVG(ingresos) AS 'ingresos medios > 1K'
FROM productos
GROUP BY mes
HAVING AVG(ingresos)>1000;

/* Apartado 3 */
SELECT mes, SUM(ingresos) AS 'ingresos > 2.5K'
FROM productos
GROUP BY mes
HAVING SUM(ingresos)>2500
ORDER BY mes DESC;

/* Apartado 4 */
SELECT MIN(potencia) AS potencia_min, MAX(precio) AS precio_max, AVG(potencia) AS potencia_media, SUM(precio) AS precio_total
FROM coches
WHERE potencia>100;
