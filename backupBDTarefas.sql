--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

-- Started on 2022-12-21 12:15:35

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

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16937)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17040)
-- Name: tb_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_permissao (
    id bigint NOT NULL,
    descricao character varying(255)
);


ALTER TABLE public.tb_permissao OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16902)
-- Name: tb_prioridade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_prioridade (
    id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE public.tb_prioridade OWNER TO postgres;

--
-- TOC entry 2876 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE tb_prioridade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_prioridade IS 'Prioridade da tarefa';


--
-- TOC entry 199 (class 1259 OID 16900)
-- Name: tb_prioridade_tp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_prioridade_tp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_prioridade_tp_id_seq OWNER TO postgres;

--
-- TOC entry 2877 (class 0 OID 0)
-- Dependencies: 199
-- Name: tb_prioridade_tp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_prioridade_tp_id_seq OWNED BY public.tb_prioridade.id;


--
-- TOC entry 203 (class 1259 OID 16975)
-- Name: tb_responsavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_responsavel (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.tb_responsavel OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16973)
-- Name: tb_responsavel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_responsavel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_responsavel_id_seq OWNER TO postgres;

--
-- TOC entry 2878 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_responsavel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_responsavel_id_seq OWNED BY public.tb_responsavel.id;


--
-- TOC entry 198 (class 1259 OID 16891)
-- Name: tb_situacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_situacao (
    id integer NOT NULL,
    descricao character varying NOT NULL
);


ALTER TABLE public.tb_situacao OWNER TO postgres;

--
-- TOC entry 2879 (class 0 OID 0)
-- Dependencies: 198
-- Name: TABLE tb_situacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_situacao IS 'Status da tarefa';


--
-- TOC entry 197 (class 1259 OID 16889)
-- Name: tb_situacao_ts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_situacao_ts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_situacao_ts_id_seq OWNER TO postgres;

--
-- TOC entry 2880 (class 0 OID 0)
-- Dependencies: 197
-- Name: tb_situacao_ts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_situacao_ts_id_seq OWNED BY public.tb_situacao.id;


--
-- TOC entry 196 (class 1259 OID 16880)
-- Name: tb_tarefa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_tarefa (
    descricao character varying NOT NULL,
    prioridade integer,
    situacao integer,
    data_inicio date,
    data_fim date,
    executor integer,
    id bigint NOT NULL
);


ALTER TABLE public.tb_tarefa OWNER TO postgres;

--
-- TOC entry 2881 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE tb_tarefa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_tarefa IS 'Descrição das tarefas a realizar';


--
-- TOC entry 206 (class 1259 OID 17029)
-- Name: tb_tarefa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_tarefa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_tarefa_id_seq OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_tarefa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_tarefa_id_seq OWNED BY public.tb_tarefa.id;


--
-- TOC entry 205 (class 1259 OID 16991)
-- Name: tb_usuariio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuariio (
    id bigint NOT NULL,
    nome character varying(30),
    senha character varying(10)
);


ALTER TABLE public.tb_usuariio OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16989)
-- Name: tb_usuariio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tb_usuariio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tb_usuariio_id_seq OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_usuariio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tb_usuariio_id_seq OWNED BY public.tb_usuariio.id;


--
-- TOC entry 208 (class 1259 OID 17045)
-- Name: tb_usuario_permissao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_usuario_permissao (
    id_usuario bigint NOT NULL,
    id_permissao bigint NOT NULL
);


ALTER TABLE public.tb_usuario_permissao OWNER TO postgres;

--
-- TOC entry 2712 (class 2604 OID 16905)
-- Name: tb_prioridade id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_prioridade ALTER COLUMN id SET DEFAULT nextval('public.tb_prioridade_tp_id_seq'::regclass);


--
-- TOC entry 2714 (class 2604 OID 16978)
-- Name: tb_responsavel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_responsavel ALTER COLUMN id SET DEFAULT nextval('public.tb_responsavel_id_seq'::regclass);


