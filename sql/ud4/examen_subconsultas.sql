DROP DATABASE IF EXISTS examen_subconsultas;
CREATE DATABASE examen_subconsultas CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE examen_subconsultas;

/* Tablas

- Artistas:
* artista_id (PRIMARY KEY)
* nombre
* pais_origen

- Canciones:
* cancion_id (PRIMARY KEY)
* artista_id (FOREIGN KEY(artista_id) REFERENCES Artistas(artista_id))
* nombre
* duración

- Reproducciones:
* reproducciones_id (PRIMARY KEY)
* cancion_id (FOREIGN KEY(cancion_id) REFERENCES Canciones(cancion_id))
* usuario_id 
* fecha_reproducción

*/

-- Tabla Artistas
CREATE TABLE Artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(100) NOT NULL
);

-- Tabla Canciones
CREATE TABLE Canciones (
    cancion_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_id INT,
    nombre VARCHAR(100) NOT NULL,
    duracion INT NOT NULL, -- Duración en minutos
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

-- Tabla Reproducciones
CREATE TABLE Reproducciones (
    reproduccion_id INT PRIMARY KEY AUTO_INCREMENT,
    cancion_id INT,
    usuario_id INT,
    fecha_reproduccion DATE NOT NULL, -- Formato YYYY/MM/DD
    FOREIGN KEY (cancion_id) REFERENCES Canciones(cancion_id)
);

INSERT INTO Artistas (nombre, pais_origen) VALUES
('Karol G', 'Colombia'),
('Bad Bunny', 'Puerto Rico'),
('Rosalía', 'España'),
('Shakira', 'Colombia'),
('J Balvin', 'Colombia'),
('Alejandro Sanz', 'España');

INSERT INTO Canciones (artista_id, nombre, duracion) VALUES
(1, 'Tusa', 3),
(1, 'Bichota', 4),
(2, 'Yonaguni', 3),
(3, 'Malamente', 2),
(4, 'Waka Waka', 5),
(5, 'Rojo', 3),
(6, 'Corazón Partío', 6);

INSERT INTO Reproducciones (cancion_id, usuario_id, fecha_reproduccion) VALUES
(1, 101, '2024/01/01'),
(1, 102, '2024/01/02'),
(1, 103, '2023/12/31'),
(2, 101, '2024/01/03'),
(2, 104, '2024/01/04'),
(3, 105, '2024/01/05'),
(4, 106, '2023/11/15'),
(5, 107, '2023/10/10'),
(6, 108, '2024/01/06'),
(7, 109, '2024/01/07'),
(7, 110, '2023/12/25');

/* Consulta 1: Muestra todos los artistas que son del mismo país que "Karol G", excluyendo a "Karol G" de los resultados. */

SELECT Artistas.*
FROM Artistas
WHERE pais_origen = (
  SELECT pais_origen
  FROM Artistas
  WHERE nombre='Karol G'
) AND nombre <> 'Karol G';

/* Consulta 2: Muestra las canciones que han sido reproducidas más de 100 veces, pero por menos de 50 usuarios diferentes. */

SELECT *
FROM Canciones
WHERE (
  SELECT COUNT(cancion_id)
  FROM Reproducciones
  WHERE Reproducciones.cancion_id = Canciones.cancion_id
) >100 AND (
  SELECT COUNT(DISTINCT usuario_id)
  FROM Reproducciones
  WHERE Reproducciones.cancion_id = Canciones.cancion_id
) <50;

/* Consulta 3: Muestra los nombres de los artistas que tienen canciones con una duración mayor a 3 minutos */

SELECT Artistas.*
FROM Artistas
WHERE artista_id IN (
  SELECT artista_id
  FROM Canciones
  WHERE duración > 3
);

/* Consulta 4: Muestra las canciones que han sido reproducidas en cualquier fecha que no sea del año 2024 */

SELECT Canciones.*
FROM Canciones
WHERE cancion_id IN (
  SELECT cancion_id
  FROM Reproducciones
  WHERE fecha_reproducción NOT LIKE '2024%'
);

/* Consulta 5: Muestra los artistas que tienen canciones con una duración mayor que todas las canciones de artistas de España */

SELECT Artistas.*
FROM Artistas
WHERE artista_id IN (
  SELECT artista_id
  FROM Canciones
  WHERE duración > ALL (
    SELECT Canciones.duración
    FROM Canciones
    WHERE artista_id IN (
      SELECT Artistas.artista_id
      FROM Artistas
      WHERE pais_origen='España'
    )
  )
);

/* Consulta 6: Muestra las canciones cuya duración es diferente a la duración de las canciones que han sido reproducidas más de 100 veces */

SELECT Canciones.*
FROM Canciones
WHERE duración NOT IN (
  SELECT duración
  FROM Canciones
  WHERE cancion_id IN (
    SELECT cancion_id
    FROM Reproducciones
    WHERE (
      SELECT COUNT(*)
      FROM Reproducciones
      WHERE Reproducciones.cancion_id = Canciones.cancion_id
    ) >100
  )
);

/* Consulta 7: Muestra las canciones que han sido reproducidas pero que no están registradas en la tabla de canciones */

SELECT Canciones.*
FROM Canciones
WHERE cancion_id IN (
  SELECT cancion_id
  FROM Reproducciones
  WHERE cancion_id NOT IN (
    SELECT cancion_id
    FROM Canciones
  )
);

