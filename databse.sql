CREATE DATABASE ecommerce;
USE ecommerce; 

-- Tabela de Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY, -- Identificador único do cliente (chave primária)
    nome VARCHAR(100) NOT NULL, -- Nome do cliente
    email VARCHAR(100) UNIQUE NOT NULL, -- E-mail deve ser único
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data de cadastro do cliente
);

-- Tabela de Produtos
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY, -- Identificador único do produto (chave primária)
    nome VARCHAR(100) NOT NULL, -- Nome do produto
    categoria VARCHAR(50), -- Categoria do produto (ex: Eletrônicos, Vestuário)
    preco DECIMAL(10,2) NOT NULL, -- Preço do produto com 2 casas decimais
    estoque INT NOT NULL -- Quantidade disponível em estoque
);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY, -- Identificador único do pedido (chave primária)
    id_cliente INT REFERENCES clientes(id_cliente), -- Relacionamento com clientes
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Data do pedido
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Pago', 'Enviado', 'Entregue', 'Cancelado')) -- Status do pedido
);

-- Tabela de Itens do Pedido (representa os produtos dentro dos pedidos)
CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY, -- Identificador único do item do pedido
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE, -- Pedido ao qual pertence
    id_produto INT REFERENCES produtos(id_produto), -- Produto adquirido
    quantidade INT NOT NULL, -- Quantidade comprada
    preco_unitario DECIMAL(10,2) NOT NULL -- Preço do produto no momento da compra
);

-- Tabela de Pagamentos
CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY, -- Identificador único do pagamento
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE, -- Pedido relacionado
    metodo_pagamento VARCHAR(50) CHECK (metodo_pagamento IN ('Cartão de Crédito', 'Boleto', 'Pix', 'Transferência')), -- Método de pagamento
    valor_pago DECIMAL(10,2) NOT NULL, -- Valor pago pelo cliente
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Data do pagamento
);

-- Inserindo alguns dados fictícios
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com');

INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 10),
('Smartphone Samsung', 'Eletrônicos', 2000.00, 15),
('Camiseta Polo', 'Vestuário', 99.90, 50);

INSERT INTO pedidos (id_cliente, status) VALUES
(1, 'Pago'),
(2, 'Enviado'),
(3, 'Pendente');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(2, 2, 1, 2000.00),
(3, 3, 2, 99.90);

INSERT INTO pagamentos (id_pedido, metodo_pagamento, valor_pago) VALUES
(1, 'Cartão de Crédito', 3500.00),
(2, 'Pix', 2000.00);
