from importlib import import_module
import psycopg2
from conectar import conecta_db
# Falta importar o sql?

def inserir_db(insert_aventureiro):
    con = conecta_db()
    cur = con.cursor()
    try:
        #tem que ver como vai entrar o nome, raca, classe e regiao
        cur.execute(insert_aventureiro(_nome, _raca, _classe))
        con.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print("Error: %s" % error)
        con.rollback()
        cur.close()
        return 1
    cur.close()