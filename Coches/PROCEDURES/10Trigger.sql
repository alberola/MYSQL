/*10.- Hacer un procedimiento en el que se introduce un número por teclado, donde:
- Si introduzco un número mayor que 5 me actualiza el precio en un 10% a los id pares, de los 10 primeros coches.
- Si introduzco un número menor o igual que 5 me pone en 0 el precio de los id impares, de los 10 primeros coches.*/
select * from cochesold;
delimiter //
CREATE PROCEDURE actualizar10(in variable int)
begin
	if variable > 5 then
		set variable = (select min(codcoche) from cochesold);
		while variable < 10 do
			if variable % 2 = 0 then
				update cochesold set precio = (precio/10) where codcoche = variable;
                set variable = variable + 2;
			else 
				set variable = variable +1;
            end if;
        end while;
    else
		set variable = (select min(codcoche) from cochesold);
		while variable < 10 do
			if variable % 2 = 0 then
				set variable = variable +1;
			else 
				update cochesold set precio = 0 where codcoche = variable;
                set variable = variable + 2;
            end if;
        end while;
    end if;
end;//
delimiter ;
		