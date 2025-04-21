--// Inserta en una tabla el nombre del empleado, el sueldo y la categoría

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
CREATE FUNCTION prueba.insertar_categoria_salarial


--// Le pasa solo el id del empleado y tiene que coger la calificación (De la actividad2: ejercicio 5)


-- // Tabla(id_empleado, calificacion_redimiento, bono) el bono sin rellenar y hay que meter el bono (actividad2 :ejercicio 5)
