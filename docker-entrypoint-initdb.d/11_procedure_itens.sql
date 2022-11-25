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
create or replace procedure create_inst_item(_item integer) as
	$create_item$
		begin
			insert into instancia_item(item) values (_item);
		end;
	$create_item$ language 'plpgsql';



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



--  Comprar item
create or replace procedure buy_item(_id_item integer, _id_aventureiro integer) as 
	$buy_item$
		declare
			_valor integer;
			_ouro integer;
			capacity integer := 50;
            total_items integer;
            _inst_item integer;
		begin
			SELECT COUNT(*) INTO total_items
            FROM itens_inventario
            WHERE inventario = _id_aventureiro;

            IF total_items >= capacity THEN
                RAISE EXCEPTION 'Inventário sem espaço disponível';
            END IF;

            SELECT valor INTO _valor
			FROM itens 
			WHERE id_item = _id_item;
        
			SELECT ouro INTO _ouro
			FROM inventario
			WHERE id_inventario = _id_aventureiro;
			
            IF (_ouro < _valor) THEN
				RAISE EXCEPTION 'Você não tem ouro suficiente para comprar esse item';
			END IF;

            INSERT INTO instancia_item(item) VALUES(_id_item) RETURNING id_instancia_item INTO _inst_item;
            INSERT INTO itens_inventario(inventario, instancia_item) VALUES(_id_aventureiro, _inst_item);
            UPDATE inventario SET ouro = ouro - _valor WHERE id_inventario = _id_aventureiro;
		end
	$buy_item$ language 'plpgsql';


-- PROCEDURE DROP LOOT
create or replace procedure drop_loot(_inimigo integer, _regiao integer) as 
	$drop_loot$
		declare
			_id integer;
            _item integer;
		begin
			select item into _item
            from loot_inimigo
            where inimigo=_inimigo;

            insert into instancia_item(item) values (_item) returning id_instancia_item into _id;

            INSERT INTO instancia_item_em_regiao(instancia_item, regiao) VALUES(_id, _regiao);
		end;
	$drop_loot$ language 'plpgsql';


--  Equipar item  
create or replace procedure equip_weapon(_id_aventureiro integer, _id_instancia_item integer) as
    $equip_weapon$
         declare
            _mao_esquerda int;
            _mao_direita int;
		begin
            SELECT mao_esquerda INTO _mao_esquerda
            FROM corpo
            WHERE id_corpo = _id_aventureiro;
            
            IF _mao_esquerda > 0 THEN
                SELECT mao_direita into _mao_direita
                FROM corpo
                WHERE id_corpo = _id_aventureiro;

                IF _mao_direita > 0 THEN
                    RAISE EXCEPTION 'Você está com as duas mãos ocupadas';
                ELSE
                    UPDATE corpo SET mao_direita = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                    DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
                END IF;
            ELSE
                UPDATE corpo SET mao_esquerda = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
            END IF;
        end
    $equip_weapon$ language 'plpgsql';


create or replace procedure equip_body_armour(_id_aventureiro integer, _id_instancia_item integer) as
    $equip_body_armour$
         declare
            _tronco int;
		begin
            SELECT tronco INTO _tronco
            FROM corpo
            WHERE id_corpo = _id_aventureiro;

            IF _tronco > 0 THEN
                RAISE EXCEPTION 'Você já tem um item equipado no tronco';
            ELSE
                UPDATE corpo SET tronco = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
            END IF;
        end
    $equip_body_armour$ language 'plpgsql';


create or replace procedure equip_head_armour(_id_aventureiro integer, _id_instancia_item integer) as
    $equip_head_armour$
         declare
            _cabeça int;
		begin
            SELECT cabeça INTO _cabeça
            FROM corpo
            WHERE id_corpo = _id_aventureiro;

            IF _cabeça > 0 THEN
                RAISE EXCEPTION 'Você já tem um item equipado na cabeça';
            ELSE
                UPDATE corpo SET cabeça = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
            END IF;
        end
    $equip_head_armour$ language 'plpgsql';