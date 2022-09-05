create or replace procedure create_adventurer(
    _nome varchar(50),
    _raca varchar(50),
    _classe varchar(50),
    _id_regiao integer,
    INOUT _id_aventureiro integer
) as
$create_adventurer$
    declare
        _id       integer;
        _idRaca   integer;
        _idClasse integer;
    begin
        select id_raca into _idRaca from raca where raca.nome like _raca;
        
        select id_classe into _idClasse from classe where classe.nome like _classe;

        insert into aventureiro(nome, raca, classe, regiao)
        values (_nome, _idRaca, _idClasse, _id_regiao) 
        RETURNING id_aventureiro INTO _id_aventureiro;
    end;
$create_adventurer$ language 'plpgsql';



-- PROCEDURE UPAR DE NIVEL
create or replace function level_up() as $level_up$
    begin
        if(old.xp <> new.xp) then
            if(new.xp = 100) 
            update aventureiro set nivel = nivel + 1;
        end if;
        return null;
    end;

$level_up$ language 'plpgsql';

drop trigger level_up_tg on aventureiro;
create trigger level_up_tg after update on aventureiro execute procedure level_up();