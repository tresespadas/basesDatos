# 1.

/opt/lampp/bin/mysqldump -u root -p database_copia_practica1 > dumpeo.sql

# 2.

/opt/lampp/bin/mysqldump -u root -p --databases practica1 almacenes_cajas_db > dumpeo.sql

# 3.

/opt/lampp/bin/mysqldump -u root -p --all-databases > dumpeo.sql

# 4.

/opt/lampp/bin/mysqldump -u root -p database_copia_practica1 cliente coches > dumpeo.sql

# 5.

/opt/lampp/bin/mysqldump -u root -p --ignore-table=database_copia_practica1.productos database_copia_practica1 > dumpeo.sql

# 6.

/opt/lampp/bin/mysqldump -u root -p --where="población = 'Madrid'" database_copia_practica1 clientes > dumpeo.sql

# 7.

/opt/lampp/bin/mysqldump -u root -p --no-data database_copia_practica1 > dumpeo.sql

# 8.

/opt/lampp/bin/mysqldump -u root -p practica1 > dumpeo.sql
/opt/lampp/bin/mysql -u root -p -e "CREATE DATABASE database_copia_practica1"
/opt/lampp/bin/mysql -u root -p database_copia_practica1 < dumpeo.sql
