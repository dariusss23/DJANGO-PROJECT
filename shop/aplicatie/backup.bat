@ECHO OFF

IF EXIST fisier_backup.sql DEL fisier_backup.sql
SET PGPASSWORD=darius

ECHO Realizam procesarea tabelelor


(FOR %%t IN ("aplicatie_brand" "aplicatie_categorie" "aplicatie_ceas" "aplicatie_ceas_depozit" "aplicatie_ceas_promotii" "aplicatie_depozit" "aplicatie_material" "aplicatie_promotie") DO (
    ECHO Tabelul %%t

    pg_dump --column-inserts --data-only --inserts -h localhost -U darius -p 5432 -d dj2025 -t %%t >> fisier_backup.sql
))

SET PGPASSWORD=
