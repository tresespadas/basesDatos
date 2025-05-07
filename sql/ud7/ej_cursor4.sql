DELIMITER $$
DROP PROCEDURE IF EXISTS bd.cursor1 $$
CREATE PROCEDURE bd.cursor1(pmes INT)
BEGIN
  DECLARE vmes, vtotal_cuentas INT;
  DECLARE lrf BOOL;

  DECLARE cursor1 CURSOR FOR
  SELECT id_cuenta
  FROM cuentas
  WHERE MONTH(mes) = pmes;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vmes=0, vtotal_cuentas=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vmes;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vtotal_cuentas = vtotal_cuentas + 1;
  END LOOP bucle;
  CLOSE cursor1;
  
  INSERT INTO cuentas_mes VALUES (pmes, vtotal_cuentas);

END; $$
DELIMITER ;
