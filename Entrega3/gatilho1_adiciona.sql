create trigger updateProductQuantity
BEFORE insert on quantidade
BEGIN
	SELECT case
    when (Select idproduto from produto where idproduto = new.idproduto and quantidade_disponivel - new.quantidade <0)
    then RAISE(ABORT, 'Not enough available quantity') 
    end;
end;