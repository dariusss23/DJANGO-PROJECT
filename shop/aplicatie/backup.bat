@ECHO OFF

IF EXIST fisier_backup.sql DEL fisier_backup.sql
SET PGPASSWORD=darius

ECHO Realizam procesarea tabelelor


(FOR %%t IN ("aplicatie_brand" "aplicatie_categorie" "aplicatie_ceas" "aplicatie_ceas_depozit" "aplicatie_ceas_promotii" "aplicatie_comanda" "aplicatie_comanda_ceasuri" "aplicatie_comanda_useri" "aplicatie_customuser" "aplicatie_customuser_groups" "aplicatie_customuser_user_permissions" "aplicatie_depozit" "aplicatie_locatie" "aplicatie_material" "aplicatie_oferta" "aplicatie_oferta_categorii" "aplicatie_organizator" "aplicatie_promotie" "aplicatie_review" "aplicatie_vizualizare" "aplicatie_voucher" "aplicatie_voucher_useri" "auth_group" "auth_group_permissions" "auth_permission" "django_admin_log" "django_content_type" "django_migrations" "django_session") DO (
    ECHO Tabelul %%t

    pg_dump --column-inserts --data-only --inserts -h localhost -U darius -p 5432 -d dj2025 -t %%t >> fisier_backup.sql
))

SET PGPASSWORD=
