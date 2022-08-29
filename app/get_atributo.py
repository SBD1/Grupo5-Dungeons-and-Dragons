import psycopg2

from conectar import conecta_db

def get_atributo_by_name(aventureiro_name):
        atributo = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT atributos.* from atributo inner join aventureiro on id_aventureiro = id_atributo where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            atributo = {
                'id_atributo': result[0][0],
                'destreza': result[0][1],
                'carisma': result[0][2],
                'inteligencia': result[0][3],
                'forca': result[0][4],
                'sabedoria': result[0][5],
                'constituicao': result[0][6],
            }
        except:
            pass
        finally:
            cursor.close()
            
        return atributo