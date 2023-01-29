delimiter //
create procedure calcular10 (in precio int, out salida int)
begin
	set salida = precio  * 0.1;
end;
//
delimiter ;

delimiter //
create trigger añadirComision
before 
insert on ventas
for each row 
begin
	declare variableAux int;
    call calcular10(new.valor, variableAux);
	set new.comision = variableAux;
end;
//
delimiter ;
drop trigger añadirComision;
insert into ventas(articulo,valor, vendedor) values ('Queso', 300.00, 'Jorge');

select * from ventas;