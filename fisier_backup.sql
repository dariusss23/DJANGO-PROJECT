--
-- PostgreSQL database dump
--

\restrict Pxfgiaq9mZYqL5geBC6MgL6Lri0T4FXOInDKTYf6EDFobqT2GMWUAyzeYP0No5g

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_brand; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_brand (id_brand, nume, tara_origine, website, categorie_brand) VALUES (1, 'Rolex', 'Elvetia', 'https://www.rolex.com', 'luxury');
INSERT INTO django.aplicatie_brand (id_brand, nume, tara_origine, website, categorie_brand) VALUES (2, 'Casio', 'Japonia', 'https://www.casio.com', 'budget');
INSERT INTO django.aplicatie_brand (id_brand, nume, tara_origine, website, categorie_brand) VALUES (3, 'Tissot', 'Elvetia', 'https://www.tissotwatches.com', 'mid-range');


--
-- Name: aplicatie_brand_id_brand_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_brand_id_brand_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Pxfgiaq9mZYqL5geBC6MgL6Lri0T4FXOInDKTYf6EDFobqT2GMWUAyzeYP0No5g

--
-- PostgreSQL database dump
--

\restrict ecuU5WCDgaRIdQvyObVXfC82Sz0dI4TKcVRaMk4bIa45T9vKM2cRlhHToKrcrVt

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_categorie; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_categorie (id_categorie, stil_ceas, gen, rezistent_apa, tip_ceas, descriere, icon) VALUES (3, 'luxury', 'barbati', 'nu', 'analog', 'Ceas premium cu detalii de lux', 'fa-regular fa-gem');
INSERT INTO django.aplicatie_categorie (id_categorie, stil_ceas, gen, rezistent_apa, tip_ceas, descriere, icon) VALUES (2, 'sport', 'femei', 'da', 'digital', 'Ceas sport colorat, rezistent la apa', 'fa-solid fa-person-running');
INSERT INTO django.aplicatie_categorie (id_categorie, stil_ceas, gen, rezistent_apa, tip_ceas, descriere, icon) VALUES (1, 'clasic', 'barbati', 'da', 'analog', 'Design minimalist, perfect pentru omul de afaceri contemporan', 'fa-solid fa-clock');


--
-- Name: aplicatie_categorie_id_categorie_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_categorie_id_categorie_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict ecuU5WCDgaRIdQvyObVXfC82Sz0dI4TKcVRaMk4bIa45T9vKM2cRlhHToKrcrVt

--
-- PostgreSQL database dump
--

