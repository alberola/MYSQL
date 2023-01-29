/*1.- Crear una tabla, llamada 'cochesold' a partir de la tabla 'coches' de la base de datos 'Marcas de Coches', añadiéndole el campo precio.*/
create table cochesold select * from coches where 1=0;
select * from cochesold;
alter table cochesold add precio decimal(10,2);