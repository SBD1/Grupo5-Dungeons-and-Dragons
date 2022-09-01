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



--  Equipar item  

create or replace procedure equip_items(_id_aventureiro integer, _id_instancia_item integer) as
    $equip_items$
         declare
            _tipo item_type;
            _parte_corpo body_part;
            _cabeça int;
            _tronco int;
            _mao_esquerda int;
            _mao_direita int;
            _item int;
		begin
            _item = SELECT id_item FROM instancia_item WHERE id_instancia_item = _id_instancia_item;
            _tipo = SELECT tipo FROM itens WHERE id_item = _id_instancia_item;
            IF _tipo = 'A' THEN 
                _parte_corpo = SELECT parte_corpo FROM armadura WHERE id_armadura = _item;
                IF _parte_corpo = 'C' THEN
                    _cabeça = SELECT cabeça FROM corpo WHERE id_corpo = _id_aventureiro;
                        IF _cabeça != NULL THEN
                            RAISE EXCEPTION 'Você já tem um item equipado na cabeça'
                        ELSE  
                            UPDATE corpo SET cabeça = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                            DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
                        END IF
                END IF

                IF _parte_corpo = 'T' THEN
                    _tronco = SELECT tronco FROM corpo WHERE id_corpo = _id_aventureiro;
                        IF tronco != NULL THEN
                            RAISE EXCEPTION 'Você já tem um item equipado no tronco'
                        ELSE
                            UPDATE corpo SET tronco = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                            DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
                        END IF
                END IF
            END IF

            IF _tipo = 'W' THEN 
                _mao_esquerda = SELECT mao_esquerda FROM corpo WHERE id_corpo = _id_aventureiro;
                    IF mao_esquerda != NULL THEN
                        _mao_direita = SELECT mao_direita FROM corpo WHERE id_corpo = _id_aventureiro;
                        IF mao_direita != NULL THEN
                            RAISE EXCEPTION 'Você está com as duas mãos ocupadas'
                        ELSE
                            UPDATE corpo SET mao_direita = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                            DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
                        END IF
                    ELSE
                        UPDATE corpo SET mao_esquerda = _id_instancia_item WHERE id_corpo = _id_aventureiro;
                        DELETE FROM itens_inventario WHERE instancia_item = _id_instancia_item;
                    END IF
                    
            END IF
        end
    $equip_items$

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
            UPDATE inventario SET ouro = (_ouro - _valor) WHERE inventario = _id_aventureiro;
		end
	$buy_item$ language 'plpgsql';