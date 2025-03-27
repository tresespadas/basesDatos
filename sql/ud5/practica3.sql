CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  stock INT NOT NULL
) ENGINE=InnoDB;

/* Usuario 1 */
START TRANSACTION;
SELECT stock
FROM productos
WHERE id = 1
FOR UPDATE;
UPDATE productos SET stock = stock - 5 
WHERE id = 1;
COMMIT;

/* Usuario 2 */
START TRANSACTION;
SELECT stock
FROM productos
WHERE id = 1
FOR UPDATE;
UPDATE productos SET stock = stock - 5
WHERE id = 1;
COMMIT;
