-- MySQL Script generated by MySQL Workbench
-- Thu Nov  9 08:51:40 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema reclutamiento
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema reclutamiento
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `reclutamiento` DEFAULT CHARACTER SET utf8 ;
USE `reclutamiento` ;

-- -----------------------------------------------------
-- Table `reclutamiento`.`plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reclutamiento`.`plan` (
  `plan_id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL,
  `pricing` DOUBLE NULL,
  `paid_days` INT NOT NULL DEFAULT 30,
  `type` ENUM('SILVER', 'GOLD', 'PLATINUM') NULL DEFAULT 'SILVER',
  `status` INT NULL DEFAULT 1,
  `creation_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_by` VARCHAR(255) NULL DEFAULT 'unknow',
  `changed_by` VARCHAR(255) NULL DEFAULT 'unknow',
  `version` INT NULL DEFAULT 0,
  PRIMARY KEY (`plan_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reclutamiento`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reclutamiento`.`subscription` (
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `plan_id` INT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(150) NULL,
  `phone` VARCHAR(15) NULL,
  `next_payment_date` DATE NULL,
  `amount` DOUBLE NULL,
  `status` INT NULL DEFAULT 1,
  `creation_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `change_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_by` VARCHAR(255) NULL DEFAULT 'unknow',
  `changed_by` VARCHAR(255) NULL DEFAULT 'unknow',
  `version` INT NULL DEFAULT 0,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_plan_idx` (`plan_id` ASC),
  CONSTRAINT `fk_subscription_plan`
    FOREIGN KEY (`plan_id`)
    REFERENCES `reclutamiento`.`plan` (`plan_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
