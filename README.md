E-Commerce Analytics: Modelagem e Consultas em SQL
Este repositório contém o desenvolvimento de um banco de dados relacional simulando o ecossistema de um e-commerce. O objetivo principal é demonstrar a aplicação de SQL para extrair métricas estratégicas de negócios, auxiliando tomadores de decisão em análises financeiras, de produtos e de clientes.

 Tecnologias e Conceitos Utilizados
* **Banco de Dados:** PostgreSQL
* **DML/DDL:** Criação de tabelas, chaves primárias (`SERIAL PRIMARY KEY`), chaves estrangeiras (`FOREIGN KEY`) e integridade referencial.
* **SQL:** Window Functions (`OVER`, `PARTITION BY`), funções de deslocamento (`LAG`), funções matemáticas e de arredondamento (`ROUND`), manipulação de datas (`DATE_TRUNC`, `TO_CHAR`) e tratamento de divisões por zero (`NULLIF`).


 Estrutura do Repositório

O projeto foi dividido para seguir as boas práticas de desenvolvimento:

 **`schema.sql`**: Contém o script de criação das tabelas (`CLIENTES`, `PRODUTOS`, `PEDIDOS`) e a inserção de dados fictícios para testes.
**`query1_media_categoria.sql`**: Análise de competitividade de preços de produtos.
**`query2_faturamento_acumulado.sql`**: Ranking e acúmulo de receita por cliente.
**`query3_crescimento_mom.sql`**: Análise de crescimento mês a mês (Month-over-Month).


 Detalhes das Análises Desenvolvidas

 1. Análise de Competitividade de Preços (`query1_media_categoria.sql`)
* **Problema de Negócio:** O gerente de produtos precisa identificar quais itens estão muito acima ou abaixo do preço médio da sua própria categoria para ajustar as margens de lucro.
* **Solução Técnica:** Utilização de `AVG() OVER(PARTITION BY categoria)` para calcular a média segmentada sem aglutinar as linhas, permitindo calcular o desvio exato de cada produto em relação ao seu nicho.

 2. Ranking de Clientes VIPs (`query2_faturamento_acumulado.sql`)
* **Problema de Negócio:** Identificar o comportamento de compra dos clientes e calcular o faturamento acumulado ordenado pelos maiores compradores (base para uma análise de Curva ABC).
* **Solução Técnica:** Criação de uma CTE de faturamento por cliente unindo as tabelas através de `INNER JOIN`, seguida da aplicação da função de janela `SUM(faturamento) OVER(ORDER BY ... DESC)`.

 3. Crescimento Mês a Mês - MoM (`query3_crescimento_mom.sql`)
* **Problema de Negócio:** A diretoria precisa acompanhar a saúde financeira do e-commerce e saber se as vendas estão escalando mês a mês.
* **Solução Técnica:** Agrupamento temporal com `DATE_TRUNC`, uso do `LAG()` para resgatar o faturamento do mês anterior na mesma linha e aplicação do `NULLIF()` para blindar a operação matemática contra erros de divisão por zero.

 Como Executar o Projeto
1. Execute o conteúdo de `schema.sql` em seu ambiente PostgreSQL ou Oracle Database para estruturar o banco e popular os dados.
2. Execute qualquer uma das queries analíticas (`query1`, `query2` ou `query3`) para visualizar os relatórios gerados.
