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
-- Name: asteriod; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteriod (
    asteriod_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.asteriod OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteriod_asteriod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteriod_asteriod_id_seq OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteriod_asteriod_id_seq OWNED BY public.asteriod.asteriod_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    diameter_in_ly integer,
    distance_in_mly numeric(5,3),
    mass_in_m integer,
    type text,
    age_known boolean NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    diameter_in_km integer,
    orbit_in_km integer,
    orbit_period numeric(6,2),
    missions_sent text,
    visibility boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    diameter_in_km integer,
    mass_wrt_earth numeric(4,2),
    moons integer,
    recorded_by text,
    larger_than_earth boolean NOT NULL,
    has_life boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    temperature_in_k integer,
    mass_wrt_sun integer,
    size_wrt_sun numeric(5,3),
    type text,
    visibility boolean NOT NULL,
    bigger_than_sun boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteriod asteriod_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod ALTER COLUMN asteriod_id SET DEFAULT nextval('public.asteriod_asteriod_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteriod; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteriod VALUES (1, '1 Ceres', 952);
INSERT INTO public.asteriod VALUES (2, '2 Pallas', 544);
INSERT INTO public.asteriod VALUES (3, '4 Vestas', 580);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 180000, 0.027, 180000, 'Barred Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2.540, 1230, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 50000, 29.000, 800, 'Null', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, 23.000, 160, NULL, false, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 60000, 3.000, 50, 'Spiral', false, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 170000, 21.000, 1000, 'Spiral', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3475, 384400, 27.30, 'Many', false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 9376, 7.70, 'Many', false, false, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 23458, 1.30, 'Many', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Lo', 3643, 421800, 1.77, 'Many', false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 671100, 3.55, 'Many', false, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 1070400, 7.16, 'Many', false, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 1882700, 16.69, 'Many', false, false, 5);
INSERT INTO public.moon VALUES (8, 'Enceladus', 504, 238037, 1.40, 'Many', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, 527068, 4.50, 'Many', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 5194, 1221865, 15.90, 'Many', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Lapetus', 1471, 3560851, 79.30, 'Many', false, false, 6);
INSERT INTO public.moon VALUES (12, 'Miranda', 471, 129900, 1.40, 'Many', false, false, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 1577, 436300, 8.70, 'Many', false, false, 7);
INSERT INTO public.moon VALUES (14, 'Triton', 2706, 354759, 5.90, 'Many', false, false, 8);
INSERT INTO public.moon VALUES (15, 'Charon', 1207, 17536, 6.40, 'None', false, false, 9);
INSERT INTO public.moon VALUES (16, 'Themisto', NULL, NULL, NULL, 'None', false, false, 5);
INSERT INTO public.moon VALUES (17, 'Leda', NULL, NULL, NULL, 'None', false, false, 5);
INSERT INTO public.moon VALUES (18, 'Himalia', NULL, NULL, NULL, 'None', false, false, 5);
INSERT INTO public.moon VALUES (19, 'Mimas', NULL, NULL, NULL, 'None', false, false, 6);
INSERT INTO public.moon VALUES (20, 'Tethys', NULL, NULL, NULL, 'None', false, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 0.06, 0, 'Assyrians', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.82, 0, 'Babylonians', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 1.00, 1, NULL, false, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6792, 0.11, 2, 'Egyptians', false, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 31.00, 79, 'Babylonians', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 108728, 95.00, 82, 'Assyrians', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 15.00, 27, 'William Herschel', false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 17.00, 14, 'LeVerrier & Galle', false, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 950, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 2372, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 1960, NULL, NULL, NULL, false, false, 1);
INSERT INTO public.planet VALUES (12, 'Eris', 2326, NULL, NULL, NULL, false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri A', 5753, 1, 1.220, 'Yellow Star', false, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri B', 5242, 1, 0.600, 'Orange Star', false, false, 1);
INSERT INTO public.star VALUES (3, 'Barnard Star', 3134, 0, 0.200, 'Red Dwarf', false, false, 1);
INSERT INTO public.star VALUES (4, 'WISE 0855-0714', 275, 1, 0.100, 'Sub-brown Dwarf', false, false, 1);
INSERT INTO public.star VALUES (5, 'Wolf 359', 2749, 0, 0.140, 'Red Dwarf', false, false, 1);
INSERT INTO public.star VALUES (6, 'Lalande 21185', 3601, 0, 0.390, 'Red Dwarf', false, false, 1);


--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteriod_asteriod_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteriod asteriod_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_name_key UNIQUE (name);


--
-- Name: asteriod asteriod_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_pkey PRIMARY KEY (asteriod_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

