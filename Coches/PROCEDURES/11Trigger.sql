/*11.- Hacer un procedimiento en el que se introduce un número de id del coche por teclado, donde:
- Si el id introducido está entre el 5 y el 10, actualizar el precio un 20% más desde el id introducido por teclado hasta el id con el número 1.
- Si el id introducido es mayor que 10, actualizar el precio un 10% más desde el id introducido por teclado hasta el id con el número 10.
- En el mismo procedimiento hacer un listado de los coches con el nuevo precio.*/
delimiter //
CREATE PROCEDURE actualizar20(in codigo int)
begin
	declare maximo int;
    set maximo = codigo;
	if codigo between 5 and 10 then
		while codigo >= 1 do
			update cochesold set precio = (precio+precio/5) where codcoche = codigo;
            set codigo = codigo - 1;
        end while;
    elseif codigo > 10 then
		while codigo >= 10 do
			update cochesold set precio = (precio+precio/10) where codcoche = codigo;
            set codigo = codigo - 1;
        end while;
    else
		select "No has introducido un código de coche válido";
    end if;
end;
//
select * from cochesold where codcoche between codigo and maximo;
