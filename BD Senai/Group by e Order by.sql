/*************************************************************/
-- GROUP BY: comando de agrupamento de linhas com valores semelhantes para fazer calculos
/*
MEDIA - AVG
SOMA - SUM
CONTAGENS - COUNT
MAIOR - MAX
MENOR - MIN
*/
/* ORDER BY: ordena em vez de agrupar

CRESCENTE - ASC
DECRESCENTE - DESC
*/

-- MEDIA DE NOTAS POR ALUNOS
-- AS = "VARIAVEL TEMPORARIA" DEFINIR NOME
-- ROUND(avg(ASDIAWJDJAI),N) diz a quantidade de numeros apos a virgula

select a.nome as nome, round(avg(n.nota), 2) as media_notas 
from aluno a
inner join nota n on a.matricula = n.matriculaAluno
group by a.matricula, a.nome;

-- Quantidade de alunos por turma
select t.nome as turma,count(mt.matriculaAluno) as total_aluno from turma t 
inner join matricula_turma mt on t.idturma = mt.idTurma
group by t.nome
order by total_aluno desc;