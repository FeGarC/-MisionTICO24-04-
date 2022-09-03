-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MisionticO24-04
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MisionticO24-04
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MisionticO24-04` DEFAULT CHARACTER SET utf8 ;
USE `MisionticO24-04` ;

-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Paciente` (
  `cedula_pac` INT NOT NULL,
  `nombre_pac` VARCHAR(30) NOT NULL,
  `apellido_pac` VARCHAR(30) NOT NULL,
  `fecnac_pac` DATE NOT NULL,
  `facrh_pac` VARCHAR(30) NOT NULL,
  `tel_pac` VARCHAR(45) NOT NULL,
  `email_pac` VARCHAR(45) NOT NULL,
  `ciud_pac` VARCHAR(45) NOT NULL,
  `dir_pac` VARCHAR(45) NOT NULL,
  `eps_pac` VARCHAR(45) NOT NULL,
  `dep_pac` VARCHAR(45) NOT NULL,
  `tipoafili_pac` VARCHAR(45) NOT NULL,
  `pass_pac` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cedula_pac`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Medico` (
  `id_med` INT NOT NULL,
  `ced_med` INT NOT NULL,
  `nom_med` VARCHAR(45) NOT NULL,
  `ape_med` VARCHAR(45) NOT NULL,
  `tel_med` VARCHAR(45) NOT NULL,
  `email_med` VARCHAR(45) NOT NULL,
  `pass_med` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_med`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Operador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Operador` (
  `id_ope` INT NOT NULL,
  `ced_ope` INT NOT NULL,
  `nom_ope` VARCHAR(45) NOT NULL,
  `ape_ope` VARCHAR(45) NOT NULL,
  `contra_ope` VARCHAR(45) NOT NULL,
  `rol_ope` VARCHAR(45) NOT NULL,
  `emp_ope` VARCHAR(45) NOT NULL,
  `pass_ope` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_ope`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Horario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Horario` (
  `id_hor` INT NOT NULL AUTO_INCREMENT,
  `dia_hor` DATE NOT NULL,
  `horaent_hor` DATETIME NOT NULL,
  `horasal_hor` DATETIME NOT NULL,
  `id_med_hor` INT NOT NULL,
  PRIMARY KEY (`id_hor`),
  INDEX `med_hor_idx` (`id_med_hor` ASC) VISIBLE,
  CONSTRAINT `med_hor`
    FOREIGN KEY (`id_med_hor`)
    REFERENCES `MisionticO24-04`.`Medico` (`id_med`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Citas` (
  `id_cit` INT NOT NULL AUTO_INCREMENT,
  `id_pac_cit` INT NOT NULL,
  `id_med_cit` INT NOT NULL,
  `fecreg_cit` DATE NOT NULL,
  `fecha_cit` DATETIME NOT NULL,
  `cons_cit` INT NOT NULL,
  `estado_cit` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cit`),
  INDEX `med_cit_idx` (`id_med_cit` ASC) VISIBLE,
  INDEX `pac_cit_idx` (`id_pac_cit` ASC) VISIBLE,
  CONSTRAINT `med_cit`
    FOREIGN KEY (`id_med_cit`)
    REFERENCES `MisionticO24-04`.`Medico` (`id_med`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pac_cit`
    FOREIGN KEY (`id_pac_cit`)
    REFERENCES `MisionticO24-04`.`Paciente` (`cedula_pac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Medicamentos` (
  `id_medicam` INT NOT NULL,
  `nombre_medicam` VARCHAR(45) NOT NULL,
  `venc_medicam` DATE NOT NULL,
  `present_medicam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medicam`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MisionticO24-04`.`Prescripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MisionticO24-04`.`Prescripcion` (
  `id_presc` INT NOT NULL,
  `id_cit_presc` INT NOT NULL,
  `id_pac_presc` INT NOT NULL,
  `id_med_presc` INT NOT NULL,
  `id_medicam_presc` INT NOT NULL,
  `cant_presc` INT NOT NULL,
  `coment_presc` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id_presc`),
  INDEX `med_presc_idx` (`id_med_presc` ASC) VISIBLE,
  INDEX `pac_presc_idx` (`id_pac_presc` ASC) VISIBLE,
  INDEX `medicam_presc_idx` (`id_medicam_presc` ASC) VISIBLE,
  INDEX `cit_presc_idx` (`id_cit_presc` ASC) VISIBLE,
  CONSTRAINT `med_presc`
    FOREIGN KEY (`id_med_presc`)
    REFERENCES `MisionticO24-04`.`Medico` (`id_med`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pac_presc`
    FOREIGN KEY (`id_pac_presc`)
    REFERENCES `MisionticO24-04`.`Paciente` (`cedula_pac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `medicam_presc`
    FOREIGN KEY (`id_medicam_presc`)
    REFERENCES `MisionticO24-04`.`Medicamentos` (`id_medicam`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cit_presc`
    FOREIGN KEY (`id_cit_presc`)
    REFERENCES `MisionticO24-04`.`Citas` (`id_cit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
