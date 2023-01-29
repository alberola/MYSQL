/*9.-  Indem anterior pero actualizamos a 10000€ los últimos 15 coches a partir del último codcoche (de 3 en 3).*/
select * from cochesold;
start transaction;
delimiter //
create procedure salto_tres()
begin
    set @contador = 1;
	set @numeroUnidades = (select max(codcoche) from cochesold);
	set @numeroBucle = @numeroUnidades;
	while @contador <= 5 do
		update cochesold set precio = 10000 where codcoche = @numeroBucle;
		set @numeroBucle = @numeroBucle -3;
        set @contador = @contador+1;
    end while;
end;
//
delimiter ;
set SQL_SAFE_UPDATES = 0;
call salto_tres();
select * from cochesold;