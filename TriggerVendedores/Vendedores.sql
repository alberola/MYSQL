create database vendedores;
use vendedores;

create table ventas(
  id int auto_increment,
  articulo varchar(50),
  valor decimal(9, 2),
  vendedor varchar(30),
  comision decimal(7, 2), 
  primary key (id)
 );