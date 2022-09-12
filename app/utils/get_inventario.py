import psycopg2

from conectar import conecta_db

def get_inventario_by_name(aventureiro_name):
        inventario = None

        try:
            cursor = conecta_db.cursor()
            cursor.execute(f"""SELECT inventario.* from inventario inner join aventureiro on id_aventureiro = id_inventario where nome LIKE '{aventureiro_name}'""")
            result = cursor.fetchall()
            inventario = {
                'id_inventario': result[0][0],
                'capacidade': result[0][1],
                'ouro': result[0][2]
            }
        except:
            pass
        finally:
            cursor.close()
            
        return inventario