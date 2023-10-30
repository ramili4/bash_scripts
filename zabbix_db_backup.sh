#!/bin/bash

# Database credentials
DB_USER="db_admin"
DB_PASS="RG12345rg"
DB_NAME="zabbix_1"

# Backup directory and filename format
BACKUP_DIR="/home/ramil/database_backups"
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.sql.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform MySQL dump
mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" | gzip > "$BACKUP_FILE"

# Remove backups older than 7 days
find "$BACKUP_DIR" -type f -name "backup_*" -mtime +7 -exec rm {} \;

# Count the number of backups and delete excess backups
NUM_BACKUPS=$(ls -1 "$BACKUP_DIR" | grep -c '^backup_.*\.sql\.gz$')
while [ "$NUM_BACKUPS" -gt 7 ]; do
    OLDEST_BACKUP=$(ls -t "$BACKUP_DIR" | grep '^backup_.*\.sql\.gz$' | tail -1)
    rm "$BACKUP_DIR/$OLDEST_BACKUP"
    NUM_BACKUPS=$((NUM_BACKUPS-1))
done


NUM_BACKUPS=$(ls -1 "$BACKUP_DIR" | grep -c '^backup_.*\.sql\.gz$')
while [ "$NUM_BACKUPS" -gt 7 ]; do
    OLDEST_BACKUP=$(ls -t "$BACKUP_DIR" | grep '^backup_.*\.sql\.gz$' | tail -1)
    rm "$BACKUP_DIR/$OLDEST_BACKUP"
    NUM_BACKUPS=$((NUM_BACKUPS-1))
done

