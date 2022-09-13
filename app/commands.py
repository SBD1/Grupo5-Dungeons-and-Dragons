from database import DatabaseConnection


class CommandInterpreter:

    def __init__(self, player):
        self.player = player
        self.db_connection = DatabaseConnection()
        self.enemies = []

    @property
    def commands(self):
        return {
            'ir': {
                'function': self.goto_command,
                'synonyms': ['ir', 'entrar'],
                'help': (
                    """COMANDO: ir [id do lugar]
                    O jogador irá para o lugar especificado.
                    """
                ),
                'usage tips': (
                    """
                    Exemplo:
                        >>> ir 1
    
                    Exemplo:
                        >>> ir 2
    
                    Exemplo:
                        >>> entrar 2
                    """
                )
            },
            'atacar': {
                'function': self.attack_command,
                'synonyms': ['atacar', 'hit'],
                'help': (
                    """COMANDO: atacar [inimigo]
                    O jogador irá atacar o inimigo especificado
                    """
                ),
                'usage tips': (
                    """
                    Exemplo:
                        >>> atacar
    
                        Obs: Irá atacar o primeiro goblin da lista
    
                    Exemplo:
                        >>> atacar 2
    
                        Obs: Irá atacar o inimigo numero 2 na lista
    
                    Exemplo:
                        >>> hit 1
    
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
                'help': (
                    """COMANDO: falar [npc]
                    O jogador irá conversar com o npc especificado
                    """
                ),
                'usage tips': (
                    """
                    Exemplo:
                        >>> falar
    
                        Obs: Irá conversar, com o npc, se houver apenas um npc na área
    
                    Exemplo:
                        >>> falar 2
    
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
                'synonyms': ['largar', 'deixar'],
                'help': (
                    """COMANDO: largar [item]
                    O jogador irá deixar no chão o item especificado
                    """
                ),
                'usage tips': (
                    """
                    Exemplo:
                        >>> largar 1
    
                        Obs: Irá largar o item 1 especificado no inventário
                    """
                )
            },
            'ajuda': {
                'function': self.show_help,
                'synonyms': ['help', 'ajuda'],
                'help': (
                    """COMANDO: ajuda [comando]
                    Exibe instruções de comandos.
                    """
                )
            }

        }

    def show_help(self, arguments):
        if not arguments:
            for command in self.commands:
                print(f'{self.commands.get(command).get("help")}')
                print(
                    f'Sinônimos: {self.commands.get(command).get("synonyms")}')
                print(
                    '---------------------------------------------------------')
        else:
            print(
                f'{arguments[0]}: {self.commands.get(arguments[0]).get("help")}')
            print(
                f'Sinônimos: {self.commands.get(arguments[0]).get("synonyms")}')
            print(self.commands.get(arguments[0]).get("usage tips"))

    def goto_command(self, arguments):
        if not self.player.in_combat:
            if arguments:
                location = arguments[0]
                try:
                    location = self.db_connection.move_player_to_location(
                        self.player.player_id,
                        location
                    )
                    if not location:
                        print('Não é possível acessar esse local!')
                        return

                    if enemies := self.db_connection.load_enemies(location):
                        self.enemies = enemies
                    else:
                        print(
                            'Aparentemente não há inimigos aqui, parece estar seguro!')

                except Exception as error:
                    print(error)
                    print('Não é possível acessar esse local!')
                    return

                self.player.location = location
            else:
                print('Especifique o lugar que deseja ir!')
        else:
            print('Você está em combate, não pode ir para outro lugar!')

    def attack_command(self, arguments):
        if self.player.in_combat:
            if arguments:
                entity, = [
                    enemy for enemy in self.enemies if (
                            str(enemy.get('id')) == str(arguments[0])
                    )
                ]

                self.player_attack_enemy(entity)
            else:
                print("Você ataca o primeiro inimigo que aparece a sua frente")
                self.player_attack_enemy(self.enemies[0])
        else:
            print("Você não está em nenhum combate nesse momento.")

    def player_attack_enemy(self, entity):
        for enemy in self.enemies:
            if str(entity.get('id')) == str(enemy.get('id')).strip():
                enemy['life'] -= self.player.damage
                print(
                    f'{enemy.get("name")} Recebeu {self.player.damage} de dano!')
                if int(enemy.get('life')) <= 0:
                    print(
                        f'Inimigo {enemy.get("name")} '
                        f'({enemy.get("id")}) morreu!'
                    )
                    self.db_connection.kill_enemy(enemy.get('id'))
                    self.enemies.remove(enemy)
                    if not self.enemies:
                        self.player.in_combat = False
                        print("Você derrotou todos os inimigos dessa area!\n")
                return

    def parse_command(self, player_input):
        arguments = player_input.split()
        input_command = arguments.pop(0)
        user_command = [
            self.commands.get(command)
            for command in self.commands if self.is_synonym(
                input_command, self.commands.get(command)
            )
        ]
        if user_command:
            status = user_command[0].get('function')(arguments)

    @staticmethod
    def is_synonym(input_command, command):
        return input_command in command.get('synonyms')
