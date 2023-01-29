create trigger tgr_udp_logarticulos
before
update on articulos
for each row
	insert into log_articulos (fecha,usuario,proceso,articulo) values
    (now(),current_user(),'Editado',old.titulo);
    
insert into articulos(titulo,autor,fecha_pub) VALUES 
('PHP y MYSQL','Maria',current_date());

update articulos set titulo ='PHP' where id_articulo = 2;

select * from log_articulos;

/*DROP TRIGGER IF EXISTS nombre de trigger;*/
	