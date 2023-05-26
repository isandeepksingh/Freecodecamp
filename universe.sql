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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    is_potentially_hazardous boolean NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_million_of_years integer,
    galaxy_type character varying(50) NOT NULL
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_million_of_years integer,
    planet_id integer,
    distance_from_earth numeric
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_million_of_years integer,
    star_id integer,
    planet_type character varying(50) NOT NULL,
    distance_from_earth numeric
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_million_of_years integer,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Apophis', 'Potentially hazardous asteroid', true, 156000000);
INSERT INTO public.asteroid VALUES (2, 'Bennu', 'Carbonaceous asteroid', false, 108000000);
INSERT INTO public.asteroid VALUES (3, 'Ceres', 'Dwarf planet and asteroid', false, 413000000);
INSERT INTO public.asteroid VALUES (4, 'Vesta', 'Second-largest asteroid', false, 353000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', false, 13000, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to Milky Way', false, 23000, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'Located in the constellation Canes Venatici', false, 30000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Distinctive galaxy with a prominent dust lane', false, 28000, 'Elliptical');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Beautiful face-on spiral galaxy', false, 25000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Centauras  Galaxy', 'Beautiful wild face-on spiral galaxy', false, 35000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth''s natural satellite', false, 4500, 1, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Moon of Mars', false, 4000, 2, 9377);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Moon of Mars', false, 4000, 2, 23456);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system', false, 3500, 3, 628300);
INSERT INTO public.moon VALUES (5, 'Europa', 'Moon of Jupiter', false, 3500, 3, 670900);
INSERT INTO public.moon VALUES (6, 'Io', 'Moon of Jupiter', false, 3500, 3, 421800);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Moon of Jupiter', false, 3500, 3, 1882700);
INSERT INTO public.moon VALUES (8, 'Titan', 'Saturn''s largest moon', false, 3200, 4, 1257060);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Moon of Saturn', false, 3200, 4, 238020);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon of Saturn', false, 3200, 4, 185540);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Moon of Saturn', false, 3200, 4, 294660);
INSERT INTO public.moon VALUES (12, 'Miranda', 'Moon of Uranus', false, 2800, 9, 129390);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Moon of Uranus', false, 2800, 9, 191240);
INSERT INTO public.moon VALUES (14, 'Umbriel', 'Moon of Uranus', false, 2800, 9, 266000);
INSERT INTO public.moon VALUES (15, 'Titania', 'Moon of Uranus', false, 2800, 9, 435910);
INSERT INTO public.moon VALUES (16, 'Oberon', 'Moon of Uranus', false, 2800, 9, 583520);
INSERT INTO public.moon VALUES (17, 'Triton', 'Neptune''s largest moon', false, 2900, 5, 354759);
INSERT INTO public.moon VALUES (18, 'Proteus', 'Moon of Neptune', false, 2900, 5, 117647);
INSERT INTO public.moon VALUES (19, 'Nereid', 'Moon of Neptune', false, 2900, 5, 5513810);
INSERT INTO public.moon VALUES (20, 'Charon', 'Pluto''s largest moon', false, 4200, 10, 19591);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', true, 4500, 1, 'Terrestrial', 0);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet', false, 4000, 1, 'Terrestrial', 78);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Largest planet in the solar system', false, 3500, 1, 'Gas Giant', 629);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Known for its rings', false, 3200, 1, 'Gas Giant', 1255);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Blue planet', false, 2900, 2, 'Ice Giant', 2700);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Closest planet to the Sun', false, 4800, 1, 'Terrestrial', 57);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Planet tilted on its side', false, 2700, 2, 'Ice Giant', 2547);
INSERT INTO public.planet VALUES (8, 'Venus', 'Known for its thick atmosphere', false, 4200, 1, 'Terrestrial', 42);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet in the Kuiper Belt', false, 1000, 6, 'Dwarf Planet', 5900);
INSERT INTO public.planet VALUES (10, 'Mars 2', 'Second planet from Mars', false, 3900, 2, 'Terrestrial', 88);
INSERT INTO public.planet VALUES (11, 'Saturn V', 'Large rocket used in Apollo missions', false, 3200, 4, 'Spacecraft', NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 'Exoplanet similar to Earth', false, 2000, NULL, 'Exoplanet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our star', false, 4600, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, 250, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant in the constellation Orion', false, 8000, 2);
INSERT INTO public.star VALUES (4, 'Polaris', 'North Star in the constellation Ursa Minor', false, 700, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'One of the brightest stars in the sky', false, 450, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 'Closest star system to the Sun', false, 6000, 6);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


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
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

