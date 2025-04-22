-- Basado en el ejercicio 1 de la actividad 2, inserta en una tabla el nombre del empleado, el sueldo y la categoría

DELIMITER $$
DROP FUNCTION IF EXISTS prueba.categoria_salarial $$
CREATE FUNCTION prueba.categoria_salarial(salario INT)
RETURNS VARCHAR(255)
BEGIN
  DECLARE categoria_salarial VARCHAR(255);
  CASE
    WHEN salario<1500 THEN SET categoria_salarial = 'Bajo';
    WHEN salario>=1500 AND salario<2500 THEN SET categoria_salarial = 'Medio';
    WHEN salario>2500 THEN SET categoria_salarial = 'Alto';
    ELSE SET categoria_salarial = "Entrada incorrecta";
  END CASE; 
  RETURN categoria_salarial;
END; $$

DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.insertar_categoria_salarial $$
CREATE PROCEDURE prueba.insertar_categoria_salarial(nom_empleado VARCHAR(255), salario INT)
BEGIN
  INSERT INTO empleados VALUES(nom_empleado, salario, categoria_salarial(salario))
END; $$

DELIMITER ;


-- Basado en el ejercicio 5 de la actividad 2, haz que pasándo solo el id del empleado y tiene que coger la calificación

DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.mostar_calificacion $$
CREATE PROCEDURE prueba.mostar_calificacion(id_empleado INT)
BEGIN
  SELECT calificacion FROM empleados WHERE id = id_empleado INTO @calificacion_empleado  
  CASE @calificacion_empleado
    WHEN 'A' THEN RETURN 500;
    WHEN 'B' THEN RETURN 250;
    WHEN 'C' THEN RETURN 0;
    ELSE RETURN NULL;
  END CASE;
END; $$

DELIMITER ;

-- Basado en el ejercicio 5 de la actividad 2, donde la tabla tiene la forma: Tabla(id_empleado, calificacion_redimiento, bono) el bono sin rellenar y hay que meter el bono

DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.mostar_calificacion $$
CREATE PROCEDURE prueba.mostar_calificacion(id_empleado INT)
BEGIN
  SELECT calificacion FROM empleados WHERE id = id_empleado INTO @calificacion_empleado  
  CASE @calificacion_empleado
    WHEN 'A' THEN UPDATE empleados SET bono = 500 WHERE id = id_empleado;
    WHEN 'B' THEN UPDATE empleados SET bono = 250 WHERE id = id_empleado;
    WHEN 'C' THEN UPDATE empleados SET bono = 250 WHERE id = id_empleado;
    ELSE RETURN NULL;
  END CASE;
END; $$

DELIMITER ;
