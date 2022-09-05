-- PROCEDURE CRIAR CATEGORIA ITEM
create or replace procedure create_item_category(_nome text) as 
	$create_item_category$
		begin
			insert into categoria_item(nome) values(_nome);
		end;
	$create_item_category$ language 'plpgsql';



-- PROCEDURE CRIAR ARMA
create or replace procedure create_weapon(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _dano integer,
    _tipo_arma weapon_type,
    id_categoria integer
) as 
	$create_weapon$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'W')
                returning id_item into _id;

            insert into arma values(_id, _dano, _tipo_arma);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$create_weapon$ language 'plpgsql';




-- PROCEDURE CRIAR ARMADURA
create or replace procedure create_armour(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _resistencia integer,
    _tipo_armadura armour_type,
    _parte_corpo body_part,
    id_categoria integer
) as 
	$create_armour$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'W')
                returning id_item into _id;

            insert into armadura values(_id, _resistencia, _tipo_armadura, _parte_corpo);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$create_armour$ language 'plpgsql';




-- PROCEDURE CRIAR POCAO
create or replace procedure create_potion(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _vida_recuperada integer,
    id_categoria integer
) as 
	$create_potion$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'P')
                returning id_item into _id;

            insert into pocao values(_id, _vida_recuperada);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$create_potion$ language 'plpgsql';



-- PROCEDURE CRIAR BOOST
create or replace procedure create_boost(
    _nome varchar(50),
    _descricao text,
    _valor numeric,
    _valor_pos_compra numeric,
    _atributo atribute,
    _duracao integer,
    _pontos_aumentados integer,
    id_categoria integer
) as 
	$create_boost$
        declare 
			_id integer;

		begin
			insert into itens(nome, descricao, valor, valor_pos_compra, tipo)
                values(_nome, _descricao, _valor, _valor_pos_compra, 'B')
                returning id_item into _id;

            insert into boost values(_id, _atributo, _duracao, _pontos_aumentados);

            insert into itens_por_categoria(categoria_item, item) values(id_categoria, _id);
		end;
	$create_boost$ language 'plpgsql';



-- PROCEDURE CRIAR INSTANCIA DE ITEM
create or replace procedure create_inst_item(_nome) as 
	$create_item$
		begin
            _item = itens.id_item where _nome = itens.nome
			insert into instancia_item(nome, item) values (_nome, _item)
		end;
	$create_item$ language 'plpgsql';

create or replace function check_item() returns trigger as 
	$check_item$
	begin
		perform itens.id_item from itens where itens.id_item != exists;
		if found then 
			raise exception 'Este item não existe';
		end if;
		return new;
	end;
	$check_item$ language 'plpgsql';


drop trigger check_item_tg on item;

create trigger check_item_tg after insert on item execute procedure check_item();



--  Pegar item 
create or replace procedure pickup_item(_inst_item integer, _inventario integer) as 
	$pickup_item$
        declare
            capacity integer := 50;
            total_items integer;
		begin
            SELECT COUNT(*) INTO total_items
            FROM itens_inventario
            WHERE inventario = _inventario;

            IF total_items >= capacity THEN
                RAISE EXCEPTION 'Inventário sem espaço disponível';
            END IF;


            INSERT INTO itens_inventario(inventario, instancia_item) VALUES(_inventario, _inst_item);

            DELETE FROM instancia_item_em_regiao WHERE instancia_item = _inst_item;
		end;
	$pickup_item$ language 'plpgsql';



--  Droppar item
create or replace procedure drop_item(_inst_item integer, _regiao integer) as 
	$drop_item$
        declare
            capacity integer := 500;
            total_items integer;
		begin
            SELECT COUNT(*) INTO total_items
            FROM instancia_item_em_regiao
            WHERE regiao = _regiao;

            IF total_items >= capacity THEN
                RAISE EXCEPTION 'Região sem espaço disponível';
            END IF;


            INSERT INTO instancia_item_em_regiao(instancia_item, regiao) VALUES(_inst_item, _regiao);

            DELETE FROM itens_inventario WHERE instancia_item = _inst_item;
		end;
	$drop_item$ language 'plpgsql';