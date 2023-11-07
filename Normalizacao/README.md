# NORMALIZAÇÃO DE DADOS

A normalização de dados é uma forma de "refinar" as tabelas antes de elas irem para o modelo físico ou lógico. É uma maneira de manter a **consistência** e **integridade** dos dados, evitando as assustadoras **redundâncias**, que podem estragar o seu banco! Ela possui algumas regras (chamadas de forma normal) que devem ser seguidas numa espécie de passo a passo: para ir para a norma 2, é necessário que o banco tenha passado pelo passo 1. Para os desenvolvedores, é essencial que se saiba até a terceira forma normal. Caso exista algum interesse em ser DBA, existem ainda mais formas normais!

## Formas normais: Quais são?

1. 1FN: cada dado é atômico e devem ser indivisíveis
2. 2FN: remoção das dependências não funcionais
3. 3FN: remoção das dependências transitivas

A parte assustadora dessa matéria é seguir corretamente a ordem das Normas, não pulando nem um passo e, principalmente, sem esquecer de deixar tudo totalmente preparado para a normalização seguinte.

> Essa página ainda está em construção! 🚧🚧
## 1FN: dados indivisíveis

Na primeira parte da normalização, a ideia é um tanto quanto simples: tem algum atributo multivalorado? Pois dê tchau a ele!

Falando sério agora, a ideia é que cada valor da tupla deve ser identificável pela chave primária. Por exemplo, observe a tabela abaixo:

| ID          | Comida      | Temperos       |
| ----------- | ----------- |-------         |
| 1           | Coxinha     | Sal, pimenta   |
| 2           | Pastel      | Sal, manjericão|


Essa tabela é, no olhar da primeira forma normal, um **CRIME**. Existe mais de um dado dentro da parte de temperos e isso pode corromper a base de dados. Como lidar com esses múltiplos valores? A regra é clara: **um valor para representar um grupo de informações**.

Mas tudo tem uma solução! Para eliminar campos multivalorados, a principal solução é criar uma nova tabela ou coluna, a depender do caso. Por exemplo:

Comidas

| ID          | Comida      |
| ----------- | ----------- |
| 1           | Coxinha     |
| 2           | Pastel      |

Temperos

| ID          | Tempero     |
| ----------- | ----------- |
| 1           | Sal         |
| 2           | Pimenta     |
| 3           | Manjericão  |

ComidasTemperadas

| ID          | ID_comida | ID_tempero |
| ----------- | --------- | ---------  |
| 1           | 1         | 1          |
| 2           | 1         | 2          |

Agora, temos uma tabela que faz a junção das comidas com os temperos, criando a tabela de ComidasTemperadas. O importante da 1FN é desmembrar campos que recebem múltiplos valores de forma que cada valor desses possa ser atrelado de fato a uma tupla. 

## 2FN: sem dependências não funcionais



## 3FN: sem dependências transitivas

[Voltar ao início](../README.md)
