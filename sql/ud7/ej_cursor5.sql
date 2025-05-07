DELIMITER $$
DROP FUNCTION IF EXISTS bd.fmes $$
CREATE FUNCTION bd.fmes(pmes VARCHAR(20))
RETURNS INT;
BEGIN
  DECLARE resultado INT;

  CASE
    WHEN "enero" THEN SET resultado = 1;
    WHEN "febrero" THEN SET resultado = 2;
    WHEN "marzo" THEN SET resultado = 3;
    WHEN "abril" THEN SET resultado = 4;
    WHEN "mayo" THEN SET resultado = 5;
    WHEN "junio" THEN SET resultado = 6;
    WHEN "julio" THEN SET resultado = 7;
    WHEN "agosto" THEN SET resultado = 8;
    WHEN "septiembre" THEN SET resultado = 9;
    WHEN "octubre" THEN SET resultado = 10;
    WHEN "noviembre" THEN SET resultado = 11;
    WHEN "diciembre" THEN SET resultado = 12;
  END CASE;

  RETURN resultado;

END; $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS bd.cursor1 $$
CREATE PROCEDURE bd.cursor1(pmes VARCHAR(20))
BEGIN
  DECLARE vmes, vmes_int, vtotal_cuentas INT;
  DECLARE lrf BOOL;

  DECLARE cursor1 CURSOR FOR
  SELECT id_cuenta
  FROM cuentas
  WHERE MONTH(fecha) = vmes_int;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vmes=0, vtotal_cuentas=0;
  SET vmes_int = bd.fmes(pmes);
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vmes;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vtotal_cuentas = vtotal_cuentas + 1;
  END LOOP bucle;
  CLOSE cursor1;
  
  INSERT INTO cuentas_mes VALUES (vmes_int, vtotal_cuentas);

END; $$
DELIMITER ;
