CREATE TABLE tb_responsavel (
	id serial4 NOT NULL,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT tb_responsavel_pk PRIMARY KEY (id)
);

INSERT INTO tb_responsavel (nome) values ('Vera');
INSERT INTO tb_responsavel (nome) values ('Estela');
