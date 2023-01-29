/*Nombre, edad de los empleados y nombre del departamento de los empleados que
 han trabajado en más de un departamento.*/
 select empleados.nombre, timestampdiff(YEAR,fnacimiento, curdate()) as "Edad",
 departamentos.nombre as Departamento from empleados
 left join trabajan on trabajan.cod_emp = empleados.codigo
 left join departamentos on departamentos.codigo = trabajan.cod_dep
 where departamentos.nombre is not null and
 empleados.codigo in (select cod_emp from trabajan group by cod_emp 
having count(*) > 1);