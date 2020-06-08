.mode       columns
.headers    on
.nullvalue  NULL

-- Frequência de Clientes, em relação à sua localidade

DROP VIEW IF EXISTS [clientslocations];

CREATE VIEW [clientslocations] AS
SELECT localizacao.idlocalizacao,localizacao.localidade,COUNT(cliente.idpessoa) as Numero_Clientes
FROM localizacao NATURAL JOIN pessoa NATURAL JOIN cliente
WHERE localizacao.idlocalizacao = pessoa.idlocalizacao 
GROUP by localizacao.localidade;

SELECT clientslocations.idlocalizacao, clientslocations.localidade, ((Numero_Clientes*100)/COUnt(cliente.idpessoa)) AS Frequencia_clientes
FROM clientslocations,cliente
GROUP by clientslocations.localidade;