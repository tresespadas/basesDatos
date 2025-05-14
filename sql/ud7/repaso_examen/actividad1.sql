 -- 1. 
DELIMITER $$
USE bd_repaso $$
DROP FUNCTION IF EXISTS divisible $$
CREATE FUNCTION divisible(num1 INT, num2 INT)
RETURNS BOOLEAN
BEGIN
  DECLARE resultado BOOLEAN;
  IF (num1 % num2 = 0) THEN
    SET resultado = 1;
  ELSE
    SET resultado = 0;
  END IF;
  RETURN resultado;
END $$

DELIMITER ;

-- 1. (mejorado)
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS divisible_mejorado $$
CREATE PROCEDURE divisible_mejorado(num1 INT, num2 INT)
BEGIN
  IF (num1 % num2 = 0) THEN
    SELECT CONCAT('El numero ',num1,' es divisible por ',num2) AS 'Mensaje';
  ELSE
    SELECT CONCAT('El numero ',num1,' no es divisible por ',num2) AS 'Mensaje';
  END IF;
END $$

DELIMITER ;

-- 2.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS dia_semana $$
CREATE PROCEDURE dia_semana(num INT)
BEGIN
  CASE num
    WHEN 1 THEN SELECT 'domingo';
    WHEN 2 THEN SELECT 'lunes';
    WHEN 3 THEN SELECT 'martes';
    WHEN 4 THEN SELECT 'miércoles';
    WHEN 5 THEN SELECT 'jueves';
    WHEN 6 THEN SELECT 'viernes';
    WHEN 7 THEN SELECT 'sábado';
  END CASE;
END $$

DELIMITER ;

-- 3.
DELIMITER $$
USE bd_repaso $$
DROP FUNCTION IF EXISTS mayor_de_tres $$
CREATE PROCEDURE mayor_de_tres(num1 INT, num2 INT)
