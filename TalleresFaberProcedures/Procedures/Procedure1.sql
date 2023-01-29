/*Crear un procedimiento que:
1.- Si introduces un 1, muestra los vehículos (marca, modelo y color) que no estén reparados.
2.- Si llamas al procedimiento con un 2, muestra los datos de los clientes y vehículos que han 
entrado a reparar hoy. (En nuestro caso ninguno).*/
delimiter //
create procedure ejercicio1 (in numero int)
begin
	if (numero = 1) then
		select marca,modelo, color from vehiculos inner join reparaciones on vehiculos.matricula = reparaciones.matricula where reparaciones.reparado = 0;
	elseif (numero = 2) then
		select clientes.dni, concat(clientes.apellidos, '',clientes.nombre) as `Nombre y apellidos`, vehiculos.matricula, vehiculos.marca, vehiculos.fechaMatriculacion
        from clientes inner join vehiculos on  clientes.CodCliente = vehiculos.CodCliente inner join reparaciones on vehiculos.matricula = reparaciones.matricula
        where reparaciones.FechaEntrada = curdate();
    end if;
end;
// 
delimiter ;
call ejercicio1(2);
select * from reparaciones;
insert into reparaciones  (matricula,fechaentrada) values ('1111 AAA', curdate());
