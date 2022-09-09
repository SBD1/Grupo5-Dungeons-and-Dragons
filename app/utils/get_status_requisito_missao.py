import psycopg2

from conectar import conecta_db

def get_status_requisitos_missao_by_name(aventureiro_name):
        status_requisitos_missao = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT status_requisitos_missao.* from status_requisitos_missao inner join aventureiro on id_aventureiro = id_status_requisitos_missao where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            status_requisitos_missao = {
                'aventureiro': result[0][0],
                'requisitos_missao': result[0][1]
            }
        except:
            pass
        finally:
            cursor.close()
            
        return status_requisitos_missao