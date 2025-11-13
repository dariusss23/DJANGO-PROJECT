--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



--
-- PostgreSQL database dump
--



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



