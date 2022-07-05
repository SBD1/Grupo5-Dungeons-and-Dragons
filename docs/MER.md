## Histórico de revisão

  |Data|Versão|Alteração|Autor| 
  |----|------|---------|-----|
  |04/07/2022|0.1|Primeira versão do MER |[Ian Rocha](https://github.com/IanPSRocha)|

# Modelo Entidade-Relacionamento
## Entidades

 - **Aventureiro**
 - **Classe**
 - **Raça**
 - **Corpo**
 - **Inventário**
 - **NPC**
	- **Inimigo**
		- **Comum**
		- **Boss**
	- **Mercador**
 - **Item**
	- **Equipamento**
		- **Arma**
		- **Armadura**
	- **Consumível**
		- **Poção**
		- **Boost**
 - **Instância Item**
 - **Missão**
 - **Região**
 - **Mapa**
 
## Atributos

 - **Aventureiro:** <ins>ID_Aventureiro</ins>, Posicao, Nivel, Pontos, Nome, Atributos {Destreza, Carisma, Inteligencia, Forca, Sabedoria, Constituicao}.
 - **Classe:** <ins>ID_Classe</ins>, Habilidades, Nome.
 - **Raça:** <ins>ID_Raça</ins>, Nome.
 - **Corpo:** Cabeça, Tronco, LHand, RHand.
 - **Inventário:** Capacidade, Ouro.
 - **NPC:** <ins>ID_NPC</ins>, Dialogos.
	- **Inimigo:** Vida, Dano.
		- **Boss:** Habilidade.
	- **Mercador:** Tipo.
 - **Item:** <ins>ID_Item</ins>, Quantidade, Valor, Valor_Pos_Compra.
	- **Equipamento**
		- **Arma** Tipo, Dano.
		- **Armadura:** Tipo, Resistencia, Parte_Corpo.
	- **Consumível**
		- **Poção:** Vida_Recuperada.
		- **Boost:** Pontos_Aumentados, Duracao, Atributo.
 - **Missão:** <ins>ID_Missao</ins>, Status, Objetivo, Requisitos.
 - **Região:** <ins>ID_Regiao</ins>, Coordenadas, Descricao.
 - **Mapa:** <ins>ID_Mapa</ins>.

 ## Relacionamentos
 
**Aventureiro *possui* Inventário**

 - Um aventureiro pode carregar no mínimo *um* inventário, e no máximo *um* inventario **(1,1)**. Um inventário só pode ser carregado por *um* aventureiro **(1,1)**.

**Aventureiro *pertence* a uma Classe**
 - Um aventureiro pode pertencer a no mínimo *uma* classe, e no máximo *uma* classe **(1,1)**. Uma Classe pode ser pertencida por nenhum aventureiro ou vários **(0,n)**.

**Aventureiro *pertence* a uma Raça**
 - Um aventureiro pode pertencer a no mínimo *uma* raça, e no máximo *uma* raça **(1,1)**. Uma Raça pode ser pertencida por *nenhum* aventureiro ou *vários* **(0,n)**.

**Aventureiro *possui* Corpo**
 - Um aventureiro pode possuir somente *um* corpo **(1,1)**. Um corpo pode ser possuído por somente *um* aventureiro **(1,1)**.

**Aventureiro *recebe* Missão**
- Um aventureiro pode receber *nenhuma* missão ou *várias* **(0,n)**. Uma missão pode ser recebida por *nenhum* aventureiro ou *vários* **(0,n)**.

**Inventário *guarda* Instancia_Item**
 - Um inventário pode guardar *nenhum* item ou *vários* **(0,n)**. Uma Instancia_Item pode ser guardada por *nenhum* inventário ou *um* **(0,1)**.

**Instancia_Item *referencia* Item**
 - Uma instancia_item pode referencia somente *um* item **(1,1)**. Um item pode ser referenciado por *nenhuma* instancia_item ou *várias* **(0,n)**.

**NPC *contém* Missão**
- Um NPC pode conter *nenhuma* missão ou no máximo *uma* missão **(0,1)**.  Uma missão pode ser contida por *nenhum* NPC ou no máximo *um* NPC **(0,1)**.

**Inimigo *ataca* Aventureiro**
- Um inimigo pode atacar *nenhum* aventureiro ou *vários* aventureiros **(0,n)**. Um aventureiro pode atacar *nenhum* inimigo ou *vários* inimigos **(0,n)**

**Mercador *negocia* Instancia_Item**
- Um mercador pode negociar no mínimo *uma* instancia_item ou *várias* **(1,n)**. Uma instancia_item pode ser negociada por no mínimo *um* mercador ou *vários* **(1,n)**.

**Mercador *Negocia* com Aventureiro**
- Um mercador pode negociar com *nenhum* aventureiro ou *vários* **(0,n)**. Um aventureiro pode negociar com *nenhum* mercador ou com *vários* **(0,n)**.

**Região *contem* Aventureiro**
- Uma região pode conter *nenhum* aventureiro ou *vários* **(0,n)**. Um aventureiro pode estar contido em somente *uma* região **(1,1)**.

**Região *contem* NPC**
- Uma região pode conter *nenhum* NPC ou *vários* **(0,n)**. Um NPC pode estar contido em somente *uma* região **(1,1)**.

**Região *contem* Instancia_Item**
- Uma região pode conter *nenhuma* instancia_item ou *várias* **(0,n)**. Uma instancia_item pode estar contida em *nenhuma* região ou em *várias* **(0,n)**.

**Mapa *contem* Região**
- Um mapa pode conter no mínimo *uma* região ou *várias* **(1,n)**. Uma região pode estar contido em somente *um* mapa **(1,1)**.
