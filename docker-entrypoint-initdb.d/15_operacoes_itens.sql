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
--  Comprar item
