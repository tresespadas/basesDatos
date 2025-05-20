#!/bin/env bash

DB_USER="root"
DB_NAME="bd_repaso"
BACKUP_DIR="/home/alvaro/Documentos/basesDatos/sql/ud8"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$DATE.sql"

# Crear directorio de respaldo si no existe
# mkdir -p $BACKUP_DIR

# Ejecutar la copia
mysqldump -u $DB_USER $DB_NAME > $BACKUP_FILE

# Eliminar archivos de respaldo que fueron modificados hace más de 7 días
find $BACKUP_DIR -type f -name "$DB_NAME*.sql.gz" -mtime +7 -exec rm {} \;
