-- Criação do banco de dados
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criação da tabela de Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de Produtos
CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
);

-- Criação da tabela de Pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES clientes(id_cliente),
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) CHECK (status IN ('Pendente', 'Pago', 'Enviado', 'Entregue', 'Cancelado'))
);

-- Criação da tabela de Itens do Pedido
CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    id_produto INT REFERENCES produtos(id_produto),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL
);

-- Criação da tabela de Pagamentos
CREATE TABLE pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    id_pedido INT REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    metodo_pagamento VARCHAR(50) CHECK (metodo_pagamento IN ('Cartão de Crédito', 'Boleto', 'Pix', 'Transferência')),
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
