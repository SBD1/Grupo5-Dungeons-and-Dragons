from calendar import c
import psycopg2


class DatabaseConnection:

    def __init__(self):
        # TODO Change this later
        self.connection = psycopg2.connect(
            dbname='DeD',
            user='postgres',
            password='pedrolucas0',
            host='winhost'
        )

        pass

    def get_location_by_name(self, location_name):
        location = None

        try:
            cursor = self.connection.cursor()
            cursor.execute(
                f"""SELECT * from regiao where nome LIKE '{location_name}'""")
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
            cursor.execute(
                f"""SELECT * from regiao where id_regiao = {location_id}""")
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
            cursor.execute(
                f"""SELECT * from {item_type} where {item_field} = '{field_data}'"""
            )

            result = cursor.fetchone()

        except Exception as e:
            print(e)
            print(f'ERRO: Não foi possível obter item {field_data}')
            pass
        finally:
            cursor.close()

        return result

    def get_weapon(self, weapon_name, cursor):
        item = self.get_item('arma', 'tipo', weapon_name)
        instantied_item = self.create_item_instance(
            item,
            weapon_name.title(),
            cursor
        )

        weapon = {
            'item_name': weapon_name,
            'instance_id': instantied_item[0],
            'damage': item[1],
            'type': item[2]
        }
        return weapon

    def create_item_instance(self, item, name, cursor):
        item_id = item[0]
        cursor.execute(
            f"INSERT INTO instancia_item (item, nome) VALUES('{item_id}', '{name}') RETURNING id_instancia_item"
        )
        item_instance = cursor.fetchone()
        self.connection.commit()

        return item_instance


    def add_item_to_inventory(
            self, player_id, create_item_function, item_name
    ):
        cursor = self.connection.cursor()

        item_instance = create_item_function(item_name, cursor)

        self.add_item_instance_to_inventory(item_instance, player_id)
        self.connection.commit()
        cursor.close()

        return item_instance

    def add_item_instance_to_inventory(self, item_instance, player_id):
        cursor = self.connection.cursor()

        item_id = item_instance.get('instance_id')
        cursor.execute(
            f"INSERT INTO itens_inventario (instancia_item, inventario) VALUES ('{item_id}', '{player_id}')"
        )

        self.connection.commit()

        cursor.close()

    def get_races(self):
        cursor = self.connection.cursor()
        cursor.execute('SELECT * FROM raca')
        races = cursor.fetchall()
        cursor.close()

        return races

    def get_classes(self):
        cursor = self.connection.cursor()
        cursor.execute('SELECT * FROM classe')
        classes = cursor.fetchall()
        cursor.close()

        return classes

    def get_player_basic_info(self, player_id):
        cursor = self.connection.cursor()
        cursor.execute(
            f"""
            SELECT 
                avnt.nome as nome,
                rc,
                cls,
                rg.nome
            FROM aventureiro avnt 
                JOIN raca rc on rc.id_raca = avnt.raca 
                JOIN classe cls on cls.id_classe = avnt.classe
                JOIN regiao rg on rg.id_regiao = avnt.regiao
                WHERE avnt.id_aventureiro = '{player_id}'
            """
        )
        result = cursor.fetchall()
        cursor.close()

        return result

    def create_player(self, name, race, char_class, id_map):
        cursor = self.connection.cursor()

        cursor.execute(
            f"call insert_aventureiro("
            f"'{name.title()}'::varchar(50), "
            f"'{race.title()}'::varchar(50), "
            f"'{char_class.title()}'::varchar(50), "
            f"'5'::integer, "
            f"'0'::integer"
            f")"
        )
        player_id, = cursor.fetchone()
        cursor.execute(
            f"""
                INSERT INTO corpo(id_corpo) VALUES ({player_id});
                INSERT INTO atributos VALUES ({player_id}, 5, 4, 5, 3, 5, 4);
                INSERT INTO inventario(id_inventario) VALUES ({player_id});
            """
        )

        self.connection.commit()
        cursor.close()
        return player_id

    def update_player_location(self, player):
        cursor = self.connection.cursor()
        player_location = player.location["id"]
        cursor.execute(
            f"""
                update aventureiro set regiao = {player_location} where player.id = {player.id}
            """
        )
        self.connection.commit()
        cursor.close()

    def move_player_to_location(self, player, location):

        oldlocation = self.get_player_location(player.id)
        if location == "north":
            newlocation = oldlocation.north
        elif location == "south":
            newlocation = oldlocation.south
        elif location == "west":
            newlocation = oldlocation.west
        elif location == "east":
            newlocation = oldlocation.east
        player.location = newlocation
        self.update_player_location(player)
        return player

    def get_player_location(self, player_id):
        cursor = self.connection.cursor()

        cursor.execute(
            f"SELECT regiao FROM aventureiro where id_aventureiro = {player_id}"
        )

        location_id = cursor.fetchone()

        location = self.get_location_by_id(location_id=location_id)

        cursor.close()

        return location