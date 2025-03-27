CREATE TABLE habitaciones (
 id INT PRIMARY KEY AUTO_INCREMENT,
 tipo VARCHAR(255) NOT NULL,
 capacidad INT NOT NULL,
 precio DECIMAL(10,2) NOT NULL,
 disponible BOOLEAN NOT NULL DEFAULT TRUE
);
CREATE TABLE reservas (
 id INT PRIMARY KEY AUTO_INCREMENT,
 id_habitacion INT NOT NULL,
 fecha_entrada DATE NOT NULL,
 fecha_salida DATE NOT NULL,
 nombre VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id)
);


/* Con CASE */
START TRANSACTION;
SELECT tipo, fecha_entrada, fecha_salida, disponible
FROM reservas
WHERE id_habitacion IN (
  SELECT id_habitacion
  FROM habitaciones
  WHERE tipo = 'Doble'
  AND disponible = true
) AND fecha_entrada = '2024-03-01' AND fecha_salida = '2024-03-05'
LIMIT 1;
FOR UPDATE;
UPDATE reservas SET disponible = CASE
  WHEN disponible = true THEN false
  ELSE disponible
END
WHERE id_habitacion IN (
  SELECT id_habitacion
  FROM habitaciones
  WHERE tipo = 'Doble'
) AND fecha_entrada = '2024-03-01' AND fecha_salida = '2024-03-05'
LIMIT 1
AND SET nombre = 'Juan'
AND SET fecha_entrada = '2024-03-01' 
AND SET fecha_salida = '2024-03-05'
SET email = 'email_juan@email.com'
COMMIT;

