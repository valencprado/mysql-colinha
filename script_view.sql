-- criação da view
create view vw_pedidos as
select p.ped_numero as PedidoNumero, 
p.ped_data as PedidoData,
pf.pes_nome as FuncionarioNome,
pc.pes_nome as ClienteNome,
pe.pes_nome EstagiarioNome
from pedidos p, 
pessoas pf inner join funcionarios f on pf.pes_codigo = f.pes_codigo, 
pessoas pe inner join  estagiarios e on pe.pes_codigo = e.pes_codigo, 
pessoas pc inner join clientes c on pc.pes_codigo = c.pes_codigo
where p.cli_codigo = c.pes_codigo and p.fun_codigo = f.pes_codigo and p.est_codigo = e.pes_codigo 

-- select da view
select * from vw_pedidos

-- selects com id de produto (ids conforme minha base)
select * from vw_pedidos where vw_pedidos.PedidoNumero = 30
select * from vw_pedidos where vw_pedidos.PedidoNumero = 32
select * from vw_pedidos where vw_pedidos.PedidoNumero = 34