create trigger tgr_del_logarticulos
after
delete on articulos
for each row
	insert into log_articulos(fecha,usuario,proceso,articulo) values
    (current_date(),current_user(),'Borrado',old.titulo);
    
insert into articulos(titulo,autor,fecha_pub) VALUES 
('JAVA','Alejandro',current_date());
select * from articulos;
delete from articulos where id_articulo = 3;
select * from log_articulos;
select * from articulos;

/*DROP TRIGGER IF EXISTS nombre de trigger;*/