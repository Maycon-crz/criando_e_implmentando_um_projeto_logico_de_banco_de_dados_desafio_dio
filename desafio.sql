-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address)
	values('Maria', 'M', 'Silva', '123456789', 'rua silva de prata 29, Carangola Cidade das Flores'),
		('Matheus', 'O', 'Pimentol', '987654321', 'rua alameda 289, Centro - Cidade das Flores'),
		('Ricardo', 'F', 'Silva', '45678913', 'rua alameda viana 1009, Centro - Cidade das Flores'),
		('Julia', 'S', 'França', '789123456', 'rua laranjeiras 861, Centro - Cidade das Flores'),
		('Roberta', 'G', 'Assis', '98745631', 'avenida koller 19, Centro - Cidade das Flores'),
		('Isabela', 'M', 'Cruz', '654789123', 'rua alameda das flores 28, Centro - Cidade das Flores');



-- idProduct, Pname, classification_kids boolean, category('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
('Fone de ouvido', false, 'Eletrônico', '4', null),
('Barbie Elsa', true, 'Brinquedos', '3', null),
('Body Carters', true, 'Vestimenta', '5', null),
('Microfone Vedo - Youtuber', false, 'Eletronico', '4', null),
('Sofá retratil', false, 'Móveis', '3', '3x57x80'),
('Farinha de arroz', false, 'Alimentos', '2', null),
('Fire Stick Amazon', false, 'Eletrônico', '3', null);

INSERT INTO product (idProduct, Pname, classification_kids, category, avaliação, size) VALUES
(1, 'Fone de ouvido', false, 'Eletrônico', '4', null),
(2, 'Barbie Elsa', true, 'Brinquedos', '3', null),
(3, 'Body Carters', true, 'Vestimenta', '5', null),
(4, 'Microfone Vedo - Youtuber', false, 'Eletronico', '4', null),
(5, 'Sofá retratil', false, 'Móveis', '3', '3x57x80'),
(6, 'Farinha de arroz', false, 'Alimentos', '2', null),
(7, 'Fire Stick Amazon', false, 'Eletrônico', '3', null);

select * from clients;
select * from  product;

-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
-- delete from orders where idOrderClient in (1, 2, 3, 4);
insert into orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
(1, default, 'compra via aplicativo', null, 1),
(2, default, 'compra via aplicativo', 50, 0),
(3, 'Confirmado', null, null, 1),
(4, default, 'compra via web site', 150, 0);

-- idPOproduct, idPOorder, poQuantity, poStatus
-- select * from product;
-- select * from orders;
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
(8, 5, 2, null),
(9, 5, 1, null),
(10, 6, 1, null);

-- storageLocation, quantity
insert into productStorage (storageLocation, quantity) values
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('Brasilia', 60),
('Goiania', 1000);

-- idLproduct, idLstorage, location
select * from product;
select * from productstorage;
insert into storageLocation (idLproduct, idLstorage, location) values
(8, 2, 'RJ'),
(9, 6, 'GO');

-- idPsSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
('Almeida e filhos', '123456789123456', '21985474'),
('Eletrônicos Silva', '854519649143457', '21985484'),
('Eletrônicos Valma', '934567893934695', '219975474');

-- idPsSupplier, idPsProduct, quantity
select * from product;
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
(1, 8, 500),
(1, 9, 400),
(2, 10, 633),
(3, 11, 5),
(2, 12, 10);

-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
(1, 8, 60),
(2, 9, 10);

INSERT INTO productSeller (idPseller, idPproduct, prodQuantity) VALUES
(1, 1, 10),
(1, 1, 20),
(2, 2, 30),
(2, 2, 40);

select * from productSeller;


-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)
);
alter table clients auto_increment=1;
-- desc clients;

-- criar tabela produto
-- size equivale a dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);
desc product;

ALTER TABLE product MODIFY Pname VARCHAR(30);

/*
-- para ser continuado no desafio: termine de implementar a tabela e crie a conexão com as tabelas necessárias
-- além disso, reflita essa modificação no diagrama de esquema relacional
-- criar constraints relacionadas ao pagamento
create table payments(
   idclient int,
   idPayment int,
   typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
   limitAvailable float,
   primary key(idClient, id_payment)
);
*/

-- criar tabela pedido
-- drop table orders;
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
	orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255),
	sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
		on update cascade
);
-- desc orders;

-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
	quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
	CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);
-- desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
	CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
-- desc productSeller;

create table productOrder(
   idPOproduct int,
   idPOorder int,
   poQuantity int default 1,
   poStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
   primary key (idPOproduct, idPOorder),
   constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
   constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);
desc productOrder;
ALTER TABLE productOrder MODIFY COLUMN poQuantity INT NOT NULL;


create table storageLocation(
   idLproduct int,
   idLstorage int,
   location varchar(255) not null,
   primary key (idLproduct, idLstorage),
   constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
   constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
-- desc productSupplier;

show tables;
-- *************************************************************************
-- *******************************Desafio***********************************
-- *************************************************************************
-- Recuperações simples com SELECT Statement
SELECT * FROM clients;
SELECT * FROM orders;
SELECT * FROM productStorage;
SELECT * FROM supplier;
SELECT * FROM seller;
SELECT * FROM productSeller;
-- Filtros com WHERE Statement
SELECT * FROM clients WHERE Fname LIKE '%Maria%';
SELECT * FROM orders WHERE orderStatus = 'Confirmado';
SELECT * FROM productStorage WHERE quantity < 11;
SELECT * FROM supplier WHERE CNPJ = '123456789123456';
SELECT * FROM seller WHERE SocialName LIKE '%Kids%';
SELECT * FROM productSeller WHERE idPseller = 1;
-- Crie expressões para gerar atributos derivados
-- clients
SELECT concat(Fname, ' ', Lname) as Nome_cliente FROM clients;
-- #orders
SELECT COUNT(*) as qtd_pedidos_em_processamento FROM orders WHERE orderStatus = 'Em processamento';
-- Defina ordenações dos dados com ORDER BY
SELECT * FROM clients ORDER BY idClient DESC;
-- Condições de filtros aos grupos – HAVING Statement
SELECT
  productSeller.idPseller, 
  productSeller.idPproduct  
FROM productSeller
GROUP BY productSeller.idPseller, productSeller.idPproduct
HAVING COUNT(*) > 1;
-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT 
  clients.Fname,
  clients.Lname,
  clients.Address,
  orders.idOrder,
  orders.orderDescription
FROM clients
JOIN orders ON clients.idClient = orders.idOrderClient;