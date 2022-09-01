create or replace procedure list_items(_id_mercador integer) as 
	$list_items$
        declare
            _id_categoria integer;
		begin
			SELECT categoria_item INTO _id_categoria 
            FROM mercador 
            WHERE id_mercador = _id_mercador;

            SELECT * 
            FROM itens_por_categoria itm 
            JOIN itens wpn ON itm.item=wpn.id_item;
		end;
	$list_items$ language 'plpgsql';