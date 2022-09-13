from database import DatabaseConnection
from player import Player
from commands import CommandInterpreter


class Game(CommandInterpreter):
    player = None
    enemies = []

    def __init__(self):
        super(CommandInterpreter, self).__init__()
        self.db_connection = DatabaseConnection()
        pass

    def start(self):
        print('Jogo Iniciou')
        self.execute_menu()

    def start_new_game(self):
        print('Novo Jogo!')

        player_info = self.create_character()
        self.display_player_info(player_info)

    def create_character(self):
        name = input('Digite o nome do seu personagem: ')
        id_race = self.choose_race()
        id_class = self.choose_class()
        id_map = '5'
        player_id = self.db_connection.create_player(
            name,
            id_race,
            id_class,
            id_map
        )

        inventory = self.get_initial_gear(player_id)

        self.player = Player(
            player_id=player_id,
            inventory=inventory
        )

        player_info = self.db_connection.get_player_basic_info(player_id)
        print('AVENTUREIRO CRIADO COM SUCESSO!')
        return player_info

    def get_initial_gear(self, player_id):
        # TODO change this accordingly with the player class
        # return {
        #     'weapons': [
        #         self.db_connection.add_item_to_inventory(
        #             player_id,
        #             self.db_connection.get_weapon,
        #             'Espada'
        #         ),
        #         self.db_connection.add_item_to_inventory(
        #             player_id,
        #             self.db_connection.get_weapon,
        #             'Escudo'
        #         )
        #     ],
        #     'potions': [],
        #     'armour': [],
        #     'boost': [],
        # }
        return {}

    @staticmethod
    def display_player_info(player_list):
        player_info = player_list[0]
        name = player_info[0]
        race_data = player_info[1].replace('(', '').replace(')', '').split(',')
        race_name = race_data[1]
        class_data = player_info[2].replace('(', '').replace(')', '').split(
            ',')
        class_name = class_data[1]
        location = player_info[3]
        print('!! AVENTUREIRO -----------------------------------------------')
        print(f'Nome: {name}')
        print(f'Raça: {race_name}')
        print(f'Classe: {class_name}')
        print(f'Local Atual: {location}')
        stats = {
            0: 'DESTREZA',
            1: 'CARISMA',
            2: 'INTELIGENCIA',
            3: 'FORÇA',
            4: 'SABEDORIA',
            5: 'CONSTITUIÇÃO'
        }
        for index, value in enumerate(zip(race_data[2:8], class_data[2:8])):
            print(
                f'{stats.get(index)}: '
                f'{str(sum([int(item) for item in value]))}'
            )
        print('--------------------------------------------------------------')

    def choose_class(self):
        classes = self.db_connection.get_classes()
        print('\nClasses:')
        for char_class in classes:
            print(f'{char_class[1]} => '
                  f'DESTREZA: {char_class[2]}, '
                  f'CARISMA {char_class[3]}, '
                  f'INTELIGÊNCIA {char_class[4]}, '
                  f'FORÇA {char_class[5]}, '
                  f'SABEDORIA {char_class[6]}, '
                  f'CONSTITUIÇÃO: {char_class[7]}'
                  f'\n---------------------------')
        print('Digite o nome da Classe! Exemplo: Assassino')
        return input('Escolha a classe do seu personagem: ')

    def choose_race(self):
        races = self.db_connection.get_races()
        print('\nRAÇAS:')
        for race in races:
            print(f'{race[1]} => '
                  f'DESTREZA: {race[2]}, '
                  f'CARISMA {race[3]}, '
                  f'INTELIGÊNCIA {race[4]}, '
                  f'FORÇA {race[5]}, '
                  f'SABEDORIA {race[6]}, '
                  f'CONSTITUIÇÃO: {race[7]}'
                  f'\n---------------------------')
        print('Digite o nome da raça! Exemplo: Orc')
        return input('Escolha a raça do seu personagem: ')

    def load_game(self):
        print('Carregar Jogo!')

        player_id = input('Digite o id do seu personagem: ')
        inventory = self.db_connection.get_inventory(player_id)

        player_info = self.db_connection.get_player_basic_info(player_id)

        self.player = Player(
            player_id=player_id,
            inventory=inventory,
            player_basic_info=player_info
        )

        self.display_player_info(player_info)

    def exit(self):
        pass

    def execute_menu(self):
        menu = {
            '1': {
                'str': 'Iniciar novo jogo',
                'func': self.start_new_game
            },
            '2': {
                'str': 'Carregar jogo',
                'func': self.load_game},
            '0': {
                'str': 'Sair',
                'func': self.exit
            }
        }
        for item in menu:
            print(f'{item}) {menu.get(item).get("str")}')
        player_choice = input('Escolha uma opção: ')

        if player_choice:
            menu.get(str(player_choice)).get('func')()
            if self.player:
                self.run_gameplay()
        else:
            exit()

    def run_gameplay(self):
        while True:
            self.display_player_location()
            command = input('>>> ')
            try:
                status = self.parse_command(command)
            except Exception as error:
                print(f'Erro {error}')
                pass

    def display_player_location(self):
        result = self.db_connection.get_player_location(self.player.player_id)
        print(f'Local: {result.get("name")}')
        print(f'{result.get("description")}')
        self.display_enemies()
        if not self.player.in_combat:
            self.display_exits(result)

    def display_enemies(self):
        if not self.enemies:
            self.player.in_combat = False
            return

        self.player.in_combat = True
        print('\nHá inimigos aqui! Você está em combate!')
        for enemy in self.enemies:
            print(f'Id ({enemy.get("id")}) '
                  f'INIMIGO: {enemy.get("name")}, '
                  f'Vida: {enemy.get("life")}\n')

    @staticmethod
    def display_exits(result):
        north_string = (
            f'{result.get("north").get("name")}, '
            f'id: {result.get("north").get("id")}'
        ) if result.get("north").get("id") else "Nada!"
        south_string = (
            f'{result.get("south").get("name")}, '
            f'id: {result.get("south").get("id")}'
        ) if result.get("south").get("id") else "Nada!"
        east_string = (
            f'{result.get("east").get("name")}, '
            f'id: {result.get("east").get("id")}'
        ) if result.get("east").get("id") else "Nada!"
        west_string = (
            f'{result.get("west").get("name")}, '
            f'id: {result.get("west").get("id")}'
        ) if result.get("west").get("id") else "Nada!"
        print(
            f'Saídas:'
            f'\n\tAo norte: {north_string}'
            f'\n\tAo sul: {south_string}'
            f'\n\tAo ao leste: {east_string}'
            f'\n\tAo oeste: {west_string}'
        )

        print(
            '''\n\tPara se mover digite o comando "ir {id do lugar}, por exemplo."
            Para mais informações, utilize o comando "ajuda ir",
            Ou apenas "ajuda" para obter informações gerais sobre os comandos.            
            '''
        )


if __name__ == '__main__':
    game = Game()
    game.start()
