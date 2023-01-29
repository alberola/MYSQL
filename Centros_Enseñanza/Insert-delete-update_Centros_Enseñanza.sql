/*1.- Inserta un registro nuevo en la tabla PROFESORADO. Los datos deben ser los siguientes:
Codigo: 1
Nombre: NURIA
Apellidos: ANERO GONZALEZ
DNI: 58328033X
Especialidad: MATEMATICAS
Fecha_Nac: 22/02/1972
Antiguedad: 9*/
insert into profesorado values (1, 'Nuria', 'Anero Gonzalez', '58328033X', 'Matematicas', '1972-02-22',9);
select * from profesorado;
/*2.- Inserta varios registros en la tabla PROFESORADO utilizando una sentencias INSERT. Los datos deben ser los siguientes:*/
insert into profesorado values (2, 'MARIA LUISA',	'FABRE BERDUN',	'51083099F',	'TECNOLOGIA',	'1975-03-31',	4),
 (3,	'JAVIER',	'JIMENEZ HERNANDO',null,	'LENGUA',	'1969-05-04',	10),
 (4,	'ESTEFANIA',	'FERNANDEZ MARTINEZ',	'19964324W',	'INGLES',	'1973-06-22',	5),
 (5,	'JOSE M.',	'ANERO PAYAN', null, null, null, null);
 select * from profesorado;
 /*3.- Modifica los registros de la tabla CURSOS para asignar a cada curso un profesor o profesora. El profesorado que debes asignar a cada curso es:*/
update cursos set cod_profe = 4 where codigo =1;
update cursos set cod_profe = 2 where codigo =2;
update cursos set cod_profe = 2 where codigo =3;
update cursos set cod_profe = 1 where codigo =4;
update cursos set cod_profe = 1 where codigo =5;
update cursos set cod_profe = 3 where codigo =6;
select * from cursos;
/*4.- Modifica el registro de la profesora "ESTEFANIA", usando sentencias SQL, y cambia su fecha de nacimiento a "22/06/1974" y la antiguedad a 4.*/
set @variable=(select codigo from profesorado where nombre like 'Estefania');
update profesorado set fecha_nac = '1974-06-22', antiguedad = 4 where codigo=@variable;
select * from profesorado;
/*5.- Modifica las antiguedades de todos los profesores y profesoras incrementándolas en 1 en todos los registros. Debes hacerlo usando un sola sentencia SQL.*/
set SQL_SAFE_UPDATES = 1;
update profesorado set antiguedad = antiguedad+1 where codigo is not null;
select * from profesorado;
/*6.- Elimina, de la tabla CURSOS, el registro del curso que tiene el código 6. */
select * from cursos;
delete from cursos where codigo = 6;
select * from cursos;
/*7.- Elimina, de la tabla ALUMNADO, a los alumnos del 'Curso 3'. Debes hacerlo usando un sola sentencia SQL.*/
select * from alumnado;
select * from cursos;
set @curso3 = (select codigo from cursos where nombre like 'curso 3');
delete from alumnado where cod_curso = @curso3;
select * from alumnado;
/*8.- Inserta los registros de la tabla ALUMNADO_NUEVO en la tabla ALUMNADO. Debes hacerlo usando un sola sentencia SQL.*/
select * from alumnado_nuevo;
insert into alumnado (Nombre, apellidos, sexo, fecha_nac) (select * from alumnado_nuevo);
select * from alumnado;
/*9.- En la tabla CURSOS, actualiza el campo Max_Alumn del registro del curso con código 2, asignándole el valor correspondiente
 al número total de alumnos y alumnas que hay en la tabla ALUMNADO y que tienen asignado ese mismo curso.*/
 select * from cursos;
Update Cursos Set Max_Alumn = (Select Count(*) From Alumnado Where Cod_Curso=2) Where Codigo = 2;
/*10.- Elimina de la tabla ALUMNADO todos los registros asociados a los cursos que imparte la profesora cuyo nombre es "NURIA".*/
select * from alumnado;
Delete From Alumnado Where Cod_Curso in(Select Codigo From Cursos Where Cod_Profe In (Select Codigo From 
Profesorado Where Nombre like 'NURIA'));