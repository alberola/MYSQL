/*37.- Obtener el dni, nombre, apellido y ciudad de los clientes que han adquirido un automóvil a un concesionario que posea actualmente coches en stock del modelo 'GTI'.*/
select dni,nombre, apellidos, ciudad from clientes where dni in (select dni from ventas where cifc in (select cifc from distribucion where cantidad > 0  and codcoche in (select codcoche from coches where modelo like 'gti')));
