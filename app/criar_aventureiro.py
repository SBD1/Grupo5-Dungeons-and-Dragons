import psycopg2
from app.conectar import conecta_db

def inserir_aventureiro(_nome, _raca, _classe, _regiao):
    con = conecta_db()
    cur = con.cursor()
    try:
        #tem que ver como vai entrar o nome, raca, classe e regiao
        cur.execute(f"call insert_aventureiro('{_nome}', '{_raca}', '{_classe}', '{_regiao}')")
        con.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        con.rollback()
    finally:
        con.close()
    