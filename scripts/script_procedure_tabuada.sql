-- criação da procedure
CREATE PROCEDURE sp_tabuada @numero int
AS
BEGIN
	BEGIN TRY
		IF @numero NOT BETWEEN 1 AND 10 
				THROW 51000, 'número escolhido fora do range aceito', 1;
		ELSE
			DECLARE @i int = 0;
				WHILE @i < $11
				BEGIN
				DECLARE @multiplicacao int = @numero * @i;
				PRINT CAST(@numero as VARCHAR(2)) + ' X ' + CAST(@i as VARCHAR(2)) + ' = ' + CAST(@multiplicacao as VARCHAR(2));
				SET @i = @i + 1;
				END
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
	END CATCH
END


-- testes
EXEC sp_tabuada @numero=5; -- caso de sucesso
EXEC sp_tabuada @numero = 20; -- caso de erro