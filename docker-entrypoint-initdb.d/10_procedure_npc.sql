-- PROCEDURE CRIAR NPC
create or replace procedure create_npc(_nome varchar(50)) as 
	$create_npc$
		begin
			insert into npc(nome, tipo) values(_nome, 'N');
		end;
	$create_npc$ language 'plpgsql';



-- PROCEDURE CRIAR INIMIGO
create or replace procedure create_enemy(_nome varchar(50), _tipo npc_type, _vida integer, _dano integer) as 
	$create_enemy$
		declare 
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, _tipo) returning id_npc into _id;
			insert into inimigo values(_vida, _dano, _id);
		end;
	$create_enemy$ language 'plpgsql';


create or replace function checar_enemy() returns trigger as 
	$checar_enemy$
	begin
		perform * from npc inner join inimigo on npc.id_npc = inimigo.id_inimigo where npc.tipo !=  'I';
		if found then 
			raise exception 'Este NPC precisa ser do tipo Inimigo';
		end if;
		return new;
	end;
	$checar_enemy$ language 'plpgsql';


drop trigger checar_enemy_tg on inimigo;

create trigger checar_enemy_tg after insert on inimigo execute procedure checar_enemy();



-- PROCEDURE CRIAR MERCADOR
create or replace procedure create_merchant(_nome varchar(50), _tipo npc_type, _categoria_item integer) as 
	$create_merchant$
		declare 
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, _tipo) returning id_npc into _id;
			insert into mercador values(_categoria_item, _id);
		end;
	$create_merchant$ language 'plpgsql';


create or replace function check_merchant() returns trigger as 
	$check_merchant$
	begin
		perform * from npc inner join mercador on npc.id_npc = mercador.id_mercador where npc.tipo !=  'M';
		if found then 
			raise exception 'Este NPC precisa ser do tipo Mercador';
		end if;
		return new;
	end;
	$check_merchant$ language 'plpgsql';


drop trigger check_merchant_tg on mercador;

create trigger check_merchant_tg after insert on mercador execute procedure check_merchant();