/*6.- Hacer un procedimiento en el que se introduce un modelo (Ibiza, León, Exeo) por teclado, y me sale un listado de los coches de ese modelo, con el precio. Utiliza el Switch.*/
delimiter //
create procedure mostrar(in model varchar(15))
-- Me confundí al poner el nombre de la variable y la confundi con el modelo, aunque tenga nombre model hace referencia a nombre.
begin
	case
    when model like 'Ibiza' then
		select * from cochesold where nombre like model;
	when model like 'Leon' then
		select * from cochesold where nombre like model;
	when model like 'Exeo' then
		select  * from cochesold where nombre like model;
	end case;
end;
//
call mostrar('Leon');
