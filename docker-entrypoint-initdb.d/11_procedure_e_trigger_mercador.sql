-- PROCEDURE CRIAR MERCADOR
create or replace procedure insert_mercador(_nome varchar(50), _tipo npc_type, _categoria_item integer) as 
	$insert_inimigo$
		declare 
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, _tipo) returning id_npc into _id;
			insert into mercador values(_categoria_item, _id);
		end;
	$insert_inimigo$ language 'plpgsql';


create or replace function checar_mercador() returns trigger as 
	$checar_inimigo$
	begin
		perform * from npc inner join mercador on npc.id_npc = mercador.id_mercador where npc.tipo !=  'M';
		if found then 
			raise exception 'Este npc precisa ser do tipo Mercador';
		end if;
		return new;
	end;
	$checar_inimigo$ language 'plpgsql';


drop trigger checar_mercador_tg on mercador;

create trigger checar_mercador_tg after insert on mercador execute procedure checar_mercador();