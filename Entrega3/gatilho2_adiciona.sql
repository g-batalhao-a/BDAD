create trigger updateQuantity
before insert on quantidade
when new.idproduto in 
(
  select idproduto
  from quantidade
  WHERE quantidade.idproduto = new.idproduto and quantidade.idcompra = new.idcompra
)
BEGIN
	update quantidade
    set quantidade = quantidade + New.quantidade
    where idproduto = New.idproduto and idcompra = new.idcompra;
    update produto
    set quantidade_disponivel = quantidade_disponivel - new.quantidade
    where produto.idproduto = new.idproduto;
    select RAISE(IGNORE);
end;