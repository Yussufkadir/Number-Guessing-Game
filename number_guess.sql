--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    user_id integer,
    number integer NOT NULL,
    tries integer NOT NULL
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

INSERT INTO public.games VALUES (29, 9, 689, 10);
INSERT INTO public.games VALUES (30, 10, 207, 208);
INSERT INTO public.games VALUES (31, 10, 613, 614);
INSERT INTO public.games VALUES (32, 11, 675, 676);
INSERT INTO public.games VALUES (33, 11, 574, 575);
INSERT INTO public.games VALUES (34, 10, 668, 671);
INSERT INTO public.games VALUES (35, 10, 227, 229);
INSERT INTO public.games VALUES (36, 10, 900, 901);
INSERT INTO public.games VALUES (37, 13, 809, 810);
INSERT INTO public.games VALUES (38, 13, 283, 284);
INSERT INTO public.games VALUES (39, 14, 800, 801);
INSERT INTO public.games VALUES (40, 14, 859, 860);
INSERT INTO public.games VALUES (41, 13, 323, 326);
INSERT INTO public.games VALUES (42, 13, 742, 744);
INSERT INTO public.games VALUES (43, 13, 364, 365);
INSERT INTO public.games VALUES (44, 15, 930, 931);
INSERT INTO public.games VALUES (45, 15, 980, 981);
INSERT INTO public.games VALUES (46, 16, 120, 121);
INSERT INTO public.games VALUES (47, 16, 744, 745);
INSERT INTO public.games VALUES (48, 15, 847, 850);
INSERT INTO public.games VALUES (49, 15, 705, 707);
INSERT INTO public.games VALUES (50, 15, 705, 707);
INSERT INTO public.games VALUES (51, 15, 871, 872);
INSERT INTO public.games VALUES (52, 17, 574, 575);
INSERT INTO public.games VALUES (53, 17, 545, 546);
INSERT INTO public.games VALUES (54, 18, 107, 108);
INSERT INTO public.games VALUES (55, 18, 37, 38);
INSERT INTO public.games VALUES (56, 17, 67, 70);
INSERT INTO public.games VALUES (57, 17, 176, 178);
INSERT INTO public.games VALUES (58, 17, 176, 178);
INSERT INTO public.games VALUES (59, 17, 409, 410);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (9, 'john');
INSERT INTO public.users VALUES (10, 'user_1725029748130');
INSERT INTO public.users VALUES (11, 'user_1725029748129');
INSERT INTO public.users VALUES (12, 'mike');
INSERT INTO public.users VALUES (13, 'user_1725029791195');
INSERT INTO public.users VALUES (14, 'user_1725029791194');
INSERT INTO public.users VALUES (15, 'user_1725029927515');
INSERT INTO public.users VALUES (16, 'user_1725029927514');
INSERT INTO public.users VALUES (17, 'user_1725029994246');
INSERT INTO public.users VALUES (18, 'user_1725029994245');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 59, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

