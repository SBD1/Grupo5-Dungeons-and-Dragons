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

-- Missões
SELECT * FROM requisito_missao req
JOIN requisito_nivel req_lvl ON req.id_requisito_missao=req_lvl.id_requisito
where id_missao=_missao;

SELECT * FROM requisito_missao req
JOIN requisito_item req_itm ON req.id_requisito_missao=req_itm.id_requisito
where id_missao=_missao;

SELECT * FROM objetivo_missao obj
JOIN objetivo_nivel obj_lvl ON obj.id_objetivo_missao=obj_lvl.id_objetivo
where id_missao=_missao;

SELECT * FROM objetivo_missao obj
JOIN objetivo_item obj_itm ON obj.id_objetivo_missao=obj_itm.id_objetivo
where id_missao=_missao;