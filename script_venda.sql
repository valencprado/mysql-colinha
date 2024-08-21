use vendas;
--8.Consultar duas pessoas que possuem nome com alguma subpalavra 'super'

select top 2 * from pessoas where pes_nome like '%super%';

--9.Consultar as pessoas com letra b na a inicial do nome.

select  * from pessoas where pes_nome like 'b%';

--10.Consultar as pessoas que possuem a letra p como sendo a terceira letra do nome.

select  * from pessoas where pes_nome like '__p%';

--11.Consultar o valor médio dos produtos.

select avg(prd_valor)as 'Valor Médio' from produtos;

--12.Consultar o maior valor de venda de produto.

select max(prd_valor) as 'Maior venda' from produtos;

--13.Consultar o menor valor de venda de produto.

select min(prd_valor) as 'Menor venda' from produtos;

--14.Consultar o valor médio de produto, bem como o maior valor, o menor valor e a quantidade de produtos cadastrados.

select max(prd_valor) as 'Maior', min(prd_valor) as 'Menor', avg(prd_valor) as 'Média', count(*) as 'Quantidade total' from produtos;

--15.Consultar as pessoas com o código 1 ou 7.

select * from pessoas where pes_codigo = 1 or pes_codigo = 7;

--16.Consultar as pessoas com o código 1 e 7.

select * from pessoas where pes_codigo = 1 and pes_codigo = 7;

--17.Consultar as pessoas que possuem os códigos 1,2 e 5.
select * from pessoas where pes_codigo in (1, 2, 5);

--18.Consultar as pessoas que possuem código entre 3 e 6.
select * from pessoas where pes_codigo between 3 and 6;

--19.Consultar os supervisores.

select * from funcionarios where sup_codigo is null;

--20.Consultar somente os funcionários.

select * from funcionarios where sup_codigo is not null;

--21.Consultar todos os pedidos do cliente 2.

select * from pedidos where cli_codigo = 2;

--22.Consultar todos os pedidos do cliente 2 que foram vendidos pelo funcionário 6.

select * from pedidos where cli_codigo = 2 and fun_codigo = 6;