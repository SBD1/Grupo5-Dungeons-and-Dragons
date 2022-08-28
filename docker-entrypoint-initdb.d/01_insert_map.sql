-- POPULAR MAPA
INSERT INTO mapa(nome) VALUES ('O Reino');

-- POPULAR REGIÕES
INSERT INTO regiao(nome, descricao)
VALUES ('Praça Central', 'Bem vindo à Praça Central!');
INSERT INTO regiao(nome, descricao)
VALUES ('Barraca de Poções', 'Bem vindo à Barraca de Poções!');
INSERT INTO regiao(nome, descricao)
VALUES ('Arsenal de Armas', 'Bem vindo ao Arsenal de Armas!');
INSERT INTO regiao(nome, descricao)
VALUES ('Guilda de Aventureiros', 'Bem vindo à Guilda de Aventureiros!');
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Comércio Local', 'Bem vindo ao Comércio Local!', 4, 1, 2, 3);

-- POPULAR REGIÕES_MAPA
INSERT INTO regiao_mapa VALUES (1, 1);
INSERT INTO regiao_mapa VALUES (1, 2);
INSERT INTO regiao_mapa VALUES (1, 3);
INSERT INTO regiao_mapa VALUES (1, 4);
INSERT INTO regiao_mapa VALUES (1, 5);

