-- Aventureiros
SELECT * FROM aventureiro, classe, raca                  
WHERE aventureiro.classe=classe.id_classe AND aventureiro.raca=raca.id_raca;

-- NPC
SELECT * FROM npc, dialogo_npc
WHERE npc.id_npc=dialogo_npc.id_npc;

-- Itens
SELECT * FROM itens itm JOIN arma wpn ON itm.id_item=wpn.id_arma;
SELECT * FROM itens itm JOIN armadura armor ON itm.id_item=armor.id_armadura;
SELECT * FROM itens itm JOIN pocao pot ON itm.id_item=pot.id_pocao;
SELECT * FROM itens itm JOIN boost bst ON itm.id_item=bst.id_boost;

-- Classes e Habilidades
SELECT * FROM classe, habilidades_classe
WHERE classe.id_classe=habilidades_classe.classe;
