-- 18.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS borrar_caja $$
CREATE PROCEDURE borrar_caja(pnumreferencia INT)
BEGIN
  DECLARE vnumreferencia INT;

  SELECT numreferencia INTO vnumreferencia
  FROM cajas
  WHERE numreferencia = pnumreferencia;

  IF numreferencia IS NULL THEN
    SELECT "La caja con dicho número de referencia no existe";
  ELSE
    DELETE FROM cajas WHERE numreferencia = vnumreferencia;
  END IF;

END; $$
DELIMITER ;

-- 19.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS duracion_pelicula $$
CREATE PROCEDURE duracion_pelicula(pid INT)
BEGIN
  DECLARE minutos INT;

  SELECT duracion INTO minutos
  FROM peliculas
  WHERE id = pid;

  CASE
  WHEN minutos < 50 THEN
    SELECT "Corta duración";
  WHEN minutos BETWEEN 50 AND 120 THEN
    SELECT "Media duración";
  WHEN minutos > 120 THEN
    SELECT "Larga duración";
  ELSE
    SELECT "Película no encontrada";
  END CASE;
END; $$

DELIMITER ;

-- 20.
DELIMITER $$
USE bd_repaso $$
DROP PROCEDURE IF EXISTS cambiar_email $$
CREATE PROCEDURE cambiar_email(pid INT,pemail VARCHAR(255))
BEGIN
  DECLARE vid INT;

  SELECT id INTO vid
  FROM clientes
  WHERE id = pid;

  IF vid IS NULL THEN
    SELECT "El id del cliente no se encuentra en la base de datos"
  ELSE
    UPDATE clientes SET email = pemail WHERE id = vid; 
  END IF;
END; $$

DELIMITER ;
