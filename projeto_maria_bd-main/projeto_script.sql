create database estoque_alimento;

use estoque_alimento;

create table alimento(
pk int not null auto_increment, primary key (pk),
nome varchar(255) not null,
qtd int not null,
perecivel decimal(65) not null,
vencimento int not null
 );
 
 create table lote(
 pk int not null auto_increment, primary key (pk),
 numeracaolote varchar (255) not null
 );
 
create