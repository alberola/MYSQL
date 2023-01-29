/*2.- Con una procedimiento almacenado vamos a traer datos de la tabla coche a cochesold, pero por nombre de coche,
 es decir llamamos al procedimiento con el nombre del coche y me inserta en cochesold todos los campos de coches que cumplan la condición.
 Por ejemplo ejecuto "call llenar('Ibiza');" se insertan en cocheold todos los registros de los Ibiza de la tabla coches.*/

select * from cochesold;
 delimiter //
create procedure insertar_cochesss(in nomb varchar(15))
begin
    
	insert into cochesold(codcoche,nombre,modelo,cifm) (select * from coches where nombre like nomb);

end;

//
call insertar_cochesss('Ibiza');


