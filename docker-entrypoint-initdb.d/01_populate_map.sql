-- POPULAR MAPA
INSERT INTO mapa(nome)
VALUES ('Redondezas do Reino');

-- POPULAR REGIÕES
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Caverna',
        'Uma busca pela saída da caverna, mas o que é isso?
        Pode ser que exista algo ao norte' ||
        'Será que devo continuar ao norte? Mas que escolha eu tenho?' ||
        'Uma luz ao norte, acho melhor seguir',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Sul de Phandalin',
        'O sul de uma pequena vila, existe uma saída para uma caverna e um aparente amigo. Seria um guia?' ||
        '"Venha e se aventure na Caverna" grita um morador da cidade, porém parece ser um pedido de ajuda' ||
        'O que aquele homem está olhando? Será que está querendo algo da caverna?',
        null,
        null,
        null,
        1);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Centro de Phandalin', 
        'Parece ser um local bem movimentado com alguns mercadores, talvez seja interessante trocar armas e armaduras' ||
        'Um comércio? Talvez seja o momento de escolher novas armas e armaduras' ||
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Entrada de Phandalin', 
        'Bem vindo à Phandalin' ||
        'Está em uma pequena vila chamada Phandalin, talvez seja interessante buscar conhecer um pouco mais'
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Floresta em volta de Phandalin', 
        'Uma densa floresta, quem sabe o que podemos achar aqui?' ||
        'Que barulhos são esses, talvez eu deva verificar'
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Esconderijo dos Bandidos', 
        'Que movimentação é essa? Será que é seguro?' ||
        'Que barulhos são esses, talvez eu deva verificar'
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Floresta em volta de Neverwinters', 
        'São barulhos das folhas? Tem está escondido?' ||
        'Uma floresta com alguns pequenos sons de passos, será algum animal?'
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Esconderijo dos goblins', 
        'Um esconderijo de alguns goblins, o que pode acontecer aqui?' ||
        'São 2 goblins, devem estar descansando' ||
        'Dois Goblins sentados, estão esperando algo?'
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Interior da Caverna', 
        '"ti ti ti ti ti" esses morcegos não param de aparecer' ||
        'Está tudo escuro e úmido para onde será a saída?' ||
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Estábulo de Neverwinter', 
        'Os cavalos parecem agitados' 
        "iiirrrrí" ||
        'Talvez seja melhor conversar com alguém, seria interessante ajudar com os cavalos' ||
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Centro de Neverwinter', 
        'Bem-Vindo ao centro de Neverwinter, as melhores poções das redondezas' ||
        'Um lugar movimentado, com barraquinhas e guerreiros comprando poções para sair em alguma aventura' ||
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste)
VALUES ('Saída da Caverna', 
        'Seria a luz que me leva para a saída?' ||
        'Continua muito escuro, porém alguns feixes de luz mostram que a saída está perto'
        null,
        null,
        null,
        null);


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
INSERT INTO regiao_mapa
VALUES (1, 6);
INSERT INTO regiao_mapa
VALUES (1, 7);
INSERT INTO regiao_mapa
VALUES (1, 8);
INSERT INTO regiao_mapa
VALUES (1, 9);
INSERT INTO regiao_mapa
VALUES (1, 10);
INSERT INTO regiao_mapa
VALUES (1, 11);
INSERT INTO regiao_mapa
VALUES (1, 12);

