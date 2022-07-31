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
 fk_norte int references regiao (id_regiao),
 fk_sul int references regiao (id_regiao),
 fk_oeste int references regiao (id_regiao),
 fk_leste int references regiao (id_regiao),
 descricao text
);

create table regiao_mapa
(fk_id_mapa int not NULL references mapa (id_mapa),
 fk_id_regiao int not NULL references regiao (id_regiao),
 primary key(fk_id_regiao, fk_id_mapa)
);

create table npc
(id_npc serial primary key,
 nome varchar(50)
);

create table dialogo_npc
(fk_id_npc int not NULL references npc (id_npc) primary key,
 dialogo text
);

create table categoria_item
(id_categoria_item serial primary key,
 nome text
);

create table mercador
(fk_id_categoria_item int not NULL references categoria_item (id_categoria_item),
 fk_id_npc int not NULL references npc (id_npc) primary key
);

create table habilidade_classe
(fk_id_classe int not NULL references classe (id_classe),
 habilidade varchar(50) primary key,
 descricao text
);

create table inimigo
(vida int,
 dano int,
 fk_id_npc int not NULL references npc (id_npc) primary key
);

create table npc_em_regiao
(fk_id_npc int not NULL references npc (id_npc),
 fk_id_regiao int not NULL references regiao (id_regiao),
 primary key (fk_id_npc, fk_id_regiao)
);

create table missao
(status boolean,
 descricao text,
 id_missao serial primary key
);

create table requisitos_missao
(id_requisitos_missao serial primary key,
 fk_id_missao int not NULL references missao (id_missao),
 descricao text
);

create table objetivo_missao
(id_objetivo_missao serial primary key,
 fk_id_missao int not NULL references missao (id_missao),
 descricao text
);

create table corpo
(id_corpo serial primary key,
 cabeça boolean,
 tronco boolean,
 mao_esquerda boolean,
 mao_direita boolean
);

create table inventario
(id_inventario serial primary key,
 capacidade int,
 ouro int
);

create table atributos
(id_atributo serial primary key,
 destreza numeric,
 carisma numeric,
 inteligencia numeric,
 forca numeric,
 sabedoria numeric,
 constituicao numeric
);

create table aventureiro
(id_aventureiro serial primary key,
 nivel numeric,
 pontos numeric,
 nome varchar(50),
 fk_id_raca int not NULL references raca (id_raca),
 fk_id_classe int not NULL references classe (id_classe),
 fk_id_corpo int not NULL references corpo (id_corpo),
 fk_id_inventario int not NULL references inventario (id_inventario),
 fk_id_atributo int not NULL references atributos (id_atributo)
);

create table aventureiro_em_regiao
(fk_id_regiao int not NULL references regiao (id_regiao),
 fk_id_aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(fk_id_regiao, fk_id_aventureiro)
);

create table status_requisitos_missao
(fk_id_requisitos_missao int not NULL references requisitos_missao(id_requisitos_missao),
 fk_id_aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(fk_id_requisitos_missao, fk_id_aventureiro),
 status boolean
);

create table status_objetivo_missao
(fk_id_objetivo_missao int not NULL references objetivo_missao(id_objetivo_missao),
 fk_id_aventureiro int not NULL references aventureiro (id_aventureiro),
 primary key(fk_id_objetivo_missao, fk_id_aventureiro),
 status boolean
);

create table passagem_missão
(fk_id_missao int not NULL references missao(id_missao),
 fk_id_npc int not NULL references npc (id_npc),
 primary key(fk_id_missao, fk_id_npc)
);

create table itens
(id_item serial primary key,
 valor numeric,
 valor_pos_compra numeric,
 natureza_tem numeric
);

create table itens_por_categoria
(fk_id_categoria_item int not NULL references categoria_item (id_categoria_item),
 fk_id_item int not NULL references itens (id_item),
 primary key(fk_id_categoria_item, fk_id_item)
);

create table instancia_item
(id_instancia_item serial primary key,
 fk_id_item int not NULL references itens (id_item)
);

create table instancia_item_em_regiao
(fk_id_instancia_item int not NULL references instancia_item (id_instancia_item),
 fk_id_regiao int not NULL references regiao (id_regiao),
 primary key (fk_id_instancia_item, fk_id_regiao)
);

create table itens_inventario
(fk_id_inventario int not NULL references inventario (id_inventario),
 fk_id_instancia_item int not NULL references instancia_item (id_instancia_item),
 primary key (fk_id_instancia_item, fk_id_inventario)
);

create table boost
(fk_id_item int not NULL references itens (id_item) primary key,
 atributo text,
 duracao int,
 pontos_aumentados int
);

create table pocao
(fk_id_item int not NULL references itens (id_item) primary key,
 vida_recuperada int
);

create table arma
(dano int,
 tipo text,
 fk_id_item int not NULL references itens (id_item) primary key
);

create table armadura
(resistencia int,
 tipo text,
 parte_corpo text,
 fk_id_item int not NULL references itens (id_item) primary key
);

