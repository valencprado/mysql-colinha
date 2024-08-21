--1.      Selecionar todos os nomes de pessoas envolvidas (estagiário, cliente e Funcionário) na compra do produto 3


--2.      Selecionar nome e valor bolsa dos estagiários
select p.pes_nome,  e.est_bolsa from estagiarios e inner join pessoas p on p.pes_codigo = e.pes_codigo; 

--3.      Selecionar nome e renda de todos os clientes

select p.pes_nome, c.cli_renda  from clientes c inner join pessoas p on p.pes_codigo = c.pes_codigo; 

--4.      Selecionar salário e nome de todos os funcionários

select p.pes_nome, f.fun_salario  from funcionarios f inner join pessoas p on p.pes_codigo = f.pes_codigo; 

--5.      Selecione todos os produtos (código, descrição, quantidade) do pedido 1

select p.prd_codigo, p.prd_descricao, itp.itp_qtd from produtos p inner join itens_pedidos itp on p.prd_codigo = itp.prd_codigo where itp.ped_numero = 1;

--6.      Selecione o nome dos clientes que compraram o produto 1

select p.pes_nome from pessoas p inner join pedidos pe on p.pes_codigo = pe.cli_codigo inner join itens_pedidos itp on pe.ped_numero = itp.ped_numero where itp.prd_codigo = 1;

--7.      Construa uma consulta que mostre o código do pedido, a data da compra, o nome do cliente, o nome do funcionário, dos pedidos que foram vendidos mais de 5 itens.

select pe.ped_numero, pe.ped_data, c.pes_nome [Cliente], f.pes_nome [Funcionario], count(itens_pedidos.ped_numero) from pessoas c 
inner join pedidos pe on c.pes_codigo = pe.cli_codigo 
inner join itens_pedidos itp on pe.ped_numero = itp.ped_numero 
inner join pessoas f on f.pes_codigo = pe.fun_codigo
right join itens_pedidos on itp.ped_numero = pe.ped_numero group by pe.ped_numero, pe.ped_data, c.pes_nome, f.pes_nome having count(itens_pedidos.ped_numero) > 5;

--8.      Construa uma consulta que mostre o cliente que mais efetuou pedidos

select top 1 pes_nome, count(ped_numero) [Qtd_pedidos] from pessoas inner join pedidos on pedidos.cli_codigo = pessoas.pes_codigo group by pessoas.pes_nome order by count(ped_numero) desc;

--9.      Construa uma consulta para exibir o código, o valor, a data (pedido) e o nome do estagiário do pedido com o menor valor efetuado pelo estagiário 3

select top 1 pe.ped_numero, pe.ped_valor, pe.ped_data, p.pes_nome [Estagi], sum(itens_pedidos.itp_valor * itens_pedidos.itp_qtd) [Valor] from pedidos pe inner join pessoas p on pe.est_codigo = p.pes_codigo inner join itens_pedidos on itens_pedidos.ped_numero = pe.ped_numero group by pe.ped_numero, pe.ped_valor, pe.ped_data, p.pes_nome order by Valor desc;