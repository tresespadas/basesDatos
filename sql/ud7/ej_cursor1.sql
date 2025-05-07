DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
  DECLARE vcont INT; -- Variable contador
  DECLARE vmes INT; -- Variable id de noticia
  DECLARE lrf BOOL; -- Variable para salir del bucle

  DECLARE cursor1 CURSOR FOR
  SELECT MONTH(fecha_creacion_cuenta)
  FROM ebanca;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vcont=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vmes;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    IF vmes = 11 THEN
      SET vcont = vcont + 1;
    END IF;
  END LOOP bucle;
  CLOSE cursor1;

  SELECT vcont;

END; $$
DELIMITER ;
