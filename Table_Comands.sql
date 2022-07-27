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
 coordenada int,
 descricao text,
 fk_id_mapa int not NULL references mapa (id_mapa)
);

create table npc
(id_npc serial primary key,
 dialogos text,
 nome varchar(50),
 fk_id_regiao int not NULL references regiao (id_regiao)
);

create table mercador
(tipo text,
 fk_id_npc int not NULL references npc (id_npc)
);

create table habilidade
(nome varchar(50),
 descricao text,
 dano_base int,
 id_habilidade serial primary key,
 quantidade_de_uso int
);

create table inimigo_comum
(vida int,
 dano int,
 fk_id_npc int not NULL references npc (id_npc)
 id_comum serial primary key
);

create table inimigo_boss
(vida int,
 dano int,
 fk_id_npc int not NULL references npc (id_npc)
 id_boss serial primary key
);

create table boss_habilidade
(fk_id_boss int not NULL references inimigo_boss (fk_id_npc),
 fk_id_habilidade int not NULL references habilidade (id_habilidade),
 primary key (fk_id_boss, fk_id_habilidade)
);

create table missao
(status boolean,
 objetivo text,
 requisitos text,
 id_missao serial primary key
);

create table corpo
(cabeça boolean primary key,
 tronco boolean primary key,
 mao_esquerda boolean primary key,
 mao_direita boolean primary key
);

create table inventario
(capacidade int primary key,
 ouro int primary key,
);

create table aventureiro
(nome varchar(50),
 nivel numeric,
 destreza numeric,
 carisma numeric,
 inteligencia numeric,
 forca numeric,
 sabedoria numeric,
 constituicao numeric,
 id_aventureiro serial primary key,
 fk_id_regiao int not NULL references regiao (id_regiao),
 fk_id_classe int not NULL references classe (id_classe),
 fk_id_raca int not NULL references raca (id_raca),
 fk_id_corpo int not NULL references corpo (id_corpo),
 fk_id_inventario int not NULL references inventario (id_inventario)
);

create table boost
(atributo text,
 duracao int,
 pontos_aumentados int,
 id_boost serial primary key,
 quantidade int,
 valor int,
 valor_pos_compra int
);

create table pocao
(vida_recuperada int,
 id_pocao serial primary key,
 quantidade int,
 valor int,
 valor_pos_compra int
);

create table arma
(dano int,
 tipo text,
 id_arma serial primary key,
 quantidade int,
 valor int,
 valor_pos_compra int
);

create table armadura
(resistencia int,
 tipo text,
 parte_corpo text,
 id_arma serial primary key,
 quantidade int,
 valor int,
 valor_pos_compra int
);
