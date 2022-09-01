-- PROCEDURE UPAR DE NIVEL
create or replace function upar_nivel() as $upar_nivel$
    begin
        if(old.xp <> new.xp) then
            if(new.xp = ) --ta faltando um limitador pra saber quando upar
            update aventureiro set nivel = nivel + 1;
        end if;
        return null;
    end;

$upar_nivel$ language 'plpgsql';

drop trigger upar_nivel_tg on aventureiro;
create trigger upar_nivel_tg after update on aventureiro execute procedure upar_nivel();