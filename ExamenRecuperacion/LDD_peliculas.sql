-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema peliculas_20-21
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema peliculas_20-21
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `peliculas_20-21` DEFAULT CHARACTER SET utf8 ;
USE `peliculas_20-21` ;







-- -----------------------------------------------------
-- Table `peliculas_20-21`.`cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`cine` (
  `cine` VARCHAR(25) NOT NULL,
  `ciudad_cine` VARCHAR(25) NULL DEFAULT NULL,
  `direccion_cine` VARCHAR(65) NULL DEFAULT NULL,
  PRIMARY KEY (`cine`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_20-21`.`tarea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`tarea` (
  `tarea` VARCHAR(30) NOT NULL,
  `sexo_tarea` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`tarea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;






-- -----------------------------------------------------
-- Table `peliculas_20-21`.`pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`pelicula` (
  `cip` VARCHAR(10) NOT NULL,
  `titulo_p` VARCHAR(45) NOT NULL,
  `ano_produccion` INT(4) NOT NULL,
  `titulo_s` VARCHAR(45) NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(15) NULL DEFAULT NULL,
  `presupuesto` INT(11) NULL DEFAULT NULL,
  `duracion` INT(3) NULL DEFAULT NULL,
  PRIMARY KEY (`cip`),
  UNIQUE INDEX `ck_cip` (`titulo_p` ASC, `ano_produccion` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_20-21`.`personaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`personaje` (
  `nombre_persona` VARCHAR(25) NOT NULL,
  `nacionalidad_persona` VARCHAR(15) NULL DEFAULT NULL,
  `sexo_persona` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`nombre_persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_20-21`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`sala` (
  `cine` VARCHAR(25) NOT NULL,
  `sala` INT(2) NOT NULL,
  `aforo` INT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`cine`, `sala`),
  CONSTRAINT `fk_sal_cin`
    FOREIGN KEY (`cine`)
    REFERENCES `peliculas_20-21`.`cine` (`cine`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_20-21`.`proyeccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`proyeccion` (
  `cine` VARCHAR(25) NOT NULL,
  `sala` INT(2) NOT NULL,
  `cip` VARCHAR(10) NOT NULL,
  `fecha_estreno` DATE NOT NULL,
  `dias_estreno` INT(3) NULL DEFAULT NULL,
  `espectadores` INT(6) NULL DEFAULT NULL,
  `recaudacion` INT(8) NULL DEFAULT NULL,
  PRIMARY KEY (`cine`, `sala`, `cip`, `fecha_estreno`),
  INDEX `fk_pro_pel` (`cip` ASC),
  CONSTRAINT `fk_pro_pel`
    FOREIGN KEY (`cip`)
    REFERENCES `peliculas_20-21`.`pelicula` (`cip`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_pro_sal`
    FOREIGN KEY (`cine` , `sala`)
    REFERENCES `peliculas_20-21`.`sala` (`cine` , `sala`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `peliculas_20-21`.`trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peliculas_20-21`.`trabajo` (
  `cip` VARCHAR(10) NOT NULL,
  `nombre_persona` VARCHAR(25) NOT NULL,
  `tarea` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`cip`, `nombre_persona`, `tarea`),
  INDEX `fk_tra_per` (`nombre_persona` ASC),
  INDEX `fk_tra_tar` (`tarea` ASC),
  CONSTRAINT `fk_Tra_Pel`
    FOREIGN KEY (`cip`)
    REFERENCES `peliculas_20-21`.`pelicula` (`cip`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_tra_per`
    FOREIGN KEY (`nombre_persona`)
    REFERENCES `peliculas_20-21`.`personaje` (`nombre_persona`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_tra_tar`
    FOREIGN KEY (`tarea`)
    REFERENCES `peliculas_20-21`.`tarea` (`tarea`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
