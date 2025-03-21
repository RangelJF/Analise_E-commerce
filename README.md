# 📦 Banco de Dados para E-commerce

Este repositório estrutura um banco de dados de e-commerce e realiza consultas úteis para análise de vendas, frequência de clientes e comportamento de compra. Ele pode ser usado para entender quais clientes compram mais, quais produtos são mais vendidos e a recorrência de compras.

## 📌 Funcionalidades
- Criação de um banco de dados `ecommerce` com tabelas para clientes, produtos, pedidos, itens de pedidos e pagamentos.
- Inserção de dados fictícios para testes.
- Consultas SQL para análise de padrões de compra dos clientes, incluindo:
  - Frequência de compras por cliente.
  - Produtos mais comprados.
  - Valor médio dos pedidos.
  - Tempo médio entre compras dos clientes.

## 🛠 Como Rodar o Projeto

### 1️⃣ **Requisitos**
- Um banco de dados MySQL ou PostgreSQL instalado.
- Acesso ao terminal do banco de dados.

### 2️⃣ **Executando os Scripts**
Para configurar o banco de dados do zero, basta rodar:
```sql
SOURCE database/setup.sql;
```
Isso irá:
1. Criar o banco de dados e as tabelas (`create_tables.sql`).
2. Inserir dados fictícios (`insert_data.sql`).
3. Executar consultas para análise de padrão de compras (`queries.sql`).

Se quiser rodar os scripts separadamente:
```sql
SOURCE database/create_tables.sql;  -- Criação das tabelas
SOURCE database/insert_data.sql;    -- Inserção de dados fictícios
SOURCE database/queries.sql;        -- Executa consultas de análise
```

### 3️⃣ **Rodando via Terminal**
Caso esteja usando MySQL via terminal, rode:
```sh
mysql -u seu_usuario -p < database/setup.sql
```
Para PostgreSQL:
```sh
psql -U seu_usuario -d ecommerce -f database/setup.sql
```

## 🔍 Exemplo de Consultas

- **Frequência de compras por cliente:**
  ```sql
  SELECT id_cliente, COUNT(id_pedido) AS total_pedidos
  FROM pedidos
  GROUP BY id_cliente
  ORDER BY total_pedidos DESC;
  ```

- **Produtos mais vendidos:**
  ```sql
  SELECT p.nome, SUM(i.quantidade) AS total_vendido
  FROM itens_pedido i
  JOIN produtos p ON i.id_produto = p.id_produto
  GROUP BY p.nome
  ORDER BY total_vendido DESC;
  ```

- **Média de valor dos pedidos:**
  ```sql
  SELECT p.id_pedido, SUM(i.quantidade * i.preco_unitario) AS valor_total
  FROM itens_pedido i
  JOIN pedidos p ON i.id_pedido = p.id_pedido
  GROUP BY p.id_pedido;
  ```



