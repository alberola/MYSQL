
/* Se borra el contenido de las tablas */

-- Se inserta en la tabla ZonaUrbana 
INSERT 
  INTO ZonaUrbana (nombre_zona,od_zona) 
  VALUES ('CENTRO','Es la zona correspondiente al centro de la 
         ciudad');
INSERT 
  INTO ZonaUrbana (nombre_zona,od_zona) 
  VALUES ('SECTOR SUR','Es la zona correspondiente al sur de la 
         ciudad');
INSERT 
  INTO ZonaUrbana (nombre_zona,od_zona) 
  VALUES ('SUBURBIO TERMINAL','Es la zona correspondiente a la 
         zona pobre de la ciudad');
INSERT 
  INTO ZonaUrbana (nombre_zona,od_zona) 
  VALUES ('BRILLANTE','Es la zona correspondiente mas alta de la 
         ciudad');
INSERT 
  INTO ZonaUrbana (nombre_zona,od_zona) 
  VALUES ('TRASIERRA','Es la zona correspondiente a la zona 
         cercana a la sierra de la ciudad');

-- Se inserta en la tabla Vivienda 
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
       VALUES ('Cruz Conde',20,'B',14003,60,'Piso','CENTRO');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Ronda de los Tejares',15,'B',14007,70,'Piso','CENTRO');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Avenida el Brillante',15,'C',14027,160, 'Casa', 
         'BRILLANTE');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Urbanización las Lomas',53,'C',14009,250,'Chalet', 
         'TRASIERRA');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Avenida América',20,'B',14026,100,'Piso','CENTRO');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('El Palo',15,'C',15025,50,'C','SUBURBIO TERMINAL');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('La Paz',5,'B',14000,60,'Piso','SECTOR SUR');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Los Pinos',5,'C',13050,250,'C','TRASIERRA');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Felipe II',14,'B',12005,70,'Bloque','CENTRO');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Avenida el Brillante',20,'B',14028,80,'Bloque', 
         'BRILLANTE');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Damasco',20,'B',14500,120,'Bloque','SECTOR SUR');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Saravia',3,'C',14003,100,'Casa','CENTRO');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Damasco',23,'C',14500,120,'Casa','SECTOR SUR');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Damasco',24,'C',14500,90,'Casa','SECTOR SUR');
INSERT 
  INTO Vivienda (calle, numero, tipo_vivienda, codigo_postal, 
       metros, od_vivienda, nombre_zona)
  VALUES ('Guerra',2,'C',14500,150,'Casa','SUBURBIO TERMINAL');

