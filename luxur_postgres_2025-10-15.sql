--
-- PostgreSQL database dump
--

\restrict h0jNffPW9OaCsHzwL2BacmjpYijCXpzYg1T3Z9Ufhzn6Z8ciTDtC9eI0hP8SErs

-- Dumped from database version 14.19 (Debian 14.19-1.pgdg13+1)
-- Dumped by pg_dump version 14.19 (Debian 14.19-1.pgdg13+1)

-- Started on 2025-10-15 23:44:08 UTC

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

--
-- TOC entry 249 (class 1255 OID 57360)
-- Name: fn_ad_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ad_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    jsonb_build_object(
      'id', OLD.id,
      'first_name', OLD.first_name,
      'last_name', OLD.last_name,
      'email', OLD.email
    ),
    NULL
  );
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.fn_ad_clients_audit() OWNER TO samuel;

--
-- TOC entry 279 (class 1255 OID 57430)
-- Name: fn_ad_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ad_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    jsonb_build_object(
      'id', OLD.id,
      'property_id', OLD.property_id,
      'start_date', OLD.start_date,
      'end_date', OLD.end_date,
      'client_id', OLD.client_id
    ),
    NULL
  );
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.fn_ad_contracts_audit() OWNER TO samuel;

--
-- TOC entry 255 (class 1255 OID 57382)
-- Name: fn_ad_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ad_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    jsonb_build_object(
      'id', OLD.id,
      'first_name', OLD.first_name,
      'last_name', OLD.last_name,
      'email', OLD.email
    ),
    NULL
  );
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.fn_ad_owners_audit() OWNER TO samuel;

--
-- TOC entry 282 (class 1255 OID 57454)
-- Name: fn_ad_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ad_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    jsonb_build_object(
      'id', OLD.id,
      'contract_id', OLD.contract_id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date,
      'payment_method', OLD.payment_method,
      'status', OLD.status
    ),
    NULL
  );
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.fn_ad_payments_audit() OWNER TO samuel;

--
-- TOC entry 273 (class 1255 OID 57406)
-- Name: fn_ad_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ad_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    jsonb_build_object(
      'id', OLD.id,
      'address', OLD.address,
      'price', OLD.price,
      'property_type_id', OLD.property_type_id,
      'owner_id', OLD.owner_id
    ),
    NULL
  );
  RETURN OLD;
END;
$$;


ALTER FUNCTION public.fn_ad_properties_audit() OWNER TO samuel;

