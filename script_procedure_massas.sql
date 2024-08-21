alter procedure sp_inserir_massa @opcao int 
as
begin
	begin try
		declare @i int;
		set @i = 0;
		if @opcao = 1
		BEGIN
		BEGIN TRANSACTION
			WHILE (@i < 5)
			BEGIN
				insert into pessoas values('Teste', RAND() * 5 + 8 , 1);
				insert into funcionarios values(SCOPE_IDENTITY(), 1000, null);
				set @i = @i + 1;
			END
		select * from funcionarios;
		END
		else 
			throw 51000, 'opção inválida', 1;
		 if @opcao = 2
		 BEGIN
			set @i = 0;
			WHILE (@i < 5)
			BEGIN
				insert into pessoas values('Teste', RAND() * 5 + 8, 1);
				insert into clientes values(SCOPE_IDENTITY(), 1000, 2000);
				set @i = @i + 1;
			END
		select * from clientes;
		END
		else 
			throw 51000, 'opção inválida', 1;
	end try
	begin catch
		select ERROR_MESSAGE() as MensagemErro, ERROR_NUMBER() as Codigo
		rollback
	end catch
end


exec sp_inserir_massa @opcao = 1;
exec sp_inserir_massa @opcao = 2;
exec sp_inserir_massa @opcao = 3;