\restrict 09H6rRD6S3t8Gc1XiMtg1fjiwfCCnjc6wdqy82NuCP6Xm6qJvUZqW7KjGmhmNcQ

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_ceas; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (2, 'Rolex Daytona', 72000.00, 3, '2022-12-10', true, '2025-10-30 10:34:08.141729+02', '#FFFFFF', 1, 3, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (1, 'Rolex Submariner', 55000.00, 5, '2023-05-01', true, '2025-10-30 02:13:41.538132+02', '#000000', 1, 3, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (3, 'Rolex Oyster Perpetual', 48000.00, 4, '2024-02-05', true, '2025-10-30 10:42:45.507813+02', '#708090', 1, 3, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (4, 'Casio G-Shock', 800.00, 25, '2024-03-10', true, '2025-10-30 10:44:02.00446+02', '#FF0000', 2, 2, 3);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (5, 'Casio Edifice', 1200.00, 15, '2024-06-01', true, '2025-10-30 10:45:05.171716+02', '#333333', 2, 1, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (6, 'Casio Vintage', 500.00, 30, '2023-10-01', true, '2025-10-30 10:46:09.780384+02', '#B8860B', 2, 1, 2);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (7, 'Tissot PRX', 3700.00, 10, '2024-04-10', true, '2025-10-30 10:46:42.703278+02', '#1C1C1C', 3, 1, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (8, 'Tissot Le Locle', 4200.00, 8, '2023-12-15', true, '2025-10-30 10:47:31.935584+02', '#A9A9A9', 3, 3, 2);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (9, 'Tissot Seastar', 4500.00, 6, '2025-03-20', true, '2025-10-30 10:48:12.933652+02', '#001F3F', 3, 2, 1);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (10, 'Casio Baby-G', 950.00, 18, '2024-07-01', true, '2025-10-30 10:48:43.74403+02', '#FFC0CB', 2, 2, 3);
INSERT INTO django.aplicatie_ceas (id_ceas, model, pret, stoc, data_lansare, disponibil_online, data_adaugare, "colorCode", brand_id, categorie_id, material_id) VALUES (11, 'Rolex MIAMI', 30600.00, 5, '2025-11-11', true, '2025-11-11 23:35:20.554573+02', '#006039', 1, 3, 1);


--
-- PostgreSQL database dump complete
--

\unrestrict 09H6rRD6S3t8Gc1XiMtg1fjiwfCCnjc6wdqy82NuCP6Xm6qJvUZqW7KjGmhmNcQ

--
-- PostgreSQL database dump
--

\restrict 92EdPueV62dyAXdOAOBsf3Ak1gJ8jeNKnZT7maBidkV3JID4bDpX2h6ed5d8Hak

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_ceas_depozit; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (1, 1, 1);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (2, 2, 1);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (3, 3, 1);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (4, 4, 2);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (5, 5, 2);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (6, 6, 2);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (7, 7, 1);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (8, 8, 2);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (9, 9, 2);
INSERT INTO django.aplicatie_ceas_depozit (id, ceas_id, depozit_id) VALUES (10, 10, 2);


--
-- Name: aplicatie_ceas_depozit_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_ceas_depozit_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 92EdPueV62dyAXdOAOBsf3Ak1gJ8jeNKnZT7maBidkV3JID4bDpX2h6ed5d8Hak

--
-- PostgreSQL database dump
--

\restrict uXHLTYGaL1G48pstJYfVTUZgeQ7HAlYsyJqCXlouXieDahs8ZCkA2qoxKZsECcU

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_ceas_promotii; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (1, 5, 2);
INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (2, 6, 1);
INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (3, 7, 2);
INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (4, 8, 2);
INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (5, 9, 1);
INSERT INTO django.aplicatie_ceas_promotii (id, ceas_id, promotie_id) VALUES (6, 10, 2);


--
-- Name: aplicatie_ceas_promotii_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_ceas_promotii_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict uXHLTYGaL1G48pstJYfVTUZgeQ7HAlYsyJqCXlouXieDahs8ZCkA2qoxKZsECcU

--
-- PostgreSQL database dump
--

\restrict 0rAIDKapamdykJiyr9MnNpKaOhwaDTzClvpxCaGORyP9O9AqyhWeRM27tCNYdPI

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_comanda; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_comanda_id_comanda_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_comanda_id_comanda_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict 0rAIDKapamdykJiyr9MnNpKaOhwaDTzClvpxCaGORyP9O9AqyhWeRM27tCNYdPI

--
-- PostgreSQL database dump
--

\restrict oMRBMtomX4xQh5fe6GwvLt8atmYVb51LVRuO8SYYZAEl0s7Ky0Kg1627neKTmwh

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_comanda_ceasuri; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_comanda_ceasuri_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_comanda_ceasuri_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict oMRBMtomX4xQh5fe6GwvLt8atmYVb51LVRuO8SYYZAEl0s7Ky0Kg1627neKTmwh

--
-- PostgreSQL database dump
--

\restrict PozhfZ118SpHlfZdWwdMedChCuQd6mBE8gRY909r9VFLInMR8KA60tyT3fME9ls

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_comanda_useri; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_comanda_useri_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_comanda_useri_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict PozhfZ118SpHlfZdWwdMedChCuQd6mBE8gRY909r9VFLInMR8KA60tyT3fME9ls

--
-- PostgreSQL database dump
--

\restrict jWePYvxSaT9iwGtcthEXl4wwZ7fgVXTXxZto9bTiqJkaE86dQfkbQcn6imka4zp

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_customuser; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, tara, oras, adresa, puncte_loialitate, cont_premium, cod, email_confirmat, telefon) VALUES (11, 'pbkdf2_sha256$1000000$eAglS0HS2zsiw76XIZYVTG$WFMrOnEPHVgLWGAVrAKOwuwz0Du6CK4Yf2iDbl6K8Zg=', '2025-12-03 23:53:12.768597+02', false, 'USER_TEST', '', '', '', false, true, '2025-12-03 20:53:00+02', NULL, NULL, NULL, 0, false, NULL, true, NULL);
INSERT INTO django.aplicatie_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, tara, oras, adresa, puncte_loialitate, cont_premium, cod, email_confirmat, telefon) VALUES (5, 'pbkdf2_sha256$1000000$M6ZnRImWEZklTlUqqVXpey$eSdLJdJt369kDK9FpUN5TDEIy2FiTXbLzxHUnCzO6K4=', '2025-11-27 00:48:10.440534+02', false, 'info_fmi', 'LOLO', 'LALA', 'savadarius01@gmail.com', false, true, '2025-11-27 00:38:28.898061+02', 'Romania', 'Busteni', 'Str. Ion Creanga, nr. 1', 0, false, NULL, true, NULL);
INSERT INTO django.aplicatie_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, tara, oras, adresa, puncte_loialitate, cont_premium, cod, email_confirmat, telefon) VALUES (10, 'pbkdf2_sha256$1000000$i8KEMGrDeT7htJWsigo3Dm$CY6OdYvHUA77THGxcorNKLFP07Vxu+8vLSnAmDlpnVs=', '2025-12-03 23:48:08.146264+02', false, 'USER_DJANGO', '', '', 'savadarius01@gmail.com', false, true, '2025-12-03 20:06:25+02', NULL, NULL, NULL, 0, false, NULL, true, NULL);
INSERT INTO django.aplicatie_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, tara, oras, adresa, puncte_loialitate, cont_premium, cod, email_confirmat, telefon) VALUES (1, 'pbkdf2_sha256$1000000$znB5LFs30JoPHLLxBg7jBU$NkJ8nmBWZ6GPszseARGbF/5buOvLLT34xu2V9bfDiKg=', '2025-12-03 23:52:40.38738+02', true, 'curs', '', '', 'savadarius01@gmail.com', true, true, '2025-11-19 00:56:42.820012+02', NULL, NULL, NULL, 0, false, NULL, false, NULL);


--
-- Name: aplicatie_customuser_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_customuser_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

\unrestrict jWePYvxSaT9iwGtcthEXl4wwZ7fgVXTXxZto9bTiqJkaE86dQfkbQcn6imka4zp

--
-- PostgreSQL database dump
--

\restrict MxMwRUXAkQqz5qzj6gpeoLLYS4ZRMU0b3WItVU2H02mlTg9ecxP5kr0Jk2mMJ0T

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_customuser_groups; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_customuser_groups (id, customuser_id, group_id) VALUES (9, 10, 2);
INSERT INTO django.aplicatie_customuser_groups (id, customuser_id, group_id) VALUES (11, 11, 6);


--
-- Name: aplicatie_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_customuser_groups_id_seq', 11, true);


--
-- PostgreSQL database dump complete
--

\unrestrict MxMwRUXAkQqz5qzj6gpeoLLYS4ZRMU0b3WItVU2H02mlTg9ecxP5kr0Jk2mMJ0T

--
-- PostgreSQL database dump
--

\restrict iGuWGfur4euwkE4RQAwKPng1xjj3NACcXhZ1THm7gmrenRnzah3Xv0ZwO0dWNvO

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_customuser_user_permissions; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_customuser_user_permissions_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict iGuWGfur4euwkE4RQAwKPng1xjj3NACcXhZ1THm7gmrenRnzah3Xv0ZwO0dWNvO

--
-- PostgreSQL database dump
--

\restrict wBkrQCAt68NoDdIG4QJfltJv36WSVTFaEvvwq47V71FFvGGwBFPyCTAF56RaWGM

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_depozit; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_depozit (id_depozit, nume, locatie, numar_angajati, disponibilitate_stoc) VALUES (1, 'Depozit Bucuresti', 'Bucuresti, Romania', 20, true);
INSERT INTO django.aplicatie_depozit (id_depozit, nume, locatie, numar_angajati, disponibilitate_stoc) VALUES (2, 'Depozit Cluj', 'Cluj-Napoca, Romania', 15, true);


--
-- Name: aplicatie_depozit_id_depozit_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_depozit_id_depozit_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict wBkrQCAt68NoDdIG4QJfltJv36WSVTFaEvvwq47V71FFvGGwBFPyCTAF56RaWGM

--
-- PostgreSQL database dump
--

\restrict gb8HrddJdxrR5zJXFfVF1SQlS6IbvUZ57YSlDDlgypJGfRpbYT4iLgjgE1gNDEV

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_locatie; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_locatie_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_locatie_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict gb8HrddJdxrR5zJXFfVF1SQlS6IbvUZ57YSlDDlgypJGfRpbYT4iLgjgE1gNDEV

--
-- PostgreSQL database dump
--

\restrict zOj3XVWbzriTLd9ay0Lg2mgaReoHlyA7EwA0VdEyEoMuVOGF8ScDH8KgryipoV6

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_material; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_material (id_material, tip_material, descriere, durabilitate) VALUES (1, 'otel inoxidabil', 'Carcasa solida si rezistenta la zgarieturi', 'ridicata');
INSERT INTO django.aplicatie_material (id_material, tip_material, descriere, durabilitate) VALUES (2, 'piele', 'Curea moale din piele naturala', 'medie');
INSERT INTO django.aplicatie_material (id_material, tip_material, descriere, durabilitate) VALUES (3, 'plastic', 'Material usor si flexibil', 'scazuta');


--
-- Name: aplicatie_material_id_material_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_material_id_material_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict zOj3XVWbzriTLd9ay0Lg2mgaReoHlyA7EwA0VdEyEoMuVOGF8ScDH8KgryipoV6

--
-- PostgreSQL database dump
--

\restrict DpYMs1bLNklBsGlN2GwgSZVYAdz0gWavDwBYMUZVcJGJ0d8ds0eswgLLGNVceGJ

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_oferta; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_oferta_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_oferta_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict DpYMs1bLNklBsGlN2GwgSZVYAdz0gWavDwBYMUZVcJGJ0d8ds0eswgLLGNVceGJ

--
-- PostgreSQL database dump
--

\restrict m3l38odi1iv0O7NmKFToZvxVlXdDbz0c9aG6mIbJTnnbmT1NudN0RdFExBiIeu9

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_oferta_categorii; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_oferta_categorii_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_oferta_categorii_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict m3l38odi1iv0O7NmKFToZvxVlXdDbz0c9aG6mIbJTnnbmT1NudN0RdFExBiIeu9

--
-- PostgreSQL database dump
--

\restrict akxzGgtbawbpQsFe7rkaeLep9cpIaezLc0pQzAOFFGiFoyYtfuCJjI8ofbYdMAf

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_organizator; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_organizator_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_organizator_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict akxzGgtbawbpQsFe7rkaeLep9cpIaezLc0pQzAOFFGiFoyYtfuCJjI8ofbYdMAf

--
-- PostgreSQL database dump
--

\restrict NOPzcdfKfwGfiasoFJwcyhsDfVj9fMc1v74pnWsU6FxGLX3ZhcOlqfDyRDZ5A1t

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_promotie; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_promotie (id_promotie, denumire, tip_promotie, procent_reducere, data_inceput, data_sfarsit, activa) VALUES (1, 'Black Friday', 'reducere', 20.00, '2025-11-22', '2025-11-30', false);
INSERT INTO django.aplicatie_promotie (id_promotie, denumire, tip_promotie, procent_reducere, data_inceput, data_sfarsit, activa) VALUES (2, 'Reducere Craciun', 'reducere', 30.00, '2025-12-15', '2026-01-05', false);


--
-- Name: aplicatie_promotie_id_promotie_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_promotie_id_promotie_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict NOPzcdfKfwGfiasoFJwcyhsDfVj9fMc1v74pnWsU6FxGLX3ZhcOlqfDyRDZ5A1t

--
-- PostgreSQL database dump
--

\restrict nbfvg7tX0Tn3iYjNxVMDpYAOxaMejBf74ZPkzDHJqSxLbyvBpVhlVfVMS239kWw

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_review; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_review_id_review_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_review_id_review_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict nbfvg7tX0Tn3iYjNxVMDpYAOxaMejBf74ZPkzDHJqSxLbyvBpVhlVfVMS239kWw

--
-- PostgreSQL database dump
--

\restrict U7EAUBLD7o2N7Pk7ukDbFnefD53IamMx3UEfeRWzggFsw6P0v2fweLJZAm9oBL4

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_vizualizare; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.aplicatie_vizualizare (id, data, ceas_id, user_id) VALUES (1, '2025-11-19 22:11:44.818099+02', 10, 1);


--
-- Name: aplicatie_vizualizare_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_vizualizare_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict U7EAUBLD7o2N7Pk7ukDbFnefD53IamMx3UEfeRWzggFsw6P0v2fweLJZAm9oBL4

--
-- PostgreSQL database dump
--

\restrict A4AMZ2PVWiIxC7fZRSheRiX5PFDGG82SZYazaKmjL6x1W4uNRnc2YBcd3BgWI12

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_voucher; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_voucher_id_voucher_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_voucher_id_voucher_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict A4AMZ2PVWiIxC7fZRSheRiX5PFDGG82SZYazaKmjL6x1W4uNRnc2YBcd3BgWI12

--
-- PostgreSQL database dump
--

\restrict JhuvavbtTg9qkdQvwyTytNpNbczEbDN4o1rVbwCHYsbXgVuFv5mKyhiRSCe6nrw

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: aplicatie_voucher_useri; Type: TABLE DATA; Schema: django; Owner: darius
--



--
-- Name: aplicatie_voucher_useri_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.aplicatie_voucher_useri_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

\unrestrict JhuvavbtTg9qkdQvwyTytNpNbczEbDN4o1rVbwCHYsbXgVuFv5mKyhiRSCe6nrw

--
-- PostgreSQL database dump
--

\restrict GftR7WbDEQrTKIxi3Fh9XQzh7VWAMuLsYgKGHWx74qlSfRhAYXBa0D8SGCRUCzO

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.auth_group (id, name) VALUES (2, 'Administratori_produse');
INSERT INTO django.auth_group (id, name) VALUES (6, 'Administratori_site');


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.auth_group_id_seq', 6, true);


--
-- PostgreSQL database dump complete
--

\unrestrict GftR7WbDEQrTKIxi3Fh9XQzh7VWAMuLsYgKGHWx74qlSfRhAYXBa0D8SGCRUCzO

--
-- PostgreSQL database dump
--

\restrict A2pjOnPmhkVe39H3Keh3aaX6SGI8zHYyIqewxloumNMbY7qq8i723wQSDQQ4r7v

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (5, 2, 56);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (6, 2, 53);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (7, 2, 54);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (8, 2, 55);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (9, 6, 1);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (10, 6, 2);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (11, 6, 3);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (12, 6, 4);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (13, 6, 5);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (14, 6, 6);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (15, 6, 7);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (16, 6, 8);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (17, 6, 9);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (18, 6, 10);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (19, 6, 11);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (20, 6, 12);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (21, 6, 13);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (22, 6, 14);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (23, 6, 15);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (24, 6, 16);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (25, 6, 17);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (26, 6, 18);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (27, 6, 19);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (28, 6, 20);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (29, 6, 21);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (30, 6, 22);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (31, 6, 23);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (32, 6, 24);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (33, 6, 25);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (34, 6, 26);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (35, 6, 27);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (36, 6, 28);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (37, 6, 29);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (38, 6, 30);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (39, 6, 31);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (40, 6, 32);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (41, 6, 33);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (42, 6, 34);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (43, 6, 35);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (44, 6, 36);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (45, 6, 37);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (46, 6, 38);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (47, 6, 39);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (48, 6, 40);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (49, 6, 41);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (50, 6, 42);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (51, 6, 43);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (52, 6, 44);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (53, 6, 45);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (54, 6, 46);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (55, 6, 47);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (56, 6, 48);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (57, 6, 49);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (58, 6, 50);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (59, 6, 51);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (60, 6, 52);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (61, 6, 53);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (62, 6, 54);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (63, 6, 55);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (64, 6, 56);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (65, 6, 57);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (66, 6, 58);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (67, 6, 59);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (68, 6, 60);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (69, 6, 61);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (70, 6, 62);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (71, 6, 63);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (72, 6, 64);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (73, 6, 65);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (74, 6, 66);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (75, 6, 67);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (76, 6, 68);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (77, 6, 69);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (78, 6, 70);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (79, 6, 71);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (80, 6, 72);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (81, 6, 73);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (82, 6, 74);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (83, 6, 75);
INSERT INTO django.auth_group_permissions (id, group_id, permission_id) VALUES (84, 6, 76);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.auth_group_permissions_id_seq', 84, true);


--
-- PostgreSQL database dump complete
--

\unrestrict A2pjOnPmhkVe39H3Keh3aaX6SGI8zHYyIqewxloumNMbY7qq8i723wQSDQQ4r7v

--
-- PostgreSQL database dump
--

\restrict n5e2FgxrxWCfJstKgVt8YmWRi8si7izSfecqJvRztz8vmFh4lKgt6hADU9it8Pv

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add brand', 6, 'add_brand');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change brand', 6, 'change_brand');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete brand', 6, 'delete_brand');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view brand', 6, 'view_brand');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add categorie', 7, 'add_categorie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change categorie', 7, 'change_categorie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete categorie', 7, 'delete_categorie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view categorie', 7, 'view_categorie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add depozit', 8, 'add_depozit');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change depozit', 8, 'change_depozit');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete depozit', 8, 'delete_depozit');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view depozit', 8, 'view_depozit');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add locatie', 9, 'add_locatie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change locatie', 9, 'change_locatie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete locatie', 9, 'delete_locatie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view locatie', 9, 'view_locatie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add material', 10, 'add_material');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change material', 10, 'change_material');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete material', 10, 'delete_material');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view material', 10, 'view_material');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add organizator', 11, 'add_organizator');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change organizator', 11, 'change_organizator');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete organizator', 11, 'delete_organizator');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view organizator', 11, 'view_organizator');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add promotie', 12, 'add_promotie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change promotie', 12, 'change_promotie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete promotie', 12, 'delete_promotie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view promotie', 12, 'view_promotie');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add user', 13, 'add_customuser');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change user', 13, 'change_customuser');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete user', 13, 'delete_customuser');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view user', 13, 'view_customuser');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add ceas', 14, 'add_ceas');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change ceas', 14, 'change_ceas');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete ceas', 14, 'delete_ceas');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view ceas', 14, 'view_ceas');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add comanda', 15, 'add_comanda');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change comanda', 15, 'change_comanda');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete comanda', 15, 'delete_comanda');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view comanda', 15, 'view_comanda');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add oferta', 16, 'add_oferta');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change oferta', 16, 'change_oferta');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete oferta', 16, 'delete_oferta');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view oferta', 16, 'view_oferta');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (65, 'Can add review', 17, 'add_review');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (66, 'Can change review', 17, 'change_review');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (67, 'Can delete review', 17, 'delete_review');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (68, 'Can view review', 17, 'view_review');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (69, 'Can add vizualizare', 18, 'add_vizualizare');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (70, 'Can change vizualizare', 18, 'change_vizualizare');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (71, 'Can delete vizualizare', 18, 'delete_vizualizare');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (72, 'Can view vizualizare', 18, 'view_vizualizare');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (73, 'Can add voucher', 19, 'add_voucher');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (74, 'Can change voucher', 19, 'change_voucher');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (75, 'Can delete voucher', 19, 'delete_voucher');
INSERT INTO django.auth_permission (id, name, content_type_id, codename) VALUES (76, 'Can view voucher', 19, 'view_voucher');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.auth_permission_id_seq', 76, true);


