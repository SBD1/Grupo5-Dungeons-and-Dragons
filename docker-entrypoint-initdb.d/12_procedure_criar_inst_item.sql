-- PROCEDURE CRIAR INSTANCIA DE ITEM

create or replace procedure insert_inst_item(_nome) as 
	$insert_item$
		begin
            _item = itens.id_item where _nome = itens.nome
			insert into instancia_item(nome, item) values (_nome, _item)
		end;
	$insert_item$ language 'plpgsql';

create or replace function checar_item() returns trigger as 
	$checar_item$
	begin
		perform itens.id_item from itens where itens.id_item != exists;
		if found then 
			raise exception 'Este item não existe';
		end if;
		return new;
	end;
	$checar_item$ language 'plpgsql';


drop trigger checar_item_tg on item;

create trigger checar_item_tg after insert on item execute procedure checar_item();