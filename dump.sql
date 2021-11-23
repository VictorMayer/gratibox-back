--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    full_name text NOT NULL,
    description text NOT NULL,
    postal_code text NOT NULL,
    city text NOT NULL,
    state_id integer NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: delivery_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_dates (
    id integer NOT NULL,
    plan_type_id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: delivery_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_dates_id_seq OWNED BY public.delivery_dates.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    date date NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: plan_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_categories (
    id integer NOT NULL,
    category_id integer NOT NULL,
    plan_id integer NOT NULL
);


--
-- Name: plan_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plan_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plan_categories_id_seq OWNED BY public.plan_categories.id;


--
-- Name: plan_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_orders (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    order_id integer NOT NULL
);


--
-- Name: plan_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plan_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plan_orders_id_seq OWNED BY public.plan_orders.id;


--
-- Name: plan_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plan_type (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: plan_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plan_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plan_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plan_type_id_seq OWNED BY public.plan_type.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plans (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address_id integer NOT NULL,
    plan_type_id integer NOT NULL,
    delivery_date_id integer NOT NULL,
    subscription_date date NOT NULL
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plans_id_seq OWNED BY public.plans.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: delivery_dates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_dates ALTER COLUMN id SET DEFAULT nextval('public.delivery_dates_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: plan_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_categories ALTER COLUMN id SET DEFAULT nextval('public.plan_categories_id_seq'::regclass);


--
-- Name: plan_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_orders ALTER COLUMN id SET DEFAULT nextval('public.plan_orders_id_seq'::regclass);


--
-- Name: plan_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_type ALTER COLUMN id SET DEFAULT nextval('public.plan_type_id_seq'::regclass);


--
-- Name: plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans ALTER COLUMN id SET DEFAULT nextval('public.plans_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.addresses VALUES (1, 'Joaozin', 'Rua 10', '11111-111', 'balnica', 24);
INSERT INTO public.addresses VALUES (2, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (3, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (4, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (5, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (6, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (7, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (8, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (9, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (10, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (11, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (12, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (13, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (14, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (15, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (16, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (17, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (18, 'Joanísio Tomás Braga', 'Rua Master Brutus, 116', '80700-807', 'Cidade Grande', 24);
INSERT INTO public.addresses VALUES (19, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (20, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (21, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (22, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (23, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (24, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (25, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (26, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (27, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (28, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (29, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (30, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (31, 'swd12d', 'qw211', '12212-324', '1231232', 2);
INSERT INTO public.addresses VALUES (32, 'swd12d', 'qw211', '12212-324', '1231232', 2);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'Chás');
INSERT INTO public.categories VALUES (2, 'Produtos orgânicos');
INSERT INTO public.categories VALUES (3, 'Incensos');


--
-- Data for Name: delivery_dates; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.delivery_dates VALUES (1, 1, 'Segunda');
INSERT INTO public.delivery_dates VALUES (2, 1, 'Quarta');
INSERT INTO public.delivery_dates VALUES (3, 1, 'Sexta');
INSERT INTO public.delivery_dates VALUES (4, 2, 'Dia 01');
INSERT INTO public.delivery_dates VALUES (5, 2, 'Dia 10');
INSERT INTO public.delivery_dates VALUES (6, 2, 'Dia 20');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: plan_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plan_categories VALUES (2, 1, 4);
INSERT INTO public.plan_categories VALUES (3, 2, 4);
INSERT INTO public.plan_categories VALUES (4, 1, 5);
INSERT INTO public.plan_categories VALUES (5, 2, 5);


--
-- Data for Name: plan_orders; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: plan_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plan_type VALUES (1, 'Semanal');
INSERT INTO public.plan_type VALUES (2, 'Mensal');


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.plans VALUES (2, 1, 29, 1, 4, '2021-11-22');
INSERT INTO public.plans VALUES (3, 1, 30, 1, 4, '2021-11-22');
INSERT INTO public.plans VALUES (4, 1, 31, 1, 4, '2021-11-22');
INSERT INTO public.plans VALUES (5, 1, 32, 1, 4, '2021-11-22');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, 'caaf0453-a2bb-4b57-a096-a0310a0da801');


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states VALUES (1, 'AC');
INSERT INTO public.states VALUES (2, 'AL');
INSERT INTO public.states VALUES (3, 'AM');
INSERT INTO public.states VALUES (4, 'AP');
INSERT INTO public.states VALUES (5, 'BA');
INSERT INTO public.states VALUES (6, 'CE');
INSERT INTO public.states VALUES (7, 'DF');
INSERT INTO public.states VALUES (8, 'ES');
INSERT INTO public.states VALUES (9, 'GO');
INSERT INTO public.states VALUES (10, 'MA');
INSERT INTO public.states VALUES (11, 'MG');
INSERT INTO public.states VALUES (12, 'MS');
INSERT INTO public.states VALUES (13, 'MT');
INSERT INTO public.states VALUES (14, 'PA');
INSERT INTO public.states VALUES (15, 'PB');
INSERT INTO public.states VALUES (16, 'PE');
INSERT INTO public.states VALUES (17, 'PI');
INSERT INTO public.states VALUES (18, 'PR');
INSERT INTO public.states VALUES (19, 'RJ');
INSERT INTO public.states VALUES (20, 'RN');
INSERT INTO public.states VALUES (21, 'RO');
INSERT INTO public.states VALUES (22, 'RR');
INSERT INTO public.states VALUES (23, 'RS');
INSERT INTO public.states VALUES (24, 'SC');
INSERT INTO public.states VALUES (25, 'SE');
INSERT INTO public.states VALUES (26, 'SP');
INSERT INTO public.states VALUES (27, 'TO');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Victor', 'vic@mail.com', '$2b$10$rhdVM2C9jg1M4iPe2IbPBOg6eDh9CIm0q4Fg10jPfFrrCS64Kl65q');


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.addresses_id_seq', 32, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- Name: delivery_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.delivery_dates_id_seq', 6, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: plan_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plan_categories_id_seq', 5, true);


--
-- Name: plan_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plan_orders_id_seq', 1, false);


--
-- Name: plan_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plan_type_id_seq', 2, true);


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.plans_id_seq', 5, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: addresses addresses_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pk PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pk PRIMARY KEY (id);


--
-- Name: delivery_dates delivery_dates_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_dates
    ADD CONSTRAINT delivery_dates_name_key UNIQUE (name);


--
-- Name: delivery_dates delivery_dates_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_dates
    ADD CONSTRAINT delivery_dates_pk PRIMARY KEY (id);


--
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (id);


--
-- Name: plan_categories plan_categories_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_categories
    ADD CONSTRAINT plan_categories_pk PRIMARY KEY (id);


--
-- Name: plan_orders plan_orders_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_orders
    ADD CONSTRAINT plan_orders_pk PRIMARY KEY (id);


--
-- Name: plan_type plan_type_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_type
    ADD CONSTRAINT plan_type_name_key UNIQUE (name);


--
-- Name: plan_type plan_type_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_type
    ADD CONSTRAINT plan_type_pk PRIMARY KEY (id);


--
-- Name: plans plans_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: states states_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_name_key UNIQUE (name);


--
-- Name: states states_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pk PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: addresses addresses_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_fk0 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: delivery_dates delivery_dates_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_dates
    ADD CONSTRAINT delivery_dates_fk0 FOREIGN KEY (plan_type_id) REFERENCES public.plan_type(id);


--
-- Name: plan_categories plan_categories_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_categories
    ADD CONSTRAINT plan_categories_fk0 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: plan_categories plan_categories_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_categories
    ADD CONSTRAINT plan_categories_fk1 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: plan_orders plan_orders_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_orders
    ADD CONSTRAINT plan_orders_fk0 FOREIGN KEY (plan_id) REFERENCES public.plans(id);


--
-- Name: plan_orders plan_orders_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plan_orders
    ADD CONSTRAINT plan_orders_fk1 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: plans plans_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: plans plans_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_fk1 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: plans plans_fk2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_fk2 FOREIGN KEY (plan_type_id) REFERENCES public.plan_type(id);


--
-- Name: plans plans_fk3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plans
    ADD CONSTRAINT plans_fk3 FOREIGN KEY (delivery_date_id) REFERENCES public.delivery_dates(id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

