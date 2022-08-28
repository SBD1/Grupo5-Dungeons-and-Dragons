-- POPULAR ITENS
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Poção', 'Recupera 10pts de vida', 20, 15, 'P');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Mega Poção', 'Recupera 30pts de vida', 45, 35, 'P');

INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('X Força', 'Aumenta 5pts de Força por 3 turnos', 25, 20, 'B');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('X Sabedoria', 'Aumenta 5pts de Sabedoria por 3 turnos', 20, 15, 'B');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('X Destreza', 'Aumenta 5pts de destreza por 3 turnos', 15, 10, 'B');

INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Espada Velha', 'Arma meele básica de empunhadura simples', 100, 75, 'W');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Arco de Luz', 'Arma meele mágica de empunhadura simples', 120, 90, 'W');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Escudo Básico', 'Arma meele básica de empunhadura simples', 100, 75, 'W');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Bastão Extensível', 'Arma meele mágica de empunhadura dupla', 120, 90, 'W');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Clava Grande', 'Arma meele física de empunhadura dupla', 100, 75, 'W');

INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Chapeu Mágico', 'Equipamento mágico de cabeça', 200, 140, 'A');
INSERT INTO itens(nome, descricao, valor, valor_pos_compra, tipo) VALUES ('Manto da Invisibilidade', 'Equipamento mágico de tronco', 200, 140, 'A');


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
INSERT INTO categoria_item(nome) VALUES ('Recuperação & Performance');
INSERT INTO categoria_item(nome) VALUES ('Armas Brancas');
INSERT INTO categoria_item(nome) VALUES ('Itens Mágicos');
INSERT INTO categoria_item(nome) VALUES ('Armaduras Físicas');


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