--
-- TOC entry 2711 (class 2604 OID 16894)
-- Name: tb_situacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_situacao ALTER COLUMN id SET DEFAULT nextval('public.tb_situacao_ts_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 17031)
-- Name: tb_tarefa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_tarefa ALTER COLUMN id SET DEFAULT nextval('public.tb_tarefa_id_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 16994)
-- Name: tb_usuariio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuariio ALTER COLUMN id SET DEFAULT nextval('public.tb_usuariio_id_seq'::regclass);


--
-- TOC entry 2862 (class 0 OID 16937)
-- Dependencies: 201
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flyway_schema_history VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'null', '2022-12-16 20:54:25.50902', 0, true);
INSERT INTO public.flyway_schema_history VALUES (2, '02', 'criar e registrar responsavel', 'SQL', 'V02__criar_e_registrar_responsavel.sql', 1884629722, 'postgres', '2022-12-17 00:41:08.701345', 84, true);
INSERT INTO public.flyway_schema_history VALUES (3, '03', 'registrar prioridades', 'SQL', 'V03__registrar_prioridades.sql', 208535323, 'postgres', '2022-12-17 00:41:08.829599', 11, true);
INSERT INTO public.flyway_schema_history VALUES (4, '04', 'criar e registrar executor', 'SQL', 'V04__criar_e_registrar_executor.sql', 1920330698, 'postgres', '2022-12-17 17:55:54.04554', 2, true);
INSERT INTO public.flyway_schema_history VALUES (5, '05', 'criar e registrar usuarios e permissoes', 'SQL', 'V05__criar_e_registrar_usuarios_e_permissoes.sql', -372709592, 'postgres', '2022-12-19 20:37:54.890027', 3, true);
INSERT INTO public.flyway_schema_history VALUES (6, '06', 'popular permissoes', 'SQL', 'V06__popular_permissoes.sql', 891560793, 'postgres', '2022-12-19 21:53:05.443072', 26, true);


--
-- TOC entry 2868 (class 0 OID 17040)
-- Dependencies: 207
-- Data for Name: tb_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_permissao VALUES (1, 'CADASTRAR_RESPONSAVEl');
INSERT INTO public.tb_permissao VALUES (2, 'PESQUISAR_RESPONSAVEL');
INSERT INTO public.tb_permissao VALUES (3, 'CADASTRAR_TAREFA');
INSERT INTO public.tb_permissao VALUES (4, 'REMOVER_TAREFA');
INSERT INTO public.tb_permissao VALUES (5, 'PESQUISAR_TAREFA');
INSERT INTO public.tb_permissao VALUES (6, 'PESQUISAR_SITUACAO');
INSERT INTO public.tb_permissao VALUES (7, 'PESQUISAR_PRIORIDADE');
INSERT INTO public.tb_permissao VALUES (8, 'REMOVER_PRIORIDADE');


--
-- TOC entry 2861 (class 0 OID 16902)
-- Dependencies: 200
-- Data for Name: tb_prioridade; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_prioridade VALUES (2, 'alta');
INSERT INTO public.tb_prioridade VALUES (1, 'sem prioridade');
INSERT INTO public.tb_prioridade VALUES (3, 'média');
INSERT INTO public.tb_prioridade VALUES (4, 'baixa');
INSERT INTO public.tb_prioridade VALUES (5, 'média');
INSERT INTO public.tb_prioridade VALUES (6, 'baixa');


--
-- TOC entry 2864 (class 0 OID 16975)
-- Dependencies: 203
-- Data for Name: tb_responsavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_responsavel VALUES (1, 'Vera');
INSERT INTO public.tb_responsavel VALUES (2, 'Estela');
INSERT INTO public.tb_responsavel VALUES (3, 'Márcio');


--
-- TOC entry 2859 (class 0 OID 16891)
-- Dependencies: 198
-- Data for Name: tb_situacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_situacao VALUES (1, 'Não iniciada');
INSERT INTO public.tb_situacao VALUES (2, 'Iniciada');
INSERT INTO public.tb_situacao VALUES (3, 'Concluída');


--
-- TOC entry 2857 (class 0 OID 16880)
-- Dependencies: 196
-- Data for Name: tb_tarefa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_tarefa VALUES ('Fazer documentação sistema TDS', 2, 2, '2022-12-18', '2022-12-20', 1, 1);
INSERT INTO public.tb_tarefa VALUES ('Fazer front-end com Angular', 3, 2, '2022-12-18', '2022-12-19', 2, 2);
INSERT INTO public.tb_tarefa VALUES ('Fazer a parte de segurança da API', 2, 1, '2022-12-17', '2022-12-17', 3, 3);
INSERT INTO public.tb_tarefa VALUES ('Fazer um projeto final para pelo menos ficar com 4', 3, 1, '2022-12-17', '2022-12-18', 1, 4);
INSERT INTO public.tb_tarefa VALUES ('Organizar a vida', 2, 1, '2022-12-18', '2022-12-20', 1, 5);
INSERT INTO public.tb_tarefa VALUES ('Estudar Angular', 1, 2, '2022-12-18', '2022-12-20', 2, 7);
INSERT INTO public.tb_tarefa VALUES ('Estudar CSS', 4, 2, '2022-12-18', '2022-12-20', 3, 9);


--
-- TOC entry 2866 (class 0 OID 16991)
-- Dependencies: 205
-- Data for Name: tb_usuariio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_usuariio VALUES (2, 'Maurício', 'mamae');
INSERT INTO public.tb_usuariio VALUES (3, 'Estela', 'pai');
INSERT INTO public.tb_usuariio VALUES (4, 'Márcio', 'athletico');
INSERT INTO public.tb_usuariio VALUES (5, 'usuário 3', 'teste');
INSERT INTO public.tb_usuariio VALUES (6, 'usuário33', 'teste');
INSERT INTO public.tb_usuariio VALUES (1, 'Admin', 'admin');


--
-- TOC entry 2869 (class 0 OID 17045)
-- Dependencies: 208
-- Data for Name: tb_usuario_permissao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tb_usuario_permissao VALUES (1, 1);
INSERT INTO public.tb_usuario_permissao VALUES (1, 2);
INSERT INTO public.tb_usuario_permissao VALUES (1, 3);
INSERT INTO public.tb_usuario_permissao VALUES (1, 4);
INSERT INTO public.tb_usuario_permissao VALUES (1, 5);
INSERT INTO public.tb_usuario_permissao VALUES (1, 6);
INSERT INTO public.tb_usuario_permissao VALUES (1, 7);
INSERT INTO public.tb_usuario_permissao VALUES (1, 8);
INSERT INTO public.tb_usuario_permissao VALUES (2, 2);
INSERT INTO public.tb_usuario_permissao VALUES (2, 5);
INSERT INTO public.tb_usuario_permissao VALUES (2, 6);
INSERT INTO public.tb_usuario_permissao VALUES (3, 1);
INSERT INTO public.tb_usuario_permissao VALUES (3, 2);
INSERT INTO public.tb_usuario_permissao VALUES (3, 3);
INSERT INTO public.tb_usuario_permissao VALUES (3, 4);
INSERT INTO public.tb_usuario_permissao VALUES (3, 5);
INSERT INTO public.tb_usuario_permissao VALUES (3, 6);
INSERT INTO public.tb_usuario_permissao VALUES (3, 7);
INSERT INTO public.tb_usuario_permissao VALUES (4, 2);
INSERT INTO public.tb_usuario_permissao VALUES (4, 5);
INSERT INTO public.tb_usuario_permissao VALUES (4, 6);


--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 199
-- Name: tb_prioridade_tp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_prioridade_tp_id_seq', 6, true);


--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 202
-- Name: tb_responsavel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_responsavel_id_seq', 3, true);


--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 197
-- Name: tb_situacao_ts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_situacao_ts_id_seq', 3, true);


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 206
-- Name: tb_tarefa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_tarefa_id_seq', 12, true);


--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 204
-- Name: tb_usuariio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tb_usuariio_id_seq', 6, true);


--
-- TOC entry 2723 (class 2606 OID 16945)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 2730 (class 2606 OID 17044)
-- Name: tb_permissao tb_permissao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_permissao
    ADD CONSTRAINT tb_permissao_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 16910)
