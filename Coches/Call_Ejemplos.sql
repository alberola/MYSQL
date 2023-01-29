/*use talleresfaber;
create procedure listado_recambios()
select *
from recambios;

call listado_recambios();

*/

delimiter //
create procedure ver_coches(in model varchar(15))
begin
	declare mivar varchar(15);
    set mivar = model;
    
    select * from coches where modelo like mivar;

end;

//
call ver_coches('GTI');

delimiter //
create procedure ver_coches_nomb(in nomb varchar(15),in model varchar(15))
begin

    
    select * from coches where nombre like nomb and modelo like model;

end;

//

call ver_coches_nomb('ibiza','gti');

