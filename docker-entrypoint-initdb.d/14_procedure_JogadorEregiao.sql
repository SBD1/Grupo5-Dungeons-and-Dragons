-- Jogador andar para região
create or replace procedure move_player_to_location(
    _jogador_localizacao int,
    _jogador_quer_ir int
) as 
	$andar$
        declare 
			_id integer;
		begin
            SELECT
			insert into objetivo_missao(id_missao, tipo) values(_missao, 'N')
                returning id_objetivo_missao into _id;

            insert into objetivo_nivel values(_id, _nivel_min);
		end;
	$andar$ language 'plpgsql';