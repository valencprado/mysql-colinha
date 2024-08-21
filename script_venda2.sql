----23.	Consultar os pedidos que foram solicitados pelo cliente 2, registrados pelo funcionário 8 e conferidos pelo estagiário 5.
select * from pedidos where cli_codigo=2 and fun_codigo = 8 and est_codigo = 5

----24.	Consultar a quantidade de itens vendidos	
select distinct sum(itp_qtd) from itens_pedidos;

----25.	Consultar a quantidade de pedidos do cliente 1.
select count(*) from pedidos where cli_codigo = 1;

----26.	Consultar a quantidade de itens vendidos relacionada ao pedido 2.
select * from itens_pedidos where ped_numero = 2;

----27.	Consultar quantos pedidos foram registrados pelo funcionário 6
select count(*) from pedidos where fun_codigo = 6;

----28.	Consultar quantas vezes o produto 3 foi vendido.
select count(*) from itens_pedidos where prd_codigo = 3

----29.	Consultar todas as pessoas.
select * from pessoas;

----30.	Consultar todos os dados dos clientes.
select * from clientes c inner join pessoas p on c.pes_codigo = p.pes_codigo;

----31.	Consultar nome, CPF, renda e crédito de todos os clientes.
select p.pes_nome, p.pes_cpf, c.cli_renda, c.cli_credito from pessoas p inner join clientes c on c.pes_codigo = p.pes_codigo;

----32.	Consultar os produtos (descrição) e as quantidades vendidas no pedido 1.
select p.prd_descricao, i_p.itp_qtd from produtos p inner join itens_pedidos i_p on p.prd_codigo = i_p.prd_codigo where p.prd_codigo = 1;

----33.	Consultar os produtos (descrição), quantidades vendidas, valores unitários e o valor de cada item do pedido 2.
select prd_descricao, itp_qtd, prd_valor from produtos p inner join itens_pedidos i_p on p.prd_codigo = i_p.prd_codigo where ped_numero = 2;

----34.	Consultar número, data, nome do funcionário, nome do cliente e nome do estagiário de cada pedido.
select ped_numero, ped_data, func.pes_nome, cli.pes_nome, est.pes_nome from pedidos inner join pessoas as func on (pedidos.fun_codigo = func.pes_codigo) inner join pessoas as cli on (pedidos.cli_codigo = cli.pes_codigo) inner join pessoas as est on (pedidos.est_codigo = est.pes_codigo)

----35.	Consultar código, nome, salário e o nome do supervisor de cada funcionário.
select f.pes_codigo, p.pes_nome, fun_salario, sup.pes_nome as 'Nome do superior' from  funcionarios f inner join pessoas as sup on sup_codigo = sup.pes_codigo inner join pessoas as p on f.pes_codigo = p.pes_codigo

----36.	 Consultar o valor de cada item vendido.
select distinct itp_valor from itens_pedidos

----37.	Consultar o total vendido (faturado) até o momento.
select sum(itp_valor * itp_qtd) from itens_pedidos;

----38.	Consultar o total da folha de pagamento dos supervisores.


----39.	Consultar o valor total do pedido 1.  
select sum(itp_valor * itp_qtd) from itens_pedidos inner join pedidos on itens_pedidos.ped_numero = pedidos.ped_numero where pedidos.ped_numero=1;

----40.	Consultar o total vendido do Produto 4
select prd_descricao, sum(itp_qtd * itp_valor) from itens_pedidos inner join produtos on produtos.prd_codigo = itens_pedidos.prd_codigo where produtos.prd_codigo = 4 group by prd_descricao; 