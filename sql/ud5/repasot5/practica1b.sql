DROP DATABASE IF EXISTS repaso_practica1b_ud5;
CREATE DATABASE repaso_practica1b_ud5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repaso_practica1b_ud5;

CREATE TABLE depart (
  dept_no INT PRIMARY KEY,
  dnombre VARCHAR(100) NOT NULL,
  loc VARCHAR(100)
);

CREATE TABLE emple (
    emp_no INT PRIMARY KEY,
    apellido VARCHAR(100) NOT NULL,
    oficio VARCHAR(100),
    dir INT UNSIGNED,
    fecha_alt DATE,
    salario INT,
    comision INT,
    dept_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES depart(dept_no)
);

INSERT INTO depart (dept_no, dnombre, loc)
VALUES
(10,'CONTABILIDAD','SEVILLA'),
(20,'INVESTIGACIÓN','MADRID'),
(30,'VENTAS','BARCELONA'),
(40,'PRODUCCIÓN','BILBAO');

INSERT INTO emple (emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no) 
VALUES
(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980/12/17', 104000, NULL, 20),
(7499, 'ARROYO', 'VENDEDOR', 7698, '1980/02/20', 208000, 39000, 30),
(7521, 'SALA', 'VENDEDOR', 7698, '1981/02/22', 162500, 162500, 30),
(7566, 'JIMENEZ', 'DIRECTOR', 7839, '1981/04/02', 386750, NULL, 20),
(7654, 'MARTÍN', 'VENDEDOR', 7698, '1981/09/29', 162500, 182000, 30),
(7698, 'NEGRO', 'DIRECTOR', 7839, '1981/05/01', 370500, NULL, 30),
(7788, 'GIL', 'ANALISTA', 7566, '1981/11/09', 390000, NULL, 20),
(7839, 'REY', 'PRESIDENTE', NULL, '1981/11/17', 650000, NULL, 10),
(7844, 'TOVAR', 'VENDEDOR', 7698, '1981/09/08', 195000, 0, 30),
(7876, 'ALONSO', 'EMPLEADO', 7788, '1981/09/23', 143000, NULL, 20),
(7900, 'JIMENO', 'EMPLEADO', 7698, '1981/12/03', 1235000, NULL, 30),
(7902, 'FERNÁNDEZ', 'ANALISTA', 7566, '1981/12/03', 390000, NULL, 20),
(7934, 'MUÑOZ', 'EMPLEADO', 7782, '1982/01/23', 169000, NULL, 10);

/* Ejercicio 1 */
DELETE
FROM emple
WHERE salario > 0.5*(
  SELECT salario
  FROM emple
  WHERE oficio='PRESIDENTE'
) AND oficio <> 'PRESIDENTE';

/* Ejercicio 2 */
DELETE
FROM depart
WHERE dept_no NOT IN (
  SELECT dept_no
  FROM emple
);

/* Ejercicio 3 */
DELETE
FROM emple
WHERE salario > (
  SELECT MAX(salario)
  FROM emple
  WHERE dept_no=20
);

/* Ejercicio 4 */
DELETE
FROM emple
WHERE comision = (
  SELECT MIN(salario)
  FROM emple
);

/* Ejercicio 5 */
DELETE
FROM emple
WHERE oficio IS NULL;

/* Ejercicio 6 */
UPDATE emple
SET fecha_alt = (
  SELECT fecha_alt
  FROM emple
  WHERE emp_no=7782
)
WHERE emp_no=7839;

/* Ejercicio 7 */
DELETE
FROM depart
WHERE dnombre = (
  SELECT dnombre
  FROM depart
  WHERE dept_no=10
);

/* Ejercicio 8 */
INSERT INTO emple
VALUES (8002, 'LÓPEZ', 'VENDEDOR', 7955, '2023/11/21', 1500, 400, 30);

/* Ejercicio 9 */
INSERT INTO emple
SELECT 8001, apellido, oficio, dir, fecha_alt, salario, comision, 30
FROM emple
WHERE emp_no=7782;

/* Ejercicio 10 */
INSERT INTO depart
SELECT 50, 'RECURSOS HUMANOS', loc
FROM depart
WHERE dept_no=10;
