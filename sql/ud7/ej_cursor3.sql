DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
  DECLARE vid INT; -- Variable id de noticia
  DECLARE vsaldo INT; -- Variable id de noticia
  DECLARE vsaldo_max INT;
  DECLASE vid_max;
  DECLARE lrf BOOL; -- Variable para salir del bucle

  DECLARE cursor1 CURSOR FOR
  SELECT id, saldo
  FROM ebanca;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vsaldo_max=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vid, vsaldo;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    IF vsaldo_max < vsaldo THEN
      SET vsaldo_max = vsaldo;
      SET vid_max = vid;
    END IF;
  END LOOP bucle;
  CLOSE cursor1;

  SELECT vid;

END; $$
DELIMITER ;
