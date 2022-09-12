import random

def combat_system(player, oponent):
  i = 2

  print("A BATALHA COMECOU\n\n")

  #TURNO JOGADOR
  while player.hp > 0 and oponente.hp > 0:
    if i%2==0:
    #escolha de mov
      mov = choose_play()

      if mov == "recuar":
        print('Voce recuou')
        # lógica de fuga
      elif mov == "atacar":
        oponente = player_attack()

    #TURNO MONSTRO
    else:
      pass
      # lógica de dano inimigo

    i+=1

  if(player.hp <= 0):
    print("   >===>          >>       >=>       >=> >=======>           >===>      >=>         >=> >=======> >======>     \n")
    print(" >>    >=>       >>=>      >> >=>   >>=> >=>               >=>    >=>    >=>       >=>  >=>       >=>    >=>   \n")
    print(">=>             >> >=>     >=> >=> > >=> >=>             >=>        >=>   >=>     >=>   >=>       >=>    >=>   \n")
    print(">=>            >=>  >=>    >=>  >=>  >=> >=====>         >=>        >=>    >=>   >=>    >=====>   >> >==>      \n")
    print(">=>   >===>   >=====>>=>   >=>   >>  >=> >=>             >=>        >=>     >=> >=>     >=>       >=>  >=>     \n")
    print(" >=>    >>   >=>      >=>  >=>       >=> >=>               >=>     >=>       >===>      >=>       >=>    >=>   \n")
    print("  >====>    >=>        >=> >=>       >=> >=======>           >===>            >=>       >=======> >=>      >=> \n")
    print("\n")
    # lógica de retorno à guilda e perda de ouro
    return player
    
  else:
    print(f'{oponent.nome} foi derrotado!!!\nVOCE VENCEU\n')
    # logica ganhar exp
    return player


# ESCOLHA MOVIMENTO
def choose_play():
  print("O que deseja fazer??? ('recuar' ou 'atacar')\n")

  choice = input("Digite seu movimento: ")
  
  while choice != "recuar" and choice != "atacar":
    input("Opção invalida!! Escolha novamente: ")
  
  return choice


# ROLAR DADO
def roll_dice():
  dado = input("JOGUE O DADO!!\n(Digite 'r'): \n")

  while dado != 'r':
    if dado != 'r':
        dado = input("Escolha invalida!!\nJogue novamente:\n(Digite 'r'): \n")

  num = random.randint(1, 20)

  print(f"O resultado foi {num}\n")

  if num < 7:
    return 0
  elif num < 14:
    return 0.66
  else:
    return 1


# ATAQUE INIMIGO
def enemy_attack():
  # logica de ataque inimigo

  return 1

# ESCOLHA ATAQUE
def player_attack():

  print("Escolha um ataque:\n")

  #print attack list

  ataque = input('Digite sua escolha: ')

  # verifica se ataque esta na lista

  dice_mod = roll_dice()

  # modifica dano do ataque com base no dado

  print(f"Voce atacou usando {ataque}\n")

  return ataque