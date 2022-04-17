# OS COMANDOS DML

Com os tabelas criadas, agora iremos **interagir** com os dados delas! É possível **inserir**, **alterar** e **excluir** tais dados.

## 1. INSERT

O **insert** nos traz a possibilidade de inserir linhas de dado em uma tabela.

Essa é a sintaxe:

```sql
insert into nome_tabela(coluna1, coluna2, colunan) values (valor1, valor2, valorn);
```

> Lembrando que os comandos podem ser escritos tanto em letra maiúscula quanto em minúscula.

A ideia é, basicamente: mostrar em qual tabela será feita a inserção (sem esse aviso, os dados serão inseridos em TODAS as tabelas), indicar as colunas e depois colocar os valores que serão inseridos. Lembrando que o que não é número deve estar entre aspas ou apóstrofos ("" ou '').

## 2. UPDATE

E se o dado inserido estiver errado? O que fazer? Para esse e outros casos, podemos **atualizar** (update) os dados que já haviam sido inseridos.

A forma de escrever o comando:

```sql
update nome_tabela set coluna1 = valor_novo where algo;
```

*nome_tabela*: qual tabela será alterada

*coluna1*: nome do campo que será alterado

*valor_novo*: o novo valor 

*algo*: condição que especifica de que dado estamos falando.



Segue um exemplo para visualizar melhor:

```sql
update filme set
ano = 2003
where codigo_filme = 3;
```

Nesse caso, na tabela filme, aquele que possui código 3 terá seu ano atualizado para 2003.



## 3. DELETE

O comando **delete** é usado para apagar algum dado.

Sintaxe:

```sql
delete from nome_tabela where algo;
```

Assim como o comando anterior, é necessário especificar qual dado será alterado por meio de uma condição, como o código, por exemplo. Ao tirar essa condição, é possível alterar todos os dados de uma tabela.

```sql
# deletando dado específico
delete from alune where codigo = 2;
# deletando tudo
delete from alune;
```
## 4. TRUNCATE TABLE
O comando **truncate** limpa os dados de uma tabela. Assim, fica mais fácil de deletar todos os campos de uma tabela. 

```sql
truncate table alune;
```



