/*8.- Indem anterior pero actualizamos a 6000€ los coches impares a partir del codcoche 10 hasta el 15.*/
-- En primer lugar metemos más valores con el ejemplo 5 para hacer la prueba.
select * from cochesold;
delimiter //
create procedure impares()
begin
	SET SQL_SAFE_UPDATES = 0;
	set @variable = 10;
    while @variable <= 15 do
		if @variable % 2 <> 0 then 
			update cochesold set precio = 6000 where codcoche = @variable;
		end if;
        set @variable = @variable +1;
	end while;
    SET SQL_SAFE_UPDATES = 1;
end;
//
call impares();
