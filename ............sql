
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

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;


COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;


CREATE TABLE public."Categorie" (
    "Categorie_ID" integer NOT NULL,
    "Nom" character varying
);


ALTER TABLE public."Categorie" OWNER TO postgres;



CREATE TABLE public."Client" (
    "Client_ID" integer NOT NULL,
    "Nom" character varying(50),
    "Prenom" character varying(50),
    "Adress" text,
    "N0_Telephone" text,
    "P.F_ID" integer
);


ALTER TABLE public."Client" OWNER TO postgres;



CREATE TABLE public."Commande" (
    "Commande_ID" integer NOT NULL,
    "Date_de_commande" date,
    total numeric(10,0),
    status text,
    "Client_ID" integer,
    "Expediteur_ID" integer
);


ALTER TABLE public."Commande" OWNER TO postgres;



CREATE TABLE public."Expediteur" (
    "Expediteur_ID" integer NOT NULL,
    "Nom" character varying(50),
    prenom character varying(50),
    "N0_Telephone" text,
    "Delai_de_livraison" date
);


ALTER TABLE public."Expediteur" OWNER TO postgres;


CREATE TABLE public."Liste_de_produit" (
    "L.P_ID" integer NOT NULL,
    "Quantity" numeric(10,0),
    "Commande_ID" integer,
    "Produit_ID" integer
);


ALTER TABLE public."Liste_de_produit" OWNER TO postgres;



CREATE TABLE public."Paiment" (
    "Paiment_ID" integer NOT NULL,
    "Montant" money,
    "Date_de_paiment" date,
    "Type_de_paiment" text,
    "Client_ID" integer,
    "Commande_ID" integer
);


ALTER TABLE public."Paiment" OWNER TO postgres;



CREATE TABLE public."Produit" (
    "Produit_ID " integer NOT NULL,
    "Nom" character varying(50),
    "Poids" numeric(10,0),
    "Photos" bytea,
    "Sous_Categorie" integer,
    "Promotion_ID" integer,
    "Stock_ID" integer,
    "Prix" money
);


ALTER TABLE public."Produit" OWNER TO postgres;


CREATE TABLE public."Programme de fidelite" (
    "P.F_ID" integer NOT NULL,
    "Points" numeric(10,0)
);


ALTER TABLE public."Programme de fidelite" OWNER TO postgres;



CREATE TABLE public."Promotion" (
    "Promotion_ID" integer NOT NULL,
    "Discount" numeric(10,0),
    "Descriton" text,
    "Date_debut" date,
    "Date_fin" date
);


ALTER TABLE public."Promotion" OWNER TO postgres;



CREATE TABLE public."Retours" (
    "Retours_ID" integer NOT NULL,
    "Raison" text,
    "Date_de_retour" date,
    "Commande_ID" integer,
    "Stock_ID" integer,
    "Quantite" integer
);


ALTER TABLE public."Retours" OWNER TO postgres;



CREATE TABLE public."Sous_Categorie" (
    "Sous_Categorie" integer NOT NULL,
    "Nom" character varying(50),
    "Categorie_ID" integer
);


ALTER TABLE public."Sous_Categorie" OWNER TO postgres;



CREATE TABLE public."Stock" (
    "Stock_ID" integer NOT NULL,
    "Quantite" numeric
);


ALTER TABLE public."Stock" OWNER TO postgres;


COPY public."Categorie" ("Categorie_ID", "Nom") FROM stdin;
1	Cat_1
2	Cat_2
3	Cat_3
4	Cat_4
5	Cat_5
\.


COPY public."Client" ("Client_ID", "Nom", "Prenom", "Adress", "N0_Telephone", "P.F_ID") FROM stdin;
1	Alice	Lane	Address_1	+1-812-6425	5
2	Bob	Mike	Address_2	+1-588-2717	3
3	Charlie	Charles	Address_3	+1-259-4134	2
4	Diana	Dane	Address_4	+1-587-3778	1
5	Eve	Adams	Address_5	+1-697-6989	4
\.


