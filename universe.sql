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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    short_name character varying(3),
    extention numeric(6,2)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_const_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_const_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_const_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    dist_myl numeric(6,3),
    diameter integer,
    magnitude integer,
    local_group boolean,
    note text
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
    name character varying(30) NOT NULL,
    discovery_year integer,
    diameter_km integer,
    orbital_period numeric(6,3),
    solar_system boolean,
    note text,
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
    name character varying(30) NOT NULL,
    radius_vs_earth numeric(6,3),
    orbital_period integer,
    inclination integer,
    confirmated boolean,
    note text,
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
    name character varying(30) NOT NULL,
    dist_yl numeric(6,3),
    temperature_k integer,
    planets integer,
    dwarf_planets boolean,
    note text,
    galaxy_id integer,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_const_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Centaurus', 'Cen', 1060.42);
INSERT INTO public.constellation VALUES (2, 'Ursa Maior', 'Uma', 1279.66);
INSERT INTO public.constellation VALUES (3, 'Piscis Austinus', 'PsA', 245.37);
INSERT INTO public.constellation VALUES (4, 'Canis Minor', 'CMi', 183.36);
INSERT INTO public.constellation VALUES (5, 'Cetus', 'Cet', 1231.41);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 0.025, 150000, 1, true, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis MAjor Dwarf', 0.025, 0, 23, true, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sague 1', 0.075, 0, 14, true, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sagittaurius Dwarf sphr', 0.078, 10000, 5, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major II Dwarf', 0.098, 1800, 14, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Triangulum II', 0.098, 0, 16, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 'Moon', 0, 3476, 30.000, true, NULL, 16);
INSERT INTO public.moon VALUES (14, 'Fobos', 1877, 9, 1.000, true, NULL, 17);
INSERT INTO public.moon VALUES (15, 'Deimos', 1877, 12, 1.000, true, NULL, 17);
INSERT INTO public.moon VALUES (16, 'Mimas', 1789, 396, 1.000, true, NULL, 19);
INSERT INTO public.moon VALUES (17, 'Enceladus', 1789, 504, 1.000, true, NULL, 19);
INSERT INTO public.moon VALUES (18, 'Tethys', 1684, 1062, 2.000, true, NULL, 19);
INSERT INTO public.moon VALUES (19, 'Dione', 1684, 1123, 3.000, true, NULL, 19);
INSERT INTO public.moon VALUES (20, 'Rhea', 1672, 1527, 5.000, true, NULL, 19);
INSERT INTO public.moon VALUES (21, 'Titan', 1655, 5149, 16.000, true, NULL, 19);
INSERT INTO public.moon VALUES (22, 'Iapetus', 1671, 1470, 79.000, true, NULL, 19);
INSERT INTO public.moon VALUES (1, 'Metis', 1979, 43, 0.295, true, NULL, 18);
INSERT INTO public.moon VALUES (2, 'Adrastea', 1979, 16, 0.298, true, NULL, 18);
INSERT INTO public.moon VALUES (3, 'Amaltea', 1892, 167, 0.498, true, NULL, 18);
INSERT INTO public.moon VALUES (4, 'Tebe', 1979, 99, 0.675, true, NULL, 18);
INSERT INTO public.moon VALUES (5, 'Io', 1610, 3643, 1.769, true, NULL, 18);
INSERT INTO public.moon VALUES (6, 'Europa', 1610, 3122, 3.551, true, NULL, 18);
INSERT INTO public.moon VALUES (7, 'Ganimedes', 1610, 5262, 7.155, true, NULL, 18);
INSERT INTO public.moon VALUES (8, 'Calisto', 1610, 4821, 16.690, true, NULL, 18);
INSERT INTO public.moon VALUES (9, 'Themisto', 1975, 8, 130.020, true, NULL, 18);
INSERT INTO public.moon VALUES (10, 'Leda', 1974, 20, 240.920, true, NULL, 18);
INSERT INTO public.moon VALUES (11, 'Himalia', 1904, 170, 250.560, true, NULL, 18);
INSERT INTO public.moon VALUES (12, 'Ersa', 2018, 2, 250.400, true, NULL, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri d', 0.810, 5, 0, true, NULL, 2);
INSERT INTO public.planet VALUES (2, 'Proxima Centaruri b', 1.300, 11, 0, true, NULL, 2);
INSERT INTO public.planet VALUES (3, 'PRoxima Centauri c', 0.000, 1928, 133, false, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Lalande 21185 b', 0.000, 13, 0, true, NULL, 3);
INSERT INTO public.planet VALUES (5, 'Lalande 21185 d', 0.000, 215, 0, false, NULL, 3);
INSERT INTO public.planet VALUES (6, 'Lalande 21185 c', 0.000, 2806, 0, true, NULL, 3);
INSERT INTO public.planet VALUES (7, 'Lacaile 9352 b', 0.000, 0, 9, true, NULL, 4);
INSERT INTO public.planet VALUES (9, 'Lacaile 9352 d', 0.000, 0, 50, false, NULL, 4);
INSERT INTO public.planet VALUES (8, 'Lacaile 9352 c', 0.000, 0, 22, true, NULL, 4);
INSERT INTO public.planet VALUES (10, 'Luytens Star c', 0.000, 5, 72, true, NULL, 5);
INSERT INTO public.planet VALUES (11, 'Luytens Star b', 0.000, 19, 72, true, NULL, 5);
INSERT INTO public.planet VALUES (12, 'Luytens Star d', 0.000, 414, 72, false, NULL, 5);
INSERT INTO public.planet VALUES (13, 'Luytens Star e', 0.000, 542, 72, false, NULL, 5);
INSERT INTO public.planet VALUES (14, 'Mercury', 0.390, 59, 7, true, NULL, 1);
INSERT INTO public.planet VALUES (15, 'Venus', 0.720, 243, 3, true, NULL, 1);
INSERT INTO public.planet VALUES (16, 'Earth', 1.000, 1, 0, true, NULL, 1);
INSERT INTO public.planet VALUES (17, 'Mars', 1.520, 1, 2, true, NULL, 1);
INSERT INTO public.planet VALUES (18, 'Jupiter', 5.200, 1, 1, true, NULL, 1);
INSERT INTO public.planet VALUES (19, 'Saturn', 9.520, 1, 2, true, NULL, 1);
INSERT INTO public.planet VALUES (20, 'Uranus', 19.190, 1, 1, true, NULL, 1);
INSERT INTO public.planet VALUES (21, 'Neptune', 30.060, 1, 2, true, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.000, 5778, 8, true, NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.200, 3042, 3, false, NULL, 1, 1);
INSERT INTO public.star VALUES (3, 'Lalande 21185', 8.300, 3601, 2, true, NULL, 1, 2);
INSERT INTO public.star VALUES (4, 'Lacaile 9352', 10.700, 3688, 2, true, NULL, 1, 3);
INSERT INTO public.star VALUES (5, 'Luytens Star', 11.200, 3150, 2, true, NULL, 1, 4);
INSERT INTO public.star VALUES (6, 'YZ Ceti', 11.700, 3056, 3, true, NULL, 1, 5);


--
-- Name: constellation_const_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_const_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star star_const_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_const_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

