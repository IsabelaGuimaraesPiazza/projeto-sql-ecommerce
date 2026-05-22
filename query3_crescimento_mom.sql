WITH faturamento_por_cliente AS (
  SELECT 
    c.nome AS nome_cliente,
    SUM(p.valor_total) AS faturamento_cliente
    FROM CLIENTES c
    INNER JOIN PEDIDOS p ON c.id_cliente = p.id_cliente
    GROUP BY c.nome
)
SELECT 
    nome_cliente,
    faturamento_cliente,
    SUM(faturamento_cliente) OVER(ORDER BY faturamento_cliente DESC) AS faturamento_acumulado
FROM faturamento_por_cliente
ORDER BY faturamento_cliente DESC; 
