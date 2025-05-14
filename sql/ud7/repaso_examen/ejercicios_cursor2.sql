-- 2.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS cuentas_mes $$
CREATE PROCEDURE cuentas_mes(pmes VARCHAR(30))
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vid, vnum_mes, vcontador INT;

  DECLARE cursor1 CURSOR FOR
  SELECT id_cuenta
  FROM cuentas
  WHERE MONTH(fecha) = vnum_mes;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  CASE 
    WHEN pmes='enero' THEN SET vnum_mes=1;
    WHEN pmes='febrero' THEN SET vnum_mes=2;
    WHEN pmes='marzo' THEN SET vnum_mes=3;
    WHEN pmes='abril' THEN SET vnum_mes=4;
    WHEN pmes='mayo' THEN SET vnum_mes=5;
    WHEN pmes='junio' THEN SET vnum_mes=6;
    WHEN pmes='julio' THEN SET vnum_mes=7;
    WHEN pmes='agosto' THEN SET vnum_mes=8;
    WHEN pmes='septiembre' THEN SET vnum_mes=9;
    WHEN pmes='octubre' THEN SET vnum_mes=10;
    WHEN pmes='noviembre' THEN SET vnum_mes=11;
    WHEN pmes='diciembre' THEN SET vnum_mes=12;
  END CASE;

  SET lrf=0, vid=0, vcontador=0;
  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vid;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SET vcontador = vcontador + 1;
  END LOOP bucle;
  CLOSE cursor1;

  INSERT INTO Cuentas_mes VALUES (vnum_mes, vcontador);

END; $$

DELIMITER ;

-- 3.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS contador_meses $$
CREATE PROCEDURE contador_meses()
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vid, vnum_mes, vcontador INT;

  DECLARE cursor1 CURSOR FOR
  SELECT id_cuenta
  FROM cuentas
  WHERE MONTH(fecha) = vnum_mes;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vid=0, vnum_mes=1;
  bucle1: LOOP
    SET vcontador=0;
    OPEN cursor1;
    bucle2: LOOP
      FETCH cursor1 INTO vid;
      IF lrf=1 THEN
        LEAVE bucle2;
      END IF;
      SET vcontador = vcontador + 1;
    END LOOP bucle2;
    CLOSE cursor1;

    INSERT INTO Cuentas_mes VALUES (vnum_mes, vcontador);
    SET vnum_mes = vnum_mes + 1;
    SET lrf = 0;
    
    IF vnum_mes > 12 THEN
      LEAVE bucle1;
    END IF;
  END LOOP bucle1;

END; $$

DELIMITER ;
