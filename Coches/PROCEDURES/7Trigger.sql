/* 7.- Actualizar los precios a 5000€ de los tres primeros coches de la tabla cochesold. Usando un while. */
drop procedure if exists actualiza_precios;
delimiter //
create procedure actualiza_precios()
begin
	SET SQL_SAFE_UPDATES = 0;
    set @variable = 1;
	while @variable <= 3 do
		update cochesold set precio = 5000 where codcoche = @variable;
		set @variable = @variable+1;
    end while;
    SET SQL_SAFE_UPDATES = 1;
end;
//
call actualiza_precios();
select * from cochesold;
