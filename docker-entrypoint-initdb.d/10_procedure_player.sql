create or replace procedure create_adventurer(
    _nome varchar(50),
    _raca integer,
    _classe integer,
    _id_regiao integer
) as
$create_adventurer$
    declare
        _id integer;
        classeDestreza integer;
        classeCarisma integer;
        classeInteligencia integer;
        classeForca integer;
        classeSabedoria integer;
        classeConstituicao integer;
        racaDestreza integer;
        racaCarisma integer;
        racaInteligencia integer;
        racaForca integer;
        racaSabedoria integer;
        racaConstituicao integer;
    begin
        insert into aventureiro(nome, raca, classe, regiao)
        values (_nome, _raca, _classe, _id_regiao) 
        RETURNING id_aventureiro INTO _id;

        insert into corpo(id_corpo) values (_id);

        insert into inventario(id_inventario) values (_id);

        SELECT mod_destreza,
            mod_carisma,
            mod_inteligencia,
            mod_forca,
            mod_sabedoria,
            mod_constituicao
        INTO racaDestreza,
            racaCarisma,
            racaInteligencia,
            racaForca,
            racaSabedoria,
            racaConstituicao
        FROM raca WHERE id_raca = _raca;

        SELECT mod_destreza,
            mod_carisma,
            mod_inteligencia,
            mod_forca,
            mod_sabedoria,
            mod_constituicao
        INTO classeDestreza,
            classeCarisma,
            classeInteligencia,
            classeForca,
            classeSabedoria,
            classeConstituicao
        FROM classe WHERE id_classe = _classe;
        
        insert into atributos values (_id,
            classeDestreza+racaDestreza+1,
            classeCarisma+racaCarisma+1,
            classeInteligencia+racaInteligencia+1,
            classeForca+racaForca+1,
            classeSabedoria+racaSabedoria+1,
            classeConstituicao+racaConstituicao+1);
    end;
$create_adventurer$ language 'plpgsql';



-- PROCEDURE UPAR DE NIVEL
create or replace function level_up() returns trigger as $level_up$
    begin
        if(old.xp <> new.xp) then
            if(new.xp = 100) then
                update aventureiro set nivel = nivel + 1;
            end if;
        end if;

        return null;
    end;

$level_up$ language 'plpgsql';

create trigger level_up_tg after update on aventureiro execute procedure level_up();