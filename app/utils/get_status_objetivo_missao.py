import psycopg2

from conectar import conecta_db

def get_status_objetivo_missao_by_name(aventureiro_name):
        status_objetivo_missao = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT status_objetivo_missao.* from status_objetivo_missao inner join aventureiro on id_aventureiro = id_status_objetivo_missao where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            status_objetivo_missao = {
                'aventureiro': result[0][0],
                'objetivo_missao': result[0][1]
            }
        except:
            pass
        finally:
            cursor.close()
            
        return status_objetivo_missao