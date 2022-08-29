from database import DatabaseConnection
from player import Player


class Game:
    
    def __init__(self):
        self.db_connection = DatabaseConnection()
        self.player = None
        pass

    def start(self):
        print('Jogo Iniciou')
        self.execute_menu()

    def start_new_game(self):
        print('Novo Jogo!')
        
        # location = self.db_connection.get_location('Centro de Neverwinter')
        name = 'Ragnar' # TODO fix this to input
        id_race = 'Elf on a shelf'
        id_class = '1'
        id_map = '5'
        # player_id = self.db_connection.create_player(name, id_race, id_class, id_map)
        # O cara que tem que criar o personagem (Mas deixa agr pro mod 4)
        player_id = '37' #Id tem que ser serial, não inserir manualmente
        inventory = {
            'weapons': [
                self.db_connection.add_item_to_inventory(
                    player_id,
                    self.db_connection.get_weapon,
                    'Espada'
                )
            ],
            'potions': [],
            'armour': [],
            'boost': [],
        }
        
        self.player = Player(
            player_id=player_id,
            inventory=inventory
        )
        
        print(self.player.location)
        pass
    
    def load_game(self):
        print('Carregar Jogo!')
        pass
    
    def exit(self):
        pass
        
    def execute_menu(self):
        menu = {
            '1': {
                'str':'Iniciar novo jogo',
                'func': self.start_new_game
            },
            '2': {
                'str':'Carregar jogo',
                'func': self.load_game},
            '0': {
                'str': 'Sair',
                'func':self.exit
            }            
        }
        for item in menu:
            print(f'{item}) {menu.get(item).get("str")}')
        player_choice = input('Escolha uma opção: ')
        
        if player_choice:
            menu.get(str(player_choice)).get('func')()
        else:
            exit()

        
if __name__ == '__main__':
    game = Game()
    game.start()