DROP DATABASE IF EXISTS repaso_t5_p1;
CREATE DATABASE repaso_t5_p1 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE repaso_t5_p1;

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
INSERT INTO emple (emp_no, apellido, dept_no) 
VALUES (9999, 'GONZALEZ', 10);

/* Ejercicio 2 */
INSERT INTO emple (emp_no, apellido, oficio, dir, fecha_alt, salario, comision, dept_no)
VALUES
(5000, 'MORAGA', 'EMPLEADO', 7902, '1999/10/17', 100000, NULL, 20);

/* Ejercicio 3 */
INSERT INTO depart
VALUES (50, 'GENERAL', 'SEVILLA');

/* Ejercicio 4 */
INSERT INTO depart (dept_no, dnombre)
VALUES (60, 'PRUEBAS');

/* Ejercicio 5 */
CREATE TABLE emple30 (
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

INSERT INTO emple30
SELECT *
FROM emple
WHERE dept_no=30;

/* Ejercicio 6 */
CREATE TABLE emple20 (
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

INSERT INTO emple20
SELECT *
FROM emple
WHERE dept_no=20;

/* Ejercicio 7 */
UPDATE emple
SET salario=salario*2
WHERE dept_no=20;

/* Ejercicio 8 */
UPDATE emple
SET dept_no=20
WHERE dept_no=30;

/* Ejercicio 9 */
UPDATE emple
SET salario=salario*1.1
WHERE dept_no=10;

/* Ejercicio 10 */
UPDATE depart
SET loc='BILBAO'
WHERE dept_no=10;

/* Ejercicio 11 */
UPDATE emple
SET salario = (
  SELECT salario
  FROM emple30
  WHERE apellido='NEGRO'
)
WHERE apellido='ARROYO';

/* Ejercicio 12 */
UPDATE emple
SET salario = (
  SELECT salario
  FROM emple30
  WHERE apellido='MUÑOZ'
)
AND oficio = (
  SELECT oficio
  FROM emple30
  WHERE apellido='MUÑOZ'
)
WHERE apellido='JIMENO';

/* Ejercicio 13 */
DELETE
FROM depart
WHERE dept_no=50;

/* Ejercicio 14 */
DELETE
FROM emple
WHERE dept_no=20 AND oficio='ANALISTA';

/* Ejercicio 15 */
DELETE
FROM emple
WHERE comision IS NULL;
