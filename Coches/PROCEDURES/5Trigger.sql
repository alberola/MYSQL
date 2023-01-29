/*5.- Usando el switch hacer un procedimiento en el que se introduce un número por teclado, donde:
- Si introduzco el 5 el modelo del coche es “IBIZA” y modelo 'Gti'.
- Si introduzco el 10 el modelo del coche es “LEON” y modelo 'Gtx'.
- Si introduzco el 15 el modelo del coche es “EXEO” y modelo 'Gtd'.
- Si introduzco el cualquier otro número la variable se convierte en la palabra “OTROS”, sin modelo.*/
select * from cochesold;

delimiter //
create procedure elegir(in num int)
begin
	declare autoincrementar int;
    set autoincrementar = (select max(codcoche) from cochesold ) +1;
	case 
		when num = 5 then 
			insert into cochesold(codcoche,nombre,modelo,cifm,precio) values (autoincrementar,'Ibiza','Gti',1,num*1000);
		when num = 10 then 
			insert into cochesold(codcoche,nombre,modelo,cifm,precio) values (autoincrementar,'LEON','Gtx',1,num*1000);
        when num = 15 then 
			insert into cochesold(codcoche,nombre,modelo,cifm,precio) values (autoincrementar,'EXEO','Gtd',1,num*1000);
        else 
			insert into cochesold(codcoche,nombre,modelo,cifm,precio) values (autoincrementar,'OTROS','',1,num*1000);
	end case;
end;
//

call elegir(5);