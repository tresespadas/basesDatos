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
