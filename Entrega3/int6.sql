.mode       columns
.headers    on
.nullvalue  NULL

-- Lucro de um supermercado

SELECT supermercado.idsupermercado,supermercado.nome, sum(Lucro) as Lucro_Supermercado
FROM supermercado NATURAL JOIN
(SELECT  caixa.idsupermercado, sum(produto.preco * quantidade.quantidade) as Lucro
 FROM caixa NATURAL JOIN pessoa NATURAL JOIN compra NATURAL JOIN quantidade, produto
WHERE quantidade.idproduto = produto.idproduto
GROUP by idcaixa)
GROUP BY idsupermercado
ORDER BY Lucro_Supermercado DESC;