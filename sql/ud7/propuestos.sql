/* Ejercicio propuesto: Ejemplo 15 */

DELIMITER $$
DROP FUNCTION IF EXISTS bd.cajas_de_almacen $$
CREATE FUNCTION cajas_de_almacen(numAlmacen INT)
RETURNS INT
BEGIN
  DECLARE resultado INT;
  SELECT COUNT(*) INTO resultado 
  FROM almacenes
  WHERE almacen = numAlmacen;
  RETURN resultado;
END; $$

DELIMITER ; 

/* Ejercicio propuesto: Ejemplo 16 */

DELIMITER $$
DROP PROCEDURE IF EXISTS bd.rellana_cajas $$
CREATE PROCEDURE bd.rellana_cajas(p.numreferencia INT, p.valor INT)
BEGIN
  CASE
    WHEN p.valor < 50 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 1);
    WHEN p.valor BETWEEN 50 AND 100 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 2);
    WHEN p.valor BETWEEN 100 AND 200 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 3);
    WHEN p.valor BETWEEN 200 AND 500 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 4);
    WHEN p.valor > 500 THEN SELECT 'No se puede almacenar';
  END CASE;
END; $$

DELIMITER ;

/* Ejercicio propuesto: Ejemplo 17 */

DELIMITER $$
DROP PROCEDURE IF EXISTS bd.precio_iva $$
CREATE PROCEDURE bd.precio_iva()
BEGIN
  ALTER TABLE productos ADD precio_con_iva FLOAT(10,2) AFTER precio;
  UPDATE productos SET precio_con_iva = precio*1.21 WHERE tipo = 'textil';
END; $$

DELIMITER ;


