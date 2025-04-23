/* Ejercicio propuesto: Ejemplo 15 */

DELIMITER $$
DROP FUNCTION IF EXISTS bd.cajas_de_almacen $$
CREATE FUNCTION cajas_de_almacen(numAlmacen INT)
RETURNS INT
BEGIN
  DECLARE resultado INT;
  SELECT COUNT(*) INTO resultado 
  FROM almacenes
  WHERE almacen = numAlmacen;
  RETURN resultado;
END; $$

DELIMITER ; 

/* Ejercicio propuesto: Ejemplo 16 */

DELIMITER $$
DROP PROCEDURE IF EXISTS bd.rellana_cajas $$
CREATE PROCEDURE bd.rellana_cajas(p.numreferencia INT, p.valor INT)
BEGIN
  CASE
    WHEN p.valor < 50 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 1);
    WHEN p.valor BETWEEN 50 AND 100 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 2);
    WHEN p.valor BETWEEN 101 AND 200 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 3);
    WHEN p.valor BETWEEN 201 AND 500 THEN INSERT INTO cajas VALUES (p.numreferencia, p.valor, 4);
    WHEN p.valor > 500 THEN SELECT 'No se puede almacenar';
  END CASE;
END; $$

DELIMITER ;

/* Ejercicio propuesto: Ejemplo 17 */

DELIMITER $$
DROP PROCEDURE IF EXISTS bd.precio_iva $$
CREATE PROCEDURE bd.precio_iva()
BEGIN
  ALTER TABLE productos ADD precio_con_iva FLOAT(10,2);
  UPDATE productos SET precio_con_iva = precio*1.21 WHERE tipo = 'textil';
END; $$

DELIMITER ;

/* Ejercicio propuesto: Ejemplo 18 */
DELIMITER $$
DROP PROCEDURE IF EXISTS bd.quitar_caja $$
CREATE PROCEDURE bd.quitar_caja(p.numreferencia INT)
BEGIN
  DECLARE codigo INT;
  SET codigo = (SELECT numreferencia FROM cajas WHERE numreferencia = p.numreferencia)
  IF codigo IS NOT NULL THEN 
    DELETE FROM cajas WHERE numreferencia = codigo;
  ELSE
    SELECT 'La caja con ese numreferencia no existe. Operación cancelada.' AS 'Alerta';
  END IF;
END; $$

DELIMITER ;

/* Ejercicio propuesto: Ejemplo 19 */
DELIMITER $$
DROP PROCEDURE IF EXISTS bd.duracion_pelicula $$
CREATE PROCEDURE bd.duracion_pelicula(p.id_pelicula INT)
BEGIN
  DECLARE minutos INT;
  SET minutos = (SELECT duracion FROM peliculas WHERE codigo = p.id_pelicula)
  CASE
    WHEN minutos > 120 THEN SELECT 'Larga duración';
    WHEN minutos BETWEEN 50 AND 120 THEN SELECT 'Media duración';
    WHEN minutos < 50 THEN SELECT 'Corta duración';
    ELSE THEN 'Película no encontrada';
  END CASE;
END; $$

DELIMITER ;

/* Ejercicio propuesto: Ejemplo 20 */
DELIMITER $$
DROP PROCEDURE IF EXISTS bd.cambio_correo $$
CREATE PROCEDURE bd.cambio_correo(p.id_cliente INT, p.nuevo_email VARCHAR(255))
BEGIN
  UPDATE clientes SET email = p.nuevo_email WHERE id = p.id_cliente;
END; $$

DELIMITER ;
