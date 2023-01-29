/*4.- Idem el ejercicio 3, pero tambien doy el precio que va a tener el modelo del coche.
Ejemplo: call ejercicio4('Gti', 14000);*/
delimiter //
create procedure cambiar_precio(in model varchar(15), prec decimal(10,2))
begin
	SET SQL_SAFE_UPDATES = 0;
		update cochesold set precio = prec where modelo = model;
    SET SQL_SAFE_UPDATES = 1;
end;
//
call cambiar_precio('Gti',10000);

select * from cochesold;