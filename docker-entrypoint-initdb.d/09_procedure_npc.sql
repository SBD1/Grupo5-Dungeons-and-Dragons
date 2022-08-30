-- PROCEDURE CRIAR NPC
create or replace procedure insert_npc(_nome varchar(50)) as 
	$insert_npc$
		begin
			insert into npc(nome, tipo) values(_nome, 'N');
		end;
	$insert_npc$ language 'plpgsql';