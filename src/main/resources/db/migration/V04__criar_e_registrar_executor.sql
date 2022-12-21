CREATE TABLE tb_executor (
	id serial4 NOT NULL,
	nome VARCHAR(50) NOT NULL,
	CONSTRAINT tb_executor_pk PRIMARY KEY (id)
);

INSERT INTO tb_executor (nome) values ('Marcio');
INSERT INTO tb_executor (nome) values ('Maurício');