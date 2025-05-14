-- 1.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXITS actualizar_stock $$
CREATE PROCEDURE actualizar_stock()
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vid_producto INT;

  DECLARE cursor1 CURSOR FOR
  SELECT id_producto
  FROM productos
  WHERE stock_actual < stock_minimo;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0;
  OPEN cursor1;
  bucle1: LOOP
    FETCH cursor1 INTO vid_producto;
    IF lrf THEN
      LEAVE bucle1;
    END IF;
    UPDATE productos SET estado = 'BAJO STOCK' WHERE id_producto = vid_producto;
  END LOOP bucle1;
  CLOSE cursor1;

END; $$

DELIMITER ;

-- 2.
DELIMITER $$
DROP PROCEDURE IF EXISTS promedio_calificaciones $$
CREATE PROCEDURE promedio_calificaciones(pcurso INT)
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vnota, vcalificaciones, vmedia FLOAT(3,2);
  DECLARE valumnos INT;

  DECLARE cursor1 CURSOR FOR
  SELECT calificación
  FROM calificaciones
  WHERE id_curso = pcurso;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vnota=0, vcalificaciones=0; vmedia=0, valumnos=0;
  OPEN cursor1;
  bucle1: LOOP
    FETCH cursor1 INTO vnota;
    IF lrf THEN
      LEAVE bucle1;
    END IF;
    SET vcalificaciones = vcalificaciones + vnota;
    SET valumnos = valumnos + 1;
  END LOOP bucle1;
  CLOSE cursor1;

  SET vmedia = vcalificaciones / valumnos;

  INSERT INTO promedio_calificaciones VALUES (pcurso, vmedia);
END; $$
DELIMITER ;
