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

INSERT INTO TEmpleados (NombreEm, ApellidosEm, IdEmpleado, FechaAntigüedadEm) VALUES
('Juan', 'Gómez de Lidño', 1111, '1970-02-20'),
('Luis', 'del Olmo Olinillo', 2222, '1982-12-15'),
('Juana', 'Reina de España', 3333, '1997-10-10'),
('Dolores', 'Fuerte de Barriga', 4444, '1970-12-12'),
('José', 'Ortega Cano', 5555, '1988-04-15');

INSERT INTO TAutocares (Matricula, Plazas, Modelo) VALUES
('AA-1111-AA', 50, 'Travel'),
('BB-2222-BB', 52, 'Travel'),
('CC-3333-CC', 50, 'Travel'),
('DD-4444-DD', 48, 'Plane'),
('EE-5555-EE', 48, 'Confort'),
('FF-6666-FF', 45, 'Plane');

INSERT INTO TDesplazamientos (FechaDesplazamien, Autocar, Conductor, Destino, TotalViajeros) VALUES
('1998-01-01', 'BB-2222-BB', 3333, 'Granada', 45),
('1998-02-02', 'CC-3333-CC', 1111, 'Cordoba', 44),
('1998-03-03', 'AA-1111-AA', 4444, 'Jaen', 47),
('1998-04-04', 'CC-3333-CC', 2222, 'Huelva', 47),
('1998-04-20', 'DD-4444-DD', 1111, 'Cordoba', 46),
('1998-01-01', 'EE-5555-EE', 5555, 'Almería', 45);

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
SELECT NombreEm
FROM TEmpleados
WHERE FechaAntigüedadEm>(
  SELECT FechaAntigüedadEm
  FROM TEmpleados
  WHERE NombreEm='Dolores'
);

/* Apartado G */
SELECT Conductor, AVG(TotalViajeros) AS media_viajeros_conductor
FROM TDesplazamientos
GROUP BY Conductor;

/* Apartado H */
SELECT TAutocares.Modelo
FROM TAutocares
WHERE TAutocares.Plazas=(
  SELECT MIN(TAutocares.Plazas)
  FROM TAutocares
); 

/* Apartado I */
SELECT TAutocares.Matricula
FROM TAutocares
WHERE TAutocares.Plazas >ALL(
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
  WHERE TDesplazamientos.Destino='Cordoba'
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
