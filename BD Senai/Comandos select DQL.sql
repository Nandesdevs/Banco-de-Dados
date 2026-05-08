-- comandos DQL(Data query language)

/* Operadores de comparação:
	=, != ou <>, >,<,>=,<=
    
   Operadores logicos:
	AND, OR, NOT
    
*/
-- Seleciona todos os campos de registro de animais
select * from cliente;
-- Seleciona nome,especie e etc de animais com sexo registrado como M(se fosse sem where seria todos animais)
select nome,especie, id_animal, sexo from animal where sexo = "M";
-- Seleciona todos os nomes de cliente mas o distinct faz apenas aparecer 1, mesmo que tenha por exemplo 2 nome "Hernandes", o prompt so mostra 1
select distinct nome from cliente;
-- Seleciona todos os nomes de cliente, mas diferente do distinct faz aparecer todos mesmo que tenham por exemplo o mesmo nome
select all nome from cliente;
-- A cláusula ORDER BY retorna os comandos em ordem ascendente (ASC) ou descendente (DESC), sendo o padrão ascendente.
select nome from cliente order by nome asc;
select nome from cliente order by nome desc;
-- Seleciona todos animais limitando a, se for o numero inteiro sozinho, ex: 5, vai mostrar apenas os 5 primeiros, mas se for um 3,1 vai mostrar apos o 3 e so um valor que seria o 4, se fosse 2 apos a virgula mostraria 2 e assim por diante.
select * from animal limit 1,2;
/*A função LIKE merece um destaque especial, pois faz uma busca sofisticada por uma substring dentro de uma string informada. Temos, dentro da função LIKE, os seguintes caracteres especiais utilizados em substrings

%: busca zero ou mais caracteres;
_: busca somente um caractere.*/
SELECT nome From animal Where nome like "s%";
-- O caractere ‘_’ na consulta indica que estamos procurando nomes nos quais a letra o é a segunda letra do nome;
SELECT nome From animal Where nome like "_o%";
-- Seleciona o ultimo caractere do nome
SELECT nome From animal Where nome like "%a";
-- seleciona para contar quantos id animais tem por sexo de animal, da tabela animal
SELECT COUNT(id_animal), sexo
FROM animal
GROUP BY sexo;
-- com a adição do having ele basicamente pede para mostrar apenas os que são superiores a 1
SELECT COUNT(id_animal), sexo
FROM animal
GROUP BY sexo
HAVING COUNT(id_animal) > 1;
-- A CASE expressão passa por condições e retorna um valor quando a primeira condição é atendida (como uma declaração if-then-else). Então, uma vez que uma condição é verdadeira, ela para de ler e retorna o resultado. Se nenhuma condição for verdadeira, ela retorna o valor na ELSE cláusula.
-- Igual linguagem de programação
SELECT id_animal, sexo, 
CASE WHEN sexo = "M" THEN 'Macho'
 WHEN sexo = "F" THEN 'Femea' 
ELSE 'não binario' 
END AS sexo_completo
FROM animal;
-- Selecioona algo para contar de uma tabela, ex: quantidade de nomes
SELECT COUNT(nome)
FROM animal;
-- A AVG()função retorna o valor médio de uma coluna numérica.
select avg(tananana) from tananana;
-- A SUM()função retorna a soma total de uma coluna numérica.
select sum(tananana) from tananana;
-- Seleciona todos os campos que não tem esse conjunto de string
select * from cliente where nome not like "%Hernandes%";



