/*2.- El gerente quiere conocer los apellidos y el nombre del empleado que más horas ha trabajado. La consulta debe mostrar 2 columnas:*/
select concat(Apellidos, ', ', Nombre) as 'Apellidos y nombre', sum(intervienen.Horas) as 'Horas Totales' from empleados inner join intervienen on empleados.CodEmpleado = intervienen.CodEmpleado group by empleados.CodEmpleado order by `Horas Totales` desc limit 1;
/*3.- Importe total de los recambios: PrecioReferencia*Unidades*/
select sum(recambios.PrecioReferencia * incluyen.Unidades) as 'Importe Recambios' from recambios inner join incluyen on recambios.IdRecambio = incluyen.IdRecambio;
	/*Importe total de las actuaciones: Horas*50*/
select sum(horas*50) as 'Importe Horas' from realizan;
/*4.- Obtener un listado con el número de reparaciones en las que ha intervenido cada uno de los empleados. El listado debe mostrar:*/
	/*a.El número de reparaciones, los apellidos y el nombre del empleado.*/
	/*b.El número de reparaciones debe aparecer en orden descendente.*/
select count(intervienen.CodEmpleado) as 'Numero Reparaciones', empleados.Apellidos, empleados.Nombre from empleados inner join intervienen on empleados.CodEmpleado = intervienen.CodEmpleado group by intervienen.CodEmpleado order by `Numero Reparaciones`desc;
/*5.- Los socios del taller pretenden dar un servicio cada vez más rápido a sus clientes. Para ello han previsto que las reparaciones se realicen antes de 2 días. Interesa conocer las reparaciones que han superado esa previsión y los empleados que la han realizado. Las columnas que se deben mostrar son:*/
	/*Nombre de los empleados, Fecha de entrada, Fecha de salida y Fecha de salida prevista (2 días a partir de la fecha de entrada).*/
    /*Combinar las tablas utilizando la Combinación interna (INNER JOIN).*/
select empleados.Nombre, reparaciones.FechaEntrada, reparaciones.FechaSalida, date_add(reparaciones.FechaEntrada, interval 2 day) as 'Salida Prevista' from empleados inner join intervienen on empleados.CodEmpleado = intervienen.CodEmpleado inner join reparaciones on intervienen.IdReparacion = reparaciones.IdReparacion where date_add(reparaciones.FechaEntrada, interval 2 day) < reparaciones.FechaSalida;
/* 6.- Hacer una consulta que devuelva los nombres y categorías de los empleados que han intervenido en alguna reparación.*/
select Nombre, Categoria from empleados where CodEmpleado in (select CodEmpleado from intervienen);
/*7.- . Interesa conocer cuál es el vehículo con más kilómetros que ha visitado el taller. Mostrar los kilómetros, la marca, el modelo, el color y la matrícula.*/
select vehiculos.Matricula, reparaciones.Km, vehiculos.Marca, vehiculos.Modelo, vehiculos.Color from vehiculos inner join reparaciones on vehiculos.Matricula = reparaciones.Matricula order by reparaciones.Km desc limit 1;
/*8.- En Talleres Faber están pensando en hacer más rentable la gestión de los recambios. Se pretende optimizar el stock, para ello se solicita un listado con los siguientes datos: IdRecambio, Descripción, UnidadBase y Stock, de los artículos que superen el stock considerado como óptimo, según los siguientes criterios:
Para los artículos cuya unidad base se mide como una unidad se considera el stock óptimo hasta 10 artículos.
Para los artículos cuya unidad base no sea una unidad el stock considerado como óptimo es hasta 4 artículos.*/
select IdRecambio, Descripcion, UnidadBase from recambios where unidadbase like 'unidad' and stock>10 or unidadbase not like 'unidad' and stock >4;
/*9.- Con relación a las actuaciones, se considera importante saber cuántas reparaciones se realizan de importe superior a la media. La consulta nos devolverá un solo dato: el número de reparaciones realizadas cuyo importe supera el importe medio de las actuaciones.*/
select count(referencia) as 'Número de reparaciones con actuaciones que superan el importe medio' from realizan where referencia in (select referencia from actuaciones where importe > (select avg(importe) from actuaciones));
/*10.- Obtener un listado que nos informe del número de facturas que hemos emitido a cada cliente. El listado tendrá dos columnas: el nombre completo del cliente y el número de facturas que le corresponden.*/
select concat(clientes.apellidos, ' , ', clientes.nombre) as 'Clientes', count(facturas.IdFactura) as 'Número de facturas' from clientes inner join facturas on clientes.codcliente = facturas.codcliente group by `clientes` order by `Número de facturas` desc;