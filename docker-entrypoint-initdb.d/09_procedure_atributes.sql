-- PROCEDURE GASTAR PONTOS DE ATRIBUTOS
create or replace function spend_atributes() as $spend_atributes$
    begin
        if(old.nivel <> new.nivel) then
            set destreza = destreza + 1,
            set carisma = carisma + 1, 
            set inteligencia = inteligencia + 1,
            set forca = forca + 1,
            set sabedoria = sabedoria + 1,
            set constituicao = constituicao + 1,
            from ATRIBUTOS where atributos.id_Atributos = aventureiro.id_aventureiro;
        end if;
    end;

$spend_atributes$ language 'plpgsql';

drop trigger spend_atributes_tg on aventureiro;
create trigger spend_atributes_tg after update on aventureiro execute procedure spend_atributes();