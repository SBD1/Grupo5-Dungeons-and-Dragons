-- POPULAR MISSÕES
INSERT INTO missao(id_missao, descricao)
VALUES (1, 'Registro na Guilda de Aventureiros');
INSERT INTO missao(id_missao, descricao)
VALUES (2, 'Derrotar um Morto-vivo');

-- POPULAR REQUISITOS DE MISSÕES
INSERT INTO requisitos_missao(id_requisitos_missao, id_missao, descricao)
VALUES (1, 2, 'Estar registrado na Guilda de Aventureiros');

-- POPULAR OBJETIVOS DE MISSÕES
INSERT INTO objetivo_missao(id_objetivo_missao, id_missao, descricao)
VALUES (1, 1, 'Se registrar como Aventureiro na Guilda');
INSERT INTO objetivo_missao(id_objetivo_missao, id_missao, descricao)
VALUES (2, 2, 'Matar 1 Morto-vivo');