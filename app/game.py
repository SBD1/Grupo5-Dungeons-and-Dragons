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

        player_info = self.create_character()        
        self.display_player_info(player_info)

    def create_character(self):
        # location_id = self.db_connection.get_location('Centro de Neverwinter')
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

        inventory = {
            'weapons': [
                self.db_connection.add_item_to_inventory(
                    player_id,
                    self.db_connection.get_weapon,
                    'Espada'
                ),
                self.db_connection.add_item_to_inventory(
                    player_id,
                    self.db_connection.get_weapon,
                    'Escudo'
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

        player_info = self.db_connection.get_player_basic_info(player_id)
        print('AVENTUREIRO CRIADO COM SUCESSO!')
        return player_info

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
        pass

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
            status = self.parse_command(command)

    def display_player_location(self):
        pass

    def parse_command(self, player_input):
        commands = {
            'ir': {
                'function': '',
                'synonyms': ['ir', 'entrar'],
                'usage tips': (
                    """
                        COMANDO: ir [lugar]

                        O jogador irá para o lugar especificado.

                        Exemplo:
                            ir estábulos de neverwinter

                        Exemplo:
                            ir loja de poções

                        Exemplo:
                            entrar loja de poções
                    """
                )
            },
            'atacar': {
                'function': '',
                'synonyms': ['atacar', 'hit'],
                'usage tips': (
                    """
                        COMANDO: atacar [inimigo]

                        O jogador irá atacar o inimigo especificado

                        Exemplo:
                            atacar

                            Obs: Irá atacar o primeiro goblin da lista

                        Exemplo:
                            atacar 2

                            Obs: Irá atacar o inimigo numero 2 na lista

                        Exemplo:
                            hit 1

                            Obs: Irá atacar o inimigo numero 3 na lista

                        OBS: Poderá usar o comando atacar quando existir algum inimigo na mesma área que você,
                        será exibido algo parecido com:

                        '''
                            Inimigos:
                                (1) Goblin. HP: 10
                                (2) Goblin. HP: 12
                        '''


                    """
                )
            },
            'falar': {
                'function': '',
                'synonyms': ['conversar'],
                'usage tips': (
                    """
                        COMANDO: falar [npc]

                        O jogador irá conversar com o npc especificado

                        Exemplo:
                            falar

                            Obs: Irá conversar, com o npc, se houver apenas um npc na área

                        Exemplo:
                            falar 2

                            Obs: Irá conversar com o NPC número dois da lista
                    
                        OBS: Poderá usar o comando falar quando existir algum NPC na mesma área que você,
                        será exibido algo parecido com:

                        '''
                            NPC's:
                                (1) Mercador de poções.
                                (2) Gundren Rockseeker.
                        '''


                    """
                )
            },
            'largar': {
                'function': '',
                'synonyms': ['deixar'],
                'usage tips': (
                    """
                            
                    """
                )
            }
        }
        key_words = player_input.split()
        input_command = key_words.pop()
        user_command = [
            command.get('function') 
            for command in commands if self.is_synonym(input_command, command)
        ]
        print(user_command)

    @staticmethod
    def is_synonym(input_command, command):
        return input_command in command.get('synonyms')


if __name__ == '__main__':
    game = Game()
    game.start()
