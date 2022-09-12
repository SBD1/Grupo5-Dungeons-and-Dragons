create or replace procedure connect_regiao(
    _regiao_a integer,
    _regiao_b integer,
    _regiao_orientacao varchar(6)
) as
$connect_regiao$
begin
    IF NOT EXISTS(SELECT 1 FROM regiao where id_regiao = _regiao_a) THEN
        raise exception 'regiao does not exist.';
        RETURN;
    end if;

    IF NOT EXISTS(SELECT 1 FROM regiao where id_regiao = _regiao_b) THEN
        raise exception 'regiao does not exist.';
        RETURN;
    end if;

    IF _regiao_orientacao = 'norte' THEN
        update regiao r set norte = _regiao_b where r.id_regiao = _regiao_a;
        update regiao r set sul = _regiao_a where r.id_regiao = _regiao_b;
    END IF;
    IF _regiao_orientacao = 'leste' THEN
        update regiao r set leste = _regiao_b where r.id_regiao = _regiao_a;
        update regiao r set oeste = _regiao_a where r.id_regiao = _regiao_b;
    END IF;

    IF _regiao_orientacao = 'sul' THEN
        update regiao r set sul = _regiao_b where r.id_regiao = _regiao_a;
        update regiao r set norte = _regiao_a where r.id_regiao = _regiao_b;
    END IF;

    IF _regiao_orientacao = 'oeste' THEN
        update regiao r set oeste = _regiao_b where r.id_regiao = _regiao_a;
        update regiao r set leste = _regiao_a where r.id_regiao = _regiao_b;
    END IF;

exception
    when no_data_found then
        raise notice 'Error';
        ROLLBACK;


end;
$connect_regiao$ language 'plpgsql';
