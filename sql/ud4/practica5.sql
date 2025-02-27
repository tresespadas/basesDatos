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
)ENGINE=InnoDB;

-- Falta por rellenar
CREATE TABLE TDesplazamientos (
  FechaDesplazamien DATE,
  Autocar VARCHAR(50),
  Conductor CHAR(4),
  Destino VARCHAR(20),
  TotalViajeros INT
)ENGINE=InnoDB;

/* Apartado A */
SELECT Matricula
FROM TAutocares
WHERE Plazas <= 50 AND Modelo = 'Plane'
ORDER BY Matricula DESC;

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
SELECT COUNT(Matricula) as autobus_50_plazas
FROM TAutocares
WHERE Plazas >= 50;

/* Apartado F */
SELECT NombreEm,
FROM TEmpleados
WHERE FechaAntig>(
  SELECT FechaAntig
  FROM TEmpleados
  WHERE NombreEm='Dolores'
);

/* Apartado G */
SELECT Conductor, AVG(TotalViajeros) AS media_viajeros_conductor
FROM TDesplazamientos
GROUP BY Conductor;

/* Apartado H */
SELECT Modelo
FROM TAutocares
WHERE Plazas = (
  SELECT MIN(Plazas)
  FROM TAutocares
); 

/* Apartado I */
SELECT Matricula
FROM TAutocares
WHERE Plazas >ALL(
  SELECT Plazas
  FROM TAutocares
  WHERE Matricula IN (
    SELECT Matricula
    FROM TDesplazamientos
    WHERE Destino='Cordoba'
  )
);

/* Apartado I */ -- Otra forma?
SELECT Matricula
FROM TAutocares
WHERE Plazas >ALL(
  SELECT Plazas
  FROM TAutocares
  JOIN TDesplazamientos
  ON (TDesplazamientos.Autocar=TAutocares.Matricula)
  WHERE TDesplazamiento.Destino='Cordoba'
);

/* Apartado J */
SELECT NombreEm, ApellidosEm
FROM TEmpleados
WHERE IdEmpleado IN (
  SELECT Conductor
  FROM TDesplazamientos
  GROUP BY Conductor
  HAVING COUNT(FechaDesplazamien)>=2
);

