-- POPULAR NPCS
INSERT INTO npc(nome, tipo) VALUES ('Fineas, o Ferreiro', 'M');
INSERT INTO npc(nome, tipo) VALUES ('Edvan, Mestre de Poções', 'M');
INSERT INTO npc(nome, tipo) VALUES ('Martha, Gerente da Guilda', 'N');
INSERT INTO npc(nome, tipo) VALUES ('Morto-vivo', 'I');
INSERT INTO npc(nome, tipo) VALUES ('Mímico', 'I');

-- POPULAR DIALOGOS
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (1, 'Apenas armas de primeira por aqui...por um preço justo é claro');
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (2, 'Muito complexa a arte do preparo de poções, sempre melhor comprar do melhor');
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (3, 'Olá jovem, bem vindo(a) à Guilda de Aventureiros!!');
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (3, 'Deseja consultar os papiros de Missões Disponíveis??');
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (4, 'AURGH....');
INSERT INTO dialogo_npc(id_npc, dialogo) VALUES (5, 'RWAHHHH!!!');

-- POPULAR INIMIGOS
INSERT INTO inimigo VALUES (4, 8, 3);
INSERT INTO inimigo VALUES (5, 15, 4);

-- POPULAR MERCADORES
INSERT INTO mercador VALUES (1, 2);
INSERT INTO mercador VALUES (2, 1);
