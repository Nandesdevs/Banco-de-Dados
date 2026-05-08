/* Unions
UNION and UNION ALL

COMMENTS:
O comando UNION é uma cláusula do SQL utilizada para combinar os resultados de duas ou mais consultas (SELECTs) em uma única tabela de saída
-Toda instrução SELECT dentro de UNION deve ter o mesmo número de colunas
-As colunas também devem ter tipos de dados semelhantes
-As colunas em cada instrução SELECT também devem estar na mesma ordem

*/

-- TODOS OS DADOS DE 2 TABELAS NA MESMA COLUNA 
-- UNIÃO: REMOVER DUPLICATAS
SELECT * 
FROM vendas
UNION
SELECT *
FROM produtos;

-- UNION ALL: NÃO REMOVA DUPLICATAS. MOSTRA TODAS AS INFORMAÇÕES
SELECT * 
FROM vendas
UNION ALL
SELECT *
FROM produtos;

-- SELECIONANDO COLUNAS: 
-- 1. FUNCIONA PORQUE OS TIPOS DE DADOS SÃO EXATAMENTE IGUAIS OU SEMELHANTES 
-- 2. MESMO NÚMERO DE COLUNAS 
-- TENHA CUIDADO AO USAR UNION!


