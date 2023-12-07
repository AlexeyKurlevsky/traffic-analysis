--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Debian 13.13-1.pgdg120+1)
-- Dumped by pg_dump version 13.12

-- Started on 2023-12-07 22:18:37 UTC

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

DROP DATABASE IF EXISTS superset;
--
-- TOC entry 3808 (class 1262 OID 16392)
-- Name: superset; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE superset WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE superset OWNER TO postgres;

\connect superset

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
-- TOC entry 724 (class 1247 OID 16394)
-- Name: emaildeliverytype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.emaildeliverytype AS ENUM (
    'attachment',
    'inline'
);


ALTER TYPE public.emaildeliverytype OWNER TO postgres;

--
-- TOC entry 727 (class 1247 OID 16400)
-- Name: sliceemailreportformat; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.sliceemailreportformat AS ENUM (
    'visualization',
    'data'
);


ALTER TYPE public.sliceemailreportformat OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16405)
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16408)
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16410)
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16413)
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16415)
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16418)
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16420)
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    email character varying(64) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16426)
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_register_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16428)
-- Name: ab_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16431)
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16433)
-- Name: ab_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(64) NOT NULL,
    last_name character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(320) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16439)
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16441)
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16444)
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16446)
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16449)
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16451)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16454)
-- Name: annotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    layer_id integer,
    short_descr character varying(500),
    long_descr text,
    changed_by_fk integer,
    created_by_fk integer,
    json_metadata text
);


ALTER TABLE public.annotation OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16460)
-- Name: annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_id_seq OWNER TO postgres;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 218
-- Name: annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_id_seq OWNED BY public.annotation.id;


--
-- TOC entry 219 (class 1259 OID 16462)
-- Name: annotation_layer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_layer (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    descr text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.annotation_layer OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16468)
-- Name: annotation_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_layer_id_seq OWNER TO postgres;

--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 220
-- Name: annotation_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_layer_id_seq OWNED BY public.annotation_layer.id;


--
-- TOC entry 221 (class 1259 OID 16470)
-- Name: cache_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_keys (
    id integer NOT NULL,
    cache_key character varying(256) NOT NULL,
    cache_timeout integer,
    datasource_uid character varying(64) NOT NULL,
    created_on timestamp without time zone
);


ALTER TABLE public.cache_keys OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16473)
-- Name: cache_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cache_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cache_keys_id_seq OWNER TO postgres;

--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 222
-- Name: cache_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cache_keys_id_seq OWNED BY public.cache_keys.id;


--
-- TOC entry 223 (class 1259 OID 16475)
-- Name: css_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.css_templates (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    template_name character varying(250),
    css text,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.css_templates OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16481)
-- Name: css_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.css_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.css_templates_id_seq OWNER TO postgres;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 224
-- Name: css_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.css_templates_id_seq OWNED BY public.css_templates.id;


--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: dashboard_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    dashboard_id integer
);


ALTER TABLE public.dashboard_roles OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16486)
-- Name: dashboard_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 226
-- Name: dashboard_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_roles_id_seq OWNED BY public.dashboard_roles.id;


--
-- TOC entry 227 (class 1259 OID 16488)
-- Name: dashboard_slices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_slices (
    id integer NOT NULL,
    dashboard_id integer,
    slice_id integer
);


ALTER TABLE public.dashboard_slices OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16491)
-- Name: dashboard_slices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_slices_id_seq OWNER TO postgres;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 228
-- Name: dashboard_slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_slices_id_seq OWNED BY public.dashboard_slices.id;


--
-- TOC entry 229 (class 1259 OID 16493)
-- Name: dashboard_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_user (
    id integer NOT NULL,
    user_id integer,
    dashboard_id integer
);


ALTER TABLE public.dashboard_user OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16496)
-- Name: dashboard_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_user_id_seq OWNER TO postgres;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 230
-- Name: dashboard_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_user_id_seq OWNED BY public.dashboard_user.id;


--
-- TOC entry 231 (class 1259 OID 16498)
-- Name: dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    dashboard_title character varying(500),
    position_json text,
    created_by_fk integer,
    changed_by_fk integer,
    css text,
    description text,
    slug character varying(255),
    json_metadata text,
    published boolean,
    uuid uuid,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dashboards OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16505)
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboards_id_seq OWNER TO postgres;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 232
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboards_id_seq OWNED BY public.dashboards.id;


--
-- TOC entry 233 (class 1259 OID 16507)
-- Name: dbs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dbs (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_name character varying(250) NOT NULL,
    sqlalchemy_uri character varying(1024) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    password bytea,
    cache_timeout integer,
    extra text,
    select_as_create_table_as boolean,
    allow_ctas boolean,
    expose_in_sqllab boolean,
    force_ctas_schema character varying(250),
    allow_run_async boolean,
    allow_dml boolean,
    verbose_name character varying(250),
    impersonate_user boolean,
    allow_file_upload boolean DEFAULT true NOT NULL,
    encrypted_extra bytea,
    server_cert bytea,
    allow_cvas boolean,
    uuid uuid,
    configuration_method character varying(255) DEFAULT 'sqlalchemy_form'::character varying,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text
);


ALTER TABLE public.dbs OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16516)
-- Name: dbs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dbs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dbs_id_seq OWNER TO postgres;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 234
-- Name: dbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dbs_id_seq OWNED BY public.dbs.id;


--
-- TOC entry 235 (class 1259 OID 16518)
-- Name: dynamic_plugin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dynamic_plugin (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    key character varying(50) NOT NULL,
    bundle_url character varying(1000) NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.dynamic_plugin OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16524)
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dynamic_plugin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynamic_plugin_id_seq OWNER TO postgres;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 236
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dynamic_plugin_id_seq OWNED BY public.dynamic_plugin.id;


--
-- TOC entry 237 (class 1259 OID 16526)
-- Name: embedded_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.embedded_dashboards (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    allow_domain_list text,
    uuid uuid,
    dashboard_id integer NOT NULL,
    changed_by_fk integer,
    created_by_fk integer
);


ALTER TABLE public.embedded_dashboards OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16532)
-- Name: favstar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favstar (
    id integer NOT NULL,
    user_id integer,
    class_name character varying(50),
    obj_id integer,
    dttm timestamp without time zone
);


ALTER TABLE public.favstar OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16535)
-- Name: favstar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favstar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favstar_id_seq OWNER TO postgres;

--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 239
-- Name: favstar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favstar_id_seq OWNED BY public.favstar.id;


--
-- TOC entry 240 (class 1259 OID 16537)
-- Name: filter_sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter_sets (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(500) NOT NULL,
    description text,
    json_metadata text NOT NULL,
    owner_id integer NOT NULL,
    owner_type character varying(255) NOT NULL,
    dashboard_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.filter_sets OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16543)
-- Name: filter_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.filter_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_sets_id_seq OWNER TO postgres;

--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 241
-- Name: filter_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.filter_sets_id_seq OWNED BY public.filter_sets.id;


--
-- TOC entry 242 (class 1259 OID 16545)
-- Name: key_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.key_value (
    id integer NOT NULL,
    resource character varying(32) NOT NULL,
    value bytea NOT NULL,
    uuid uuid,
    created_on timestamp without time zone,
    created_by_fk integer,
    changed_on timestamp without time zone,
    changed_by_fk integer,
    expires_on timestamp without time zone
);


ALTER TABLE public.key_value OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16551)
-- Name: key_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.key_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.key_value_id_seq OWNER TO postgres;

--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 243
-- Name: key_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.key_value_id_seq OWNED BY public.key_value.id;


--
-- TOC entry 244 (class 1259 OID 16553)
-- Name: keyvalue; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keyvalue (
    id integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.keyvalue OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16559)
-- Name: keyvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.keyvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.keyvalue_id_seq OWNER TO postgres;

--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 245
-- Name: keyvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.keyvalue_id_seq OWNED BY public.keyvalue.id;


--
-- TOC entry 246 (class 1259 OID 16561)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    action character varying(512),
    user_id integer,
    json text,
    dttm timestamp without time zone,
    dashboard_id integer,
    slice_id integer,
    duration_ms integer,
    referrer character varying(1024)
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16567)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO postgres;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 247
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 248 (class 1259 OID 16569)
-- Name: query; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query (
    id integer NOT NULL,
    client_id character varying(11) NOT NULL,
    database_id integer NOT NULL,
    tmp_table_name character varying(256),
    tab_name character varying(256),
    sql_editor_id character varying(256),
    user_id integer,
    status character varying(16),
    schema character varying(256),
    sql text,
    select_sql text,
    executed_sql text,
    "limit" integer,
    select_as_cta boolean,
    select_as_cta_used boolean,
    progress integer,
    rows integer,
    error_message text,
    start_time numeric(20,6),
    changed_on timestamp without time zone,
    end_time numeric(20,6),
    results_key character varying(64),
    start_running_time numeric(20,6),
    end_result_backend_time numeric(20,6),
    tracking_url text,
    extra_json text,
    tmp_schema_name character varying(256),
    ctas_method character varying(16),
    limiting_factor character varying(255) DEFAULT 'UNKNOWN'::character varying
);


ALTER TABLE public.query OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16576)
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO postgres;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 249
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- TOC entry 250 (class 1259 OID 16578)
-- Name: report_execution_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_execution_log (
    id integer NOT NULL,
    scheduled_dttm timestamp without time zone NOT NULL,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    value double precision,
    value_row_json text,
    state character varying(50) NOT NULL,
    error_message text,
    report_schedule_id integer NOT NULL,
    uuid uuid
);


ALTER TABLE public.report_execution_log OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16584)
-- Name: report_execution_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_execution_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_execution_log_id_seq OWNER TO postgres;

--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 251
-- Name: report_execution_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_execution_log_id_seq OWNED BY public.report_execution_log.id;


--
-- TOC entry 252 (class 1259 OID 16586)
-- Name: report_recipient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_recipient (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    recipient_config_json text,
    report_schedule_id integer NOT NULL,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.report_recipient OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16592)
-- Name: report_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_recipient_id_seq OWNER TO postgres;

--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 253
-- Name: report_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_recipient_id_seq OWNED BY public.report_recipient.id;


--
-- TOC entry 254 (class 1259 OID 16594)
-- Name: report_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_schedule (
    id integer NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    context_markdown text,
    active boolean,
    crontab character varying(1000) NOT NULL,
    sql text,
    chart_id integer,
    dashboard_id integer,
    database_id integer,
    last_eval_dttm timestamp without time zone,
    last_state character varying(50),
    last_value double precision,
    last_value_row_json text,
    validator_type character varying(100),
    validator_config_json text,
    log_retention integer,
    grace_period integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    working_timeout integer,
    report_format character varying(50) DEFAULT 'PNG'::character varying,
    creation_method character varying(255) DEFAULT 'alerts_reports'::character varying,
    timezone character varying(100) DEFAULT 'UTC'::character varying NOT NULL,
    extra_json text NOT NULL,
    force_screenshot boolean,
    custom_width integer,
    custom_height integer
);


ALTER TABLE public.report_schedule OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16603)
-- Name: report_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_id_seq OWNER TO postgres;

--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 255
-- Name: report_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_schedule_id_seq OWNED BY public.report_schedule.id;


--
-- TOC entry 256 (class 1259 OID 16605)
-- Name: report_schedule_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_schedule_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    report_schedule_id integer NOT NULL
);


ALTER TABLE public.report_schedule_user OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16608)
-- Name: report_schedule_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_schedule_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_schedule_user_id_seq OWNER TO postgres;

--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 257
-- Name: report_schedule_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_schedule_user_id_seq OWNED BY public.report_schedule_user.id;


--
-- TOC entry 258 (class 1259 OID 16610)
-- Name: rls_filter_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rls_filter_roles (
    id integer NOT NULL,
    role_id integer NOT NULL,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_roles OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16613)
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_filter_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 259
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_filter_roles_id_seq OWNED BY public.rls_filter_roles.id;


--
-- TOC entry 260 (class 1259 OID 16615)
-- Name: rls_filter_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rls_filter_tables (
    id integer NOT NULL,
    table_id integer,
    rls_filter_id integer
);


ALTER TABLE public.rls_filter_tables OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16618)
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_filter_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rls_filter_tables_id_seq OWNER TO postgres;

--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 261
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_filter_tables_id_seq OWNED BY public.rls_filter_tables.id;


--
-- TOC entry 262 (class 1259 OID 16620)
-- Name: row_level_security_filters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.row_level_security_filters (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    clause text NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    filter_type character varying(255),
    group_key character varying(255),
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.row_level_security_filters OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16626)
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.row_level_security_filters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.row_level_security_filters_id_seq OWNER TO postgres;

--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 263
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.row_level_security_filters_id_seq OWNED BY public.row_level_security_filters.id;


--
-- TOC entry 264 (class 1259 OID 16628)
-- Name: saved_query; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saved_query (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    db_id integer,
    label character varying(256),
    schema character varying(128),
    sql text,
    description text,
    changed_by_fk integer,
    created_by_fk integer,
    extra_json text,
    last_run timestamp without time zone,
    rows integer,
    uuid uuid,
    template_parameters text
);


ALTER TABLE public.saved_query OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16634)
-- Name: saved_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saved_query_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.saved_query_id_seq OWNER TO postgres;

--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 265
-- Name: saved_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saved_query_id_seq OWNED BY public.saved_query.id;


--
-- TOC entry 266 (class 1259 OID 16636)
-- Name: sl_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_columns (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    is_aggregation boolean NOT NULL,
    is_additive boolean NOT NULL,
    is_dimensional boolean NOT NULL,
    is_filterable boolean NOT NULL,
    is_increase_desired boolean NOT NULL,
    is_managed_externally boolean NOT NULL,
    is_partition boolean NOT NULL,
    is_physical boolean NOT NULL,
    is_temporal boolean NOT NULL,
    is_spatial boolean NOT NULL,
    name text,
    type text,
    unit text,
    expression text,
    description text,
    warning_text text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer,
    advanced_data_type text
);


ALTER TABLE public.sl_columns OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16642)
-- Name: sl_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_columns_id_seq OWNER TO postgres;

--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 267
-- Name: sl_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_columns_id_seq OWNED BY public.sl_columns.id;


--
-- TOC entry 268 (class 1259 OID 16644)
-- Name: sl_dataset_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_columns (
    dataset_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_columns OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16647)
-- Name: sl_dataset_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_tables (
    dataset_id integer NOT NULL,
    table_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_tables OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 16650)
-- Name: sl_dataset_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_dataset_users (
    dataset_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.sl_dataset_users OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 16653)
-- Name: sl_datasets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_datasets (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_physical boolean,
    is_managed_externally boolean NOT NULL,
    name text,
    expression text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_datasets OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 16659)
-- Name: sl_datasets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_datasets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_datasets_id_seq OWNER TO postgres;

--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 272
-- Name: sl_datasets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_datasets_id_seq OWNED BY public.sl_datasets.id;


--
-- TOC entry 273 (class 1259 OID 16661)
-- Name: sl_table_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_table_columns (
    table_id integer NOT NULL,
    column_id integer NOT NULL
);


ALTER TABLE public.sl_table_columns OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16664)
-- Name: sl_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sl_tables (
    uuid uuid,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    database_id integer NOT NULL,
    is_managed_externally boolean NOT NULL,
    catalog text,
    schema text,
    name text,
    external_url text,
    extra_json text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.sl_tables OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16670)
-- Name: sl_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sl_tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sl_tables_id_seq OWNER TO postgres;

--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 275
-- Name: sl_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sl_tables_id_seq OWNED BY public.sl_tables.id;


--
-- TOC entry 276 (class 1259 OID 16672)
-- Name: slice_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slice_user (
    id integer NOT NULL,
    user_id integer,
    slice_id integer
);


ALTER TABLE public.slice_user OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16675)
-- Name: slice_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slice_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slice_user_id_seq OWNER TO postgres;

--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 277
-- Name: slice_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slice_user_id_seq OWNED BY public.slice_user.id;


--
-- TOC entry 278 (class 1259 OID 16677)
-- Name: slices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.slices (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    slice_name character varying(250),
    datasource_type character varying(200),
    datasource_name character varying(2000),
    viz_type character varying(250),
    params text,
    created_by_fk integer,
    changed_by_fk integer,
    description text,
    cache_timeout integer,
    perm character varying(2000),
    datasource_id integer,
    schema_perm character varying(1000),
    uuid uuid,
    query_context text,
    last_saved_at timestamp without time zone,
    last_saved_by_fk integer,
    certified_by text,
    certification_details text,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    CONSTRAINT ck_chart_datasource CHECK (((datasource_type)::text = 'table'::text))
);


ALTER TABLE public.slices OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16685)
-- Name: slices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.slices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slices_id_seq OWNER TO postgres;

--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 279
-- Name: slices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.slices_id_seq OWNED BY public.slices.id;


--
-- TOC entry 280 (class 1259 OID 16687)
-- Name: sql_metrics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sql_metrics (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    metric_name character varying(255) NOT NULL,
    verbose_name character varying(1024),
    metric_type character varying(32),
    table_id integer,
    expression text NOT NULL,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    d3format character varying(128),
    warning_text text,
    extra text,
    uuid uuid,
    currency character varying(128)
);


ALTER TABLE public.sql_metrics OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16693)
-- Name: sql_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sql_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sql_metrics_id_seq OWNER TO postgres;

--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 281
-- Name: sql_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sql_metrics_id_seq OWNED BY public.sql_metrics.id;


--
-- TOC entry 282 (class 1259 OID 16695)
-- Name: sqlatable_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sqlatable_user (
    id integer NOT NULL,
    user_id integer,
    table_id integer
);


ALTER TABLE public.sqlatable_user OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16698)
-- Name: sqlatable_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sqlatable_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sqlatable_user_id_seq OWNER TO postgres;

--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 283
-- Name: sqlatable_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sqlatable_user_id_seq OWNED BY public.sqlatable_user.id;


--
-- TOC entry 284 (class 1259 OID 16700)
-- Name: ssh_tunnels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ssh_tunnels (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer,
    extra_json text,
    uuid uuid,
    id integer NOT NULL,
    database_id integer,
    server_address character varying(256),
    server_port integer,
    username bytea,
    password bytea,
    private_key bytea,
    private_key_password bytea
);


ALTER TABLE public.ssh_tunnels OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 16706)
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ssh_tunnels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ssh_tunnels_id_seq OWNER TO postgres;

--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 285
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ssh_tunnels_id_seq OWNED BY public.ssh_tunnels.id;


--
-- TOC entry 286 (class 1259 OID 16708)
-- Name: tab_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tab_state (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    user_id integer,
    label character varying(256),
    active boolean,
    database_id integer,
    schema character varying(256),
    sql text,
    query_limit integer,
    latest_query_id character varying(11),
    autorun boolean NOT NULL,
    template_params text,
    created_by_fk integer,
    changed_by_fk integer,
    hide_left_bar boolean DEFAULT false NOT NULL,
    saved_query_id integer
);


ALTER TABLE public.tab_state OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 16715)
-- Name: tab_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tab_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tab_state_id_seq OWNER TO postgres;

--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 287
-- Name: tab_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tab_state_id_seq OWNED BY public.tab_state.id;


--
-- TOC entry 288 (class 1259 OID 16717)
-- Name: table_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_columns (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_id integer,
    column_name character varying(255) NOT NULL,
    is_dttm boolean,
    is_active boolean,
    type text,
    groupby boolean,
    filterable boolean,
    description text,
    created_by_fk integer,
    changed_by_fk integer,
    expression text,
    verbose_name character varying(1024),
    python_date_format character varying(255),
    uuid uuid,
    extra text,
    advanced_data_type character varying(255)
);


ALTER TABLE public.table_columns OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 16723)
-- Name: table_columns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_columns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_columns_id_seq OWNER TO postgres;

--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 289
-- Name: table_columns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_columns_id_seq OWNED BY public.table_columns.id;


