/* ENUNCIADO DE CHATGPT

Sistema de Alquiler de Coches:

Objetivo: Implementar un sistema de reservas para una empresa de alquiler de coches, utilizando transacciones y bloqueos a nivel de fila para evitar la doble reserva de vehículos.

CREATE TABLE coches (
  id INT PRIMARY KEY AUTO_INCREMENT,
  marca VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE alquileres (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_coche INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  nombre_cliente VARCHAR(255) NOT NULL,
  email_cliente VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_coche) REFERENCES coches(id)
);

Enunciado: Un usuario llamado Pedro desea alquilar un coche de la marca "Toyota" para las fechas 2024-04-10 a 2024-04-12. Asegúrate de que se realice la reserva solo si el coche está disponible en esas fechas, bloqueando la fila correspondiente para evitar que otro cliente haga una reserva para el mismo vehículo en ese periodo.

*/

START TRANSACTION;

SELECT id INTO @id_coche
FROM coches, alquileres
WHERE coches.id = alquileres.id_coche
AND disponible = TRUE
AND marca='Toyota'
AND fecha_inicio NOT BETWEEN '2024/04/10' AND '2024/04/12'
AND fecha_fin NOT BETWEEN '2024/04/10' AND '2024/04/12'
LIMIT 1
FOR UPDATE;

UPDATE coches
SET disponible = FALSE
WHERE id = @id_coche;

INSERT INTO alquileres (id_coche, fecha_inicio, fecha_fin, nombre_cliente, email_cliente)
VALUES (@id_coche, '2024/04/10', '2024/04/12', 'Pedro', 'perrosanxe@ladron.es');

COMMIT;
