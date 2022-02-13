Vamos para os comandos DDL,  que criam e controlam os objetos do banco.

## 1. CREATE

O **create** é responsável por criar um banco ou tabelas de um banco.

Sobre a criação de tabelas, essa é a sintaxe:

```sql
create table nome_tabela(
nome_atributo tipo
primary key(nome_atributo)
);
```

nome_tabela → nome da tabela

nome_atributo → nome de um campo a ser criado

tipo → tipo de atributo

primary key → chave primária 



Depois de criar a base de dados, é necessário **usá-la**.

```sql
use nome_tabela;
```



## 2. ALTER

Com o **alter**, é possível eliminar ou inserir atributos em tabelas que já existem.

Essa é a sintaxe (mais generalizada):

```sql
alter table nome_tabela add / drop column(
    nome_atributo tipo 
);
```

- Alterar adicionando um campo:

  ```sql
  alter table nome_tabela add atributo tipo;
  ```

- Alterar deletando uma campo:

  ```sql
  alter table nome_tabela drop column atributo;
  
  ```

- Alterar adicionando chave primária

  ```sql
  alter table nome_tabela add primary key(chave)
  ```

  

## 3. DROP

O comando **drop** elimina algo, seja uma tabela ou um banco de dados

A sintaxe é essa:

```sql
-- dropando tabela
drop table nome_tabela;

-- dropando banco de dados
drop database nome_banco;

-- dropando primary  e foreign key
alter table nome_tabela drop foreign key nome_chave;
alter table nome_tabela drop primary key;
```



## Visualização de tabelas: DESCRIBE  e SHOW

Esses últimos dois comandos servem especificamente para visualizar ou exibir a tabela.

- **DESCRIBE**

  ```sql
  -- visualiza tabela
  describe tabela;
  ```

- **SHOW**

  ```sql
  -- exibir as tabelas
  show tables;
  -- exibir script da criação da tabela
  show create table tabela;
  -- exibir o(s) banco(s) de dados
  show databases;
  ```

  