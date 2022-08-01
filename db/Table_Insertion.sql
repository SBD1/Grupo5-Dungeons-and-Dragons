-- POPULAR RAÇAS
INSERT INTO raca VALUES (1, 'Anão');
INSERT INTO raca VALUES (2, 'Humano');
INSERT INTO raca VALUES (3, 'Elfo');
INSERT INTO raca VALUES (4, 'Orc');
INSERT INTO raca VALUES (5, 'Halfling');

-- POPULAR CLASSES
INSERT INTO classe VALUES (1, 'Ranger');
INSERT INTO classe VALUES (2, 'Cavaleiro');
INSERT INTO classe VALUES (3, 'Acrobata');
INSERT INTO classe VALUES (4, 'Mago');
INSERT INTO classe VALUES (5, 'Assassino');
INSERT INTO classe VALUES (6, 'Bárbaro');

-- POPULAR HABILIDADES
INSERT INTO habilidades_classe
VALUES (1, 'Caçador', 'Proficiência em rastreamento');
INSERT INTO habilidades_classe
VALUES (1, 'Arsenal LD', 'Proficiência em armas de longa distância');
INSERT INTO habilidades_classe
VALUES (2, 'Animal Handling', 'Proficiência em cavalgar');
INSERT INTO habilidades_classe
VALUES (3, 'Acrobatics', 'Proficiência em escalada');
INSERT INTO habilidades_classe
VALUES (3, 'Arsenal Meele', 'Proficiência em armas meele');
INSERT INTO habilidades_classe
VALUES (4, 'Feitiçaria', 'Proficiência na produção de magia');
INSERT INTO habilidades_classe
VALUES (5, 'Carisma', 'Habilidade de persuasão e convencimento');
INSERT INTO habilidades_classe
VALUES (5, 'Ladrão', 'Proficiência em escape e furtividade');
INSERT INTO habilidades_classe
VALUES (6, 'Viking', 'Proficiência em machados e martelos');

-- POPULAR AVENTUREIROS
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (1, 'Hank', 3, 1);
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (2, 'Eric', 2, 2);
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (3, 'Diana', 2, 3);
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (4, 'Presto', 3, 4);
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (5, 'Sheila', 5, 5);
INSERT INTO aventureiro(id_aventureiro, nome, raca, classe) VALUES (6, 'Bobby', 4, 6);

-- POPULAR CORPOS
INSERT INTO corpo(id_corpo) VALUES (1);
INSERT INTO corpo(id_corpo) VALUES (2);
INSERT INTO corpo(id_corpo) VALUES (3);
INSERT INTO corpo(id_corpo) VALUES (4);
INSERT INTO corpo(id_corpo) VALUES (5);
INSERT INTO corpo(id_corpo) VALUES (6);

-- POPULAR ATRIBUTOS
INSERT INTO atributos VALUES (1, 5, 4, 5, 3, 5, 4);
INSERT INTO atributos VALUES (2, 3, 4, 3, 3, 2, 3);
INSERT INTO atributos VALUES (3, 6, 4, 4, 3, 3, 3);
INSERT INTO atributos VALUES (4, 2, 3, 4, 2, 3, 2);
INSERT INTO atributos VALUES (5, 4, 3, 4, 2, 3, 2);
INSERT INTO atributos VALUES (6, 3, 3, 3, 1, 2, 2);

-- POPULAR INVENTÁRIOS
INSERT INTO inventario(id_inventario) VALUES (1);
INSERT INTO inventario(id_inventario) VALUES (2);
INSERT INTO inventario(id_inventario) VALUES (3);
INSERT INTO inventario(id_inventario) VALUES (4);
INSERT INTO inventario(id_inventario) VALUES (5);
INSERT INTO inventario(id_inventario) VALUES (6);


-- POPULAR ITENS
INSERT INTO itens VALUES (1, 'Poção', 'Recupera 10pts de vida', 20, 15, 'C');
INSERT INTO itens VALUES (2, 'Mega Poção', 'Recupera 30pts de vida', 45, 35, 'C');

INSERT INTO itens VALUES (3, 'X Força', 'Aumenta 5pts de Força por 3 turnos', 25, 20, 'C');
INSERT INTO itens VALUES (4, 'X Sabedoria', 'Aumenta 5pts de Sabedoria por 3 turnos', 20, 15, 'C');
INSERT INTO itens VALUES (5, 'X Destreza', 'Aumenta 5pts de destreza por 3 turnos', 15, 10, 'C');

