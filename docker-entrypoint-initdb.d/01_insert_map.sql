-- POPULAR MAPA
INSERT INTO mapa(nome)
VALUES ('O Reino');

-- POPULAR REGIÕES
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Centro de Neverwinter',
        'Neverwinter é uma cidade relativamente grande, bem movimentada,' ||
        ' cheia de mercadores, compradores, bares e mercenários!' ||
        'Você está no centro da cidade em uma praça movimentada!',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Estabulo de Neverwinter',
        'O estábulo possui muitos cavalos e um gerente amigável...' ||
        '"Venha e traga seu cavalo! Aqui ele come bem e dorme bem!" grita o' ||
        ' gerente mercador fazendo propaganda do estábulo.',
        null,
        null,
        null,
        1);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Arsenal de Armas', 'Bem vindo ao Arsenal de Armas!',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Guilda de Aventureiros', 'Bem vindo à Guilda de Aventureiros!',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Comércio Local', 'Bem vindo ao Comércio Local!', 4, 1, 2, 3);

-- POPULAR REGIÕES_MAPA
INSERT INTO regiao_mapa
VALUES (1, 1);
INSERT INTO regiao_mapa
VALUES (1, 2);
INSERT INTO regiao_mapa
VALUES (1, 3);
INSERT INTO regiao_mapa
VALUES (1, 4);
INSERT INTO regiao_mapa
VALUES (1, 5);

