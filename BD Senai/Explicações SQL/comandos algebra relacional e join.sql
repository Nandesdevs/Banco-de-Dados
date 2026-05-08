/* Algebra Relacional / Nescessario para ser um bom profissional

Operações matemáticas que utilizamos para manipular os dados...*/

-- SELEÇÃO: Filtrar linhas(registros) de uma tabela com base em uma condição, representada por sigma(σ).
/*EX: Selecionar todos os alunos do sexo masculino*/
select * from aluno where genero = "M" AND dataNasc > "2007-07-01";

-- PROJEÇÃO: é selecionar apenas algumas colunas (atributos) de uma tabela, representado por pi(π)
/*EX: seleciona as colunas nome e email de aluno*/
select nome, email from aluno;
-- Juntar seleção e projeção é muito comum, ex:
select nome, email from aluno where genero = "f";

-- UNIÃO: combina 2 conjuntos de registros(tabelas), remove duplicatavas(mesmo valor apresentando + de uma vez), representado por U
select nome from aluno
where matricula in(select matriculaAluno from matricula_turma where idTurma = 1)
union
select nome from aluno
where matricula in(select matriculaAluno from matricula_turma where idTurma = 2);

/*ou...*/

select distinct nome from aluno where matricula in(1, 2, 3, 4, 5, 6);

select nome from aluno where matricula in(1, 2)
union
select nome from aluno where matricula in(2, 3);
-- UNION ALL: extensão sql que não remove duplicata
select nome from aluno where matricula in(1, 2)
union all
select nome from aluno where matricula in(2, 3);

/*DIFERENÇA: retorna registros que estão em um conjunto mas não  estão em outro conjunto. Representado por -*/
-- EX: lista de alunos que não tem nota
select matricula, nome from aluno
where matricula not in(select distinct matriculaAluno from nota);

/*PRODUTO CARTESIANO: combina linhas de uma tabela com linhas de outras tabelas. Representado por x */
-- ex: aluno x disciplina, lê como aluno produto cartesiano disciplina
select * from aluno, disciplina;

-- *INICIO JOIN* iguala a matricula do aluno da tabela aluno para matriula do aluno na tabela nota
select * from aluno, nota
where aluno.matricula = nota.matriculaAluno;

/*JUNÇÃO: combina registros de 2 ou mais tabelas com base em uma condição de igualdade. */
select aluno.nome, nota.nota
from aluno
inner join nota on aluno.matricula = nota.matriculaAluno;

/* INNER JOIN, LEFT JOIN E RIGTH JOIN */

select aluno.nome, disciplina.nome, nota.nota
from aluno
inner join nota on aluno.matricula = nota.matriculaAluno
inner join disciplina on nota.idDisciplina = disciplina.idDisciplina;

-- Resumidamente uma busca por chave primaria e foreign key
-- Junção + eficiente por causa da optmização do banco de dados e da operação