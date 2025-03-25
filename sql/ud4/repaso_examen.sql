DROP DATABASE IF EXISTS repaso1;
CREATE DATABASE repaso1;
USE repaso1;

-- Creación de tablas
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    gastos DECIMAL(12,2) DEFAULT 0
);

CREATE TABLE Empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    id_departamento INT,
    id_manager INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento),
    FOREIGN KEY (id_manager) REFERENCES Empleados(id_empleado)
);

CREATE TABLE Proyectos (
    id_proyecto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin_estimada DATE NOT NULL,
    fecha_fin_real DATE,
    presupuesto DECIMAL(12,2) NOT NULL,
    id_departamento_responsable INT NOT NULL,
    FOREIGN KEY (id_departamento_responsable) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE Asignaciones (
    id_asignacion INT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_proyecto INT NOT NULL,
    horas_asignadas INT NOT NULL,
    rol VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id_proyecto)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    industria VARCHAR(50) NOT NULL,
    tamaño VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE Ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_venta DATE NOT NULL,
    monto DECIMAL(12,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

-- Inserción de datos
INSERT INTO Departamentos VALUES 
(1, 'Desarrollo', 500000, 475000),
(2, 'Ventas', 300000, 320000),
(3, 'Marketing', 200000, 210000),
(4, 'Recursos Humanos', 150000, 145000),
(5, 'Finanzas', 250000, 230000),
(6, 'Investigación', 350000, 400000);

INSERT INTO Empleados VALUES
(1, 'Juan', 'Pérez', 75000, '2018-05-15', 1, NULL),
(2, 'María', 'Gómez', 85000, '2017-03-10', 1, 1),
(3, 'Carlos', 'López', 60000, '2019-11-20', 2, NULL),
(4, 'Ana', 'Martínez', 90000, '2016-07-05', 2, 3),
(5, 'Luis', 'Rodríguez', 55000, '2020-02-18', 3, NULL),
(6, 'Sofía', 'Hernández', 65000, '2019-08-22', 3, 5),
(7, 'Pedro', 'Sánchez', 80000, '2018-01-30', 4, NULL),
(8, 'Elena', 'Díaz', 70000, '2019-04-12', 5, NULL),
(9, 'Javier', 'Ruiz', 95000, '2015-09-25', 6, NULL),
(10, 'Laura', 'Fernández', 72000, '2020-06-08', 6, 9);

INSERT INTO Proyectos VALUES
(1, 'Sistema de Gestión', '2022-01-10', '2022-12-15', '2023-02-20', 120000, 1),
(2, 'Plataforma E-commerce', '2022-03-05', '2023-03-05', NULL, 250000, 1),
(3, 'Campaña Publicitaria Q2', '2022-04-01', '2022-06-30', '2022-07-15', 75000, 3),
(4, 'Optimización de Procesos', '2022-02-15', '2022-08-30', '2022-08-20', 90000, 5),
(5, 'Estudio de Mercado', '2022-05-20', '2022-11-30', NULL, 110000, 6),
(6, 'Nuevo Producto', '2022-06-01', '2023-06-01', NULL, 300000, 6);

INSERT INTO Asignaciones VALUES
(1, 1, 1, 200, 'Líder'),
(2, 2, 1, 180, 'Desarrollador'),
(3, 2, 2, 150, 'Desarrollador'),
(4, 3, 3, 100, 'Consultor'),
(5, 4, 3, 120, 'Coordinador'),
(6, 5, 3, 80, 'Diseñador'),
(7, 6, 4, 90, 'Analista'),
(8, 7, 4, 60, 'Revisor'),
(9, 8, 4, 110, 'Analista'),
(10, 9, 5, 200, 'Investigador'),
(11, 10, 5, 170, 'Asistente'),
(12, 9, 6, 250, 'Líder'),
(13, 10, 6, 200, 'Investigador');

INSERT INTO Clientes VALUES
(1, 'TechSolutions Inc.', 'Tecnología', 'Grande', '2020-01-15'),
(2, 'Global Retail', 'Minorista', 'Mediana', '2020-03-22'),
(3, 'HealthCare Partners', 'Salud', 'Grande', '2020-05-10'),
(4, 'EduFuture', 'Educación', 'Pequeña', '2020-07-18'),
(5, 'GreenEnergy Corp.', 'Energía', 'Mediana', '2020-09-05'),
(6, 'FoodExpress', 'Alimentación', 'Grande', '2020-11-30');

INSERT INTO Ventas VALUES
(1, 1, 3, '2022-01-20', 50000, 'Completado'),
(2, 2, 4, '2022-02-15', 35000, 'Completado'),
(3, 3, 3, '2022-03-10', 42000, 'Cancelado'),
(4, 4, 4, '2022-04-05', 28000, 'Completado'),
(5, 5, 3, '2022-05-12', 65000, 'Pendiente'),
(6, 1, 4, '2022-06-18', 72000, 'Completado'),
(7, 6, 4, '2022-07-22', 38000, 'Completado'),
(8, 2, 3, '2022-08-30', 45000, 'Pendiente'),
(9, 3, 4, '2022-09-15', 55000, 'Completado'),
(10, 5, 4, '2022-10-10', 60000, 'Cancelado');

/* Ejercicio 1:
Muestra el nombre de cada departamento junto con la cantidad de empleados que tienen un salario superior al salario promedio de su propio departamento
*/

SELECT Departamentos.nombre, COUNT(Empleados.id_empleado)
FROM Departamentos
JOIN Empleados
ON ( Departamentos.id_departamento = Empleados.id_departamento )
WHERE Empleados.salario > (
  SELECT AVG(salario)
  FROM Empleados
  WHERE Empleados.id_departamento = Departamentos.id_departamento
)
GROUP BY Departamentos.id_departamento;

/* Ejercicio 2:
Lista los proyectos que tienen asignados empleados de más de un departamento diferente, mostrando el nombre del proyecto y la cantidad de departamentos involucrados. */

SELECT Proyectos.nombre, COUNT(Empleados.id_departamento) AS 'Numero de empleados'
FROM Asignaciones
JOIN Proyectos
ON ( Proyectos.id_proyecto = Asignaciones.id_proyecto )
JOIN Empleados
ON ( Asignaciones.id_empleado = Empleados.id_empleado )
GROUP BY Proyectos.id_proyecto
HAVING COUNT( DISTINCT Empleados.id_departamento )>1; 

/* Ejercicio 3:
Encuentra los clientes que han realizado al menos una venta en cada trimestre del año 2022, mostrando su nombre y el monto total gastado.*/ -- Lo del trismestre ni puta idea

SELECT *
FROM Clientes
WHERE id_cliente IN (
  SELECT id_cliente
  FROM Ventas
  WHERE estado = 'Completado' AND month(fecha_venta) = 03
);

/* Ejercicio 4:
Identifica los empleados que son managers y que gestionan a empleados con un salario promedio superior al 80% de su propio salario. */
