def show_help(*args):
    if not args[0]:
        for command in COMMANDS:
            print(f'{COMMANDS.get(command).get("help")}')
            print(f'Sinônimos: {COMMANDS.get(command).get("synonyms")}')
            print('---------------------------------------------------------')
    else:
        print(f'{args[0][0]}: {COMMANDS.get(args[0][0]).get("help")}')
        print(f'Sinônimos: {COMMANDS.get(args[0][0]).get("synonyms")}')
        print(COMMANDS.get(args[0][0]).get("usage tips"))


COMMANDS = {
    'ir': {
        'function': '',
        'synonyms': ['ir', 'entrar'],
        'help': (
            """COMANDO: ir [lugar]
            O jogador irá para o lugar especificado.
            """
        ),
        'usage tips': (
            """
            Exemplo:
                >>> ir estábulos de neverwinter

            Exemplo:
                >>> ir loja de poções

            Exemplo:
                >>> entrar loja de poções
            """
        )
    },
    'atacar': {
        'function': '',
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
        'function': show_help,
        'synonyms': ['help', 'ajuda'],
        'help': (
            """COMANDO: ajuda [comando]
            Exibe instruções de comandos.
            """
        )
    }

}
