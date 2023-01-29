/*Creamos un nuevo disparador para actualizar el campo "stock" de la tabla "libros" cuando se actualiza un registro de la tabla "ventas"
(por ejemplo, el cliente devuelve algún libro, no todos los que compró)*/
-- SEGUNDA PARTE AÑADIDA POR JORGE. POR SI SE QUIEREN DEVOLVER ALGUNOS LIBROS.
create trigger actualizarDevolver
before
update on ventas 
for each row
	update libros set stock = stock + (old.cantidad - new.cantidad) where codigo = new.codigolibro;
update ventas set cantidad = 2 where numero=2;
select * from libros;