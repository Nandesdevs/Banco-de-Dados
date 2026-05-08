/* Views, Triggers e Porcedures */

-- Views: Usa para salvar uma consulta frequentemente usada, servindo para simplificar o acesso aos dados 
-- OBS* Da para mecher como se fosse um objeto do banco de dados usando alter e etc
-- View é mais rapida para consulta

-- Triggers: Gatilhos que são disparados apartir de ações nas tabelas tipo alter, insert e etc
-- Elas reforçam regras de integridade e mantêm históricos sem depender da aplicação.
-- NEW: Você o usa para capturar o valor exato que está passando pelo banco naquele milissegundo e usá-lo para tomar uma decisão automática
-- NEW: Ele segura todos os valores que você acabou de enviar no comando INSERT.
-- Exemplo: Se você insere um item vendido com quantidade = 10, o NEW.quantidade será exatamente 10. Você usa isso para avisar a outra tabela (como a de estoque) quanto deve ser subtraído.
-- sintaxe :

-- Delimiter serve para trocar o que faz o comando fechar, quando queremos usar mais de um ; a gente bota delimiter $

create trigger atualiza_estoque
after insert on itens_venda
for each row
update estoque set quantidade = quantidade - new.quantidade
where id_produto = new.id_produto;

