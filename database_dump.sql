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

CREATE TABLE public.password_resets (
    id bigint NOT NULL,
    user_id bigint,
    token text,
    expired_at timestamp with time zone
);

ALTER TABLE public.password_resets OWNER TO saadbin;

CREATE SEQUENCE public.password_resets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.password_resets_id_seq OWNER TO saadbin;

ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;

CREATE TABLE public.source_of_funds (
    id bigint NOT NULL,
    name text
);

ALTER TABLE public.source_of_funds OWNER TO saadbin;

CREATE SEQUENCE public.source_of_funds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.source_of_funds_id_seq OWNER TO saadbin;

ALTER SEQUENCE public.source_of_funds_id_seq OWNED BY public.source_of_funds.id;

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    source_of_fund_id bigint,
    user_id bigint,
    destination_id bigint,
    amount bigint,
    description text,
    category text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);

ALTER TABLE public.transactions OWNER TO saadbin;

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.transactions_id_seq OWNER TO saadbin;

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text,
    email text,
    password text
);

ALTER TABLE public.users OWNER TO saadbin;

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.users_id_seq OWNER TO saadbin;

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;

CREATE TABLE public.wallets (
    id bigint NOT NULL,
    user_id bigint,
    number text,
    balance bigint
);

ALTER TABLE public.wallets OWNER TO saadbin;

CREATE SEQUENCE public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.wallets_id_seq OWNER TO saadbin;

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;

ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);

ALTER TABLE ONLY public.source_of_funds ALTER COLUMN id SET DEFAULT nextval('public.source_of_funds_id_seq'::regclass);

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);

COPY public.source_of_funds (id, name
