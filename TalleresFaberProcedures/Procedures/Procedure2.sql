/*Realizar un procedimiento que recibe la matrícula de un vehículo y la operación a realizar. 
Utilizando un switch, que muestre:
1.- Si la operación es 'datos': escriba la marca, modelo y color del automóvil
2.- Si la operación es 'reparaciones': me da el número de reparaciones que ha sufrido ese 
automóvil
3.- Si la operación es 'empleados': me dice los empleados que han realizado esas reparaciones
4.- Si la operación es 'marca': muestra los datos de los vehículos de la misma marca*/

delimiter //
create procedure ejercicio2(in matriculaEntrada varchar(10),in operacion varchar(20))
begin
	case
		when operacion like 'datos' then
			select marca, modelo, color from vehiculos where matricula like matriculaEntrada;
		when operacion like 'reparaciones' then
			select count(*) from reparaciones where matricula like matriculaEntrada;
		when operacion like 'empleados' then
			select dni, nombre, apellidos from empleados inner join intervienen on empleados.CodEmpleado = intervienen.CodEmpleado inner join reparaciones on
            intervienen.IdReparacion = reparaciones.IdReparacion where reparaciones.Matricula = matriculaEntrada and reparaciones.IdReparacion = intervienen.IdReparacion;
		when operacion like 'marca' then
			select * from vehiculos where marca in (select marca from vehiculos where matricula like matriculaEntrada);
    end case;
end;
//
delimiter ;
select * from empleados;
call ejercicio2('1313 DEF','empleados');