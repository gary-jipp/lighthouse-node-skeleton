--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.widgets DROP CONSTRAINT widgets_user_id_fkey;
ALTER TABLE ONLY public.widgets DROP CONSTRAINT widgets_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE public.widgets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.widgets_id_seq;
DROP TABLE public.widgets;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE users OWNER TO labber;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO labber;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: widgets; Type: TABLE; Schema: public; Owner: labber
--

CREATE TABLE widgets (
    id integer NOT NULL,
    user_id integer,
    name character varying(255) NOT NULL
);


ALTER TABLE widgets OWNER TO labber;

--
-- Name: widgets_id_seq; Type: SEQUENCE; Schema: public; Owner: labber
--

CREATE SEQUENCE widgets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgets_id_seq OWNER TO labber;

--
-- Name: widgets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: labber
--

ALTER SEQUENCE widgets_id_seq OWNED BY widgets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: labber
--

ALTER TABLE ONLY widgets ALTER COLUMN id SET DEFAULT nextval('widgets_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY users (id, name) FROM stdin;
1	Alice
2	Kira
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- Data for Name: widgets; Type: TABLE DATA; Schema: public; Owner: labber
--

COPY widgets (id, user_id, name) FROM stdin;
1	1	Sprockets
2	2	Chains
3	2	Bearings
\.


--
-- Name: widgets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labber
--

SELECT pg_catalog.setval('widgets_id_seq', 3, true);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: widgets_pkey; Type: CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_pkey PRIMARY KEY (id);


--
-- Name: widgets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: labber
--

ALTER TABLE ONLY widgets
    ADD CONSTRAINT widgets_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

