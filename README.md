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

## Arquivos CSV

Os seguintes arquivos CSV foram incluídos para facilitar a análise de dados no Power BI:

- `clientes.csv`: Contém os dados dos clientes.
- `produtos.csv`: Contém informações sobre os produtos.
- `pedidos.csv`: Contém informações sobre os pedidos realizados.
- `itens_pedido.csv`: Contém informações sobre os itens de cada pedido.
- `pagamentos.csv`: Contém informações sobre os pagamentos feitos.

### Como Usar os Arquivos CSV no Power BI

1. Baixe os arquivos CSV da pasta `/data` do repositório.
2. No Power BI, clique em "Obter Dados" e escolha a opção "Arquivo CSV".
3. Selecione os arquivos desejados e faça a importação.
4. Crie relacionamentos entre as tabelas (por exemplo, `clientes.id_cliente` com `pedidos.id_cliente`).
5. Comece a análise dos dados criando gráficos, relatórios e dashboards.