--
-- TOC entry 247 (class 1255 OID 57356)
-- Name: fn_ai_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ai_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    jsonb_build_object(
      'id', NEW.id,
      'first_name', NEW.first_name,
      'last_name', NEW.last_name,
      'email', NEW.email
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_ai_clients_audit() OWNER TO samuel;

--
-- TOC entry 277 (class 1255 OID 57426)
-- Name: fn_ai_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ai_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    jsonb_build_object(
      'id', NEW.id,
      'property_id', NEW.property_id,
      'start_date', NEW.start_date,
      'end_date', NEW.end_date,
      'client_id', NEW.client_id
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_ai_contracts_audit() OWNER TO samuel;

--
-- TOC entry 252 (class 1255 OID 57378)
-- Name: fn_ai_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ai_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    jsonb_build_object(
      'id', NEW.id,
      'first_name', NEW.first_name,
      'last_name', NEW.last_name,
      'email', NEW.email
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_ai_owners_audit() OWNER TO samuel;

--
-- TOC entry 253 (class 1255 OID 57450)
-- Name: fn_ai_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ai_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    jsonb_build_object(
      'id', NEW.id,
      'contract_id', NEW.contract_id,
      'amount', NEW.amount,
      'payment_date', NEW.payment_date,
      'payment_method', NEW.payment_method,
      'status', NEW.status
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_ai_payments_audit() OWNER TO samuel;

--
-- TOC entry 262 (class 1255 OID 57402)
-- Name: fn_ai_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_ai_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    jsonb_build_object(
      'id', NEW.id,
      'address', NEW.address,
      'price', NEW.price,
      'property_type_id', NEW.property_type_id,
      'owner_id', NEW.owner_id
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_ai_properties_audit() OWNER TO samuel;

--
-- TOC entry 248 (class 1255 OID 57358)
-- Name: fn_au_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_au_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    jsonb_build_object(
      'id', OLD.id,
      'first_name', OLD.first_name,
      'last_name', OLD.last_name,
      'email', OLD.email
    ),
    jsonb_build_object(
      'id', NEW.id,
      'first_name', NEW.first_name,
      'last_name', NEW.last_name,
      'email', NEW.email
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_au_clients_audit() OWNER TO samuel;

--
-- TOC entry 278 (class 1255 OID 57428)
-- Name: fn_au_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_au_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    jsonb_build_object(
      'id', OLD.id,
      'property_id', OLD.property_id,
      'start_date', OLD.start_date,
      'end_date', OLD.end_date,
      'client_id', OLD.client_id
    ),
    jsonb_build_object(
      'id', NEW.id,
      'property_id', NEW.property_id,
      'start_date', NEW.start_date,
      'end_date', NEW.end_date,
      'client_id', NEW.client_id
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_au_contracts_audit() OWNER TO samuel;

--
-- TOC entry 254 (class 1255 OID 57380)
-- Name: fn_au_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_au_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    jsonb_build_object(
      'id', OLD.id,
      'first_name', OLD.first_name,
      'last_name', OLD.last_name,
      'email', OLD.email
    ),
    jsonb_build_object(
      'id', NEW.id,
      'first_name', NEW.first_name,
      'last_name', NEW.last_name,
      'email', NEW.email
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_au_owners_audit() OWNER TO samuel;

--
-- TOC entry 281 (class 1255 OID 57452)
-- Name: fn_au_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_au_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    jsonb_build_object(
      'id', OLD.id,
      'contract_id', OLD.contract_id,
      'amount', OLD.amount,
      'payment_date', OLD.payment_date,
      'payment_method', OLD.payment_method,
      'status', OLD.status
    ),
    jsonb_build_object(
      'id', NEW.id,
      'contract_id', NEW.contract_id,
      'amount', NEW.amount,
      'payment_date', NEW.payment_date,
      'payment_method', NEW.payment_method,
      'status', NEW.status
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_au_payments_audit() OWNER TO samuel;

--
-- TOC entry 272 (class 1255 OID 57404)
-- Name: fn_au_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_au_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    jsonb_build_object(
      'id', OLD.id,
      'address', OLD.address,
      'price', OLD.price,
      'property_type_id', OLD.property_type_id,
      'owner_id', OLD.owner_id
    ),
    jsonb_build_object(
      'id', NEW.id,
      'address', NEW.address,
      'price', NEW.price,
      'property_type_id', NEW.property_type_id,
      'owner_id', NEW.owner_id
    )
  );
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_au_properties_audit() OWNER TO samuel;

--
-- TOC entry 251 (class 1255 OID 57364)
-- Name: fn_block_delete_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_delete_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'clients_audit es inmutable: DELETE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_delete_clients_audit() OWNER TO samuel;

--
-- TOC entry 241 (class 1255 OID 57434)
-- Name: fn_block_delete_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_delete_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'contracts_audit es inmutable: DELETE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_delete_contracts_audit() OWNER TO samuel;

--
-- TOC entry 257 (class 1255 OID 57386)
-- Name: fn_block_delete_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_delete_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'owners_audit es inmutable: DELETE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_delete_owners_audit() OWNER TO samuel;

--
-- TOC entry 284 (class 1255 OID 57458)
-- Name: fn_block_delete_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_delete_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: DELETE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_delete_payments_audit() OWNER TO samuel;

--
-- TOC entry 275 (class 1255 OID 57410)
-- Name: fn_block_delete_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_delete_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'properties_audit es inmutable: DELETE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_delete_properties_audit() OWNER TO samuel;

--
-- TOC entry 250 (class 1255 OID 57362)
-- Name: fn_block_update_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_update_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'clients_audit es inmutable: UPDATE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_update_clients_audit() OWNER TO samuel;

--
-- TOC entry 280 (class 1255 OID 57432)
-- Name: fn_block_update_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_update_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'contracts_audit es inmutable: UPDATE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_update_contracts_audit() OWNER TO samuel;

--
-- TOC entry 256 (class 1255 OID 57384)
-- Name: fn_block_update_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_update_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'owners_audit es inmutable: UPDATE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_update_owners_audit() OWNER TO samuel;

--
-- TOC entry 283 (class 1255 OID 57456)
-- Name: fn_block_update_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_update_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'payments_audit es inmutable: UPDATE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_update_payments_audit() OWNER TO samuel;

--
-- TOC entry 274 (class 1255 OID 57408)
-- Name: fn_block_update_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_block_update_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'properties_audit es inmutable: UPDATE prohibido.';
END;
$$;


ALTER FUNCTION public.fn_block_update_properties_audit() OWNER TO samuel;

--
-- TOC entry 286 (class 1255 OID 57462)
-- Name: fn_guard_insert_clients_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_guard_insert_clients_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack text;
BEGIN
  -- Verificar si el INSERT proviene de un trigger de clients
  GET DIAGNOSTICS stack = PG_CONTEXT;

  IF stack NOT LIKE '%function fn_ai_clients_audit%' AND
     stack NOT LIKE '%function fn_au_clients_audit%' AND
     stack NOT LIKE '%function fn_ad_clients_audit%' THEN
    RAISE EXCEPTION 'INSERT en clients_audit solo permitido desde triggers de clients.';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_guard_insert_clients_audit() OWNER TO samuel;

--
-- TOC entry 263 (class 1255 OID 57436)
-- Name: fn_guard_insert_contracts_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_guard_insert_contracts_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack text;
BEGIN
  -- Verificar si el INSERT proviene de un trigger de contracts
  GET DIAGNOSTICS stack = PG_CONTEXT;

  IF stack NOT LIKE '%function fn_ai_contracts_audit%' AND
     stack NOT LIKE '%function fn_au_contracts_audit%' AND
     stack NOT LIKE '%function fn_ad_contracts_audit%' THEN
    RAISE EXCEPTION 'INSERT en contracts_audit solo permitido desde triggers de contracts.';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_guard_insert_contracts_audit() OWNER TO samuel;

--
-- TOC entry 261 (class 1255 OID 57388)
-- Name: fn_guard_insert_owners_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_guard_insert_owners_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack text;
BEGIN
  -- Verificar si el INSERT proviene de un trigger de owners
  GET DIAGNOSTICS stack = PG_CONTEXT;
  IF stack NOT LIKE '%function fn_ai_owners_audit%' AND
     stack NOT LIKE '%function fn_au_owners_audit%' AND
     stack NOT LIKE '%function fn_ad_owners_audit%' THEN
    RAISE EXCEPTION 'INSERT en owners_audit solo permitido desde triggers de owners.';
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_guard_insert_owners_audit() OWNER TO samuel;

--
-- TOC entry 285 (class 1255 OID 57460)
-- Name: fn_guard_insert_payments_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_guard_insert_payments_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack text;
BEGIN
  -- Verificar si el INSERT proviene de un trigger de payments
  GET DIAGNOSTICS stack = PG_CONTEXT;

  IF stack NOT LIKE '%function fn_ai_payments_audit%' AND
     stack NOT LIKE '%function fn_au_payments_audit%' AND
     stack NOT LIKE '%function fn_ad_payments_audit%' THEN
    RAISE EXCEPTION 'INSERT en payments_audit solo permitido desde triggers de payments.';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_guard_insert_payments_audit() OWNER TO samuel;

--
-- TOC entry 276 (class 1255 OID 57412)
-- Name: fn_guard_insert_properties_audit(); Type: FUNCTION; Schema: public; Owner: samuel
--

CREATE FUNCTION public.fn_guard_insert_properties_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  stack text;
BEGIN
  -- Verificar si el INSERT proviene de un trigger de properties
  GET DIAGNOSTICS stack = PG_CONTEXT;

  IF stack NOT LIKE '%function fn_ai_properties_audit%' AND
     stack NOT LIKE '%function fn_au_properties_audit%' AND
     stack NOT LIKE '%function fn_ad_properties_audit%' THEN
    RAISE EXCEPTION 'INSERT en properties_audit solo permitido desde triggers de properties.';
  END IF;

  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_guard_insert_properties_audit() OWNER TO samuel;

--
-- TOC entry 243 (class 1255 OID 40961)
-- Name: getclientsvisits(); Type: PROCEDURE; Schema: public; Owner: samuel
--

CREATE PROCEDURE public.getclientsvisits()
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT c.first_name, c.last_name, v.visit_date, p.address
    FROM clients c
    INNER JOIN visits v ON c.id = v.client_id
    INNER JOIN properties p ON v.property_id = p.id;
END;
$$;


ALTER PROCEDURE public.getclientsvisits() OWNER TO samuel;

--
-- TOC entry 242 (class 1255 OID 40960)
-- Name: getclientswithproperties(); Type: PROCEDURE; Schema: public; Owner: samuel
--

CREATE PROCEDURE public.getclientswithproperties()
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT c.first_name, c.last_name, p.address, p.price
    FROM clients c
    INNER JOIN contracts ct ON c.id = ct.client_id
    INNER JOIN properties p ON ct.property_id = p.id;
END;
$$;


ALTER PROCEDURE public.getclientswithproperties() OWNER TO samuel;

--
-- TOC entry 245 (class 1255 OID 40963)
-- Name: getgmailclients(); Type: PROCEDURE; Schema: public; Owner: samuel
--

CREATE PROCEDURE public.getgmailclients()
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT first_name, last_name, email
    FROM clients
    WHERE email LIKE '%@gmail.com';
END;
$$;


ALTER PROCEDURE public.getgmailclients() OWNER TO samuel;

--
-- TOC entry 244 (class 1255 OID 40962)
-- Name: getownerproperties(integer); Type: PROCEDURE; Schema: public; Owner: samuel
--

CREATE PROCEDURE public.getownerproperties(IN ownerid integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT o.first_name, o.last_name, p.address, p.price
    FROM owners o
    INNER JOIN properties p ON o.id = p.owner_id
    WHERE o.id = ownerId;
END;
$$;


ALTER PROCEDURE public.getownerproperties(IN ownerid integer) OWNER TO samuel;

--
-- TOC entry 246 (class 1255 OID 40964)
-- Name: getpaymentsbetween(date, date); Type: PROCEDURE; Schema: public; Owner: samuel
--

CREATE PROCEDURE public.getpaymentsbetween(IN startdate date, IN enddate date)
    LANGUAGE plpgsql
    AS $$
BEGIN
    SELECT contract_id, amount, payment_date
    FROM payments
    WHERE payment_date BETWEEN startDate AND endDate;
END;
$$;


ALTER PROCEDURE public.getpaymentsbetween(IN startdate date, IN enddate date) OWNER TO samuel;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 16483)
-- Name: amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amenities (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.amenities OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16482)
-- Name: amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenities_id_seq OWNER TO postgres;

--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 225
-- Name: amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amenities_id_seq OWNED BY public.amenities.id;


--
-- TOC entry 212 (class 1259 OID 16397)
-- Name: client_evaluations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_evaluations (
    id integer NOT NULL,
    client_id integer NOT NULL,
    comments character varying(255),
    rating numeric(3,2)
);


ALTER TABLE public.client_evaluations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16396)
-- Name: client_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_evaluations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_evaluations_id_seq OWNER TO postgres;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 211
-- Name: client_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_evaluations_id_seq OWNED BY public.client_evaluations.id;


--
-- TOC entry 210 (class 1259 OID 16388)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 57345)
-- Name: clients_audit; Type: TABLE; Schema: public; Owner: samuel
--

CREATE TABLE public.clients_audit (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    actionclient character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER NOT NULL,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT clients_audit_actionclient_check CHECK (((actionclient)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.clients_audit OWNER TO samuel;

--
-- TOC entry 231 (class 1259 OID 57344)
-- Name: clients_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: samuel
--

CREATE SEQUENCE public.clients_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_audit_id_seq OWNER TO samuel;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 231
-- Name: clients_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuel
--

ALTER SEQUENCE public.clients_audit_id_seq OWNED BY public.clients_audit.id;


--
-- TOC entry 209 (class 1259 OID 16387)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 209
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 222 (class 1259 OID 16459)
-- Name: contract_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contract_documents (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    document character varying(255) NOT NULL
);


ALTER TABLE public.contract_documents OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16458)
-- Name: contract_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contract_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contract_documents_id_seq OWNER TO postgres;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 221
-- Name: contract_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contract_documents_id_seq OWNED BY public.contract_documents.id;


--
-- TOC entry 220 (class 1259 OID 16442)
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    property_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 57415)
-- Name: contracts_audit; Type: TABLE; Schema: public; Owner: samuel
--

CREATE TABLE public.contracts_audit (
    id bigint NOT NULL,
    contract_id bigint NOT NULL,
    actioncontract character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER NOT NULL,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT contracts_audit_actioncontract_check CHECK (((actioncontract)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.contracts_audit OWNER TO samuel;

--
-- TOC entry 237 (class 1259 OID 57414)
-- Name: contracts_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: samuel
--

CREATE SEQUENCE public.contracts_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_audit_id_seq OWNER TO samuel;

--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 237
-- Name: contracts_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuel
--

ALTER SEQUENCE public.contracts_audit_id_seq OWNED BY public.contracts_audit.id;


--
-- TOC entry 219 (class 1259 OID 16441)
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contracts_id_seq OWNER TO postgres;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 219
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- TOC entry 216 (class 1259 OID 16416)
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(150) NOT NULL
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 57367)
-- Name: owners_audit; Type: TABLE; Schema: public; Owner: samuel
--

CREATE TABLE public.owners_audit (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    actionowner character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER NOT NULL,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT owners_audit_actionowner_check CHECK (((actionowner)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.owners_audit OWNER TO samuel;

--
-- TOC entry 233 (class 1259 OID 57366)
-- Name: owners_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: samuel
--

CREATE SEQUENCE public.owners_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_audit_id_seq OWNER TO samuel;

--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 233
-- Name: owners_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuel
--

ALTER SEQUENCE public.owners_audit_id_seq OWNED BY public.owners_audit.id;


--
-- TOC entry 215 (class 1259 OID 16415)
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_id_seq OWNER TO postgres;

--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 215
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_id_seq OWNED BY public.owners.id;


--
-- TOC entry 224 (class 1259 OID 16471)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    payment_date date NOT NULL,
    amount numeric(15,2) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 57439)
-- Name: payments_audit; Type: TABLE; Schema: public; Owner: samuel
--

CREATE TABLE public.payments_audit (
    id bigint NOT NULL,
    payment_id bigint NOT NULL,
    actionpayment character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER NOT NULL,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT payments_audit_actionpayment_check CHECK (((actionpayment)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.payments_audit OWNER TO samuel;

--
-- TOC entry 239 (class 1259 OID 57438)
-- Name: payments_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: samuel
--

CREATE SEQUENCE public.payments_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_audit_id_seq OWNER TO samuel;

--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuel
--

ALTER SEQUENCE public.payments_audit_id_seq OWNED BY public.payments_audit.id;


--
-- TOC entry 223 (class 1259 OID 16470)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 218 (class 1259 OID 16425)
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    price numeric(15,2) NOT NULL,
    property_type_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 57391)
-- Name: properties_audit; Type: TABLE; Schema: public; Owner: samuel
--

CREATE TABLE public.properties_audit (
    id bigint NOT NULL,
    property_id bigint NOT NULL,
    actionproperty character varying(10) NOT NULL,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    changed_by character varying(255) DEFAULT CURRENT_USER NOT NULL,
    before_data jsonb,
    after_data jsonb,
    CONSTRAINT properties_audit_actionproperty_check CHECK (((actionproperty)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE public.properties_audit OWNER TO samuel;

--
-- TOC entry 235 (class 1259 OID 57390)
-- Name: properties_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: samuel
--

CREATE SEQUENCE public.properties_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_audit_id_seq OWNER TO samuel;

--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 235
-- Name: properties_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: samuel
--

ALTER SEQUENCE public.properties_audit_id_seq OWNED BY public.properties_audit.id;


--
-- TOC entry 217 (class 1259 OID 16424)
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO postgres;

--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 217
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- TOC entry 228 (class 1259 OID 16490)
-- Name: property_amenities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_amenities (
    id integer NOT NULL,
    property_id integer NOT NULL,
    amenity_id integer NOT NULL
);


ALTER TABLE public.property_amenities OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16489)
-- Name: property_amenities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_amenities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_amenities_id_seq OWNER TO postgres;

--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 227
-- Name: property_amenities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_amenities_id_seq OWNED BY public.property_amenities.id;


--
-- TOC entry 214 (class 1259 OID 16409)
-- Name: property_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.property_types (
    id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.property_types OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16408)
-- Name: property_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.property_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.property_types_id_seq OWNER TO postgres;

--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 213
-- Name: property_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.property_types_id_seq OWNED BY public.property_types.id;


--
-- TOC entry 230 (class 1259 OID 16507)
-- Name: visits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    property_id integer NOT NULL,
    visit_date date NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.visits OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16506)
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visits_id_seq OWNER TO postgres;

--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 229
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- TOC entry 3372 (class 2604 OID 16486)
-- Name: amenities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities ALTER COLUMN id SET DEFAULT nextval('public.amenities_id_seq'::regclass);


--
-- TOC entry 3365 (class 2604 OID 16400)
-- Name: client_evaluations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_evaluations ALTER COLUMN id SET DEFAULT nextval('public.client_evaluations_id_seq'::regclass);


--
-- TOC entry 3364 (class 2604 OID 16391)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 3375 (class 2604 OID 57348)
-- Name: clients_audit id; Type: DEFAULT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.clients_audit ALTER COLUMN id SET DEFAULT nextval('public.clients_audit_id_seq'::regclass);


--
-- TOC entry 3370 (class 2604 OID 16462)
-- Name: contract_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_documents ALTER COLUMN id SET DEFAULT nextval('public.contract_documents_id_seq'::regclass);


--
-- TOC entry 3369 (class 2604 OID 16445)
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- TOC entry 3387 (class 2604 OID 57418)
-- Name: contracts_audit id; Type: DEFAULT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.contracts_audit ALTER COLUMN id SET DEFAULT nextval('public.contracts_audit_id_seq'::regclass);


--
-- TOC entry 3367 (class 2604 OID 16419)
-- Name: owners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN id SET DEFAULT nextval('public.owners_id_seq'::regclass);


--
-- TOC entry 3379 (class 2604 OID 57370)
-- Name: owners_audit id; Type: DEFAULT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.owners_audit ALTER COLUMN id SET DEFAULT nextval('public.owners_audit_id_seq'::regclass);


--
-- TOC entry 3371 (class 2604 OID 16474)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 57442)
-- Name: payments_audit id; Type: DEFAULT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.payments_audit ALTER COLUMN id SET DEFAULT nextval('public.payments_audit_id_seq'::regclass);


--
-- TOC entry 3368 (class 2604 OID 16428)
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- TOC entry 3383 (class 2604 OID 57394)
-- Name: properties_audit id; Type: DEFAULT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.properties_audit ALTER COLUMN id SET DEFAULT nextval('public.properties_audit_id_seq'::regclass);


--
-- TOC entry 3373 (class 2604 OID 16493)
-- Name: property_amenities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities ALTER COLUMN id SET DEFAULT nextval('public.property_amenities_id_seq'::regclass);


--
-- TOC entry 3366 (class 2604 OID 16412)
-- Name: property_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types ALTER COLUMN id SET DEFAULT nextval('public.property_types_id_seq'::regclass);


--
-- TOC entry 3374 (class 2604 OID 16510)
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- TOC entry 3628 (class 0 OID 16483)
-- Dependencies: 226
-- Data for Name: amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amenities (id, description) FROM stdin;
1	Piscina
2	Gimnasio
3	Parqueadero
4	Zona BBQ
5	Salón comunal
6	Ascensor
7	Jardín
8	Zona infantil
9	Terraza
10	Balcón
11	Sauna
12	Turco
13	Cancha de fútbol
14	Cancha de baloncesto
15	Cancha de tenis
16	Ciclovía
17	Sendero peatonal
18	Zona de coworking
19	Sala de cine
20	Biblioteca
21	Sala de juegos
22	Billar
23	Ping pong
24	Jacuzzi
25	Lago artificial
26	Zona de camping
27	Huerta comunitaria
28	Paneles solares
29	Seguridad 24h
30	Portería
31	Sistema de cámaras
32	Wifi en zonas comunes
33	Coworking al aire libre
34	Pet friendly
35	Lavandería
36	Cafetería
37	Minimarket
38	Zona de reciclaje
39	Taller de bicicletas
40	Parque para mascotas
41	Chimenea
42	Zona de masajes
43	Estudio de yoga
44	Sala de conferencias
45	Salón de eventos
46	Zona de trote
47	Cancha de squash
48	Auditorio
49	Restaurante
50	Helipuerto
51	Club house
52	Campo de golf
53	Playa privada
54	Mirador
55	Zona de picnic
56	Horno de leña
57	Kiosko social
58	Rooftop
59	Coworking privado
60	Zona de arte
61	Jardín
62	Chimenea
63	Cámaras de seguridad
64	Garaje privado
65	Sistema de casa inteligente
66	Balcón
67	Sala de juegos
68	Bodega de vinos
69	Techo verde
70	Terraza en la azotea
71	Sauna
72	Baño turco
73	Zona para mascotas
74	Cocina exterior
75	Sala de cine
76	Parque infantil
77	Espacio de co-working
78	Parqueadero de bicicletas
79	Piscina cubierta
80	Parqueadero para visitantes
81	Cancha de tenis
82	Cancha de baloncesto
83	Cancha de fútbol
84	Pista de atletismo
85	Biblioteca
86	Sala de música
87	Sala de meditación
88	Muelle privado
89	Helipuerto
90	Vista panorámica
91	Lavandería
92	Cuarto de almacenamiento
93	Paneles solares
94	Zona de BBQ
95	Salón comunal
96	Sala de yoga
97	Jardín interior
98	Fuente de agua
99	Servicio de conserjería
100	Parqueadero con valet
\.


--
-- TOC entry 3614 (class 0 OID 16397)
-- Dependencies: 212
-- Data for Name: client_evaluations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_evaluations (id, client_id, comments, rating) FROM stdin;
1	71	Muy satisfecho con la atención	5.00
2	72	El proceso fue rápido y confiable	4.00
3	73	Atención al cliente excelente	5.00
4	74	Hubo algunos retrasos en la respuesta	3.00
5	75	Muy buena experiencia en general	4.00
6	76	La información no fue clara	2.00
7	77	Excelente servicio, volvería a usarlo	5.00
8	78	El contrato tuvo algunos errores menores	3.00
9	79	Todo salió perfecto	5.00
10	80	Recomiendo ampliamente la empresa	5.00
11	81	La gestión fue aceptable, pero puede mejorar	3.00
12	82	Muy buena asesoría recibida	4.00
13	83	El tiempo de espera fue demasiado	2.00
14	84	Excelente acompañamiento en el proceso	5.00
15	85	Un poco complicado al inicio	3.00
16	86	La comunicación fue clara y oportuna	4.00
17	87	Muy satisfecho con el resultado final	5.00
18	88	Algunos detalles no fueron explicados	2.00
19	89	En general todo estuvo correcto	4.00
20	90	Excelente profesionalismo	5.00
21	91	El servicio fue un poco lento	3.00
22	92	Muy agradecido con el apoyo recibido	5.00
23	93	La asesoría no fue suficiente	2.00
24	94	Todo bien, sin complicaciones	4.00
25	95	Muy recomendable el servicio	5.00
26	96	El seguimiento podría ser mejor	3.00
27	97	Muy satisfecho con el trato recibido	5.00
28	98	Hubo confusión en algunos documentos	2.00
29	99	Buen servicio y trato cordial	4.00
30	100	Excelente en todos los aspectos	5.00
\.


--
-- TOC entry 3612 (class 0 OID 16388)
-- Dependencies: 210
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, first_name, last_name, email) FROM stdin;
1	Juan	Pérez	juan.perez1@email.com
2	Laura	Martínez	laura.mtz2@email.com
3	Pedro	Ramírez	pedro.ramirez3@email.com
4	Sofía	García	sofia.garcia4@email.com
5	Andrés	López	andres.lopez5@email.com
6	Camila	Torres	camila.torres6@email.com
7	Diego	Hernández	diego.hernandez7@email.com
8	Valentina	Moreno	valentina.moreno8@email.com
9	Felipe	Castro	felipe.castro9@email.com
10	Isabella	Rojas	isabella.rojas10@email.com
11	Daniel	Vargas	daniel.vargas11@email.com
12	Mariana	Cárdenas	mariana.cardenas12@email.com
13	Santiago	Suárez	santiago.suarez13@email.com
14	Paula	Mendoza	paula.mendoza14@email.com
15	Alejandro	Ortiz	alejandro.ortiz15@email.com
16	Natalia	Guzmán	natalia.guzman16@email.com
17	Mateo	Salazar	mateo.salazar17@email.com
18	Gabriela	Patiño	gabriela.patino18@email.com
19	Sebastián	Acosta	sebastian.acosta19@email.com
20	Daniela	Mejía	daniela.mejia20@email.com
21	Tomás	Reyes	tomas.reyes21@email.com
22	Lucía	Muñoz	lucia.munoz22@email.com
23	Emilio	Rivera	emilio.rivera23@email.com
24	Ana	Jiménez	ana.jimenez24@email.com
25	Simón	Herrera	simon.herrera25@email.com
26	Carolina	Peña	carolina.pena26@email.com
27	Martín	Romero	martin.romero27@email.com
28	Juliana	Vega	juliana.vega28@email.com
29	Esteban	Gallo	esteban.gallo29@email.com
30	Claudia	Serrano	claudia.serrano30@email.com
31	Camilo	Peralta	camilo.peralta31@email.com
32	Valeria	Arias	valeria.arias32@email.com
33	Hugo	Villalba	hugo.villalba33@email.com
34	Elena	Santos	elena.santos34@email.com
35	Ricardo	Quintero	ricardo.quintero35@email.com
36	Ángela	Montoya	angela.montoya36@email.com
37	Cristian	Rincón	cristian.rincon37@email.com
38	Daniela	Nieves	daniela.nieves38@email.com
39	Leonardo	Bermúdez	leonardo.bermudez39@email.com
40	Adriana	Córdoba	adriana.cordoba40@email.com
41	Mauricio	Parra	mauricio.parra41@email.com
42	Tatiana	Ramos	tatiana.ramos42@email.com
43	Nicolás	Beltrán	nicolas.beltran43@email.com
44	Catalina	Molina	catalina.molina44@email.com
45	Óscar	García	oscar.garcia45@email.com
46	Sandra	Valdés	sandra.valdes46@email.com
47	Fernando	Ortega	fernando.ortega47@email.com
48	Diana	Forero	diana.forero48@email.com
49	Julián	Guerrero	julian.guerrero49@email.com
50	Carla	Martínez	carla.martinez50@email.com
51	Iván	Salamanca	ivan.salamanca51@email.com
52	Rosa	Cárdenas	rosa.cardenas52@email.com
53	Jorge	Ramos	jorge.ramos53@email.com
54	Álvaro	Lara	alvaro.lara54@email.com
55	Clara	Vargas	clara.vargas55@email.com
56	Pablo	Rey	pablo.rey56@email.com
57	Marcela	Bustos	marcela.bustos57@email.com
58	Hernán	Fonseca	hernan.fonseca58@email.com
59	Liliana	Cuéllar	liliana.cuellar59@email.com
60	Ramiro	Torres	ramiro.torres60@email.com
61	Gloria	Martínez	gloria.martinez61@email.com
62	Jaime	Durán	jaime.duran62@email.com
63	Patricia	Londoño	patricia.londono63@email.com
64	Rodrigo	Pardo	rodrigo.pardo64@email.com
65	Luisa	Zamora	luisa.zamora65@email.com
66	Ernesto	Salcedo	ernesto.salcedo66@email.com
67	Teresa	Pérez	teresa.perez67@email.com
68	Andrés	Sarmiento	andres.sarmiento68@email.com
69	Verónica	Beltrán	veronica.beltran69@email.com
70	Rafael	Cruz	rafael.cruz70@email.com
71	Manuel	Benítez	manuel.benitez71@gmail.com
72	Rosa	Delgado	rosa.delgado72@hotmail.com
73	Héctor	Silva	hector.silva73@gmail.com
74	Adriana	Navarro	adriana.navarro74@hotmail.com
75	Francisco	Cortés	francisco.cortes75@gmail.com
76	Marta	Pérez	marta.perez76@gmail.com
77	Luis	Molina	luis.molina77@hotmail.com
78	Silvia	Giraldo	silvia.giraldo78@gmail.com
79	Álvaro	Montes	alvaro.montes79@gmail.com
80	Lorena	Cano	lorena.cano80@hotmail.com
81	Esteban	Soto	esteban.soto81@gmail.com
82	Paola	Del Valle	paola.delvalle82@hotmail.com
83	Julián	Osorio	julian.osorio83@gmail.com
84	Natalia	Palacios	natalia.palacios84@hotmail.com
85	Felipe	Cárdenas	felipe.cardenas85@gmail.com
86	Claudia	Mejía	claudia.mejia86@gmail.com
87	Andrés	Buitrago	andres.buitrago87@gmail.com
88	Marcela	Quintana	marcela.quintana88@hotmail.com
89	Mauricio	Camacho	mauricio.camacho89@gmail.com
90	Liliana	Valencia	liliana.valencia90@hotmail.com
91	Iván	Sierra	ivan.sierra91@gmail.com
92	Gabriela	López	gabriela.lopez92@hotmail.com
93	Diego	Fajardo	diego.fajardo93@gmail.com
94	Patricia	Guzmán	patricia.guzman94@hotmail.com
95	Ricardo	Mendoza	ricardo.mendoza95@gmail.com
96	Carolina	Peña	carolina.pena96@hotmail.com
97	Fernando	Torres	fernando.torres97@gmail.com
98	Angela	Morales	angela.morales98@hotmail.com
99	Óscar	Ruiz	oscar.ruiz99@gmail.com
100	Sandra	Salazar	sandra.salazar100@hotmail.com
101	Samuel	Prada	samuel.prada@gmail.com
\.


--
-- TOC entry 3634 (class 0 OID 57345)
-- Dependencies: 232
-- Data for Name: clients_audit; Type: TABLE DATA; Schema: public; Owner: samuel
--

COPY public.clients_audit (id, client_id, actionclient, changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- TOC entry 3624 (class 0 OID 16459)
-- Dependencies: 222
-- Data for Name: contract_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contract_documents (id, contract_id, document) FROM stdin;
1	1	Contrato_1.pdf
2	2	Contrato_2.pdf
3	3	Contrato_3.pdf
4	4	Contrato_4.pdf
5	5	Contrato_5.pdf
6	6	Contrato_6.pdf
7	7	Contrato_7.pdf
8	8	Contrato_8.pdf
9	9	Contrato_9.pdf
10	10	Contrato_10.pdf
11	11	Contrato_11.pdf
12	12	Contrato_12.pdf
13	13	Contrato_13.pdf
14	14	Contrato_14.pdf
15	15	Contrato_15.pdf
16	16	Contrato_16.pdf
17	17	Contrato_17.pdf
18	18	Contrato_18.pdf
19	19	Contrato_19.pdf
20	20	Contrato_20.pdf
21	21	Contrato_21.pdf
22	22	Contrato_22.pdf
23	23	Contrato_23.pdf
24	24	Contrato_24.pdf
25	25	Contrato_25.pdf
26	26	Contrato_26.pdf
27	27	Contrato_27.pdf
28	28	Contrato_28.pdf
29	29	Contrato_29.pdf
30	30	Contrato_30.pdf
31	31	Contrato_31.pdf
32	32	Contrato_32.pdf
33	33	Contrato_33.pdf
34	34	Contrato_34.pdf
35	35	Contrato_35.pdf
36	36	Contrato_36.pdf
37	37	Contrato_37.pdf
38	38	Contrato_38.pdf
39	39	Contrato_39.pdf
40	40	Contrato_40.pdf
41	41	Contrato_41.pdf
42	42	Contrato_42.pdf
43	43	Contrato_43.pdf
44	44	Contrato_44.pdf
45	45	Contrato_45.pdf
46	46	Contrato_46.pdf
47	47	Contrato_47.pdf
48	48	Contrato_48.pdf
49	49	Contrato_49.pdf
50	50	Contrato_50.pdf
51	51	Contrato_51.pdf
52	52	Contrato_52.pdf
53	53	Contrato_53.pdf
54	54	Contrato_54.pdf
55	55	Contrato_55.pdf
56	56	Contrato_56.pdf
57	57	Contrato_57.pdf
58	58	Contrato_58.pdf
59	59	Contrato_59.pdf
60	60	Contrato_60.pdf
61	61	Contrato_61.pdf
62	62	Contrato_62.pdf
63	63	Contrato_63.pdf
64	64	Contrato_64.pdf
65	65	Contrato_65.pdf
66	66	Contrato_66.pdf
67	67	Contrato_67.pdf
68	68	Contrato_68.pdf
69	69	Contrato_69.pdf
70	70	Contrato_70.pdf
101	71	Contrato_71.pdf
102	72	Contrato_72.pdf
103	73	Contrato_73.pdf
104	74	Contrato_74.pdf
105	75	Contrato_75.pdf
106	76	Contrato_76.pdf
107	77	Contrato_77.pdf
108	78	Contrato_78.pdf
109	79	Contrato_79.pdf
110	81	Contrato_81.pdf
111	82	Contrato_82.pdf
112	83	Contrato_83.pdf
113	84	Contrato_84.pdf
114	85	Contrato_85.pdf
115	86	Contrato_86.pdf
116	87	Contrato_87.pdf
117	88	Contrato_88.pdf
118	89	Contrato_89.pdf
119	90	Contrato_90.pdf
120	91	Contrato_91.pdf
121	92	Contrato_92.pdf
122	93	Contrato_93.pdf
123	94	Contrato_94.pdf
124	95	Contrato_95.pdf
125	96	Contrato_96.pdf
126	97	Contrato_97.pdf
127	98	Contrato_98.pdf
128	99	Contrato_99.pdf
129	100	Contrato_100.pdf
\.


--
-- TOC entry 3622 (class 0 OID 16442)
-- Dependencies: 220
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (id, property_id, start_date, end_date, client_id) FROM stdin;
1	1	2022-01-10	2023-01-09	1
2	2	2022-02-15	2023-02-14	2
3	3	2022-03-01	2023-02-28	3
4	4	2022-04-05	2023-04-04	4
5	5	2022-05-12	2023-05-11	5
6	6	2022-06-20	2023-06-19	6
7	7	2022-07-01	2023-06-30	7
8	8	2022-08-18	2023-08-17	8
9	9	2022-09-10	2023-09-09	9
10	10	2022-10-01	2023-09-30	10
11	11	2022-11-15	2023-11-14	11
12	12	2022-12-01	2023-11-30	12
13	13	2023-01-10	2024-01-09	13
14	14	2023-02-05	2024-02-04	14
15	15	2023-03-12	2024-03-11	15
16	16	2023-04-01	2024-03-31	16
17	17	2023-05-09	2024-05-08	17
18	18	2023-06-20	2024-06-19	18
19	19	2023-07-01	2024-06-30	19
20	20	2023-08-14	2024-08-13	20
21	21	2023-09-01	2024-08-31	21
22	22	2023-10-10	2024-10-09	22
23	23	2023-11-05	2024-11-04	23
24	24	2023-12-01	2024-11-30	24
25	25	2024-01-10	2025-01-09	25
26	26	2024-02-15	2025-02-14	26
27	27	2024-03-01	2025-02-28	27
28	28	2024-04-12	2025-04-11	28
29	29	2024-05-20	2025-05-19	29
30	30	2024-06-01	2025-05-31	30
31	31	2024-07-05	2025-07-04	31
32	32	2024-08-12	2025-08-11	32
33	33	2024-09-01	2025-08-31	33
34	34	2024-10-15	2025-10-14	34
35	35	2024-11-01	2025-10-31	35
36	36	2024-12-10	2025-12-09	36
37	37	2022-01-15	2023-01-14	37
38	38	2022-02-20	2023-02-19	38
39	39	2022-03-05	2023-03-04	39
40	40	2022-04-18	2023-04-17	40
41	41	2022-05-10	2023-05-09	41
42	42	2022-06-01	2023-05-31	42
43	43	2022-07-12	2023-07-11	43
44	44	2022-08-25	2023-08-24	44
45	45	2022-09-14	2023-09-13	45
46	46	2022-10-05	2023-10-04	46
47	47	2022-11-20	2023-11-19	47
48	48	2022-12-01	2023-11-30	48
49	49	2023-01-18	2024-01-17	49
50	50	2023-02-22	2024-02-21	50
51	51	2023-03-10	2024-03-09	51
52	52	2023-04-05	2024-04-04	52
53	53	2023-05-15	2024-05-14	53
54	54	2023-06-01	2024-05-31	54
55	55	2023-07-20	2024-07-19	55
56	56	2023-08-08	2024-08-07	56
57	57	2023-09-12	2024-09-11	57
58	58	2023-10-01	2024-09-30	58
59	59	2023-11-18	2024-11-17	59
60	60	2023-12-05	2024-12-04	60
61	61	2024-01-15	2025-01-14	61
62	62	2024-02-20	2025-02-19	62
63	63	2024-03-08	2025-03-07	63
64	64	2024-04-12	2025-04-11	64
65	65	2024-05-22	2025-05-21	65
66	66	2024-06-10	2025-06-09	66
67	67	2024-07-18	2025-07-17	67
68	68	2024-08-05	2025-08-04	68
69	69	2024-09-15	2025-09-14	69
70	70	2024-10-01	2025-09-30	70
81	81	2025-01-10	2026-01-10	81
82	82	2025-01-15	2026-01-15	82
83	83	2025-01-20	2026-01-20	83
84	84	2025-02-01	2026-02-01	84
85	85	2025-02-05	2026-02-05	85
86	86	2025-02-12	2026-02-12	86
87	87	2025-02-20	2026-02-20	87
88	88	2025-03-01	2026-03-01	88
89	89	2025-03-05	2026-03-05	89
90	90	2025-03-12	2026-03-12	90
91	91	2025-03-18	2026-03-18	91
92	92	2025-04-01	2026-04-01	92
93	93	2025-04-07	2026-04-07	93
94	94	2025-04-15	2026-04-15	94
95	95	2025-04-20	2026-04-20	95
96	96	2025-05-01	2026-05-01	96
97	97	2025-05-05	2026-05-05	97
98	98	2025-05-12	2026-05-12	98
99	99	2025-05-20	2026-05-20	99
100	100	2025-06-01	2026-06-01	100
71	6	2025-02-01	2026-01-31	4
72	7	2025-03-01	2026-02-28	5
73	8	2025-04-01	2026-03-31	6
74	9	2025-05-01	2026-04-30	7
75	10	2025-06-01	2026-05-31	8
76	11	2025-07-01	2026-06-30	9
77	12	2025-08-01	2026-07-31	10
78	13	2025-09-01	2026-08-31	11
79	14	2025-10-01	2026-09-30	12
\.


--
-- TOC entry 3640 (class 0 OID 57415)
-- Dependencies: 238
-- Data for Name: contracts_audit; Type: TABLE DATA; Schema: public; Owner: samuel
--

COPY public.contracts_audit (id, contract_id, actioncontract, changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- TOC entry 3618 (class 0 OID 16416)
-- Dependencies: 216
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owners (id, first_name, last_name, email) FROM stdin;
1	Carlos	Ramírez	carlos.ramirez@example.com
2	María	Gómez	maria.gomez@example.com
3	José	Martínez	jose.martinez@example.com
4	Ana	Fernández	ana.fernandez@example.com
5	Luis	Torres	luis.torres@example.com
6	Laura	Hernández	laura.hernandez@example.com
7	Pedro	Díaz	pedro.diaz@example.com
8	Lucía	Moreno	lucia.moreno@example.com
9	Miguel	Castro	miguel.castro@example.com
10	Elena	Vargas	elena.vargas@example.com
11	Andrés	Mendoza	andres.mendoza@example.com
12	Patricia	Ruiz	patricia.ruiz@example.com
13	Jorge	Jiménez	jorge.jimenez@example.com
14	Isabel	Navarro	isabel.navarro@example.com
15	Fernando	López	fernando.lopez@example.com
16	Gabriela	Ortega	gabriela.ortega@example.com
17	Raúl	Gutiérrez	raul.gutierrez@example.com
18	Carmen	Soto	carmen.soto@example.com
19	Héctor	Vega	hector.vega@example.com
20	Rosa	Castillo	rosa.castillo@example.com
21	Ricardo	Silva	ricardo.silva@example.com
22	Paula	Ramos	paula.ramos@example.com
23	Adrián	Cruz	adrian.cruz@example.com
24	Marta	Aguilar	marta.aguilar@example.com
25	Diego	Paredes	diego.paredes@example.com
26	Claudia	Campos	claudia.campos@example.com
27	Iván	Guerrero	ivan.guerrero@example.com
28	Teresa	Flores	teresa.flores@example.com
29	Álvaro	León	alvaro.leon@example.com
30	Julia	Peña	julia.pena@example.com
31	Sergio	Romero	sergio.romero@example.com
32	Beatriz	Reyes	beatriz.reyes@example.com
33	Óscar	Campos	oscar.campos@example.com
34	Natalia	Figueroa	natalia.figueroa@example.com
35	Francisco	Ponce	francisco.ponce@example.com
36	Silvia	Ríos	silvia.rios@example.com
37	Esteban	Mora	esteban.mora@example.com
38	Lorena	Mejía	lorena.mejia@example.com
39	Julián	Cordero	julian.cordero@example.com
40	Daniela	Salazar	daniela.salazar@example.com
41	Mauricio	Ibáñez	mauricio.ibanez@example.com
42	Alejandra	Villalobos	alejandra.villalobos@example.com
43	Gonzalo	Arroyo	gonzalo.arroyo@example.com
44	Verónica	Esquivel	veronica.esquivel@example.com
45	Eduardo	Durán	eduardo.duran@example.com
46	Rafael	Cáceres	rafael.caceres@example.com
47	Susana	Correa	susana.correa@example.com
48	Felipe	Acosta	felipe.acosta@example.com
49	Monica	Pérez	monica.perez@example.com
50	Alfredo	Luna	alfredo.luna@example.com
51	Carlos	Martinez	carlos.martinez@gmail.com
52	Laura	Ramirez	laura.ramirez@hotmail.com
53	Andres	Gonzalez	andres.gonzalez@gmail.com
54	Maria	Fernandez	maria.fernandez@hotmail.com
55	Julian	Torres	julian.torres@gmail.com
56	Paola	Vargas	paola.vargas@hotmail.com
57	Felipe	Castro	felipe.castro@gmail.com
58	Natalia	Rojas	natalia.rojas@hotmail.com
59	Santiago	Cardenas	santiago.cardenas@gmail.com
60	Camila	Ortega	camila.ortega@hotmail.com
61	Miguel	Lopez	miguel.lopez@gmail.com
62	Valentina	Mendoza	valentina.mendoza@hotmail.com
63	David	Moreno	david.moreno@gmail.com
64	Diana	Salazar	diana.salazar@hotmail.com
65	Ricardo	Guerrero	ricardo.guerrero@gmail.com
66	Angela	Pena	angela.pena@hotmail.com
67	Esteban	Camacho	esteban.camacho@gmail.com
68	Carolina	Mejia	carolina.mejia@hotmail.com
69	Jorge	Rincon	jorge.rincon@gmail.com
70	Tatiana	Suarez	tatiana.suarez@hotmail.com
71	Sebastian	Peralta	sebastian.peralta@gmail.com
72	Viviana	Parra	viviana.parra@hotmail.com
73	Oscar	Reyes	oscar.reyes@gmail.com
74	Monica	Guzman	monica.guzman@hotmail.com
75	Fernando	Acosta	fernando.acosta@gmail.com
76	Patricia	Villalba	patricia.villalba@hotmail.com
77	Hernan	Beltran	hernan.beltran@gmail.com
78	Claudia	Arevalo	claudia.arevalo@hotmail.com
79	Mauricio	Figueroa	mauricio.figueroa@gmail.com
80	Lorena	Bonilla	lorena.bonilla@hotmail.com
81	Ivan	Cordoba	ivan.cordoba@gmail.com
82	Marcela	Pardo	marcela.pardo@hotmail.com
83	Hugo	Valencia	hugo.valencia@gmail.com
84	Juliana	Cruz	juliana.cruz@hotmail.com
85	Cristian	Barrios	cristian.barrios@gmail.com
86	Liliana	Ariza	liliana.ariza@hotmail.com
87	Alvaro	Carrillo	alvaro.carrillo@gmail.com
88	Daniela	Hoyos	daniela.hoyos@hotmail.com
89	Ramiro	Montoya	ramiro.montoya@gmail.com
90	Catalina	Fonseca	catalina.fonseca@hotmail.com
91	Jhon	Perez	jhon.perez@gmail.com
92	Melissa	Ruiz	melissa.ruiz@hotmail.com
93	Edgar	Silva	edgar.silva@gmail.com
94	Rosa	Bermudez	rosa.bermudez@hotmail.com
95	Orlando	Forero	orlando.forero@gmail.com
96	Martha	Gaitan	martha.gaitan@hotmail.com
97	Alex	Serrano	alex.serrano@gmail.com
98	Veronica	Nieto	veronica.nieto@hotmail.com
99	German	Ibanez	german.ibanez@gmail.com
100	Clara	Maldonado	clara.maldonado@hotmail.com
\.


--
-- TOC entry 3636 (class 0 OID 57367)
-- Dependencies: 234
-- Data for Name: owners_audit; Type: TABLE DATA; Schema: public; Owner: samuel
--

COPY public.owners_audit (id, owner_id, actionowner, changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- TOC entry 3626 (class 0 OID 16471)
-- Dependencies: 224
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, contract_id, payment_date, amount) FROM stdin;
1	1	2022-01-10	2500.00
2	1	2022-04-10	2500.00
3	2	2022-02-15	3200.00
4	2	2022-05-15	3200.00
5	3	2022-03-01	4100.00
6	3	2022-06-01	4100.00
7	4	2022-04-05	2800.00
8	4	2022-07-05	2800.00
9	5	2022-05-12	3500.00
10	5	2022-08-12	3500.00
11	6	2022-06-20	5000.00
12	6	2022-09-20	5000.00
13	7	2022-07-01	2200.00
14	7	2022-10-01	2200.00
15	8	2022-08-18	4600.00
16	8	2022-11-18	4600.00
17	9	2022-09-10	3900.00
18	9	2022-12-10	3900.00
19	10	2022-10-01	6000.00
20	10	2023-01-01	6000.00
21	11	2022-11-15	3400.00
22	11	2023-02-15	3400.00
23	12	2022-12-01	2700.00
24	12	2023-03-01	2700.00
25	13	2023-01-10	4200.00
26	13	2023-04-10	4200.00
27	14	2023-02-05	3100.00
28	14	2023-05-05	3100.00
29	15	2023-03-12	3800.00
30	15	2023-06-12	3800.00
31	16	2023-04-01	2900.00
32	16	2023-07-01	2900.00
33	17	2023-05-09	4600.00
34	17	2023-08-09	4600.00
35	18	2023-06-20	5100.00
36	18	2023-09-20	5100.00
37	19	2023-07-01	2800.00
38	19	2023-10-01	2800.00
39	20	2023-08-14	3300.00
40	20	2023-11-14	3300.00
41	21	2023-09-01	4500.00
42	21	2023-12-01	4500.00
43	22	2023-10-10	3900.00
44	22	2024-01-10	3900.00
45	23	2023-11-05	3700.00
46	23	2024-02-05	3700.00
47	24	2023-12-01	4900.00
48	24	2024-03-01	4900.00
49	25	2024-01-10	3200.00
50	25	2024-04-10	3200.00
51	26	2024-02-15	4100.00
52	26	2024-05-15	4100.00
53	27	2024-03-01	2800.00
54	27	2024-06-01	2800.00
55	28	2024-04-12	5000.00
56	28	2024-07-12	5000.00
57	29	2024-05-20	3600.00
58	29	2024-08-20	3600.00
59	30	2024-06-01	4300.00
60	30	2024-09-01	4300.00
61	31	2024-07-05	3900.00
62	31	2024-10-05	3900.00
63	32	2024-08-12	4800.00
64	32	2024-11-12	4800.00
65	33	2024-09-01	3500.00
66	33	2024-12-01	3500.00
67	34	2024-10-15	4200.00
68	34	2025-01-15	4200.00
69	35	2024-11-01	3000.00
70	35	2025-02-01	3000.00
71	36	2024-12-10	4600.00
72	36	2025-03-10	4600.00
73	37	2022-01-15	2700.00
74	37	2022-04-15	2700.00
75	38	2022-02-20	5200.00
76	38	2022-05-20	5200.00
77	39	2022-03-05	3100.00
78	39	2022-06-05	3100.00
79	40	2022-04-18	4000.00
80	40	2022-07-18	4000.00
81	21	2025-01-15	850.00
82	22	2025-01-20	1200.00
83	23	2025-02-05	970.00
84	24	2025-02-10	650.00
85	25	2025-02-18	1430.00
86	26	2025-03-01	1110.00
87	27	2025-03-05	780.00
88	28	2025-03-15	930.00
89	29	2025-03-22	1340.00
90	30	2025-04-01	1500.00
91	31	2025-04-07	890.00
92	32	2025-04-12	1220.00
93	33	2025-04-19	1040.00
94	34	2025-04-25	970.00
95	35	2025-05-02	1600.00
96	36	2025-05-10	1180.00
97	37	2025-05-15	700.00
98	38	2025-05-22	1350.00
99	39	2025-05-28	990.00
100	40	2025-06-05	1450.00
\.


--
-- TOC entry 3642 (class 0 OID 57439)
-- Dependencies: 240
-- Data for Name: payments_audit; Type: TABLE DATA; Schema: public; Owner: samuel
--

COPY public.payments_audit (id, payment_id, actionpayment, changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- TOC entry 3620 (class 0 OID 16425)
-- Dependencies: 218
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.properties (id, address, price, property_type_id, owner_id) FROM stdin;
1	Calle 10 #5-20, Bogotá	250000000.00	1	1
2	Carrera 15 #45-30, Medellín	180000000.00	2	2
3	Av. Siempre Viva #123, Cali	320000000.00	3	3
4	Calle 8 #12-40, Barranquilla	210000000.00	4	4
5	Carrera 25 #34-15, Cartagena	400000000.00	5	5
6	Calle 30 #20-50, Bucaramanga	150000000.00	6	6
7	Carrera 50 #80-90, Bogotá	270000000.00	1	7
8	Calle 60 #10-25, Medellín	350000000.00	2	8
9	Calle 25 #15-33, Cali	220000000.00	3	9
10	Carrera 12 #45-67, Barranquilla	500000000.00	4	10
11	Calle 18 #8-22, Cartagena	175000000.00	5	11
12	Carrera 40 #25-60, Bucaramanga	280000000.00	6	12
13	Calle 100 #20-10, Bogotá	330000000.00	1	13
14	Carrera 7 #50-75, Medellín	195000000.00	2	14
15	Calle 9 #14-28, Cali	265000000.00	3	15
16	Carrera 19 #33-44, Barranquilla	410000000.00	4	16
17	Calle 15 #22-50, Cartagena	210000000.00	5	17
18	Carrera 30 #60-70, Bucaramanga	145000000.00	6	18
19	Calle 55 #100-200, Bogotá	375000000.00	1	19
20	Carrera 80 #60-10, Medellín	290000000.00	2	20
21	Calle 12 #90-33, Cali	200000000.00	3	21
22	Carrera 3 #15-70, Barranquilla	450000000.00	4	22
23	Calle 77 #23-15, Cartagena	320000000.00	5	23
24	Carrera 45 #66-80, Bucaramanga	160000000.00	6	24
25	Calle 33 #70-21, Bogotá	280000000.00	1	25
26	Carrera 11 #55-18, Medellín	190000000.00	2	26
27	Calle 88 #30-44, Cali	310000000.00	3	27
28	Carrera 66 #12-25, Barranquilla	240000000.00	4	28
29	Calle 45 #5-80, Cartagena	420000000.00	5	29
30	Carrera 20 #18-77, Bucaramanga	170000000.00	6	30
31	Calle 40 #22-15, Bogotá	260000000.00	1	31
32	Carrera 75 #33-19, Medellín	310000000.00	2	32
33	Calle 50 #80-45, Cali	230000000.00	3	33
34	Carrera 27 #18-30, Barranquilla	480000000.00	4	34
35	Calle 90 #14-70, Cartagena	350000000.00	5	35
36	Carrera 12 #33-22, Bucaramanga	155000000.00	6	36
37	Calle 13 #70-33, Bogotá	270000000.00	1	37
38	Carrera 18 #22-11, Medellín	210000000.00	2	38
39	Calle 34 #55-80, Cali	290000000.00	3	39
40	Carrera 8 #10-15, Barranquilla	390000000.00	4	40
41	Calle 60 #7-90, Cartagena	205000000.00	5	41
42	Carrera 100 #25-66, Bucaramanga	175000000.00	6	42
43	Calle 77 #44-55, Bogotá	330000000.00	1	43
44	Carrera 55 #88-99, Medellín	300000000.00	2	44
45	Calle 12 #45-20, Cali	215000000.00	3	45
46	Carrera 11 #66-77, Barranquilla	460000000.00	4	46
47	Calle 88 #23-40, Cartagena	370000000.00	5	47
48	Carrera 66 #20-33, Bucaramanga	165000000.00	6	48
49	Calle 44 #77-21, Bogotá	295000000.00	1	49
50	Carrera 19 #10-80, Medellín	220000000.00	2	50
51	Calle 90 #55-30, Cali	280000000.00	3	1
52	Carrera 3 #33-11, Barranquilla	405000000.00	4	2
53	Calle 25 #60-44, Cartagena	315000000.00	5	3
54	Carrera 22 #77-50, Bucaramanga	150000000.00	6	4
55	Calle 10 #44-88, Bogotá	270000000.00	1	5
56	Carrera 33 #12-66, Medellín	195000000.00	2	6
57	Calle 88 #66-22, Cali	320000000.00	3	7
58	Carrera 55 #44-30, Barranquilla	255000000.00	4	8
59	Calle 22 #20-40, Cartagena	410000000.00	5	9
60	Carrera 60 #90-33, Bucaramanga	185000000.00	6	10
61	Calle 12 #50-22, Bogotá	290000000.00	1	11
62	Carrera 80 #30-15, Medellín	310000000.00	2	12
63	Calle 33 #14-55, Cali	235000000.00	3	13
64	Carrera 27 #18-40, Barranquilla	470000000.00	4	14
65	Calle 70 #45-99, Cartagena	360000000.00	5	15
66	Carrera 100 #20-18, Bucaramanga	160000000.00	6	16
67	Calle 50 #33-40, Bogotá	280000000.00	1	17
68	Carrera 18 #22-55, Medellín	205000000.00	2	18
69	Calle 12 #66-10, Cali	270000000.00	3	19
70	Carrera 77 #33-22, Barranquilla	395000000.00	4	20
71	Calle 88 #12-45, Cartagena	345000000.00	5	21
72	Carrera 55 #14-77, Bucaramanga	155000000.00	6	22
73	Calle 15 #60-30, Bogotá	265000000.00	1	23
74	Carrera 20 #11-25, Medellín	215000000.00	2	24
75	Calle 70 #45-80, Cali	310000000.00	3	25
76	Carrera 12 #33-66, Barranquilla	420000000.00	4	26
77	Calle 90 #55-22, Cartagena	350000000.00	5	27
78	Carrera 30 #60-40, Bucaramanga	170000000.00	6	28
79	Calle 45 #80-12, Bogotá	285000000.00	1	29
80	Carrera 22 #70-18, Medellín	295000000.00	2	30
81	Calle 81 #45-20, Ciudad 9	250000.00	1	5
82	Carrera 52 #12-34, Ciudad 7	180000.00	2	3
83	Avenida Libertad 100, Ciudad 5	320000.00	3	8
84	Calle 15 #23-90, Ciudad 2	145000.00	1	4
85	Calle 9 #60-12, Ciudad 6	275000.00	2	6
86	Carrera 8 #33-45, Ciudad 10	310000.00	3	2
87	Avenida Central 77, Ciudad 4	400000.00	1	7
88	Calle 22 #14-56, Ciudad 1	120000.00	2	9
89	Carrera 90 #40-11, Ciudad 8	210000.00	3	1
90	Calle 70 #50-99, Ciudad 3	290000.00	1	10
91	Calle 101 #15-43, Ciudad 2	305000.00	2	5
92	Carrera 77 #44-88, Ciudad 7	260000.00	1	3
93	Avenida Sur 15, Ciudad 6	330000.00	3	4
94	Calle 60 #33-21, Ciudad 5	175000.00	2	6
95	Carrera 12 #10-14, Ciudad 8	295000.00	1	2
96	Calle 44 #12-32, Ciudad 9	215000.00	3	7
97	Carrera 30 #18-55, Ciudad 4	185000.00	1	9
98	Avenida Norte 120, Ciudad 10	340000.00	2	1
99	Calle 11 #25-67, Ciudad 3	270000.00	1	8
100	Carrera 55 #14-23, Ciudad 2	360000.00	3	5
\.


--
-- TOC entry 3638 (class 0 OID 57391)
-- Dependencies: 236
-- Data for Name: properties_audit; Type: TABLE DATA; Schema: public; Owner: samuel
--

COPY public.properties_audit (id, property_id, actionproperty, changed_at, changed_by, before_data, after_data) FROM stdin;
\.


--
-- TOC entry 3630 (class 0 OID 16490)
-- Dependencies: 228
-- Data for Name: property_amenities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_amenities (id, property_id, amenity_id) FROM stdin;
101	1	1
102	2	2
103	3	3
104	4	4
105	5	5
106	6	6
107	7	7
108	8	8
109	9	9
110	10	10
111	11	11
112	12	12
113	13	13
114	14	14
115	15	15
116	16	16
117	17	17
118	18	18
119	19	19
120	20	20
121	21	21
122	22	22
123	23	23
124	24	24
125	25	25
126	26	26
127	27	27
128	28	28
129	29	29
130	30	30
131	31	31
132	32	32
133	33	33
134	34	34
135	35	35
136	36	36
137	37	37
138	38	38
139	39	39
140	40	40
141	41	41
142	42	42
143	43	43
144	44	44
145	45	45
146	46	46
147	47	47
148	48	48
149	49	49
150	50	50
151	51	51
152	52	52
153	53	53
154	54	54
155	55	55
156	56	56
157	57	57
158	58	58
159	59	59
160	60	60
161	61	61
162	62	62
163	63	63
164	64	64
165	65	65
166	66	66
167	67	67
168	68	68
169	69	69
170	70	70
171	71	71
172	72	72
173	73	73
174	74	74
175	75	75
176	76	76
177	77	77
178	78	78
179	79	79
180	80	80
181	81	81
182	82	82
183	83	83
184	84	84
185	85	85
186	86	86
187	87	87
188	88	88
189	89	89
190	90	90
191	91	91
192	92	92
193	93	93
194	94	94
195	95	95
196	96	96
197	97	97
198	98	98
199	99	99
200	100	100
\.


--
-- TOC entry 3616 (class 0 OID 16409)
-- Dependencies: 214
-- Data for Name: property_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.property_types (id, description) FROM stdin;
1	Casa
2	Apartamento
3	Oficina
4	Local
5	Finca
6	Bodega
7	Apartamento
8	Casa
9	Villa
10	Cabaña
11	Finca
12	Estudio
13	Dúplex
14	Penthouse
15	Loft
16	Oficina
17	Local comercial
18	Bodega
19	Garaje
20	Parqueadero
21	Consultorio
22	Clínica
23	Hospital
24	Hotel
25	Hostal
26	Motel
27	Cabaña ecológica
28	Casa campestre
29	Apartamento dúplex
30	Apartamento tipo estudio
31	Apartamento amoblado
32	Apartamento en sótano
33	Apartamento en ático
34	Apartamento con balcón
35	Apartamento con terraza
36	Apartamento inteligente
37	Terreno urbano
38	Terreno rural
39	Lote industrial
40	Lote residencial
41	Parcela agrícola
42	Parcela ganadera
43	Hacienda
44	Quinta
45	Casa de playa
46	Casa de montaña
47	Casa adosada
48	Casa bifamiliar
49	Casa trifamiliar
50	Casa unifamiliar
51	Casa colonial
52	Casa moderna
53	Casa prefabricada
54	Casa móvil
55	Casa flotante
56	Casa ecológica
57	Edificio
58	Edificio comercial
59	Edificio residencial
60	Edificio mixto
61	Edificio corporativo
62	Edificio industrial
63	Centro comercial
64	Centro empresarial
65	Rascacielos
66	Torre residencial
67	Depósito
68	Almacén
69	Hangar
70	Establo
71	Granero
72	Invernadero
73	Chalet
74	Caserío
75	Casa rural
76	Casa patrimonial
77	Penthouse dúplex
78	Penthouse tríplex
79	Suite
80	Suite presidencial
81	Suite junior
82	Suite ejecutiva
83	Estudio amoblado
84	Estudio minimalista
85	Loft industrial
86	Loft moderno
87	Apartamento turístico
88	Apartamento vacacional
89	Apartamento corporativo
90	Apartamento compartido
91	Habitación en arriendo
92	Habitación amoblada
93	Habitación compartida
94	Habitación de hotel
95	Residencia estudiantil
96	Residencia universitaria
97	Casa inteligente
98	Casa sostenible
99	Casa de lujo
100	Casa minimalista
101	Casa tipo chalet
102	Casa modular
103	Casa de campo
104	Casa tradicional
105	Casa señorial
106	Casa antigua
\.


--
-- TOC entry 3632 (class 0 OID 16507)
-- Dependencies: 230
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visits (id, property_id, visit_date, client_id) FROM stdin;
1	1	2022-01-15	3
2	2	2022-01-18	7
3	3	2022-01-20	12
4	4	2022-01-25	8
5	5	2022-02-01	15
6	6	2022-02-05	20
7	7	2022-02-10	9
8	8	2022-02-12	14
9	9	2022-02-15	5
10	10	2022-02-20	18
11	11	2022-02-25	21
12	12	2022-03-01	2
13	13	2022-03-05	25
14	14	2022-03-08	30
15	15	2022-03-12	11
16	16	2022-03-15	6
17	17	2022-03-18	19
18	18	2022-03-20	28
19	19	2022-03-25	10
20	20	2022-04-01	4
21	21	2022-04-05	16
22	22	2022-04-10	23
23	23	2022-04-12	27
24	24	2022-04-15	13
25	25	2022-04-20	33
26	26	2022-04-25	17
27	27	2022-04-28	22
28	28	2022-05-01	31
29	29	2022-05-05	26
30	30	2022-05-10	29
31	31	2022-05-15	34
32	32	2022-05-20	9
33	33	2022-05-25	15
34	34	2022-06-01	20
35	35	2022-06-05	7
36	36	2022-06-10	18
37	37	2022-06-15	25
38	38	2022-06-20	30
39	39	2022-06-25	11
40	40	2022-07-01	4
41	41	2022-07-05	13
42	42	2022-07-10	29
43	43	2022-07-15	8
44	44	2022-07-20	22
45	45	2022-07-25	17
46	46	2022-08-01	6
47	47	2022-08-05	21
48	48	2022-08-10	35
49	49	2022-08-15	14
50	50	2022-08-20	32
51	1	2022-09-01	28
52	2	2022-09-05	19
53	3	2022-09-10	27
54	4	2022-09-15	12
55	5	2022-09-20	16
56	6	2022-09-25	24
57	7	2022-10-01	31
58	8	2022-10-05	5
59	9	2022-10-10	23
60	10	2022-10-15	2
61	11	2022-10-20	18
62	12	2022-10-25	26
63	13	2022-11-01	7
64	14	2022-11-05	10
65	15	2022-11-10	20
66	16	2022-11-15	33
67	17	2022-11-20	6
68	18	2022-11-25	15
69	19	2022-12-01	9
70	20	2022-12-05	22
71	21	2022-12-10	3
72	22	2022-12-15	27
73	23	2022-12-20	13
74	24	2022-12-25	19
75	25	2023-01-05	25
76	26	2023-01-10	14
77	27	2023-01-15	32
78	28	2023-01-20	17
79	29	2023-01-25	8
80	30	2023-02-01	12
81	31	2023-02-05	21
82	32	2023-02-10	34
83	33	2023-02-15	5
84	34	2023-02-20	20
85	35	2023-02-25	30
86	36	2023-03-01	11
87	37	2023-03-05	28
88	38	2023-03-10	15
89	39	2023-03-15	7
90	40	2023-03-20	22
91	41	2023-03-25	10
92	42	2023-04-01	35
93	43	2023-04-05	19
94	44	2023-04-10	16
95	45	2023-04-15	2
96	46	2023-04-20	23
97	47	2023-04-25	18
98	48	2023-05-01	27
99	49	2023-05-05	29
100	50	2023-05-10	6
\.


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 225
-- Name: amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amenities_id_seq', 100, true);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 211
-- Name: client_evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_evaluations_id_seq', 30, true);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 231
-- Name: clients_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuel
--

SELECT pg_catalog.setval('public.clients_audit_id_seq', 1, false);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 209
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 70, true);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 221
-- Name: contract_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contract_documents_id_seq', 129, true);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 237
-- Name: contracts_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuel
--

SELECT pg_catalog.setval('public.contracts_audit_id_seq', 1, false);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 219
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contracts_id_seq', 70, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 233
-- Name: owners_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuel
--

SELECT pg_catalog.setval('public.owners_audit_id_seq', 1, false);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 215
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_id_seq', 100, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 239
-- Name: payments_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuel
--

SELECT pg_catalog.setval('public.payments_audit_id_seq', 1, false);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 223
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 80, true);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 235
-- Name: properties_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: samuel
--

SELECT pg_catalog.setval('public.properties_audit_id_seq', 1, false);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 217
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.properties_id_seq', 80, true);


--
-- TOC entry 3677 (class 0 OID 0)
-- Dependencies: 227
-- Name: property_amenities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_amenities_id_seq', 200, true);


--
-- TOC entry 3678 (class 0 OID 0)
-- Dependencies: 213
-- Name: property_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.property_types_id_seq', 106, true);


--
-- TOC entry 3679 (class 0 OID 0)
-- Dependencies: 229
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.visits_id_seq', 100, true);


--
-- TOC entry 3416 (class 2606 OID 16488)
-- Name: amenities amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amenities
    ADD CONSTRAINT amenities_pkey PRIMARY KEY (id);


--
-- TOC entry 3400 (class 2606 OID 16402)
-- Name: client_evaluations client_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_evaluations
    ADD CONSTRAINT client_evaluations_pkey PRIMARY KEY (id);


--
-- TOC entry 3422 (class 2606 OID 57355)
-- Name: clients_audit clients_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.clients_audit
    ADD CONSTRAINT clients_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 16395)
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- TOC entry 3398 (class 2606 OID 16393)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 16464)
-- Name: contract_documents contract_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_documents
    ADD CONSTRAINT contract_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 57425)
-- Name: contracts_audit contracts_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.contracts_audit
    ADD CONSTRAINT contracts_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 16447)
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 57377)
-- Name: owners_audit owners_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.owners_audit
    ADD CONSTRAINT owners_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3404 (class 2606 OID 16423)
-- Name: owners owners_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_email_key UNIQUE (email);


--
-- TOC entry 3406 (class 2606 OID 16421)
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- TOC entry 3430 (class 2606 OID 57449)
-- Name: payments_audit payments_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.payments_audit
    ADD CONSTRAINT payments_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 16476)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3426 (class 2606 OID 57401)
-- Name: properties_audit properties_audit_pkey; Type: CONSTRAINT; Schema: public; Owner: samuel
--

ALTER TABLE ONLY public.properties_audit
    ADD CONSTRAINT properties_audit_pkey PRIMARY KEY (id);


--
-- TOC entry 3408 (class 2606 OID 16430)
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- TOC entry 3418 (class 2606 OID 16495)
-- Name: property_amenities property_amenities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_pkey PRIMARY KEY (id);


--
-- TOC entry 3402 (class 2606 OID 16414)
-- Name: property_types property_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_types
    ADD CONSTRAINT property_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 16512)
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- TOC entry 3442 (class 2620 OID 57361)
-- Name: clients ad_clients_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ad_clients_audit AFTER DELETE ON public.clients FOR EACH ROW EXECUTE FUNCTION public.fn_ad_clients_audit();


--
-- TOC entry 3451 (class 2620 OID 57431)
-- Name: contracts ad_contracts_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ad_contracts_audit AFTER DELETE ON public.contracts FOR EACH ROW EXECUTE FUNCTION public.fn_ad_contracts_audit();


--
-- TOC entry 3445 (class 2620 OID 57383)
-- Name: owners ad_owners_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ad_owners_audit AFTER DELETE ON public.owners FOR EACH ROW EXECUTE FUNCTION public.fn_ad_owners_audit();


--
-- TOC entry 3454 (class 2620 OID 57455)
-- Name: payments ad_payments_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ad_payments_audit AFTER DELETE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.fn_ad_payments_audit();


--
-- TOC entry 3448 (class 2620 OID 57407)
-- Name: properties ad_properties_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ad_properties_audit AFTER DELETE ON public.properties FOR EACH ROW EXECUTE FUNCTION public.fn_ad_properties_audit();


--
-- TOC entry 3444 (class 2620 OID 57357)
-- Name: clients ai_clients_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ai_clients_audit AFTER INSERT ON public.clients FOR EACH ROW EXECUTE FUNCTION public.fn_ai_clients_audit();


--
-- TOC entry 3453 (class 2620 OID 57427)
-- Name: contracts ai_contracts_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ai_contracts_audit AFTER INSERT ON public.contracts FOR EACH ROW EXECUTE FUNCTION public.fn_ai_contracts_audit();


--
-- TOC entry 3447 (class 2620 OID 57379)
-- Name: owners ai_owners_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ai_owners_audit AFTER INSERT ON public.owners FOR EACH ROW EXECUTE FUNCTION public.fn_ai_owners_audit();


--
-- TOC entry 3456 (class 2620 OID 57451)
-- Name: payments ai_payments_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ai_payments_audit AFTER INSERT ON public.payments FOR EACH ROW EXECUTE FUNCTION public.fn_ai_payments_audit();


--
-- TOC entry 3450 (class 2620 OID 57403)
-- Name: properties ai_properties_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ai_properties_audit AFTER INSERT ON public.properties FOR EACH ROW EXECUTE FUNCTION public.fn_ai_properties_audit();


--
-- TOC entry 3443 (class 2620 OID 57359)
-- Name: clients au_clients_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER au_clients_audit AFTER UPDATE ON public.clients FOR EACH ROW EXECUTE FUNCTION public.fn_au_clients_audit();


--
-- TOC entry 3452 (class 2620 OID 57429)
-- Name: contracts au_contracts_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER au_contracts_audit AFTER UPDATE ON public.contracts FOR EACH ROW EXECUTE FUNCTION public.fn_au_contracts_audit();


--
-- TOC entry 3446 (class 2620 OID 57381)
-- Name: owners au_owners_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER au_owners_audit AFTER UPDATE ON public.owners FOR EACH ROW EXECUTE FUNCTION public.fn_au_owners_audit();


--
-- TOC entry 3455 (class 2620 OID 57453)
-- Name: payments au_payments_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER au_payments_audit AFTER UPDATE ON public.payments FOR EACH ROW EXECUTE FUNCTION public.fn_au_payments_audit();


--
-- TOC entry 3449 (class 2620 OID 57405)
-- Name: properties au_properties_audit; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER au_properties_audit AFTER UPDATE ON public.properties FOR EACH ROW EXECUTE FUNCTION public.fn_au_properties_audit();


--
-- TOC entry 3458 (class 2620 OID 57365)
-- Name: clients_audit bid_clients_audit_block_delete; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bid_clients_audit_block_delete BEFORE DELETE ON public.clients_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_delete_clients_audit();


--
-- TOC entry 3467 (class 2620 OID 57435)
-- Name: contracts_audit bid_contracts_audit_block_delete; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bid_contracts_audit_block_delete BEFORE DELETE ON public.contracts_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_delete_contracts_audit();


--
-- TOC entry 3461 (class 2620 OID 57387)
-- Name: owners_audit bid_owners_audit_block_delete; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bid_owners_audit_block_delete BEFORE DELETE ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_delete_owners_audit();


--
-- TOC entry 3470 (class 2620 OID 57459)
-- Name: payments_audit bid_payments_audit_block_delete; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bid_payments_audit_block_delete BEFORE DELETE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_delete_payments_audit();


--
-- TOC entry 3464 (class 2620 OID 57411)
-- Name: properties_audit bid_properties_audit_block_delete; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bid_properties_audit_block_delete BEFORE DELETE ON public.properties_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_delete_properties_audit();


--
-- TOC entry 3457 (class 2620 OID 57463)
-- Name: clients_audit bii_clients_audit_guard_insert; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bii_clients_audit_guard_insert BEFORE INSERT ON public.clients_audit FOR EACH ROW EXECUTE FUNCTION public.fn_guard_insert_clients_audit();


--
-- TOC entry 3466 (class 2620 OID 57437)
-- Name: contracts_audit bii_contracts_audit_guard_insert; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bii_contracts_audit_guard_insert BEFORE INSERT ON public.contracts_audit FOR EACH ROW EXECUTE FUNCTION public.fn_guard_insert_contracts_audit();


--
-- TOC entry 3460 (class 2620 OID 57389)
-- Name: owners_audit bii_owners_audit_guard_insert; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bii_owners_audit_guard_insert BEFORE INSERT ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.fn_guard_insert_owners_audit();


--
-- TOC entry 3469 (class 2620 OID 57461)
-- Name: payments_audit bii_payments_audit_guard_insert; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bii_payments_audit_guard_insert BEFORE INSERT ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.fn_guard_insert_payments_audit();


--
-- TOC entry 3463 (class 2620 OID 57413)
-- Name: properties_audit bii_properties_audit_guard_insert; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER bii_properties_audit_guard_insert BEFORE INSERT ON public.properties_audit FOR EACH ROW EXECUTE FUNCTION public.fn_guard_insert_properties_audit();


--
-- TOC entry 3459 (class 2620 OID 57363)
-- Name: clients_audit biu_clients_audit_block_update; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER biu_clients_audit_block_update BEFORE UPDATE ON public.clients_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_update_clients_audit();


--
-- TOC entry 3468 (class 2620 OID 57433)
-- Name: contracts_audit biu_contracts_audit_block_update; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER biu_contracts_audit_block_update BEFORE UPDATE ON public.contracts_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_update_contracts_audit();


--
-- TOC entry 3462 (class 2620 OID 57385)
-- Name: owners_audit biu_owners_audit_block_update; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER biu_owners_audit_block_update BEFORE UPDATE ON public.owners_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_update_owners_audit();


--
-- TOC entry 3471 (class 2620 OID 57457)
-- Name: payments_audit biu_payments_audit_block_update; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER biu_payments_audit_block_update BEFORE UPDATE ON public.payments_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_update_payments_audit();


--
-- TOC entry 3465 (class 2620 OID 57409)
-- Name: properties_audit biu_properties_audit_block_update; Type: TRIGGER; Schema: public; Owner: samuel
--

CREATE TRIGGER biu_properties_audit_block_update BEFORE UPDATE ON public.properties_audit FOR EACH ROW EXECUTE FUNCTION public.fn_block_update_properties_audit();


--
-- TOC entry 3431 (class 2606 OID 16403)
-- Name: client_evaluations client_evaluations_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_evaluations
    ADD CONSTRAINT client_evaluations_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3436 (class 2606 OID 16465)
-- Name: contract_documents contract_documents_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contract_documents
    ADD CONSTRAINT contract_documents_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- TOC entry 3434 (class 2606 OID 16453)
-- Name: contracts contracts_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3435 (class 2606 OID 16448)
-- Name: contracts contracts_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- TOC entry 3437 (class 2606 OID 16477)
-- Name: payments payments_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id);


--
-- TOC entry 3432 (class 2606 OID 16436)
-- Name: properties properties_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(id);


--
-- TOC entry 3433 (class 2606 OID 16431)
-- Name: properties properties_property_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_property_type_id_fkey FOREIGN KEY (property_type_id) REFERENCES public.property_types(id);


--
-- TOC entry 3438 (class 2606 OID 16501)
-- Name: property_amenities property_amenities_amenity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_amenity_id_fkey FOREIGN KEY (amenity_id) REFERENCES public.amenities(id);


--
-- TOC entry 3439 (class 2606 OID 16496)
-- Name: property_amenities property_amenities_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.property_amenities
    ADD CONSTRAINT property_amenities_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- TOC entry 3440 (class 2606 OID 16518)
-- Name: visits visits_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- TOC entry 3441 (class 2606 OID 16513)
-- Name: visits visits_property_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.properties(id);


-- Completed on 2025-10-15 23:44:08 UTC

--
-- PostgreSQL database dump complete
--

\unrestrict h0jNffPW9OaCsHzwL2BacmjpYijCXpzYg1T3Z9Ufhzn6Z8ciTDtC9eI0hP8SErs

