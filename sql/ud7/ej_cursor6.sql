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
CREATE PROCEDURE bd.cursor1()
BEGIN
  DECLARE venero_total, vfebrero_total, vmarzo_total, vabril_total, vmayo_total, vjunio_total, vjulio_total, vagosto_total, vseptiembre_total, voctubre_total, vnoviembre_total, vdiciembre_total INT; 
  DECLARE lrf BOOL;

  DECLARE cursor1 CURSOR FOR
  SELECT id_cuenta
  FROM cuentas;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vmes=0;
  SET venero_total=0, vfebrero_total=0, vmarzo_total=0, vabril_total=0, vmayo_total=0, vjunio_total=0, vjulio_total=0, vagosto_total=0, vseptiembre_total=0, voctubre_total=0, vnoviembre_total=0, vdiciembre_total=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vmes;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    CASE
      WHEN (bd.fmes(vmes)) = 1 THEN SET venero_total = venero_total + 1;
      WHEN (bd.fmes(vmes)) = 2 THEN SET vfebrero_total = vfebrero_total + 1;
      WHEN (bd.fmes(vmes)) = 3 THEN SET vmarzo_total = vmarzo_total + 1;
      WHEN (bd.fmes(vmes)) = 4 THEN SET vabril_total = vabril_total + 1;
      WHEN (bd.fmes(vmes)) = 5 THEN SET vmayo_total = vmayo_total + 1;
      WHEN (bd.fmes(vmes)) = 6 THEN SET vjunio_total = vjunio_total + 1;
      WHEN (bd.fmes(vmes)) = 7 THEN SET vjulio_total = vjulio_total + 1;
      WHEN (bd.fmes(vmes)) = 8 THEN SET vagosto_total = vagosto_total + 1;
      WHEN (bd.fmes(vmes)) = 9 THEN SET vseptiembre_total = vseptiembre_total + 1;
      WHEN (bd.fmes(vmes)) = 10 THEN SET voctubre_total = voctubre_total + 1;
      WHEN (bd.fmes(vmes)) = 11 THEN SET vnoviembre_total = vnoviembre_total + 1;
      WHEN (bd.fmes(vmes)) = 12 THEN SET vdiciembre_total = vdiciembre_total + 1;
  END LOOP bucle;
  CLOSE cursor1;
  
  INSERT INTO cuentas_mes VALUES (MONTH(vmes), vtotal_cuentas);

END; $$
DELIMITER ;