--
-- PostgreSQL database dump complete
--

\unrestrict n5e2FgxrxWCfJstKgVt8YmWRi8si7izSfecqJvRztz8vmFh4lKgt6hADU9it8Pv

--
-- PostgreSQL database dump
--

\restrict 4GWB5fn9TmNrXtIgNiIafnj7xGbqqhbMwNZWr25JgGJixXObuf3hc3xHfOhf57Y

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2025-11-27 00:27:50.736198+02', '3', 'user_test2 (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2025-11-27 00:37:33.838239+02', '4', 'info_fmi (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2025-11-29 23:08:26.837482+02', '7', 'CLAUDE (savadarius01@gmail.com)', 1, '[{"added": {}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2025-11-29 23:10:04.632146+02', '1', 'Administratori_produse', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2025-11-29 23:31:05.078165+02', '7', 'CLAUDE (savadarius01@gmail.com)', 2, '[]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2025-11-29 23:35:33.688489+02', '7', 'CLAUDE (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2025-11-29 23:36:07.240033+02', '1', 'Administratori_produse', 3, '', 3, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2025-11-30 17:46:15.32959+02', '9', 'DIJKSTRA (savadarius01@gmail.com)', 1, '[{"added": {}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2025-11-30 17:46:55.82347+02', '9', 'DIJKSTRA (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2025-12-03 20:05:50.969346+02', '8', 'DJANGOLINA (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2025-12-03 20:05:50.969536+02', '6', 'DURIMEL (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2025-12-03 20:06:29.991427+02', '10', 'USER_DJANGO ()', 1, '[{"added": {}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2025-12-03 20:15:09.217541+02', '2', 'Administratori_produse', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2025-12-03 20:45:54.508695+02', '10', 'USER_DJANGO ()', 2, '[{"changed": {"fields": ["Email confirmat"]}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2025-12-03 20:46:10.604986+02', '10', 'USER_DJANGO (savadarius01@gmail.com)', 2, '[{"changed": {"fields": ["Email address"]}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2025-12-03 20:52:44.727121+02', '2', 'user_test (savadarius01@gmail.com)', 3, '', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2025-12-03 20:53:04.264092+02', '11', 'USER_TEST ()', 1, '[{"added": {}}]', 13, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2025-12-03 20:57:09.296063+02', '6', 'Administratori_site', 1, '[{"added": {}}]', 3, 1);
INSERT INTO django.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2025-12-03 23:52:57.695432+02', '11', 'USER_TEST ()', 2, '[{"changed": {"fields": ["Groups"]}}]', 13, 1);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.django_admin_log_id_seq', 19, true);


--
-- PostgreSQL database dump complete
--

\unrestrict 4GWB5fn9TmNrXtIgNiIafnj7xGbqqhbMwNZWr25JgGJixXObuf3hc3xHfOhf57Y

--
-- PostgreSQL database dump
--

\restrict Vu4ozrXUXBfU138agMSmqaexoDrWoVX8AtefNlLI8CL5J8dDoEpDCo0OXsLZUC3

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (6, 'aplicatie', 'brand');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (7, 'aplicatie', 'categorie');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (8, 'aplicatie', 'depozit');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (9, 'aplicatie', 'locatie');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (10, 'aplicatie', 'material');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (11, 'aplicatie', 'organizator');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (12, 'aplicatie', 'promotie');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (13, 'aplicatie', 'customuser');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (14, 'aplicatie', 'ceas');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (15, 'aplicatie', 'comanda');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (16, 'aplicatie', 'oferta');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (17, 'aplicatie', 'review');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (18, 'aplicatie', 'vizualizare');
INSERT INTO django.django_content_type (id, app_label, model) VALUES (19, 'aplicatie', 'voucher');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.django_content_type_id_seq', 19, true);


--
-- PostgreSQL database dump complete
--

\unrestrict Vu4ozrXUXBfU138agMSmqaexoDrWoVX8AtefNlLI8CL5J8dDoEpDCo0OXsLZUC3

--
-- PostgreSQL database dump
--

\restrict M4tHDrrKzx2i69xLeGOglb5EUis3VX4DYmJGnxgQkxXuAofavP1mOy5n3TpGeu4

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2025-11-19 00:53:13.800708+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-11-19 00:53:13.855453+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2025-11-19 00:53:14.057359+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-11-19 00:53:14.070964+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-11-19 00:53:14.084762+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-11-19 00:53:14.102817+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-11-19 00:53:14.117505+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-11-19 00:53:14.122148+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-11-19 00:53:14.138234+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-11-19 00:53:14.160589+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-11-19 00:53:14.175984+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-11-19 00:53:14.196802+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-11-19 00:53:14.212137+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-11-19 00:53:14.22479+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (15, 'aplicatie', '0001_initial', '2025-11-19 00:53:15.082919+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2025-11-19 00:53:15.19127+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2025-11-19 00:53:15.229151+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2025-11-19 00:53:15.274472+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2025-11-19 00:53:15.322269+02');
INSERT INTO django.django_migrations (id, app, name, applied) VALUES (20, 'aplicatie', '0002_customuser_telefon', '2025-11-30 17:40:32.47053+02');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: django; Owner: darius
--

SELECT pg_catalog.setval('django.django_migrations_id_seq', 20, true);


--
-- PostgreSQL database dump complete
--

\unrestrict M4tHDrrKzx2i69xLeGOglb5EUis3VX4DYmJGnxgQkxXuAofavP1mOy5n3TpGeu4

--
-- PostgreSQL database dump
--

\restrict WVTyWGxnRJxZ5stUF5mom6XUchD9MFRyK7wZQSpbL8GhdiHxQUJRCmWIHsz3DIt

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: django_session; Type: TABLE DATA; Schema: django; Owner: darius
--

INSERT INTO django.django_session (session_key, session_data, expire_date) VALUES ('t8av74yowr099xc6luevdj3qzcr2e350', '.eJxVkM1OhDAURl9l0jUhRSgDrCaOLiZxNppZGdPc0gtUoSVtMRrju3trZjPLnu_0_v2w2Y3GSogRlzUG1r2-ZUzCFie5BfTSaNaxmt0wBf0H2hTod7Cjy3tnozcqT0p-TUN-dhrn-6t7U2CCMNFvVbRt2VSqVOqu4XoQe91DgZUWqmn3ouVYllXVDAMXGutSVENdDkJwaPqm5pynogFDMM5K_FqN_2Ydz1hqYWFB6vBweT6dH59IxAXMTCTAJ2jwZgu8OIwJ0vQLCRE8UH4ZwWqgt_NA12BH5xVaQwC0x5CUl-jz3cnZ3dEjrQ_ZzhIoSFk320eUszMwmwgR_-dJ15Grx8VsC-sGmAP-_gFXHXwF:1vOc2T:OcIOau2hSVGVFQSk0AfEnmWoHRhiCXFQ0VaYshU02yI', '2025-12-11 15:28:01.452285+02');
INSERT INTO django.django_session (session_key, session_data, expire_date) VALUES ('n544rvxf6oss4pox2oem2mih94565hm8', '.eJxVkEtLxDAUhf9L1qX0QZumS2GWbpxxJRJuk9tpxjxKHqCI_91Eqji7yznfPffxSbS7KsshRjR7DGR-ea0IhxQ3ngJ6riSZSduSO3EB8Ya2OPIG9upq4Wz0aqkLUh9uqB-dRP1wsHcBG4Qtd2ODdB2omKAfx34a6AQMWrrg0FEBPWNTx_puxAXkIiSwgQ4M-naZ6EqBdk0JDRiCcpbj-678B5mbipQRFgzmCc_n0xO_nM6XjKIBpbOWywgeyGyT1hVxHsJvDdJj-HP2ZEVErp0CrSJE_Ekvt_Ldo1HJkHkFHbAiKnCQJj8yqIJFn_6Lu3cyL3XQX9-kYn5q:1vQume:Iw4PZsBLvQ9-XJ7X2U8C-vq1yJad2ymdZf5Hg-1FnEk', '2025-12-17 23:53:12.7791+02');


--
-- PostgreSQL database dump complete
--

\unrestrict WVTyWGxnRJxZ5stUF5mom6XUchD9MFRyK7wZQSpbL8GhdiHxQUJRCmWIHsz3DIt

