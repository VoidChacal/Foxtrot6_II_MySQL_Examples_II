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
