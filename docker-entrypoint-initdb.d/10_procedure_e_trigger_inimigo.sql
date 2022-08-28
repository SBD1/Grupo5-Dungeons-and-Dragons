-- PROCEDURE CRIAR INIMIGO
create or replace procedure insert_inimigo(_nome varchar(50), _tipo npc_type, _vida integer, _dano integer) as 
	$insert_inimigo$
		declare 
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, _tipo) returning id_npc into _id;
			insert into inimigo values(_vida, _dano, _id);
		end;
	$insert_inimigo$ language 'plpgsql';


create or replace function checar_inimigo() returns trigger as 
	$checar_inimigo$
	begin
		perform * from npc inner join inimigo on npc.id_npc = inimigo.id_inimigo where npc.tipo !=  'I';
		if found then 
			raise exception 'Este npc precisa ser do tipo Inimigo';
		end if;
		return new;
	end;
	$checar_inimigo$ language 'plpgsql';


drop trigger checar_inimigo_tg on inimigo;

create trigger checar_inimigo_tg after insert on inimigo execute procedure checar_inimigo();
