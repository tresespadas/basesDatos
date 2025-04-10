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
  DECLARE resultado INT;
  IF (num % 4 = 0) THEN SET resultado = 1;
  ELSEIF (num % 100 = 0) THEN 
    IF (num % 400 = 0) THEN SET resultado = 1;
    END IF;
  ELSE SET resultado = 0;
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
CREATE PROCEDURE prueba.bono_rendimiento(Empleados.id_empleado INT, Empleados.calificacion_rendimiento CHAR(1))
BEGIN
  DECLARE bono INT;
  CASE Empleados.calificacion_rendimiento
    WHEN 'A' THEN SET bono = 500;
    WHEN 'B' THEN SET bono = 250;
    WHEN 'C' THEN SET bono = 0;
  END CASE;
END; $$

DELIMITER ;

