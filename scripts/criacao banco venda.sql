-- Criando o banco de dados ----------------
create database vendas
go
use vendas
go
 
-- Create Tables ----------------------------

-- Tabela Pessoas ------------------------

create table pessoas
(
    pes_codigo int not null identity,
    pes_nome   varchar(50)  not null,
    pes_cpf    varchar(12)  not null unique,
    pes_status int 
             check(pes_status in (1,2,3,4)),
    primary key(pes_codigo)	
)

-- Tabela Clientes -----------------------

create table clientes 
( 
    pes_codigo  int not null primary key,
    cli_renda   decimal(7,2),
    cli_credito decimal(7,2),
    foreign key(pes_codigo) 
            references pessoas(pes_codigo)
)


-- Tabela Estagiarios --------------------

create table estagiarios
(
    pes_codigo int not null primary key,
    est_bolsa  decimal(7,2) 
               check (est_bolsa >= 0),
    foreign key(pes_codigo) 
            references pessoas(pes_codigo)
)


 
-- Tabela Funcionarios--------------------

create table funcionarios
(
   pes_codigo  int not null primary key,
   fun_salario decimal(7,2) 
               check(fun_salario > 0),
   sup_codigo int,
   foreign key(pes_codigo) 
           references pessoas(pes_codigo),
   foreign key(sup_codigo) 
           references funcionarios(pes_codigo)
)

-- Tabela Produtos -----------------------

create table produtos
(
   prd_codigo   int not null identity,
   prd_descricao varchar(50) not null,
   prd_qtd      int, 
   prd_valor    decimal(7,2),
   prd_status   int 
               check(prd_status in (1,2,3,4)),
   primary key(prd_codigo)
)

-- Tabela Pedidos ------------------------

create table pedidos
(
   ped_numero int not null identity,
   ped_data   datetime,
   ped_valor  decimal(7,2) 
              check(ped_valor > 0),
   ped_status int  
              check(ped_status in (1,2,3,4)),
   fun_codigo int not null,       
   cli_codigo int not null,
   est_codigo int,
   foreign key(fun_codigo) 
          references funcionarios(pes_codigo),
   foreign key(cli_codigo) 
          references clientes(pes_codigo),
   foreign key(est_codigo) 
           references estagiarios(pes_codigo),
   primary key(ped_numero)
)


-- Tabela Intes_Pedidos--------------------

create table itens_pedidos
(
   ped_numero int not null,
   prd_codigo int not null,
   itp_qtd    int not null,
   itp_valor  decimal(7,2) not null,
   primary key(ped_numero, prd_codigo),
   foreign key(ped_numero) 
           references pedidos(ped_numero),
   foreign key(prd_codigo) 
           references produtos(prd_codigo)
)

use vendas

--Inserts
insert into produtos values ('Lápis', 100, 0.8, 1)
insert into produtos values ('Apontador', 100, 2.5, 1)
insert into produtos values ('Caneta',100,1.2,1)     
insert into produtos values ('Caderno',100,4.5,1)
insert into produtos values ('Borracha',100,0.85,1)
select * from produtos

-- Inserts Pessoas
insert into pessoas values ('Batman','3030',1)
insert into pessoas values ('SuperMain','1515',1)
insert into pessoas values ('SpiderMan','3131',1)
insert into pessoas values ('Super Foca','2020',1)
insert into pessoas values ('Buslaboo','007',1)
insert into pessoas values ('BuschaGalack','4343',1)
insert into pessoas values ('Super Prof','3636',1)
insert into pessoas values ('Ensina Legal','3333',1)

select * from pessoas


-- Inserts Clientes
insert into clientes values (1,10000,3000)
insert into clientes values (2,15000,5000)
select * from clientes

-- Inserts Estagiários
insert into estagiarios values (3,725)
insert into estagiarios values (5,500)
select * from estagiarios

-- Inserts funcionarios

insert into funcionarios values (4,2500,null)
insert into funcionarios values (6,1000,4)
insert into funcionarios values (7,2500,null)
insert into funcionarios values (8,1050,7)
select * from funcionarios

-- Insert Pedidos
insert into pedidos values 
('2021-12-01 14:30:15',null,1,6,1,3)
insert into pedidos values
('2021-12-01 14:30:15',null,1,8,2,5)

insert into pedidos values
('2021-12-01 14:30:15',null,1,6,1,5)

insert into pedidos values 
('2021-12-01 14:30:15', null,1,8,1,3)

insert into pedidos values 
('2021-12-01 17:30:15', null,1,6,2,5)

insert into pedidos values 
('2022-12-01 14:30:15', null,1,8,2,3)
select * from pedidos


-- Insert itens_pedidos
insert into itens_pedidos values (30,1,10,0.8)
insert into itens_pedidos values (30,2,10,2.5)
insert into itens_pedidos values (32,3,10,1.2)
insert into itens_pedidos values (33,4,10,4.5)
insert into itens_pedidos values (34,5,10,0.85)

insert into itens_pedidos values (34,1,5,0.8)
insert into itens_pedidos values (35,2,5,2.5)
insert into itens_pedidos values (35,3,5,1.2)
insert into itens_pedidos values (36,4,5,4.5)

insert into itens_pedidos values (36,2,3,2.5)
insert into itens_pedidos values (36,3,3,1.2)
insert into itens_pedidos values (34,4,3,4.5)

insert into itens_pedidos values (36,1,2,1.2)
insert into itens_pedidos values (36,5,2,0.85)

insert into itens_pedidos values (30,5,1,0.85)
select * from itens_pedidos