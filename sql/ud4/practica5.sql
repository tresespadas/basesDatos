USE practica5;

/* Apartado A */
SELECT Matrícula
FROM TAutocares
WHERE Plazas <= 50 AND Modelo = 'Plane'
ORDER BY Matrícula DESC;

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
