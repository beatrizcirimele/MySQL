es (67 sloc)  2.47 KB
   
#___Create and use database
create database db_club_dos_organicos;
use db_club_dos_organicos;

#___Create table 1 (categoria)
create table tb_categoria(
id_cat bigint auto_increment,
categoria varchar(255) not null,
setor varchar(255) not null,
primary key(id_cat)
);

#___Create table 2 (produto)
create table tb_produto(
id_prod bigint auto_increment,
nome varchar(255) not null,
valor double not null,
validade date not null,
fk_cat bigint,
primary key(id_prod),
foreign key(fk_cat) references tb_categoria(id_cat)
);

#___Insert: inserir 5 registros na table 1 (categorias)
insert into tb_categoria (categoria,setor) 
values ("HortiFruti","Folhagem");
insert into tb_categoria (categoria,setor) 
values ("HortiFruti","Frutas");
insert into tb_categoria (categoria,setor) 
values ("HortiFruti","Legumes");
insert into tb_categoria (categoria,setor) 
values ("HortiFruti","Raízes");
insert into tb_categoria (categoria,setor) 
values ("Veganos","Sem lactose");

#___Insert: inserir 8 registros na table 2 (produto)
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Hortelã",2.98,20220427,1);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Alface",1.38,20220430,1);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Banana",4.59,20220505,2);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Maracujá",6.98,20220502,2);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Tomate",6.88,20220510,3);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Batata Doce",4.28,20220513,4);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Manteiga Ghi",32.59,20220520,5);
insert into tb_produto (nome,valor,validade,fk_cat)
values ("Leite de Soja",23.92,20220615,5);

#___Select: retorne produtos com valor maior que R$20,00
select * from tb_produto 
where valor > 20;

#___Select: retorne produtos com valor entre R$2,00 e R$12,00
select * from tb_produto 
where valor > 2
and valor < 12;

#___Select: retorne produtos com letra C no atributo nome
select * from tb_produto
where nome like "%C%";

#___Inner Join: unir table 1 e table 2
select tb_categoria.categoria,tb_categoria.setor,tb_produto.nome,tb_produto.valor
from tb_categoria
inner join tb_produto on tb_categoria.id_cat = tb_produto.fk_cat;

#__Inner join: unir table 1 e table 2 filtrando pelo setor "Veganos"
select tb_categoria.categoria,tb_categoria.setor,tb_produto.nome,tb_produto.valor
from tb_categoria
inner join tb_produto on tb_categoria.id_cat = tb_produto.fk_cat
where fk_cat = 5;