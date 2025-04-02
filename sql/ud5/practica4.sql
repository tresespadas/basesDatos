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


START TRANSACTION;
SELECT id_habitacion into @id_habitacion
FROM habitaciones, reservas
WHERE tipo = 'Doble'
AND habitaciones.id = reservas.id_habitacion
AND disponible = true
AND (fecha_entrada NOT BETWEEN '2024-03-1' AND '2024-03-05')
AND (fecha_salida NOT BETWEEN '2024-03-1' AND '2024-03-05')
LIMIT 1
FOR UPDATE;

UPDATE habitaciones 
SET disponible = FALSE 
WHERE id = @id_habitacion

INSER INTO reservas(id_habitacion, fecha_entrada, fecha_salida, nombre, email)
VALUES (@id_habitacion, '2024-03-01', '2024-03-05', 'Juan', 'email_juan@gmail.com');
COMMIT;
