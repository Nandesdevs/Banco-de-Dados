-- Atividade dia 17/03/2026 - Tercio

-- Consulta 1 = Elabore uma consulta que retorne o nome de cada professor acompanhado da quantidade de disciplinas que ele leciona.
select p.nome, count(d.idProfessor) as qntd_disciplina
from professor p
inner join disciplina d on p.idProfessor = d.idProfessor
group by p.nome;

-- Consulta 2 = Elabore uma consulta que identifique quais alunos estão matriculados, mas ainda não possuem nenhuma nota registrada.
select matricula, nome
from aluno
where matricula not in(select distinct matriculaAluno from nota);

-- Consulta extra 
select a.nome,a.matricula,n.nota
from aluno a
inner join nota n on a.matricula = n.matriculaAluno
order by n.nota desc;
