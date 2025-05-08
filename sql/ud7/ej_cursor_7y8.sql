Ejercicios con un cursor 3:
1)

DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1()
BEGIN
	DECLARE vid INT;
	DECLARE lrf BOOL;
	
	DECLARE cursor1 CURSOR FOR
	SELECT id
	FROM productos
	WHERE stock_actual < stock_minimo;

	DECLARE CONTINUE HANDLER FOR NOT  FOUND SET lrf=1;

	SET lrf=0, vid=0;
	OPEN cursor1;
	bucle1: LOOP
		FETCH cursor1 INTO vid;
		IF lrf=1 THEN
			LEAVE bucle1;
		END IF;
		UPDATE productos SET estado=’BAJO STOCK’ WHERE id_producto=vid;
	END LOOP bucle1;
	CLOSE cursor1;

END; $$
DELIMITER ;

2)
DELIMITER $$
DROP PROCEDURE IF EXISTS bd.proc1 $$
CREATE PROCEDURE bd.proc1(pcurso INT)
BEGIN
	DECLARE vcalificacion, vsuma, vtotal_alumnos INT;
	DECLARE lrf BOOL;

	DECLARE cursor1 CURSOR FOR
	SELECT calificacion
	FROM calificaciones
	WHERE id_curso = pcurso;

	DECLARE CONTINUE HANDLER FOR NOT  FOUND SET lrf=1;

	SET lrf=0, vcalificacion=0, vsuma=0, vtotal_alumnos=0;
	OPEN cursor1;
	bucle1: LOOP
		FETCH cursor1 INTO vcalificacion;
		IF lrf=1 THEN
			LEAVE bucle1;
		END IF;
		vsuma = vsuma  + vcalificacion;
		vtotal_alumnos = vtotal_alumnos + 1;
	END LOOP bucle1;
	CLOSE cursor1;
	
	INSERT INTO Promedio_calificaciones_curso VALUES (pcurso, vsuma/vtotal_alumnos);

END; $$
DELIMITER ;
