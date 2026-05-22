WITH faturamento_mensal AS (
    SELECT 
        DATE_TRUNC('month', data_pedido) AS mes,
        SUM(valor_total) AS faturamento_atual
    FROM PEDIDOS
    GROUP BY DATE_TRUNC('month', data_pedido)
)
SELECT 
    TO_CHAR(mes, 'YYYY-MM') AS periodo,
    faturamento_atual,
    LAG(faturamento_atual, 1) OVER (ORDER BY mes) AS faturamento_mes_anterior,
    CONCAT(ROUND(((faturamento_atual - LAG(faturamento_atual, 1) OVER (ORDER BY mes)) / 
           NULLIF(LAG(faturamento_atual, 1) OVER (ORDER BY mes), 0)) * 100, 2), '%') AS crescimento_mom
FROM faturamento_mensal
ORDER BY mes; 

