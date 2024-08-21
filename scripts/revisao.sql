-- revisão: Valentina Corradini Prado

----40.	Consultar o total vendido do Produto 4
select prd_descricao, sum(itp_qtd * itp_valor) from itens_pedidos inner join produtos on produtos.prd_codigo = itens_pedidos.prd_codigo where produtos.prd_codigo = 4 group by prd_descricao; 

--41.	Consultar o valor total de cada pedido.
select p.ped_numero, sum(itp_valor * itp_qtd) [Valor_Total] from itens_pedidos ip inner join pedidos p on ip.ped_numero = p.ped_numero group by p.ped_numero;

--42.	Consultar o total vendido do produto 3 em cada pedido.

select ip.ped_numero, sum(ip.itp_qtd) [Qtd_total], sum(ip.itp_valor) as 'Valor_total' from itens_pedidos ip inner join produtos p on ip.prd_codigo = p.prd_codigo where p.prd_codigo = 3 group by ped_numero;

--43.	Consultar os pedidos com valor total acima de R$ 30,00 reais.
select p.ped_numero, sum(itp_valor * itp_qtd) as 'Valor total' from itens_pedidos ip inner join pedidos p on ip.ped_numero = p.ped_numero group by p.ped_numero having sum(itp_valor * itp_qtd)> 30.00;

--44.	Consultar a quantidade de itens por pedido.

select  p.ped_numero, sum(ip.itp_qtd) as 'Quantidade de itens' from itens_pedidos ip inner join pedidos p on ip.ped_numero = p.ped_numero group by p.ped_numero;

--45.	Consultar a quantidade de vezes que cada produto foi vendido.

select p.prd_descricao, sum(ip.itp_qtd) from itens_pedidos ip inner join produtos p on p.prd_codigo = ip.prd_codigo group by p.prd_descricao;

--46.	Consultar quantos pedidos cada cliente solicitou.

select cli_codigo, count(*) [Qtd_pedidos] from pedidos group by cli_codigo;

--47.	Consultar quantos pedidos cada funcionário registrou.   

select fun_codigo, count(*) [Qtd_pedidos_registrados] from pedidos group by fun_codigo;

--48.	Consultar os pedidos que possuem mais do que 3 itens.

select p.ped_numero,  count(prd_codigo) [Qtd_itens] from itens_pedidos ip inner join pedidos p on ip.ped_numero = p.ped_numero group by p.ped_numero having count(prd_codigo)>3;

--49.	Consultar o produto mais vendido em quantidade de itens.

select top 1 p.prd_descricao, sum(itp_qtd) [Qtd] from itens_pedidos ip inner join produtos p on ip.prd_codigo = p.prd_codigo group by p.prd_descricao order by Qtd desc;

--50.	Consultar os pedidos (ped_numero, ped_data) que possuem mais do que 3 itens.  Usar exists.

select pe.ped_numero, pe.ped_data from pedidos pe where exists (select * from itens_pedidos ip where ip.ped_numero = pe.ped_numero having count(ip.prd_codigo) > 3);

--51.	Consultar as pessoas que são clientes. Usar exists.    

select * from pessoas p where exists ( select * from clientes c where p.pes_codigo = c.pes_codigo);

--52.	Consultar os clientes que possuem pedidos com valor total acima de R$ 20,00. Usar exists.

select * from clientes where exists (select * from pedidos pe inner join itens_pedidos ip on ip.ped_numero = pe.ped_numero having sum(ip.itp_valor * ip.itp_qtd)>20);

--53.	Consultar a data do sistema, e separadamente o ano, mês, dia, hora e minutos.

select year(sysdatetime()), month(sysdatetime()), day(sysdatetime()), convert(time(0), sysdatetime());

--54.	Consultar o valor total do pedido 1.

select sum(ip.itp_valor * ip.itp_qtd) as 'Valor total' from itens_pedidos ip inner join pedidos p on ip.ped_numero = p.ped_numero where p.ped_numero = 1;

--55.	Consultar o total vendido do produto 3

select sum(ip.itp_qtd) [Qtd_total], sum(ip.itp_valor) [Valor_total] from itens_pedidos ip inner join produtos p on ip.prd_codigo = p.prd_codigo where p.prd_codigo = 3;