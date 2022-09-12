-- PROCEDURE CRIAR OBJ DE ITEM
create or replace procedure intialWeapon(
    _id_aventureiro int,
    _id_inventario int,
    _id_classe int
) as 
	$insertweapon$
        declare
            _id int;
		begin
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe WHERE _id_aventureiro = aventureiro.id_aventureiro) THEN
                insert into instancia_item(item) VALUES ('Arco') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe) THEN
                insert into instancia_item(item) VALUES ('Lança') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe) THEN
                insert into instancia_item(item) VALUES ('Adaga') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe) THEN
                insert into instancia_item(item) VALUES ('Bastão') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe) THEN
                insert into instancia_item(item) VALUES ('Adaga') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
            if(_id_classe == classe.id_classe) IN (SELECT id_classe FROM classe JOIN aventureiro ON aventureiro.classe = classe.id_classe) THEN
                insert into instancia_item(item) VALUES ('Machado') returning id_instancia_item into _id;
                insert into itens_inventario(inventario, instancia_item) values(_id_inventario, _id);
            END IF;
		end;
	$insertweapon$ language 'plpgsql'; 