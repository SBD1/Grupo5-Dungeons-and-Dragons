import random

def combat_system(player, oponent){
  i = 2

  print("A BATALHA COMECOU\n\n")

  #TURNO JOGADOR
  while(player.hp > 0 && oponente.hp > 0)
    if(i%2==0):
    #escolha de mov
      mov = choose_play()

      if(mov == "recuar"):
        # lógica de fuga
      elif(mov == "atacar"):
        oponente = atacar(player, oponente, posPlayer, posOpon, player.spell)

    #TURNO MONSTRO
    else:
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
def choose_play()
  print("O que deseja fazer??? ('recuar' ou 'atacar')\n")

  choice = input("Digite seu movimento: ")
  
  while choice != "recuar" && choice != "atacar":
    input("Opção invalida!! Escolha novamente: ")
  
  return choice


# ROLAR DADO
def roll_dice()
  dado = input("JOGUE O DADO!!\n(Digite 'r'): \n")

  while dado != 'r':
    if dado != 'r':
        dado = input("Escolha invalida!!\nJogue novamente:\n(Digite 'r'): \n")

  num = random.randint(1, 20)


  print(f"O resultado foi {num}\n")

  return num


# ATAQUE INIMIGO
def enemy_attack()
  # logica de ataque inimigo

  return 1

