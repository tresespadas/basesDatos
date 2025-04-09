DELIMITER $$
USE prueba $$
DROP PROCEDURE IF EXISTS ejemplo9 $$
CREATE PROCEDURE ejemplo9(IN param1 INT)
BEGIN
  DECLARE var1 INT;
  SET var1 = param1 + 1;
  IF var1 = 1 THEN INSERT INTO t (s1) VALUES (var1);
  END IF;
  IF param1 = 0 THEN UPDATE t SET s1 = s1 + 1;
  ELSE UPDATE t SET s1 = s1 + 2;
  END IF;
END; $$

DELIMITER ;
