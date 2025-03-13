DROP DATABASE IF EXISTS practica1b_ud5;
CREATE DATABASE practica1b_ud5 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE practica1b_ud5;

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

/* Apartado 1 */
DELETE 
FROM emple
WHERE salario > (
  SELECT salario*0.5
  FROM emple
  WHERE oficio='PRESIDENTE' 
);

/* Apartado 2 */
DELETE
FROM depart
LEFT JOIN emple
ON (depart.dept_no=emple.dept_no)
WHERE emple.emp_no IS NULL

/* Apartado 2 */ -- Con subconsultas
DELETE
FROM depart
WHERE dept NOT IN (
  SELECT dept_no
  FROM emple
);

/* Apartado 3 */ -- DUDA: Empleados en general u oficio='EMPLEADO'
DELETE
FROM emple
WHERE salario > (
  SELECT MAX(salario)
  FROM emple
  WHERE dept_no=20
);

/* Apartado 4 */ -- DUDA: Empleados en general u oficio='EMPLEADO'
DELETE
FROM emple
WHERE comision = (
  SELECT MIN(salario)
  FROM emple
);

/* Apartado 5 */ -- Duda: Oficio no registrado
DELETE
FROM emple
WHERE oficio IS NULL;

/* Apartado 6 */
UPDATE emple
  SET fecha_alt=(
    SELECT fecha_alt
    FROM emple   
    WHERE emp_no=7782
  )
  WHERE emp_no=7839;

/* Apartado 7 */
DELETE
FROM depart
WHERE dnombre=(
  SELECT dnombre
  FROM depart
  WHERE dept_no=10
)
AND dept_no <> 10;

/* Apartado 8 */
INSERT INTO emple (emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no) 
VALUES
(8002, 'LÓPEZ', 'VENDEDOR', 7955, '2023/11/21', 1500, 400, 30);

/* Apartado 9 */
INSERT INTO emple (emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no) 
SELECT 8001, apellido, oficio, dir, fecha_alt, salario, comision, 30
FROM emple
WHERE emp_no=7782;

/* Apartado 10 */
INSERT INTO depart (dept_no, dnombre, loc)
SELECT 50, 'RECURSOS HUMANOS', loc
FROM depart
WHERE dept_no=10;
