/*Creamos la base de datos tienda virtual*/
create database tienda_virtual;
/*Usamos la BD tienda virtual*/
use tienda_virtual;
/*Creamos la tabla Familia*/
create table familia(
Codfamilia numeric(3),
Denofamilia varchar(50) unique not null,
constraint cod_fam_pk primary key(Codfamilia)

);
/*Creamos la tabla Producto*/
create table producto(
Codproducto numeric(5) primary key,
Denoproducto varchar(20) not null,
Descripcion varchar(100),
PrecioBase float(8,2) check(Preciobase>0) not null,
PorcReposicion numeric(3) check(PorcReposicion>0),
UnidadesMinimas numeric(4) check(UnidadesMinimas>0) not null,
Codfamilia numeric(3) not null,
constraint pro_cod_fk foreign key (Codfamilia) references familia(Codfamilia)
);
/*Creamos la tabla tienda*/
create table tienda(
Codtienda numeric(3) primary key,
Denotienda varchar(20) not null,
Telefono varchar(11),
CodigoPostal varchar(5) not null,
Provincia varchar(5) not null
);
/*Creamos la tabla stock*/
create table stock(
Codtienda numeric(3) not null,
Codproducto numeric(5) not null,
constraint Cod_sto_pk primary key (Codtienda,Codproducto),
foreign key (Codproducto) references producto(Codproducto),
foreign key (Codtienda) references tienda(Codtienda),
Unidades numeric(6) check(Unidades>0) not null
);