COPY public."Commande" ("Commande_ID", "Date_de_commande", total, status, "Client_ID", "Expediteur_ID") FROM stdin;
1	2020-10-19	254	Completed	1	1
2	2021-11-22	136	Processing	2	2
3	2020-04-27	100	Cancelled	3	3
4	2021-06-21	190	Shipped	4	4
5	2023-07-21	230	Completed	5	5
\.


COPY public."Expediteur" ("Expediteur_ID", "Nom", "prenom", "N0_Telephone", "Delai_de_livraison") FROM stdin;
5	Lucy	Lakes	+1-697-6989	2023-07-21
4	Emma	Stone	+1-587-3778	2021-06-21
3	Mike	Tyson	+1-259-4134	2020-04-27
2	Jane	Watson	+1-588-2717	2021-11-22
1	John\n 	Jones	+1-812-6425	2020-10-19
\.


COPY public."Liste_de_produit" ("L.P_ID", "Quantity", "Commande_ID", "Produit_ID") FROM stdin;
1	2	1	1
2	1	1	3
3	3	2	2
4	1	3	4
5	2	4	5
\.



COPY public."Paiment" ("Paiment_ID", "Montant", "Date_de_paiment", "Type_de_paiment", "Client_ID", "Commande_ID") FROM stdin;
1	$254.20	2020-10-20	Credit Card	4	5
2	$135.55	2021-11-23	PayPal	5	3
3	$99.99	2020-04-28	Debit Card	2	1
4	$189.75	2021-06-22	Bank Transfer	1	2
5	$230.00	2023-07-22	Credit Card	3	4
\.



COPY public."Produit" ("Produit_ID", "Nom", "Poids", "Photos", "Sous_Categorie", "Promotion_ID", "Stock_ID", "Prix") FROM stdin;
5	Camera	1	\N	5	4	3	$49,999.00
4	Smartwatch	0	\N	4	5	4	$24,999.00
3	Headphones	0	\N	3	3	5	$199.99
2	Smartphone	0	\N	1	1	1	$79,999.00
1	Laptop\n	3	\N	2	2	2	$99,999.00
\.



COPY public."Programme de fidelite" ("P.F_ID", "Points") FROM stdin;
1	50
2	100
3	150
4	200
5	250
\.


COPY public."Promotion" ("Promotion_ID", "Discount", "Descriton", "Date_debut", "Date_fin") FROM stdin;
1	10	Summer Sale	2023-06-01	2023-06-30
2	15	Winter Discount	2023-12-01	2023-12-31
3	20	Black Friday	2023-11-24	2023-11-24
4	25	New Year Offer	2024-01-01	2024-01-15
5	5	Spring Special	2024-03-01	2024-03-31
\.



COPY public."Retours" ("Retours_ID", "Raison", "Date_de_retour", "Commande_ID", "Stock_ID", "Quantite") FROM stdin;
1	Defective product	2023-07-25	1	1	1
2	Wrong product delivered	2023-08-01	2	2	2
3	Product not as described	2023-08-15	3	3	1
4	Changed mind	2023-09-05	4	4	1
5	Received late	2023-10-01	5	5	3
\.


COPY public."Sous_Categorie" ("Sous_Categorie", "Nom", "Categorie_ID") FROM stdin;
1	SubCategory_1	1
2	SubCategory_2	2
3	SubCategory_3	3
4	SubCategory_4	4
5	SubCategory_5	5
\.


COPY public."Stock" ("Stock_ID", "Quantite") FROM stdin;
1	50
2	30
3	70
4	100
5	25
\.


ALTER TABLE ONLY public."Categorie"
    ADD CONSTRAINT "Categorie_pkey" PRIMARY KEY ("Categorie_ID");


ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY ("Client_ID");



ALTER TABLE ONLY public."Commande"
    ADD CONSTRAINT "Commande_pkey" PRIMARY KEY ("Commande_ID");


ALTER TABLE ONLY public."Expediteur"
    ADD CONSTRAINT "Expediteur_pkey" PRIMARY KEY ("Expediteur_ID");


