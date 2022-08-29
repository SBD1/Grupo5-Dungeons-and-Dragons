create or replace procedure insert_aventureiro(_nome varchar(50),
                                               _raca varchar(50),
                                               _classe varchar(50),
                                               _id_regiao integer,
                                               INOUT _id_aventureiro integer) as
$insert_aventureiro$
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
$insert_aventureiro$ language 'plpgsql';
