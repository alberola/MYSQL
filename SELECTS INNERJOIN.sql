/*41.- Hacer ejercicio 22 (Obtener los codcoche suministrados por algún concesionario de 'BARCELONA') con inner join.*/
select codcoche from distribucion inner join concesionario on distribucion.cifc = concesionario.cifc and concesionario.ciudad = 'Barcelona';
/*42.- A partir del ejercicio 22 (Obtener los codcoche suministrados por algún concesionario de 'BARCELONA')AÑADE NOMBRE Y MODELO DEL COCHE.*/
select distribucion.codcoche, coches.nombre,modelo from coches inner join distribucion inner join concesionario on coches.codcoche = distribucion.codcoche and distribucion.cifc = concesionario.cifc and concesionario.ciudad = 'Barcelona';
/* 43.- Hacer el ejercicio 23 (Obtener el color de los coches vendidos por el concesionario 'ACAR') con inner join.*/
select color from ventas inner join concesionario on ventas.cifc = concesionario.cifc and concesionario.nombre = 'Acar';
/* 44.- Hacer el ejercicio 24 (Obtener el codcoche de aquellos coches vendidos a clientes de 'MADRID') usando inner join.*/
select codcoche from ventas inner join clientes on ventas.dni = clientes.dni and clientes.ciudad = 'Madrid';
/*45.- A partir del ejercicio 24 (Obtener el codcoche de aquellos coches vendidos a clientes de 'MADRID') AÑADE EL NOMBRE Y MODELO DEL COCHE .*/
select  ventas.codcoche, coches.nombre, coches.modelo from ventas inner join (clientes,coches) on (ventas.codcoche = coches.codcoche and ventas.dni = clientes.dni) and clientes.ciudad = 'Madrid';
/* 46.- A partir del ejercicio 24 (Obtener el codcoche de aquellos coches vendidos a clientes de 'MADRID') AÑADE LA MARCA, EL NOMBRE Y MODELO DEL COCHE .*/
select ventas.codcoche, marcas.nombre, coches.nombre, coches.modelo from ventas inner join clientes inner join coches inner join marcas on ventas.codcoche = coches.codcoche and ventas.dni = clientes.dni and coches.cifm = marcas.cifm and clientes.ciudad = 'Madrid';
/* 47.- Hacer el ejercicio 31 (Obtener el nombre y el apellido de los clientes que han comprado como mínimo un coche 'BLANCO' y un coche 'ROJO') utilizando inner join.*/
select clientes.nombre, clientes.apellidos from clientes inner join ventas inner join ventas as v on clientes.dni = ventas.dni and ventas.color = 'Blanco'
and clientes.dni = v.dni and v.color = 'Rojo';
/* 48.- Hacer el ejercicio 33 (Obtener el nombre y el modelo de los coches vendidos por algún concesionario de 'BARCELONA') con inner join.*/
select coches.nombre, coches.modelo from coches inner join ventas inner join concesionario  on coches.codcoche = ventas.codcoche and  ventas.cifc = concesionario.cifc and concesionario.ciudad = 'Barcelona';
/* 49.- Hacer el ejericiio 34 (Obtener todos los nombres y apellidos de los clientes que hayan adquirido algún coche del concesionario 'DCAR')usando inner join.*/
select clientes.nombre, clientes.apellidos from clientes inner join ventas inner join concesionario on clientes.dni = ventas.dni and ventas.cifc = concesionario.cifc and concesionario.nombre = 'Dcar';
/*50.- Hacer el ejerccio 35 (Obtener el NOMBRE y el APELLIDO de los clientes que han adquirido un coche modelo 'GTI' de color 'BLANCO') utilizando inner join.*/
select clientes.nombre, clientes.apellidos from clientes inner join ventas inner join coches on clientes.dni = ventas.dni and ventas.color = 'Blanco' and ventas.codcoche
 = coches.codcoche and coches.modelo = 'Gti';
 /*51.- Hacer el ejercicio 36 (Obtener el codcoche de los coches que han sido adquiridos por un cliente de 'MADRID' a un concesionario de 'MADRID') pero añadiendo tanto el nombre y ciudad de los clientes como de los concesionarios.*/
 select ventas.codcoche, clientes.nombre as 'Nombre cliente', clientes.ciudad as 'Ciudad cliente', concesionario.nombre as 'Nombre concesionario', concesionario.ciudad as 'Ciudad concesionario' from ventas inner join clientes inner join concesionario on ventas.dni = 
 clientes.dni and clientes.ciudad = 'Madrid' and ventas.cifc = concesionario.cifc and concesionario.ciudad = 'Madrid';
 /*52.- Repite el ejercicio 37 (Obtener el dni, nombre, apellido y ciudad de los clientes que han adquirido un automóvil a un concesionario que posea actualmente coches en stock del modelo 'GTI') usando inner join.*/
 select clientes.dni, clientes.nombre, clientes.apellidos, clientes.ciudad from clientes inner join ventas inner join distribucion inner join coches on clientes.dni = ventas.dni and ventas.cifc = distribucion.cifc and distribucion.codcoche = coches.codcoche and distribucion.cantidad > 0 and coches.modelo = 'Gti';
 /*53.- Hacer el ejercicio 38 (Obtener el nombre, apellido y ciudad de los clientes que han adquirido un automóvil a un concesionario de 'MADRID' que posea actualmente coches en stock del modelo 'GTI') con inner join.*/
 select clientes.nombre, clientes.apellidos, clientes.ciudad 
 from clientes inner join ventas inner join concesionario inner join distribucion inner join coches 
 on clientes.dni = ventas.dni 
 and ventas.cifc = concesionario.cifc 
 and concesionario.cifc = distribucion.cifc
 and distribucion.codcoche = coches.codcoche 
 and concesionario.ciudad = 'Madrid' 
 and distribucion.cantidad > 0 
 and coches.modelo = 'Gti';
 /*54.- Obtener los codcoche de los coches comprados en un concesionario de la misma ciudad que el cliente que lo compra. Comprobar el nombre de los clientes y los concesionarios son de la misma ciudad.*/
select coches.codcoche from coches inner join ventas on coches.codcoche = ventas.codcoche inner join clientes on ventas.dni = clientes.dni inner join concesionario on ventas.cifc = concesionario.cifc and clientes.ciudad = concesionario.ciudad;
/*55.- Obtener los codcoche de los coches comprados en un concesionario de distinta ciudad que el cliente que lo compra.. Comprobar el nombre de los clientes y los concesionarios son de distinta ciudad.*/
select coches.codcoche from coches inner join ventas on coches.codcoche = ventas.codcoche inner join clientes on ventas.dni = clientes.dni inner join concesionario on ventas.cifc = concesionario.cifc and clientes.ciudad != concesionario.ciudad;
/*56.- Obtener todas las parejas de cifm de marcas y dni de clientes que sean de la misma ciudad.*/
select marcas.cifm, clientes.dni from clientes inner join marcas on clientes.ciudad = marcas.ciudad;
/*57.- Obtener todas las parejas de nombre de marcas que sean de la misma ciudad.*/
select marcas.nombre, mar.nombre from marcas inner join marcas as mar on marcas.ciudad = mar.ciudad and marcas.nombre > mar.nombre; 
/* Ejemplo producto */
select marcas from departamentos ,clientes, coches
where departamentos.codigo = clientes.codigo_dep
and coches.hola = clientes.hola
and clientes.color like 'blanco';