--
-- TOC entry 290 (class 1259 OID 16725)
-- Name: table_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_schema (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    extra_json text,
    id integer NOT NULL,
    tab_state_id integer,
    database_id integer NOT NULL,
    schema character varying(256),
    "table" character varying(256),
    description text,
    expanded boolean,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.table_schema OWNER TO postgres;

--
-- TOC entry 291 (class 1259 OID 16731)
-- Name: table_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_schema_id_seq OWNER TO postgres;

--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 291
-- Name: table_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_schema_id_seq OWNED BY public.table_schema.id;


--
-- TOC entry 292 (class 1259 OID 16733)
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    table_name character varying(250) NOT NULL,
    main_dttm_col character varying(250),
    default_endpoint text,
    database_id integer NOT NULL,
    created_by_fk integer,
    changed_by_fk integer,
    "offset" integer,
    description text,
    is_featured boolean,
    cache_timeout integer,
    schema character varying(255),
    sql text,
    params text,
    perm character varying(1000),
    filter_select_enabled boolean,
    fetch_values_predicate text,
    is_sqllab_view boolean DEFAULT false,
    template_params text,
    schema_perm character varying(1000),
    extra text,
    uuid uuid,
    is_managed_externally boolean DEFAULT false NOT NULL,
    external_url text,
    normalize_columns boolean DEFAULT false
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 16742)
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO postgres;

--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 293
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- TOC entry 294 (class 1259 OID 16744)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    name character varying(250),
    type character varying,
    created_by_fk integer,
    changed_by_fk integer,
    description text
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 16750)
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO postgres;

--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 295
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tag_id_seq OWNED BY public.tag.id;


--
-- TOC entry 296 (class 1259 OID 16752)
-- Name: tagged_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tagged_object (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    tag_id integer,
    object_id integer,
    object_type character varying,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.tagged_object OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 16758)
-- Name: tagged_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tagged_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tagged_object_id_seq OWNER TO postgres;

--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 297
-- Name: tagged_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tagged_object_id_seq OWNED BY public.tagged_object.id;


--
-- TOC entry 298 (class 1259 OID 16760)
-- Name: url; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.url (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    url text,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.url OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 16766)
-- Name: url_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.url_id_seq OWNER TO postgres;

--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 299
-- Name: url_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.url_id_seq OWNED BY public.url.id;


--
-- TOC entry 300 (class 1259 OID 16768)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    id integer NOT NULL,
    user_id integer,
    welcome_dashboard_id integer,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 16771)
-- Name: user_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_attribute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_attribute_id_seq OWNER TO postgres;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 301
-- Name: user_attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_attribute_id_seq OWNED BY public.user_attribute.id;


