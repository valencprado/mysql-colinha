# COMANDOS DQL PARTE 3 - FUNÇÕES DE AGREGAÇÃO

As funções de agregação tem o objetivo de realizar cálculos aritméticos e operações gerais com as tuplas das tabelas. A operação ocorre em uma coluna específica com todos os registros.

Essas funções são utilizadas juntamente ao SELECT, dando informações que não conseguiríamos ter somente olhando a tabela ou que até seria possível, mas daria muito mais trabalho. Por isso, nada mais justo do que aproveitar o que o SQL nos oferece.

A sintaxe geral de todas as funções é: 
```sql
NOME_FUNCAO(nome_coluna)
```

1. AVG(): __Average__
Função que retorna a média de todos os registros da coluna.
EXEMPLO: suponha que há uma tabela de notas de uma prova e você gostaria de saber a média da sala. Nesse caso, a função seria usada dessa forma:

```sql
SELECT AVG(nota) FROM provas;
```

2. SUM(): __Sum__
Como o próprio nome diz, a função SUM() soma o valor de todas as tuplas. Imagine que, em uma tabela de vendas, exista uma coluna de quantidade vendida conforme o dia e você precisa saber quantos e itens foram vendidos no total. A função ficaria assim:

```sql
SELECT SUM(qtd) FROM vendas;
```

3. COUNT(): __Count__
Esta função conta quantos registros existem na coluna. Por exemplo: você quer saber quantos usuários estão cadastrados no sistema. Uma forma de verificar isso seria desta maneira:

```sql
SELECT COUNT(*) FROM usuarios; 
-- nota: o * remete a todas as colunas, mas poderia ser o nome de uma coluna específica
```

4. MIN(): __Minimum__
Trata-se de uma função que devolve o menor valor que existe na coluna inteira. Retornando ao exemplo das notas dos alunos, poderíamos buscar a nota do aluno que mais se deu mal assim:

```sql
SELECT MIN(nota) FROM provas;
```

5. MAX(): __Maximum__
Ao contrário da anterior, essa função retorna o maior número de uma coluna. Vamos supor que você precisa descobrir a maior quantidade de cliques que os botões do seu site receberam e você guarda esse dado conforme botão. O comando ficaria assim:

```sql
SELECT MAX(qtd_cliques) FROM botoes_cliques_diarios;
```



[Voltar ao início](../README.md)

