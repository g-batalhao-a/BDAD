.mode       columns
.headers    on
.nullvalue  NULL

-- Clientes e as suas informações

SELECT *
FROM cliente NATURAL JOIN pessoa
ORDER BY numero_de_cliente;