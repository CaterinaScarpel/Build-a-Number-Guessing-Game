--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE numberguess;
--
-- Name: numberguess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE numberguess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE numberguess OWNER TO freecodecamp;

\connect numberguess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    result integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 60, 14);
INSERT INTO public.games VALUES (3, 61, 8);
INSERT INTO public.games VALUES (4, 62, 19);
INSERT INTO public.games VALUES (5, 63, 18);
INSERT INTO public.games VALUES (6, 63, 908);
INSERT INTO public.games VALUES (7, 64, 481);
INSERT INTO public.games VALUES (8, 64, 476);
INSERT INTO public.games VALUES (9, 63, 957);
INSERT INTO public.games VALUES (10, 63, 362);
INSERT INTO public.games VALUES (11, 63, 279);
INSERT INTO public.games VALUES (12, 65, 525);
INSERT INTO public.games VALUES (13, 65, 33);
INSERT INTO public.games VALUES (14, 66, 750);
INSERT INTO public.games VALUES (15, 66, 220);
INSERT INTO public.games VALUES (16, 65, 728);
INSERT INTO public.games VALUES (17, 65, 856);
INSERT INTO public.games VALUES (18, 65, 894);
INSERT INTO public.games VALUES (19, 67, 217);
INSERT INTO public.games VALUES (20, 67, 371);
INSERT INTO public.games VALUES (21, 68, 631);
INSERT INTO public.games VALUES (22, 68, 378);
INSERT INTO public.games VALUES (23, 67, 505);
INSERT INTO public.games VALUES (24, 67, 615);
INSERT INTO public.games VALUES (25, 67, 567);
INSERT INTO public.games VALUES (26, 69, 213);
INSERT INTO public.games VALUES (27, 69, 696);
INSERT INTO public.games VALUES (28, 70, 957);
INSERT INTO public.games VALUES (29, 70, 663);
INSERT INTO public.games VALUES (30, 69, 298);
INSERT INTO public.games VALUES (31, 69, 225);
INSERT INTO public.games VALUES (32, 69, 709);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (60, 'Cate');
INSERT INTO public.users VALUES (61, 'nemo');
INSERT INTO public.users VALUES (62, 'LuckyJack');
INSERT INTO public.users VALUES (63, 'user_1791565141291');
INSERT INTO public.users VALUES (64, 'user_1791565141290');
INSERT INTO public.users VALUES (65, 'user_1791565161724');
INSERT INTO public.users VALUES (66, 'user_1791565161723');
INSERT INTO public.users VALUES (67, 'user_1791565181902');
INSERT INTO public.users VALUES (68, 'user_1791565181901');
INSERT INTO public.users VALUES (69, 'user_1791565240295');
INSERT INTO public.users VALUES (70, 'user_1791565240294');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 70, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

