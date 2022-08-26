-- POPULAR MAPA
INSERT INTO mapa VALUES (1, 'O Reino');

-- POPULAR REGIÕES
INSERT INTO regiao(id_regiao, nome, descricao)
VALUES (1, 'Praça Central', 'Bem vindo à Praça Central!');
INSERT INTO regiao(id_regiao, nome, descricao)
VALUES (2, 'Barraca de Poções', 'Bem vindo à Barraca de Poções!');
INSERT INTO regiao(id_regiao, nome, descricao)
VALUES (3, 'Arsenal de Armas', 'Bem vindo ao Arsenal de Armas!');
INSERT INTO regiao(id_regiao, nome, descricao)
VALUES (4, 'Guilda de Aventureiros', 'Bem vindo à Guilda de Aventureiros!');
INSERT INTO regiao(id_regiao, nome, descricao, norte, sul, oeste, leste)
VALUES (5, 'Comércio Local', 'Bem vindo ao Comércio Local!', 4, 1, 2, 3);

-- POPULAR REGIÕES_MAPA
INSERT INTO regiao_mapa VALUES (1, 1);
INSERT INTO regiao_mapa VALUES (1, 2);
INSERT INTO regiao_mapa VALUES (1, 3);
INSERT INTO regiao_mapa VALUES (1, 4);
INSERT INTO regiao_mapa VALUES (1, 5);

