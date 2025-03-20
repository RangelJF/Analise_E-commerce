# Análise de Vendas de E-commerce

Este projeto tem como objetivo demonstrar como construir uma análise de vendas para um e-commerce. A análise foi realizada utilizando o Power BI, que conecta dados de vendas simulados a partir de um banco de dados fictício.

## Estrutura do Repositório

- `/database/`: Contém os scripts SQL para criação das tabelas e inserção de dados fictícios.
  - `create_tables.sql`: Criação do banco de dados e das tabelas.
  - `insert_data.sql`: Inserção de dados fictícios para simulação de vendas.
  
## Como Rodar os Scripts

1. Crie um banco de dados no seu ambiente de SQL (MySQL, PostgreSQL, etc.).
2. Execute o script `create_tables.sql` para criar as tabelas.
3. Execute o script `insert_data.sql` para inserir os dados fictícios.

## Conectando no Power BI

1. Após executar os scripts SQL, exporte os dados das tabelas como arquivos CSV ou conecte diretamente ao seu banco de dados no Power BI.
2. Use o Power BI para criar dashboards com os dados de vendas, como gráficos de vendas por produto, análise de métodos de pagamento, entre outros.

## Tecnologias Utilizadas

- SQL (MySQL/PostgreSQL)
- Power BI
