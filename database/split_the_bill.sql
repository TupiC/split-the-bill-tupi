--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: fhs49031
--

CREATE TABLE public.groups (
    "groupId" integer NOT NULL,
    groupname text NOT NULL
);


ALTER TABLE public.groups OWNER TO fhs49031;

--
-- Name: groups_groupId_seq; Type: SEQUENCE; Schema: public; Owner: fhs49031
--

CREATE SEQUENCE public."groups_groupId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."groups_groupId_seq" OWNER TO fhs49031;

--
-- Name: groups_groupId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhs49031
--

ALTER SEQUENCE public."groups_groupId_seq" OWNED BY public.groups."groupId";


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: fhs49031
--

CREATE TABLE public.transactions (
    "transactionId" integer NOT NULL,
    "groupId" integer NOT NULL,
    total double precision NOT NULL,
    "payedBy" integer NOT NULL,
    comment text,
    "createdAt" timestamp with time zone NOT NULL,
    title text NOT NULL
);


ALTER TABLE public.transactions OWNER TO fhs49031;

--
-- Name: transactions_transactionId_seq; Type: SEQUENCE; Schema: public; Owner: fhs49031
--

CREATE SEQUENCE public."transactions_transactionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."transactions_transactionId_seq" OWNER TO fhs49031;

--
-- Name: transactions_transactionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhs49031
--

ALTER SEQUENCE public."transactions_transactionId_seq" OWNED BY public.transactions."transactionId";


--
-- Name: userInGroup; Type: TABLE; Schema: public; Owner: fhs49031
--

CREATE TABLE public."userInGroup" (
    "userInGroupId" integer NOT NULL,
    "userId" integer NOT NULL,
    "groupId" integer NOT NULL
);


ALTER TABLE public."userInGroup" OWNER TO fhs49031;

--
-- Name: userInGroup_userInGroupId_seq; Type: SEQUENCE; Schema: public; Owner: fhs49031
--

CREATE SEQUENCE public."userInGroup_userInGroupId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userInGroup_userInGroupId_seq" OWNER TO fhs49031;

--
-- Name: userInGroup_userInGroupId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhs49031
--

ALTER SEQUENCE public."userInGroup_userInGroupId_seq" OWNED BY public."userInGroup"."userInGroupId";


--
-- Name: userTransaction; Type: TABLE; Schema: public; Owner: fhs49031
--

