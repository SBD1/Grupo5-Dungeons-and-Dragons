create table raca
(id_raca serial primary key,
 nome varchar(50)
);

create table classe
(id_classe serial primary key,
 nome varchar(50)
);

create table mapa
(id_mapa serial primary key,
 nome varchar(50)
);

create table regiao
(id_regiao serial primary key,
 nome varchar(50),
 norte int references regiao (id_regiao),
 sul int references regiao (id_regiao),
 oeste int references regiao (id_regiao),
 leste int references regiao (id_regiao),
 descricao text
);

create table regiao_mapa
(id_mapa int not NULL references mapa (id_mapa),
 id_regiao int not NULL references regiao (id_regiao),
 primary key (id_regiao)
);

create table npc
(id_npc serial primary key,
 nome varchar(50)
);

create table dialogo_npc
(id_dialogo serial primary key,
 id_npc int not NULL references npc (id_npc),
 dialogo text
);

create table categoria_item
(id_categoria_item serial primary key,
 nome text
);

create table mercador
(categoria_item int not NULL references categoria_item (id_categoria_item),
 id_mercador int not NULL references npc (id_npc),
 primary key (id_mercador)
);

create table inimigo
(vida int,
 dano int,
 id_inimigo int not NULL references npc (id_npc),
 primary key (id_inimigo)
);

create table npc_em_regiao
(id_npc int not NULL references npc (id_npc),
 id_regiao int not NULL references regiao (id_regiao),
 primary key (id_npc)
);

create table missao
(status boolean default false,
 descricao text,
 id_missao serial primary key
);

create table requisitos_missao
(id_requisitos_missao serial primary key,
 id_missao int not NULL references missao (id_missao),
 descricao text
);

create table objetivo_missao
(id_objetivo_missao serial primary key,
 id_missao int not NULL references missao (id_missao),
 descricao text
);

create table corpo
(id_corpo int not NULL references aventureiro (id_aventureiro),
 cabeça int,
 tronco int,
 mao_esquerda int,
 mao_direita int,
 primary key (id_corpo)
);

create table inventario
(id_inventario int not NULL references aventureiro (id_aventureiro),
 capacidade int default 50,
 ouro int default 0,
 primary key (id_inventario)
);

create table atributos
(id_atributo int not NULL references aventureiro (id_aventureiro),
 destreza numeric,
 carisma numeric,
 inteligencia numeric,
 forca numeric,
 sabedoria numeric,
 constituicao numeric,
 primary key (id_atributo)
);

create table aventureiro
(id_aventureiro serial primary key,
 nivel numeric default 0,
 pontos numeric default 0,
 nome varchar(50),
 raca int not NULL references raca (id_raca),
 classe int not NULL references classe (id_classe),
);

create table aventureiro_em_regiao
(regiao int not NULL references regiao (id_regiao),
 aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(regiao, aventureiro)
);

create table status_requisitos_missao
(requisitos_missao int not NULL references requisitos_missao(id_requisitos_missao),
 aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(requisitos_missao, aventureiro),
 status boolean default false
);

create table status_objetivo_missao
(objetivo_missao int not NULL references objetivo_missao(id_objetivo_missao),
 aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(objetivo_missao, aventureiro),
 status boolean default false
);

create table passagem_missão
(missao int not NULL references missao(id_missao),
 npc int not NULL references npc (id_npc),
 primary key(missao, npc)
);

create table habilidades_classe
(classe int not NULL references classe(id_classe),
 nome varchar(50) primary key,
 descricao text
);

CREATE TYPE item_type AS ENUM('C','E');

create table itens
(id_item serial primary key,
 nome varchar(50),
 descricao text,
 valor numeric,
 valor_pos_compra numeric,
 natureza_item item_type
);

create table itens_por_categoria
(categoria_item int not NULL references categoria_item (id_categoria_item),
 item int not NULL references itens (id_item),
 primary key(categoria_item, item)
);

create table instancia_item
(id_instancia_item serial primary key,
 item int not NULL references itens (id_item)
);

create table instancia_item_em_regiao
(instancia_item int not NULL references instancia_item (id_instancia_item),
 regiao int not NULL references regiao (id_regiao),
 primary key (instancia_item)
);

create table itens_inventario
(inventario int not NULL references inventario (id_inventario),
 instancia_item int not NULL references instancia_item (id_instancia_item),
 primary key (instancia_item)
);

create table boost
(id_boost int not NULL references itens (id_item),
 atributo text,
 duracao int,
 pontos_aumentados int,
 primary key (id_boost)
);

create table pocao
(id_pocao int not NULL references itens (id_item),
 vida_recuperada int,
 primary key (id_pocao)
);

CREATE TYPE weapon_type AS ENUM('Espada','Machado', 'Arco', 'Lança', 'Bastão', 'Clava', 'Martelo', 'Escudo');
CREATE TYPE armour_type AS ENUM('Veste','Capacete', 'Armadura');

create table arma
(dano int,
 tipo weapon_type,
 id_arma int not NULL references itens (id_item),
 primary key (id_arma)
);

create table armadura
(resistencia int,
 tipo armour_type,
 parte_corpo text,
 id_armadura int not NULL references itens (id_item),
 primary key (id_armadura)
);

