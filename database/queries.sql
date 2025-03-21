

-- 1️⃣ Frequência de Compras por Cliente
SELECT id_cliente, COUNT(id_pedido) AS total_pedidos
FROM pedidos
GROUP BY id_cliente
ORDER BY total_pedidos DESC;

-- 2️⃣ Produtos Mais Comprados
SELECT p.nome, SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN produtos p ON i.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;

-- 3️⃣ Média de Valor dos Pedidos
SELECT p.id_pedido, SUM(i.quantidade * i.preco_unitario) AS valor_total
FROM itens_pedido i
JOIN pedidos p ON i.id_pedido = p.id_pedido
GROUP BY p.id_pedido;

-- 4️⃣ Tempo Médio entre Pedidos (Recência de Compras)
SELECT id_cliente, 
       AVG(DATEDIFF(LEAD(data_pedido) OVER (PARTITION BY id_cliente ORDER BY data_pedido), data_pedido)) AS tempo_medio_entre_compras
FROM pedidos;
