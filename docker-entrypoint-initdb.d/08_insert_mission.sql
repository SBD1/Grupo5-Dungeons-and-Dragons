-- POPULAR MISSÕES
INSERT INTO missao(descricao)
VALUES ('Registro na Guilda de Aventureiros');
INSERT INTO missao(descricao)
VALUES ('Derrotar um Morto-vivo');

-- POPULAR REQUISITOS DE MISSÕES
INSERT INTO requisitos_missao(id_missao, descricao)
VALUES (2, 'Estar registrado na Guilda de Aventureiros');

-- POPULAR OBJETIVOS DE MISSÕES
INSERT INTO objetivo_missao(id_missao, descricao)
VALUES (1, 'Se registrar como Aventureiro na Guilda');
INSERT INTO objetivo_missao(id_objetivo_missao, id_missao, descricao)
VALUES (2, 'Matar 1 Morto-vivo');