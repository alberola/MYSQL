/*	    17.- Quiero saber el sueldo neto (sueldo bruto - descuento para impuestos) de cada empleado.*/
select empleados.nombre, sum(just_nominas.ingreso) - sum(just_nominas.descuento) as 'Sueldo neto' from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp group by nombre order by nombre asc;
