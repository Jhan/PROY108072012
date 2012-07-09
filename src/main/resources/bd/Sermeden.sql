SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `sermeden` DEFAULT CHARACTER SET latin1 ;
USE `sermeden` ;

-- -----------------------------------------------------
-- Table `sermeden`.`tbl_persona`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_persona` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `DNI` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `NOMBRE` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `APELLIDO` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_cita`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_cita` (
  `ID` INT(11) NOT NULL ,
  `FK_PERSONA` INT(11) NOT NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `FK_CITA_PER` (`FK_PERSONA` ASC) ,
  CONSTRAINT `FK_CITA_PER`
    FOREIGN KEY (`FK_PERSONA` )
    REFERENCES `sermeden`.`tbl_persona` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_paciente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_paciente` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `EMAIL` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `TEL_FIJO` VARCHAR(12) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `TEL_CEL` VARCHAR(12) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `ENFERMEDAD` VARCHAR(250) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL ,
  `ALERGIA` VARCHAR(250) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `FK_PAC_PER` (`ID` ASC) ,
  CONSTRAINT `FK_PAC_PER`
    FOREIGN KEY (`ID` )
    REFERENCES `sermeden`.`tbl_persona` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_rol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_rol` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `DESCRIPCION` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_usuario` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT ,
  `USUARIO` VARCHAR(12) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `CONTRASENHA` VARCHAR(12) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `ESTADO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL DEFAULT 'ACTIVO' ,
  `FK_PERSONA` INT(11) NOT NULL ,
  `FK_ROL` INT(11) NULL DEFAULT NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `FK_USU_PER` (`FK_PERSONA` ASC) ,
  INDEX `FK_USU_ROL` (`FK_ROL` ASC) ,
  CONSTRAINT `FK_USU_PER`
    FOREIGN KEY (`FK_PERSONA` )
    REFERENCES `sermeden`.`tbl_persona` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_USU_ROL`
    FOREIGN KEY (`FK_ROL` )
    REFERENCES `sermeden`.`tbl_rol` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_medico`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_medico` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `ESTADO` CHAR(1) NULL ,
  PRIMARY KEY (`ID`) ,
  INDEX `FK_MEDICO_PERSONA` (`ID` ASC) ,
  CONSTRAINT `FK_MEDICO_PERSONA`
    FOREIGN KEY (`ID` )
    REFERENCES `sermeden`.`tbl_persona` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_medico_paciente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_medico_paciente` (
  `IDMEDICO` INT NOT NULL ,
  `IDPACIENTE` INT(11) NOT NULL ,
  PRIMARY KEY (`IDMEDICO`, `IDPACIENTE`) ,
  INDEX `fk_tbl_medico_has_tbl_paciente_tbl_paciente1` (`IDPACIENTE` ASC) ,
  INDEX `fk_tbl_medico_has_tbl_paciente_tbl_medico1` (`IDMEDICO` ASC) ,
  CONSTRAINT `fk_tbl_medico_has_tbl_paciente_tbl_medico1`
    FOREIGN KEY (`IDMEDICO` )
    REFERENCES `sermeden`.`tbl_medico` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_medico_has_tbl_paciente_tbl_paciente1`
    FOREIGN KEY (`IDPACIENTE` )
    REFERENCES `sermeden`.`tbl_paciente` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_historia_clinica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_historia_clinica` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `IDPACIENTE` INT(11) NOT NULL ,
  PRIMARY KEY (`ID`, `IDPACIENTE`) ,
  INDEX `fk_tbl_historia_clinica_tbl_paciente1` (`IDPACIENTE` ASC) ,
  CONSTRAINT `fk_tbl_historia_clinica_tbl_paciente1`
    FOREIGN KEY (`IDPACIENTE` )
    REFERENCES `sermeden`.`tbl_paciente` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_estomatologica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_estomatologica` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `IDHC` INT NOT NULL ,
  PRIMARY KEY (`ID`, `IDHC`) ,
  INDEX `fk_tbl_estomatologica_tbl_historia_clinica1` (`IDHC` ASC) ,
  CONSTRAINT `fk_tbl_estomatologica_tbl_historia_clinica1`
    FOREIGN KEY (`IDHC` )
    REFERENCES `sermeden`.`tbl_historia_clinica` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_incidencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_incidencia` (
  `ID` INT NOT NULL ,
  `NOMBRE` VARCHAR(30) NULL ,
  `NIVEL_USO` INT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sermeden`.`tbl_diente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sermeden`.`tbl_diente` (
  `ID` INT NOT NULL AUTO_INCREMENT ,
  `IDESTOM` INT NOT NULL ,
  `NRO` INT NULL ,
  `TIPO` INT NULL ,
  `ESTADO` INT NULL ,
  `INCIDENCIA` INT NULL ,
  `S1_INC` INT NULL ,
  `S1_EST` INT NULL ,
  `S2_INC` INT NULL ,
  `S2_EST` INT NULL ,
  `S3_INC` INT NULL ,
  `S3_EST` INT NULL ,
  `S4_INC` INT NULL ,
  `S4_EST` INT NULL ,
  `S5_INC` INT NULL ,
  `S5_EST` VARCHAR(45) NULL ,
  `LD_INC` INT NULL ,
  `LD_EST` INT NULL ,
  `LI_INC` INT NULL ,
  `LI_EST` INT NULL ,
  PRIMARY KEY (`ID`, `IDESTOM`) ,
  INDEX `fk_DIENTE_tbl_estomatologica1` (`IDESTOM` ASC) ,
  INDEX `FK_S1_INC` (`S1_INC` ASC) ,
  INDEX `FK_S2_INC` (`S2_INC` ASC) ,
  INDEX `FK_S3_INC` (`S3_INC` ASC) ,
  INDEX `FK_S4_INC` (`S4_INC` ASC) ,
  INDEX `FK_LD_INC` (`LD_INC` ASC) ,
  INDEX `FK_LI_INC` (`LI_INC` ASC) ,
  INDEX `FK_S5_INC` (`S5_INC` ASC) ,
  CONSTRAINT `fk_DIENTE_tbl_estomatologica1`
    FOREIGN KEY (`IDESTOM` )
    REFERENCES `sermeden`.`tbl_estomatologica` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_S1_INC`
    FOREIGN KEY (`S1_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_S2_INC`
    FOREIGN KEY (`S2_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_S3_INC`
    FOREIGN KEY (`S3_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_S4_INC`
    FOREIGN KEY (`S4_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LD_INC`
    FOREIGN KEY (`LD_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LI_INC`
    FOREIGN KEY (`LI_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_S5_INC`
    FOREIGN KEY (`S5_INC` )
    REFERENCES `sermeden`.`tbl_incidencia` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_persona`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (1, '72556655', 'JHAN', 'ROJAS');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (2, '44562211', 'MANUEL', 'EGUILUZ');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (3, '22554444', 'JIMY', 'HUASUPOMA');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (4, '52455166', 'JACOB', 'DIAZ');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (5, '44455221', 'ROSA', 'ESCATE DEL ARCA');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (6, '22545532', 'GISELA', 'ESCOBAR');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (7, '44521235', 'PEDRO', 'HUANCO');
INSERT INTO `sermeden`.`tbl_persona` (`ID`, `DNI`, `NOMBRE`, `APELLIDO`) VALUES (8, '11223345', 'CAROLINE', 'BERMEO MOLINA');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_paciente` (`ID`, `EMAIL`, `TEL_FIJO`, `TEL_CEL`, `ENFERMEDAD`, `ALERGIA`) VALUES (5, 'rescate@gmail.com', '6615544', '98665332', NULL, NULL);
INSERT INTO `sermeden`.`tbl_paciente` (`ID`, `EMAIL`, `TEL_FIJO`, `TEL_CEL`, `ENFERMEDAD`, `ALERGIA`) VALUES (6, 'gescobar@gmail.com', '3325555', '91554633', NULL, NULL);
INSERT INTO `sermeden`.`tbl_paciente` (`ID`, `EMAIL`, `TEL_FIJO`, `TEL_CEL`, `ENFERMEDAD`, `ALERGIA`) VALUES (7, 'phuanco@gmail.com', '8886649', '94521254', NULL, NULL);
INSERT INTO `sermeden`.`tbl_paciente` (`ID`, `EMAIL`, `TEL_FIJO`, `TEL_CEL`, `ENFERMEDAD`, `ALERGIA`) VALUES (8, 'cbermeo@gmail.com', '7889554', '94567221', NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_rol`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_rol` (`ID`, `DESCRIPCION`) VALUES (1, 'ROLE_PACIENTE');
INSERT INTO `sermeden`.`tbl_rol` (`ID`, `DESCRIPCION`) VALUES (2, 'ROLE_RECEPCIONISTA');
INSERT INTO `sermeden`.`tbl_rol` (`ID`, `DESCRIPCION`) VALUES (3, 'ROLE_MEDICO');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_usuario` (`ID`, `USUARIO`, `CONTRASENHA`, `ESTADO`, `FK_PERSONA`, `FK_ROL`) VALUES (1, 'jrojas', 'jhan', 'ACTIVADO', 1, 3);
INSERT INTO `sermeden`.`tbl_usuario` (`ID`, `USUARIO`, `CONTRASENHA`, `ESTADO`, `FK_PERSONA`, `FK_ROL`) VALUES (2, 'meguiluz', 'manuel', 'ACTIVADO', 2, 2);
INSERT INTO `sermeden`.`tbl_usuario` (`ID`, `USUARIO`, `CONTRASENHA`, `ESTADO`, `FK_PERSONA`, `FK_ROL`) VALUES (3, 'jhuasupoma', 'jimy', 'ACTIVADO', 3, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_medico`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_medico` (`ID`, `ESTADO`) VALUES (1, 'D');

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_medico_paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_medico_paciente` (`IDMEDICO`, `IDPACIENTE`) VALUES (1, 5);
INSERT INTO `sermeden`.`tbl_medico_paciente` (`IDMEDICO`, `IDPACIENTE`) VALUES (1, 6);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_historia_clinica`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_historia_clinica` (`ID`, `IDPACIENTE`) VALUES (1, 5);
INSERT INTO `sermeden`.`tbl_historia_clinica` (`ID`, `IDPACIENTE`) VALUES (2, 6);
INSERT INTO `sermeden`.`tbl_historia_clinica` (`ID`, `IDPACIENTE`) VALUES (3, 7);
INSERT INTO `sermeden`.`tbl_historia_clinica` (`ID`, `IDPACIENTE`) VALUES (4, 8);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_estomatologica`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_estomatologica` (`ID`, `IDHC`) VALUES (1, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_incidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (1, 'CARIES', 2);
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (2, 'CORONA TEMPORAL', 0);
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (3, 'CORONA COMPLETA', 0);
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (4, 'DIENTE AUSENTE', 0);
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (5, 'DIASTEMA', 1);
INSERT INTO `sermeden`.`tbl_incidencia` (`ID`, `NOMBRE`, `NIVEL_USO`) VALUES (6, 'RESTAURACION', 2);

COMMIT;

-- -----------------------------------------------------
-- Data for table `sermeden`.`tbl_diente`
-- -----------------------------------------------------
START TRANSACTION;
USE `sermeden`;
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (1, 1, 1, 4, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (2, 1, 2, 4, 0, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (3, 1, 3, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (4, 1, 4, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (5, 1, 5, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (6, 1, 6, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (7, 1, 7, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (8, 1, 8, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (9, 1, 9, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (10, 1, 10, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (11, 1, 11, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (12, 1, 12, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (13, 1, 13, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (14, 1, 14, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (15, 1, 15, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (16, 1, 16, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (17, 1, 17, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (18, 1, 18, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (19, 1, 19, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (20, 1, 20, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (21, 1, 21, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (22, 1, 22, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (23, 1, 23, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (24, 1, 24, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (25, 1, 25, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (26, 1, 26, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (27, 1, 27, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (28, 1, 28, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (29, 1, 29, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (30, 1, 30, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (31, 1, 31, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sermeden`.`tbl_diente` (`ID`, `IDESTOM`, `NRO`, `TIPO`, `ESTADO`, `INCIDENCIA`, `S1_INC`, `S1_EST`, `S2_INC`, `S2_EST`, `S3_INC`, `S3_EST`, `S4_INC`, `S4_EST`, `S5_INC`, `S5_EST`, `LD_INC`, `LD_EST`, `LI_INC`, `LI_EST`) VALUES (32, 1, 32, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;
