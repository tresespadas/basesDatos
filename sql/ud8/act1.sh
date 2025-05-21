# 1.

mysqldump -u root -p database_copia_practica1 > dumpeo.sql

# 2.

mysqldump -u root -p --databases practica1 almacenes_cajas_db > dumpeo.sql

# 3.

mysqldump -u root -p --all-databases > dumpeo.sql

# 4.

mysqldump -u root -p database_copia_practica1 cliente coches > dumpeo.sql

# 5.

mysqldump -u root -p --ignore-table=database_copia_practica1.productos database_copia_practica1 > dumpeo.sql

# 6.

mysqldump -u root -p --where="población = 'Madrid'" database_copia_practica1 clientes > dumpeo.sql

# 7.

mysqldump -u root -p --no-data database_copia_practica1 > dumpeo.sql

# 8.

mysqldump -u root -p practica1 > dumpeo.sql
mysql -u root -p -e "CREATE DATABASE database_copia_practica1"
mysql -u root -p database_copia_practica1 < dumpeo.sql

# 9.

SELECT * INTO OUTFILE 'dumpeo.txt' FIELDS OPTIONALLY ENCLOSED BY "," LINES TERMINATED BY '\n' FROM clientes;

1	,Pedro,	,Juan,	,Ana,	,Esperanza,	,Madrid,	,Las huertas,	,28001,	,9112345678,
2	,Garcia,	,Garriga,	,Jacinta,	,847474747,	,Barcelona,	,Diagonal 32,	,08004,	,93456789,
3	,Rovira,	,Sorlí,	,Galdos,	,949383838,	,Malaga,	,La paz,	,29001,	,67845493,
4	,Gonzalez,	,Aguirre,	,Rovira,	,123456798,	,Cordoba,	,Julio Romero,	,14001,	,57474747,

# 10.

LOAD DATA INFILE 'dumpeo.txt' IGNORE INTO TABLE clientes FIELDS OPTIONALLY ENCLOSED BY "," LINES TERMINATED BY '\n';



