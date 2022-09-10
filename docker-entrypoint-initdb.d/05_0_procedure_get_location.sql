create or replace procedure get_player_location(
    _player_id integer,
    inout _regiao_id integer,
    inout _regiao_nome varchar(50),
    inout _regiao_descricao text,
    inout _norte_nome varchar(50),
    inout _sul_nome varchar(50),
    inout _leste_nome varchar(50),
    inout _oeste_nome varchar(50)
) as
$get_player_location$
begin
    select
        r.id_regiao,
        r.nome,
        r.descricao,
        rn.nome,
        rs.nome,
        rl.nome,
        ro.nome
    into
        _regiao_id,
        _regiao_nome,
        _regiao_descricao,
        _norte_nome,
        _sul_nome,
        _leste_nome,
        _oeste_nome
    from regiao r
        join aventureiro a on r.id_regiao = a.regiao
        left outer join regiao rn on (rn.id_regiao = r.norte)
        left outer join regiao rs on (rs.id_regiao = r.sul)
        left outer join regiao rl on (rl.id_regiao = r.leste)
        left outer join regiao ro on (ro.id_regiao = r.oeste)

    where a.id_aventureiro = _player_id;

end;
$get_player_location$ language 'plpgsql';
