.mode       columns
.headers    on
.nullvalue  NULL

-- Top 5 de Produtos

SELECT * FROM
(SELECT produto.nome, produto.preco, quantidade.quantidade as Quantidade_Comprada
FROM produto NATURAL JOIN quantidade
WHERE quantidade.idproduto = produto.idproduto
GROUP by idproduto)
ORDER BY Quantidade_comprada DESC
LIMIT 5;