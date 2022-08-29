-- PROCEDURE CRIAR AVENTUREIRO
create or replace procedure insert_aventureiro(_nome varchar(50), _raca varchar(50), _classe varchar(50), _id_regiao integer, _inst_cabeca varchar(50), _inst_tronco varchar(50), _inst_LHand varchar(50), _inst_RHand varchar(50)) as 
    $insert_aventureiro$
        declare 
            _id integer;
            _idRaca integer;
            _idClasse integer;
			_idCabeca integer;
			_idTronco integer;
			_idLHand integer;
			_idRHand integer;
        begin
            select id_raca into _idRaca from raca where raca.nome like _raca;
            select id_classe into _idClasse from classe where classe.nome like _classe;
            insert into aventureiro(nome, raca, classe, regiao) values(_nome, _idRaca, _idClasse, _id_regiao) returning id_npc into _id;
			select id_instancia_item into _idCabeca from itens_inventario where itens_inventario.nome like _inst_cabeca;
			select id_instancia_item into _idTronco from itens_inventario where itens_inventario.nome like _inst_tronco;
			select id_instancia_item into _idLHand from itens_inventario where itens_inventario.nome like _inst_LHand;
			select id_instancia_item into _idRHand from itens_inventario where itens_inventario.nome like _inst_RHand;
			insert into corpo(id_corpo, cabeca, tronco, mao_esquerda, mao_direita) values(_id, _idCabeca, _idTronco, _idLHand, _idRHand);
			insert into inventario(id_inventario) values(_id);
        end;
			insert into
    $insert_aventureiro$ language 'plpgsql';
