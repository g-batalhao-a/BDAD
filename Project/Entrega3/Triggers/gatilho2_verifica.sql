.mode       columns
.headers    on
.nullvalue  NULL

select * from quantidade natural join produto where quantidade.idProduto = 646430620;

INSERT INTO quantidade VALUES(646430620, 531978268, 100);

select * from quantidade natural join produto where quantidade.idProduto = 646430620;