/* Ejercicio de función si un número es par */

DELIMITER $$
DROP FUNCTION IF EXISTS prueba.espar $$
CREATE FUNCTION prueba.espar(num1 INT)
RETURNS BOOLEAN
BEGIN
  DECLARE valor BOOLEAN;
  IF num1 % 2 = 0 THEN SET valor = true;
  ELSE SET valor = false;
  END IF;
  RETURN valor;
END; $$

DROP PROCEDURE IF EXISTS prueba.mensaje $$
CREATE PROCEDURE prueba.mensaje(IN num INT)
BEGIN
  IF prueba.espar(num) THEN SELECT CONCAT("El numero ",num," es par") AS "Resultado";
  ELSE SELECT CONCAT("El número ",num," no es par") AS "Resultado";
  END IF;
END; $$


DELIMITER ;
