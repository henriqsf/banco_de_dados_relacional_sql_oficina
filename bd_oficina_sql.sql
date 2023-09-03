-- CRIAÇÃO DO BANCO DE DADOS: 

create database oficina;
use oficina;


-- CRIAÇÃO DAS TABELAS:

create table clientes (
	id int unsigned not null auto_increment primary key,
	nome varchar (45) not null,
	telefone varchar (15) not null,
	endereco varchar (200)
);

create table veiculos (
	id int unsigned not null auto_increment primary key,
	id_cliente int unsigned not null, 
	tipo enum ("carro", "moto"), 
	placa varchar(8) not null,
	marca varchar(10) not null,
	modelo varchar(20) not null,
	ano int not null,
	cor varchar (10),
	constraint fk_id_cliente foreign key (id_cliente) references clientes(id)
);

create table mecanicos (
	id int unsigned not null auto_increment primary key,
	nome varchar (45) not null,
	telefone varchar (15) not null
);

create table historico_servico (
	id int unsigned not null auto_increment primary key,
	id_mecanico int unsigned not null, 
	id_veiculo int unsigned not null, 
	_data date,
	hora time,
	valor decimal (10,2),
	constraint fk_id_mecanico foreign key (id_mecanico) references mecanicos(id),
	constraint fk_id_veiculo foreign key (id_veiculo) references veiculos(id)
);

create table estoque (
	id int unsigned not null auto_increment primary key,
	item varchar(25),
	descricao varchar (100),
	quantidade int not null
);

create table servico_item (
	id_historico_servico int unsigned not null, 
	id_item int unsigned not null, 
	constraint fk_id_historico_servico foreign key (id_historico_servico) references historico_servico(id),
	constraint fk_id_item foreign key (id_item) references estoque(id)
);


-- INSERINDO DADOS DE EXEMPLOS NAS TABELAS

insert into clientes (nome, telefone, endereco)
values
    ('João Silva', '(123) 456-7890', 'Rua A, 123'),
    ('Maria Santos', '(987) 654-3210', 'Avenida B, 456'),
    ('Carlos Oliveira', '(555) 123-7890', 'Rua C, 789'),
    ('Ana Pereira', '(222) 555-9999', 'Avenida D, 654'),
    ('Pedro Almeida', '(777) 888-1234', 'Rua E, 789');

insert into veiculos (id_cliente, tipo, placa, marca, modelo, ano, cor)
values
    (1, 'carro', 'ABC1234', 'Toyota', 'Corolla', 2019, 'Prata'),
    (1, 'moto', 'XYZ5678', 'Honda', 'CBR 600', 2020, 'Vermelho'),
    (2, 'carro', 'DEF4321', 'Ford', 'Fusion', 2018, 'Preto'),
    (3, 'carro', 'GHI5678', 'Volkswagen', 'Golf', 2017, 'Branco'),
    (4, 'moto', 'JKL9876', 'Suzuki', 'GSX-R 750', 2021, 'Azul');

insert into mecanicos (nome, telefone)
values
    ('José Ferreira', '(33) 111-2222'),
    ('Maria Rodrigues', '(44) 222-3333'),
    ('Antônio Silva', '(55) 333-4444'),
    ('Sandra Santos', '(66) 444-5555'),
    ('Fernando Pereira', '(77) 555-6666');

insert into historico_servico (id_mecanico, id_veiculo, _data, hora, valor)
values
    (1, 1, '2023-09-01', '10:30:00', 350.00),
    (2, 3, '2023-09-02', '14:15:00', 250.00),
    (3, 2, '2023-09-03', '09:45:00', 180.00),
    (4, 4, '2023-09-04', '16:00:00', 420.00),
    (5, 5, '2023-09-05', '11:00:00', 300.00);

insert into estoque (item, descricao, quantidade)
values
    ('Óleo de Motor', 'Óleo sintético 5W-30', 50),
    ('Filtro de Ar', 'Filtro de ar de reposição', 100),
    ('Pastilhas de Freio', 'Pastilhas de freio cerâmicas', 75),
    ('Lâmpada de Farol', 'Lâmpada de farol H4', 200),
    ('Bateria de Carro', 'Bateria de carro de 12V', 30);

insert into servico_item (id_historico_servico, id_item)
values
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1);