-- CRIAÇÃO DO BANCO DE DADOS E TABELAS

-- Tabela Cliente: Armazena informações sobre os clientes.
CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

-- Tabela Produto: Armazena informações sobre os produtos disponíveis.
CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(10, 2)
);

-- Tabela Pedido: Armazena informações sobre os pedidos dos clientes.
CREATE TABLE Pedido (
    pedido_id INT PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela ItemPedido: Armazena detalhes dos produtos em cada pedido.
CREATE TABLE ItemPedido (
    item_id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- Tabela Fornecedor: Armazena informações sobre os fornecedores.
CREATE TABLE Fornecedor (
    fornecedor_id INT PRIMARY KEY,
    nome VARCHAR(255)
);

-- Tabela Estoque: Armazena informações sobre os produtos em estoque.
CREATE TABLE Estoque (
    estoque_id INT PRIMARY KEY,
    fornecedor_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(fornecedor_id),
    FOREIGN KEY (produto_id) REFERENCES Produto(produto_id)
);

-- Tabela Veículo: Informações dos veículos dos clientes.
CREATE TABLE Veiculo (
    veiculo_id INT PRIMARY KEY,
    cliente_id INT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

-- Tabela Funcionário: Funcionários que realizam os serviços.
CREATE TABLE Funcionario (
    funcionario_id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela Ordem de Serviço (OS): Registra a ordem de serviço aberta para o veículo.
CREATE TABLE OrdemServico (
    os_id INT PRIMARY KEY,
    veiculo_id INT,
    funcionario_id INT,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    valor_total DECIMAL(10, 2),
    status_os VARCHAR(50) NOT NULL,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(veiculo_id),
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(funcionario_id)
);

-- Tabela ItensOS: Serviços associados a uma ordem de serviço.
CREATE TABLE ItensOS (
    item_os_id INT PRIMARY KEY,
    os_id INT,
    servico_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (os_id) REFERENCES OrdemServico(os_id),
    FOREIGN KEY (servico_id) REFERENCES Produto(produto_id) -- Serviços são produtos
);

-- Tabela Pagamento: Pagamentos realizados pelos clientes.
CREATE TABLE Pagamento (
    pagamento_id INT PRIMARY KEY,
    os_id INT,
    forma_pagamento VARCHAR(50),
    valor_pago DECIMAL(10, 2),
    data_pagamento DATE,
    FOREIGN KEY (os_id) REFERENCES OrdemServico(os_id)
);

-- INSERÇÃO DE DADOS

-- Inserção de exemplos de cliente, produto, pedido e estoque.
INSERT INTO Cliente (cliente_id, nome, endereco, telefone)
VALUES (1, 'João', 'Rua A, 123', '123-4567');

INSERT INTO Produto (produto_id, nome, preco)
VALUES (1, 'Troca de Óleo', 150.00),
       (2, 'Alinhamento', 80.00),
       (3, 'Filtro de Óleo', 50.00);

INSERT INTO Pedido (pedido_id, cliente_id)
VALUES (1, 1);

INSERT INTO ItemPedido (item_id, pedido_id, produto_id, quantidade)
VALUES (1, 1, 1, 1),
       (2, 1, 2, 1);

INSERT INTO Fornecedor (fornecedor_id, nome)
VALUES (1, 'Fornecedor X'),
       (2, 'Fornecedor Y');

INSERT INTO Estoque (estoque_id, fornecedor_id, produto_id, quantidade)
VALUES (1, 1, 3, 10);

-- Inserção de Veículos
INSERT INTO Veiculo (veiculo_id, cliente_id, placa, modelo, ano)
VALUES (1, 1, 'ABC-1234', 'Fiat Uno', 2010);

-- Inserção de Funcionários
INSERT INTO Funcionario (funcionario_id, nome, cargo, telefone, email)
VALUES (1, 'Carlos Ferreira', 'Mecânico', '11987654322', 'carlos@oficina.com');

-- Inserção de Ordem de Serviço
INSERT INTO OrdemServico (os_id, veiculo_id, funcionario_id, data_abertura, status_os, valor_total)
VALUES (1, 1, 1, CURDATE(), 'Aberta', 0.00);

-- Inserção de Itens na Ordem de Serviço
INSERT INTO ItensOS (item_os_id, os_id, servico_id, quantidade, preco_unitario)
VALUES (1, 1, 1, 1, 150.00),
       (2, 1, 2, 1, 80.00);

-- Inserção de Pagamentos
INSERT INTO Pagamento (pagamento_id, os_id, forma_pagamento, valor_pago, data_pagamento)
VALUES (1, 1, 'Cartão de Crédito', 230.00, CURDATE());
