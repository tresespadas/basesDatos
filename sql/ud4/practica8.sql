/* Apartado 1 */
SELECT Cajas.NumReferencia
FROM Cajas
WHERE Cajas.valor>150;

/* Apartado 2 */
SELECT DISTINCT Cajas.contenido
FROM Cajas;

/* Apartado 3 */
SELECT AVG(Cajas.valor) AS valor_medio_caja_total
FROM Cajas;

/* Apartado 4 */
SELECT AVG(Cajas.valor) AS valor_medio_caja_almacen
FROM Cajas
GROUP BY Cajas.Almacen;

/* Apartado 5 */
SELECT Cajas.Almacen
FROM Cajas
GROUP BY Cajas.Almacen
HAVING AVG(Cajas.valor)>150;

/* Apartado 6 */
SELECT Cajas.NumReferencia, Almacenes.lugar
FROM Cajas
JOIN Almacenes
ON (Almacenes.codigo=Cajas.almacen)

/* Apartado 7 */
SELECT COUNT(Cajas.NumReferencia)
FROM Cajas
GROUP BY Cajas.Almacen
