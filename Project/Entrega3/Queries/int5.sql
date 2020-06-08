.mode       columns
.headers    on
.nullvalue  NULL

-- Numero de seccoes e caixas a cargo de cada funcionário

select funcionario.idpessoa, pessoa.nome, ifnull(numcaixas,0) as NumCaixas, ifnull(numseccoes,0) as Numseccoes
from funcionario natural join pessoa left join 
	(
      select funcionario.idpessoa, count(*) as numcaixas
	  from funcionario,manual
	  where funcionario.idpessoa=manual.idpessoa
	  group by funcionario.idpessoa
    ) as func1 on funcionario.idpessoa = func1.idpessoa
    LEFT join 
    (
      select funcionario.idpessoa, count(*) as numSeccoes
	  from funcionario, seccao, trabalha
	  where trabalha.idpessoa = funcionario.idpessoa AND trabalha.idseccao=seccao.idseccao
	  group by funcionario.idpessoa
    ) as func2 on funcionario.idpessoa = func2.idpessoa;