/*Creamos un nuevo disparador para actualizar el campo "stock" de la tabla "libros" cuando se elimina un registro de la tabla "ventas"
 (por ejemplo, si el comprador devuelve todos los libros comprados)*/

create trigger devolverLibro
after 
delete on ventas
for each row 
	update libros set stock = stock + old.cantidad where codigo = old.codigolibro;
    
delete from ventas where numero = 1;
select * from libros;
