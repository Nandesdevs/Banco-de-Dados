/* Aula 01 - Introdução tercio */
/* Comandos DDL - DATA DEFINITION LANGUAGE*/
SHOW DATABASES -- Mostra se tem algum banco de dados pre existente

-- CRIA BANCO DE DADOS
CREATE DATABASE EscolaDB;

-- TODAS INFORMAÇÕES ABAIXO VÃO USAR ESSE BD
USE EscolaDB;

-- CRIA TABELA
CREATE TABLE Aluno (
	matricula INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    dataNasc DATE,
    genero CHAR(2),
    email VARCHAR(50) UNIQUE,
    contato VARCHAR(50)
);

-- INSPECIONA TABELAS CRIADAS
SHOW TABLES;

-- ALTERA CAMPOS DA TABELA (nome VARCHAR(50) ----> nome VARCHAR(100)) 
ALTER TABLE Aluno MODIFY nome VARCHAR(100);

-- ADICIONA CAMPOS A TABELA
ALTER TABLE Aluno ADD COLUMN endereco VARCHAR(100);

-- APAGA TABELA PERMANENTEMENTE 
TRUNCATE TABLE Aluno; -- remove todos os registros da tabela para começar do zero

/* Comandos DML - Data Manipulation Language*/
-- IMPORTANTE = USAR WHERE PARA NÃO DELETAR TODOS OS REGISTROS

-- INSERE VALORES A UMA TABELA
INSERT INTO Aluno (matricula, nome, dataNasc, genero, email, contato, endereco)
VALUE(1, "joao arregaça tudo", "2005-03-10", "M", "joaozinarregaça@gmail.com", "283113121", "Avenida Brasil Numero 100")
;

-- INSPECIONA TABELA SELECIONADA
SELECT * FROM Aluno;

-- ATUALIZA VALORES DE UM CAMPO SELECIONADO
UPDATE Aluno
SET email = "altereioemailehack@gmail.com"
WHERE matricula = 1;

-- DELETA UM REGISTRO OU TODOS CASO NÃO USE A PK(PRIMARY KEY)
DELETE FROM Aluno
WHERE matricula = 1;