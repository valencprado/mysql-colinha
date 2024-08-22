-- Prova: Valentina Corradini Prado (PT302539X)


-- Exerc�cio 1
create procedure sp_registrar_item_vendido @id_pedido int, @id_produto int, @qtd_venda int, @valor_venda decimal 
as
begin


	begin try

	begin transaction -- sinalizar ao banco que � uma transa��o (uso de commit e rollback)
	if (select count(*) from pedidos p where p.ped_numero = @id_pedido) > 0 -- verifica se existe algum registro em pedidos com o id (n�mero) passado

		begin -- delimitador do if
		insert into itens_pedidos values (@id_pedido, @id_produto, @qtd_venda, @valor_venda); -- insere item 
		end

	else 

		throw 51000, 'Pedido n�o existe na base', 1; -- caso n�o exista, lan�a exce��o que ser� pega pelo CATCH
		
	if (select prd_qtd from produtos where prd_codigo = @id_produto) >= @qtd_venda -- checa se h� quantidade suficiente do produto solicitado

	begin
		update produtos set prd_qtd = prd_qtd - 1 where prd_codigo = @id_produto; -- atualiza quantidade do produto
		commit transaction;

	end
		else 

			throw 51001, 'Estoque insuficiente', 1; -- lan�a erro caso n�o haja quantidade de produtos suficiente
	end try
	begin catch
	-- vari�veis com dados do erro
	 declare @error_number int = ERROR_NUMBER();
	 declare @error_message nvarchar(400) =ERROR_MESSAGE();

	 select @error_number [ErroId], @error_message [Mensagem]; -- sele��o do erro

	 rollback transaction; -- reverte transa��o
	end catch

end

-- testes
exec sp_registrar_item_vendido @id_pedido = 9, @id_produto = 3, @qtd_venda = 150, @valor_venda = 0.8; -- caso de erro (quantidade elevada)*
exec sp_registrar_item_vendido @id_pedido = 9, @id_produto = 5, @qtd_venda = 20, @valor_venda = 0.8; -- caso de sucesso*

-- *c�digos de verifica��o podem divergir conforme base.



-- Exerc�cio 2


create view vw_valor_pedido -- view auxiliar para somar valor inteiro do pedido (subconsulta)
as
select ped_numero, sum(itp_qtd * itp_valor) [Valor] from itens_pedidos group by ped_numero


create view vw_pedidos -- view principal 
as
select p.ped_numero, c.pes_nome [Cliente], f.pes_nome as [Funcionario], e.pes_nome [Estagiario], vw_valor_pedido.Valor, p.ped_status [Situacao] from pedidos p -- colunas solicitadas pelo exerc�cio
inner join pessoas [c] on p.cli_codigo = c.pes_codigo 
inner join pessoas [f] on p.fun_codigo = f.pes_codigo
inner join pessoas [e] on p.est_codigo = e.pes_codigo -- liga��o com a tabela pessoas utilizando alias para cada tipo de pessoa
inner join itens_pedidos [ip] on ip.ped_numero = p.ped_numero -- liga��o entre pedido e item do pedido
inner join vw_valor_pedido on vw_valor_pedido.ped_numero = p.ped_numero -- liga��o com a view de soma de valores
group by p.ped_numero, c.pes_nome, f.pes_nome, e.pes_nome, p.ped_status, vw_valor_pedido.ped_numero, vw_valor_pedido.Valor -- agrupamento para remover duplicatas de pedido devido aos itens do pedido

-- testes
select * from vw_valor_pedido -- teste da view de valor dos pedidos (resultado esperado: n�mero de pedido e soma total sem duplicatas)
select * from vw_pedidos where vw_pedidos.Situacao = 2 -- apenas pedidos da view 
