-- 1.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS cuentas_noviembre $$
CREATE PROCEDURE cuentas_noviembre()
BEGIN
  DECLARE lrf BOOL; 
  DECLARE vid, vcontador INT;

  DECLARE cursor1 CURSOR FOR
  SELECT id INTO vid
  FROM tabla
  WHERE MONTH(fecha) = 11;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vid=0, vcontador=0;
  OPEN cursor1; 
  bucle: LOOP
    FETCH cursor1 INTO vid; 
    IF lrf=1 THEN
      LEAVE bucle
    END IF;
    SET vcontador = vcontador + 1;
  END LOOP bucle; 
  CLOSE cursor1;
  
  SELECT vcontador;
END; $$

DELIMITER ;
