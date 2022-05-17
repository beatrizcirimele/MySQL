#___Create and initialize database
create database db_generation_game_online;
use db_generation_game_online;
#___Create table 1 (classes)
create table tb_classes(
id bigint auto_increment,
classe varchar(255) not null,
skill varchar(1000) not null,
primary key(id)
);
#___Create table 2 (personagens)
create table tb_personagens(
id bigint auto_increment,
nome varchar(100) not null,
origem varchar(100) not null,
ataque int not null,
defesa int not null,
id_classe bigint,
primary key(id),
foreign key(id_classe) references tb_classes(id)
);
#___Insert table 1: inserir 5 registros
insert into tb_classes (classe,skill)
values ("Mage","Magia");
insert into tb_classes (classe,skill)
values ("Warrior","Bravura");
insert into tb_classes (classe,skill)
values ("Archer","Mira");
insert into tb_classes (classe,skill)
values ("Elf","Cura");
insert into tb_classes (classe,skill)
values ("Dwarf","Força");

#__Insert table 2: inserir 8 registros
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Alana Danne","Birmigham",1500,800,2);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Hermione Gregor","Londres",2500,1750,1);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Doctor Strange","Nova York",4200,4000,1);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Wanda Maximoff","Sokovia",4500,4800,2);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Hawkeye","Nova York",1900,1800,3);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Thorin Oakenshield","Lonely Mountain",2500,2800,5);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Legolas","Ithilien",3000,1800,4);
insert into tb_personagens (nome,origem,ataque,defesa,id_classe)
value ("Arwen","Rivendell",5000,4800,4);

#___Select: retorne personagens com ataque > 2000
select * from tb_personagens 
where ataque > 2000;

#___Select: retorne personagens com 1000 < defesa < 2000
select * from tb_personagens 
where defesa > 1000 
and defesa < 2000;

#___Select: retorne personagens com letra "C" no nome
select * from tb_personagens 
where nome like "%C%";

#___Inner Join: Entre table 1 e table 2
select tb_classes.classe,tb_classes.skill,tb_personagens.nome
from tb_classes
inner join tb_personagens on tb_classes.id = tb_personagens.id_classe;

#___Inner join: Apenas personagens de uma classe específica ("Warrior")
select tb_classes.classe,tb_classes.skill,tb_personagens.nome
from tb_classes
inner join tb_personagens on tb_classes.id = tb_personagens.id_classe
where tb_classes.classe = "Warrior";


