import psycopg2

from conectar import conecta_db

def get_conclusao_missao_by_name(aventureiro_name):
        conclusao_missao = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT conclusao_missao.* from conclusao_missao inner join aventureiro on id_aventureiro = id_conclusao_missao where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            conclusao_missao = {
                'aventureiro': result[0][0],
                'missao': result[0][1]
            }
        except:
            pass
        finally:
            cursor.close()
            
        return conclusao_missao