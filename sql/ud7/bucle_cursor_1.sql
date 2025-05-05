DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
  DECLARE vcont INT; -- Variable contador
  DECLARE vid INT; -- Variable id de noticia
  DECLARE lrf BOOL; -- Variable para salir del bucle

  DECLARE cursor1 CURSOR FOR
  SELECT id_noticia
  FROM noticias;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vcont=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vid;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vcont = vcont + 1;
  END LOOP bucle;
  CLOSE cursor1;

  SELECT vcont;

END; $$
DELIMITER ;


DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
  DECLARE vcont INT; -- Variable contador
  DECLARE vid INT; -- Variable id de noticia
  DECLARE lrf BOOL; -- Variable para salir del bucle

  DECLARE cursor1 CURSOR FOR
  SELECT id
  FROM noticias;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vcont=0;
  OPEN cursor1;
  bucle: REPEAT
    FETCH cursor1 INTO vid;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vcont = vcont + 1;
  UNTIL lrf
  END REPEAT bucle;
  CLOSE cursor1;

  SELECT vcont;

END; $$
DELIMITER ;
*/
DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
  DECLARE vcont INT; -- Variable contador
  DECLARE vid INT; -- Variable id de noticia
  DECLARE lrf BOOL; -- Variable para salir del bucle

  DECLARE cursor1 CURSOR FOR
  SELECT id
  FROM noticias;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vcont=0;
  OPEN cursor1;
  bucle: WHILE (lrf=0) DO
    FETCH cursor1 INTO vid;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vcont = vcont + 1;
  END WHILE bucle;
  CLOSE cursor1;

  SELECT vcont;

END; $$
DELIMITER ;
