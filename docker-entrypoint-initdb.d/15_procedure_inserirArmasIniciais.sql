-- PROCEDURE CRIAR ARMAS INICIAIS
create or replace procedure initialWeapon(
    _id_aventureiro int
) as 
	$insertweapon$
        declare
            _id int;
			_id_classe int;
		begin
			SELECT classe INTO _id_classe FROM aventureiro WHERE aventureiro.id_aventureiro = _id_aventureiro;
			if(_id_classe = 1) THEN
				insert into instancia_item(item) VALUES (1) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
			if(_id_classe = 2) THEN
				insert into instancia_item(item) VALUES (2) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
			if(_id_classe = 3) THEN
				insert into instancia_item(item) VALUES (3) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
			if(_id_classe = 4) THEN
				insert into instancia_item(item) VALUES (4) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
			if(_id_classe = 5) THEN
				insert into instancia_item(item) VALUES (5) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
			if(_id_classe = 6) THEN
				insert into instancia_item(item) VALUES (6) returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_aventureiro, _id);
				UPDATE inventario SET capacidade = (capacidade - 1) WHERE _id_aventureiro = inventario.id_inventario;
            END IF;
		end;
	$insertweapon$ language 'plpgsql';