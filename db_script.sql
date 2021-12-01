-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `deployment_exam2` ;

-- -----------------------------------------------------
-- Schema deployment_exam2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `deployment_exam2` DEFAULT CHARACTER SET utf8 ;


USE `deployment_exam2` ;

-- -----------------------------------------------------
-- Table `deployment_exam2`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deployment_exam2`.`users` ;

CREATE TABLE IF NOT EXISTS `deployment_exam2`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `deployment_exam2`.`cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `deployment_exam2`.`cars` ;

CREATE TABLE IF NOT EXISTS `deployment_exam2`.`cars` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `model` VARCHAR(255) NULL DEFAULT NULL,
  `make` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL,
  `price` DECIMAL(13,2) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  `users_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cars_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_cars_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `deployment_exam2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
