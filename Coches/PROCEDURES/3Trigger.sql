/*3.- Vamos a ponerle precio a los coches que tenemos en la tabla cochesold. El precio será de 10.000€ si el modelo
es 'Gti', 12.000 los 'Gtd' y 6.000€ el resto.*/
SELECT * FROM COCHESOLD;
delimiter //
create procedure insertar_precio(in model varchar(15))
begin
	SET SQL_SAFE_UPDATES = 0;
	if model = 'Gti' then 
    update cochesold set precio = 10000 where modelo = model;
    elseif model = 'Gtd' then
    update cochesold set precio = 12000 where modelo = model;
    else 
    update cochesold set precio = 6000 where modelo = model;
    end if;
    SET SQL_SAFE_UPDATES = 1;
end;
//
call insertar_precio('Gtz');