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
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    guesses integer,
    username character varying(50),
    game_id integer NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_game_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_game_id_seq OWNED BY public.user_info.game_id;


--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Name: user_info game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN game_id SET DEFAULT nextval('public.user_info_game_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (6991, 0, 'user_1669290801218', 695);
INSERT INTO public.user_info VALUES (6992, 0, 'user_1669290850100', 696);
INSERT INTO public.user_info VALUES (6993, 0, 'user_1669290850099', 697);
INSERT INTO public.user_info VALUES (6994, 0, 'user_1669290889118', 698);
INSERT INTO public.user_info VALUES (6995, 0, 'user_1669290889117', 699);
INSERT INTO public.user_info VALUES (6996, 0, 'user_1669290898981', 700);
INSERT INTO public.user_info VALUES (6997, 0, 'user_1669290898980', 701);
INSERT INTO public.user_info VALUES (6998, 0, 'user_1669290916179', 702);
INSERT INTO public.user_info VALUES (6999, 0, 'user_1669290916177', 703);
INSERT INTO public.user_info VALUES (7000, 0, 'user_1669290939312', 704);
INSERT INTO public.user_info VALUES (7001, 0, 'user_1669290939311', 705);
INSERT INTO public.user_info VALUES (7002, 0, 'user_1669290958804', 706);
INSERT INTO public.user_info VALUES (7003, 0, 'user_1669290958803', 707);
INSERT INTO public.user_info VALUES (7004, 0, 'user_1669290970157', 708);
INSERT INTO public.user_info VALUES (7005, 0, 'user_1669290970156', 709);
INSERT INTO public.user_info VALUES (7006, 0, 'user_1669290983510', 710);
INSERT INTO public.user_info VALUES (7007, 0, 'user_1669290983509', 711);
INSERT INTO public.user_info VALUES (7008, 0, 'user_1669291004562', 712);
INSERT INTO public.user_info VALUES (7009, 0, 'user_1669291004561', 713);
INSERT INTO public.user_info VALUES (7010, 0, 'user_1669291060006', 714);
INSERT INTO public.user_info VALUES (7011, 0, 'user_1669291060005', 715);
INSERT INTO public.user_info VALUES (7012, 0, 'user_1669291110722', 716);
INSERT INTO public.user_info VALUES (7013, 0, 'user_1669291110721', 717);
INSERT INTO public.user_info VALUES (7014, 0, 'user_1669291216189', 718);
INSERT INTO public.user_info VALUES (7015, 0, 'user_1669291216188', 719);
INSERT INTO public.user_info VALUES (7016, 0, 'user_1669291220476', 720);
INSERT INTO public.user_info VALUES (7017, 0, 'user_1669291220475', 721);
INSERT INTO public.user_info VALUES (7018, 0, 'user_1669291300905', 722);
INSERT INTO public.user_info VALUES (7019, 0, 'user_1669291300904', 723);
INSERT INTO public.user_info VALUES (7020, 0, 'user_1669291342748', 724);
INSERT INTO public.user_info VALUES (7021, 0, 'user_1669291342747', 725);
INSERT INTO public.user_info VALUES (7022, 0, 'user_1669291372168', 726);
INSERT INTO public.user_info VALUES (7023, 0, 'user_1669291372167', 727);
INSERT INTO public.user_info VALUES (7024, 0, 'user_1669291435119', 728);
INSERT INTO public.user_info VALUES (7025, 0, 'user_1669291435118', 729);
INSERT INTO public.user_info VALUES (7026, 0, 'user_1669291464850', 730);
INSERT INTO public.user_info VALUES (7027, 0, 'user_1669291464849', 731);
INSERT INTO public.user_info VALUES (7028, 0, 'user_1669291500455', 732);
INSERT INTO public.user_info VALUES (7029, 0, 'user_1669291500454', 733);
INSERT INTO public.user_info VALUES (7030, 0, 'user_1669291547940', 734);
INSERT INTO public.user_info VALUES (7031, 0, 'user_1669291553367', 735);
INSERT INTO public.user_info VALUES (7032, 0, 'user_1669291547939', 736);
INSERT INTO public.user_info VALUES (7033, 0, 'user_1669291553366', 737);
INSERT INTO public.user_info VALUES (7034, 0, 'user_1669291570367', 738);
INSERT INTO public.user_info VALUES (7035, 0, 'user_1669291570366', 739);
INSERT INTO public.user_info VALUES (7036, 0, 'user_1669291581118', 740);
INSERT INTO public.user_info VALUES (7037, 0, 'user_1669291581117', 741);
INSERT INTO public.user_info VALUES (7038, 0, 'user_1669291627350', 742);
INSERT INTO public.user_info VALUES (7039, 0, 'user_1669291627349', 743);
INSERT INTO public.user_info VALUES (7040, 0, 'user_1669291665774', 744);
INSERT INTO public.user_info VALUES (7041, 0, 'user_1669291665773', 745);
INSERT INTO public.user_info VALUES (7042, 0, 'user_1669291681680', 746);
INSERT INTO public.user_info VALUES (7043, 0, 'user_1669291681679', 747);
INSERT INTO public.user_info VALUES (7044, 0, 'user_1669291712208', 748);
INSERT INTO public.user_info VALUES (7045, 0, 'user_1669291712207', 749);
INSERT INTO public.user_info VALUES (7046, 0, 'user_1669291759872', 750);
INSERT INTO public.user_info VALUES (7047, 0, 'user_1669291759871', 751);
INSERT INTO public.user_info VALUES (7048, 0, 'user_1669291870871', 752);
INSERT INTO public.user_info VALUES (7049, 0, 'user_1669291870870', 753);
INSERT INTO public.user_info VALUES (7050, 0, 'user_1669291887888', 754);
INSERT INTO public.user_info VALUES (7051, 0, 'user_1669291897444', 755);
INSERT INTO public.user_info VALUES (7052, 0, 'user_1669291887887', 756);
INSERT INTO public.user_info VALUES (7053, 0, 'user_1669291903204', 757);
INSERT INTO public.user_info VALUES (7054, 0, 'user_1669291897443', 758);
INSERT INTO public.user_info VALUES (7055, 0, 'user_1669291903203', 759);
INSERT INTO public.user_info VALUES (7056, 0, 'user_1669291928665', 760);
INSERT INTO public.user_info VALUES (7057, 0, 'user_1669291928664', 761);


--
-- Name: user_info_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_game_id_seq', 761, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 7057, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: user_info user_info_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_user_id_key UNIQUE (user_id);


--
-- PostgreSQL database dump complete
--

