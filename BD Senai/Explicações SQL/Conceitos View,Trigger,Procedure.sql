/* Views, Triggers e Procedures */

-- Views: armazena o resultado de uma consulta frequentemente usada, servindo para simplificar o acesso aos dados 
-- View é mais rapida para consulta

select * from clientes;
-- Triggers: Gatilhos que são disparados apartir de ações nas tabelas tipo alter, insert e etc
-- Elas reforçam regras de integridade e mantêm históricos sem depender da aplicação.
-- NEW: Você o usa para capturar o valor exato que está passando pelo banco naquele milissegundo e usá-lo para tomar uma decisão automática
-- NEW: Ele segura todos os valores que você acabou de enviar no comando INSERT.
-- Exemplo: Se você insere um item vendido com quantidade = 10, o NEW.quantidade será exatamente 10. Você usa isso para avisar a outra tabela (como a de estoque) quanto deve ser subtraído.
-- sintaxe :

create trigger atualiza_estoque
after insert on itens_venda
for each row
update estoque set quantidade = quantidade - new.quantidade
where id_produto = new.id_produto;

-- Exemplo de trigger com cadastro em auditoria toda vez que ter um update em cliente, mostrando data e hora da modificação em cliente
select * from auditoria;

create table auditoria (
	id_auditoria int primary key auto_increment not null,
    data timestamp(6) not null,
    user_id int not null);
    
create trigger lod_update_cliente
after update on clientes
for each row
insert into auditoria (data, user_id)
values (now(), new.id_cliente);

-- Procedures: Procedimento armazenado, usa para salvar linhas de codigos grandes e com alta frequencia de uso
-- Toda vez que eu quiser utilizar chamo com "CALL nome_procedure();"
-- Fazendo isso o servidor executa toda a lógica internamente, economizando tempo e conexões.
-- As Procedures podem aceitar parâmetros de entrada e retornar valores de saída

-- Delimiter serve para trocar o que faz o comando fechar, quando queremos usar mais de um ; a gente bota delimiter $$
-- Sintaxe:
-- Parametros: informações que passamos para procedure para ela funcionar
delimiter $$
create procedure nome_procedure(parametros)
begin
	-- codigo
    
end $$
delimiter ;

-- Exemplo: procedure para cadastro de clientes

delimiter $$
create procedure cadastrar_cliente(p_nome varchar(100), p_cidade varchar(100))
begin
	insert into clientes (nome, cidade)
	values (p_nome, p_cidade);
end $$

delimiter ;

-- Para inserir os dados
call cadastrar_cliente("Nanandes", "Alagoinhas");