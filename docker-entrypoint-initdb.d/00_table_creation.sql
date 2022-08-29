CREATE TYPE npc_type AS ENUM('N', 'M', 'I');

-- NPC, Mercador, Inimigo
CREATE TYPE item_type AS ENUM('W', 'A', 'P', 'B');

-- Arma, Armadura, Pocão, Boost
CREATE TYPE weapon_type AS ENUM(
    'Espada',
    'Machado',
    'Arco',
    'Lanca',
    'Bastão',
    'Clava',
    'Martelo',
    'Escudo'
);

CREATE TYPE armour_type AS ENUM('Veste', 'Capacete', 'Armadura');

CREATE TYPE body_part AS ENUM('C', 'T');

-- Cabeca ou Tronco
CREATE TABLE raca (
    id_raca serial primary key,
    nome varchar(50),
    mod_destreza numeric,
    mod_carisma numeric,
    mod_inteligencia numeric,
    mod_forca numeric,
    mod_sabedoria numeric,
    mod_constituicao numeric
);

CREATE TABLE habilidades_classe (
    id_habilidade serial primary key,
    nome varchar(50),
    descricao text
);

CREATE TABLE classe (
    id_classe serial primary key,
    nome varchar(50),
    mod_destreza numeric,
    mod_carisma numeric,
    mod_inteligencia numeric,
    mod_forca numeric,
    mod_sabedoria numeric,
    mod_constituicao numeric,
    habilidade1 int references habilidades_classe (id_habilidade),
    habilidade2 int references habilidades_classe (id_habilidade)
);

CREATE TABLE mapa (id_mapa serial primary key, nome varchar(50));

CREATE TABLE regiao (
    id_regiao serial primary key,
    nome varchar(50),
    norte int references regiao (id_regiao),
    sul int references regiao (id_regiao),
    oeste int references regiao (id_regiao),
    leste int references regiao (id_regiao),
    descricao text
);

CREATE TABLE regiao_mapa (
    id_mapa int not NULL references mapa (id_mapa),
    id_regiao int not NULL references regiao (id_regiao),
    primary key (id_regiao)
);

CREATE TABLE npc (
    id_npc serial primary key,
    nome varchar(50),
    tipo npc_type,
    UNIQUE(nome)
);

CREATE TABLE dialogo_npc (
    id_dialogo serial primary key,
    id_npc int not NULL references npc (id_npc),
    dialogo text
);

CREATE TABLE categoria_item (
    id_categoria_item serial primary key,
    nome text
);

CREATE TABLE mercador (
    categoria_item int not NULL references categoria_item (id_categoria_item),
    id_mercador int not NULL references npc (id_npc),
    primary key (id_mercador)
);

CREATE TABLE inimigo (
    vida int,
    dano int,
    id_inimigo int not NULL references npc (id_npc),
    primary key (id_inimigo)
);

CREATE TABLE npc_em_regiao (
    id_npc int not NULL references npc (id_npc),
    id_regiao int not NULL references regiao (id_regiao),
    primary key (id_npc)
);

CREATE TABLE missao (descricao text, id_missao serial primary key);

CREATE TABLE requisitos_missao (
    id_requisitos_missao serial primary key,
    id_missao int not NULL references missao (id_missao),
    descricao text
);

CREATE TABLE objetivo_missao (
    id_objetivo_missao serial primary key,
    id_missao int not NULL references missao (id_missao),
    descricao text
);

CREATE TABLE aventureiro (
    id_aventureiro serial primary key,
    nivel numeric default 0,
    pontos numeric default 0,
    nome varchar(50),
    raca int not NULL references raca (id_raca),
    classe int not NULL references classe (id_classe),
    regiao int references regiao (id_regiao)
);

CREATE TABLE corpo (
    id_corpo int not NULL references aventureiro (id_aventureiro),
    cabeca int references itens_inventario(id_instancia_item),
    tronco int references itens_inventario(id_instancia_item),
    mao_esquerda int references itens_inventario(id_instancia_item),
    mao_direita int references itens_inventario(id_instancia_item),
    primary key (id_corpo)
);

CREATE TABLE inventario (
    id_inventario int not NULL references aventureiro (id_aventureiro),
    capacidade int default 50,
    ouro int default 0,
    primary key (id_inventario)
);

CREATE TABLE atributos (
    id_atributo int not NULL references aventureiro (id_aventureiro),
    destreza numeric,
    carisma numeric,
    inteligencia numeric,
    forca numeric,
    sabedoria numeric,
    constituicao numeric,
    primary key (id_atributo)
);

CREATE TABLE status_requisitos_missao (
    requisitos_missao int not NULL references requisitos_missao(id_requisitos_missao),
    aventureiro int not NULL references aventureiro (id_aventureiro),
    primary key(requisitos_missao, aventureiro)
);

CREATE TABLE status_objetivo_missao (
    objetivo_missao int not NULL references objetivo_missao(id_objetivo_missao),
    aventureiro int not NULL references aventureiro (id_aventureiro),
    primary key(objetivo_missao, aventureiro)
);

CREATE TABLE conclusao_missao (
    missao int not NULL references missao (id_missao),
    aventureiro int not NULL references aventureiro (id_aventureiro),
    primary key(missao, aventureiro)
);

CREATE TABLE passagem_missao (
    missao int not NULL references missao(id_missao),
    npc int not NULL references npc (id_npc),
    primary key(missao)
);

CREATE TABLE itens (
    id_item serial primary key,
    nome varchar(50),
    descricao text,
    valor numeric,
    valor_pos_compra numeric,
    tipo item_type
);

CREATE TABLE itens_por_categoria (
    categoria_item int not NULL references categoria_item (id_categoria_item),
    item int not NULL references itens (id_item),
    primary key(categoria_item, item)
);

CREATE TABLE instancia_item (
    id_instancia_item serial primary key,
    nome varchar(50),
    item int not NULL references itens (id_item)
);

CREATE TABLE instancia_item_em_regiao (
    instancia_item int not NULL references instancia_item (id_instancia_item),
    regiao int not NULL references regiao (id_regiao),
    primary key (instancia_item)
);

CREATE TABLE itens_inventario (
    inventario int not NULL references inventario (id_inventario),
    instancia_item int not NULL references instancia_item (id_instancia_item),
    nome varchar(50) references instancia_item(nome),
    primary key (instancia_item)
);

CREATE TABLE boost (
    id_boost int not NULL references itens (id_item),
    atributo text,
    duracao int,
    pontos_aumentados int,
    primary key (id_boost)
);

CREATE TABLE pocao (
    id_pocao int not NULL references itens (id_item),
    vida_recuperada int,
    primary key (id_pocao)
);

CREATE TABLE arma (
    id_arma int not NULL references itens (id_item),
    dano int,
    tipo weapon_type,
    primary key (id_arma)
);

CREATE TABLE armadura (
    id_armadura int not NULL references itens (id_item),
    resistencia int,
    tipo armour_type,
    parte_corpo text,
    primary key (id_armadura)
);