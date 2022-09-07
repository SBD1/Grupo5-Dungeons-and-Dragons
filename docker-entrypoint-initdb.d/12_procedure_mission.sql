-- PROCEDURE CRIAR OBJ DE NIVEL
create or replace procedure create_level_objective(
    _missao int,
    _nivel_min int
) as 
	$create_level_objective$
        declare 
			_id integer;

		begin
			insert into objetivo_missao(id_missao, tipo) values(_missao, 'N')
                returning id_objetivo_missao into _id;

            insert into objetivo_nivel values(_id, _nivel_min);
		end;
	$create_level_objective$ language 'plpgsql';


-- PROCEDURE CRIAR OBJ DE ITEM
create or replace procedure create_item_objective(
    _missao int,
    _item int,
    _quantidade int
) as 
	$create_item_objective$
        declare 
			_id integer;

		begin
			insert into objetivo_missao(id_missao, tipo) values(_missao, 'I')
                returning id_objetivo_missao into _id;

            insert into objetivo_item values(_id, _item, _quantidade);
		end;
	$create_item_objective$ language 'plpgsql';


-- PROCEDURE CRIAR REQ DE NIVEL
create or replace procedure create_level_requirement(
    _missao int,
    _nivel_min int
) as 
	$create_level_requirement$
        declare 
			_id integer;

		begin
			insert into requisito_missao(id_missao, tipo) values(_missao, 'N')
                returning id_requisito_missao into _id;

            insert into requisito_nivel values(_id, _nivel_min);
		end;
	$create_level_requirement$ language 'plpgsql';


-- PROCEDURE CRIAR REQ DE ITEM
create or replace procedure create_item_requirement(
    _missao int,
    _item int,
    _quantidade int
) as 
	$create_item_requirement$
        declare 
			_id integer;

		begin
			insert into requisito_missao(id_missao, tipo) values(_missao, 'I')
                returning id_requisito_missao into _id;

            insert into requisito_item values(_id, _item, _quantidade);
		end;
	$create_item_requirement$ language 'plpgsql';


-- PROCEDURE CRIAR MISSÃO
create or replace procedure create_mission(
    _descricao text,
    npc int
) as 
	$create_mission$
        declare 
			_id integer;

		begin
			insert into missao(descricao) values(_descricao)
                returning id_missao into _id;

            insert into passagem_missao values(_id, npc);
		end;
	$create_mission$ language 'plpgsql';