-- PROCEDURE CRIAR CATEGORIA ITEM
create or replace procedure insert_categoria_item(_nome text) as 
	$insert_categoria_item$
		begin
			insert into categoria_item(nome) values(_nome);
		end;
	$insert_categoria_item$ language 'plpgsql';



-- PROCEDURE CRIAR ARMA
create or replace procedure insert_arma(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _dano integer,
    _tipo_arma weapon_type,
    id_categoria integer
) as 
	$insert_arma$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'W')
                returning id_item into _id;

            insert into arma values(_id, _dano, _tipo_arma);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$insert_arma$ language 'plpgsql';




-- PROCEDURE CRIAR ARMA
create or replace procedure insert_armadura(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _resistencia integer,
    _tipo_armadura armour_type,
    _parte_corpo body_part,
    id_categoria integer
) as 
	$insert_armadura$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'W')
                returning id_item into _id;

            insert into armadura values(_id, _resistencia, _tipo_armadura, _parte_corpo);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$insert_armadura$ language 'plpgsql';




-- PROCEDURE CRIAR POCAO
create or replace procedure insert_pocao(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _vida_recuperada integer,
    id_categoria integer
) as 
	$insert_pocao$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'P')
                returning id_item into _id;

            insert into pocao values(_id, _vida_recuperada);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$insert_pocao$ language 'plpgsql';



-- PROCEDURE CRIAR BOOST
create or replace procedure insert_boost(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _atributo atribute,
    _duracao integer,
    _pontos_aumentados integer,
    id_categoria integer
) as 
	$insert_boost$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'B')
                returning id_item into _id;

            insert into boost values(_id, _atributo, _duracao, _pontos_aumentados);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$insert_boost$ language 'plpgsql';