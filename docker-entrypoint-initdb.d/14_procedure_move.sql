-- PROCEDURE MOVE PLAYER
create or replace procedure
    move_player(_regiao_desejada int, _id_aventureiro int) as
$move_player$
begin
    IF (_regiao_desejada)
        IN (SELECT r.id_regiao
            FROM regiao r
                     JOIN regiao ri
                          ON (
                                      ri.norte = r.id_regiao OR
                                      ri.sul = r.id_regiao OR
                                      ri.leste = r.id_regiao OR
                                      ri.oeste = r.id_regiao
                              )
                     JOIN aventureiro av ON av.regiao = ri.id_regiao
            where av.id_aventureiro = _id_aventureiro) THEN

        UPDATE aventureiro
        SET regiao = _regiao_desejada
        WHERE id_aventureiro = _id_aventureiro;
    ELSE
        raise exception 'Essa região está indisponível';
    END IF;

    RETURN;
end;

$move_player$ language 'plpgsql';