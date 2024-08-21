create database consultorio_pt302539x;
use consultorio_pt302539x;

-- 1. criar tabelas
create table pessoas (
id int primary key identity not null,
data_nascimento date not null,
genero char not null,
estado_civil char,
rg varchar(9) not null
);

create table pacientes (
id_pessoa int not null,
convenio varchar(30)
foreign key (id_pessoa) references pessoas(id)
);


create table medicos (
id_pessoa int not null,
crm varchar(6) not null
foreign key (id_pessoa) references pessoas(id)
);

create table enderecos(
  id int identity not null,
  id_pessoa int not null,
  logradouro varchar(50) not null,
  numero varchar(5),
  cep varchar(8) not null,
  bairro varchar(30) not null,
  cidade varchar(80) not null,
  estado varchar(20) not null
  foreign key (id_pessoa) REFERENCES pessoas(id)
);

create table telefones (
id_pessoa int not null,
  ddd varchar(3),
  telefone varchar(9)
foreign key (id_pessoa) references pessoas(id_pessoa)
)



create table exames (
id_pessoa int not null,
convenio varchar(30)
foreign key (id_pessoa) references pessoas(id)
);

CREATE TABLE consultas (
 id int identity not NULL,
 data date,
  diagnostico varchar(70),
  id_medico int,
  id_paciente int,
  FOREIGN KEY (id_medico) REFERENCES medicos(id),
  FOREIGN KEY (id_paciente) REFERENCES pacientes(id)
  );

-- 2. inserir pelo menos 5 linhas em cada tabela
insert into pessoas values('1985-11-20', 'F', 'S', '000000000');
insert into pessoas values('1999-02-01', 'F', 'C', '111111111');
insert into pessoas values('2005-03-31', 'F', 'S', '222222222');
insert into pessoas values('1962-09-30', 'F', 'C', '333333333');
insert into pessoas values('1990-09-25', 'F', 'S', '444444444');
insert into pessoas values('1976-01-18', 'M', 'C', '555555555');
insert into pessoas values('2000-12-02', 'M', 'S', '666666666');
insert into pessoas values('1939-08-29', 'M', 'C', '777777777');
insert into pessoas values('1999-07-10', 'M', 'S', '888888888');
insert into pessoas values('2009-06-22', 'M', 'C', '999999999');

insert into enderecos values(1, 'Avenida Mutinga', '540', '00000000', 'Pirituba', 'São Paulo', 'São Paulo');
insert into enderecos values(1, 'Avenida dos Pinhais', '540', '11111111', 'Vila Yara', 'Osasco', 'São Paulo');
insert into enderecos values(1, 'Rua Angelina', '540', '22222222', 'Centro', 'Cidadezinha', 'Mato Grosso do Sul');
insert into enderecos values(1, 'Avenida Paulista', '540', '33333333', 'Consolação', 'São Paulo', 'São Paulo');
insert into enderecos values(1, 'Rua Doze de Outubro', '120', '44444444', 'Lapa', 'São Paulo', 'São Paulo');

insert into telefone values(1, '11', '982828282');
insert into telefone values(2, '11', '901010101');
insert into telefone values(3, '12', '19192121');
insert into telefone values(2, '14', '02020202');
insert into telefone values(9, '14', '95452121');


insert into pacientes values(1, 'NotreDame');
insert into pacientes values(2);
insert into pacientes values(5, 'Alice');
insert into pacientes values(6);
insert into pacientes values(9, 'NotreDame');


insert into pacientes values(3, '123456');
insert into pacientes values(4, '123456');
insert into pacientes values(7, '123456');
insert into pacientes values(8, '123456');
insert into pacientes values(10, '123456');


-- 3. SELECT * FROM cada tabela

select * from pessoas;
select * from pacientes;
select * from medicos;
select * from telefones;
select * from enderecos;
select * from exames;
select * from consultas;

-- 4. atualizar tabela pessoas: add campo nome

alter table add COLUMN nome varchar(70);

-- 5. adicionar um nome para cada pessoa

update pessoas set nome = 'Ana Clarice Ferrolho' where id=1;
update pessoas set nome = 'Marcela dos Anjos' where id=2;
update pessoas set nome = 'Juliana Faria' where id=3;
update pessoas set nome = 'Philomena Silva' where id=4;
update pessoas set nome = 'Ana Luiza Moraes' where id=5;
update pessoas set nome = 'Josué Pinto' where id=6;
update pessoas set nome = 'Carlos Parcero' where id=7;
update pessoas set nome = 'Augusto de Jesus' where id=8;
update pessoas set nome = 'Felipe Marcelino' where id=9;
update pessoas set nome = 'Enzo Bianchi' where id=10;


-- 6. visualizar consultas de um médico (id espécífico)

select * from consultas where id_medico=5;

-- 7. visualizar exames de uma consulta específica (id)

select * from exames where id_paciente=3;

-- 8. visualizar todos os telefones de pessoa específica (id)

select * from telefone where id_pessoa=2;

-- desafio 1: visualizar todos os dados dos pacientes (pessoa + paciente)
SELECT * from pacientes 
right join pessoas on pacientes.id_pessoa = pessoas.id

-- desafio 2: visualizar todos os dados dos médicos (médico + paciente)
SELECT * from medicos 
right join pessoas on medicos.id_pessoa = pessoas.id