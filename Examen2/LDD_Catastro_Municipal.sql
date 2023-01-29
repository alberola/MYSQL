create database catastro_municipal;
use catastro_municipal;


/* Se crean las tablas del esquema propuesto */
CREATE TABLE ZonaUrbana (
  nombre_zona VARCHAR(20) NOT NULL,
  od_zona LONG, 
    CONSTRAINT  pk_zon 
      PRIMARY KEY (nombre_zona), 
    CONSTRAINT  ck_zon 
      CHECK (nombre_zona = UPPER(nombre_zona)) );
CREATE TABLE Vivienda (
  calle VARCHAR(40) NOT NULL,
  numero int(3) NOT NULL,
  tipo_vivienda VARCHAR(1), 
  codigo_postal int(5), 
  metros int(5), 
  od_vivienda LONG, 
  nombre_zona VARCHAR(20) NOT NULL, 
    CONSTRAINT  pk_viv 
      PRIMARY KEY (calle, numero), 
    CONSTRAINT  ck_num 
      CHECK (numero > 0), 
    CONSTRAINT  ck_tv 
      CHECK (tipo_vivienda IN ('C', 'B')),
    CONSTRAINT  fk_viv_zon 
      FOREIGN KEY (nombre_zona) 
      REFERENCES ZonaUrbana(nombre_zona) );
CREATE TABLE Persona (
  dni int(8) NOT NULL,
  nombre_persona VARCHAR(20) NOT NULL,
  apellidos_persona VARCHAR(40) NOT NULL,
  od_persona LONG, 
  dni_c int(8) NOT NULL, 
  calle VARCHAR(30) NOT NULL,
  numero int(3) NOT NULL,
    CONSTRAINT  pk_per 
      PRIMARY KEY (dni),
    CONSTRAINT  fk_per_viv 
      FOREIGN KEY (calle, numero) 
      REFERENCES Vivienda(calle, numero), 
    CONSTRAINT  fk_per_per 
      FOREIGN KEY (dni_c) 
      REFERENCES Persona(dni) );
CREATE TABLE BloqueCasas (
  calle VARCHAR(30) NOT NULL,
  numero int(3) NOT NULL,
  metros_b int(4), 
  od_bloque LONG, 
    CONSTRAINT  pk_blo 
      PRIMARY KEY (calle, numero), 
    CONSTRAINT  fk_blo_viv 
      FOREIGN KEY (calle, numero) 
      REFERENCES Vivienda(calle, numero)
      ON DELETE CASCADE, 
    CONSTRAINT  ck_mb 
      CHECK (metros_b > 0) );
CREATE TABLE CasaParticular (
  calle VARCHAR(30) NOT NULL,
  numero int(3) NOT NULL,
  metros_c int(4), 
  od_casa LONG, 
  dni_cp int(8) NOT NULL, 
    CONSTRAINT  pk_cas 
      PRIMARY KEY (calle, numero), 
    CONSTRAINT  fk_cas_per 
      FOREIGN KEY (dni_cp) 
      REFERENCES Persona(dni),
    CONSTRAINT  fk_cas_viv 
      FOREIGN KEY (calle, numero) 
      REFERENCES Vivienda(calle, numero)
      ON DELETE CASCADE, 
    CONSTRAINT  ck_mt 
      CHECK (metros_c > 0) );
CREATE TABLE Piso (
  calle VARCHAR(30) NOT NULL,
  numero int(3) NOT NULL,
  escalera VARCHAR(1) NOT NULL, 
  planta int(2) NOT NULL, 
  puerta VARCHAR(2) NOT NULL, 
  metros_p int(3), 
  od_piso LONG, 
  dni_p int(8) NOT NULL, 
    CONSTRAINT  pk_pis 
      PRIMARY KEY (calle, numero, escalera, planta, puerta), 
    CONSTRAINT  ck_mep 
      CHECK (metros_p > 0), 
    CONSTRAINT  fk_pis_blo 
      FOREIGN KEY (calle, numero) 
      REFERENCES BloqueCasas(calle, numero)
      ON DELETE CASCADE, 
    CONSTRAINT  fk_pis_per 
      FOREIGN KEY (dni_p) 
      REFERENCES Persona(dni) );
CREATE TABLE HabitaPiso (
  dni int(8) NOT NULL,
  calle VARCHAR(30) NOT NULL,
  numero int(3) NOT NULL,
  escalera VARCHAR(1) NOT NULL, 
  planta int(2) NOT NULL, 
  puerta VARCHAR(2) NOT NULL, 
    CONSTRAINT  pk_hap 
      PRIMARY KEY (dni), 
    CONSTRAINT  fk_hap_cas 
      FOREIGN KEY (calle, numero, escalera, planta, puerta) 
      REFERENCES Piso(calle, numero, escalera, planta, puerta) 
      ON DELETE CASCADE, 
    CONSTRAINT  fk_hbp_per 
      FOREIGN KEY (dni) 
      REFERENCES Persona(dni) 
      ON DELETE CASCADE );