ALTER TABLE ONLY public."Liste_de_produit"
    ADD CONSTRAINT "Liste de produit_pkey" PRIMARY KEY ("L.P_ID");


ALTER TABLE ONLY public."Paiment"
    ADD CONSTRAINT "Paiment_pkey" PRIMARY KEY ("Paiment_ID");


ALTER TABLE ONLY public."Produit"
    ADD CONSTRAINT "Produit_pkey" PRIMARY KEY ("Produit_ID ");



ALTER TABLE ONLY public."Programme de fidelite"
    ADD CONSTRAINT "Programme de fidelite_pkey" PRIMARY KEY ("P.F_ID");


ALTER TABLE ONLY public."Promotion"
    ADD CONSTRAINT "Promotion_pkey" PRIMARY KEY ("Promotion_ID");


ALTER TABLE ONLY public."Retours"
    ADD CONSTRAINT "Retours_pkey" PRIMARY KEY ("Retours_ID");


ALTER TABLE ONLY public."Sous_Categorie"
    ADD CONSTRAINT "Sous_Categorie_pkey" PRIMARY KEY ("Sous_Categorie");


ALTER TABLE ONLY public."Stock"
    ADD CONSTRAINT "Stock_pkey" PRIMARY KEY ("Stock_ID");


ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_P.F_ID_fkey" FOREIGN KEY ("P.F_ID") REFERENCES public."Programme de fidelite"("P.F_ID");


ALTER TABLE ONLY public."Commande"
    ADD CONSTRAINT "Commande_Client_ID_fkey" FOREIGN KEY ("Client_ID") REFERENCES public."Client"("Client_ID");


ALTER TABLE ONLY public."Commande"
    ADD CONSTRAINT "Commande_Expediteur_ID_fkey" FOREIGN KEY ("Expediteur_ID") REFERENCES public."Expediteur"("Expediteur_ID");


ALTER TABLE ONLY public."Liste_de_produit"
    ADD CONSTRAINT "Liste de produit_Commande_ID_fkey" FOREIGN KEY ("Commande_ID") REFERENCES public."Commande"("Commande_ID");


ALTER TABLE ONLY public."Liste_de_produit"
    ADD CONSTRAINT "Liste de produit_Produit_ID_fkey" FOREIGN KEY ("Produit_ID") REFERENCES public."Produit"("Produit_ID ");


ALTER TABLE ONLY public."Paiment"
    ADD CONSTRAINT "Paiment_Client_ID_fkey" FOREIGN KEY ("Client_ID") REFERENCES public."Client"("Client_ID");

ALTER TABLE ONLY public."Paiment"
    ADD CONSTRAINT "Paiment_Commande_ID_fkey" FOREIGN KEY ("Commande_ID") REFERENCES public."Commande"("Commande_ID");


ALTER TABLE ONLY public."Produit"
    ADD CONSTRAINT "Produit_Promotion_ID_fkey" FOREIGN KEY ("Promotion_ID") REFERENCES public."Promotion"("Promotion_ID");


ALTER TABLE ONLY public."Produit"
    ADD CONSTRAINT "Produit_Sous_Categorie_fkey" FOREIGN KEY ("Sous_Categorie") REFERENCES public."Sous_Categorie"("Sous_Categorie");


ALTER TABLE ONLY public."Produit"
    ADD CONSTRAINT "Produit_Stock_ID_fkey" FOREIGN KEY ("Stock_ID") REFERENCES public."Stock"("Stock_ID");


ALTER TABLE ONLY public."Retours"
    ADD CONSTRAINT "Retours_Commande_ID_fkey" FOREIGN KEY ("Commande_ID") REFERENCES public."Commande"("Commande_ID");


ALTER TABLE ONLY public."Retours"
    ADD CONSTRAINT "Retours_Stock_ID_fkey" FOREIGN KEY ("Stock_ID") REFERENCES public."Stock"("Stock_ID");


ALTER TABLE ONLY public."Sous_Categorie"
    ADD CONSTRAINT "Sous_Categorie_Categorie_ID_fkey" FOREIGN KEY ("Categorie_ID") REFERENCES public."Categorie"("Categorie_ID");


