/*Creación de un procedimiento donde envías el Código de Reparación y una de las siguientes 
opciones:
1.- Y me devuelve el importe de los recambios sustituidos en una reparación (para calcular el 
importe multiplica las unidades por el importe del recambio). 
2.- Me da el importe de las actuaciones que se llevan a cabo en una reparación (para calcular el 
importe multiplica las horas por el importe de cada actuación).
Cualquier otro número.- Hacer una consulta que calcule el importe total (mano de obra y 
recambios) de las reparaciones que se le hayan realizado.
En cualquier caso pasa como variable el Id de la reparación*/
delimiter //
create procedure ejercicio3(in idRepa int, in opt int)
begin
	case
		when opt = 1 then
			select incluyen.Unidades * recambios.PrecioReferencia as `Recambios` from incluyen inner join recambios on incluyen.IdRecambio = recambios.IdRecambio
            where incluyen.IdReparacion = idRepa;
		when opt = 2  then
			select realizan.Horas * actuaciones.Importe as `Mano de Obra` from realizan inner join actuaciones on realizan.Referencia = actuaciones.Referencia 
            where realizan.IdReparacion = idRepa;
		when opt != 2 or opt != 1 then
			select incluyen.Unidades * recambios.PrecioReferencia as `Recambios`, realizan.Horas * actuaciones.Importe as `Mano de Obra`,
            (incluyen.Unidades * recambios.PrecioReferencia) + realizan.Horas * actuaciones.Importe as `Total` from reparaciones inner join realizan
            on reparaciones.IdReparacion = realizan.IdReparacion inner join actuaciones on realizan.Referencia = actuaciones.Referencia inner join incluyen
            on reparaciones.IdReparacion = incluyen.IdReparacion inner join recambios on incluyen.IdRecambio = recambios.IdRecambio where reparaciones.IdReparacion =  idRepa;
    end case;
end;
// 
delimiter ;

call ejercicio3 (3,3);