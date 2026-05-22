WITH media_categoria AS (
    SELECT 
        nome_produto,
        categoria,
        preco,
       ROUND(AVG(preco) OVER(PARTITION BY categoria),2) AS media_adquirida
    FROM PRODUTOS
)
    SELECT 
    nome_produto,
    categoria,
    preco,
    media_adquirida,
    ROUND ((preco - media_adquirida), 2 ) AS diferenca_para_media
FROM media_categoria; 
