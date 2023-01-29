/* 1.- La empresa quiere recoger en una tabla las actuaciones cuyo tiempo de realización no coincide con el tiempo estimado. Para ello debes seguir los siguientes pasos: */
create table Diferencias (
	referencia varchar(25),
    descripcion varchar(100),
    diferencia decimal (4,2)
);

insert into diferencias (select actuaciones.referencia, actuaciones.Descripcion, realizan.Horas - TiempoEstimado as 'Diferencia' 
from actuaciones inner join realizan on actuaciones.Referencia = realizan.Referencia where (realizan.Horas - TiempoEstimado) != 0);

select * from diferencias;

/* 2.- Con los datos obtenidos en la consulta anterior modificaremos los tiempos estimados en la tabla ACTUACIONES
 con las diferencias guardadas en la tabla DIFERENCIAS sumando las Diferencias al TiempoEstimado. */
select * from actuaciones;
/* start transaction; */

update actuaciones inner join
diferencias on actuaciones.Referencia = diferencias.Referencia set  tiempoestimado = TiempoEstimado + diferencia ;

/* commit*/

/* update actuaciones set tiempoestimado = (select TiempoEstimado + diferencia from actuaciones inner join
 diferencias on actuaciones.Referencia = diferencias.Referencia) where referencia in (select referencia from diferencias); */

/* 3.-La empresa decide ascender de categoría al trabajador que más horas ha trabajado.
 La nueva categoría asignada será Oficial de 1ª mecánico. El trabajador que más horas ha trabajado es: */
 
 -- start transaction;
 
 -- select * from empleados;
 update empleados set categoria = 'Oficial de 1º mecánico' where CodEmpleado = (select CodEmpleado from intervienen group by CodEmpleado order by sum(horas) desc limit 1);
-- commit;
select * from empleados;

/* 4.- Debido a la crisis del sector, la empresa decide reducir la plantilla.
 Esta reducción afectará a los empleados que hayan intervenido en 2 reparaciones o menos y que se hayan dado de alta en la empresa hace menos de 3 años.*/
 start transaction;
 select * from empleados;
SET SQL_SAFE_UPDATES = 0;
delete from empleados where date_add(FechaAlta, interval 14 year) < curdate() and CodEmpleado in (select CodEmpleado from intervienen group by codEmpleado having
 count(IdReparacion) <= 2);
commit;
SET SQL_SAFE_UPDATES = 1;

 /* 5.- El cliente Enrique Muriedas nos ha solicitado telefónicamente que le enviemos la factura de la reparación de referencia IdFactura=12.
 Los datos que teníamos registrados de esa factura son distintos. Reemplazar en la tabla FACTURAS los datos anteriores por los nuevos datos que nos ha suministrado el cliente.*/

 update facturas set FechaFactura = "2011-10-03", CodCliente = (select CodCliente from clientes
 where Apellidos = 'Muriedas, Arce' and Nombre = 'Enrique') where IdFactura = 12;
select * from facturas;

/* 6.- Uno de los vehículos registrados en nuestra base de datos ha cambiado de propietario. Registrar en una transacción ambos cambios: */
start transaction;
select * from clientes;
insert into clientes values ('00011', '112233445F', 'Campos, Vázquez', 'Miguel Ángel', 'Calle del Cid, nº 23, 1ºA, Santander', '345764423');
savepoint ClienteIntroducido;
select * from vehiculos;
update vehiculos set CodCliente = (select CodCliente from clientes where CodCliente = '00009') where matricula = '1122 ABC';
rollback to savepoint ClienteIntroducido;
commit;

/* 7.- La empresa decide borrar de la tabla VEHICULOS todos aquéllos vehículos que no hemos reparado en ninguna ocasión, por tanto no se encuentran referenciados en la tabla REPARACIONES. */
select * from vehiculos;
select * from reparaciones;
select matricula from vehiculos where matricula not in (select matricula from reparaciones);
start transaction;
SET SQL_SAFE_UPDATES = 0;
delete from vehiculos where matricula not in (select matricula from reparaciones);
SET SQL_SAFE_UPDATES = 1;
commit;

/* 8.- Un cliente nuevo nos ha traído su vehículo al taller el día 03/03/2011. En recepción se registran los siguientes datos:*/
start transaction;
select * from clientes;
insert into clientes  values ('00011', " ",'Gómez Calle','Tomás', null, '22334455');
select * from vehiculos;
insert into vehiculos (matricula,modelo,fechaMatriculacion) values ('3131 FGH','Renault Scénic', "2009-03-17");
update vehiculos set CodCliente = (select CodCliente from clientes where CodCliente = '00011') where matricula = '3131 FGH';
select * from reparaciones;
insert into reparaciones(matricula,FechaEntrada, km, avería, observaciones) values ((select matricula from vehiculos where matricula = '3131 FGH'),
"2011-03-03", 105000, 'Sustitución de las lámparas delanteras', 'Sin Observaciones');
select clientes.CodCliente,clientes.Apellidos,clientes.Nombre,clientes.Telefono,vehiculos.Matricula,vehiculos.Modelo,vehiculos.FechaMatriculacion, reparaciones.FechaEntrada,
reparaciones.Km,reparaciones.Avería from clientes inner join vehiculos on clientes.CodCliente = vehiculos.CodCliente inner join reparaciones on vehiculos.Matricula = reparaciones.Matricula
and vehiculos.Matricula = '3131 FGH';
/* 9.- Avisamos al cliente de la reparación anterior para que pase hoy a recoger su vehículo que ya ha sido reparado. */
select * from recambios;
update recambios set Stock = stock -1 where IdRecambio = 'LD_222_777';
select * from reparaciones;
-- Creamos el empleado 9000 ya que lo hemos borrado previamente.
insert into empleados values ('90000','09876543I','Luis Jesús','Hermida Martínez','Calle del desfiladero, nº 101, Bajo, LLanes','990011222','33500','2008-01-12','Jefe de electricidad');
select * from intervienen;
insert into intervienen values ('90000',12,0.15);
select * from incluyen;
insert into incluyen values ('LD_222_777', 12, 1);
select * from realizan;
insert into realizan values (12, '1110008888', 0.15);
select * from reparaciones;
update reparaciones set FechaSalida = curdate(), reparado = 1 where IdReparacion = 12;
select * from reparaciones;

/* 10.- Registrar dos transacciones simultáneas sobre la misma tabla utilizando el bloqueo a nivel de tabla LOCK TABLE.
 Para poder simular transacciones simultáneas puedes abrir dos sesiones distintas con MySQL Workbench.
 Bloquea la tabla para la primera transacción y antes de desbloquear intenta ejecutar la segunda. */
set autocommit = 0;

lock table reparaciones write;
insert into reparaciones(matricula,km,avería,reparado) values ('2233 ABC', 65000, 'Sustituir filtro de aire', 0);
commit;

update reparaciones set Fechasalida = curdate(), reparado = 1, Observaciones = 'Reparacion finalizada' where IdReparacion = 10;
select * from reparaciones;
unlock tables;
set autocommit = 1;