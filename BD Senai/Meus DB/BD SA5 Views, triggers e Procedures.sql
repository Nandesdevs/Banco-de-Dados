-- ============================================================
--  BASE DE DADOS: Mecânica Industrial Ltda.
--  Situação de Aprendizagem 4 – Consultas SQL Avançadas
--  Banco de Dados | Professor: Aislan Souza
-- ============================================================

DROP DATABASE IF EXISTS mecanica_industrial;
CREATE DATABASE mecanica_industrial CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mecanica_industrial;

-- ─────────────────────────────────────────────
-- TABELA: clientes
-- ─────────────────────────────────────────────
CREATE TABLE clientes (
    id_cliente   INT          NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100) NOT NULL,
    cidade       VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cliente)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: produtos
-- ─────────────────────────────────────────────
CREATE TABLE produtos (
    id_produto   INT            NOT NULL AUTO_INCREMENT,
    nome         VARCHAR(100)   NOT NULL,
    preco        DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_produto)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: fornecedores
-- ─────────────────────────────────────────────
CREATE TABLE fornecedores (
    id_fornecedor INT          NOT NULL AUTO_INCREMENT,
    nome          VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_fornecedor)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: ordens_servico
-- ─────────────────────────────────────────────
CREATE TABLE ordens_servico (
    id_os         INT         NOT NULL AUTO_INCREMENT,
    descricao     VARCHAR(200),
    status        VARCHAR(50) NOT NULL,   -- 'aberta' | 'fechada'
    id_fornecedor INT         NOT NULL,
    PRIMARY KEY (id_os),
    CONSTRAINT fk_os_fornecedor FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedores (id_fornecedor)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: entregas
-- ─────────────────────────────────────────────
CREATE TABLE entregas (
    id_entrega   INT         NOT NULL AUTO_INCREMENT,
    id_os        INT         NOT NULL,
    status       VARCHAR(50) NOT NULL,   -- 'pendente' | 'entregue'
    data_prevista DATE,
    PRIMARY KEY (id_entrega),
    CONSTRAINT fk_entrega_os FOREIGN KEY (id_os)
        REFERENCES ordens_servico (id_os)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: vendas
-- ─────────────────────────────────────────────
CREATE TABLE vendas (
    id_venda   INT  NOT NULL AUTO_INCREMENT,
    id_cliente INT  NOT NULL,
    data       DATE NOT NULL,
    PRIMARY KEY (id_venda),
    CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes (id_cliente)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: itens_venda
-- ─────────────────────────────────────────────
CREATE TABLE itens_venda (
    id_item    INT NOT NULL AUTO_INCREMENT,
    id_venda   INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_item),
    CONSTRAINT fk_item_venda   FOREIGN KEY (id_venda)   REFERENCES vendas   (id_venda),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produtos (id_produto)
) ENGINE=InnoDB;

-- ─────────────────────────────────────────────
-- TABELA: estoque
-- ─────────────────────────────────────────────
CREATE TABLE estoque (
    id_produto INT PRIMARY KEY,
    quantidade INT NOT NULL DEFAULT 0
) ENGINE=InnoDB;

-- ============================================================
--  DADOS DE EXEMPLO
-- ============================================================

-- Clientes
INSERT INTO clientes (nome, cidade) VALUES
('João Silva',      'Salvador'),
('Maria Souza',     'Feira de Santana'),
('Carlos Lima',     'Ilhéus'),
('Ana Pereira',     'Vitória da Conquista'),
('Pedro Oliveira',  'Juazeiro');

-- Produtos
INSERT INTO produtos (nome, preco) VALUES
('Parafuso M8',     2.50),
('Porca M8',        1.50),
('Engrenagem Z40', 50.00),
('Correia V-Belt',  30.00),
('Rolamento 6205',  45.00),
('Válvula Hidráulica', 120.00);

-- Fornecedores
INSERT INTO fornecedores (nome) VALUES
('Fornecedor Alpha'),
('Fornecedor Beta'),
('Fornecedor Gama');

-- Ordens de Serviço
INSERT INTO ordens_servico (descricao, status, id_fornecedor) VALUES
('Reposição de rolamentos',      'aberta',   1),
('Manutenção de correias',       'fechada',  2),
('Revisão de válvulas',          'aberta',   1),
('Troca de engrenagens',         'aberta',   3),
('Lubrificação geral',           'fechada',  2);

-- Entregas
INSERT INTO entregas (id_os, status, data_prevista) VALUES
(1, 'pendente',  '2025-04-10'),
(2, 'entregue',  '2025-03-15'),
(3, 'pendente',  '2025-04-20'),
(4, 'pendente',  '2025-04-18'),
(5, 'entregue',  '2025-03-22');

-- Vendas
INSERT INTO vendas (id_cliente, data) VALUES
(1, '2025-01-10'),
(1, '2025-01-15'),
(2, '2025-02-10'),
(3, '2025-03-05'),
(4, '2025-03-12'),
(5, '2025-03-20'),
(2, '2025-04-01'),
(3, '2025-04-05');

-- Itens de Venda
INSERT INTO itens_venda (id_venda, id_produto, quantidade) VALUES
-- venda 1 (João)
(1, 1, 10),
(1, 2, 10),
-- venda 2 (João)
(2, 1,  5),
(2, 3,  1),
-- venda 3 (Maria)
(3, 2, 20),
(3, 4,  2),
-- venda 4 (Carlos)
(4, 3,  2),
(4, 5,  1),
-- venda 5 (Ana)
(5, 5,  3),
(5, 6,  1),
-- venda 6 (Pedro)
(6, 4,  4),
(6, 6,  2),
-- venda 7 (Maria)
(7, 1, 15),
(7, 3,  1),
-- venda 8 (Carlos)
(8, 2, 10),
(8, 5,  2),
(8, 6,  1);

-- Estoque
INSERT INTO estoque VALUES (1, 100), (2, 100), (3, 50), (4, 80), (5, 60), (6, 30);

-- ============================================================
--  FIM DO SCRIPT
-- ============================================================