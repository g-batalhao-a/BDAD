.mode       columns
.headers    on
.nullvalue  NULL

-- Compras (Dia, Hora e Custo) de um certo cliente.

SELECT cliente.idpessoa, pessoa.nome, dia, hora, sum(produto.preco * quantidade.quantidade) as Custo
FROM cliente NATURAL JOIN pessoa NATURAL JOIN compra NATURAL JOIN quantidade, produto
WHERE quantidade.idproduto = produto.idproduto AND pessoa.nif = '238698418' -- NIF do Cliente pretendido
GROUP by idcompra;