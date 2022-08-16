## Histórico de revisão

  |Data|Versão|Alteração|Autor| 
  |----|------|---------|-----|
  |04/07/2022|0.1|Primeira versão do MER |[Ian Rocha](https://github.com/IanPSRocha)|
  |21/07/2022|0.2|Adição de Entidade |[João Victor](https://github.com/jvBatista)|
  |27/07/2022|0.3|Adição de Entidades e Relacionamentos |[João Victor](https://github.com/jvBatista)|
  |28/07/2022|0.4|Modificação de Entidades |[João Victor](https://github.com/jvBatista)|
  |08/08/2022|0.5|Atualizações Pós Entrega 2 |[João Victor](https://github.com/jvBatista)|

# Modelo Entidade-Relacionamento
## Entidades

 - **Aventureiro**
 - **Classe**
 - **Raça**
 - **Corpo**
 - **Atributos**
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
 - **Categoria Item**
 - **Missão**
 - **Requisitos Missão**
 - **Objetivos Missão**
 - **Região**
 - **Mapa**
 
## Atributos

 - **Aventureiro:** <ins>ID_Aventureiro</ins>, Posicao, Nivel, Pontos, Nome.
  - **Habilidade:** <ins>ID_Habilidade</ins>, Nome, Descrição.
 - **Classe:** <ins>ID_Classe</ins>, Nome, Mod_Destreza, Mod_Carisma, Mod_Inteligencia, Mod_Forca, Mod_Sabedoria, Mod_Constituicao.
 - **Raça:** <ins>ID_Raça</ins>, Nome, Mod_Destreza, Mod_Carisma, Mod_Inteligencia, Mod_Forca, Mod_Sabedoria, Mod_Constituicao.
 - **Corpo:** <ins>ID_Corpo</ins>, Cabeça, Tronco, LHand, RHand.
 - **Atributos:** <ins>ID_Atb</ins>, Destreza, Carisma, Inteligencia, Forca, Sabedoria, Constituicao.
 - **Inventário:** <ins>ID_Invt</ins>, Capacidade, Ouro.
 - **NPC:** <ins>ID_NPC</ins>, Nome, Dialogos.
	- **Inimigo:** Vida, Dano.
		- **Boss:** Habilidade.
	- **Mercador:** Tipo.
 - **Item:** <ins>ID_Item</ins>, Valor, Valor_Pos_Compra, Natureza_Item.
	- **Equipamento**
		- **Arma** Tipo, Dano.
		- **Armadura:** Tipo, Resistencia, Parte_Corpo.
	- **Consumível**
		- **Poção:** Vida_Recuperada.
		- **Boost:** Pontos_Aumentados, Duracao, Atributo.
 - **Categoria Item:** <ins>ID_CatItem</ins>, Nome
 - **Missão:** <ins>ID_Missao</ins>, Status.
 - **Requisitos Missão** <ins>ID_ReqMissao</ins>, Descrição.
 - **Objetivos Missão** <ins>ID_ObjMissao</ins>, Descrição.
 - **Região:** <ins>ID_Regiao</ins>, Norte, Sul, Leste, Oeste, Nome, Descricao.
 - **Mapa:** <ins>ID_Mapa</ins>, Nome.

 ## Relacionamentos
 
 **Classe *possui* Habilidades**
 - Uma classe pode possuir no mínimo *uma* habilidade, e no máximo *duas* habilidades **(1,2)**. Uma habilidade pode ser pertencida por no mínimo *uma* classe ou várias **(0,n)**.

**Aventureiro *possui* Inventário**
 - Um aventureiro pode carregar no mínimo *um* inventário, e no máximo *um* inventario **(1,1)**. Um inventário só pode ser carregado por *um* aventureiro **(1,1)**.

**Aventureiro *pertence* a uma Classe**
 - Um aventureiro pode pertencer a no mínimo *uma* classe, e no máximo *uma* classe **(1,1)**. Uma Classe pode ser pertencida por nenhum aventureiro ou vários **(0,n)**.

**Aventureiro *pertence* a uma Raça**
 - Um aventureiro pode pertencer a no mínimo *uma* raça, e no máximo *uma* raça **(1,1)**. Uma Raça pode ser pertencida por *nenhum* aventureiro ou *vários* **(0,n)**.

**Aventureiro *possui* Corpo**
 - Um aventureiro pode possuir somente *um* corpo **(1,1)**. Um corpo pode ser possuído por somente *um* aventureiro **(1,1)**.

**Aventureiro *possui* Atributos**
 - Um aventureiro pode possuir somente *um* conjunto de atributos **(1,1)**. Um conjunto de atributos pode ser possuído por somente *um* aventureiro **(1,1)**.

**Aventureiro *cumpre* Requisitos Missão**
- Um aventureiro pode cumprir *nenhuma* requisito de missão ou *várias* **(0,n)**. Uma requisito de missão pode ser cumprido por *nenhum* aventureiro ou *vários* **(0,n)**.

**Aventureiro *cumpre* Objetivos Missão**
- Um aventureiro pode cumprir *nenhuma* objetivo de missão ou *várias* **(0,n)**. Uma objetivo de missão pode ser cumprido por *nenhum* aventureiro ou *vários* **(0,n)**.

**Inventário *guarda* Instancia_Item**
 - Um inventário pode guardar *nenhum* item ou *vários* **(0,n)**. Uma Instancia_Item pode ser guardada por *nenhum* inventário ou *um* **(0,1)**.

**Instancia_Item *referencia* Item**
 - Uma instancia_item pode referencia somente *um* item **(1,1)**. Um item pode ser referenciado por *nenhuma* instancia_item ou *várias* **(0,n)**.

**NPC *contém* Missão**
- Um NPC pode conter *nenhuma* missão ou no máximo *uma* missão **(0,1)**.  Uma missão pode ser contida por *nenhum* NPC ou no máximo *um* NPC **(0,1)**.

**Inimigo *ataca* Aventureiro**
- Um inimigo pode atacar *nenhum* aventureiro ou *vários* aventureiros **(0,n)**. Um aventureiro pode atacar *nenhum* inimigo ou *vários* inimigos **(0,n)**

**Mercador *negocia* uma Categoria Item**
- Um mercador pode negociar (vender/comprar) itens de *uma* categoria de item. Uma categoria de item pode ser negociada por no mínimo *um* mercador ou *vários* **(1,n)**.

**Missão *possui* Requisitos Missão**
- Uma missão pode possuir *nenhum* requisito ou *vários* requisitos **(0,n)**. Uma requisito pode ser atribuído a *nenhuma* missão ou *várias* missões **(1,n)**.

**Missão *possui* Objetivos Missão**
- Uma missão pode possuir *um* objetivo ou *vários* objetivos **(1,n)**. Uma objetivo pode ser atribuído a *nenhuma* missão ou *várias* missões **(1,n)**.

**Região *contem* Aventureiro**
- Uma região pode conter *nenhum* aventureiro ou *vários* **(0,n)**. Um aventureiro pode estar contido em somente *uma* região **(1,1)**.

**Região *contem* NPC**
- Uma região pode conter *nenhum* NPC ou *vários* **(0,n)**. Um NPC pode estar contido em somente *uma* região **(1,1)**.

**Região *contem* Instancia_Item**
- Uma região pode conter *nenhuma* instancia_item ou *várias* **(0,n)**. Uma instancia_item pode estar contida em *nenhuma* região ou em *várias* **(0,n)**.

**Mapa *contem* Região**
- Um mapa pode conter no mínimo *uma* região ou *várias* **(1,n)**. Uma região pode estar contido em somente *um* mapa **(1,1)**.
