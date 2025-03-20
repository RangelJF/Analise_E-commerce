-- Inserção de dados fictícios na tabela clientes
INSERT INTO clientes (nome, email) VALUES
('João Silva', 'joao@email.com'),
('Maria Oliveira', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com');

-- Inserção de dados fictícios na tabela produtos
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
('Notebook Dell', 'Eletrônicos', 3500.00, 10),
('Smartphone Samsung', 'Eletrônicos', 2000.00, 15),
('Camiseta Polo', 'Vestuário', 99.90, 50);

-- Inserção de dados fictícios na tabela pedidos
INSERT INTO pedidos (id_cliente, status) VALUES
(1, 'Pago'),
(2, 'Enviado'),
(3, 'Pendente');

-- Inserção de dados fictícios na tabela itens_pedido
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3500.00),
(2, 2, 1, 2000.00),
(3, 3, 2, 99.90);

-- Inserção de dados fictícios na tabela pagamentos
INSERT INTO pagamentos (id_pedido, metodo_pagamento, valor_pago) VALUES
(1, 'Cartão de Crédito', 3500.00),
(2, 'Pix', 2000.00);
