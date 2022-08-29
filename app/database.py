from calendar import c
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


    def get_item(self, item_type, item_field, field_data):
        result = None
        
        try:
            cursor = self.connection.cursor()
            cursor.execute(f"""SELECT * from {item_type} where {item_field} = {field_data}""")
            result = cursor.fetchone()
            
        except:
            pass
        finally:
            cursor.close()
            
        return result



    def get_weapon(self, weapon_name, cursor):
        item = self.get_item('arma', 'tipo', weapon_name)
        instantied_item = self.create_item_instance(item, cursor)
        weapon = {
            'instance_id': instantied_item[0],
            'damage': item[1],
            'type': item[2]
        }
        return weapon

    def create_item_instance(self, item, cursor):
        item_id = item[0]
        cursor.execute(f"INSERT INTO instancia_item (item) VALUES({item_id})")
        self.connection.commit()
        
        
    def add_item_to_inventory(self, player_id, create_item_function, item_name):
        cursor = self.connection.cursor()
        
        item_instance = create_item_function(item_name, cursor)
        
        self.add_item_instance_to_inventory(item_instance, player_id)
        
        cursor.quit()
        
        return item_instance
    
    def add_item_instance_to_inventory(self, item_instance, player_id):
        cursor = self.connection.cursor()
        item_id = item_instance.get('id')
        cursor.execute(
            f'INSERT INTO itens_inventario (id_item, inventario) VALUES ({item_id}, {player_id})'
        )
        
        self.connection.commit()
        
        cursor.quit()

    def create_player(self, name, race, char_class, id_map):
        cursor = self.connection.cursor()
        # TODO fix this later
        # O objetivo eh fazer algo funcional por enquanto
        stat_2 = cursor.execute(
            f"""
                INSERT INTO aventureiro(nome, raca, classe, regiao) VALUES ('Ragnar', 2, 1, 5);
            """            
        )
        stat_1 = self.connection.commit()
        
        cursor.execute(
            """
                INSERT INTO corpo(id_corpo) VALUES (37);
                INSERT INTO atributos VALUES (37, 5, 4, 5, 3, 5, 4);
                INSERT INTO inventario(id_inventario) VALUES (37);
            """
        )
        self.connection.commit()
        
        import pdb;pdb.set_trace()
        cursor.close()
        
        return '7'
        
    def get_player_location(self, player_id):
        cursor = self.connection.cursor()
        
        cursor.execute(
            f"SELECT regiao FROM aventureiro where id_aventureiro = {player_id}"
        )
        
        location_id = cursor.fetchone()
        
        location = self.get_location_by_id(location_id=location_id)
        
        cursor.quit()
        
        return location
