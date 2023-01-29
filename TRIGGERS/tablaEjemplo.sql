CREATE DATABASE ejemploTriggers;
create table articulos(
id_articulo int not null auto_increment primary key,
titulo varchar(200) not null,
autor varchar(25) not null, -- podría ser el id de una tabla "usuarios"
fecha_pub datetime not null
);


CREATE TABLE log_articulos(
 id_log_art int not null auto_increment primary key,
 fecha datetime, -- fecha del proceso
 usuario varchar(40), -- usuario implicado
 proceso varchar(10), -- agregado, editado, eliminado
 articulo varchar(200)
 );
