-- 15.
DELIMITER $$
USE bd_repaso $$
DROP FUNCTION IF EXISTS num_cajas_almacen $$
CREATE FUNCTION num_cajas_almacen(pcodigo INT)
RETURNS INT;
BEGIN
  DECLARE totalCajas INT;
  
  SELECT COUNT(*) INTO totalCajas
  FROM cajas
  WHERE numreferencia = pcodigo;
  
  RETURN totalCajas;
END $$
DELIMITER ;


-- 16. 
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS añadir_caja $$
CREATE PROCEDURE añadir_cajas(pnumreferencia INT, pvalor INT)
BEGIN
  CASE
    WHEN pvalor < 50 THEN
      INSERT INTO cajas VALUES (pnumreferencia, pvalor, 1);
    WHEN pvalor BETWEEN 50 AND 100 THEN
      INSERT INTO cajas VALUES (pnumreferencia, pvalor, 2);
    WHEN pvalor BETWEEN 101 AND 200 THEN
      INSERT INTO cajas VALUES (pnumreferencia, pvalor, 3);
    WHEN pvalor BETWEEN 201 AND 500 THEN
      INSERT INTO cajas VALUES (pnumreferencia, pvalor, 4);
    WHEN pvalor > 500 THEN
      SELECT 'No se puede almacenar';
  END CASE;
END $$

DELIMITER ;


-- 17.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS añadir_iva $$
CREATE PROCEDURE añadir_iva
BEGIN

