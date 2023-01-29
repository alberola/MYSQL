/*13.- Obtener el número total de nombre de marcas de coches que son de MADRID.*/
select count(nombre) from marcas where ciudad like 'Madrid';
/*14.- Obtener la media de la cantidad de coches que tienen todos los concesionarios.*/
select avg(cantidad) from distribucion;
/*15.- Obtener el dni con numeración más alta de todos los clientes de 'MADRID'.*/
select max(dni) from clientes where ciudad like 'Madrid';
/*16.- Obtener el dni con numeración mas baja de todos los clientes que han comprado un coche 'BLANCO'.*/
select min(dni) from ventas where color like 'Blanco';
/*17.- Obtener la media de los automóviles que cada concesionario tiene actualmente en stock.*/
select cifc,avg(cantidad) from distribucion group by cifc; 
/*18.- ¿Cuántos coches ha vendido cada concesionario?.*/
select cifc,count(codcoche) from ventas group by cifc;
/*19.- ¿Cuántos coches de color blanco ha vendido cada concesionario?.*/
select cifc,count(codcoche) from ventas where color like 'Blanco' group by cifc;
/*20.- ¿Qué coche es el que más tiene en distribución los concesionarios 1 o 5 en este momento?.*/
select cifc,codcoche,max(cantidad) from distribucion where cifc= 5 || cifc= 1 group by cifc;

/*Marca del coche cuyo nombre sea seat ibiza*/
select nombre from marcas where cifm in (select distinct cifm from coches where nombre like 'Ibiza');

/*Nombre de los clientes que hayan comprado un coche blanco*/
select nombre,ciudad from clientes where dni in (select dni from ventas where color like 'Blanco' or color like 'rojo');

/*21. Obtener el dni de los clientes que han comprado algún coche a un concesionario de ´MADRID'*/
select distinct dni from ventas where cifc in (select cifc from concesionario where ciudad like 'Madrid');

/* 22. Obtener los codcoche suministrados por algun concesionario de 'Barcelona' */
select codcoche from distribucion where cifc in (select cifc from concesionario where ciudad like 'Barcelona');

/* 23. Obtener el color de los coches vendidos por el concesionario 'ACAR' */
select color from ventas where cifc in (select cifc from concesionario where nombre like 'ACAR');

/* 24. Obtener el codcoche de aquellos coches vendidos a clientes de 'MADRID' */
select codcoche from ventas where dni in (select dni from clientes where ciudad like 'Madrid');

/* 25. Obtener el codcoche de los coches vendidos por algun concesionario de 'Madrid' */
select codcoche from ventas where cifc in (select cifc from concesionario where ciudad like 'Madrid');

/* 26. Obtener el nombre y apellido de los clientes cuyo dni es menor que el del cliente 'Juan Martin' */
select nombre,apellidos from clientes where dni < (select dni from clientes where nombre like 'Juan' and apellidos like 'Martin');

/* 27. Obtener el nombre y apellidos de los clientes cuyo dni es menor que el de los clientes que son de 'Barcelona'*/
select nombre,apellidos from clientes where dni < all (select dni from clientes where ciudad like 'Barcelona');

/* 28. Obtener el nombre y el apellidos de los clientes cuyo nombre empieza por 'A' y cuyo dni es mayor que el de los clientes que son de 'Madrid'*/
select nombre, apellidos from clientes where nombre like 'A%' and dni > all (select dni from clientes where ciudad like 'Madrid'); 

/*29.- Obtener el nombre y el apellido de los clientes cuyo nombre empieza por 'A' y cuyo dni es mayor que el de ¡ALGUNO! de los clientes que son de 'MADRID'.*/
select nombre,apellidos from clientes where nombre like 'A%' and dni > any (select dni from clientes where ciudad like 'Madrid');

/*30.- Obtener el nombre y el apellido de los clientes cuyo nombre empieza por 'A' y cuyo dni es mayor que el de ¡ALGUNO! de los clientes que son de 'MADRID' o menor que el de todos los de 'VALENCIA'.*/
select nombre,apellidos from clientes where nombre like 'A%'and dni > any (select dni from clientes where ciudad like 'Madrid') or dni < all (select dni from clientes where ciudad like 'Valencia');

/*31.- Obtener el nombre y el apellido de los clientes que han comprado como mínimo un coche 'BLANCO' y un coche 'ROJO'.*/
select nombre,apellidos from clientes where dni in (select dni from ventas where color like 'Blanco') and dni in(select dni from ventas where color like 'Rojo');

/*32. Obtener el dni de los clientes cuya ciudad sea la ultima de la lista alfabética de las ciudades donde hay concesionarios. */
select dni from clientes where ciudad in (select max(ciudad) from concesionario); 

/* 33.- Obtener el nombre y el modelo de los coches vendidos por algún concesionario de 'BARCELONA'. */
select nombre,modelo from coches where codcoche in(select codcoche from ventas where cifc like (select cifc from concesionario where ciudad like 'Barcelona'));

/*34.- Obtener todos los nombres y apellidos de los clientes que hayan adquirido algún coche del concesionario 'DCAR'.*/
select nombre,apellidos from clientes where dni in (select dni from ventas where cifc like (select cifc from concesionario where nombre like 'DCAR'));

/*35.- Obtener el NOMBRE y el APELLIDO de los clientes que han adquirido un coche modelo 'GTI' de color 'BLANCO'.*/
select nombre,apellidos from clientes where dni in (select dni from ventas where color = 'Blanco' and codcoche in (select codcoche from coches where modelo = 'GTI'));

/*36.- Obtener el codcoche de los coches que han sido adquiridos por un cliente de 'MADRID' a un concesionario de 'MADRID'.*/
select codcoche from ventas where dni in (select dni from clientes where clientes.ciudad like 'Madrid' and cifc in (select distinct cifc from concesionario where concesionario.ciudad like 'Madrid'));

/*37.- Obtener el dni, nombre, apellido y ciudad de los clientes que han adquirido un automóvil a un concesionario que posea actualmente coches en stock del modelo 'GTI'.*/
select dni,nombre, apellidos, ciudad from clientes where dni in (select dni from ventas where cifc in (select cifc from distribucion where cantidad > 0  and codcoche in (select codcoche from coches where modelo like 'gti')));

/*38.- Obtener el nombre, apellido y ciudad de los clientes que han adquirido un automóvil a un concesionario de 'MADRID' que posea actualmente coches en stock del modelo 'GTI'.*/
select nombre,apellidos, ciudad from clientes where dni in (select dni from ventas where cifc in (select cifc from concesionario where ciudad like 'Madrid' and  cifc in (select cifc from distribucion where cantidad > 0 and codcoche in (select codcoche from coches where modelo like 'Gti'))));

/*39.- Obtener el cifc y nombre del concesionario que no sea de 'MADRID' cuya media de vehículos en stock sea la mas alta de todas las medias.*/
select cifc, nombre from concesionario where ciudad <> 'Madrid' and cifc in (select cifc from distribucion group by cifc having avg (cantidad) >= all(select avg(cantidad)from distribucion group by cifc));

/*40.- Obtener los nombres de los clientes que no han comprado ningún coche 'ROJO' a ningún concesionario de 'MADRID'.*/
select nombre from clientes where dni not in (select dni from ventas where color = 'rojo' and cifc in (select cifc from concesionario where ciudad = 'Madrid'));