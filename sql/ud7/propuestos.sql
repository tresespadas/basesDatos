/* Ejercicio propuesto: Ejemplo 15 */

DELIMITER $$
DROP FUNCTION IF EXISTS bd.cajas_de_almacen $$
CREATE FUNCTION cajas_de_almacen(numAlmacen INT)
RETURNS INT
BEGIN
  DECLARE resultado INT;
  SELECT COUNT(*) INTO resultado 
  FROM cajas
  JOIN almacenes
  ON (cajas.almacen = almacenes.codigo)
  WHERE almacenes.codigo = numAlmacen
  GROUP BY cajas.almacen;
  RETURN resultado;
END; $$

DELIMITER ; 
