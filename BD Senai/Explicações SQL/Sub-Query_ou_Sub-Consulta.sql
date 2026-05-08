/*Sub-Consultas
subconsulta seria uma consulta que usa uma outra consulta dentro dela como condicional do que mostrar na consulta base
A consulta interna emprega dados que serão utilizados pela consulta principal
*/

-- a consulta base (ordens_servico) só mostrou os dados porque a subconsulta forneceu a "lista de IDs autorizados" usando where (aquelas que estavam com status pendente na tabela de entregas).
select id_os, status_fornecedor, descricao
from ordens_servico
where id_os in (select id_os
from entregas
where status_entregas = "pendente"
);


-- clausula having 	
-- HAVING: Filtra os resultados após o agrupamento, baseando-se em condições de funções de agregação
-- calculo de produtos acima da media, vantagem de usar sub_query having é que o valor atualiza automaticamente se tornando mais dinamica

/*documentação do codigo: o primeiro avg + o group by id tira a media solo dos precos então divide por um que da ele mesmo,
 ja o segundo tem o papel importante de ser um media global dos precos para ser usado como comparativo por isso não tem group by,
 mostrando assim so os precos maiores que a media universal dos precos*/
 
select id_produto, round(avg(preco),2) as produtos_acima_da_media
from produtos
group by id_produto
having produtos_acima_da_media > (select round(avg(preco),2) from produtos);

-- clausula select
-- select com select de outra tabela, funciona tipo um inner join mas não é tão eficiente quanto join

/* COMMENTS:
Processamento Linha a Linha: Em muitos casos, uma subconsulta na cláusula SELECT pode ser executada pelo banco de dados uma vez para cada linha retornada pela consulta principal.
Se a tabela itens_venda tiver milhares de registros, o banco fará milhares de buscas individuais na tabela produtos.
Vantagem do Join: O INNER JOIN é geralmente otimizado pelo motor do banco de dados para processar essas uniões de forma conjunta (em blocos), o que economiza recursos computacionais e tempo de resposta
*/

select id_item,id_venda, (select nome from produtos where itens_venda.id_produto = produtos.id_produto ) as nome_produto, quantidade
from itens_venda;

-- clausula from
/* Essa sub-query funciona da seguinte maneira:  O SQL primeiro executa tudo o que está dentro dos parênteses. Ele faz os LEFT JOINs entre itens_venda, produtos e vendas para montar uma grande lista contendo:
o ID do item, o nome do produto, a quantidade e o ID do cliente*/

-- O SELECT principal olha apenas para dentro dessa "caixa" dtb e filtra apenas o que for "Parafuso M8"
-- esse exemplo é DESNECESSARIO pois join é mais util
-- quando usar consulta from então?

-- Geralmente, elas só se tornam "mais úteis" que um JOIN simples quando precisamos fazer um cálculo (como um SUM ou AVG) antes de cruzar os dados com outra tabela por exemplo 
/* Imagine que você queira listar apenas os clientes que gastaram, no total, mais de R$ 50.000,00
.
Com JOIN simples: Você teria todas as linhas de vendas espalhadas. Você não conseguiria filtrar "quem gastou mais de 50k" antes de somar.
Com Subconsulta: Você primeiro cria uma subconsulta que faz o SUM (soma) por cliente
. O resultado dessa subconsulta vira uma "tabela temporária" com apenas duas colunas: id_cliente e total_gasto. Depois, você faz o JOIN dessa tabela temporária com a tabela Clientes para pegar os nomes
*/
select nome, id_cliente
from
(select id_item, nome, quantidade, id_cliente
from itens_venda iv
left join produtos p on iv.id_produto = p.id_produto
left join vendas v on v.id_venda = iv.id_venda) as dtb
where nome = "Parafuso M8"
;