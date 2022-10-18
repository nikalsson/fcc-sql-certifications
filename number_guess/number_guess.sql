--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played smallint DEFAULT 0,
    best_game smallint DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1666084772398', 2, 252);
INSERT INTO public.users VALUES ('user_1666084858315', 2, 467);
INSERT INTO public.users VALUES ('user_1666085444902', 2, 477);
INSERT INTO public.users VALUES ('user_1666084858316', 5, 186);
INSERT INTO public.users VALUES ('user_1666085444903', 5, 266);
INSERT INTO public.users VALUES ('user_1666084889344', 2, 242);
INSERT INTO public.users VALUES ('user_1666084889345', 5, 34);
INSERT INTO public.users VALUES ('user_1666085502788', 2, 1001);
INSERT INTO public.users VALUES ('user_1666084912295', 2, 177);
INSERT INTO public.users VALUES ('user_1666084912296', 5, 10);
INSERT INTO public.users VALUES ('user_1666085502789', 5, 193);
INSERT INTO public.users VALUES ('user_1666085553874', 2, 187);
INSERT INTO public.users VALUES ('user_1666085553875', 5, 380);
INSERT INTO public.users VALUES ('user_1666085593368', 2, 537);
INSERT INTO public.users VALUES ('user_1666085593369', 5, 116);
INSERT INTO public.users VALUES ('user_1666085623002', 2, 472);
INSERT INTO public.users VALUES ('user_1666085623003', 5, 173);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

