-- criação das procedures
CREATE PROCEDURE inserir_produto @nome varchar(50), @quantidade int, @valor decimal, @status int
AS 
insert into produtos values(@nome, @quantidade, @valor, @status)
GO




CREATE PROCEDURE atualizar_nome_produto @nome nvarchar(30), @id_produto int
AS
update produtos set prd_descricao = @nome where prd_codigo = @id_produto
GO

CREATE PROCEDURE deletar_produto @id int
AS 
delete produtos where prd_codigo = @id
GO

CREATE PROCEDURE inserir_pessoa @nome varchar(50), @cpf int, @status int
AS
insert into pessoas values(@nome, @cpf, @status)
GO

CREATE PROCEDURE inserir_funcionario @id_pessoa int, @salario decimal, @id_superior int
AS
insert into funcionarios values (@id_pessoa, @salario, @id_superior)
GO

CREATE PROCEDURE atualizar_funcionario_salario @id_funcionario int, @salario decimal
AS
update funcionarios set fun_salario = @salario where pes_codigo = @id_funcionario
GO 

CREATE PROCEDURE deletar_funcionario @id_funcionario int
AS
delete funcionarios where pes_codigo = @id_funcionario
GO




-- execução das procedures
EXEC inserir_produto @nome = 'Palito', @quantidade = 50, @valor = 3.5, @status = 1

EXEC atualizar_nome_produto @nome = 'Palitos de sorvete', @id_produto = 6

EXEC deletar_produto @id = 6

EXEC inserir_pessoa @nome = 'Juberelson da Silva', @cpf = 121221, @status = 1

EXEC inserir_funcionario @id_pessoa = 9, @salario = 1800.00, @id_superior = 4

EXEC atualizar_funcionario_salario @id_funcionario = 9, @salario = 2000.00

EXEC deletar_funcionario @id_funcionario = 9

