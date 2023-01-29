insert into marcas (cifm,nombre,ciudad) values (0001,"seat","madrid"), (0002,"renault","barcelona"), (3,"citroen","valencia"), (4,"audi","madrid"), (5,"opel","bilbao"), (6,"bmw","barcelona");

insert into coches (codcoche,nombre,modelo,cifm) values (1,"ibiza","glx", 1),
(2,"ibiza","gti",1), (3,"ibiza","gtd",1),(4,"toledo","gtd",1),(5,"cordoba","gti",1), (6,"megane","1.6",2),(7,"megane","gti",2),
(8,"laguna","gtd",2),(9,"laguna","gtd",2),(10,"zx","16v",3),(11,"zx","td",3),(12,"xantia","gtd",3),(13,"a4","1.8",4),(14,"a4","2.8",4),
(15,"astra","caravan",5),(16,"astra","gti",5), (17,"corsa","1.4",5),(18,"300","316.i",6),(19,"500","525i",6),(20,"700","750i",6);

insert into concesionario (cifc,nombre,ciudad) values (1,"acar","madrid"), (2,"bcar","madrid"),(3,"ccar","barcelona"),(4,"dcar","valencia"),(5,"ecar","bilbao");

insert into clientes (dni,nombre,apellidos,ciudad) values (1,"luis","garcia","madrid"),(2,"antonio","lopez","valencia"),(3,"juan","martin","madrid"),(4,"maria","garcia","madrid"),
(5,"javier","gonzalez","barcelona"),(6,"ana","lopez","barcelona");


insert into distribucion (cifc,codcoche,cantidad) values (1,1,3),(1,5,7),(1,6,7),
(2,6,7),(2,8,10),(2,9,10),(3,10,5),(3,11,3),(3,12,5),(4,13,10),(4,14,5),(5,15,10),
(5,16,20),(5,17,8),(5,19,3);

insert into ventas (cifc,dni,codcoche,color) values (1,1,1,"blanco"),
(1,2,5,"rojo"),(2,3,8,"blanco"),(2,1,6,"rojo"),(3,4,11,"rojo"),(4,5,14,"verde");