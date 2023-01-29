	/*Creamos tabla cochesold*/
create table cochesold as select * from coches where 1 < 0;
alter table cochesold modify codcoche int primary key;
/*
/*Insertar todos los GTI de coches a cochesold*/
start transaction;
