#___Create and use database
create database db_pizzaria_legal;
use db_pizzaria_legal;

#___Create table 1 (categorias) com 2 atributos
create table tb_categorias(
id_categorias bigint auto_increment,
tipo varchar(100) not null,
tamanho varchar(50) not null,
primary key (id_categorias)
);

#___Create table 2 (pizzas) com 5 atributos
create table tb_pizzas(
id_pizzas bigint auto_increment,
nome varchar(255) not null,
massa varchar(100) not null,
borda varchar(100),
valor double not null,
fk_categorias bigint,
primary key(id_pizzas)
);

#___Insert: inserir 5 registros na table 1 (categorias)
insert into tb_categorias (tipo,tamanho) values ("Fit","Média");
insert into tb_categorias (tipo,tamanho) values ("Fit","Grande");
insert into tb_categorias (tipo,tamanho) values ("Regular","Média");
insert into tb_categorias (tipo,tamanho) values ("Regular","Grande");
insert into tb_categorias (tipo,tamanho) values ("Veggie","Média");
insert into tb_categorias (tipo,tamanho) values ("Veggie","Grande");

#___Insert: inserir 8 registros na table 2 (pizzas)
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Frango com Parma","Fina","Sem recheio",54.99,1);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Prosciutto de Parma com Provolone","Extra Fina","Parmesão",64.99,2);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Carbonara","Tradicional","Cheddar",49.99,3);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Calabresa","Tradicional","Catupiry",59.99,3);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Alho poró com Linguiça toscana","Tradicional","Parmesão",89.99,4);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Marguerita","Fina","Sem recheio",49.99,5);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Muçarela de Búfula com Shitake","Tradicional","Parmesão",79.99,5);
insert into tb_pizzas (nome,massa,borda,valor,fk_categorias) 
values ("Gorgonzola, Alho e Champignon","Fina","Sem recheio",109.99,6);

#___Select: pizzas com valores maiores que R$45,00
select * from tb_pizzas 
where valor > 45;

#___Select: pizzas com valores entre R$50,00 e R$100,00
select * from tb_pizzas 
where valor > 50
and valor < 100;

#___Select: pizzas que possuam letra M no nome do atributo
select * from tb_pizzas
where nome like "%M%";

#___Inner Join: unir table 1 e table 2
select tb_categorias.tipo,tb_categorias.tamanho,tb_pizzas.nome,tb_pizzas.valor
from tb_categorias
inner join tb_pizzas on tb_categorias.id_categorias = tb_pizzas.fk_categorias;

#___Inner join: unir table1 e table2 trazendo apenas uma categoria específica (Ex: Veggie)
select tb_categorias.tipo,tb_pizzas.nome,tb_pizzas.massa,tb_pizzas.valor
from tb_categorias
inner join tb_pizzas on tb_categorias.id_categorias = tb_pizzas.fk_categorias
where fk_categorias = 5 or fk_categorias = 6;

#___Visualize tables 1 and 2
select * from tb_categorias;
select * from tb_pizzas;