-- Name: tb_prioridade tb_prioridade_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_prioridade
    ADD CONSTRAINT tb_prioridade_pk PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 16980)
-- Name: tb_responsavel tb_responsavel_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_responsavel
    ADD CONSTRAINT tb_responsavel_pk PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 16899)
-- Name: tb_situacao tb_situacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_situacao
    ADD CONSTRAINT tb_situacao_pk PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 17039)
-- Name: tb_tarefa tb_tarefa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_tarefa
    ADD CONSTRAINT tb_tarefa_pk PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 16996)
-- Name: tb_usuariio tb_usuariio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuariio
    ADD CONSTRAINT tb_usuariio_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 1259 OID 16946)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 2734 (class 2606 OID 17048)
-- Name: tb_usuario_permissao fk4de3jxmcyrmk42xejka2q77by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_permissao
    ADD CONSTRAINT fk4de3jxmcyrmk42xejka2q77by FOREIGN KEY (id_permissao) REFERENCES public.tb_permissao(id);


--
-- TOC entry 2735 (class 2606 OID 17053)
-- Name: tb_usuario_permissao fkhh3wipyeppgyurevg0rax736w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_usuario_permissao
    ADD CONSTRAINT fkhh3wipyeppgyurevg0rax736w FOREIGN KEY (id_usuario) REFERENCES public.tb_usuariio(id);


--
-- TOC entry 2731 (class 2606 OID 16922)
-- Name: tb_tarefa tb_tarefas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_tarefa
    ADD CONSTRAINT tb_tarefas_fk FOREIGN KEY (situacao) REFERENCES public.tb_situacao(id);


--
-- TOC entry 2732 (class 2606 OID 16927)
-- Name: tb_tarefa tb_tarefas_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_tarefa
    ADD CONSTRAINT tb_tarefas_fk_1 FOREIGN KEY (prioridade) REFERENCES public.tb_prioridade(id);


--
-- TOC entry 2733 (class 2606 OID 17024)
-- Name: tb_tarefa tb_tarefas_fk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_tarefa
    ADD CONSTRAINT tb_tarefas_fk_2 FOREIGN KEY (executor) REFERENCES public.tb_responsavel(id);


-- Completed on 2022-12-21 12:15:36

--
-- PostgreSQL database dump complete
--