CREATE TABLE public."userTransaction" (
    "userTransactionId" integer NOT NULL,
    "userId" integer NOT NULL,
    "transactionId" integer NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public."userTransaction" OWNER TO fhs49031;

--
-- Name: userTransaction_userTransactionId_seq; Type: SEQUENCE; Schema: public; Owner: fhs49031
--

CREATE SEQUENCE public."userTransaction_userTransactionId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."userTransaction_userTransactionId_seq" OWNER TO fhs49031;

--
-- Name: userTransaction_userTransactionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhs49031
--

ALTER SEQUENCE public."userTransaction_userTransactionId_seq" OWNED BY public."userTransaction"."userTransactionId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: fhs49031
--

CREATE TABLE public.users (
    "userId" integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    paypal boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO fhs49031;

--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: fhs49031
--

CREATE SEQUENCE public."users_userId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."users_userId_seq" OWNER TO fhs49031;

--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fhs49031
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: groupId; Type: DEFAULT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.groups ALTER COLUMN "groupId" SET DEFAULT nextval('public."groups_groupId_seq"'::regclass);


--
-- Name: transactionId; Type: DEFAULT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.transactions ALTER COLUMN "transactionId" SET DEFAULT nextval('public."transactions_transactionId_seq"'::regclass);


--
-- Name: userInGroupId; Type: DEFAULT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userInGroup" ALTER COLUMN "userInGroupId" SET DEFAULT nextval('public."userInGroup_userInGroupId_seq"'::regclass);


--
-- Name: userTransactionId; Type: DEFAULT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userTransaction" ALTER COLUMN "userTransactionId" SET DEFAULT nextval('public."userTransaction_userTransactionId_seq"'::regclass);


--
-- Name: userId; Type: DEFAULT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: fhs49031
--

COPY public.groups ("groupId", groupname) FROM stdin;
9	Italien Urlaub
\.


--
-- Name: groups_groupId_seq; Type: SEQUENCE SET; Schema: public; Owner: fhs49031
--

SELECT pg_catalog.setval('public."groups_groupId_seq"', 19, true);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: fhs49031
--

COPY public.transactions ("transactionId", "groupId", total, "payedBy", comment, "createdAt", title) FROM stdin;
37	9	100	1	\N	2023-06-04 21:21:17.779367+02	Fischrestaurant
45	9	100	20	\N	2023-06-05 16:25:01.396023+02	Tank
\.


--
-- Name: transactions_transactionId_seq; Type: SEQUENCE SET; Schema: public; Owner: fhs49031
--

SELECT pg_catalog.setval('public."transactions_transactionId_seq"', 68, true);


--
-- Data for Name: userInGroup; Type: TABLE DATA; Schema: public; Owner: fhs49031
--

COPY public."userInGroup" ("userInGroupId", "userId", "groupId") FROM stdin;
22	18	9
23	1	9
24	19	9
25	20	9
\.


--
-- Name: userInGroup_userInGroupId_seq; Type: SEQUENCE SET; Schema: public; Owner: fhs49031
--

SELECT pg_catalog.setval('public."userInGroup_userInGroupId_seq"', 44, true);


--
-- Data for Name: userTransaction; Type: TABLE DATA; Schema: public; Owner: fhs49031
--

COPY public."userTransaction" ("userTransactionId", "userId", "transactionId", amount) FROM stdin;
109	1	37	100
110	18	37	-35
111	20	37	-25
112	19	37	-20
113	1	37	-20
130	20	45	100
131	18	45	-25
132	20	45	-25
133	19	45	-25
134	1	45	-25
\.


--
-- Name: userTransaction_userTransactionId_seq; Type: SEQUENCE SET; Schema: public; Owner: fhs49031
--

SELECT pg_catalog.setval('public."userTransaction_userTransactionId_seq"', 205, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fhs49031
--

COPY public.users ("userId", username, password, email, paypal) FROM stdin;
19	Tom	$2y$10$gxVlNJ9jVo2Ub8RCB6V6eubDDZ.WRIEpecCZARlLCGzF7WXVHrgkG	tom@tompwd.com	f
1	Vinz	$2y$10$RetVANpRT3miRH8Twj70P.EZKDGadL6VPeM0dV5SJLdiTQUlDH8CW	vinz@a.com	f
18	Kalin	$2y$10$CfSabkoLEE1IZJ.nl8i2geuWfGhLreg4SUrZIU1yon61Z39ZCSBLC	karen@karenpwd.com	f
20	Mary	$2y$10$Id8Ci/Mfnx0AF4zMnaXQpuF6gpccTy2jnYveyhHC2KYP/zQVwvgly	marlie@marliepwd.com	f
\.


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: fhs49031
--

SELECT pg_catalog.setval('public."users_userId_seq"', 25, true);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY ("groupId");


--
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY ("transactionId");


--
-- Name: userInGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userInGroup"
    ADD CONSTRAINT "userInGroup_pkey" PRIMARY KEY ("userInGroupId");


--
-- Name: userTransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userTransaction"
    ADD CONSTRAINT "userTransaction_pkey" PRIMARY KEY ("userTransactionId");


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: groupname_index; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX groupname_index ON public.groups USING btree (groupname);


--
-- Name: transactions_date_index; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX transactions_date_index ON public.transactions USING btree ("createdAt");


--
-- Name: transactions_group_index; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX transactions_group_index ON public.transactions USING btree ("groupId");


--
-- Name: transactions_payer_index; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX transactions_payer_index ON public.transactions USING btree ("payedBy");


--
-- Name: userInGroupGroup; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX "userInGroupGroup" ON public."userInGroup" USING btree ("groupId");


--
-- Name: userInGroupUser; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX "userInGroupUser" ON public."userInGroup" USING btree ("userId");


--
-- Name: usertransaction_transactionindex; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX usertransaction_transactionindex ON public."userTransaction" USING btree ("transactionId");


--
-- Name: usertransaction_userindex; Type: INDEX; Schema: public; Owner: fhs49031
--

CREATE INDEX usertransaction_userindex ON public."userTransaction" USING btree ("userId");


--
-- Name: FkeyGroupToTransaction	; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "FkeyGroupToTransaction	" FOREIGN KEY ("groupId") REFERENCES public.groups("groupId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FkeyGroupToUser; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userInGroup"
    ADD CONSTRAINT "FkeyGroupToUser" FOREIGN KEY ("groupId") REFERENCES public.groups("groupId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FkeyPayerToTransaction; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT "FkeyPayerToTransaction" FOREIGN KEY ("payedBy") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FkeyTransactionToUser; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userTransaction"
    ADD CONSTRAINT "FkeyTransactionToUser" FOREIGN KEY ("transactionId") REFERENCES public.transactions("transactionId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FkeyUserToGroup	; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userInGroup"
    ADD CONSTRAINT "FkeyUserToGroup	" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FkeyUsertToTransaction; Type: FK CONSTRAINT; Schema: public; Owner: fhs49031
--

ALTER TABLE ONLY public."userTransaction"
    ADD CONSTRAINT "FkeyUsertToTransaction" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

