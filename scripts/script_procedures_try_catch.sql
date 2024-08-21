-- criação das procedures
CREATE PROCEDURE sp_criar_funcionario_try_catch @nome varchar(50), @cpf varchar(12), @status int, @salario decimal, @id_superior int
AS
BEGIN
DECLARE @id int;
BEGIN TRY
INSERT INTO pessoas VALUES(@nome, @cpf, @status);
SET @id = @@IDENTITY
INSERT INTO funcionarios VALUES(@id, @salario, @id_superior)
END TRY
BEGIN CATCH
SELECT ERROR_MESSAGE() AS MensagemErro, ERROR_PROCEDURE() AS NomeProcedure
END CATCH
END;



CREATE PROCEDURE sp_criar_cliente_try_catch @nome varchar(50), @cpf varchar(12), @status int, @renda decimal, @credito decimal
AS
BEGIN
DECLARE @id int;
BEGIN TRY
INSERT INTO pessoas VALUES(@nome, @cpf, @status);
SET @id = @@IDENTITY
INSERT INTO clientes VALUES(@id, @renda, @credito)
END TRY
BEGIN CATCH
SELECT ERROR_STATE() AS StatusErro, ERROR_SEVERITY() AS StatusGravidade, ERROR_MESSAGE() AS MensagemErro, ERROR_PROCEDURE() AS NomeProcedure
END CATCH
END;

select * from funcionarios

-- testes
EXEC sp_criar_funcionario_try_catch @nome='Fernandinho', @cpf='123132', @status=1, @salario=1200.4, @id_superior=4 -- erro
EXEC sp_criar_cliente_try_catch @nome='Susan', @cpf='123131', @status=1, @renda=10000.0, @credito=250 -- sucesso