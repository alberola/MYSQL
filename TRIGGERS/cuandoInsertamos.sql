create trigger logarticulos
	after
    insert on articulos
    for each row
		insert into log_articulos(fecha,usuario,proceso,articulo)
        values(now(),current_user(),'agregado',NEW.TITULO);
        
show triggers;

insert into articulos(titulo,autor,fecha_pub) VALUES 
('Ejemplo de triggers en MySQL','Jorge',current_date());

select * from articulos;
select * from log_articulos;
/*DROP TRIGGER IF EXISTS nombre de trigger;*/


