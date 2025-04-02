START TRANSACTION;
SELECT stock
FROM productos
WHERE id=1
FOR UPDATE;
UPDATE productos
SET stock = stock - 5;
WHERE id = 1;
COMMIT;


START TRANSACTION;
SELECT stock
FROM productos
WHERE id=1
FOR UPDATE;
UPDATE productos
SET stock = stock - 5;
WHERE id = 1;
COMMIT;