--
-- TOC entry 3220 (class 2604 OID 16773)
-- Name: annotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16774)
-- Name: annotation_layer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer ALTER COLUMN id SET DEFAULT nextval('public.annotation_layer_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16775)
-- Name: cache_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_keys ALTER COLUMN id SET DEFAULT nextval('public.cache_keys_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16776)
-- Name: css_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates ALTER COLUMN id SET DEFAULT nextval('public.css_templates_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16777)
-- Name: dashboard_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles ALTER COLUMN id SET DEFAULT nextval('public.dashboard_roles_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16778)
-- Name: dashboard_slices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices ALTER COLUMN id SET DEFAULT nextval('public.dashboard_slices_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16779)
-- Name: dashboard_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user ALTER COLUMN id SET DEFAULT nextval('public.dashboard_user_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 16780)
-- Name: dashboards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards ALTER COLUMN id SET DEFAULT nextval('public.dashboards_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 16781)
-- Name: dbs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs ALTER COLUMN id SET DEFAULT nextval('public.dbs_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 16782)
-- Name: dynamic_plugin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin ALTER COLUMN id SET DEFAULT nextval('public.dynamic_plugin_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16783)
-- Name: favstar id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar ALTER COLUMN id SET DEFAULT nextval('public.favstar_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16784)
-- Name: filter_sets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets ALTER COLUMN id SET DEFAULT nextval('public.filter_sets_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16785)
-- Name: key_value id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value ALTER COLUMN id SET DEFAULT nextval('public.key_value_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 16786)
-- Name: keyvalue id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyvalue ALTER COLUMN id SET DEFAULT nextval('public.keyvalue_id_seq'::regclass);


--
-- TOC entry 3238 (class 2604 OID 16787)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 16788)
-- Name: query id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 16789)
-- Name: report_execution_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log ALTER COLUMN id SET DEFAULT nextval('public.report_execution_log_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 16790)
-- Name: report_recipient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient ALTER COLUMN id SET DEFAULT nextval('public.report_recipient_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16791)
-- Name: report_schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16792)
-- Name: report_schedule_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user ALTER COLUMN id SET DEFAULT nextval('public.report_schedule_user_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 16793)
-- Name: rls_filter_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_roles_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 16794)
-- Name: rls_filter_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables ALTER COLUMN id SET DEFAULT nextval('public.rls_filter_tables_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 16795)
-- Name: row_level_security_filters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters ALTER COLUMN id SET DEFAULT nextval('public.row_level_security_filters_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 16796)
-- Name: saved_query id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query ALTER COLUMN id SET DEFAULT nextval('public.saved_query_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 16797)
-- Name: sl_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns ALTER COLUMN id SET DEFAULT nextval('public.sl_columns_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 16798)
-- Name: sl_datasets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets ALTER COLUMN id SET DEFAULT nextval('public.sl_datasets_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 16799)
-- Name: sl_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables ALTER COLUMN id SET DEFAULT nextval('public.sl_tables_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 16800)
-- Name: slice_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user ALTER COLUMN id SET DEFAULT nextval('public.slice_user_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16801)
-- Name: slices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices ALTER COLUMN id SET DEFAULT nextval('public.slices_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 16802)
-- Name: sql_metrics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics ALTER COLUMN id SET DEFAULT nextval('public.sql_metrics_id_seq'::regclass);


--
-- TOC entry 3260 (class 2604 OID 16803)
-- Name: sqlatable_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user ALTER COLUMN id SET DEFAULT nextval('public.sqlatable_user_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 16804)
-- Name: ssh_tunnels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ssh_tunnels ALTER COLUMN id SET DEFAULT nextval('public.ssh_tunnels_id_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16805)
-- Name: tab_state id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state ALTER COLUMN id SET DEFAULT nextval('public.tab_state_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16806)
-- Name: table_columns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns ALTER COLUMN id SET DEFAULT nextval('public.table_columns_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16807)
-- Name: table_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema ALTER COLUMN id SET DEFAULT nextval('public.table_schema_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16808)
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 16809)
-- Name: tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN id SET DEFAULT nextval('public.tag_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 16810)
-- Name: tagged_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object ALTER COLUMN id SET DEFAULT nextval('public.tagged_object_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 16811)
-- Name: url id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url ALTER COLUMN id SET DEFAULT nextval('public.url_id_seq'::regclass);


--
-- TOC entry 3273 (class 2604 OID 16812)
-- Name: user_attribute id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute ALTER COLUMN id SET DEFAULT nextval('public.user_attribute_id_seq'::regclass);


--
-- TOC entry 3701 (class 0 OID 16405)
-- Dependencies: 200
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_permission VALUES (1, 'can_this_form_get') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (2, 'can_this_form_post') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (3, 'can_userinfo') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (4, 'can_add') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (5, 'can_show') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (6, 'can_list') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (7, 'can_edit') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (8, 'can_delete') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (9, 'resetmypassword') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (10, 'resetpasswords') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (11, 'userinfoedit') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (12, 'copyrole') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (13, 'can_get') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (14, 'can_read') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (15, 'can_write') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (16, 'can_invalidate') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (17, 'can_warm_up_cache') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (18, 'can_export') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (19, 'can_set_embedded') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (20, 'can_get_embedded') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (21, 'can_delete_embedded') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (22, 'can_get_or_create_dataset') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (23, 'can_duplicate') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (24, 'can_get_column_values') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (25, 'can_import_') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (26, 'can_execute_sql_query') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (27, 'can_estimate_query_cost') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (28, 'can_export_csv') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (29, 'can_get_results') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (30, 'can_download') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (31, 'can_query') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (32, 'can_query_form_data') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (33, 'can_time_range') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (34, 'can_external_metadata_by_name') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (35, 'can_samples') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (36, 'can_external_metadata') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (37, 'can_save') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (38, 'can_get_value') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (39, 'can_store') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (40, 'can_my_queries') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (41, 'can_dashboard') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (42, 'can_profile') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (43, 'can_dashboard_permalink') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (44, 'can_sqllab') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (45, 'can_import_dashboards') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (46, 'can_log') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (47, 'can_explore') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (48, 'can_slice') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (49, 'can_sqllab_history') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (50, 'can_fetch_datasource_metadata') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (51, 'can_explore_json') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (52, 'can_post') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (53, 'can_expanded') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (54, 'can_activate') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (55, 'can_put') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (56, 'can_migrate_query') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (57, 'can_delete_query') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (58, 'can_tags') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (59, 'can_recent_activity') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (60, 'can_grant_guest_token') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (61, 'menu_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (62, 'all_datasource_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (63, 'all_database_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (64, 'all_query_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (65, 'can_csv') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (66, 'can_share_dashboard') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (67, 'can_share_chart') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (68, 'database_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (69, 'schema_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission VALUES (70, 'datasource_access') ON CONFLICT DO NOTHING;


--
-- TOC entry 3703 (class 0 OID 16410)
-- Dependencies: 202
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_permission_view VALUES (1, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (2, 2, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (3, 1, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (4, 2, 6) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (5, 1, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (6, 2, 7) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (7, 3, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (8, 4, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (9, 5, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (10, 6, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (11, 7, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (12, 8, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (13, 9, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (14, 10, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (15, 11, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (16, 4, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (17, 5, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (18, 6, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (19, 7, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (20, 8, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (21, 12, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (22, 13, 11) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (23, 5, 12) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (24, 13, 13) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (25, 14, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (26, 15, 14) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (27, 6, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (28, 14, 16) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (29, 14, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (30, 16, 18) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (31, 14, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (32, 17, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (33, 15, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (34, 18, 19) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (35, 14, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (36, 15, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (37, 14, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (38, 15, 22) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (39, 14, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (40, 15, 23) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (41, 18, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (42, 19, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (43, 20, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (44, 14, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (45, 15, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (46, 21, 24) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (47, 14, 25) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (48, 15, 25) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (49, 18, 25) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (50, 18, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (51, 14, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (52, 22, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (53, 15, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (54, 17, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (55, 23, 26) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (56, 24, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (57, 14, 28) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (58, 14, 29) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (59, 14, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (60, 15, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (61, 14, 31) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (62, 15, 31) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (63, 8, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (64, 6, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (65, 7, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (66, 4, 32) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (67, 18, 33) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (68, 25, 33) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (69, 14, 34) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (70, 14, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (71, 15, 35) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (72, 14, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (73, 15, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (74, 14, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (75, 15, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (76, 18, 37) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (77, 14, 38) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (78, 15, 38) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (79, 26, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (80, 27, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (81, 28, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (82, 29, 39) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (83, 30, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (84, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (85, 5, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (86, 6, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (87, 15, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (88, 7, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (89, 8, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (90, 31, 41) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (91, 32, 41) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (92, 33, 41) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (93, 1, 42) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (94, 2, 42) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (95, 1, 43) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (96, 2, 43) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (97, 1, 44) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (98, 2, 44) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (99, 13, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (100, 34, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (101, 35, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (102, 36, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (103, 37, 27) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (104, 38, 46) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (105, 39, 46) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (106, 40, 48) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (107, 41, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (108, 42, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (109, 43, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (110, 44, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (111, 45, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (112, 46, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (113, 47, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (114, 48, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (115, 49, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (116, 17, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (117, 50, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (118, 51, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (119, 8, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (120, 52, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (121, 53, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (122, 54, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (123, 52, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (124, 13, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (125, 55, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (126, 8, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (127, 56, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (128, 57, 51) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (129, 30, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (130, 4, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (131, 5, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (132, 6, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (133, 7, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (134, 8, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (135, 58, 54) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (136, 59, 55) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (137, 14, 55) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (138, 15, 55) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (139, 14, 56) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (140, 60, 56) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (141, 14, 57) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (142, 61, 58) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (143, 61, 59) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (144, 61, 60) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (145, 61, 61) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (146, 61, 36) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (147, 61, 62) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (148, 61, 63) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (149, 61, 64) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (150, 61, 65) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (151, 61, 66) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (152, 61, 67) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (153, 61, 68) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (154, 61, 69) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (155, 61, 70) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (156, 61, 71) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (157, 61, 53) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (158, 61, 72) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (159, 61, 73) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (160, 61, 74) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (161, 61, 75) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (162, 61, 76) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (163, 61, 77) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (164, 62, 78) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (165, 63, 79) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (166, 64, 80) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (167, 65, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (168, 66, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (169, 67, 49) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (170, 68, 81) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (171, 69, 82) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (172, 69, 83) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (173, 70, 84) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (174, 70, 85) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (175, 70, 86) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (176, 70, 87) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view VALUES (177, 70, 88) ON CONFLICT DO NOTHING;


--
-- TOC entry 3705 (class 0 OID 16415)
-- Dependencies: 204
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_permission_view_role VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (2, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (3, 3, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (4, 4, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (5, 5, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (6, 6, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (7, 7, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (8, 8, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (9, 9, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (10, 10, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (11, 11, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (12, 12, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (13, 13, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (14, 14, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (15, 15, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (16, 16, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (17, 17, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (18, 18, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (19, 19, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (20, 20, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (21, 21, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (22, 22, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (23, 23, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (24, 24, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (25, 25, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (26, 26, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (27, 27, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (28, 28, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (29, 29, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (30, 30, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (31, 31, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (32, 32, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (33, 33, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (34, 34, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (35, 35, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (36, 36, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (37, 37, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (38, 38, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (39, 39, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (40, 40, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (41, 41, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (42, 42, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (43, 43, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (44, 44, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (45, 45, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (46, 46, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (47, 47, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (48, 48, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (49, 49, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (50, 50, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (51, 51, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (52, 52, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (53, 53, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (54, 54, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (55, 55, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (56, 56, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (57, 57, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (58, 58, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (59, 59, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (60, 60, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (61, 61, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (62, 62, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (63, 63, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (64, 64, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (65, 65, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (66, 66, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (67, 67, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (68, 68, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (69, 69, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (70, 70, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (71, 71, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (72, 72, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (73, 73, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (74, 74, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (75, 75, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (76, 76, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (77, 77, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (78, 78, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (79, 79, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (80, 80, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (81, 81, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (82, 82, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (83, 83, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (84, 84, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (85, 85, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (86, 86, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (87, 87, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (88, 88, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (89, 89, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (90, 90, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (91, 91, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (92, 92, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (93, 93, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (94, 94, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (95, 95, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (96, 96, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (97, 97, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (98, 98, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (99, 99, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (100, 100, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (101, 101, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (102, 102, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (103, 103, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (104, 104, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (105, 105, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (106, 106, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (107, 107, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (108, 108, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (109, 109, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (110, 110, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (111, 111, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (112, 112, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (113, 113, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (114, 114, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (115, 115, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (116, 116, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (117, 117, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (118, 118, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (119, 119, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (120, 120, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (121, 121, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (122, 122, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (123, 123, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (124, 124, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (125, 125, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (126, 126, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (127, 127, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (128, 128, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (129, 129, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (130, 130, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (131, 131, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (132, 132, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (133, 133, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (134, 134, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (135, 135, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (136, 136, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (137, 137, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (138, 138, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (139, 139, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (140, 140, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (141, 141, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (142, 142, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (143, 143, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (144, 144, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (145, 145, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (146, 146, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (147, 147, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (148, 148, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (149, 149, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (150, 150, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (151, 151, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (152, 152, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (153, 153, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (154, 154, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (155, 155, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (156, 156, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (157, 157, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (158, 158, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (159, 159, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (160, 160, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (161, 161, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (162, 162, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (163, 163, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (164, 164, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (165, 165, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (166, 166, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (167, 167, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (168, 168, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (169, 169, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (170, 3, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (171, 4, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (172, 7, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (173, 13, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (174, 22, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (175, 23, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (176, 24, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (177, 25, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (178, 26, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (179, 27, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (180, 28, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (181, 29, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (182, 30, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (183, 31, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (184, 33, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (185, 34, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (186, 35, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (187, 36, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (188, 37, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (189, 38, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (190, 39, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (191, 40, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (192, 41, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (193, 43, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (194, 44, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (195, 45, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (196, 46, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (197, 47, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (198, 50, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (199, 51, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (200, 52, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (201, 53, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (202, 55, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (203, 56, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (204, 57, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (205, 58, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (206, 59, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (207, 60, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (208, 61, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (209, 62, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (210, 63, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (211, 64, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (212, 65, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (213, 66, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (214, 67, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (215, 68, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (216, 70, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (217, 71, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (218, 77, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (219, 78, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (220, 80, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (221, 85, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (222, 86, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (223, 90, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (224, 91, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (225, 92, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (226, 93, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (227, 94, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (228, 95, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (229, 96, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (230, 97, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (231, 98, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (232, 99, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (233, 100, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (234, 101, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (235, 102, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (236, 103, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (237, 104, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (238, 105, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (239, 107, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (240, 108, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (241, 109, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (242, 111, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (243, 112, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (244, 113, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (245, 114, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (246, 117, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (247, 118, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (248, 119, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (249, 120, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (250, 121, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (251, 129, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (252, 130, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (253, 131, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (254, 132, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (255, 133, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (256, 134, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (257, 135, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (258, 136, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (259, 139, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (260, 141, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (261, 147, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (262, 148, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (263, 149, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (264, 150, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (265, 151, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (266, 152, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (267, 153, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (268, 154, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (269, 155, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (270, 156, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (271, 157, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (272, 158, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (273, 159, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (274, 164, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (275, 165, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (276, 167, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (277, 168, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (278, 169, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (279, 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (280, 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (281, 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (282, 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (283, 22, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (284, 23, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (285, 24, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (286, 27, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (287, 28, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (288, 29, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (289, 30, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (290, 31, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (291, 33, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (292, 34, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (293, 37, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (294, 38, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (295, 39, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (296, 40, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (297, 41, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (298, 43, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (299, 44, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (300, 45, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (301, 46, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (302, 47, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (303, 51, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (304, 57, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (305, 58, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (306, 59, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (307, 60, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (308, 61, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (309, 62, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (310, 63, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (311, 64, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (312, 65, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (313, 66, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (314, 77, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (315, 78, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (316, 80, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (317, 85, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (318, 86, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (319, 90, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (320, 91, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (321, 92, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (322, 99, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (323, 100, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (324, 102, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (325, 104, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (326, 105, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (327, 107, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (328, 108, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (329, 109, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (330, 111, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (331, 112, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (332, 113, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (333, 114, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (334, 117, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (335, 118, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (336, 129, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (337, 130, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (338, 131, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (339, 132, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (340, 133, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (341, 134, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (342, 135, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (343, 136, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (344, 139, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (345, 141, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (346, 147, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (347, 148, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (348, 149, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (349, 150, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (350, 151, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (351, 152, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (352, 154, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (353, 156, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (354, 157, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (355, 167, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (356, 168, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (357, 169, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (358, 47, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (359, 69, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (360, 74, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (361, 75, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (362, 76, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (363, 79, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (364, 81, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (365, 82, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (366, 106, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (367, 110, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (368, 115, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (369, 122, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (370, 123, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (371, 124, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (372, 125, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (373, 126, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (374, 127, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (375, 128, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (376, 160, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (377, 161, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (378, 162, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (379, 163, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.ab_permission_view_role VALUES (380, 167, 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3707 (class 0 OID 16420)
-- Dependencies: 206
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3709 (class 0 OID 16428)
-- Dependencies: 208
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_role VALUES (1, 'Admin') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_role VALUES (2, 'Public') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_role VALUES (3, 'Alpha') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_role VALUES (4, 'Gamma') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_role VALUES (5, 'sql_lab') ON CONFLICT DO NOTHING;


--
-- TOC entry 3711 (class 0 OID 16433)
-- Dependencies: 210
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_user VALUES (1, 'Superset', 'Admin', 'admin', 'pbkdf2:sha256:600000$PUs8x4QHbIxKuUdd$2cd2c333f82c7e540bfead68d2ba7f99bfb98f9fb710abda0a8bf10e06b034ac', true, 'admin@superset.com', '2023-12-07 22:10:41.70011', 9, 0, '2023-12-04 20:00:12.769981', '2023-12-04 20:00:12.769987', NULL, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3713 (class 0 OID 16441)
-- Dependencies: 212
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_user_role VALUES (1, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3715 (class 0 OID 16446)
-- Dependencies: 214
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ab_view_menu VALUES (1, 'SupersetIndexView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (2, 'UtilView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (3, 'LocaleView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (4, 'SecurityApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (5, 'ResetPasswordView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (6, 'ResetMyPasswordView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (7, 'UserInfoEditView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (8, 'AuthDBView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (9, 'UserDBModelView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (10, 'RoleModelView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (11, 'OpenApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (12, 'SwaggerView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (13, 'MenuApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (14, 'Annotation') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (15, 'AsyncEventsRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (16, 'AdvancedDataType') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (17, 'AvailableDomains') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (18, 'CacheRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (19, 'Chart') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (20, 'CssTemplate') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (21, 'CurrentUserRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (22, 'DashboardFilterStateRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (23, 'DashboardPermalinkRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (24, 'Dashboard') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (25, 'Database') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (26, 'Dataset') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (27, 'Datasource') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (28, 'EmbeddedDashboard') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (29, 'Explore') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (30, 'ExploreFormDataRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (31, 'ExplorePermalinkRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (32, 'FilterSets') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (33, 'ImportExportRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (34, 'Query') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (35, 'ReportSchedule') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (36, 'Row Level Security') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (37, 'SavedQuery') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (38, 'Tag') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (39, 'SQLLab') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (40, 'DynamicPlugin') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (41, 'Api') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (42, 'CsvToDatabaseView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (43, 'ExcelToDatabaseView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (44, 'ColumnarToDatabaseView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (45, 'EmbeddedView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (46, 'KV') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (47, 'R') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (48, 'SqlLab') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (49, 'Superset') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (50, 'TableSchemaView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (51, 'TabStateView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (52, 'TaggedObjectView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (53, 'Tags') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (54, 'TagView') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (55, 'Log') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (56, 'SecurityRestApi') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (57, 'RowLevelSecurity') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (58, 'Security') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (59, 'List Users') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (60, 'List Roles') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (61, 'Action Log') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (62, 'Home') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (63, 'Data') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (64, 'Databases') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (65, 'Dashboards') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (66, 'Charts') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (67, 'Datasets') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (68, 'Manage') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (69, 'Plugins') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (70, 'CSS Templates') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (71, 'Import Dashboards') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (72, 'Alerts & Report') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (73, 'Annotation Layers') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (74, 'SQL Lab') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (75, 'SQL Editor') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (76, 'Saved Queries') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (77, 'Query Search') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (78, 'all_datasource_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (79, 'all_database_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (80, 'all_query_access') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (81, '[user_traffic].(id:1)') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (82, '[user_traffic].[information_schema]') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (83, '[user_traffic].[public]') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (84, '[user_traffic].[user_duration](id:1)') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (85, '[user_traffic].[click_dynamics](id:2)') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (86, '[user_traffic].[raw_data](id:3)') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (87, '[user_traffic].[clean_data_user_duration](id:4)') ON CONFLICT DO NOTHING;
INSERT INTO public.ab_view_menu VALUES (88, '[user_traffic].[classification](id:5)') ON CONFLICT DO NOTHING;


--
-- TOC entry 3717 (class 0 OID 16451)
-- Dependencies: 216
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alembic_version VALUES ('4b85906e5b91') ON CONFLICT DO NOTHING;


--
-- TOC entry 3718 (class 0 OID 16454)
-- Dependencies: 217
-- Data for Name: annotation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3720 (class 0 OID 16462)
-- Dependencies: 219
-- Data for Name: annotation_layer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3722 (class 0 OID 16470)
-- Dependencies: 221
-- Data for Name: cache_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3724 (class 0 OID 16475)
-- Dependencies: 223
-- Data for Name: css_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3726 (class 0 OID 16483)
-- Dependencies: 225
-- Data for Name: dashboard_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3728 (class 0 OID 16488)
-- Dependencies: 227
-- Data for Name: dashboard_slices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dashboard_slices VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.dashboard_slices VALUES (2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.dashboard_slices VALUES (3, 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.dashboard_slices VALUES (4, 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.dashboard_slices VALUES (5, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.dashboard_slices VALUES (6, 1, 6) ON CONFLICT DO NOTHING;


--
-- TOC entry 3730 (class 0 OID 16493)
-- Dependencies: 229
-- Data for Name: dashboard_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dashboard_user VALUES (1, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3732 (class 0 OID 16498)
-- Dependencies: 231
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dashboards VALUES ('2023-12-04 20:01:33.889528', '2023-12-07 22:16:00.68474', 1, 'Мониторинг траффика', '{"CHART-explore-1-1":{"children":[],"id":"CHART-explore-1-1","meta":{"chartId":1,"height":50,"sliceName":"\u0414\u0438\u043d\u0430\u043c\u0438\u043a\u0430 \u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u0430 \u043a\u043b\u0438\u043a\u043e\u0432","uuid":"4eee7389-002d-4728-891b-8529a5fc4407","width":5},"parents":["ROOT_ID","GRID_ID","ROW-IWTPtTtiIC"],"type":"CHART"},"CHART-explore-2-1":{"children":[],"id":"CHART-explore-2-1","meta":{"chartId":2,"height":50,"sliceName":"\u041f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0438, \u043a\u043e\u0442\u043e\u0440\u044b\u0435 \u0441\u0434\u0435\u043b\u0430\u043b\u0438 \u043a\u043b\u0438\u043a","uuid":"8ae112a2-00e2-45f2-906a-70dfb372b0e7","width":3},"parents":["ROOT_ID","GRID_ID","ROW-IWTPtTtiIC"],"type":"CHART"},"CHART-explore-3-1":{"children":[],"id":"CHART-explore-3-1","meta":{"chartId":3,"height":50,"sliceName":"\u0421\u0440\u0435\u0434\u043d\u0435\u0435 \u0432\u0440\u0435\u043c\u044f, \u0442\u0440\u0435\u0431\u0443\u044e\u0449\u0435\u0435\u0441\u044f \u043d\u0430 \u043a\u043b\u0438\u043a","uuid":"dc17891a-b6b9-4fa4-a2cf-64ea09be48dc","width":4},"parents":["ROOT_ID","GRID_ID","ROW-IWTPtTtiIC"],"type":"CHART"},"CHART-explore-4-1":{"children":[],"id":"CHART-explore-4-1","meta":{"chartId":4,"height":50,"sliceName":"\u0421 \u043a\u0430\u043a\u0438\u0445 \u0443\u0441\u0442\u0440\u043e\u0439\u0441\u0442\u0432 \u0437\u0430\u0445\u043e\u0434\u044f\u0442 \u0447\u0430\u0449\u0435 \u0432\u0441\u0435\u0433\u043e","uuid":"95c2c757-862a-43d2-b701-e9ab4ac807e4","width":4},"parents":["ROOT_ID","GRID_ID","ROW-OyzbQ6wRFS"],"type":"CHART"},"CHART-explore-5-1":{"children":[],"id":"CHART-explore-5-1","meta":{"chartId":5,"height":50,"sliceName":"\u0421\u043e\u043e\u0442\u043d\u043e\u0448\u0435\u043d\u0438\u0435 \u0431\u043e\u0442\u043e\u0432 \u0438 \u0441\u0443\u0449\u0435\u0441\u0442\u0432\u0443\u044e\u0449\u0438\u0445 \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0435\u0439","uuid":"083e4829-5075-4fe6-8a46-2ea66f4ad822","width":4},"parents":["ROOT_ID","GRID_ID","ROW-OyzbQ6wRFS"],"type":"CHART"},"CHART-explore-6-1":{"children":[],"id":"CHART-explore-6-1","meta":{"chartId":6,"height":50,"sliceName":"\u0412\u043e\u0440\u043e\u043d\u043a\u0430 \u043a\u043b\u0438\u043a\u043e\u0432","uuid":"9d91bbd4-8277-4fb2-92c7-93dfb90854d7","width":4},"parents":["ROOT_ID","GRID_ID","ROW-OyzbQ6wRFS"],"type":"CHART"},"DASHBOARD_VERSION_KEY":"v2","GRID_ID":{"children":["ROW-IWTPtTtiIC","ROW-OyzbQ6wRFS"],"id":"GRID_ID","parents":["ROOT_ID"],"type":"GRID"},"HEADER_ID":{"id":"HEADER_ID","meta":{"text":"\u041c\u043e\u043d\u0438\u0442\u043e\u0440\u0438\u043d\u0433 \u0442\u0440\u0430\u0444\u0444\u0438\u043a\u0430"},"type":"HEADER"},"ROOT_ID":{"children":["GRID_ID"],"id":"ROOT_ID","type":"ROOT"},"ROW-IWTPtTtiIC":{"children":["CHART-explore-3-1","CHART-explore-1-1","CHART-explore-2-1"],"id":"ROW-IWTPtTtiIC","meta":{"0":"ROOT_ID","background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"},"ROW-OyzbQ6wRFS":{"children":["CHART-explore-4-1","CHART-explore-5-1","CHART-explore-6-1"],"id":"ROW-OyzbQ6wRFS","meta":{"0":"ROOT_ID","background":"BACKGROUND_TRANSPARENT"},"parents":["ROOT_ID","GRID_ID"],"type":"ROW"}}', 1, 1, '', NULL, NULL, '{"chart_configuration": {"1": {"id": 1, "crossFilters": {"scope": "global", "chartsInScope": [2, 3, 4, 5, 6]}}, "2": {"id": 2, "crossFilters": {"scope": "global", "chartsInScope": [1, 3, 4, 5, 6]}}, "4": {"id": 4, "crossFilters": {"scope": "global", "chartsInScope": [1, 2, 3, 5, 6]}}, "5": {"id": 5, "crossFilters": {"scope": "global", "chartsInScope": [1, 2, 3, 4, 6]}}, "6": {"id": 6, "crossFilters": {"scope": "global", "chartsInScope": [1, 2, 3, 4, 5]}}}, "global_chart_configuration": {"scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "chartsInScope": [1, 2, 3, 4, 5, 6]}, "color_scheme": "", "refresh_frequency": 0, "shared_label_colors": {"\u041f\u043e\u043a\u0430\u0437\u0430\u043d\u0430 \u0440\u0435\u043a\u043b\u0430\u043c\u0430": "#1FA8C9", "\u041a\u043b\u0438\u043a\u0438": "#5AC189", "\u041f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u044c": "#454E7C", "\u0411\u043e\u0442": "#666666", "\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u043a\u043b\u0438\u043a\u043e\u0432": "#FF7F44", "\u041a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e \u043f\u043e\u043b\u044c\u0437\u043e\u0432\u0430\u0442\u0435\u043b\u0435\u0439": "#E04355"}, "color_scheme_domain": [], "expanded_slices": {}, "label_colors": {}, "timed_refresh_immune_slices": [], "cross_filters_enabled": true, "default_filters": "{}", "native_filter_configuration": [{"id": "NATIVE_FILTER-eczLmeuKm", "controlValues": {"enableEmptyFilter": false, "defaultToFirstItem": false, "multiSelect": true, "searchAllOptions": false, "inverseSelection": false}, "name": "\u0421\u0430\u0439\u0442", "filterType": "filter_select", "targets": [{"datasetId": 3, "column": {"name": "siteid"}}], "defaultDataMask": {"extraFormData": {}, "filterState": {}, "ownState": {}}, "cascadeParentIds": [], "scope": {"rootPath": ["ROOT_ID"], "excluded": []}, "type": "NATIVE_FILTER", "description": "", "chartsInScope": [1, 2, 3, 4, 5, 6], "tabsInScope": []}]}', true, '0e0cf8bd-65f8-47c5-93fe-712f7580a1f0', '', '', false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3734 (class 0 OID 16507)
-- Dependencies: 233
-- Data for Name: dbs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dbs VALUES ('2023-12-04 20:01:22.418718', '2023-12-04 20:01:23.537282', 1, 'user_traffic', 'postgresql+psycopg2://postgres:XXXXXXXXXX@postgres:5432/user_traffic', 1, 1, '\x38646b7451377843613144385369392b41686f4141673d3d', NULL, '{"allows_virtual_table_explore":true}', false, false, true, NULL, false, false, NULL, false, false, '\x6d6e34437051424d544e4b4f664c416779724c5678673d3d', NULL, false, '5c5fe96b-cce6-43c9-a569-3309c8d5b225', 'dynamic_form', false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3736 (class 0 OID 16518)
-- Dependencies: 235
-- Data for Name: dynamic_plugin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3738 (class 0 OID 16526)
-- Dependencies: 237
-- Data for Name: embedded_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3739 (class 0 OID 16532)
-- Dependencies: 238
-- Data for Name: favstar; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3741 (class 0 OID 16537)
-- Dependencies: 240
-- Data for Name: filter_sets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3743 (class 0 OID 16545)
-- Dependencies: 242
-- Data for Name: key_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.key_value VALUES (1, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', 'f62e7ed5-4f79-32a0-a9e6-16a643d8881b', '2023-12-04 20:01:52.438559', 1, NULL, NULL, '2024-03-03 20:01:52.437507') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (2, 'superset_metastore_cache', '\x2232626b4d35757a6e7833377a5f3051427171554a36554e364461326956316d745f4253694a554a42575f636a7569784455634436787351323942594c6378684f22', '93741617-0cd7-37a3-987b-b184bc927940', '2023-12-04 20:01:52.445551', 1, NULL, NULL, '2024-03-03 20:01:52.444307') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (4, 'superset_metastore_cache', '\x22745a4770646a386577586f3465585031594b5a584e4c686c76543070356b304e49496e58434c367063766c4b435644686371767330634e74547055456977634a22', '0246d6e6-c48a-3b87-a325-8646f4d7bdbb', '2023-12-04 20:02:28.474469', 1, NULL, NULL, '2023-12-11 20:02:28.473487') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (3, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c22325f5f71756572795c222c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c225d7d227d', 'f8ab5ed1-ffe7-39ff-846b-2d1bc6d66651', '2023-12-04 20:02:28.457016', 1, '2023-12-04 20:02:29.484415', 1, '2023-12-11 20:02:29.479318') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (5, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f71756572795c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', 'e8e1454e-d5e0-36d9-8a50-0c4f37ab3d60', '2023-12-04 20:02:31.081539', 1, NULL, NULL, '2023-12-11 20:02:31.080388') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (6, 'superset_metastore_cache', '\x2246445657376c7674744f7863395853694a5a504443645368315647327a4e556942557968666f6170334b424e7a2d76564e374446446f7a78664d504e612d775122', '23df1f4b-d4bb-3391-8f43-869bf9f8ccdb', '2023-12-04 20:02:31.090173', 1, NULL, NULL, '2023-12-11 20:02:31.089198') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (8, 'superset_metastore_cache', '\x224164774a50544f32544978617a686766345f424f6c7750466741624e6c683737796e3854536d37716c68636972364f6453396b64664f73686e7a3070514a784922', '09975331-a17f-312c-a651-ca016390a7ae', '2023-12-04 20:02:42.737665', 1, NULL, NULL, '2023-12-11 20:02:42.736751') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (7, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c226164686f635f66696c746572735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c225d2c5c226170706c6965645f74696d655f6578747261735c223a7b7d2c5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c227d227d', 'de8fb68b-3804-3597-87db-13a6c18bc60a', '2023-12-04 20:02:42.72481', 1, '2023-12-04 20:02:43.616793', 1, '2023-12-11 20:02:43.615018') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (9, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '470fdec0-1d46-333e-a71d-6c4fdd8545d0', '2023-12-04 20:02:45.17078', 1, NULL, NULL, '2023-12-11 20:02:45.169878') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (10, 'superset_metastore_cache', '\x22344b643234744648436744447046696b525f3830327a3232525552316b30522d366b41484f5f5953547153656d6a5a364458743068356148726147686f48445822', 'ef78d71a-6add-33a4-b1e0-06a02b9e042f', '2023-12-04 20:02:45.175579', 1, NULL, NULL, '2023-12-11 20:02:45.173994') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (12, 'superset_metastore_cache', '\x22654f615249554659316969484c5771765a50736575567a617642476e455476597a315278626934424f6e442d5a436c477742344245376c72324b3664564a505722', '73d58b02-fecb-3ca1-9ff8-0cc415c5116d', '2023-12-04 20:04:59.476169', 1, NULL, NULL, '2023-12-11 20:04:59.473594') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (11, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c22355f5f71756572795c222c5c22616c6c5f636f6c756d6e735c223a5b5c22757365725c222c5c2274735c225d7d227d', 'ef2fb1be-641d-3fda-8a2c-63b4f8130c5c', '2023-12-04 20:04:59.461462', 1, '2023-12-04 20:05:00.313914', 1, '2023-12-11 20:05:00.312671') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (13, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f71756572795c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c22757365725c222c5c2274735c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '497922d8-2fcc-3563-9175-8530ae083e7a', '2023-12-04 20:05:01.552626', 1, NULL, NULL, '2023-12-11 20:05:01.55088') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (14, 'superset_metastore_cache', '\x225a77735932725356434d416a2d7949644c376f454b4c49596d456b396b6c70344c446b664e454457457378664e4c3952314e44785978525f51394e513650684622', '17b87448-f87b-37ad-a0be-b849f93fb070', '2023-12-04 20:05:01.558951', 1, NULL, NULL, '2023-12-11 20:05:01.55755') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (16, 'superset_metastore_cache', '\x227250684431336351784558795f455068475071567144573669314b6a736f7369526a5779766158555f30525663682d4b38755457797671636d6e54636939523522', '12b1392c-2e1c-3704-b850-58bdac10d672', '2023-12-04 20:05:22.749901', 1, NULL, NULL, '2023-12-11 20:05:22.749095') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (15, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c226164686f635f66696c746572735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c22757365725c222c5c2274735c225d2c5c226170706c6965645f74696d655f6578747261735c223a7b7d2c5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c227d227d', '696e7de1-94bb-370f-8842-9c2e77272112', '2023-12-04 20:05:22.745985', 1, '2023-12-04 20:05:23.475324', 1, '2023-12-11 20:05:23.474168') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (17, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c22757365725c222c5c2274735c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '6cfbdf1f-a10d-37d7-9618-6eedca682f40', '2023-12-04 20:05:24.727073', 1, NULL, NULL, '2023-12-11 20:05:24.724123') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (18, 'superset_metastore_cache', '\x227257794d747a6d34764a51457753495a65595068446379314f6167666c35454850754858535a466c705277706972456541474c397a72746647776d754838795422', '7228a16e-74cf-3628-8480-e7fe90ea9710', '2023-12-04 20:05:24.749731', 1, NULL, NULL, '2023-12-11 20:05:24.74764') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (20, 'superset_metastore_cache', '\x2275347773764d37524d522d644735796d7743416e5a4e416164524d62624d64636958584a47346253434e315859564639553274315362744339653461385f6d5522', 'aeae202a-6e73-3af1-bf92-7848b996d520', '2023-12-04 20:22:08.951217', 1, NULL, NULL, '2023-12-11 20:22:08.949531') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (24, 'superset_metastore_cache', '\x2258626f30444868304c4a7a50544c75765470434348422d70626468446a7337746a385f45496b7a61765a6550686867637441716a3959794a4842415a556c327922', '14cb5851-7d5d-3b8f-9466-8c74896e440b', '2023-12-04 20:25:57.652516', 1, NULL, NULL, '2023-12-11 20:25:57.651371') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (28, 'superset_metastore_cache', '\x225f685669396844575847423133635a6b594665544738375661706646365f3557666a502d784a66704e4a6e72556469634343326d747a656c3438575f72584d4822', '2a8b61b6-c97c-3259-b4b9-3d5056ebff7d', '2023-12-04 20:26:08.100686', 1, NULL, NULL, '2023-12-11 20:26:08.099747') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (30, 'superset_metastore_cache', '\x227a5a7a4135523144685334704c6f666c55515f796a535249786464362d50586663416f6770565535757149586a384749503547305134584233337a766a75756a22', 'f3b96415-072a-3e2b-a230-1603e83c0991', '2023-12-04 20:26:10.473958', 1, NULL, NULL, '2023-12-11 20:26:10.472689') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (34, 'superset_metastore_cache', '\x2252572d36796975705f4e574652324c4872634a46656d3452636b51466c5a6661337658677465542d7063656276514b6e4c31704a697132704f714336374e6a6a22', '92dfcd74-680c-3e4e-bd82-3499f0274d5f', '2023-12-04 20:29:01.415815', 1, NULL, NULL, '2023-12-11 20:29:01.414763') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (32, 'superset_metastore_cache', '\x224b6d4935336c3750537033585767615f5761306e326641515a674d5f6652523830777969496b3362367a7842554b4334384b785773426d577356456832726b4d22', '14659701-210e-3410-b764-75981d80c1fa', '2023-12-04 20:28:11.967469', 1, '2023-12-04 20:29:24.084716', 1, '2024-03-03 20:29:24.083196') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (89, 'superset_metastore_cache', '\x22796b56424c797a3437653131325a4e5751326e7236717542306c617548306376527a6159533556444f2d4749304c345f5546496a30547147556f30316e37433322', '5ddb9b14-d814-35ba-a32a-962a06551e39', '2023-12-07 21:51:12.344298', 1, '2023-12-07 22:00:28.685095', 1, '2023-12-14 22:00:28.682538') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (19, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20322c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22325f5f7461626c655c222c5c2276697a5f747970655c223a5c22656368617274735f74696d657365726965735f736d6f6f74685c222c5c22785f617869735c223a5c2274735c222c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c22785f617869735f736f72745f6173635c223a747275652c5c22785f617869735f736f72745f7365726965735c223a5c226e616d655c222c5c22785f617869735f736f72745f7365726965735f617363656e64696e675c223a747275652c5c226d6574726963735c223a5b7b5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c226368616e6765645f6f6e5c223a5c22323032332d31322d30345432303a32323a31372e3735353530365c222c5c22636f6c756d6e5f6e616d655c223a5c22636f756e745f636c69636b735c222c5c22637265617465645f6f6e5c223a5c22323032332d31322d30345432303a32323a31372e3735353439395c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2265787472615c223a5c227b7d5c222c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a31372c5c2269735f6163746976655c223a747275652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c224c4f4e47494e54454745525c222c5c22747970655f67656e657269635c223a302c5c22757569645c223a5c2233646463373132372d373063382d346630332d626630312d3963306364383965393337665c222c5c22766572626f73655f6e616d655c223a6e756c6c7d2c5c226167677265676174655c223a5c224156475c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c22686173437573746f6d4c6162656c5c223a747275652c5c226c6162656c5c223a5c225c75303431615c75303433655c75303433625c75303433385c75303434375c75303433355c75303434315c75303434325c75303433325c7530343365205c75303433615c75303433625c75303433385c75303433615c75303433655c75303433325c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f77696c7969727561376e645f7a723336397a793832705c227d5d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f646573635c223a747275652c5c22726f775f6c696d69745c223a31303030302c5c227472756e636174655f6d65747269635c223a747275652c5c2273686f775f656d7074795f636f6c756d6e735c223a747275652c5c22726f6c6c696e675f747970655c223a6e756c6c2c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c22616e6e6f746174696f6e5f6c61796572735c223a5b5d2c5c22666f726563617374506572696f64735c223a31302c5c22666f726563617374496e74657276616c5c223a302e382c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22736f72745f7365726965735f747970655c223a5c2273756d5c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226f6e6c795f746f74616c5c223a747275652c5c226d61726b657253697a655c223a362c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c22785f617869735f74696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c22726963685f746f6f6c7469705c223a747275652c5c22746f6f6c74697054696d65466f726d61745c223a5c22736d6172745f646174655c222c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22795f617869735f626f756e64735c223a5b6e756c6c2c6e756c6c5d2c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '96151ade-943e-3490-8edc-6b194b7239c6', '2023-12-04 20:22:08.938421', 1, '2023-12-04 20:24:24.164875', 1, '2023-12-11 20:24:24.162483') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (21, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '45f85409-b180-3979-bc55-225e8e0edee8', '2023-12-04 20:24:36.408099', 1, NULL, NULL, '2024-03-03 20:24:36.405186') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (22, 'superset_metastore_cache', '\x22416f51695146625775396151765942776856776f3164555341353175783575484779377535387a4b72386b475a76553651567350654a7242676659476974694522', 'f7af6d12-15ce-39b7-9c7e-4bd489e74628', '2023-12-04 20:24:36.425765', 1, NULL, NULL, '2024-03-03 20:24:36.422617') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (23, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20372c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c22375f5f71756572795c222c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c225d7d227d', '1313e6ee-205d-32ed-9c61-67372f06e64c', '2023-12-04 20:25:57.646883', 1, '2023-12-04 20:25:58.493567', 1, '2023-12-11 20:25:58.492431') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (25, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20372c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22375f5f71756572795c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', 'fd6efb6f-aeed-351b-baae-7d53813bbb01', '2023-12-04 20:25:59.998789', 1, NULL, NULL, '2023-12-11 20:25:59.997904') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (26, 'superset_metastore_cache', '\x22637167375a5036675078545f703172343773306930336c4a35736f743531414d794b4b4a723755384e42346d577544367458633030343242694d656d786a596222', '38491a27-66d9-3043-8864-d69ffc466a47', '2023-12-04 20:26:00.007268', 1, NULL, NULL, '2023-12-11 20:26:00.006323') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (27, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20332c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c226164686f635f66696c746572735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c225d2c5c226170706c6965645f74696d655f6578747261735c223a7b7d2c5c2264617461736f757263655c223a5c22335f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c227d227d', '62214478-82c4-36e5-a3ce-402a0115c035', '2023-12-04 20:26:08.096144', 1, '2023-12-04 20:26:08.918409', 1, '2023-12-11 20:26:08.917177') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (29, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20332c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22335f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c226167677265676174655c222c5c2267726f757062795c223a5b5c22757365725c225d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b7b5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c2263657274696669636174696f6e5f64657461696c735c223a6e756c6c2c5c226365727469666965645f62795c223a6e756c6c2c5c22636f6c756d6e5f6e616d655c223a5c22746e5c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a32312c5c2269735f6365727469666965645c223a66616c73652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22464c4f41545c222c5c22747970655f67656e657269635c223a302c5c22766572626f73655f6e616d655c223a6e756c6c2c5c227761726e696e675f6d61726b646f776e5c223a6e756c6c7d2c5c226167677265676174655c223a5c2253554d5c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c22686173437573746f6d4c6162656c5c223a747275652c5c226c6162656c5c223a5c225c75303431615c75303433655c75303433625c75303433385c75303434375c75303433355c75303434315c75303434325c75303433325c7530343365205c75303433615c75303433625c75303433385c75303433615c75303433655c75303433325c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f7467396366316c3639775f776a6f3631356c343369665c227d5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '722918f4-8910-38ed-b7ce-cc7eb2ed30af', '2023-12-04 20:26:10.467977', 1, '2023-12-04 20:26:46.068424', 1, '2023-12-11 20:26:46.067058') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (31, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '4a66aa98-9a84-3993-808a-4f81c7e894b1', '2023-12-04 20:28:11.957584', 1, '2023-12-04 20:29:24.078576', 1, '2024-03-03 20:29:24.077079') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (33, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20332c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a20322c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22335f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c222c5c22736c6963655f69645c223a322c5c2271756572795f6d6f64655c223a5c226167677265676174655c222c5c2267726f757062795c223a5b7b5c226c6162656c5c223a5c225c75303431665c75303433655c75303433625c75303434635c75303433375c75303433655c75303433325c75303433305c75303434325c75303433355c75303433625c75303434635c222c5c2273716c45787072657373696f6e5c223a5c225c5c5c22757365725c5c5c225c222c5c2265787072657373696f6e547970655c223a5c2253514c5c227d5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b7b5c226167677265676174655c223a5c2253554d5c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c2263657274696669636174696f6e5f64657461696c735c223a6e756c6c2c5c226365727469666965645f62795c223a6e756c6c2c5c22636f6c756d6e5f6e616d655c223a5c22746e5c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a32312c5c2269735f6365727469666965645c223a66616c73652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22464c4f41545c222c5c22747970655f67656e657269635c223a302c5c22766572626f73655f6e616d655c223a6e756c6c2c5c227761726e696e675f6d61726b646f776e5c223a6e756c6c7d2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22686173437573746f6d4c6162656c5c223a747275652c5c226c6162656c5c223a5c225c75303431615c75303433655c75303433625c75303433385c75303434375c75303433355c75303434315c75303434325c75303433325c7530343365205c75303433615c75303433625c75303433385c75303433615c75303433655c75303433325c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f7467396366316c3639775f776a6f3631356c343369665c222c5c2273716c45787072657373696f6e5c223a6e756c6c7d5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d2c5c2264617368626f61726449645c223a317d227d', '354df7aa-a4be-364d-9d89-ee1679e8f801', '2023-12-04 20:29:01.410001', 1, '2023-12-04 20:29:21.347892', 1, '2023-12-11 20:29:21.345792') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (36, 'superset_metastore_cache', '\x2257437a566b3677616277796d576961724a694a625f39357962703730306448705849787a706e507955642d44797170493943492d67706b424c4c6a695f74443722', 'd35ef3d3-2071-364e-8b80-1ed5e9d24b47', '2023-12-04 20:51:28.715013', 1, NULL, NULL, '2023-12-11 20:51:28.713832') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (35, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20392c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c22395f5f71756572795c222c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c225d7d227d', '39214b2b-fad7-3aae-912f-711cab20a5f1', '2023-12-04 20:51:28.705386', 1, '2023-12-04 20:51:29.796673', 1, '2023-12-11 20:51:29.795347') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (37, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20392c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22395f5f71756572795c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '370682a9-1ad0-337d-8f07-cb8bc367b402', '2023-12-04 20:51:32.102327', 1, NULL, NULL, '2023-12-11 20:51:32.099149') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (38, 'superset_metastore_cache', '\x22796d736b5a68397266704b6e5a5f4769493335346e4d7763774b7472305476516c5746324e637475466e487a7a2d6873616c7a477268766d3659506b796c726d22', '4c54cc04-1e4d-3ca0-aa25-8d4384c0fb65', '2023-12-04 20:51:32.119662', 1, NULL, NULL, '2023-12-11 20:51:32.117319') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (40, 'superset_metastore_cache', '\x224f715376466168752d7a5a5f4b61667737546c414935584d42397851484c776a6e7941624154503148775130517133323647504b326f7a6d6f396e624169673622', 'f872ecdd-eb7f-34c6-8513-74ead37a96d3', '2023-12-04 20:51:59.128208', 1, NULL, NULL, '2023-12-11 20:51:59.126403') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (39, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20342c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c226164686f635f66696c746572735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c225d2c5c226170706c6965645f74696d655f6578747261735c223a7b7d2c5c2264617461736f757263655c223a5c22345f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c227d227d', '0aec4fd2-bb6a-3e35-a6a3-ebae33e054ba', '2023-12-04 20:51:59.122327', 1, '2023-12-04 20:52:00.100413', 1, '2023-12-11 20:52:00.098946') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (41, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20342c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22345f5f7461626c655c222c5c2276697a5f747970655c223a5c22626f785f706c6f745c222c5c22636f6c756d6e735c223a5b6e756c6c5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c22776869736b65724f7074696f6e735c223a5c2254756b65795c222c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c22785f7469636b735f6c61796f75745c223a5c226175746f5c222c5c226e756d6265725f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22646174655f666f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '91601666-eb81-35c7-9776-00bbb7aa12e8', '2023-12-04 20:52:01.760619', 1, '2023-12-04 20:53:04.685541', 1, '2023-12-11 20:53:04.684441') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (42, 'superset_metastore_cache', '\x227741612d73616f7a364c6744774d424574377767347a557a654c7273616e516d567834555862564c6a43495f624845546c6c4b6c716f6c336b644a3039736a7822', '2ec1ac0f-530f-3c87-ae6e-792059e8405b', '2023-12-04 20:52:01.766558', 1, '2023-12-04 20:53:04.689879', 1, '2023-12-11 20:53:04.688846') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (45, 'superset_metastore_cache', '\x2276674d4275594a445a4f4d6e374758426b48384f3159755943374c68716f7a66375a61775632324f5f486e46447a4d44554975686b56322d6747775f59566e4e22', 'cfecef8d-aa5f-33e4-b404-15e0c116659d', '2023-12-04 20:54:10.908558', 1, NULL, NULL, '2023-12-11 20:54:10.907153') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (43, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '88d8f242-508a-30f2-b1bb-592f0f7e447a', '2023-12-04 20:52:39.000524', 1, '2023-12-04 20:59:00.079389', 1, '2024-03-03 20:59:00.078474') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (44, 'superset_metastore_cache', '\x227776586941372d38674c706b4d5a4a2d766b6e676f554c71536d397663785867474b6c795f61494e3650316e733952445241464e6e67764a6274394e5177545322', 'dd1e8f45-0f2b-33da-b14e-c853751e99cf', '2023-12-04 20:52:39.005529', 1, '2023-12-04 20:59:00.083311', 1, '2024-03-03 20:59:00.082444') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (46, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20312c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22315f5f7461626c655c222c5c2276697a5f747970655c223a5c22656368617274735f74696d657365726965735f6261725c222c5c22785f617869735c223a7b5c226c6162656c5c223a5c225c75303432325c75303433385c7530343366205c75303434335c75303434315c75303434325c75303434305c75303433655c75303433395c75303434315c75303434325c75303433325c75303433305c222c5c2273716c45787072657373696f6e5c223a5c225c5c5c22646576747970655c5c5c225c222c5c2265787072657373696f6e547970655c223a5c2253514c5c227d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c22785f617869735f736f72745f6173635c223a747275652c5c22785f617869735f736f72745f7365726965735c223a5c226e616d655c222c5c22785f617869735f736f72745f7365726965735f617363656e64696e675c223a747275652c5c226d6574726963735c223a5b7b5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c226368616e6765645f6f6e5c223a5c22323032332d31322d30345432303a30323a34322e3634393839335c222c5c22636f6c756d6e5f6e616d655c223a5c22757365725c222c5c22637265617465645f6f6e5c223a5c22323032332d31322d30345432303a30323a34322e3634393839315c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2265787472615c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a332c5c2269735f6163746976655c223a747275652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22464c4f41545c222c5c22747970655f67656e657269635c223a302c5c22757569645c223a5c2230353161323337392d393665652d343162352d396166342d6161363633393365643937625c222c5c22766572626f73655f6e616d655c223a6e756c6c7d2c5c226167677265676174655c223a5c22434f554e545f44495354494e43545c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c22686173437573746f6d4c6162656c5c223a747275652c5c226c6162656c5c223a5c225c75303431615c75303433655c75303433625c75303433385c75303434375c75303433355c75303434315c75303434325c75303433325c7530343365205c75303433665c75303433655c75303433625c75303434635c75303433375c75303433655c75303433325c75303433305c75303434325c75303433355c75303433625c75303433355c75303433395c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f357334397935646771306d5f35327430693375353033385c227d5d2c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f646573635c223a747275652c5c22726f775f6c696d69745c223a31303030302c5c227472756e636174655f6d65747269635c223a747275652c5c2273686f775f656d7074795f636f6c756d6e735c223a747275652c5c22636f6d70617269736f6e5f747970655c223a5c2276616c7565735c222c5c22616e6e6f746174696f6e5f6c61796572735c223a5b5d2c5c22666f726563617374506572696f64735c223a31302c5c22666f726563617374496e74657276616c5c223a302e382c5c226f7269656e746174696f6e5c223a5c22766572746963616c5c222c5c22785f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f6d617267696e5c223a31352c5c22795f617869735f7469746c655f706f736974696f6e5c223a5c224c6566745c222c5c22736f72745f7365726965735f747970655c223a5c2273756d5c222c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226f6e6c795f746f74616c5c223a747275652c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e64547970655c223a5c227363726f6c6c5c222c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c22785f617869735f74696d655f666f726d61745c223a5c22736d6172745f646174655c222c5c22795f617869735f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c22795f617869735f626f756e64735c223a5b6e756c6c2c6e756c6c5d2c5c22726963685f746f6f6c7469705c223a747275652c5c22746f6f6c74697054696d65466f726d61745c223a5c22736d6172745f646174655c222c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '9ae7d244-6ba5-3cd0-849a-f74f089f4417', '2023-12-04 20:54:10.926991', 1, '2023-12-04 20:58:39.098056', 1, '2023-12-11 20:58:39.094987') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (47, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '01403e21-c121-3551-adf8-a819a85cfb67', '2023-12-04 21:06:07.013667', 1, NULL, NULL, '2024-03-03 21:06:07.012639') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (48, 'superset_metastore_cache', '\x223759746b4c4a5153424e797368756a6c64772d796b35464a6d626a584d714c5530534c4662374d486579785964644453787857744b545845793538682d53724722', '20a75759-3629-380a-8775-987cbb9e25c6', '2023-12-04 21:06:07.018722', 1, NULL, NULL, '2024-03-03 21:06:07.017481') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (49, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '678ce8d8-ba97-3851-b8a3-6a9fb26e2f49', '2023-12-04 21:33:51.971875', 1, NULL, NULL, '2024-03-03 21:33:51.971015') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (50, 'superset_metastore_cache', '\x224c6357765f757a617649793935754566625449653078627a62474d394b596a6c746f735f4e3059374d4a5743643830777666775774394b78393144676453766f22', '9a7927fd-7c0b-3ae8-b9e8-73a1e0401f36', '2023-12-04 21:33:51.980031', 1, NULL, NULL, '2024-03-03 21:33:51.978829') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (83, 'superset_metastore_cache', '\x223241314a44435371674f47366c6479796879706869454e384e7236736b4a33616751444f615357655039305a4c543732695948537973594e587675626b324e6622', '65499a01-5388-3adf-9659-1da747e17ccc', '2023-12-07 21:50:54.381407', 1, NULL, NULL, '2023-12-14 21:50:54.380371') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (82, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a2031322c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c2264617461736f757263655c223a5c2231325f5f71756572795c222c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c222c5c22636c6173735c225d7d227d', '7550a912-1681-36c7-82a9-c87d75559af9', '2023-12-07 21:50:54.373722', 1, '2023-12-07 21:50:55.183854', 1, '2023-12-14 21:50:55.182371') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (84, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a2031322c202264617461736f757263655f74797065223a20227175657279222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c2231325f5f71756572795c222c5c2276697a5f747970655c223a5c227461626c655c222c5c2271756572795f6d6f64655c223a5c227261775c222c5c2267726f757062795c223a5b5d2c5c2274696d655f677261696e5f73716c615c223a5c225031445c222c5c2274656d706f72616c5f636f6c756d6e735f6c6f6f6b75705c223a7b7d2c5c226d6574726963735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c222c5c22636c6173735c225d2c5c2270657263656e745f6d6574726963735c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c226f726465725f62795f636f6c735c223a5b5d2c5c22726f775f6c696d69745c223a313030302c5c227365727665725f706167655f6c656e6774685c223a31302c5c226f726465725f646573635c223a747275652c5c227461626c655f74696d657374616d705f666f726d61745c223a5c22736d6172745f646174655c222c5c2273686f775f63656c6c5f626172735c223a747275652c5c22636f6c6f725f706e5c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '564df609-425e-3343-9319-236960418485', '2023-12-07 21:50:56.815998', 1, NULL, NULL, '2023-12-14 21:50:56.815035') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (85, 'superset_metastore_cache', '\x2275694a374e34395045763543485f484c576f48584c56525768377a79366442384265765a5a4233425477675877505a6d4f454c56755062413931305f6143415822', '46da1fa4-c1b1-3e7a-8c9c-be6ced1923a6', '2023-12-07 21:50:56.821453', 1, NULL, NULL, '2023-12-14 21:50:56.819793') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (87, 'superset_metastore_cache', '\x2238666a7935392d38453236435f48487764694f2d72536f3630515f754a7331793936555776496d4841524d72484376715956693047795836713445313966707a22', 'b853d3bb-e26e-3b71-9a17-8352ac3d88a9', '2023-12-07 21:51:09.801584', 1, NULL, NULL, '2023-12-14 21:51:09.80067') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (86, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c226d6574726963735c223a5b5d2c5c2267726f757062795c223a5b5d2c5c2274696d655f72616e67655c223a5c224e6f2066696c7465725c222c5c22726f775f6c696d69745c223a313030302c5c226164686f635f66696c746572735c223a5b5d2c5c22616c6c5f636f6c756d6e735c223a5b5c226569645c222c5c22745c222c5c22757365725c222c5c22746e5c222c5c2267656f5c222c5c22636e6574686173685c222c5c22646576747970655c222c5c2262726f747970655c222c5c226273697a655c222c5c227369746569645c222c5c22646f6d686173685c222c5c2275726c686173685c222c5c226475726174696f6e5c222c5c22666c675c222c5c226c6f675f6475726174696f6e5c222c5c22636c6173735c225d2c5c226170706c6965645f74696d655f6578747261735c223a7b7d2c5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c227461626c655c227d227d', '7fad9cb7-290e-3275-937e-f3c55ebc8616', '2023-12-07 21:51:09.79729', 1, '2023-12-07 21:51:10.579711', 1, '2023-12-14 21:51:10.578581') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (90, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b7d227d', '1c86ebf2-a12c-373b-878d-3506efaf8a27', '2023-12-07 21:59:54.522442', 1, NULL, NULL, '2024-03-06 21:59:54.520566') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (91, 'superset_metastore_cache', '\x226873743568766e74544331504e396779483958375a616359574a63457732322d61424b59725464364935726c74716c3172753379767838742d71764365745a3622', 'd4be3d35-49f9-3121-9e93-d44257aab004', '2023-12-07 21:59:54.526743', 1, NULL, NULL, '2024-03-06 21:59:54.525828') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (88, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c22686973746f6772616d5c222c5c22616c6c5f636f6c756d6e735f785c223a5b5c226475726174696f6e5c225d2c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31303030302c5c2267726f757062795c223a5b5d2c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226c696e6b5f6c656e6774685c223a352c5c2273686f775f6c6567656e645c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '6c5d9132-e0f6-333f-879c-8927ad06801e', '2023-12-07 21:51:12.333377', 1, '2023-12-07 22:01:00.059683', 1, '2023-12-14 22:01:00.058244') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (93, 'superset_metastore_cache', '\x226e37325578764d7a304738393466493861426d6d6862796a4d573931384b45514a334a4f745370474d6a62505f52765351635236765541504a7850586870587122', '4073710f-413d-39e1-82c4-2e21974a803f', '2023-12-07 22:05:20.123779', 1, NULL, NULL, '2023-12-14 22:05:20.121579') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (92, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c22686973746f6772616d5c222c5c22616c6c5f636f6c756d6e735f785c223a5b5c226475726174696f6e5c225d2c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31303030302c5c2267726f757062795c223a5b5d2c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c226c696e6b5f6c656e6774685c223a352c5c2273686f775f6c6567656e645c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', 'e05d5725-0479-3ae5-8fda-363ad738fe54', '2023-12-07 22:05:20.113308', 1, '2023-12-07 22:05:48.054166', 1, '2023-12-14 22:05:48.053151') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (125, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20352c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22355f5f7461626c655c222c5c2276697a5f747970655c223a5c2266756e6e656c5c222c5c2267726f757062795c223a5b5d2c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31302c5c22736f72745f62795f6d65747269635c223a747275652c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c2273686f775f6c6567656e645c223a747275652c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c226e756d6265725f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c2273686f775f6c6162656c735c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', '68801597-ea73-3f99-99c1-ba4f3fd05dda', '2023-12-07 22:11:14.158488', 1, NULL, NULL, '2023-12-14 22:11:14.157416') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (126, 'superset_metastore_cache', '\x224b785a554561387534544469632d69314251793177443276413641664146416e45393557656e654d325839527639325a54626c58324a6564394d5f64694c657622', '6ca5e319-e0a3-393d-b46d-f0f521e89100', '2023-12-07 22:11:14.167282', 1, NULL, NULL, '2023-12-14 22:11:14.164673') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (127, 'superset_metastore_cache', '\x2264356d5865436443396d38324c2d4954795652475556576c646a314e51476a7553456b69484248544b7a63425735656f61645a4575656b51755464766e34414322', 'b016dfdd-ac90-398b-b82c-cc7faa72a861', '2023-12-07 22:12:31.846985', 1, NULL, NULL, '2023-12-14 22:12:31.84541') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (130, 'superset_metastore_cache', '\x2238544361446859464f6c63502d7374697564522d74477054735a36774136653070615166326a78467447473041676c6d76695a6561456f4d5a764b775735502d22', '6148ca55-2940-32ae-92f6-ff066b802e90', '2023-12-07 22:14:33.969288', 1, '2023-12-07 22:16:40.102727', 1, '2024-03-06 22:16:40.101438') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (128, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202264617461736f757263655f6964223a20332c202264617461736f757263655f74797065223a20227461626c65222c202263686172745f6964223a206e756c6c2c2022666f726d5f64617461223a20227b5c2264617461736f757263655c223a5c22335f5f7461626c655c222c5c2276697a5f747970655c223a5c2266756e6e656c5c222c5c2267726f757062795c223a5b7b5c226c6162656c5c223a5c22746e5c222c5c2273716c45787072657373696f6e5c223a5c2263617365207768656e20746e203d2031207468656e20275c75303431615c75303433625c75303433385c75303433615c75303433382720656c736520275c75303431665c75303433655c75303433615c75303433305c75303433375c75303433305c75303433645c7530343330205c75303434305c75303433355c75303433615c75303433625c75303433305c75303433635c75303433302720656e645c222c5c2265787072657373696f6e547970655c223a5c2253514c5c227d5d2c5c226d65747269635c223a7b5c2265787072657373696f6e547970655c223a5c2253494d504c455c222c5c22636f6c756d6e5c223a7b5c22616476616e6365645f646174615f747970655c223a6e756c6c2c5c226368616e6765645f6f6e5c223a5c22323032332d31322d30345432303a32363a30382e3032373935315c222c5c22636f6c756d6e5f6e616d655c223a5c22757365725c222c5c22637265617465645f6f6e5c223a5c22323032332d31322d30345432303a32363a30382e3032373934395c222c5c226465736372697074696f6e5c223a6e756c6c2c5c2265787072657373696f6e5c223a6e756c6c2c5c2265787472615c223a6e756c6c2c5c2266696c74657261626c655c223a747275652c5c2267726f757062795c223a747275652c5c2269645c223a32302c5c2269735f6163746976655c223a747275652c5c2269735f6474746d5c223a66616c73652c5c22707974686f6e5f646174655f666f726d61745c223a6e756c6c2c5c22747970655c223a5c22464c4f41545c222c5c22747970655f67656e657269635c223a302c5c22757569645c223a5c2263363263616131662d386537382d343231642d383438352d3363626364643466396637375c222c5c22766572626f73655f6e616d655c223a6e756c6c7d2c5c226167677265676174655c223a5c22434f554e545f44495354494e43545c222c5c2273716c45787072657373696f6e5c223a6e756c6c2c5c2264617461736f757263655761726e696e675c223a66616c73652c5c22686173437573746f6d4c6162656c5c223a66616c73652c5c226c6162656c5c223a5c22434f554e545f44495354494e43542875736572295c222c5c226f7074696f6e4e616d655c223a5c226d65747269635f346730336e6b38667876385f6d6f73733770677337365c227d2c5c226164686f635f66696c746572735c223a5b5d2c5c22726f775f6c696d69745c223a31302c5c22736f72745f62795f6d65747269635c223a747275652c5c22636f6c6f725f736368656d655c223a5c227375706572736574436f6c6f72735c222c5c2273686f775f6c6567656e645c223a66616c73652c5c226c6567656e644f7269656e746174696f6e5c223a5c22746f705c222c5c226c6567656e644d617267696e5c223a6e756c6c2c5c226e756d6265725f666f726d61745c223a5c22534d4152545f4e554d4245525c222c5c2273686f775f6c6162656c735c223a747275652c5c2265787472615f666f726d5f646174615c223a7b7d7d227d', 'c6b1e96a-9e2a-3c59-9371-d75ee08bf421', '2023-12-07 22:12:31.857978', 1, '2023-12-07 22:14:20.798443', 1, '2023-12-14 22:14:20.796894') ON CONFLICT DO NOTHING;
INSERT INTO public.key_value VALUES (129, 'superset_metastore_cache', '\x7b226f776e6572223a20312c202276616c7565223a20227b5c224e41544956455f46494c5445522d65637a4c6d65754b6d5c223a7b5c2269645c223a5c224e41544956455f46494c5445522d65637a4c6d65754b6d5c222c5c226578747261466f726d446174615c223a7b7d2c5c2266696c74657253746174655c223a7b5c2276616c75655c223a6e756c6c7d2c5c226f776e53746174655c223a7b7d2c5c22636f6e74726f6c56616c7565735c223a7b5c22656e61626c65456d70747946696c7465725c223a66616c73652c5c2264656661756c74546f46697273744974656d5c223a66616c73652c5c226d756c746953656c6563745c223a747275652c5c22736561726368416c6c4f7074696f6e735c223a66616c73652c5c22696e766572736553656c656374696f6e5c223a66616c73657d2c5c226e616d655c223a5c225c75303433335c75303433355c75303433655c75303433665c75303433655c75303433375c75303433385c75303434365c75303433385c75303434665c222c5c2266696c746572547970655c223a5c2266696c7465725f73656c6563745c222c5c22746172676574735c223a5b7b5c226461746173657449645c223a332c5c22636f6c756d6e5c223a7b5c226e616d655c223a5c227369746569645c227d7d5d2c5c2264656661756c74446174614d61736b5c223a7b5c226578747261466f726d446174615c223a7b7d2c5c2266696c74657253746174655c223a7b7d2c5c226f776e53746174655c223a7b7d7d2c5c2263617363616465506172656e744964735c223a5b5d2c5c2273636f70655c223a7b5c22726f6f74506174685c223a5b5c22524f4f545f49445c225d2c5c226578636c756465645c223a5b5d7d2c5c22747970655c223a5c224e41544956455f46494c5445525c222c5c226465736372697074696f6e5c223a5c225c222c5c22636861727473496e53636f70655c223a5b312c322c332c342c352c365d2c5c2274616273496e53636f70655c223a5b5d7d7d227d', 'a8d47f0a-f144-3d18-9e86-e26125225f8b', '2023-12-07 22:14:33.961294', 1, '2023-12-07 22:16:40.097476', 1, '2024-03-06 22:16:40.09579') ON CONFLICT DO NOTHING;


--
-- TOC entry 3745 (class 0 OID 16553)
-- Dependencies: 244
-- Data for Name: keyvalue; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3747 (class 0 OID 16561)
-- Dependencies: 246
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3749 (class 0 OID 16569)
-- Dependencies: 248
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.query VALUES (1, 'mVNTI1oxje', 1, NULL, '', NULL, 1, 'success', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash,
       duration,
       flg
FROM public.user_duration
LIMIT 100', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash,
       duration,
       flg
FROM public.user_duration
LIMIT 101', 100, false, false, 100, 100, NULL, 1701720143644.660000, '2023-12-04 20:02:23.947822', 1701720143942.883000, 'b4b6560a-4575-4d70-b585-baa726c27824', 1701720143700.359100, NULL, NULL, '{"cancel_query": 303, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "flg", "name": "flg", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'QUERY') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (2, 'm4TpMu7H5', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from user_duration ', NULL, 'SELECT * from user_duration
LIMIT 1001', 1000, false, false, 100, 1000, NULL, 1701720146906.750000, '2023-12-04 20:02:26.992135', 1701720146986.820000, '1aa0c9c1-189c-43d8-831d-09bb360266cb', 1701720146937.274000, NULL, NULL, '{"cancel_query": 311, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "flg", "name": "flg", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'DROPDOWN') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (3, '-ytXAVhPIP', 1, NULL, '', NULL, 1, 'success', NULL, 'SELECT "user",
       ts
FROM public.click_dynamics
LIMIT 100', NULL, 'SELECT "user",
       ts
FROM public.click_dynamics
LIMIT 101', 100, false, false, 100, 100, NULL, 1701720277060.552000, '2023-12-04 20:04:37.131225', 1701720277129.446000, '92225165-9ca1-49e2-9f93-5d7d6173468e', 1701720277094.009000, NULL, NULL, '{"cancel_query": 439, "progress": null, "columns": [{"column_name": "user", "name": "user", "type": "LONGINTEGER", "is_dttm": false}, {"column_name": "ts", "name": "ts", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'QUERY') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (4, 'gpy86q-_m', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from click_dynamics  ', NULL, 'SELECT * from click_dynamics
LIMIT 1001', 1000, false, false, 100, 125, NULL, 1701720280575.766000, '2023-12-04 20:04:40.642392', 1701720280639.422900, 'b21a04bb-b331-4409-b0b8-d81964dcceab', 1701720280606.473900, NULL, NULL, '{"cancel_query": 440, "progress": null, "columns": [{"column_name": "user", "name": "user", "type": "LONGINTEGER", "is_dttm": false}, {"column_name": "ts", "name": "ts", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'NOT_LIMITED') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (5, 'gamSQHzCJ', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from click_dynamics;', NULL, 'SELECT * from click_dynamics
LIMIT 1001', 1000, false, false, 100, 125, NULL, 1701720296158.460000, '2023-12-04 20:04:56.228673', 1701720296226.707000, 'a45d614e-d600-4998-85d6-8d94f655fdd2', 1701720296192.076000, NULL, NULL, '{"cancel_query": 457, "progress": null, "columns": [{"column_name": "user", "name": "user", "type": "LONGINTEGER", "is_dttm": false}, {"column_name": "ts", "name": "ts", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'NOT_LIMITED') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (6, 'Pr8xxLjSHq', 1, NULL, '', NULL, 1, 'success', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash
FROM public.raw_data
LIMIT 100', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash
FROM public.raw_data
LIMIT 101', 100, false, false, 100, 100, NULL, 1701721555419.720000, '2023-12-04 20:25:55.584295', 1701721555579.962000, '8c8ed7d4-5498-4df2-ba64-a9dbf8634095', 1701721555490.503200, NULL, NULL, '{"cancel_query": 507, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'QUERY') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (7, 'BpRGkT4v2n', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from raw_data ;', NULL, 'SELECT * from raw_data
LIMIT 1001', 1000, false, false, 100, 1000, NULL, 1701721556298.586000, '2023-12-04 20:25:56.373812', 1701721556370.108000, '0ea72a29-cad3-46ab-9f30-45e3fda8ff6e', 1701721556325.925000, NULL, NULL, '{"cancel_query": 508, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'DROPDOWN') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (8, 'z3cODNU5Tg', 1, NULL, '', NULL, 1, 'success', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash,
       duration,
       flg,
       log_duration
FROM public.clean_data_user_duration
LIMIT 100', NULL, 'SELECT eid,
       t,
       "user",
       tn,
       geo,
       cnethash,
       devtype,
       brotype,
       bsize,
       siteid,
       domhash,
       urlhash,
       duration,
       flg,
       log_duration
FROM public.clean_data_user_duration
LIMIT 101', 100, false, false, 100, 100, NULL, 1701723079433.075000, '2023-12-04 20:51:19.5812', 1701723079577.735800, '95835846-4f9d-4a3f-b42b-ae30677b7cf1', 1701723079492.728000, NULL, NULL, '{"cancel_query": 424, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "flg", "name": "flg", "type": "FLOAT", "is_dttm": false}, {"column_name": "log_duration", "name": "log_duration", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'QUERY') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (9, 'HINXoRwF2', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from clean_data_user_duration ;', NULL, 'SELECT * from clean_data_user_duration
LIMIT 1001', 1000, false, false, 100, 1000, NULL, 1701723086429.236800, '2023-12-04 20:51:26.505875', 1701723086501.243200, '41729bf5-7348-4dbe-bcca-96ddd93384e2', 1701723086459.636000, NULL, NULL, '{"cancel_query": 433, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "flg", "name": "flg", "type": "FLOAT", "is_dttm": false}, {"column_name": "log_duration", "name": "log_duration", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'DROPDOWN') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (10, 'My1LNscEQv', 1, NULL, '', NULL, 1, 'success', NULL, 'SELECT devtype,
       brotype,
       log_duration,
       domhash,
       siteid,
       class
FROM public.classification
LIMIT 100', NULL, 'SELECT devtype,
       brotype,
       log_duration,
       domhash,
       siteid,
       class
FROM public.classification
LIMIT 101', 100, false, false, 100, 100, NULL, 1701985533532.002000, '2023-12-07 21:45:33.644507', 1701985533638.453900, '4e03856d-54d2-451d-a8ff-d2091837932e', 1701985533572.368000, NULL, NULL, '{"cancel_query": 153, "progress": null, "columns": [{"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "log_duration", "name": "log_duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "class", "name": "class", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'QUERY') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (11, 'knsLLsEnT', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from classification ;', NULL, 'SELECT * from classification
LIMIT 1001', 1000, false, false, 100, 1000, NULL, 1701985539811.348900, '2023-12-07 21:45:39.877852', 1701985539874.453100, '52edaa24-aa89-476d-8177-2a18081e1ffd', 1701985539836.339000, NULL, NULL, '{"cancel_query": 159, "progress": null, "columns": [{"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "log_duration", "name": "log_duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "class", "name": "class", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'DROPDOWN') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (12, 'H1VAqYO8I', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT * from classification ;', NULL, 'SELECT * from classification
LIMIT 1001', 1000, false, false, 100, 1000, NULL, 1701985842483.500000, '2023-12-07 21:50:42.567167', 1701985842561.761000, 'e32b28c7-9ff5-49f4-be1f-336578eb091c', 1701985842520.342000, NULL, NULL, '{"cancel_query": 184, "progress": null, "columns": [{"column_name": "eid", "name": "eid", "type": "FLOAT", "is_dttm": false}, {"column_name": "t", "name": "t", "type": "FLOAT", "is_dttm": false}, {"column_name": "user", "name": "user", "type": "FLOAT", "is_dttm": false}, {"column_name": "tn", "name": "tn", "type": "FLOAT", "is_dttm": false}, {"column_name": "geo", "name": "geo", "type": "FLOAT", "is_dttm": false}, {"column_name": "cnethash", "name": "cnethash", "type": "FLOAT", "is_dttm": false}, {"column_name": "devtype", "name": "devtype", "type": "FLOAT", "is_dttm": false}, {"column_name": "brotype", "name": "brotype", "type": "FLOAT", "is_dttm": false}, {"column_name": "bsize", "name": "bsize", "type": "FLOAT", "is_dttm": false}, {"column_name": "siteid", "name": "siteid", "type": "FLOAT", "is_dttm": false}, {"column_name": "domhash", "name": "domhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "urlhash", "name": "urlhash", "type": "FLOAT", "is_dttm": false}, {"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "flg", "name": "flg", "type": "FLOAT", "is_dttm": false}, {"column_name": "log_duration", "name": "log_duration", "type": "FLOAT", "is_dttm": false}, {"column_name": "class", "name": "class", "type": "LONGINTEGER", "is_dttm": false}]}', NULL, 'TABLE', 'DROPDOWN') ON CONFLICT DO NOTHING;
INSERT INTO public.query VALUES (13, 'VK1IpHTre', 1, NULL, 'Untitled Query 1', '1', 1, 'success', 'public', 'SELECT max(duration) AS duration
FROM
  (SELECT *
   from classification) AS virtual_table
LIMIT 10000;', NULL, 'SELECT max(duration) AS duration
FROM
  (SELECT *
   from classification) AS virtual_table
LIMIT 1001', 1000, false, false, 100, 1, NULL, 1701986784104.223000, '2023-12-07 22:06:24.233487', 1701986784230.733000, 'bb17cd40-ead8-48c4-8da3-023f7d9640a6', 1701986784181.387000, NULL, NULL, '{"cancel_query": 248, "progress": null, "columns": [{"column_name": "duration", "name": "duration", "type": "FLOAT", "is_dttm": false}]}', NULL, 'TABLE', 'NOT_LIMITED') ON CONFLICT DO NOTHING;


--
-- TOC entry 3751 (class 0 OID 16578)
-- Dependencies: 250
-- Data for Name: report_execution_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3753 (class 0 OID 16586)
-- Dependencies: 252
-- Data for Name: report_recipient; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3755 (class 0 OID 16594)
-- Dependencies: 254
-- Data for Name: report_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3757 (class 0 OID 16605)
-- Dependencies: 256
-- Data for Name: report_schedule_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3759 (class 0 OID 16610)
-- Dependencies: 258
-- Data for Name: rls_filter_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3761 (class 0 OID 16615)
-- Dependencies: 260
-- Data for Name: rls_filter_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3763 (class 0 OID 16620)
-- Dependencies: 262
-- Data for Name: row_level_security_filters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3765 (class 0 OID 16628)
-- Dependencies: 264
-- Data for Name: saved_query; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3767 (class 0 OID 16636)
-- Dependencies: 266
-- Data for Name: sl_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3769 (class 0 OID 16644)
-- Dependencies: 268
-- Data for Name: sl_dataset_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3770 (class 0 OID 16647)
-- Dependencies: 269
-- Data for Name: sl_dataset_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3771 (class 0 OID 16650)
-- Dependencies: 270
-- Data for Name: sl_dataset_users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3772 (class 0 OID 16653)
-- Dependencies: 271
-- Data for Name: sl_datasets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3774 (class 0 OID 16661)
-- Dependencies: 273
-- Data for Name: sl_table_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3775 (class 0 OID 16664)
-- Dependencies: 274
-- Data for Name: sl_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3777 (class 0 OID 16672)
-- Dependencies: 276
-- Data for Name: slice_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.slice_user VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.slice_user VALUES (2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.slice_user VALUES (3, 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.slice_user VALUES (4, 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.slice_user VALUES (5, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.slice_user VALUES (6, 1, 6) ON CONFLICT DO NOTHING;


--
-- TOC entry 3779 (class 0 OID 16677)
-- Dependencies: 278
-- Data for Name: slices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.slices VALUES ('2023-12-04 20:24:35.562859', '2023-12-04 20:24:35.562865', 1, 'Динамика количества кликов', 'table', 'public.click_dynamics', 'echarts_timeseries_smooth', '{"datasource":"2__table","viz_type":"echarts_timeseries_smooth","x_axis":"ts","time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:22:17.755506","column_name":"count_clicks","created_on":"2023-12-04T20:22:17.755499","description":null,"expression":null,"extra":"{}","filterable":true,"groupby":true,"id":17,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"LONGINTEGER","type_generic":0,"uuid":"3ddc7127-70c8-4f03-bf01-9c0cd89e937f","verbose_name":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_wilyirua7nd_zr369zy82p"}],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"rolling_type":null,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"markerSize":6,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","rich_tooltip":true,"tooltipTimeFormat":"smart_date","y_axis_format":"SMART_NUMBER","y_axis_bounds":[null,null],"extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[click_dynamics](id:2)', 2, '[user_traffic].[public]', '4eee7389-002d-4728-891b-8529a5fc4407', '{"datasource":{"id":2,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":[{"timeGrain":"P1D","columnType":"BASE_AXIS","sqlExpression":"ts","label":"ts","expressionType":"SQL"}],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:22:17.755506","column_name":"count_clicks","created_on":"2023-12-04T20:22:17.755499","description":null,"expression":null,"extra":"{}","filterable":true,"groupby":true,"id":17,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"LONGINTEGER","type_generic":0,"uuid":"3ddc7127-70c8-4f03-bf01-9c0cd89e937f","verbose_name":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_wilyirua7nd_zr369zy82p"}],"orderby":[[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:22:17.755506","column_name":"count_clicks","created_on":"2023-12-04T20:22:17.755499","description":null,"expression":null,"extra":"{}","filterable":true,"groupby":true,"id":17,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"LONGINTEGER","type_generic":0,"uuid":"3ddc7127-70c8-4f03-bf01-9c0cd89e937f","verbose_name":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_wilyirua7nd_zr369zy82p"},false]],"annotation_layers":[],"row_limit":10000,"series_columns":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["ts"],"columns":[],"aggregates":{"Количество кликов":{"operator":"mean"}},"drop_missing_columns":false}},{"operation":"flatten"}]}],"form_data":{"datasource":"2__table","viz_type":"echarts_timeseries_smooth","x_axis":"ts","time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:22:17.755506","column_name":"count_clicks","created_on":"2023-12-04T20:22:17.755499","description":null,"expression":null,"extra":"{}","filterable":true,"groupby":true,"id":17,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"LONGINTEGER","type_generic":0,"uuid":"3ddc7127-70c8-4f03-bf01-9c0cd89e937f","verbose_name":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_wilyirua7nd_zr369zy82p"}],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"rolling_type":null,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"markerSize":6,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","rich_tooltip":true,"tooltipTimeFormat":"smart_date","y_axis_format":"SMART_NUMBER","y_axis_bounds":[null,null],"extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-04 20:24:35.554235', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.slices VALUES ('2023-12-04 20:28:10.963543', '2023-12-04 20:29:23.350652', 2, 'Пользователи, которые сделали клик', 'table', 'public.raw_data', 'table', '{"datasource":"3__table","viz_type":"table","slice_id":2,"query_mode":"aggregate","groupby":[{"label":"Пользователь","sqlExpression":"\"user\"","expressionType":"SQL"}],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":[{"aggregate":"SUM","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"tn","description":null,"expression":null,"filterable":true,"groupby":true,"id":21,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"datasourceWarning":false,"expressionType":"SIMPLE","hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_tg9cf1l69w_wjo615l43if","sqlExpression":null}],"all_columns":["eid","t","user","tn","geo","cnethash","devtype","brotype","bsize","siteid","domhash","urlhash"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":1000,"server_page_length":10,"order_desc":true,"table_timestamp_format":"smart_date","show_cell_bars":true,"color_pn":true,"extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[raw_data](id:3)', 3, '[user_traffic].[public]', '8ae112a2-00e2-45f2-906a-70dfb372b0e7', '{"datasource":{"id":3,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":[{"label":"Пользователь","sqlExpression":"\"user\"","expressionType":"SQL"}],"metrics":[{"aggregate":"SUM","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"tn","description":null,"expression":null,"filterable":true,"groupby":true,"id":21,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"datasourceWarning":false,"expressionType":"SIMPLE","hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_tg9cf1l69w_wjo615l43if","sqlExpression":null}],"orderby":[[{"aggregate":"SUM","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"tn","description":null,"expression":null,"filterable":true,"groupby":true,"id":21,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"datasourceWarning":false,"expressionType":"SIMPLE","hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_tg9cf1l69w_wjo615l43if","sqlExpression":null},false]],"annotation_layers":[],"row_limit":1000,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"post_processing":[]}],"form_data":{"datasource":"3__table","viz_type":"table","slice_id":2,"query_mode":"aggregate","groupby":[{"label":"Пользователь","sqlExpression":"\"user\"","expressionType":"SQL"}],"time_grain_sqla":"P1D","temporal_columns_lookup":{},"metrics":[{"aggregate":"SUM","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"tn","description":null,"expression":null,"filterable":true,"groupby":true,"id":21,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"datasourceWarning":false,"expressionType":"SIMPLE","hasCustomLabel":true,"label":"Количество кликов","optionName":"metric_tg9cf1l69w_wjo615l43if","sqlExpression":null}],"all_columns":["eid","t","user","tn","geo","cnethash","devtype","brotype","bsize","siteid","domhash","urlhash"],"percent_metrics":[],"adhoc_filters":[],"order_by_cols":[],"row_limit":1000,"server_page_length":10,"order_desc":true,"table_timestamp_format":"smart_date","show_cell_bars":true,"color_pn":true,"extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-04 20:29:23.339975', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.slices VALUES ('2023-12-04 20:52:37.478145', '2023-12-04 20:52:37.478152', 3, 'Среднее время, требующееся на клик', 'table', 'public.clean_data_user_duration', 'big_number_total', '{"datasource":"4__table","viz_type":"big_number_total","metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":42,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_h5tw8d16407_qngdbmoi4l"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[clean_data_user_duration](id:4)', 4, '[user_traffic].[public]', 'dc17891a-b6b9-4fa4-a2cf-64ea09be48dc', '{"datasource":{"id":4,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":42,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_h5tw8d16407_qngdbmoi4l"}],"annotation_layers":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"4__table","viz_type":"big_number_total","metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":42,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_h5tw8d16407_qngdbmoi4l"},"adhoc_filters":[],"header_font_size":0.4,"subheader_font_size":0.15,"y_axis_format":"SMART_NUMBER","time_format":"smart_date","extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-04 20:52:37.470521', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.slices VALUES ('2023-12-04 20:58:58.924469', '2023-12-04 20:58:58.924475', 4, 'С каких устройств заходят чаще всего', 'table', 'public.user_duration', 'echarts_timeseries_bar', '{"datasource":"1__table","viz_type":"echarts_timeseries_bar","x_axis":{"label":"Тип устройства","sqlExpression":"\"devtype\"","expressionType":"SQL"},"time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:02:42.649893","column_name":"user","created_on":"2023-12-04T20:02:42.649891","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":3,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"051a2379-96ee-41b5-9af4-aa66393ed97b","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество пользователей","optionName":"metric_5s49y5dgq0m_52t0i3u5038"}],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[user_duration](id:1)', 1, '[user_traffic].[public]', '95c2c757-862a-43d2-b701-e9ab4ac807e4', '{"datasource":{"id":1,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"time_grain_sqla":"P1D","having":"","where":""},"applied_time_extras":{},"columns":[{"timeGrain":"P1D","columnType":"BASE_AXIS","label":"Тип устройства","sqlExpression":"\"devtype\"","expressionType":"SQL"}],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:02:42.649893","column_name":"user","created_on":"2023-12-04T20:02:42.649891","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":3,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"051a2379-96ee-41b5-9af4-aa66393ed97b","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество пользователей","optionName":"metric_5s49y5dgq0m_52t0i3u5038"}],"orderby":[[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:02:42.649893","column_name":"user","created_on":"2023-12-04T20:02:42.649891","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":3,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"051a2379-96ee-41b5-9af4-aa66393ed97b","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество пользователей","optionName":"metric_5s49y5dgq0m_52t0i3u5038"},false]],"annotation_layers":[],"row_limit":10000,"series_columns":[],"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{},"time_offsets":[],"post_processing":[{"operation":"pivot","options":{"index":["Тип устройства"],"columns":[],"aggregates":{"Количество пользователей":{"operator":"mean"}},"drop_missing_columns":false}},{"operation":"flatten"}]}],"form_data":{"datasource":"1__table","viz_type":"echarts_timeseries_bar","x_axis":{"label":"Тип устройства","sqlExpression":"\"devtype\"","expressionType":"SQL"},"time_grain_sqla":"P1D","x_axis_sort_asc":true,"x_axis_sort_series":"name","x_axis_sort_series_ascending":true,"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:02:42.649893","column_name":"user","created_on":"2023-12-04T20:02:42.649891","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":3,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"051a2379-96ee-41b5-9af4-aa66393ed97b","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":true,"label":"Количество пользователей","optionName":"metric_5s49y5dgq0m_52t0i3u5038"}],"groupby":[],"adhoc_filters":[],"order_desc":true,"row_limit":10000,"truncate_metric":true,"show_empty_columns":true,"comparison_type":"values","annotation_layers":[],"forecastPeriods":10,"forecastInterval":0.8,"orientation":"vertical","x_axis_title_margin":15,"y_axis_title_margin":15,"y_axis_title_position":"Left","sort_series_type":"sum","color_scheme":"supersetColors","only_total":true,"show_legend":true,"legendType":"scroll","legendOrientation":"top","x_axis_time_format":"smart_date","y_axis_format":"SMART_NUMBER","y_axis_bounds":[null,null],"rich_tooltip":true,"tooltipTimeFormat":"smart_date","extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-04 20:58:58.92064', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.slices VALUES ('2023-12-07 21:59:53.122501', '2023-12-07 21:59:53.122505', 5, 'Соотношение ботов и существующих пользователей', 'table', 'public.classification', 'pie', '{"datasource":"5__table","viz_type":"pie","groupby":["class_user"],"metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":57,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_slt1mye6dom_71jw8xixx9l"},"adhoc_filters":[],"row_limit":100,"sort_by_metric":true,"color_scheme":"supersetColors","show_labels_threshold":5,"show_legend":true,"legendType":"scroll","legendOrientation":"top","label_type":"key_percent","number_format":"SMART_NUMBER","date_format":"smart_date","show_labels":true,"labels_outside":true,"outerRadius":70,"donut":true,"innerRadius":33,"extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[classification](id:5)', 5, '[user_traffic].[public]', '083e4829-5075-4fe6-8a46-2ea66f4ad822', '{"datasource":{"id":5,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":["class_user"],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":57,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_slt1mye6dom_71jw8xixx9l"}],"orderby":[[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":57,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_slt1mye6dom_71jw8xixx9l"},false]],"annotation_layers":[],"row_limit":100,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"5__table","viz_type":"pie","groupby":["class_user"],"metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"certification_details":null,"certified_by":null,"column_name":"duration","description":null,"expression":null,"filterable":true,"groupby":true,"id":57,"is_certified":false,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"verbose_name":null,"warning_markdown":null},"aggregate":"AVG","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"AVG(duration)","optionName":"metric_slt1mye6dom_71jw8xixx9l"},"adhoc_filters":[],"row_limit":100,"sort_by_metric":true,"color_scheme":"supersetColors","show_labels_threshold":5,"show_legend":true,"legendType":"scroll","legendOrientation":"top","label_type":"key_percent","number_format":"SMART_NUMBER","date_format":"smart_date","show_labels":true,"labels_outside":true,"outerRadius":70,"donut":true,"innerRadius":33,"extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-07 21:59:53.113998', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.slices VALUES ('2023-12-07 22:14:33.060762', '2023-12-07 22:14:33.060771', 6, 'Воронка кликов', 'table', 'public.raw_data', 'funnel', '{"datasource":"3__table","viz_type":"funnel","groupby":[{"label":"tn","sqlExpression":"case when tn = 1 then ''Клики'' else ''Показана реклама'' end","expressionType":"SQL"}],"metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:26:08.027951","column_name":"user","created_on":"2023-12-04T20:26:08.027949","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":20,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"c62caa1f-8e78-421d-8485-3cbcdd4f9f77","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"COUNT_DISTINCT(user)","optionName":"metric_4g03nk8fxv8_moss7pgs76"},"adhoc_filters":[],"row_limit":10,"sort_by_metric":true,"color_scheme":"supersetColors","show_legend":false,"legendOrientation":"top","legendMargin":null,"number_format":"SMART_NUMBER","show_labels":true,"extra_form_data":{},"dashboards":[1]}', 1, 1, NULL, NULL, '[user_traffic].[raw_data](id:3)', 3, '[user_traffic].[public]', '9d91bbd4-8277-4fb2-92c7-93dfb90854d7', '{"datasource":{"id":3,"type":"table"},"force":false,"queries":[{"filters":[],"extras":{"having":"","where":""},"applied_time_extras":{},"columns":[{"label":"tn","sqlExpression":"case when tn = 1 then ''Клики'' else ''Показана реклама'' end","expressionType":"SQL"}],"metrics":[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:26:08.027951","column_name":"user","created_on":"2023-12-04T20:26:08.027949","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":20,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"c62caa1f-8e78-421d-8485-3cbcdd4f9f77","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"COUNT_DISTINCT(user)","optionName":"metric_4g03nk8fxv8_moss7pgs76"}],"orderby":[[{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:26:08.027951","column_name":"user","created_on":"2023-12-04T20:26:08.027949","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":20,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"c62caa1f-8e78-421d-8485-3cbcdd4f9f77","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"COUNT_DISTINCT(user)","optionName":"metric_4g03nk8fxv8_moss7pgs76"},false]],"annotation_layers":[],"row_limit":10,"series_limit":0,"order_desc":true,"url_params":{},"custom_params":{},"custom_form_data":{}}],"form_data":{"datasource":"3__table","viz_type":"funnel","groupby":[{"label":"tn","sqlExpression":"case when tn = 1 then ''Клики'' else ''Показана реклама'' end","expressionType":"SQL"}],"metric":{"expressionType":"SIMPLE","column":{"advanced_data_type":null,"changed_on":"2023-12-04T20:26:08.027951","column_name":"user","created_on":"2023-12-04T20:26:08.027949","description":null,"expression":null,"extra":null,"filterable":true,"groupby":true,"id":20,"is_active":true,"is_dttm":false,"python_date_format":null,"type":"FLOAT","type_generic":0,"uuid":"c62caa1f-8e78-421d-8485-3cbcdd4f9f77","verbose_name":null},"aggregate":"COUNT_DISTINCT","sqlExpression":null,"datasourceWarning":false,"hasCustomLabel":false,"label":"COUNT_DISTINCT(user)","optionName":"metric_4g03nk8fxv8_moss7pgs76"},"adhoc_filters":[],"row_limit":10,"sort_by_metric":true,"color_scheme":"supersetColors","show_legend":false,"legendOrientation":"top","legendMargin":null,"number_format":"SMART_NUMBER","show_labels":true,"extra_form_data":{},"dashboards":[1],"force":false,"result_format":"json","result_type":"full"},"result_format":"json","result_type":"full"}', '2023-12-07 22:14:33.053511', 1, NULL, NULL, false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3781 (class 0 OID 16687)
-- Dependencies: 280
-- Data for Name: sql_metrics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sql_metrics VALUES ('2023-12-04 20:02:42.664603', '2023-12-04 20:02:42.664608', 1, 'count', 'COUNT(*)', 'count', 1, 'COUNT(*)', NULL, 1, 1, NULL, NULL, NULL, 'e55b3240-85de-4ad9-a417-cb2dfcf7685d', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.sql_metrics VALUES ('2023-12-04 20:05:22.686084', '2023-12-04 20:05:22.686088', 2, 'count', 'COUNT(*)', 'count', 2, 'COUNT(*)', NULL, 1, 1, NULL, NULL, '{"warning_markdown":""}', 'a2a7807b-a53d-428c-b438-b77c1ece86c1', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.sql_metrics VALUES ('2023-12-04 20:26:08.03782', '2023-12-04 20:26:08.037824', 3, 'count', 'COUNT(*)', 'count', 3, 'COUNT(*)', NULL, 1, 1, NULL, NULL, NULL, '7952efc0-23b6-4d64-9b67-2f9273e28cb5', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.sql_metrics VALUES ('2023-12-04 20:51:59.03906', '2023-12-04 20:51:59.039064', 4, 'count', 'COUNT(*)', 'count', 4, 'COUNT(*)', NULL, 1, 1, NULL, NULL, NULL, 'a921b0c6-323b-4f84-98ee-b2f57288e9ed', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.sql_metrics VALUES ('2023-12-07 21:51:09.724595', '2023-12-07 21:51:09.724602', 5, 'count', 'COUNT(*)', 'count', 5, 'COUNT(*)', NULL, 1, 1, NULL, NULL, '{"warning_markdown":""}', '6d95c7be-e03c-489a-8996-98b40b632a44', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3783 (class 0 OID 16695)
-- Dependencies: 282
-- Data for Name: sqlatable_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sqlatable_user VALUES (1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.sqlatable_user VALUES (2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.sqlatable_user VALUES (3, 1, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.sqlatable_user VALUES (4, 1, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.sqlatable_user VALUES (5, 1, 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 3785 (class 0 OID 16700)
-- Dependencies: 284
-- Data for Name: ssh_tunnels; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3787 (class 0 OID 16708)
-- Dependencies: 286
-- Data for Name: tab_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tab_state VALUES ('2023-12-04 20:02:04.061947', '2023-12-07 22:06:24.519406', '{}', 1, 1, 'Untitled Query 1', true, 1, 'public', 'SELECT max(duration) AS duration
FROM
  (SELECT *
   from classification) AS virtual_table
LIMIT 10000;', 1000, 'VK1IpHTre', false, NULL, 1, 1, false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3789 (class 0 OID 16717)
-- Dependencies: 288
-- Data for Name: table_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649782', '2023-12-04 20:02:42.649787', 1, 1, 'eid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '381772da-30d0-496a-a811-d597e4ce2802', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649854', '2023-12-04 20:02:42.649856', 2, 1, 't', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '650413a3-b541-41e1-96bb-d44223191751', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649891', '2023-12-04 20:02:42.649893', 3, 1, 'user', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '051a2379-96ee-41b5-9af4-aa66393ed97b', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649926', '2023-12-04 20:02:42.649928', 4, 1, 'tn', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '751f77fb-11c9-4fdc-ad8f-1b882118ecf9', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649961', '2023-12-04 20:02:42.649963', 5, 1, 'geo', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '6d12e68b-6889-4f64-aca8-18fab122e3c9', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.649996', '2023-12-04 20:02:42.649998', 6, 1, 'cnethash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'e3451c36-e669-4b59-846b-01152c24d863', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650031', '2023-12-04 20:02:42.650032', 7, 1, 'devtype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '54c80be1-4144-4641-bfbf-96447578399d', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650065', '2023-12-04 20:02:42.650067', 8, 1, 'brotype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'e6b764ed-6430-4321-9e4b-368ff543c302', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.6501', '2023-12-04 20:02:42.650101', 9, 1, 'bsize', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '94d00ac4-03f6-476c-b1a2-ce6338167c13', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650134', '2023-12-04 20:02:42.650136', 10, 1, 'siteid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '9a693f47-511b-4cb9-b746-c23c18529dfe', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650171', '2023-12-04 20:02:42.650174', 11, 1, 'domhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '96aff18d-ccb8-4cb0-b242-f506d050cd2e', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650234', '2023-12-04 20:02:42.650237', 12, 1, 'urlhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '03c0c2e0-36e0-47aa-9a69-0bf956edbcc8', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.650292', '2023-12-04 20:02:42.650295', 13, 1, 'duration', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '03295e32-9090-49c3-afef-614f8cfcf6fe', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:02:42.65035', '2023-12-04 20:02:42.650353', 14, 1, 'flg', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '4d7cf496-6669-4a1c-bd8c-ef9e3c4a5f4a', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:22:17.755499', '2023-12-04 20:22:17.755506', 17, 2, 'count_clicks', false, true, 'LONGINTEGER', true, true, NULL, 1, 1, NULL, NULL, NULL, '3ddc7127-70c8-4f03-bf01-9c0cd89e937f', '{}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:05:22.680906', '2023-12-04 20:05:22.680907', 16, 2, 'ts', false, true, 'LONGINTEGER', true, true, NULL, 1, 1, NULL, NULL, NULL, '2fc086f0-f061-468d-8419-214ca52133e7', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.02782', '2023-12-04 20:26:08.027827', 18, 3, 'eid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '0ae688a5-438f-4529-b822-58809b012082', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.027911', '2023-12-04 20:26:08.027913', 19, 3, 't', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'fb59bddc-f3fa-40a6-bbca-caed038c8986', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.027949', '2023-12-04 20:26:08.027951', 20, 3, 'user', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'c62caa1f-8e78-421d-8485-3cbcdd4f9f77', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.027985', '2023-12-04 20:26:08.027987', 21, 3, 'tn', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '3d9c1df4-66f1-41d0-8010-fdd40a3a74d0', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028024', '2023-12-04 20:26:08.028026', 22, 3, 'geo', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '7892c2c4-0a0a-4719-a48a-2bfebee1a258', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028059', '2023-12-04 20:26:08.02806', 23, 3, 'cnethash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '73eda6be-3ded-4689-9c9f-1359530e52fc', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028093', '2023-12-04 20:26:08.028095', 24, 3, 'devtype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'def53ce1-4480-4760-aee5-73d5acfe8d72', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028127', '2023-12-04 20:26:08.028129', 25, 3, 'brotype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '7735f0fc-7418-4474-ac23-331c8e843ff5', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028161', '2023-12-04 20:26:08.028163', 26, 3, 'bsize', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '4606fe02-cff4-468c-98b3-e3fce58449c4', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028196', '2023-12-04 20:26:08.028198', 27, 3, 'siteid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '5a96fe82-54ce-423a-9fc7-7b5920bff8a5', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.02823', '2023-12-04 20:26:08.028232', 28, 3, 'domhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '760fcea8-8b0d-43ce-9808-7342a640e3f6', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:26:08.028271', '2023-12-04 20:26:08.028273', 29, 3, 'urlhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '8aff5777-5596-449b-b80d-f3d5c906e4aa', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.017848', '2023-12-04 20:51:59.017854', 30, 4, 'eid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'a8e51f0e-b903-4cdd-8225-47184cce1479', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.017964', '2023-12-04 20:51:59.017967', 31, 4, 't', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'a6edfd87-06f0-4b00-ac86-2f3d6c74d155', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018036', '2023-12-04 20:51:59.01804', 32, 4, 'user', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'f849304a-893e-40e9-b920-c3ed333e6fd0', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018104', '2023-12-04 20:51:59.018108', 33, 4, 'tn', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'ccae964d-3553-4d98-bd74-55b0bdaf0719', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018179', '2023-12-04 20:51:59.018189', 34, 4, 'geo', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '6ba0d960-cc85-43f8-acd6-526009d5e2d7', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018252', '2023-12-04 20:51:59.018256', 35, 4, 'cnethash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '49e48ebf-bec4-4037-ad12-d958c065cb51', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.01832', '2023-12-04 20:51:59.018323', 36, 4, 'devtype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '78b3527b-ef8a-4990-94a3-874cb0c0d924', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018398', '2023-12-04 20:51:59.018401', 37, 4, 'brotype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '9e7c7564-0f8f-470f-8f56-46ff3b4691a9', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018465', '2023-12-04 20:51:59.018468', 38, 4, 'bsize', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '33acd37b-3a0c-42ca-9eaf-64b9f315cd0a', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018531', '2023-12-04 20:51:59.018534', 39, 4, 'siteid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'a4584313-13c7-457f-bc28-30b967fd324b', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018608', '2023-12-04 20:51:59.018611', 40, 4, 'domhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'fbda1b11-443f-4db5-a5f0-c8a9217f8424', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018673', '2023-12-04 20:51:59.018676', 41, 4, 'urlhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'c5937dda-937f-4f1d-a74f-b758470cf16e', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018739', '2023-12-04 20:51:59.018743', 42, 4, 'duration', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '76b85e73-2ddc-4f60-be2a-ea1ce99aa6a6', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018809', '2023-12-04 20:51:59.018813', 43, 4, 'flg', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'c90c6457-fd61-4b27-bfd6-08e9b00ad22a', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-04 20:51:59.018875', '2023-12-04 20:51:59.018879', 44, 4, 'log_duration', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '611870d1-4fb4-4258-8955-17b7fc2c18b9', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:58:53.335129', '2023-12-07 21:58:53.335155', 61, 5, 'class_user', false, true, NULL, true, true, NULL, 1, 1, 'case when class = 1 then ''Бот'' else ''Пользователь'' end', NULL, NULL, '5bb62414-2ef0-496b-9853-8d0b15d0157f', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708255', '2023-12-07 21:51:09.70826', 45, 5, 'eid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '554817fc-90f9-4d5f-b07e-cd06d02b0d1b', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708332', '2023-12-07 21:51:09.708334', 46, 5, 't', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '861b2d4f-8b27-4ed2-b867-66166cc7df5c', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.70837', '2023-12-07 21:51:09.708371', 47, 5, 'user', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '13f88232-b350-46c8-96b8-ffd106005adb', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708405', '2023-12-07 21:51:09.708407', 48, 5, 'tn', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '8ace6552-eddb-4e62-8a14-3b1fd7903b3a', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708441', '2023-12-07 21:51:09.708443', 49, 5, 'geo', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'fb029f8e-8a94-41ca-9093-3ff475cabb5a', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708476', '2023-12-07 21:51:09.708478', 50, 5, 'cnethash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '27c3f6a8-f666-40b8-ab9b-f3611c8e70ae', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708511', '2023-12-07 21:51:09.708513', 51, 5, 'devtype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '995ec13d-1d78-4a3f-88e8-4f5915efb38a', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708546', '2023-12-07 21:51:09.708548', 52, 5, 'brotype', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '5c04bddf-ac2a-4855-888c-49dc574e366b', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708581', '2023-12-07 21:51:09.708582', 53, 5, 'bsize', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '3c7931be-aaf6-4c4d-8cde-c19d93c3c331', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708634', '2023-12-07 21:51:09.708636', 54, 5, 'siteid', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'ef8b5ebd-91e5-4011-a360-a9779652f743', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708673', '2023-12-07 21:51:09.708675', 55, 5, 'domhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'b738e100-4f9e-47e0-a2b9-08b6044c8ca4', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708709', '2023-12-07 21:51:09.70871', 56, 5, 'urlhash', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, 'a51cf74e-0eb6-4247-a4aa-24639c53bc8d', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708744', '2023-12-07 21:51:09.708746', 57, 5, 'duration', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '48c2bcd4-c724-4a54-9ece-56eab9e3ad19', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708779', '2023-12-07 21:51:09.70878', 58, 5, 'flg', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '2d01fb64-539d-496c-a2f3-cc28de962c0d', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708814', '2023-12-07 21:51:09.708815', 59, 5, 'log_duration', false, true, 'FLOAT', true, true, NULL, 1, 1, NULL, NULL, NULL, '87cd3cde-7571-40ee-aa1d-7e1dba5d4f17', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.table_columns VALUES ('2023-12-07 21:51:09.708848', '2023-12-07 21:51:09.70885', 60, 5, 'class', false, true, 'LONGINTEGER', true, true, NULL, 1, 1, NULL, NULL, NULL, 'f27b1f89-d9bc-4ab8-909c-5f7c29e1caae', '{"warning_markdown":null}', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 3791 (class 0 OID 16725)
-- Dependencies: 290
-- Data for Name: table_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.table_schema VALUES ('2023-12-07 21:45:33.397531', '2023-12-07 21:45:33.397537', '{}', 5, 1, 1, 'public', 'classification', '{"columns": [{"comment": null, "keys": [], "longType": "DOUBLE_PRECISION", "name": "devtype", "type": "DOUBLE_PRECISION"}, {"comment": null, "keys": [], "longType": "DOUBLE_PRECISION", "name": "brotype", "type": "DOUBLE_PRECISION"}, {"comment": null, "keys": [], "longType": "DOUBLE_PRECISION", "name": "log_duration", "type": "DOUBLE_PRECISION"}, {"comment": null, "keys": [], "longType": "DOUBLE_PRECISION", "name": "domhash", "type": "DOUBLE_PRECISION"}, {"comment": null, "keys": [], "longType": "DOUBLE_PRECISION", "name": "siteid", "type": "DOUBLE_PRECISION"}, {"comment": null, "keys": [], "longType": "BIGINT", "name": "class", "type": "BIGINT"}], "comment": null, "foreignKeys": [], "indexes": [], "name": "classification", "primaryKey": {"constrained_columns": null, "name": null}, "selectStar": "SELECT devtype,\n       brotype,\n       log_duration,\n       domhash,\n       siteid,\n       class\nFROM public.classification\nLIMIT 100", "dbId": 1, "queryEditorId": "1", "schema": "public", "id": "2NUxjt99b", "expanded": true, "dataPreviewQueryId": null}', true, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3793 (class 0 OID 16733)
-- Dependencies: 292
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tables VALUES ('2023-12-04 20:02:42.602497', '2023-12-04 20:02:42.657325', 1, 'user_duration', NULL, NULL, 1, 1, 1, 0, NULL, false, NULL, 'public', 'SELECT * from user_duration ', NULL, '[user_traffic].[user_duration](id:1)', true, NULL, false, NULL, '[user_traffic].[public]', NULL, '9abda308-ec0e-484f-85c5-da9dfcd6b365', false, NULL, false) ON CONFLICT DO NOTHING;
INSERT INTO public.tables VALUES ('2023-12-04 20:05:22.651312', '2023-12-04 20:22:17.784974', 2, 'click_dynamics', NULL, NULL, 1, 1, 1, 0, NULL, false, NULL, 'public', 'SELECT * from click_dynamics;', NULL, '[user_traffic].[click_dynamics](id:2)', true, NULL, false, NULL, '[user_traffic].[public]', NULL, 'bedae682-ea18-4100-b462-a7d5dea601be', false, NULL, false) ON CONFLICT DO NOTHING;
INSERT INTO public.tables VALUES ('2023-12-04 20:26:07.985054', '2023-12-04 20:26:08.033904', 3, 'raw_data', NULL, NULL, 1, 1, 1, 0, NULL, false, NULL, 'public', 'SELECT * from raw_data ;', NULL, '[user_traffic].[raw_data](id:3)', true, NULL, false, NULL, '[user_traffic].[public]', NULL, 'aac150f8-6ab5-4443-9c54-debd2c954216', false, NULL, false) ON CONFLICT DO NOTHING;
INSERT INTO public.tables VALUES ('2023-12-04 20:51:58.960624', '2023-12-04 20:51:59.030657', 4, 'clean_data_user_duration', NULL, NULL, 1, 1, 1, 0, NULL, false, NULL, 'public', 'SELECT * from clean_data_user_duration ;', NULL, '[user_traffic].[clean_data_user_duration](id:4)', true, NULL, false, NULL, '[user_traffic].[public]', NULL, 'ce1d3892-af40-4a4d-a93a-8199aa90d4f9', false, NULL, false) ON CONFLICT DO NOTHING;
INSERT INTO public.tables VALUES ('2023-12-07 21:51:09.652564', '2023-12-07 21:58:53.394503', 5, 'classification', NULL, NULL, 1, 1, 1, 0, NULL, false, NULL, 'public', 'SELECT * from classification ;', NULL, '[user_traffic].[classification](id:5)', true, NULL, false, NULL, '[user_traffic].[public]', NULL, '48f13f65-bc5b-4d13-bade-594cc7746508', false, NULL, false) ON CONFLICT DO NOTHING;


--
-- TOC entry 3795 (class 0 OID 16744)
-- Dependencies: 294
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3797 (class 0 OID 16752)
-- Dependencies: 296
-- Data for Name: tagged_object; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3799 (class 0 OID 16760)
-- Dependencies: 298
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3801 (class 0 OID 16768)
-- Dependencies: 300
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 201
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 70, true);


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 203
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 177, true);


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 205
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 380, true);


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 207
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 209
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 211
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 213
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 215
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 88, true);


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 218
-- Name: annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_id_seq', 1, false);


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 220
-- Name: annotation_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_layer_id_seq', 1, false);


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 222
-- Name: cache_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cache_keys_id_seq', 1, false);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 224
-- Name: css_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.css_templates_id_seq', 1, false);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 226
-- Name: dashboard_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_roles_id_seq', 1, false);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 228
-- Name: dashboard_slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_slices_id_seq', 6, true);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 230
-- Name: dashboard_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_user_id_seq', 1, true);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 232
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboards_id_seq', 1, true);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 234
-- Name: dbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dbs_id_seq', 1, true);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 236
-- Name: dynamic_plugin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dynamic_plugin_id_seq', 1, false);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 239
-- Name: favstar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favstar_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 241
-- Name: filter_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.filter_sets_id_seq', 1, false);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 243
-- Name: key_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.key_value_id_seq', 130, true);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 245
-- Name: keyvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.keyvalue_id_seq', 1, false);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 247
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 1201, true);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 249
-- Name: query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.query_id_seq', 45, true);


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 251
-- Name: report_execution_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_execution_log_id_seq', 1, false);


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 253
-- Name: report_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_recipient_id_seq', 1, false);


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 255
-- Name: report_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_schedule_id_seq', 1, false);


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 257
-- Name: report_schedule_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_schedule_user_id_seq', 1, false);


--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 259
-- Name: rls_filter_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_filter_roles_id_seq', 1, false);


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 261
-- Name: rls_filter_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_filter_tables_id_seq', 1, false);


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 263
-- Name: row_level_security_filters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.row_level_security_filters_id_seq', 1, false);


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 265
-- Name: saved_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saved_query_id_seq', 1, false);


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 267
-- Name: sl_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_columns_id_seq', 1, false);


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 272
-- Name: sl_datasets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_datasets_id_seq', 1, false);


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 275
-- Name: sl_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sl_tables_id_seq', 1, false);


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 277
-- Name: slice_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slice_user_id_seq', 6, true);


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 279
-- Name: slices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.slices_id_seq', 6, true);


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 281
-- Name: sql_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sql_metrics_id_seq', 5, true);


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 283
-- Name: sqlatable_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sqlatable_user_id_seq', 5, true);


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 285
-- Name: ssh_tunnels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ssh_tunnels_id_seq', 1, false);


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 287
-- Name: tab_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tab_state_id_seq', 1, true);


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 289
-- Name: table_columns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_columns_id_seq', 61, true);


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 291
-- Name: table_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_schema_id_seq', 5, true);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 293
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_id_seq', 5, true);


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 295
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tag_id_seq', 1, false);


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 297
-- Name: tagged_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tagged_object_id_seq', 1, false);


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 299
-- Name: url_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.url_id_seq', 1, false);


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 301
-- Name: user_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_attribute_id_seq', 1, false);


--
-- TOC entry 3443 (class 2606 OID 16817)
-- Name: tables _customer_location_uc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT _customer_location_uc UNIQUE (database_id, schema, table_name);


--
-- TOC entry 3275 (class 2606 OID 16819)
-- Name: ab_permission ab_permission_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_key UNIQUE (name);


--
-- TOC entry 3277 (class 2606 OID 16821)
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 16823)
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_key UNIQUE (permission_id, view_menu_id);


--
-- TOC entry 3281 (class 2606 OID 16825)
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 16827)
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_key UNIQUE (permission_view_id, role_id);


--
-- TOC entry 3285 (class 2606 OID 16829)
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3287 (class 2606 OID 16831)
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 16833)
-- Name: ab_register_user ab_register_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_key UNIQUE (username);


--
-- TOC entry 3291 (class 2606 OID 16835)
-- Name: ab_role ab_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_key UNIQUE (name);


--
-- TOC entry 3293 (class 2606 OID 16837)
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16839)
-- Name: ab_user ab_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_key UNIQUE (email);


--
-- TOC entry 3297 (class 2606 OID 16841)
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16843)
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 16845)
-- Name: ab_user_role ab_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- TOC entry 3299 (class 2606 OID 16847)
-- Name: ab_user ab_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_key UNIQUE (username);


--
-- TOC entry 3305 (class 2606 OID 16849)
-- Name: ab_view_menu ab_view_menu_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_key UNIQUE (name);


--
-- TOC entry 3307 (class 2606 OID 16851)
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 16853)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3314 (class 2606 OID 16855)
-- Name: annotation_layer annotation_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16857)
-- Name: annotation annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 16859)
-- Name: cache_keys cache_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_keys
    ADD CONSTRAINT cache_keys_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 16861)
-- Name: query client_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT client_id UNIQUE (client_id);


--
-- TOC entry 3319 (class 2606 OID 16863)
-- Name: css_templates css_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16865)
-- Name: dashboard_roles dashboard_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT dashboard_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16867)
-- Name: dashboard_slices dashboard_slices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT dashboard_slices_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16869)
-- Name: dashboard_user dashboard_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT dashboard_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16871)
-- Name: dashboards dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 16873)
-- Name: dbs dbs_database_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_database_name_key UNIQUE (database_name);


--
-- TOC entry 3337 (class 2606 OID 16875)
-- Name: dbs dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_pkey PRIMARY KEY (id);


--
-- TOC entry 3339 (class 2606 OID 16877)
-- Name: dbs dbs_verbose_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_verbose_name_key UNIQUE (verbose_name);


--
-- TOC entry 3343 (class 2606 OID 16879)
-- Name: dynamic_plugin dynamic_plugin_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_key_key UNIQUE (key);


--
-- TOC entry 3345 (class 2606 OID 16881)
-- Name: dynamic_plugin dynamic_plugin_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_name_key UNIQUE (name);


--
-- TOC entry 3347 (class 2606 OID 16883)
-- Name: dynamic_plugin dynamic_plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_pkey PRIMARY KEY (id);


--
-- TOC entry 3349 (class 2606 OID 16885)
-- Name: favstar favstar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_pkey PRIMARY KEY (id);


--
-- TOC entry 3351 (class 2606 OID 16887)
-- Name: filter_sets filter_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 16889)
-- Name: dashboards idx_unique_slug; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT idx_unique_slug UNIQUE (slug);


--
-- TOC entry 3355 (class 2606 OID 16891)
-- Name: key_value key_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_pkey PRIMARY KEY (id);


--
-- TOC entry 3357 (class 2606 OID 16893)
-- Name: keyvalue keyvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keyvalue
    ADD CONSTRAINT keyvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 16895)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3365 (class 2606 OID 16897)
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16899)
-- Name: report_execution_log report_execution_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 16901)
-- Name: report_recipient report_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 16903)
-- Name: report_schedule report_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 16905)
-- Name: report_schedule_user report_schedule_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT report_schedule_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 16907)
-- Name: rls_filter_roles rls_filter_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 16909)
-- Name: rls_filter_tables rls_filter_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3385 (class 2606 OID 16911)
-- Name: row_level_security_filters row_level_security_filters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_pkey PRIMARY KEY (id);


--
-- TOC entry 3389 (class 2606 OID 16913)
-- Name: saved_query saved_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_pkey PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 16915)
-- Name: sl_columns sl_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_pkey PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 16917)
-- Name: sl_columns sl_columns_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_uuid_key UNIQUE (uuid);


--
-- TOC entry 3397 (class 2606 OID 16919)
-- Name: sl_dataset_columns sl_dataset_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_pkey PRIMARY KEY (dataset_id, column_id);


--
-- TOC entry 3399 (class 2606 OID 16921)
-- Name: sl_dataset_tables sl_dataset_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_pkey PRIMARY KEY (dataset_id, table_id);


--
-- TOC entry 3401 (class 2606 OID 16923)
-- Name: sl_dataset_users sl_dataset_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_pkey PRIMARY KEY (dataset_id, user_id);


--
-- TOC entry 3403 (class 2606 OID 16925)
-- Name: sl_datasets sl_datasets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_pkey PRIMARY KEY (id);


--
-- TOC entry 3405 (class 2606 OID 16927)
-- Name: sl_datasets sl_datasets_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_uuid_key UNIQUE (uuid);


--
-- TOC entry 3407 (class 2606 OID 16929)
-- Name: sl_table_columns sl_table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_pkey PRIMARY KEY (table_id, column_id);


--
-- TOC entry 3409 (class 2606 OID 16931)
-- Name: sl_tables sl_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 16933)
-- Name: sl_tables sl_tables_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_uuid_key UNIQUE (uuid);


--
-- TOC entry 3413 (class 2606 OID 16935)
-- Name: slice_user slice_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT slice_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 16937)
-- Name: slices slices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_pkey PRIMARY KEY (id);


--
-- TOC entry 3419 (class 2606 OID 16939)
-- Name: sql_metrics sql_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_pkey PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 16941)
-- Name: sqlatable_user sqlatable_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT sqlatable_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 16943)
-- Name: ssh_tunnels ssh_tunnels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_pkey PRIMARY KEY (id);


--
-- TOC entry 3432 (class 2606 OID 16945)
-- Name: tab_state tab_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_pkey PRIMARY KEY (id);


--
-- TOC entry 3434 (class 2606 OID 16947)
-- Name: table_columns table_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_pkey PRIMARY KEY (id);


--
-- TOC entry 3441 (class 2606 OID 16949)
-- Name: table_schema table_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_pkey PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 16951)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 16953)
-- Name: tag tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- TOC entry 3451 (class 2606 OID 16955)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3454 (class 2606 OID 16957)
-- Name: tagged_object tagged_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_pkey PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16959)
-- Name: dashboard_slices uq_dashboard_slice; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT uq_dashboard_slice UNIQUE (dashboard_id, slice_id);


--
-- TOC entry 3333 (class 2606 OID 16961)
-- Name: dashboards uq_dashboards_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT uq_dashboards_uuid UNIQUE (uuid);


--
-- TOC entry 3341 (class 2606 OID 16963)
-- Name: dbs uq_dbs_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT uq_dbs_uuid UNIQUE (uuid);


--
-- TOC entry 3376 (class 2606 OID 16965)
-- Name: report_schedule uq_report_schedule_name_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT uq_report_schedule_name_type UNIQUE (name, type);


--
-- TOC entry 3387 (class 2606 OID 16967)
-- Name: row_level_security_filters uq_rls_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT uq_rls_name UNIQUE (name);


--
-- TOC entry 3391 (class 2606 OID 16969)
-- Name: saved_query uq_saved_query_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT uq_saved_query_uuid UNIQUE (uuid);


--
-- TOC entry 3417 (class 2606 OID 16971)
-- Name: slices uq_slices_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT uq_slices_uuid UNIQUE (uuid);


--
-- TOC entry 3421 (class 2606 OID 16973)
-- Name: sql_metrics uq_sql_metrics_metric_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_metric_name UNIQUE (metric_name, table_id);


--
-- TOC entry 3423 (class 2606 OID 16975)
-- Name: sql_metrics uq_sql_metrics_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT uq_sql_metrics_uuid UNIQUE (uuid);


--
-- TOC entry 3436 (class 2606 OID 16977)
-- Name: table_columns uq_table_columns_column_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_column_name UNIQUE (column_name, table_id);


--
-- TOC entry 3438 (class 2606 OID 16979)
-- Name: table_columns uq_table_columns_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT uq_table_columns_uuid UNIQUE (uuid);


--
-- TOC entry 3447 (class 2606 OID 16981)
-- Name: tables uq_tables_uuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT uq_tables_uuid UNIQUE (uuid);


--
-- TOC entry 3456 (class 2606 OID 16983)
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- TOC entry 3458 (class 2606 OID 16985)
-- Name: user_attribute user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 1259 OID 16986)
-- Name: ix_cache_keys_datasource_uid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_cache_keys_datasource_uid ON public.cache_keys USING btree (datasource_uid);


--
-- TOC entry 3371 (class 1259 OID 16987)
-- Name: ix_creation_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_creation_method ON public.report_schedule USING btree (creation_method);


--
-- TOC entry 3352 (class 1259 OID 16988)
-- Name: ix_key_value_expires_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_key_value_expires_on ON public.key_value USING btree (expires_on);


--
-- TOC entry 3353 (class 1259 OID 16989)
-- Name: ix_key_value_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_key_value_uuid ON public.key_value USING btree (uuid);


--
-- TOC entry 3358 (class 1259 OID 16990)
-- Name: ix_logs_user_id_dttm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_logs_user_id_dttm ON public.logs USING btree (user_id, dttm);


--
-- TOC entry 3363 (class 1259 OID 16991)
-- Name: ix_query_results_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_query_results_key ON public.query USING btree (results_key);


--
-- TOC entry 3372 (class 1259 OID 16992)
-- Name: ix_report_schedule_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_report_schedule_active ON public.report_schedule USING btree (active);


--
-- TOC entry 3383 (class 1259 OID 16993)
-- Name: ix_row_level_security_filters_filter_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_row_level_security_filters_filter_type ON public.row_level_security_filters USING btree (filter_type);


--
-- TOC entry 3426 (class 1259 OID 16994)
-- Name: ix_ssh_tunnels_database_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_ssh_tunnels_database_id ON public.ssh_tunnels USING btree (database_id);


--
-- TOC entry 3427 (class 1259 OID 16995)
-- Name: ix_ssh_tunnels_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_ssh_tunnels_uuid ON public.ssh_tunnels USING btree (uuid);


--
-- TOC entry 3430 (class 1259 OID 16996)
-- Name: ix_tab_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_tab_state_id ON public.tab_state USING btree (id);


--
-- TOC entry 3439 (class 1259 OID 16997)
-- Name: ix_table_schema_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_table_schema_id ON public.table_schema USING btree (id);


--
-- TOC entry 3452 (class 1259 OID 16998)
-- Name: ix_tagged_object_object_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_tagged_object_object_id ON public.tagged_object USING btree (object_id);


--
-- TOC entry 3312 (class 1259 OID 16999)
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_dag_state ON public.annotation USING btree (layer_id, start_dttm, end_dttm);


--
-- TOC entry 3366 (class 1259 OID 17000)
-- Name: ti_user_id_changed_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ti_user_id_changed_on ON public.query USING btree (user_id, changed_on);


--
-- TOC entry 3459 (class 2606 OID 17001)
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- TOC entry 3461 (class 2606 OID 17006)
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- TOC entry 3462 (class 2606 OID 17011)
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- TOC entry 3460 (class 2606 OID 17016)
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- TOC entry 3463 (class 2606 OID 17021)
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3464 (class 2606 OID 17026)
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3465 (class 2606 OID 17031)
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- TOC entry 3466 (class 2606 OID 17036)
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3467 (class 2606 OID 17041)
-- Name: annotation annotation_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3468 (class 2606 OID 17046)
-- Name: annotation annotation_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3470 (class 2606 OID 17051)
-- Name: annotation_layer annotation_layer_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3471 (class 2606 OID 17056)
-- Name: annotation_layer annotation_layer_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_layer
    ADD CONSTRAINT annotation_layer_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3469 (class 2606 OID 17061)
-- Name: annotation annotation_layer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation
    ADD CONSTRAINT annotation_layer_id_fkey FOREIGN KEY (layer_id) REFERENCES public.annotation_layer(id);


--
-- TOC entry 3472 (class 2606 OID 17066)
-- Name: css_templates css_templates_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3473 (class 2606 OID 17071)
-- Name: css_templates css_templates_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.css_templates
    ADD CONSTRAINT css_templates_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3480 (class 2606 OID 17076)
-- Name: dashboards dashboards_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3481 (class 2606 OID 17081)
-- Name: dashboards dashboards_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboards
    ADD CONSTRAINT dashboards_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3482 (class 2606 OID 17086)
-- Name: dbs dbs_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3483 (class 2606 OID 17091)
-- Name: dbs dbs_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbs
    ADD CONSTRAINT dbs_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3484 (class 2606 OID 17096)
-- Name: dynamic_plugin dynamic_plugin_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3485 (class 2606 OID 17101)
-- Name: dynamic_plugin dynamic_plugin_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamic_plugin
    ADD CONSTRAINT dynamic_plugin_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3487 (class 2606 OID 17106)
-- Name: favstar favstar_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favstar
    ADD CONSTRAINT favstar_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3488 (class 2606 OID 17111)
-- Name: filter_sets filter_sets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3489 (class 2606 OID 17116)
-- Name: filter_sets filter_sets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3490 (class 2606 OID 17121)
-- Name: filter_sets filter_sets_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filter_sets
    ADD CONSTRAINT filter_sets_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- TOC entry 3474 (class 2606 OID 17126)
-- Name: dashboard_roles fk_dashboard_roles_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3475 (class 2606 OID 17131)
-- Name: dashboard_roles fk_dashboard_roles_role_id_ab_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_roles
    ADD CONSTRAINT fk_dashboard_roles_role_id_ab_role FOREIGN KEY (role_id) REFERENCES public.ab_role(id) ON DELETE CASCADE;


--
-- TOC entry 3476 (class 2606 OID 17136)
-- Name: dashboard_slices fk_dashboard_slices_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3477 (class 2606 OID 17141)
-- Name: dashboard_slices fk_dashboard_slices_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_slices
    ADD CONSTRAINT fk_dashboard_slices_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- TOC entry 3478 (class 2606 OID 17146)
-- Name: dashboard_user fk_dashboard_user_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3479 (class 2606 OID 17151)
-- Name: dashboard_user fk_dashboard_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_user
    ADD CONSTRAINT fk_dashboard_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- TOC entry 3486 (class 2606 OID 17156)
-- Name: embedded_dashboards fk_embedded_dashboards_dashboard_id_dashboards; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.embedded_dashboards
    ADD CONSTRAINT fk_embedded_dashboards_dashboard_id_dashboards FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id) ON DELETE CASCADE;


--
-- TOC entry 3505 (class 2606 OID 17161)
-- Name: report_schedule_user fk_report_schedule_user_report_schedule_id_report_schedule; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_report_schedule_id_report_schedule FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id) ON DELETE CASCADE;


--
-- TOC entry 3506 (class 2606 OID 17166)
-- Name: report_schedule_user fk_report_schedule_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule_user
    ADD CONSTRAINT fk_report_schedule_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- TOC entry 3533 (class 2606 OID 17171)
-- Name: slice_user fk_slice_user_slice_id_slices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_slice_id_slices FOREIGN KEY (slice_id) REFERENCES public.slices(id) ON DELETE CASCADE;


--
-- TOC entry 3534 (class 2606 OID 17176)
-- Name: slice_user fk_slice_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slice_user
    ADD CONSTRAINT fk_slice_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- TOC entry 3538 (class 2606 OID 17181)
-- Name: sql_metrics fk_sql_metrics_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT fk_sql_metrics_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- TOC entry 3541 (class 2606 OID 17186)
-- Name: sqlatable_user fk_sqlatable_user_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- TOC entry 3542 (class 2606 OID 17191)
-- Name: sqlatable_user fk_sqlatable_user_user_id_ab_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sqlatable_user
    ADD CONSTRAINT fk_sqlatable_user_user_id_ab_user FOREIGN KEY (user_id) REFERENCES public.ab_user(id) ON DELETE CASCADE;


--
-- TOC entry 3550 (class 2606 OID 17196)
-- Name: table_columns fk_table_columns_table_id_tables; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT fk_table_columns_table_id_tables FOREIGN KEY (table_id) REFERENCES public.tables(id) ON DELETE CASCADE;


--
-- TOC entry 3491 (class 2606 OID 17201)
-- Name: key_value key_value_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3492 (class 2606 OID 17206)
-- Name: key_value key_value_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value
    ADD CONSTRAINT key_value_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3493 (class 2606 OID 17211)
-- Name: logs logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3494 (class 2606 OID 17216)
-- Name: query query_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3495 (class 2606 OID 17221)
-- Name: query query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3496 (class 2606 OID 17226)
-- Name: report_execution_log report_execution_log_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_execution_log
    ADD CONSTRAINT report_execution_log_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- TOC entry 3497 (class 2606 OID 17231)
-- Name: report_recipient report_recipient_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3498 (class 2606 OID 17236)
-- Name: report_recipient report_recipient_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3499 (class 2606 OID 17241)
-- Name: report_recipient report_recipient_report_schedule_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_recipient
    ADD CONSTRAINT report_recipient_report_schedule_id_fkey FOREIGN KEY (report_schedule_id) REFERENCES public.report_schedule(id);


--
-- TOC entry 3500 (class 2606 OID 17246)
-- Name: report_schedule report_schedule_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3501 (class 2606 OID 17251)
-- Name: report_schedule report_schedule_chart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_chart_id_fkey FOREIGN KEY (chart_id) REFERENCES public.slices(id);


--
-- TOC entry 3502 (class 2606 OID 17256)
-- Name: report_schedule report_schedule_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3503 (class 2606 OID 17261)
-- Name: report_schedule report_schedule_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_dashboard_id_fkey FOREIGN KEY (dashboard_id) REFERENCES public.dashboards(id);


--
-- TOC entry 3504 (class 2606 OID 17266)
-- Name: report_schedule report_schedule_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_schedule
    ADD CONSTRAINT report_schedule_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3507 (class 2606 OID 17271)
-- Name: rls_filter_roles rls_filter_roles_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- TOC entry 3508 (class 2606 OID 17276)
-- Name: rls_filter_roles rls_filter_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_roles
    ADD CONSTRAINT rls_filter_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- TOC entry 3509 (class 2606 OID 17281)
-- Name: rls_filter_tables rls_filter_tables_rls_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_rls_filter_id_fkey FOREIGN KEY (rls_filter_id) REFERENCES public.row_level_security_filters(id);


--
-- TOC entry 3510 (class 2606 OID 17286)
-- Name: rls_filter_tables rls_filter_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_filter_tables
    ADD CONSTRAINT rls_filter_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id);


--
-- TOC entry 3511 (class 2606 OID 17291)
-- Name: row_level_security_filters row_level_security_filters_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3512 (class 2606 OID 17296)
-- Name: row_level_security_filters row_level_security_filters_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.row_level_security_filters
    ADD CONSTRAINT row_level_security_filters_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3513 (class 2606 OID 17301)
-- Name: saved_query saved_query_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3514 (class 2606 OID 17306)
-- Name: saved_query saved_query_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3515 (class 2606 OID 17311)
-- Name: saved_query saved_query_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_db_id_fkey FOREIGN KEY (db_id) REFERENCES public.dbs(id);


--
-- TOC entry 3544 (class 2606 OID 17316)
-- Name: tab_state saved_query_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT saved_query_id FOREIGN KEY (saved_query_id) REFERENCES public.saved_query(id) ON DELETE SET NULL;


--
-- TOC entry 3516 (class 2606 OID 17321)
-- Name: saved_query saved_query_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saved_query
    ADD CONSTRAINT saved_query_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3517 (class 2606 OID 17326)
-- Name: sl_columns sl_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3518 (class 2606 OID 17331)
-- Name: sl_columns sl_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_columns
    ADD CONSTRAINT sl_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3519 (class 2606 OID 17336)
-- Name: sl_dataset_columns sl_dataset_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- TOC entry 3520 (class 2606 OID 17341)
-- Name: sl_dataset_columns sl_dataset_columns_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_columns
    ADD CONSTRAINT sl_dataset_columns_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- TOC entry 3521 (class 2606 OID 17346)
-- Name: sl_dataset_tables sl_dataset_tables_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- TOC entry 3522 (class 2606 OID 17351)
-- Name: sl_dataset_tables sl_dataset_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_tables
    ADD CONSTRAINT sl_dataset_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- TOC entry 3523 (class 2606 OID 17356)
-- Name: sl_dataset_users sl_dataset_users_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.sl_datasets(id);


--
-- TOC entry 3524 (class 2606 OID 17361)
-- Name: sl_dataset_users sl_dataset_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_dataset_users
    ADD CONSTRAINT sl_dataset_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3525 (class 2606 OID 17366)
-- Name: sl_datasets sl_datasets_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3526 (class 2606 OID 17371)
-- Name: sl_datasets sl_datasets_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3527 (class 2606 OID 17376)
-- Name: sl_datasets sl_datasets_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_datasets
    ADD CONSTRAINT sl_datasets_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3528 (class 2606 OID 17381)
-- Name: sl_table_columns sl_table_columns_column_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_column_id_fkey FOREIGN KEY (column_id) REFERENCES public.sl_columns(id);


--
-- TOC entry 3529 (class 2606 OID 17386)
-- Name: sl_table_columns sl_table_columns_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_table_columns
    ADD CONSTRAINT sl_table_columns_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.sl_tables(id);


--
-- TOC entry 3530 (class 2606 OID 17391)
-- Name: sl_tables sl_tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3531 (class 2606 OID 17396)
-- Name: sl_tables sl_tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3532 (class 2606 OID 17401)
-- Name: sl_tables sl_tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sl_tables
    ADD CONSTRAINT sl_tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3535 (class 2606 OID 17406)
-- Name: slices slices_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3536 (class 2606 OID 17411)
-- Name: slices slices_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3537 (class 2606 OID 17416)
-- Name: slices slices_last_saved_by_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.slices
    ADD CONSTRAINT slices_last_saved_by_fk FOREIGN KEY (last_saved_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3539 (class 2606 OID 17421)
-- Name: sql_metrics sql_metrics_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3540 (class 2606 OID 17426)
-- Name: sql_metrics sql_metrics_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sql_metrics
    ADD CONSTRAINT sql_metrics_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3543 (class 2606 OID 17431)
-- Name: ssh_tunnels ssh_tunnels_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ssh_tunnels
    ADD CONSTRAINT ssh_tunnels_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3545 (class 2606 OID 17436)
-- Name: tab_state tab_state_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3546 (class 2606 OID 17441)
-- Name: tab_state tab_state_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3547 (class 2606 OID 17446)
-- Name: tab_state tab_state_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- TOC entry 3548 (class 2606 OID 17451)
-- Name: tab_state tab_state_latest_query_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_latest_query_id_fkey FOREIGN KEY (latest_query_id) REFERENCES public.query(client_id) ON DELETE SET NULL;


--
-- TOC entry 3549 (class 2606 OID 17456)
-- Name: tab_state tab_state_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tab_state
    ADD CONSTRAINT tab_state_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3551 (class 2606 OID 17461)
-- Name: table_columns table_columns_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3552 (class 2606 OID 17466)
-- Name: table_columns table_columns_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_columns
    ADD CONSTRAINT table_columns_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3553 (class 2606 OID 17471)
-- Name: table_schema table_schema_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3554 (class 2606 OID 17476)
-- Name: table_schema table_schema_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3555 (class 2606 OID 17481)
-- Name: table_schema table_schema_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id) ON DELETE CASCADE;


--
-- TOC entry 3556 (class 2606 OID 17486)
-- Name: table_schema table_schema_tab_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_schema
    ADD CONSTRAINT table_schema_tab_state_id_fkey FOREIGN KEY (tab_state_id) REFERENCES public.tab_state(id) ON DELETE CASCADE;


--
-- TOC entry 3557 (class 2606 OID 17491)
-- Name: tables tables_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3558 (class 2606 OID 17496)
-- Name: tables tables_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3559 (class 2606 OID 17501)
-- Name: tables tables_database_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_database_id_fkey FOREIGN KEY (database_id) REFERENCES public.dbs(id);


--
-- TOC entry 3560 (class 2606 OID 17506)
-- Name: tag tag_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3561 (class 2606 OID 17511)
-- Name: tag tag_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3562 (class 2606 OID 17516)
-- Name: tagged_object tagged_object_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3563 (class 2606 OID 17521)
-- Name: tagged_object tagged_object_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3564 (class 2606 OID 17526)
-- Name: tagged_object tagged_object_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tagged_object
    ADD CONSTRAINT tagged_object_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- TOC entry 3565 (class 2606 OID 17531)
-- Name: url url_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3566 (class 2606 OID 17536)
-- Name: url url_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3567 (class 2606 OID 17541)
-- Name: user_attribute user_attribute_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3568 (class 2606 OID 17546)
-- Name: user_attribute user_attribute_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- TOC entry 3569 (class 2606 OID 17551)
-- Name: user_attribute user_attribute_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- TOC entry 3570 (class 2606 OID 17556)
-- Name: user_attribute user_attribute_welcome_dashboard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT user_attribute_welcome_dashboard_id_fkey FOREIGN KEY (welcome_dashboard_id) REFERENCES public.dashboards(id);


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 3808
-- Name: DATABASE superset; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE superset TO superset;


-- Completed on 2023-12-07 22:18:37 UTC

--
-- PostgreSQL database dump complete
--

