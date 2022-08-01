-- POPULAR RAÇAS
INSERT INTO public.raca(id_raca, nome) VALUES (1, 'Anão');
INSERT INTO public.raca(id_raca, nome) VALUES (2, 'Humano');
INSERT INTO public.raca(id_raca, nome) VALUES (3, 'Elfo');
INSERT INTO public.raca(id_raca, nome) VALUES (4, 'Orc');
INSERT INTO public.raca(id_raca, nome) VALUES (5, 'Halfling');

-- POPULAR CLASSES
INSERT INTO public.classe(id_classe, nome) VALUES (1, 'Ranger');
INSERT INTO public.classe(id_classe, nome) VALUES (2, 'Cavaleiro');
INSERT INTO public.classe(id_classe, nome) VALUES (3, 'Acrobata');
INSERT INTO public.classe(id_classe, nome) VALUES (4, 'Mago');
INSERT INTO public.classe(id_classe, nome) VALUES (5, 'Assassino');
INSERT INTO public.classe(id_classe, nome) VALUES (6, 'Bárbaro');

-- POPULAR HABILIDADES
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (1, 'Caçador', 'Proficiência em rastreamento');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (1, 'Arsenal LD', 'Proficiência em armas de longa distância');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (2, 'Animal Handling', 'Proficiência em cavalgar');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (3, 'Acrobatics', 'Proficiência em escalada');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (3, 'Arsenal Meele', 'Proficiência em armas meele');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (4, 'Feitiçaria', 'Proficiência na produção de magia');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (5, 'Carisma', 'Habilidade de persuasão e convencimento');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (5, 'Ladrão', 'Proficiência em escape e furtividade');
INSERT INTO public.habilidades_classe(fk_id_classe, nome, descricao)
VALUES (6, 'Viking', 'Proficiência em machados e martelos');

-- POPULAR CORPOS
INSERT INTO public.corpo(id_corpo) VALUES (1);
INSERT INTO public.corpo(id_corpo) VALUES (2);
INSERT INTO public.corpo(id_corpo) VALUES (3);
INSERT INTO public.corpo(id_corpo) VALUES (4);
INSERT INTO public.corpo(id_corpo) VALUES (5);
INSERT INTO public.corpo(id_corpo) VALUES (6);

-- POPULAR ATRIBUTOS
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (1, 5, 4, 5, 3, 5, 4);
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (2, 3, 4, 3, 3, 2, 3);
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (3, 6, 4, 4, 3, 3, 3);
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (4, 2, 3, 4, 2, 3, 2);
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (5, 4, 3, 4, 2, 3, 2);
INSERT INTO public.atributos(id_atributo, destreza, carisma, inteligencia, forca, sabedoria, constituicao)
VALUES (6, 3, 3, 3, 1, 2, 2);

-- POPULAR INVENTÁRIOS
INSERT INTO public.inventario(id_inventario) VALUES (1);
INSERT INTO public.inventario(id_inventario) VALUES (2);
INSERT INTO public.inventario(id_inventario) VALUES (3);
INSERT INTO public.inventario(id_inventario) VALUES (4);
INSERT INTO public.inventario(id_inventario) VALUES (5);
INSERT INTO public.inventario(id_inventario) VALUES (6);

-- POPULAR AVENTUREIROS
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (1, 'Hank', 3, 1, 1, 1, 1);
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (2, 'Eric', 2, 2, 2, 2, 2);
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (3, 'Diana', 2, 3, 3, 3, 3);
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (4, 'Presto', 3, 4, 4, 4, 4);
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (5, 'Sheila', 5, 5, 5, 5, 5);
INSERT INTO public.aventureiro(id_aventureiro, nome, fk_id_raca, fk_id_classe, fk_id_corpo, fk_id_inventario, fk_id_atributo)
VALUES (6, 'Bobby', 4, 6, 6, 6, 6);


-- POPULAR ITENS
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (1, 'Poção', 'Recupera 10pts de vida', 20, 15, 'C');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (2, 'Mega Poção', 'Recupera 30pts de vida', 45, 35, 'C');

INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (3, 'X Força', 'Aumenta 5pts de Força por 3 turnos', 25, 20, 'C');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (4, 'X Sabedoria', 'Aumenta 5pts de Sabedoria por 3 turnos', 20, 15, 'C');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (5, 'X Destreza', 'Aumenta 5pts de destreza por 3 turnos', 15, 10, 'C');

INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (6, 'Espada Velha', 'Arma meele básica de empunhadura simples', 100, 75, 'E');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (7, 'Arco de Luz', 'Arma meele mágica de empunhadura simples', 120, 90, 'E');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (8, 'Escudo Básico', 'Arma meele básica de empunhadura simples', 100, 75, 'E');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (9, 'Bastão Extensível', 'Arma meele mágica de empunhadura dupla', 120, 90, 'E');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (10, 'Clava Grande', 'Arma meele física de empunhadura dupla', 100, 75, 'E');

INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (11, 'Chapeu Mágico', 'Equipamento mágico de cabeça', 200, 140, 'E');
INSERT INTO public.itens(id_item, nome, descricao, valor, valor_pos_compra, natureza_item)
VALUES (12, 'Manto da Invisibilidade', 'Equipamento mágico de tronco', 200, 140, 'E');


-- POPULAR POÇÕES
INSERT INTO public.pocao(fk_id_item, vida_recuperada)
VALUES (1, 10);
INSERT INTO public.pocao(fk_id_item, vida_recuperada)
VALUES (2, 30);

-- POPULAR BOOSTS
INSERT INTO public.boost(fk_id_item, atributo, duracao, pontos_aumentados)
VALUES (3, 'Força', 3, 5);
INSERT INTO public.boost(fk_id_item, atributo, duracao, pontos_aumentados)
VALUES (4, 'Sabedoria', 3, 5);
INSERT INTO public.boost(fk_id_item, atributo, duracao, pontos_aumentados)
VALUES (5, 'Destreza', 3, 5);

-- POPULAR ARMAS
INSERT INTO public.arma(fk_id_item, dano, tipo)
VALUES (6, 10, 'Espada');
INSERT INTO public.arma(fk_id_item, dano, tipo)
VALUES (7, 25, 'Arco');
INSERT INTO public.arma(fk_id_item, dano, tipo)
VALUES (8, 15, 'Escudo');
INSERT INTO public.arma(fk_id_item, dano, tipo)
VALUES (9, 20, 'Bastão');
INSERT INTO public.arma(fk_id_item, dano, tipo)
VALUES (10, 40, 'Clava');

-- POPULAR ARMADURAS
INSERT INTO public.armadura(fk_id_item, resistencia, tipo, parte_corpo)
VALUES (11, 2, 'Veste', 'cabeça');
INSERT INTO public.armadura(fk_id_item, resistencia, tipo, parte_corpo)
VALUES (12, 2, 'Veste', 'tronco');

-- POPULAR CATEGORIAS
INSERT INTO public.categoria_item(id_categoria_item, nome)
VALUES (1, 'Recuperação & Performance');
INSERT INTO public.categoria_item(id_categoria_item, nome)
VALUES (2, 'Armas Brancas');
INSERT INTO public.categoria_item(id_categoria_item, nome)
VALUES (3, 'Itens Mágicos');
INSERT INTO public.categoria_item(id_categoria_item, nome)
VALUES (4, 'Armaduras Físicas');


-- POPULAR ITENS X CATEGORIAS
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (1, 1);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (1, 2);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (1, 3);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (1, 4);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (1, 5);

INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (2, 6);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (2, 8);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (2, 10);

INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (3, 7);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (3, 9);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (3, 11);
INSERT INTO public.itens_por_categoria(fk_id_categoria_item, fk_id_item)
VALUES (3, 12);


-- POPULAR NPCS
INSERT INTO public.npc(id_npc, nome)
VALUES (1, 'Fineas, o Ferreiro');
INSERT INTO public.npc(id_npc, nome)
VALUES (2, 'Edvan, Mestre de Poções');
INSERT INTO public.npc(id_npc, nome)
VALUES (3, 'Martha, Gerente da Guilda');
INSERT INTO public.npc(id_npc, nome)
VALUES (4, 'Morto-vivo');
INSERT INTO public.npc(id_npc, nome)
VALUES (5, 'Mímico');

