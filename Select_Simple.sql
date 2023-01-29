select * from clientes;
select nombre,modelo from coches order by modelo;
select nombre,apellidos,ciudad from clientes where ciudad like 'madrid';
select * from concesionario;
select * from distribucion;
select * from marcas;
select * from ventas;
select nombre from marcas order by nombre;
select cifc from distribucion where cantidad > 18;
select cifc from distribucion where cantidad between  10 and 18;
select cifc from distribucion where cantidad >= 10 and cantidad <= 18;
select cifc from distribucion where cantidad > 10 or cantidad < 5;
select codcoche,nombre from coches where nombre like 'c%';
select codcoche,nombre from coches where nombre not like '%a%';
select distinct cifc from distribucion where cantidad is not null; 
select distinct cifm,nombre from marcas where ciudad like '_I%';
select distinct cifc,codcoche,cantidad,cantidad+5 as 'Nueva cantidad' from distribucion where codcoche = 6;

select sum(cantidad) from distribucion;
select count(modelo) from coches;

select max(cifm),nombre from marcas;
select min(cifm),nombre from marcas;

/*select nombre from marcas where max(cifm);*/

select avg(cantidad) from distribucion;

select cifc, sum(cantidad) from distribucion group by cifc;

select cifc, count(*) from distribucion having cifc=1;
