# COMANDOS DQL PARTE 1 - O SELECT
DQL é a abreviação de *"Data Query Language"*, que significa "Linguagem de Consulta de Dados". Por meio dela, é possível consultar os dados da tabela e seu principal (e único) comando é o **SELECT**. Porém, selecionar dados é complexo. Dependendo das necessidades da situação, é possível fazer essa seleção de inúmeras maneiras. Com isso, aqui na colinha, o tópico está dividido em cinco partes:

1. **WHERE**, **AS**, Funções e Operadores
2. Os **JOINS** (inner, left, right)
3. **ORDER BY**, **GROUP BY** e **HAVING**
4. Funções de Agregação
5. **distinct**, **union** e criar **views**

> OBS: Todo select possui **FROM**, pois ele especifica em qual tabela acontecerá o select. 


## WHERE
Especifica a condição do select. 
Exemplo:
```sql
select * from tb_aluno where nota > 4;
```
Nesse caso, usamos o operador aritmético ">", mas outros itens podem ser utilizados para filtrar e/ou alterar a seleção.

### Funções
Algumas funções são utilizadas para alterar visualmente os selects, numa espécie de formatação. Seguem aqui alguns exemplos:

<img src="./../img/funcoes.png">

### Operadores
Na clausula **WHERE**, há algumas especificações que podem ser feitas.
- **IN**: valores de uma lista
```sql
select codigo from tb_aluno where codigo in (1,4);
```
- **NOT**:
```sql
select codigo from tb_aluno where codigo in (1,4);
```
- **BETWEEN**: entre valores
```sql
```
- **LIKE**: espécie de pesquisa que utiliza % no começo, meio ou fim, dependendo do contexto
```sql
```
- **">"**, **"<"**, **">="** e **"<="**: maior que, menor que, maior ou igual a, menor ou igual a
```sql
```
- **and**, **not** e **in**: 
```sql
```
## AS
O **AS** serve para dar apelidos (nomes temporários) a campos ou tabelas. Com os apelidos, um join pode se tornar mais fácil ou intuitivo. 

```sql
# coluna
select nome_aluno as aluno from tb_aluno; 
# tabela
Select t1.nome_car t1, t1.vlhora_car
from cargo t1

```