-- POPULAR DIALOGOS
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (1, 1, 'Apenas armas de primeira por aqui...por um preço justo é claro');
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (2, 2, 'Muito complexa a arte do preparo de poções, sempre melhor comprar do melhor');
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (3, 3, 'Olá jovem, bem vindo(a) à Guilda de Aventureiros!!');
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (4, 3, 'Deseja consultar os papiros de Missões Disponíveis??');
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (5, 4, 'AURGH....');
INSERT INTO public.dialogo_npc(id_dialogo, fk_id_npc, dialogo)
VALUES (6, 5, 'RWAHHHH!!!');

-- POPULAR INIMIGOS
INSERT INTO public.inimigo(fk_id_npc, vida, dano)
VALUES (4, 8, 3);
INSERT INTO public.inimigo(fk_id_npc, vida, dano)
VALUES (5, 15, 4);

-- POPULAR MERCADORES
INSERT INTO public.mercador(fk_id_npc, fk_id_categoria_item)
VALUES (1, 2);
INSERT INTO public.mercador(fk_id_npc, fk_id_categoria_item)
VALUES (2, 1);


-- POPULAR MAPA
INSERT INTO public.mapa(id_mapa, nome)
VALUES (1, 'O Reino');

-- POPULAR REGIÕES
INSERT INTO public.regiao(id_regiao, nome, descricao)
VALUES (1, 'Praça Central', 'Bem vindo à Praça Central!');
INSERT INTO public.regiao(id_regiao, nome, descricao)
VALUES (2, 'Barraca de Poções', 'Bem vindo à Barraca de Poções!');
INSERT INTO public.regiao(id_regiao, nome, descricao)
VALUES (3, 'Arsenal de Armas', 'Bem vindo ao Arsenal de Armas!');
INSERT INTO public.regiao(id_regiao, nome, descricao)
VALUES (4, 'Guilda de Aventureiros', 'Bem vindo à Guilda de Aventureiros!');
INSERT INTO public.regiao(id_regiao, nome, descricao, fk_norte, fk_sul, fk_oeste, fk_leste)
VALUES (5, 'Comércio Local', 'Bem vindo ao Comércio Local!', 4, 1, 2, 3);

-- POPULAR REGIÕES_MAPA
INSERT INTO public.regiao_mapa(fk_id_mapa, fk_id_regiao)
VALUES (1, 1);
INSERT INTO public.regiao_mapa(fk_id_mapa, fk_id_regiao)
VALUES (1, 2);
INSERT INTO public.regiao_mapa(fk_id_mapa, fk_id_regiao)
VALUES (1, 3);
INSERT INTO public.regiao_mapa(fk_id_mapa, fk_id_regiao)
VALUES (1, 4);
INSERT INTO public.regiao_mapa(fk_id_mapa, fk_id_regiao)
VALUES (1, 5);


-- POPULAR MISSÕES
INSERT INTO public.missao(id_missao, descricao)
VALUES (1, 'Registro na Guilda de Aventureiros');
INSERT INTO public.missao(id_missao, descricao)
VALUES (2, 'Derrotar um Morto-vivo');

-- POPULAR REQUISITOS DE MISSÕES
INSERT INTO public.requisitos_missao(id_requisitos_missao, fk_id_missao, descricao)
VALUES (1, 2, 'Estar registrado na Guilda de Aventureiros');

-- POPULAR OBJETIVOS DE MISSÕES
INSERT INTO public.objetivo_missao(id_objetivo_missao, fk_id_missao, descricao)
VALUES (1, 1, 'Se registrar como Aventureiro na Guilda');
INSERT INTO public.objetivo_missao(id_objetivo_missao, fk_id_missao, descricao)
VALUES (2, 2, 'Matar 1 Morto-vivo');

-- POPULAR STATUS DOS REQUISITOS DE MISSÕES
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 1);
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 2);
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 3);
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 4);
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 5);
INSERT INTO public.status_requisitos_missao(fk_id_requisitos_missao, fk_id_aventureiro)
VALUES (1, 6);

-- POPULAR STATUS DOS OBJETIVOS DE MISSÕES
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 1);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 2);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 3);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 4);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 5);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (1, 6);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 1);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 2);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 3);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 4);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 5);
INSERT INTO public.status_objetivo_missao(fk_id_objetivo_missao, fk_id_aventureiro)
VALUES (2, 6);