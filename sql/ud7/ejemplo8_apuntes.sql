DELIMITER $$
USE prueba $$
DROP PROCEDURE IF EXISTS proc1 $$
CREATE PROCEDURE proc1(IN parametro1 INT)
BEGIN
  DECLARE variable1, variable2 INT;
  IF parametro1 = 17 THEN SET variable1 = parametro1;
  ELSE SET variable2 = 30;
  END IF;
  INSERT INTO prueba.t (variable1, variable2) VALUES(variable1, variable2);
END; $$

DELIMITER ; 




