import psycopg2



class DatabaseConnection:
    
    def __init__(self):
        # TODO Change this later
        self.connection = psycopg2.connect(
            dbname='postgres',
            user='postgres',
            password='postgres',
            host='localhost'
        )
        
        pass
    
    def get_location_by_name(self, location_name):
        location = None
        
        try:
            cursor = self.connection.cursor()
            cursor.execute(f"""SELECT * from regiao where nome LIKE '{location_name}'""")
            result = cursor.fetchall()
            location = {
                'id': result[0][0],
                'name': result[0][1],
                'north': self.get_location_by_id(result[0][2]),
                'south': self.get_location_by_id(result[0][3]),
                'west': self.get_location_by_id(result[0][4]),
                'east': self.get_location_by_id(result[0][5]),
                'description': result[0][6],
            }
        except:
            pass
        finally:
            cursor.close()
            
        return location

    def get_location_by_id(self, location_id):
        location = None
        
        try:
            cursor = self.connection.cursor()
            cursor.execute(f"""SELECT * from regiao where id_regiao = {location_id}""")
            result = cursor.fetchall()
            location = {
                'id': result[0][0],
                'name': result[0][1],
            }
        except:
            pass
        finally:
            cursor.close()
            
        return location




