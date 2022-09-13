from database import DatabaseConnection


class Player:

    in_combat = False

    def __init__(self, player_id, inventory, player_basic_info):
        info = self.parse_player_info(player_basic_info)
        self.dead = False
        self.db_connection = DatabaseConnection()
        self.player_id, = player_id
        self.location = self.db_connection.get_player_location(player_id)
        self.inventory = inventory
        self.name = info.get('name')
        self.race = info.get('race_name')
        self.class_name = info.get('class_name')
        self.class_attributes = {} # TODO GET ATTRIBUTES
        self.race_data = info.get('race_data') # TODO SERIALIZE RACE DATA
        self.life = 10 # TODO GET LIFE FROM ATTRIBUTES
        self.max_life = self.life
        self.damage_modifier = self.get_damage_modifier()
        self.damage = 6 + self.damage_modifier
        pass

    def get_damage_modifier(self):
        if self.class_name in ['Assassino', 'Ranger']:
            return int(self.class_attributes.get('DESTREZA')/2)
        if self.class_name in ['Bárbaro', 'Guerreiro']:
            return int(self.class_attributes.get('FORÇA')/2)
        if self.class_name in ['Mago']:
            return int(self.class_attributes.get('DESTREZA') / 3)
        return 0

    def parse_player_info(self, player_data):
        player_info = player_data[0]
        name = player_info[0]
        race_data = player_info[1].replace('(', '').replace(')', '').split(',')
        race_name = race_data[1]
        class_data = player_info[2].replace('(', '').replace(')', '').split(
            ',')
        class_name = class_data[1]
        location = player_info[3]
        return {
            'location': location,
            'class_name': class_name,
            'race_name': race_name,
            'race_data': race_data,
            'name': name
        }