-- Se inserta en la tablas Persona
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona, 
       dni_c, calle,numero)
  VALUES (44351312,'Juan','Pérez López','H',44351312,
         'Ronda de los Tejares',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (40806020,'María','García González','M',44351312,
         'Ronda de los Tejares',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (30605020,'Josefa','García Pérez','M',30605020,
         'Damasco',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (32602050,'Antonio','Fernández Fernández','H',30605020,
         'Damasco',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (80140620,'Antonio','García García','H',80140620,
         'Avenida América',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (80140621,'Antonia','Pérez López','M',80140620,
         'Avenida América',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70200200,'Antonio','García Pérez','H',80140620,
         'Avenida América',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70500150,'María','García Pérez','H',80140620,
         'Avenida América',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (30700200,'José','López García','H',30700200,
         'Saravia',3);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (60606070,'Pedro','Jiménez Cruz','H',60606070,
         'Damasco',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70800200,'Teresa','Gutiérrez Pérez','M',70800200,
         'Damasco',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (60696867,'Petra','Zafra Polo','M',60696867,
         'Cruz Conde',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (80806059,'María','González Muñoz','M',80806059,
         'La Paz',5);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (59607071,'Rafael','López López','M',59607071,
         'Avenida el Brillante',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70100506,'María Luisa','La Torre Espinosa','M',70100506,
         'Saravia',3);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (60302930,'Enrique','Pérez Sánchez','H',70100506,
         'Saravia',3);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (15304050,'Gonzalo','López Jiménez','H',15304050,
         'Avenida el Brillante',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (10203040,'Dolores','Cerruela Pérez','m',15304050,
         'Avenida el Brillante',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (20503080,'José','López Pérez','H',15304050,
         'Avenida el Brillante',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (10154060,'Teresa','Garrido Ortiz','M',10154060,
         'Urbanización las Lomas',53);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (30201505,'Juan','García Expósito','H',30201505,
         'Los Pinos',5);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (15060615,'Federico','Martín García','H',15060615,
         'El Palo',15);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (71800200,'Gonzalo','García García','H',71800200,
         'Felipe II',14);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70100501,'josé','López García','H',70100501,
         'Damasco',23);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70100502,'Gustavo','Cerruela García','H',70100502,
         'Damasco',24);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (71100501,'Pedro','García Jiménez','H',71100501,
         'Guerra',2);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (81140621,'José','Pérez López','H',81140621,
         'Avenida América',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (60607071,'Gonzalo','Pérez Polo','H',60607071,
         'Avenida el Brillante',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (67698760,'Maria','Polo Muñoz','M',67698760,
         'Cruz Conde',20);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (70001000,'Luis','Garrido López','H',70001000,
         'Felipe II',14);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (81807060,'José','Munoz Grrido','H',81807060,'La Paz',5);
INSERT 
  INTO Persona (dni,nombre_persona,apellidos_persona,od_persona,
       dni_c,calle,numero)
  VALUES (30306060,'Gonzalo','Castillo García','H',30306060,
         'Ronda de los Tejares',15);

-- Se inserta en la tabla BloqueCasas
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Cruz Conde',20,60,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Ronda de los Tejares',15,70,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Avenida América',20,100,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('La Paz',5,60,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Felipe II',14,70,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Avenida el Brillante',20,80,null);
INSERT 
  INTO BloqueCasas (calle, numero, metros_b, od_bloque)
  VALUES ('Damasco',20,80,null);

-- Se inserta en la tabla CasaParticular
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Avenida el Brillante',15,120,'Casa',15304050);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Urbanización las Lomas',53,200,'Chalet',10154060);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('El Palo',15,50,'',15060615);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Los Pinos',5,230,'',30201505);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Saravia',3,100,'',70100506);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Damasco',23,120,'',70100501);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Damasco',24,90,'',70100502);
INSERT 
  INTO CasaParticular (calle, numero, metros_c,od_casa,dni_cp)
  VALUES('Guerra',2,150,'',71100501);

-- Se inserta en la tablas Piso
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Cruz Conde',20,'B',1,'2',60,'',60696867);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Ronda de los Tejares',15,'2',2,'3',70,'',44351312);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Avenida América',20,'3',4,'1',100,'',80140620);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('La Paz',5,'1',2,'5',60,'',80806059);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Avenida el Brillante',20,'4',1,'2',80,'',59607071);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Damasco',20,'1',1,'3',40,'',32602050);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Damasco',20,'3',2,'2',70,'',60606070);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Damasco',20,'2',3,'1',50,'',70800200);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Felipe II',14,'2',3,'1',50,'',71800200);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Avenida América',20,'3',2,'1',90,'',81140621);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Avenida el Brillante',20,'4',2,'1',90,'',60607071);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Cruz Conde',20,'B',2,'1',75,'',67698760);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Felipe II',14,'2',2,'1',70,'',70001000);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('La Paz',5,'1',1,'2',60,'',81807060);
INSERT 
  INTO Piso (calle, numero, escalera, planta, puerta, metros_p, 
       od_piso, dni_p)
  VALUES('Ronda de los Tejares',15,'2',3,'1',75,'',30306060);

-- Se inserta en la tabla HabitaPiso
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (40806020,'Ronda de los Tejares',15,'2',2,'3');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (30605020,'Damasco',20,'1',1,'3');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (80140621,'Avenida América',20,'3',4,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (70200200,'Avenida América',20,'3',4,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (70500150,'Avenida América',20,'3',4,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (71800200,'Felipe II',14,'2',3,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (44351312,'Ronda de los Tejares',15,'2',2,'3');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (32602050,'Damasco',20,'1',1,'3');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (80140620,'Avenida América',20,'3',4,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (60606070,'Damasco',20,'3',2,'2');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (70800200,'Damasco',20,'2',3,'1');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (60696867,'Cruz Conde',20,'B',1,'2');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (80806059,'La Paz',5,'1',2,'5');
INSERT 
  INTO HabitaPiso (dni,calle,numero,escalera,planta,puerta)
  VALUES (59607071,'Avenida el Brillante',20,'4',1,'2');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(81140621,'Avenida América',20,'3',2,'1');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(60607071,'Avenida el Brillante',20,'4',2,'1');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(67698760,'Cruz Conde',20,'B',2,'1');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(70001000,'Felipe II',14,'2',2,'1');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(81807060,'La Paz',5,'1',1,'2');
INSERT 
  INTO HabitaPiso (dni,calle, numero, escalera, planta, puerta)
  VALUES(30306060,'Ronda de los Tejares',15,'2',3,'1');
