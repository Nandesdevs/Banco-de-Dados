/*Atividade 08 - SA5 Views, triggers e Procedures*/

-- View 1 mostra todas as vendas com cliente, produto, quantidade e valor total
create view view_vendas_detalhadas as
select v.id_venda, v.data, c.nome as cliente_nome, c.cidade, p.nome as produto_nome, iv.quantidade, p.preco, (iv.quantidade * p.preco) as valor_item
from vendas v
inner join clientes c on v.id_cliente = c.id_cliente
inner join itens_venda iv on v.id_venda = iv.id_venda
inner join produtos p on iv.id_produto = p.id_produto;

-- View 2 mostra "os" com fornecedor e status da entrega

create view ordens_entregas as
select os.id_os, os.descricao, os.status as os_status, f.nome as fornecedor_nome, e.status as entrega_status, e.data_prevista
from ordens_servico os
inner join fornecedores f on os.id_fornecedor = f.id_fornecedor
left join entregas e on os.id_os = e.id_os;

-- Trigger atualiza_estoque diminui automaticamente o estoque toda vez que alguém vende uma peça

create trigger atualiza_estoque
after insert on itens_venda
for each row
update estoque set quantidade = quantidade - new.quantidade where id_produto = new.id_produto;

-- Procedure cadastrar_cliente insere um novo cliente na tabela

create procedure cadastrar_cliente(in p_nome varchar(100), in p_cidade varchar(100))
insert into clientes (nome, cidade) values (p_nome, p_cidade);