INSERT INTO itens VALUES (6, 'Espada Velha', 'Arma meele básica de empunhadura simples', 100, 75, 'E');
INSERT INTO itens VALUES (7, 'Arco de Luz', 'Arma meele mágica de empunhadura simples', 120, 90, 'E');
INSERT INTO itens VALUES (8, 'Escudo Básico', 'Arma meele básica de empunhadura simples', 100, 75, 'E');
INSERT INTO itens VALUES (9, 'Bastão Extensível', 'Arma meele mágica de empunhadura dupla', 120, 90, 'E');
INSERT INTO itens VALUES (10, 'Clava Grande', 'Arma meele física de empunhadura dupla', 100, 75, 'E');

INSERT INTO itens VALUES (11, 'Chapeu Mágico', 'Equipamento mágico de cabeça', 200, 140, 'E');
INSERT INTO itens VALUES (12, 'Manto da Invisibilidade', 'Equipamento mágico de tronco', 200, 140, 'E');


-- POPULAR POÇÕES
INSERT INTO pocao VALUES (1, 10);
INSERT INTO pocao VALUES (2, 30);

-- POPULAR BOOSTS
INSERT INTO boost VALUES (3, 'Força', 3, 5);
INSERT INTO boost VALUES (4, 'Sabedoria', 3, 5);
INSERT INTO boost VALUES (5, 'Destreza', 3, 5);

-- POPULAR ARMAS
INSERT INTO arma VALUES (6, 10, 'Espada');
INSERT INTO arma VALUES (7, 25, 'Arco');
INSERT INTO arma VALUES (8, 15, 'Escudo');
INSERT INTO arma VALUES (9, 20, 'Bastão');
INSERT INTO arma VALUES (10, 40, 'Clava');

-- POPULAR ARMADURAS
INSERT INTO armadura VALUES (11, 2, 'Veste', 'C');
INSERT INTO armadura VALUES (12, 2, 'Veste', 'T');

-- POPULAR CATEGORIAS
INSERT INTO categoria_item VALUES (1, 'Recuperação & Performance');
INSERT INTO categoria_item VALUES (2, 'Armas Brancas');
INSERT INTO categoria_item VALUES (3, 'Itens Mágicos');
INSERT INTO categoria_item VALUES (4, 'Armaduras Físicas');


-- POPULAR ITENS X CATEGORIAS
INSERT INTO itens_por_categoria VALUES (1, 1);
INSERT INTO itens_por_categoria VALUES (1, 2);
INSERT INTO itens_por_categoria VALUES (1, 3);
INSERT INTO itens_por_categoria VALUES (1, 4);
INSERT INTO itens_por_categoria VALUES (1, 5);

INSERT INTO itens_por_categoria VALUES (2, 6);
INSERT INTO itens_por_categoria VALUES (2, 8);
INSERT INTO itens_por_categoria VALUES (2, 10);

INSERT INTO itens_por_categoria VALUES (3, 7);
INSERT INTO itens_por_categoria VALUES (3, 9);
INSERT INTO itens_por_categoria VALUES (3, 11);
INSERT INTO itens_por_categoria VALUES (3, 12);


-- POPULAR NPCS
INSERT INTO npc VALUES (1, 'Fineas, o Ferreiro');
INSERT INTO npc VALUES (2, 'Edvan, Mestre de Poções');
INSERT INTO npc VALUES (3, 'Martha, Gerente da Guilda');
INSERT INTO npc VALUES (4, 'Morto-vivo');
INSERT INTO npc VALUES (5, 'Mímico');

-- POPULAR DIALOGOS
INSERT INTO dialogo_npc VALUES (1, 1, 'Apenas armas de primeira por aqui...por um preço justo é claro');
INSERT INTO dialogo_npc VALUES (2, 2, 'Muito complexa a arte do preparo de poções, sempre melhor comprar do melhor');
INSERT INTO dialogo_npc VALUES (3, 3, 'Olá jovem, bem vindo(a) à Guilda de Aventureiros!!');
INSERT INTO dialogo_npc VALUES (4, 3, 'Deseja consultar os papiros de Missões Disponíveis??');
INSERT INTO dialogo_npc VALUES (5, 4, 'AURGH....');
INSERT INTO dialogo_npc VALUES (6, 5, 'RWAHHHH!!!');

-- POPULAR INIMIGOS
INSERT INTO inimigo VALUES (4, 8, 3);
INSERT INTO inimigo VALUES (5, 15, 4);

-- POPULAR MERCADORES
INSERT INTO mercador VALUES (1, 2);
INSERT INTO mercador VALUES (2, 1);


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

-- POPULAR STATUS DOS REQUISITOS DE MISSÕES
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 1);
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 2);
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 3);
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 4);
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 5);
INSERT INTO status_requisitos_missao(requisitos_missao, aventureiro) VALUES (1, 6);

-- POPULAR STATUS DOS OBJETIVOS DE MISSÕES
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 1);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 2);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 3);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 4);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 5);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (1, 6);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 1);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 2);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 3);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 4);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 5);
INSERT INTO status_objetivo_missao(objetivo_missao, aventureiro) VALUES (2, 6);