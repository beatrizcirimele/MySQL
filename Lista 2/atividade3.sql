#___Create and use database
create database db_farmacia_do_recifense;
use db_farmacia_do_recifense;

#___Create table 1 (categorias): 2 atributos
create table tb_categorias(
id_categorias bigint auto_increment,
categoria varchar(255) not null,
setor varchar(100) not null,
primary key(id_categorias)
);

#___Create table 2 (produtos): 4 atributos
create table tb_produtos(
id_produtos bigint auto_increment,
marca varchar(255) not null,
descricao varchar(255) not null,
valor double not null,
desconto varchar(50),
fk_categoria bigint,
primary key(id_produtos),
foreign key(fk_categoria) references tb_categorias(id_categorias)
);

#___Insert: inserir 5 registros na table 1 (categorias)
insert into tb_categorias (categoria,setor) values ("Medicamento","Gripes e Resfriados");
insert into tb_categorias (categoria,setor) values ("Medicamento","Dores de cabeça");
insert into tb_categorias (categoria,setor) values ("Higiene & Autocuidado","Higiene pessoal");
insert into tb_categorias (categoria,setor) values ("Suplementos","Vitaminas");
insert into tb_categorias (categoria,setor) values ("Saúde e Cuidado","Primeiros socorros");

#___Insert: inserir 8 registros na table 2 (produtos)
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Multigripe","Cartela com 12 unidades",5.99,"Sem desconto laboratorial",1);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Cimegripe","Cartela com 12 unidades",4.89,"Sem desconto laboratorial",1);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Dipirona","Frasco com 5ML",89.99,"Com desconto laboratorial",2);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Paracetamol","Frasco com 2,5ML",139.99,"Com desconto laboratorial",2);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Travoprosta","Frasco com 2,5ML",119.99,"Sem desconto laboratorial",2);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Curaprox","Escova dental",39.99,"Sem desconto laboratorial",3);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Redoxon","30UND pastilhas efervecentes de Vitamina C",49.99,"Sem desconto laboratorial",4);
insert into tb_produtos (marca,descricao,valor,desconto,fk_categoria) 
values ("Granado","Sabonete Líquido 400ML",34.99,"Sem desconto laboratorial",5);


#___Select: retorne produtos com valor maior que R$50,00
select * from tb_produtos 
where valor > 50;

#___Select: retorne produtos com valor entre R$5,00 e R$60,00
select * from tb_produtos
where valor > 5
and valor < 60;

#___Select: retorne produtos com letra C no atributo marca
select * from tb_produtos
where marca like "%C%";

#___Inner join: unir table 1 e table 2
select tb_categorias.categoria,tb_categorias.setor,tb_produtos.marca,tb_produtos.descricao,tb_produtos.valor
from tb_categorias
inner join tb_produtos on tb_categorias.id_categorias = tb_produtos.fk_categoria;

#___Inner join: unir table 1 e table 2 filtrando pela categoria "Medicamentos"
select tb_categorias.categoria,tb_produtos.marca,tb_produtos.valor
from tb_categorias
inner join tb_produtos on tb_categorias.id_categorias = tb_produtos.fk_categoria
where fk_categoria = 1 or fk_categoria = 2;

#___Visualize tables 1 and 2
select * from tb_categorias;
select * from tb_produtos;