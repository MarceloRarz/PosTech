--
-- PostgreSQL database cluster dump
--

-- Started on 2024-07-21 23:02:05

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-21 23:02:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2024-07-21 23:02:06

--
-- PostgreSQL database dump complete
--

--
-- Database "FIAP" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-21 23:02:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3356 (class 1262 OID 16388)
-- Name: FIAP; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE "FIAP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "FIAP" OWNER TO "user";

\connect "FIAP"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16390)
-- Name: post; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.post (
    id integer NOT NULL,
    titulo character varying(200) NOT NULL,
    descricao character varying(500),
    datapostagem timestamp without time zone,
    dataatualizacao timestamp without time zone,
    conteudo text NOT NULL,
    imagem bytea
);


ALTER TABLE public.post OWNER TO "user";

--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.post_id_seq OWNER TO "user";

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 215
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- TOC entry 3203 (class 2604 OID 16393)
-- Name: post id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- TOC entry 3350 (class 0 OID 16390)
-- Dependencies: 216
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.post (id, titulo, descricao, datapostagem, dataatualizacao, conteudo, imagem) FROM stdin;
1	Titulo_01	Descricao_01	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_01	\N
2	Titulo_02	Descricao_02	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_02	\N
3	Titulo_03	Descricao_03	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_03	\N
4	Titulo_04	Descricao_04	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_04	\N
5	Titulo_05	Descricao_05	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_05	\N
6	Titulo_06	Descricao_06	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_06	\N
7	Titulo_07	Descricao_07	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_07	\N
8	Titulo_08	Descricao_08	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_08	\N
9	Titulo_09	Descricao_09	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_09	\N
10	Titulo_10	Descricao_10	2024-07-21 23:00:20.731431	2024-07-21 23:00:20.731431	Conteudo_10	\N
\.


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 215
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.post_id_seq', 10, true);


--
-- TOC entry 3205 (class 2606 OID 16397)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


-- Completed on 2024-07-21 23:02:06

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-07-21 23:02:06

--
-- PostgreSQL database cluster dump complete
--

