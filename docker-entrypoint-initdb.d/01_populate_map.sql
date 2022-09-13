-- POPULAR MAPA
INSERT INTO mapa(nome)
VALUES ('Redondezas do Reino');

-- POPULAR REGIÕES
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 1
VALUES ('Caverna',
        'Uma caverna onde não se sabe o qual profunda é...' ||
        'Cheia de musgo, estalactites, estalagmites, insetos e barulhos estranhos' ||
        'Esses barulhos parecem grunhidos, será se vale a pena investigar mais a fundo?',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 2
VALUES ('Sul de Phandalin',
        'O sul de uma pequena vila, existem poucas casas, algumas de pedra, outras de alvenaria, mas tudo muito simples e singelo ' ||
        'O chão é na maior parte apenas lama e pedras, as ruas são bem rústicas e tem pouco movimento... ' ||
        'você avista o que aparenta ser uma pessoa amigável. ' ||
        '"Eu vi! Eu vi! Tem monstros na caverna!" grita um morador da cidade, isso está parecendo ser um pedido de ajuda ' ||
        'O que aquele homem está olhando? Será que está querendo algo da caverna?',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 3
VALUES ('Centro de Phandalin', 
        'Apesar de ser uma cidade pequena e com pouco movimento, você avista alguns mercadores, talvez seja interessante trocar armas e armaduras ' ||
        'Não existem muitas tavernas nesta cidade, porém as que existem são bem acolhedoras ' ||
        'Existem poucos guardas, um trabalhadores simples e umas pessoas mal encaradas andando pela cidade ' ||
        'Você escuta rumores sobre ataques de goblins nas redondezas.',
        null,
        null,
        null,
        null);
INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 4
VALUES ('Entrada de Phandalin', 
        '"Bem vindo à Phandalin", mostra uma placa rústica feita de madeira, ' ||
        'Aparentemente é uma vila bem nova, olhando de longe parece que essa cidade está sendo reaproveitada das ruínas de uma cidade antiga... ' ||
        'Você vê alguns poucos guardas na entrada, um estábulo pequeno, e conforme você vai entrando na cidade as pessoas vão te olhando com um ar de curiosidade e estranheza ' ||
        'claramente você é um estrangeiro e as pessoas notam isso, em poucos instantes , para evitar problemas, elas voltam a fazer o que estavam fazendo.',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 5
VALUES ('Floresta em volta de Phandalin', 
        'Uma densa floresta, quem sabe o que podemos achar aqui?' ||
        'Você vê sinais de que alguém possa ter passado recentemente por ali, ' ||
        'vê pegadas de cavalos e de outras pessoas... observando mais atentamente vê sinais de fogueira',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 6
VALUES ('Esconderijo dos Bandidos', 
        'Que movimentação é essa? Será que é seguro?' ||
        'Que barulhos são esses, talvez eu deva verificar',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 7
VALUES ('Floresta em volta de Neverwinters', 
        'São barulhos das folhas? Tem está escondido?' ||
        'Uma floresta com alguns pequenos sons de passos, será algum animal?',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 8
VALUES ('Esconderijo dos goblins', 
        'Um esconderijo de alguns goblins, o que pode acontecer aqui? ' ||
        'São 2 goblins, devem estar descansando ' ||
        'Dois Goblins sentados, estão esperando algo? ',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 9
VALUES ('Interior da Caverna', 
        '"ti ti ti ti ti" esses morcegos não param de aparecer ' ||
        'Está tudo escuro e úmido para onde será a saída?',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 10
VALUES ('Estábulo de Neverwinter', 
        'Os cavalos parecem agitados' ||
        '***iiirrrrí***' ||
        'Esse é o ultimo ponto da saída da cidade, você vê um caminho de terra que vai em direção a uma floresta',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 11
VALUES ('Centro de Neverwinter', 
        '"Bem-Vindo ao centro de Neverwinter, as melhores poções das redondezas", você escuta um mercador anunciando em uma praça movimentada! ' ||
        'Um lugar muito movimentado, com várias tavernas, muitos mercadores, muitas pessoas de todas as raças e profissões, ' ||
        'Certamente é um bom lugar para arrumar trabalhos e conhecer pessoas, ande por aí, explore o lugar, conheça pessoas, faça sua aventura!',
        null,
        null,
        null,
        null);

INSERT INTO regiao(nome, descricao, norte, sul, oeste, leste) -- 12
VALUES ('Saída da Caverna', 
        'Seria a luz que me leva para a saída?' ||
        'Continua muito escuro, porém alguns feixes de luz mostram que a saída está perto',
        null,
        null,
        null,
        null);



-- INTERLIGA REGIÕES

call connect_regiao(1,2, 'norte');

call connect_regiao(2,3, 'norte');

call connect_regiao(3, 4, 'leste');

call connect_regiao(3, 12, 'oeste');

call connect_regiao(3, 8, 'norte');

call connect_regiao(4, 7, 'norte');

call connect_regiao(4, 5, 'leste');

call connect_regiao(5, 6, 'leste');

call connect_regiao(7, 8, 'oeste');

call connect_regiao(7, 10, 'norte');

call connect_regiao(8, 9, 'oeste');

call connect_regiao(9, 12, 'sul');

call connect_regiao(10, 11, 'leste');


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
