create database estoque_alimento;

use estoque_alimento;


create table alimento(
pk int not null auto_increment, primary key(pk),
    nome varchar(255) not null
);

create table lote(
pk int not null auto_increment, primary key(pk),
    quantidade INT not null,
    data_vencimento date not null,
    codigo varchar(255) not null,
pedido_fk int not null, foreign key (pedido_fk) references pedido (pk),
    alimento_fk int not null, foreign key (alimento_fk) references alimento (pk)
);

create table detalhe_pedido(
pk int not null auto_increment, primary key(pk),
    quantidade_solicitada int not null,
    valor double not null,
    status_entrega tinyint not null
);

create table pedido(
pk int not null auto_increment, primary key(pk),
    origem varchar(255) not null,
    data_pedido date not null,
    data_entrega date not null,
    detalhe_pedido_fk int not null, foreign key (detalhe_pedido_fk) references detalhe_pedido (pk)
);

select * from alimento;

insert into alimento (nome) values ("leite");
insert into alimento (nome) value ("chá");
insert into alimento (nome) value ("pão");
insert into alimento (nome) value ("manteiga");
insert into alimento (nome) value ("queijo");

select * from detalhe_pedido;

insert into detalhe_pedido (quantidade_solicitada, valor, status_entrega) value (2, 27.50, "1");
insert into detalhe_pedido (quantidade_solicitada, valor, status_entrega) value (10, 30.00, "0");
insert into detalhe_pedido (quantidade_solicitada, valor, status_entrega) value (14, 50.10, "1");
insert into detalhe_pedido (quantidade_solicitada, valor, status_entrega) value (2, 27.50, "0");
insert into detalhe_pedido (quantidade_solicitada, valor, status_entrega) value (5, 60.50, "1");

select * from pedido;

insert into pedido (origem, data_pedido, data_entrega, detalhe_pedido_fk) value ("Brasil", "2024-08-01", "2024-08-06", 1);
insert into pedido (origem, data_pedido, data_entrega, detalhe_pedido_fk) value ("Brasil", "2024-10-01", "2024-10-15", 2);
insert into pedido (origem, data_pedido, data_entrega, detalhe_pedido_fk) value ("itália", "2024-12-11", "2025-01-06", 3);
insert into pedido (origem, data_pedido, data_entrega, detalhe_pedido_fk) value ("itália", "2024-12-11", "2025-01-06", 4);
insert into pedido (origem, data_pedido, data_entrega, detalhe_pedido_fk) value ("itália", "2024-12-11", "2025-01-06", 5);

select * from lote;

insert into lote (quantidade, data_vencimento, codigo, pedido_fk, alimento_fk) value (6, "2024-12-11", "0046304", 1, 1);
insert into lote (quantidade, data_vencimento, codigo, pedido_fk, alimento_fk) value (10, "2024-10-01", "008904", 2, 2);
insert into lote (quantidade, data_vencimento, codigo, pedido_fk, alimento_fk) value (4, "2024-05-11", "786004", 3, 3);
insert into lote (quantidade, data_vencimento, codigo, pedido_fk, alimento_fk) value (30, "2024-06-08", "026005", 4, 4);
insert into lote (quantidade, data_vencimento, codigo, pedido_fk, alimento_fk) value (90, "2024-11-17", "0060154", 5, 5);

update alimento set nome = "bolacha" where pk= 2;
update detalhe_pedido set valor = "29.20" where pk= 2;
update lote set quantidade = "40" where pk= 1;
update pedido set origem = "Canadá" where pk= 2;

delete from lote where pk = "4";
delete from pedido where pk = "2";
delete from alimento where pk= "2";
delete from detalhe_pedido where pk= 4;

drop database estoque_alimentos;
