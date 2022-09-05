-- PROCEDURE CRIAR REQUISITO
create or replace procedure create_requisito(_descricao_requisito text) as 
	$create_requisito$
		declare 
            _id_requisito integer;
		begin
            create into requisitos_missao(id_missao, descricao) values(_id_missao, _descricao_requisito)
		end;
	$create_requisito$ language 'plpgsql';

-- PROCEDURE CRIAR OBJETIVO
create or replace procedure create_objetivo(_id_ missao int, _descricao_objetivo text) as 
	$create_requisito$
		declare 
            _id_objetivo integer;
		begin
            create into objetivo_missao(id_missao, descricao) values(_id_missao, _descricao_objetivo);
		end;
	$create_requisito$ language 'plpgsql';

-- PROCEDURE CRIAR MISSAO
create or replace procedure create_missao(
    _descricao text,
    _descricao_objetivo text
    ) as 
	$create_missao$
    declare 
			_id integer;
		begin
            create into missao(descricao) values(_descricao) returning id_missao into _id;
            call create_objetivo(_id, _descricao_objetivo);
		end;
	$create_missao$ language 'plpgsql';