-- 1.
DELIMITER $$
USE ebanca $$
DROP PROCEDURE IF EXISTS cuentas_noviembre $$
CREATE PROCEDURE cuentas_noviembre()
BEGIN
  DECLARE lrf BOOL; 
  DECLARE vid, vcontador INT;

  DECLARE cursor1 CURSOR FOR
  SELECT id
  FROM tabla
  WHERE MONTH(fecha) = 11;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

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
  
  SELECT vcontador;
END; $$

DELIMITER ;

-- 2.
DELIMITER $$
USE ebanca $$
DROP PROCEDURE IF EXISTS cuentas_saldo_negativo $$
CREATE PROCEDURE IF cuentas_saldo_negativo()
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vid, vcontador INT;
  DECLARE vnombre_titular VARCHAR(30);
  DECLARE vfecha_apertura DATE;

  DECLARE cursor1 CURSOR FOR
  SELECT id
  FROM tabla
  WHERE saldo < 0;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET vid=0, vcontador=0, vnombre_titular="", vfecha_apertura="", lrf=0;
  
  OPEN cursor1;
  bucle: LOOP
    FETCH into vid, vnombre_titular, vfecha_apertura;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    SELECT CONCAT('La cuenta con id ',id,' tiene de nombre titular a ',vnombre_titular,' y se abrió en la fecha ',vfecha_apertura);
  END LOOP bucle;
  CLOSE cursor1;
END; $$

DELIMITER ;
  

-- 3.
DELIMITER $$
USE ebanca $$
DROP PROCEDURE IF EXISTS cuenta_mayor_saldo $$
CREATE PROCEDURE cuenta_mayor_saldo()
BEGIN
  DECLARE lrf BOOLEAN;
  DECLARE vid, vsaldo_max INT;

  DECLARE cursor1 FOR
  SELECT id
  FROM tabla;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET lrf=1;

  SET lrf=0, vid=0, vsaldo_max=0;  

  OPEN cursor1;
  bucle: LOOP
    FETCH cursor1 INTO vid;
    IF lrf=1 THEN
      LEAVE bucle;
    END IF;
    IF vid > vsaldo_max THEN
      SET vsaldo_max = vid;
    END IF;
  END LOOP bucle;
  CLOSE cursor1;

  SELECT id
  FROM tabla
  WHERE saldo = vsaldo_max;

END; $$
DELIMITER ;
