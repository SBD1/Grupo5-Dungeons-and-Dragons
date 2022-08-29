from database import DatabaseConnection


class Game:
    
    def __init__(self):
        db_connection = DatabaseConnection()
        pass

    def start(self):
        print('Jogo Iniciou')
        self.execute_menu()

    def start_new_game(self):
        print('Novo Jogo!')
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