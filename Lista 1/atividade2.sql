#____creating database
create database db_ecommerce;
use db_ecommerce;
#____DDL (5 attributes)
create table tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
tamanho varchar(10) not null,
cor char(100) not null,
valor double not null,
estoque int not null,
primary key (id)
);
#____DML (8 data)
insert into tb_produtos (nome,tamanho,cor,valor,estoque)
values ("Camisa - Zara ","M","Preta",200,1500),
("Camisa - H&M","P","Rosa",250,1000),
("Camisa - Cattan","G","Azul",80,200),
("Camisa - Renner","M","Vermelha",300,1200),
("Camisa - Riachuelo","G","Verde",250,800),
("Camisa - Marisa","P","Bege",250,600),
("Camisa - Abercrombie","GG","Branca",280,1150),
("Camisa - Hollister","P","Azul",220,900);
#____SELECT: valor produto > 230
select * from tb_produtos where valor > 230;
#____SELECT: valor produto < 230
select * from tb_produtos where valor < 230;
#____Updating
update tb_produtos set estoque = 800 where id = 2;
#____Visualizing
select * from tb_produtos;