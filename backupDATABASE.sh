#!/bin/bash
name="`date +%Y-%m-%d_%H:%M:%S`"
mysqldump -u root -pLivrogn8 --databases livrogne_api > /home/pi/bddn_ivrogne_backup/backup_ivrogne_$name.sql
