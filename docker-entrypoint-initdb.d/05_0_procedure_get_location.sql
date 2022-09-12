create or replace procedure get_player_location(
    _player_id integer,
    inout _regiao_id integer,
    inout _regiao_nome varchar(50),
    inout _regiao_descricao text,
    inout _norte_nome varchar(50),
    inout _norte_id integer,
    inout _sul_nome varchar(50),
    inout _sul_id integer,
    inout _leste_nome varchar(50),
    inout _leste_id integer,
    inout _oeste_nome varchar(50),
    inout _oeste_id integer
) as
$get_player_location$
begin
    select
        r.id_regiao,
        r.nome,
        r.descricao,
        rn.nome, rn.id_regiao,
        rs.nome, rs.id_regiao,
        rl.nome, rl.id_regiao,
        ro.nome, ro.id_regiao
    into
        _regiao_id,
        _regiao_nome,
        _regiao_descricao,
        _norte_nome,
        _norte_id,
        _sul_nome,
        _sul_id,
        _leste_nome,
        _leste_id,
        _oeste_nome,
        _oeste_id
    from regiao r
        join aventureiro a on r.id_regiao = a.regiao
        left outer join regiao rn on (rn.id_regiao = r.norte)
        left outer join regiao rs on (rs.id_regiao = r.sul)
        left outer join regiao rl on (rl.id_regiao = r.leste)
        left outer join regiao ro on (ro.id_regiao = r.oeste)

    where a.id_aventureiro = _player_id;

end;
$get_player_location$ language 'plpgsql';
