# VIEW: Tabelas de mentira?

Após descobrirmos um pouco mais sobre Stored Procedures e a criação de lógica dentro do banco de dados, chegamos ao conceito de **view**. Conceitualmente, uma view é uma tabela virtual que possui o objetivo de facilitar a visualização de dados. Ela é salva no banco de dados e pode ser chamada, assim como os procedimentos, mas a chamada é feita considerando a view como uma tabela.

Por exemplo: suponha que esteja trabalhando em um e-commerce. Para poder ver um pedido na visão de administrador, é necessário fazer um select com vários joins para juntar cliente, pedido, itens do pedido, funcionário etc. Ao invés de você fazer um select completamente verboso toda vez que precisa ver essas informações. Ou pior: precisar adicionar cláusulas como where e order by, podendo causar erros inesperados e o mau funcionamento da query.

Para isso, existem as views: não há necessidade de alterar dados ou criar lógica, queremos apenas mostrar os dados encapsulando joins e queries mais complexas. Podemos tratá-la exatamente como uma tabela sem alterar os dados que ela exibe.


## Sintaxe
A criação, alteração e deleção de views é a mesma no SQL Server e no MySQL. 

```sql
-- criação
create view vw_aluno as 
select a.nome, a.nota from alunos a;

-- alteração
alter view vw_aluno as
select a.nome as Nome, a.nota as Nota from alunos a;

-- deleção
drop view vw_aluno;
```

E como dito anteriormente, sua chamada é a mesma de um select em uma tabela. Porém, selecionamos dados da view e não das tabelas diretamente. Podemos selecionar todas as colunas ou especificar, além de adicionar funções de agregação.

> NÃO é recomendado ficar aninhando views por conta da complexidade!

```sql
select * from vw_aluno;
```

[Voltar ao início](../README.md)