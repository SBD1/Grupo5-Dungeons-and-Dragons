import psycopg2

from conectar import conecta_db

def get_corpo_by_name(aventureiro_name):
        corpo = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT corpo.* from corpo inner join aventureiro on id_aventureiro = id_corpo where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            corpo = {
                'id_corpo': result[0][0],
                'cabeca': result[0][1],
                'ronco': result[0][2],
                'LHand': result[0][3],
                'RHand': result[0][4]
            }
        except:
            pass
        finally:
            cursor.close()
            
        return corpo