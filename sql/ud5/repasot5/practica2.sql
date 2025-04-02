DROP DATABASE IF EXISTS repaso_practica2_ud5;
CREATE DATABASE repaso_practica2_ud5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repaso_practica2_ud5;

CREATE TABLE almacenes (
  codigo INT PRIMARY KEY,
  lugar VARCHAR(100),
  capacidad INT UNSIGNED
);

CREATE TABLE cajas (
    numreferencia CHAR(5) PRIMARY KEY,
    contenido VARCHAR(100),
    valor INT UNSIGNED,
    almacen INT,
    FOREIGN KEY (almacen) REFERENCES almacenes(codigo)
);

