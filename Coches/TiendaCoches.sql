create database Tienda_Coches;

use Tienda_Coches;

create table marcas(
cifm int(11),
nombre varchar(15),
ciudad varchar(20),
primary key (cifm)
);

create table coches(
codcoche int(11),
nombre varchar(15),
modelo varchar(15),
cifm int(11),
primary key (codcoche),
FOREIGN KEY(cifm) references MARCAS(cifm)
);

create table concesionario(
cifc int(11),
nombre varchar(15),
ciudad varchar(20),
primary key (cifc)
);

create table clientes(
dni varchar(9),
nombre varchar(15),
apellidos varchar(30),
ciudad varchar(20),
primary key (dni)
);

create table distribucion(
cifc int(11),
cantidad int(11),
codcoche int(11),
PRIMARY KEY (cifc, codcoche),
FOREIGN KEY(cifc) references CONCESIONARIO(cifc),
FOREIGN KEY(codcoche) references COCHES(codcoche)
);

create table ventas(
codcoche int(11),
cifc int(11),
dni varchar(9),
color varchar(9),
PRIMARY KEY (cifc, codcoche),
FOREIGN KEY(cifc) references CONCESIONARIO(cifc),
FOREIGN KEY(dni) references CLIENTES(dni),
FOREIGN KEY(codcoche) references COCHES(codcoche)
);