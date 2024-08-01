# Stored Procedures: um pouco de lógica no banco de dados

Imagine que todos os dias você faça a mesma consulta no banco de dados do seu emprego: um SELECT numa tabela e um SELECT em outra, utilizando o mesmo parâmetro. Para armazenar essa rotina, você provavelmente salvaria um arquivo com esse script. Mas e se você perder este arquivo? Você perde a query. 

Apesar de ser um exemplo simples, outras rotinas recebem vários parâmetros e consultam e alteram valores em diferentes tabelas. Se você perceber, é um caso parecido com as funções em uma linguagem de programação: trata-se de algo repetido no código em que seria muito mais fácil apenas chamar essa função passando os parâmetros necessários.

Para isso, existem as **Stored Procedures** no SQL. Traduzidas como "procedimentos armazenados", são funções salvas no banco de dados que podem ter dentro qualquer comando SQL e são executadas quando chamadas. Elas podem ter parâmetros ou não, e podem ter outros códigos que serão vistos em outra página.

## Criação e Execução

No SQL Server, a criação de uma stored procedure (ou somente procedure ou até proc para íntimos) é (mais ou menos) assim:

```sql
CREATE PROCEDURE sp_selecionar_produto
AS
BEGIN
SELECT * FROM PRODUTOS;
END

EXEC sp_selecionar_produto; -- execução da procedure
```

Se tiver parâmetros, eles ficam logo após o nome da procedure:

```sql
CREATE PROCEDURE sp_selecionar_produto @id int
AS
BEGIN
SELECT * FROM PRODUTOS WHERE Id = @id;
END 

EXEC sp_selecionar_produto @id=3; -- execução com parâmetro
```

No MySQL, a sintaxe é um pouco diferente, com delimitadores e sem o `AS` no início:

```sql
DELIMITER $$
CREATE PROCEDURE sp_selecionar_produto
BEGIN
SELECT * FROM PRODUTOS;
END $$
DELIMITER;

CALL sp_selecionar_produto(); -- execução sem parâmetros
```

Os parâmetros também mudam, pois no MySQL cada parâmetro recebe um **modificador de acesso** no início. Os tipos são:
- **IN**: o parâmetro só possui o objetivo de receber dados e não de retorná-los
- **OUT**: usado para retorno e deve ser passado dentro de uma variável
- **INOUT**: usado nos dois casos, mas também deve ser passado dentro de uma variável

```sql
DELIMITER $$
CREATE PROCEDURE sp_selecionar_produto(IN id int)
BEGIN
SELECT * FROM PRODUTOS;
END $$
DELIMITER;

CALL sp_selecionar_produto(3); -- execução com parâmetro de entrada
```

## Alterar e deletar procedures

Assim como tabelas, as procedures podem ser alteradas usando a cláusula `ALTER`. 

```sql
ALTER PROCEDURE sp_selecionar_produto @id int
AS
BEGIN
SELECT * FROM PRODUTOS WHERE Id = @id;
SELECT * FROM TESTE
END 

EXEC sp_selecionar_produto @id=3; -- execução com parâmetro
```

A exclusão de procedures é feita utilizando a cláusula `DROP` juntamente ao nome do procedimento.

```sql
DROP PROCEDURE sp_selecionar_produto;
```

## Exibir detalhes

Podemos ainda ver mais detalhes da procedure utilizando `SHOW`.

```sql
SHOW PROCEDURE sp_selecionar_produto;
```


[Voltar ao início](../README.md)