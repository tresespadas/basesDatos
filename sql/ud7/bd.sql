-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS bd;

-- Seleccionar la base de datos
USE bd;

-- Crear la tabla noticias
CREATE TABLE IF NOT EXISTS noticias (
    id_noticia INT AUTO_INCREMENT PRIMARY KEY,
    titulo_noticia VARCHAR(255) NOT NULL
);


-- Insertar varias noticias de ejemplo
INSERT INTO noticias (titulo_noticia) VALUES
('Descubren nueva especie marina en el Pacífico'),
('Avance revolucionario en energía renovable'),
('Elecciones nacionales: resultados preliminares'),
('La bolsa de valores alcanza récord histórico'),
('Nuevo tratamiento prometedor contra el cáncer');

-- Versión alternativa si usaste la estructura ampliada
-- INSERT INTO noticias (titulo_noticia, contenido, autor) VALUES
-- ('Descubren nueva especie marina', 'Científicos encontraron...', 'María López'),
-- ('Avance en energía renovable', 'Un equipo de ingenieros...', 'Carlos Méndez');
