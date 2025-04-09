/* Ejercicio 1 */
DELIMITER $$
USE prueba $$
DROP FUNCTION IF EXISTS divisible $$
CREATE FUNCTION divisible(num1 INT, num2 INT)
RETURNS BOOLEAN
BEGIN
  DECLARE resultado BOOLEAN;
  IF num1 % num2 = 0 THEN SET resultado = true;
  ELSE SET resultado = false;
  END IF;
  RETURN resultado;
END; $$

DROP PROCEDURE IF EXISTS esDivisible $$
CREATE PROCEDURE esDivisible(IN num1 INT, IN num2 INT)
BEGIN
  IF divisible(num1,num2) THEN SELECT CONCAT("El número ",num1," es divisible por ",num2) AS "Resultado";
  ELSE SELECT CONCAT("El número ",num1," no es divisible por ",num2) AS "Resultado";
  END IF; 
END; $$

DELIMITER ;

/* Ejercicio 2 */
DELIMITER $$
USE prueba $$
DROP FUNCTION IF EXISTS diaSemana $$
CREATE FUNCTION diaSemana(num INT)
RETURNS VARCHAR(255)
BEGIN
  DECLARE dia VARCHAR(255);
  CASE 
    WHEN num = 1 THEN SET dia = "Lunes";
    WHEN num = 2 THEN SET dia = "Martes";
    WHEN num = 3 THEN SET dia = "Miércoles";
    WHEN num = 4 THEN SET dia = "Jueves";
    WHEN num = 5 THEN SET dia = "Viernes";
    WHEN num = 6 THEN SET dia = "Sábado";
    WHEN num = 7 THEN SET dia = "Domingo";
    ELSE THEN SELECT 'El valor introducido no es correcto';
  END CASE;
  RETURN dia;
END; $$


DROP PROCEDURE IF EXISTS calendario $$
CREATE PROCEDURE calendario(IN num INT)
BEGIN
  SELECT diaSemana(num) AS "resultado";
END; $$

DELIMITER ;

/* Ejercicio 3 */
DELIMITER $$
USE prueba $$
DROP FUNCTION IF EXISTS mayorDeTres $$
CREATE FUNCTION mayorDeTres(num1 INT, num2 INT, num3 INT)
RETURNS INT
BEGIN
  DECLARE mayorValor INT;
  IF num1 > num2 THEN
    IF num1 > num3 THEN SET mayorValor = num1;
    ELSE SET mayorValor = num3;
    END IF;
  ELSEIF num2 > num3 THEN SET mayorValor = num2;
    ELSE SET mayorValor = num3;
  END IF;
  RETURN mayorValor;
END; $$

DELIMITER ;

/* Ejercicio 4 */
DELIMITER $$
USE prueba $$
DROP FUNCTION IF EXISTS cuadrado $$
CREATE FUNCTION cuadrado(num1 INT)
RETURNS INT
BEGIN
  DECLARE resultado INT;
  SET resultado = POWER(num1,2);
  RETURN resultado;
END; $$

DELIMITER ;
/* Ejercicio 5 */
USE prueba;
DROP TABLE IF EXISTS peques;
DROP TABLE IF EXISTS adultos;

CREATE TABLE peques(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255),
  edad INT
) ENGINE=InnoDB;

CREATE TABLE adultos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255),
  edad INT
) ENGINE=InnoDB;

DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.num5 $$
CREATE PROCEDURE prueba.num5(IN nombre VARCHAR(255), IN edad INT)
  BEGIN
    IF edad < 18 THEN INSERT INTO prueba.peques (nombre, edad) VALUES (nombre, edad);
    ELSE INSERT INTO prueba.adultos (nombre, edad) VALUES (nombre, edad);
    END IF;
  END; $$

DELIMITER ;


-- call prueba.saludo("a");
