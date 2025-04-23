-- Create the database
DROP DATABASE IF EXISTS almacenes_cajas_db;
CREATE DATABASE almacenes_cajas_db;
USE almacenes_cajas_db;

-- Create almacenes table
CREATE TABLE almacenes (
    codigo INT NOT NULL PRIMARY KEY,
    lugar VARCHAR(100),
    capacidad INT
);

-- Create cajas table
CREATE TABLE cajas (
    numreferencia INT,
    valor INT,
    almacen INT,
    FOREIGN KEY (almacen) REFERENCES almacenes(codigo)
);

-- Insert sample data into almacenes
INSERT INTO almacenes (codigo, lugar, capacidad) VALUES
(1, 'Barcelona', 500),
(2, 'Madrid', 800),
(3, 'Valencia', 300),
(4, 'Sevilla', 400),
(5, 'Bilbao', 200);

-- Insert sample data into cajas
INSERT INTO cajas (numreferencia, valor, almacen) VALUES
(1001, 150, 1),
(1002, 200, 1),
(1003, 75, 2),
(1004, 300, 2),
(1005, 180, 2),
(1006, 90, 3),
(1007, 120, 3),
(1008, 250, 4),
(1009, 50, 5),
(1010, 170, 5),
(1011, 220, 1),
(1012, 110, 3);
