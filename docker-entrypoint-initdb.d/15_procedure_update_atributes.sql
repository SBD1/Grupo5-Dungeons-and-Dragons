-- PROCEDURE GASTAR PONTOS DE ATRIBUTOS
create or replace function gastar_atributos() as $gastar_atributos$
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

$gastar_atributos$ language 'plpgsql';

drop trigger gastar_atributos_tg on aventureiro;
create trigger gastar_atributos_tg after update on aventureiro execute procedure gastar_atributos();