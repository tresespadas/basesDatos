/* Ejercicio 5 */
DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.num5 $$
CREATE PROCEDURE prueba.num5(IN edad INT, IN nombre VARCHAR(255))
  BEGIN
    IF edad < 18 THEN INSERT INTO prueba.peques (nombre, edad);
    ELSE INSERT INTO prueba.adultos (nombre, edad);
    END IF;
  END; $$

DELIMITER ;


-- call prueba.saludo("a");
