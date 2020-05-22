.mode       columns
.headers    on
.nullvalue  NULL

-- Número de funcionários por supermercado

SELECT supermercado.idsupermercado, supermercado.nome, count(funcionario.idpessoa) AS Numero_Funcionarios
FROM supermercado LEFT JOIN funcionario
WHERE funcionario.idsupermercado = supermercado.idsupermercado
GROUP BY supermercado.idsupermercado;