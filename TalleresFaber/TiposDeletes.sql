/*1.- Intenta borrar un curso de la base de datos utilizando las cuatro maneras descritas anteriormente, para conservar la integridad referencial.
 Hacer pantallazo de cada opción y comprobar que se ha borrado el curso.*/
select * from cursos;
select * from alumnado;
 /*1º No permitir supresión ni modificacion : Opcion por defecto*/ 
 set SQL_SAFE_UPDATES = 0;
 delete from cursos where codigo like 2;
 set SQL_SAFE_UPDATES = 1;
 /* 2º Supresión o modificación en Cascada (ON DELETE CASCADE)*/
set SQL_SAFE_UPDATES = 0;
delete from cursos where codigo like 2;
select * from cursos;
set SQL_SAFE_UPDATES = 1;
 /* 3º Asignación de Nulo (ON DELETE SET NULL) */
select * from cursos;
set SQL_SAFE_UPDATES = 0;
delete from cursos where codigo like 2;
select * from cursos;
select * from alumnado;
set SQL_SAFE_UPDATES = 1;
 /* 4º Valor por defecto (ON DELETE DEFAULT) */
 
