insert into marcas values (7, 'Toyota', 'Tokio');

insert into marcas (cifm,nombre) values (8, 'Mercedes');

select * from marcas;

select * from coches;

insert into coches values (21, 'Exeo', 'GTI', 1);

insert into coches values (22, 'XC90', 'Executive',(select cifm from marcas where nombre like 'Volvo'));
select * from coches;

set @var=(select max(codcoche)+1 from coches);
insert into coches values (@var, 'C300', 'GTD', (select cifm from marcas where nombre like 'Volvo'));
select @var;
select * from coches;

/* UPDATES */
update coches set modelo = 'GTI' where codcoche = 23; /*Precaucion con la condicion where porque podemos modificar muchos campos (mas de los que queremos).*/
update coches set modelo='GTD', nombre='C250' where codcoche=23;
select * from coches;
/* DELETES --------CUIDADO CON LOS DELETES-------------*/
delete from coches where codcoche = 23;
select * from coches;
insert into coches values (23, 'S300', 'GTD', (select cifm from marcas where nombre like 'Mercedes'));
