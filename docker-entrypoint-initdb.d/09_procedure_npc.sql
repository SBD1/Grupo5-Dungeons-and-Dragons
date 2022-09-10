-- PROCEDURE CRIAR NPC
create or replace procedure create_npc(_nome varchar(50), regiao integer) as
	$create_npc$
		declare
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, 'N') returning id_npc into _id;

			insert into npc_em_regiao values (_id, regiao);
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


create or replace function check_enemy() returns trigger as
	$check_enemy$
	begin
		perform * from npc inner join inimigo on npc.id_npc = inimigo.id_inimigo where npc.tipo !=  'I';
		if found then
			raise exception 'Este NPC precisa ser do tipo Inimigo';
		end if;
		return new;
	end;
	$check_enemy$ language 'plpgsql';


create trigger check_enemy_tg after insert on inimigo execute procedure check_enemy();


-- PROCEDURE CRIAR INSTANCIA DE INIMIGO
create or replace procedure create_enemy_inst(_inimigo integer, regiao integer) as
	$create_enemy_inst$
		declare
			_id integer;
		begin
			insert into instancia_inimigo(inimigo) values (_inimigo) returning id_instancia_inimigo into _id;

			insert into inimigo_em_regiao values (_id, regiao);
		end;
	$create_enemy_inst$ language 'plpgsql';



-- PROCEDURE CRIAR MERCADOR
create or replace procedure create_merchant(
	_nome varchar(50),
	_tipo npc_type,
	_categoria_item integer,
	regiao integer
) as
	$create_merchant$
		declare
			_id integer;
		begin
			insert into npc(nome, tipo) values(_nome, _tipo) returning id_npc into _id;
			insert into mercador values(_categoria_item, _id);

			insert into npc_em_regiao values (_id, regiao);
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


create trigger check_merchant_tg after insert on mercador execute procedure check_merchant();