    -- PROCEDURE CHANGE LIFE
    create or replace procedure
        die_player(_id_aventureiro int, dano int) as
    $die_player$
    declare
    _new_life int;
    begin
            UPDATE aventureiro SET vida = (vida - dano) where _id_aventureiro = aventureiro.id_aventureiro;
        RETURN;
    end;

$die_player$ language 'plpgsql';

-- PROCEDURE DROP LOOT
create or replace procedure
    fight(_id_aventureiro int,  _id_instancia_inimigo int, dano int) as
$fight$
    declare
    _new_life int;
begin
    UPDATE instancia_inimigo SET vida = (vida - dano) where _id_instancia_inimigo = inimigo.id_instancia_inimgo;   
    RETURN;
end;

$fight$ language 'plpgsql';