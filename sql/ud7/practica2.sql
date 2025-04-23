/* Actividad 2: Ejercicio 1 */
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

/* Actividad 2: Ejercicio 2 */
DELIMITER $$
DROP FUNCTION IF EXISTS prueba.estado_pedido $$
CREATE FUNCTION prueba.estado_pedido(num INT)
RETURNS VARCHAR(255)
BEGIN
  DECLARE estado VARCHAR(255);
  CASE num
    WHEN 1 THEN SET estado = 'Pendiente';
    WHEN 2 THEN SET estado = 'En Proceso';
    WHEN 3 THEN SET estado = 'Enviado';
    ELSE SET estado = "Desconocido";
  END CASE; 
  RETURN estado;
END; $$

DELIMITER ;

/* Actividad 2: Ejercicio 3 */
DELIMITER $$
DROP FUNCTION IF EXISTS prueba.bisiesto $$
CREATE FUNCTION prueba.bisiesto(num INT)
RETURNS INT
BEGIN
  DECLARE resultado BOOLEAN;
  IF (num % 4 = 0) THEN 
    IF (num % 100 <> 0) THEN SET resultado = true;
    END IF;
  ELSEIF (num % 400 = 0) THEN SET resultado = true;
  ELSE SET resultado = false;
  END IF;
  RETURN resultado;
END; $$

DELIMITER ;

/* Actividad 2: Ejercicio 4 */ 
DELIMITER $$
DROP FUNCTION IF EXISTS prueba.compara_fechas $$
CREATE FUNCTION prueba.compara_fechas(fecha1 DATE, fecha2 DATE)
RETURNS INT
  RETURN ABS(DATEDIFF(fecha1, fecha2)); $$

DELIMITER ;

/* Actividad 2: Ejercicio 5 */
DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.bono_rendimiento $$
CREATE PROCEDURE prueba.bono_rendimiento(id_empleado INT, calificacion_rendimiento CHAR(1))
BEGIN
  CASE calificacion_rendimiento
    WHEN 'A' THEN RETURN 500;
    WHEN 'B' THEN RETURN 250;
    WHEN 'C' THEN RETURN 0;
    ELSE RETURN NULL;
  END CASE;
END; $$

DELIMITER ;

/* Actividad 2: Ejercicio 6 */
DELIMITER $$
USE bd $$
DROP PROCEDURE IF EXISTS ejercicio $$
CREATE PROCEDURE ejercicio (id INT, nombre VARCHAR(255), edd INT, salario FLOAT(10,2), salario_min INT)
BEGIN
  IF salario >= salario_min THEN INSERT INTO empleados VALUES(id, nombre, edad, salario);
  ELSE SELECT 'El salario introducido es demasiado bajo';
  END IF;
END; $$

DELIMITER ;
