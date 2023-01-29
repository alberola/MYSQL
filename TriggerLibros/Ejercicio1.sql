/*Crear un disparador que salte cuando se produce una venta de un libro para disminuir el stock del mismo.*/

create trigger reducirStock
after
insert on ventas
for each row 
	update libros set stock = stock - new.cantidad where codigo = new.codigolibro;
    
select * from libros;   
    
insert into ventas(codigolibro,precio,cantidad) values (1,15,5);

select * from libros;
    
