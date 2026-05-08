/* Atividade Marcio dia 28/03/2026 Mecanica industrial
	Grupo: Hernandes, Kauã souza e Nicolas
*/

-- Quais produtos vendem mais em conjunto (cruzamento de dados);
-- OBS*: FIZ LEFT JOIN POIS TEM 7 PRODUTOS JUNTOS NULOS
select p1.nome as nome_p1, p2.nome as nome_p2, count(*) as total_venda_conjunto
from itens_venda iv1
left join itens_venda iv2 on iv1.id_venda = iv2.id_venda
left join produtos p1 on iv1.id_item = p1.id_produto
left join produtos p2 on iv2.id_item = p2.id_produto 
where iv1.id_item < iv2.id_item
group by p1.nome, p2.nome
order by total_venda_conjunto desc;

-- Qual o ticket médio de compras por cliente;
select c.nome as nome_cliente, SUM(iv.quantidade * p.preco) AS total_gasto_geral, ROUND(AVG(iv.quantidade * p.preco), 2) AS media_por_item
from itens_venda iv
inner join produtos p on iv.id_item = p.id_produto
inner join vendas v on iv.id_venda = v.id_venda
inner join clientes c on v.id_cliente = c.id_cliente
group by c.nome
order by total_gasto_geral desc;

-- Quais fornecedores estão com entregas pendentes associadas a ordens de serviço em aberto.
select f.nome ,os.status_fornecedor,e.status_entregas, COUNT(*) as total_pedidos
from ordens_servico os
inner join entregas e on e.id_os = os.id_os
inner join fornecedores f on f.id_fornecedor = os.id_fornecedor
where status_fornecedor = "aberta" and status_entregas = "pendente"
group by f.nome, os.status_fornecedor,e.status_entregas;

