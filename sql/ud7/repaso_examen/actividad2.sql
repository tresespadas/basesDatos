-- 1.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS mostrar_cat_salarial $$
CREATE PROCEDURE mostrar_cat_salarial(salario INT)
BEGIN
  CASE
    WHEN salario > 2500 THEN SELECT 'Alto' AS 'Categoría salarial';
    WHEN salario BETWEEN 1500 AND 2500 THEN SELECT 'Medio' AS 'Categoría salarial';
    WHEN salario < 1500 THEN SELECT 'Bajo' AS 'Categoría salarial';
  END CASE;
END $$

DELIMITER ;

-- 2.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS mostrar_cod_estado $$
CREATE PROCEDURE mostrar_cod_estado(codigo INT)
BEGIN
  CASE codigo
  WHEN 1 THEN SELECT 'Pendiente' AS 'Descripción del estado';
  WHEN 2 THEN SELECT 'En Proceso' AS 'Descripción del estado';
  WHEN 3 THEN SELECT 'Enviado' AS 'Descripción del estado';
  ELSE SELECT 'Desconocido' AS 'Descripción del estado';
  END CASE;
END $$

DELIMITER ;

-- 3.
DELIMITER $$
USE bd_repaso $$
DROP FUNCTION IF EXISTS año_bisiesto $$
CREATE FUNCTION año_bisiesto(año INT)
RETURNS BOOLEAN
BEGIN
  DECLARE resultado BOOLEAN;
  IF (año % 4 = 0 && año % 100 <> 0) THEN
    SET resultado = 1;
  ELSEIF (año % 400 = 0) THEN
    SET resultado = 1;
  ELSE
    SET resultado = 0;
  END IF;
  RETURN resultado;
END $$

DELIMITER ;

-- 4.
DELIMITER $$
USE bd_repaso $$
DROP FUNCTION IF EXISTS distancia_dias $$
CREATE FUNCTION distancia_dias(fecha1 DATE, fecha2 DATE)
RETURNS INT
  RETURN ABS(DATEDIFF(fecha1, fecha2)); $$

DELIMITER ;

-- 4. (mejorado)
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS distancia_dias $$
CREATE PROCEDURE distancia_dias(fecha1 DATE, fecha2 DATE)
BEGIN
  DECLARE dias INT;
  SET dias = ABS(DATEDIFF(fecha1, fecha2));
  SELECT CONCAT('Hay ',dias,' días entre la fecha ',fecha1,' y la fecha ',fecha2);
END $$

DELIMITER ;
