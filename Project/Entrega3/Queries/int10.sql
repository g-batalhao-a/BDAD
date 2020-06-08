.mode       columns
.headers    on
.nullvalue  NULL

-- Compra mais cara

SELECT idpessoa, nome, max(Custo) AS COMPRA_MAXIMA_CLIENTE 
FROM
(SELECT cliente.idpessoa, pessoa.nome, dia, hora, sum(produto.preco * quantidade.quantidade) as Custo
FROM cliente NATURAL JOIN pessoa NATURAL JOIN compra NATURAL JOIN quantidade, produto
WHERE quantidade.idproduto = produto.idproduto
GROUP by idcompra)
GROUP BY idpessoa;