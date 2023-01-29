/*1.- Pasadas las fiestas navideñas Talleres Faber quiere enviar publicidad a sus clientes. Para ello quiere seleccionar
	a aquellos a los que no se les ha emitido ninguna factura desde el 6 de Enero. Obtener un listado
		con Nombre, Apellidos y Dirección de esos clientes. */
select apellidos, nombre, direccion from clientes where CodCliente not in (select CodCliente from facturas where FechaFactura > '2011-01-06');
/*8.- En Talleres Faber están pensando en hacer más rentable la gestión de los recambios. Se pretende optimizar el stock,
	para ello se solicita un listado con los siguientes datos: IdRecambio, Descripción, UnidadBase y Stock,
		de los artículos que superen el stock considerado como óptimo, según los siguientes criterios: */
select IdRecambio, Descripcion, UnidadBase from recambios where UnidadBase like 'unidad' and stock > 10 or UnidadBase not like 'unidad' and stock > 4;