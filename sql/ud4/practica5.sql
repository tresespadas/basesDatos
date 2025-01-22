DROP DATABASE IF EXISTS practica5;
CREATE DATABASE practica5;
USE practica5;

CREATE TABLE TEmpleados (
  NombreEm VARCHAR(15),
  ApellidosEm VARCHAR(50),
  IdEmpleado CHAR(4),
  FechaAntigüedadEm DATE,
  PRIMARY KEY(NombreEm)
)ENGINE=InnoDB;

CREATE TABLE TAutocares (
  Matricula VARCHAR(20),
  Plazas CHAR(2),
  Modelo VARCHAR(10),
  PRIMARY KEY(Matricula)
)

CREATE TABLE TDesplazamientos (
  FechaDesplazamien
)

/* Apartado A */
SELECT Matricula
FROM TAutocares
WHERE Plazas <= 50 AND Modelo = 'Plane'
ORDER BY Matrícula DESC;

/* Apartado B */
SELECT NombreEm, ApellidosEm, Autocar
FROM TEmpleados
JOIN TDesplazamientos
ON (TEmpleados.IdEmpleado=TDesplazamientos.Conductor)
WHERE TDesplazamientos.Destino <>'Cordoba';

/* Apartado C */
SELECT *
FROM TDesplazamientos
JOIN TAutocares
ON (TDesplazamientos.Autocar=TAutocares.Matricula)
JOIN TEmpleados
ON (TDesplazamientos.Conductor=TEmpleados.IdEmpleado)
WHERE TDesplazamientos.Autocar='AA-1111-AA' OR TDesplazamientos.Autocar='DD-4444-DD'
ORDER BY TDesplazamientos.Autocar ASC;

/* Apartado D */
SELECT SUM(TotalViajeros) AS total_viajeros
FROM TDesplazamientos
GROUP BY Destino;

/* Apartado E */
SELECT COUNT(Matrícula) as autobus_50_plazas
FROM TAutocares
WHERE Plazas >= 50;

/* Apartado G */
SELECT Conductor, AVG(TotalViajeros) AS media_viajeros_conductor
FROM TDesplazamientos
GROUP BY Conductor;
