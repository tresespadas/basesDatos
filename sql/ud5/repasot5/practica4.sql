START TRANSACTION;

SELECT id INTO @id_habitacion
FROM habitaciones, reservas
WHERE habitaciones.id = reservas.id_habitacion
AND fecha_entrada NOT BETWEEN '2024/03/01' AND '2024/03/05'
AND fecha_salida NOT BETWEEN '2024/03/01' AND '2024/03/05'
AND tipo='DOBLE' 
AND disponible=true
LIMIT 1
FOR UPDATE;

UPDATE habitaciones
SET disponible = false
WHERE id = @id_habitacion;

INSERT INTO reservas
VALUES (@id_habitacion, '2024/03/01', '2024/03/05', 'JUAN', 'email_juan@gmail.com');

COMMIT;
