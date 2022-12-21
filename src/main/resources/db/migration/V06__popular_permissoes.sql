INSERT INTO tb_permissao (id, descricao) values (2, 'PESQUISAR_RESPONSAVEL');

INSERT INTO tb_permissao (id, descricao) values (3, 'CADASTRAR_TAREFA');
INSERT INTO tb_permissao (id, descricao) values (4, 'REMOVER_TAREFA');
INSERT INTO tb_permissao (id, descricao) values (5, 'PESQUISAR_TAREFA');

INSERT INTO tb_permissao (id, descricao) values (6, 'PESQUISAR_SITUACAO');
INSERT INTO tb_permissao (id, descricao) values (7, 'PESQUISAR_PRIORIDADE');
INSERT INTO tb_permissao (id, descricao) values (8, 'REMOVER_PRIORIDADE');

-- Admin
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 1);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 2);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 3);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 4);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 5);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 6);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 7);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (1, 8);

-- Maurício
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (2, 2);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (2, 5);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (2, 6);

-- Estela
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 1);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 2);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 3);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 4);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 5);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 6);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (3, 7);

-- Márcio
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (4, 2);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (4, 5);
INSERT INTO tb_usuario_permissao (id_usuario, id_permissao) values (4, 6);

