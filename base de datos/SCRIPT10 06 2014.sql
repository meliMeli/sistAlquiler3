SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
CREATE SCHEMA IF NOT EXISTS `alquilerhabitdb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`studio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`studio` (
  `id_studio` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phones` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`id_studio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cartoon_murder_mystery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cartoon_murder_mystery` (
  `id_cartoon_murder_mystery` INT NOT NULL,
  `adults_only` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cartoon_murder_mystery`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`muder_mystery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`muder_mystery` (
  `id_muder_mystery` INT NOT NULL,
  `weapon` VARCHAR(45) NULL,
  `id_cartoon_murder_mystery` INT NULL,
  PRIMARY KEY (`id_muder_mystery`),
  INDEX `FK_CARTOON_MURDER_MYSTERY_idx` (`id_cartoon_murder_mystery` ASC),
  CONSTRAINT `FK_CARTOON_MURDER_MYSTERY`
    FOREIGN KEY (`id_cartoon_murder_mystery`)
    REFERENCES `mydb`.`cartoon_murder_mystery` (`id_cartoon_murder_mystery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`star`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`star` (
  `id_stars` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `id_movie` INT NULL,
  INDEX `ID_MOVIE` (`id_movie` ASC),
  CONSTRAINT `FK_ID_MOVIE`
    FOREIGN KEY (`id_movie`)
    REFERENCES `mydb`.`movie` (`id_movie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cartoon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cartoon` (
  `id_cartoon` INT NOT NULL,
  `id_start` INT NULL,
  `id_cartoon_murder_mystery` INT NULL,
  PRIMARY KEY (`id_cartoon`),
  INDEX `FK_ID_START_idx` (`id_start` ASC),
  INDEX `FK_CARTOON_MURDER_MYSTERY_idx` (`id_cartoon_murder_mystery` ASC),
  CONSTRAINT `FK_ID_START`
    FOREIGN KEY (`id_start`)
    REFERENCES `mydb`.`star` (`id_stars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CARTOON_MURDER_MYSTERY`
    FOREIGN KEY (`id_cartoon_murder_mystery`)
    REFERENCES `mydb`.`cartoon_murder_mystery` (`id_cartoon_murder_mystery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `id_movie` INT NOT NULL,
  `year` VARCHAR(45) NULL,
  `title` VARCHAR(45) NULL,
  `length` VARCHAR(45) NULL,
  `film_type` VARCHAR(45) NULL,
  `id_studio` INT NULL,
  `id_murder_mystery` INT NULL,
  `id_cartoon` INT NULL,
  PRIMARY KEY (`id_movie`),
  INDEX `FK_ID_STUDIO_idx` (`id_studio` ASC),
  INDEX `FK_ID_MURDER_MYSTERY_idx` (`id_murder_mystery` ASC),
  INDEX `FK_CARTOON_idx` (`id_cartoon` ASC),
  CONSTRAINT `FK_ID_STUDIO`
    FOREIGN KEY (`id_studio`)
    REFERENCES `mydb`.`studio` (`id_studio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ID_MURDER_MYSTERY`
    FOREIGN KEY (`id_murder_mystery`)
    REFERENCES `mydb`.`muder_mystery` (`id_muder_mystery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CARTOON`
    FOREIGN KEY (`id_cartoon`)
    REFERENCES `mydb`.`cartoon` (`id_cartoon`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `alquilerhabitdb` ;

-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`usuario` (
  `idcliente` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `ocupacion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`ubicacion` (
  `idubicacion` INT(11) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `distrito` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idubicacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`cuarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`cuarto` (
  `idcuarto` INT(11) NOT NULL,
  `caracteristicas` VARCHAR(50) NOT NULL,
  `banio` VARCHAR(2) NOT NULL,
  `restricciones` VARCHAR(60) NOT NULL,
  `estado` VARCHAR(50) NOT NULL,
  `id_ubicacion` INT(11) NULL DEFAULT NULL,
  `id_arrendatario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcuarto`),
  INDEX `FK_UBICACION_idx` (`id_ubicacion` ASC),
  CONSTRAINT `FK_UBICACION`
    FOREIGN KEY (`id_ubicacion`)
    REFERENCES `alquilerhabitdb`.`ubicacion` (`idubicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`reserva` (
  `idreserva` INT(11) NOT NULL,
  `fecha` VARCHAR(25) NOT NULL,
  `tiempo` VARCHAR(30) NOT NULL,
  `monto` VARCHAR(30) NOT NULL,
  `id_cliente` INT(11) NULL DEFAULT NULL,
  `id_cuarto` INT(11) NULL DEFAULT NULL,
  `id_arrendatario` INT NULL,
  PRIMARY KEY (`idreserva`),
  INDEX `FK_CLIENTE_idx` (`id_cliente` ASC),
  INDEX `FK_CUARTO_idx` (`id_cuarto` ASC),
  CONSTRAINT `FK_CLIENTE`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `alquilerhabitdb`.`usuario` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CUARTO`
    FOREIGN KEY (`id_cuarto`)
    REFERENCES `alquilerhabitdb`.`cuarto` (`idcuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`comentarios` (
  `idhistorial` INT(11) NOT NULL,
  `calificacion` VARCHAR(40) NOT NULL,
  `comentarios` VARCHAR(100) NOT NULL,
  `recomendacion` VARCHAR(2) NOT NULL,
  `id_reserva` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idhistorial`),
  INDEX `FK_RESERVA_idx` (`id_reserva` ASC),
  CONSTRAINT `FK_RESERVA`
    FOREIGN KEY (`id_reserva`)
    REFERENCES `alquilerhabitdb`.`reserva` (`idreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `alquilerhabitdb`.`detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `alquilerhabitdb`.`detalle` (
  `iddetalle` INT(11) NOT NULL,
  `objetos` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  `idcuarto` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`iddetalle`),
  INDEX `FK_ID_CUARTO_idx` (`idcuarto` ASC),
  CONSTRAINT `FK_ID_CUARTO`
    FOREIGN KEY (`idcuarto`)
    REFERENCES `alquilerhabitdb`.`cuarto` (`idcuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
