/* deletar função */ 
DROP PROCEDURE DelPedido;

/* fazer pedido */
DELIMITER $$
CREATE PROCEDURE FazPedido(IN quem INT, IN oque INT, IN quanto INT)
BEGIN
	INSERT INTO  pedido (id_cliente, id_produto, qtd) VALUES (quem, oque, quanto);
    UPDATE produto SET qtd = qtd-quanto WHERE cd = oque;
END $$
DELIMITER ;

CALL FazPedido(1, 4, 22);

/* devolver quantidade */
DELIMITER $$
CREATE PROCEDURE DelPedido(	IN qual INT)
BEGIN
	SET @quanto = 0;
    SET @oque = 0;
	SELECT qtd INTO @quanto FROM pedido WHERE cd = qual;
    SELECT id_produto INTO @oque FROM pedido WHERE cd = qual;
    UPDATE produto SET qtd = qtd+@quanto WHERE cd = @oque;
    DELETE FROM pedido WHERE cd = qual;
END $$
DELIMITER ;

CALL DelPedido(1);

/* Exercicio */
DELIMITER $$
CREATE PROCEDURE pedido (IN qt INT, IN vendedor INT, IN cliente INT, IN produto INT)
BEGIN
	INSERT INTO pedido (id_vendedor, id_cliente, id_produto, qtd) VALUES ( vendedor, cliente, produto, qtd);
    SET @idPedido = LAST_INSERT_ID();
    SET @vl = 0;
    UPDATE produto SET qtd = qtd-qt WHERE cd = produto;
    SELECT valor INTO @vl FROM produto WHERE cd = produto;
    SET @res = (@vl/100)*5;
    INSERT INTO comissao (id_pedido, id_vendedor, valor) VALUES ( @idPedido, vendedor, @res);
END $$ 
DELIMITER ;

CALL pedido(2, 1, 1, 3);

SELECT * FROM pedido;
SELECT * FROM comissao;
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM vendedor;
