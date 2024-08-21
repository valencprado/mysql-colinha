-- criação das procedures
CREATE PROCEDURE sp_inserir_pedidos @data datetime, @valor decimal, @status int, @id_funcionario int, @id_cliente int, @id_estagiario int, @id_produto int, @quantidade_produto int, @valor_produto decimal
AS 
BEGIN
DECLARE @ped_numero int;

insert into pedidos values (@data, @valor, @status, @id_funcionario, @id_cliente, @id_estagiario)

set @ped_numero = SCOPE_IDENTITY()

insert into itens_pedidos values(@ped_numero, @id_produto, @quantidade_produto, @valor_produto)
END
GO

CREATE PROCEDURE sp_atualizar_pedidos @id_pedido int, @data datetime, @valor decimal, @status int, @id_funcionario int, @id_cliente int, @id_estagiario int,  @quantidade_produto int, @valor_produto decimal
AS 
BEGIN
update pedidos set ped_data = @data,ped_valor = @valor,ped_status = @status, fun_codigo = @id_funcionario, cli_codigo = @id_cliente, est_codigo = @id_estagiario where ped_numero = @id_pedido

update itens_pedidos set  itp_qtd = @quantidade_produto,itp_valor= @valor_produto where ped_numero = @id_pedido
END
GO


CREATE PROCEDURE sp_deletar_pedidos  @id_pedido int
AS 
BEGIN
delete itens_pedidos where ped_numero = @id_pedido
delete pedidos where ped_numero = @id_pedido
END
GO




EXEC sp_inserir_pedidos @data='2008-11-11 13:23:44.000', @valor = 1.2, @status=1, @id_funcionario=4, @id_cliente=1,@id_estagiario=3, @id_produto=3, @quantidade_produto = 1, @valor_produto = 1.2;
EXEC sp_atualizar_pedidos @data='2008-11-11 13:23:44.000', @valor=15.0,@status=1, @id_funcionario=6, @id_cliente=1,@id_estagiario=5, @id_pedido=21, @quantidade_produto = 1, @valor_produto = 1.2;
EXEC sp_deletar_pedidos @id_pedido=22;
