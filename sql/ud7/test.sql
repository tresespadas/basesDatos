DELIMITER $$
DROP PROCEDURE IF EXISTS prueba.saludo $$
CREATE PROCEDURE prueba.saludo(IN letra char)
  BEGIN
    IF letra ='a' THEN SELECT 'hola';
    ELSEIF letra ='b' THEN SELECT 'adiós';
    END IF;
  END; $$

DELIMITER ;
