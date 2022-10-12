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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(80) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(80) NOT NULL,
    moon_id integer NOT NULL,
    distance_from_earth integer,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    is_spherical boolean,
    has_life boolean,
    age_in_million_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(80) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_earth integer,
    galaxy_id integer,
    star_id integer,
    is_spherical boolean,
    has_life boolean,
    age_in_million_years integer,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(80) NOT NULL,
    star_id integer NOT NULL,
    distance_from_earth integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('kilo', 1, 5, 'The first galaxy');
INSERT INTO public.galaxy VALUES ('mega', 2, 10, 'The second galaxy');
INSERT INTO public.galaxy VALUES ('giga', 3, 15, 'The third galaxy');
INSERT INTO public.galaxy VALUES ('tera', 4, 20, 'The fourth galaxy');
INSERT INTO public.galaxy VALUES ('peta', 6, 25, 'The fifth galaxy');
INSERT INTO public.galaxy VALUES ('exa', 7, 25, 'The sixth galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('kilo_planet one moon one', 1, 55, 1, 1, 1, false, false, 3);
INSERT INTO public.moon VALUES ('kilo_planet one moon two', 2, 56, 1, 1, 1, false, false, 3);
INSERT INTO public.moon VALUES ('kilo_planet one moon three', 3, 57, 1, 1, 1, false, false, 3);
INSERT INTO public.moon VALUES ('mega planet one moon one', 4, 57, 2, 2, 4, false, false, 3);
INSERT INTO public.moon VALUES ('mega planet one moon two', 5, 57, 2, 2, 4, false, false, 3);
INSERT INTO public.moon VALUES ('mega planet one moon three', 6, 57, 2, 2, 4, false, false, 3);
INSERT INTO public.moon VALUES ('mega planet one moon four', 7, 57, 2, 2, 4, false, false, 3);
INSERT INTO public.moon VALUES ('mega planet one moon five', 8, 57, 2, 2, 4, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon one', 9, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon two', 10, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon three', 11, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon founr', 12, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon five', 13, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon six', 14, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet one-one moon seven', 15, 57, 2, 7, 7, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet three-three  moon one', 16, 57, 3, 5, 15, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet three-three  moon two', 17, 57, 3, 5, 15, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet three-three  moon three', 18, 57, 3, 5, 15, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet three-three  moon four', 19, 57, 3, 5, 15, false, false, 3);
INSERT INTO public.moon VALUES ('giga planet three-three  moon five', 20, 57, 3, 5, 15, false, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('kilo_planet_one', 1, 50, 1, 1, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('kilo_planet_two', 2, 50, 1, 1, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('kilo_planet_three', 3, 50, 1, 1, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('mega_planet_one', 4, 50, 2, 2, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('mega_planet_two', 5, 50, 2, 3, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('mega_planet_three', 6, 50, 2, 4, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_one-one', 7, 50, 3, 7, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_one-two', 8, 50, 3, 7, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_one-three', 9, 50, 3, 7, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_two-one', 10, 50, 3, 6, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_two-two', 11, 50, 3, 6, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_two-three', 12, 50, 3, 6, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_three-one', 13, 50, 3, 5, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_three-two', 14, 50, 3, 5, false, false, 3, 'new planet');
INSERT INTO public.planet VALUES ('giga planet_three-three', 15, 50, 3, 5, false, false, 3, 'new planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('kilo_star_one', 1, 50, 1);
INSERT INTO public.star VALUES ('mega_star_one', 2, 50, 2);
INSERT INTO public.star VALUES ('mega_star_two', 3, 50, 2);
INSERT INTO public.star VALUES ('mega_star_three', 4, 50, 2);
INSERT INTO public.star VALUES ('giga star_three', 5, 50, 3);
INSERT INTO public.star VALUES ('giga star_two', 6, 50, 3);
INSERT INTO public.star VALUES ('giga star_one', 7, 50, 3);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

