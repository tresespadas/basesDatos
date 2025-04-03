/* ENUNCIADO POR CHATGPT

Objetivo: Implementar un sistema de subastas para productos, utilizando transacciones y bloqueos a nivel de fila para garantizar que no haya ofertas duplicadas y para actualizar el estado de los productos cuando se cierra una subasta.

CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  descripcion TEXT,
  precio_inicial DECIMAL(10, 2) NOT NULL,
  precio_actual DECIMAL(10, 2) NOT NULL,
  estado VARCHAR(50) NOT NULL DEFAULT 'Disponible'
);

CREATE TABLE ofertas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_producto INT NOT NULL,
  id_usuario INT NOT NULL,
  cantidad DECIMAL(10, 2) NOT NULL,
  fecha_oferta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_producto) REFERENCES productos(id)
);

Enunciado: Un usuario quiere hacer una oferta de $300 por el producto "Laptop". El producto tiene un precio inicial de $250 y un precio actual de $270. Sin embargo, la oferta solo puede ser aceptada si el precio de la oferta es mayor que el precio actual y si el producto no ha sido vendido. Después de la oferta, el estado del producto debe cambiar a "Vendido" si la subasta ha terminado.

*/

START TRANSACTION;

SELECT id INTO @id_producto
FROM productos, ofertas
WHERE productos.id = ofertas.id_producto
AND precio_actual < 300
AND estado = 'Disponible'
AND nombre = 'Laptop'
LIMIT 1
FOR UPDATE;

UPDATE productos
SET estado = 'Vendido'
WHERE id = @id_producto;

INSERT INTO ofertas (id_producto, id_usuario, cantidad, fecha_oferta)
VALUES (@id_producto, 1, 300, NOW());

COMMIT;
