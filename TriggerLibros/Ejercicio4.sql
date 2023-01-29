/*Crear un trigger que actualice automáticamente el precio de los libros. El trigger comprobará si el precio del libro ha cambiado y,
 en caso afirmativo, establecerá el nuevo precio aumentando el 10% de ganancias en la venta.*/
 
DROP TRIGGER IF EXISTS aumentarPrecio;
delimiter //
create trigger aumentarPrecio
before 
update on libros
for each row 
begin
	if (new.precio != old.precio) then
        set new.precio = new.precio + new.precio*0.1;
    end if;
end;
//
delimiter ;
update libros set precio = 10 where codigo = 1;
select * from libros;
