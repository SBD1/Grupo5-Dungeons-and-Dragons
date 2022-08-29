-- PROCEDURE CRIAR AVENTUREIRO
create or replace procedure insert_aventureiro(_nome varchar(50), _raca varchar(50), _classe varchar(50)) as 
	$insert_aventureiro$
		declare 
            _id integer;
			_idRaca integer;
            _idClasse integer;
		begin
			insert into aventureiro(nome, raca) values(_nome, raca.id_raca where _raca == raca.nome, classe.id_classe where _classe == classe.nome) returning id_aventureiro into _id;
		end;
	$insert_aventureiro$ language 'plpgsql';

    -- Falta inserir a região, mas sera um valor fixo de inicio