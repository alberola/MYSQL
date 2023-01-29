/*    12.- Nombre y función de los empleados que han trabajado en el departamento de Marketing.*/
select empleados.nombre, trabajan.funcion from empleados inner join trabajan on empleados.codigo = trabajan.cod_emp inner join departamentos on trabajan.cod_dep = departamentos.codigo and departamentos.nombre = 'Marketing';
/*     13.- Nombre del empleado, nombre del departamento y función que han realizado de los empleados que tienen 1 hijo.*/
select empleados.nombre, departamentos.nombre, trabajan.funcion from departamentos inner join trabajan on departamentos.codigo = trabajan.cod_dep inner join empleados on trabajan.cod_emp = empleados.codigo and empleados.hijos = 1;
/*     14.- Nombre de los empleado que ha trabajado en el departamento de 'Recursos Humanos' que tienen entre 1 y 3 hijos. */
select empleados.nombre, departamentos.nombre, empleados.hijos from empleados inner join trabajan on empleados.codigo = trabajan.cod_emp inner join departamentos on trabajan.cod_dep = departamentos.codigo and departamentos.nombre = 'Recursos humanos' and empleados.hijos between 1 and 3;
/*     15.- Nombre del empleado, mes y ejercicio de sus justificantes de nómina, número de línea y cantidad de las líneas de los justificantes para la empleada 'Encarna López López'.*/
select empleados.nombre, just_nominas.mes, just_nominas.ejercicio, lineas.cantidad from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp inner join lineas on (just_nominas.mes, just_nominas.ejercicio, just_nominas.cod_emp) = (lineas.mes, lineas.ejercicio, lineas.cod_emp) and empleados.nombre = 'Encarna López López';
/*	    16.- Nombre del empleado, mes y ejercicio de sus justificantes de nómina para los empleados que han trabajado en el departamento de Dirección.*/
select empleados.nombre, just_nominas.mes, just_nominas.ejercicio from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp inner join trabajan on empleados.codigo = trabajan.cod_emp inner join departamentos on trabajan.cod_dep = departamentos.codigo and departamentos.nombre = 'Direccion';
/*	    17.- Quiero saber el sueldo neto (sueldo bruto - descuento para impuestos) de cada empleado.*/
select empleados.nombre, sum(just_nominas.ingreso) - sum(just_nominas.descuento) as 'Sueldo neto' from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp group by nombre order by nombre asc;
/*	    18.- Nombre de los empleados que han ganado más de 2000 € en el año 2006.*/
select empleados.nombre, sum(just_nominas.ingreso) - sum(just_nominas.descuento) as 'Sueldo neto' from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp and just_nominas.ejercicio = 2006 group by nombre having (sum(just_nominas.ingreso) - sum(just_nominas.descuento)) > 2000;
/*     24.- Nombre, edad de los empleados y nombre del departamento de los empleados que han trabajado en más de un departamento.*/
select empleados.nombre, departamentos.codigo,year(curdate())-year(fnacimiento) as 'Edad', departamentos.nombre from empleados inner join trabajan on empleados.codigo = trabajan.cod_emp inner join departamentos on trabajan.cod_dep = departamentos.codigo and count(departamentos.codigo) > 1 order by departamentos.nombre;
/*	    25.- Nombre e ingresos percibidos empleado más joven y del más longevo.*/
select empleados.nombre, just_nominas.ingreso from empleados inner join just_nominas on empleados.codigo = just_nominas.cod_emp and max(year(curdate())-year(fnacimiento)) or min(year(curdate())-year(fnacimiento));



