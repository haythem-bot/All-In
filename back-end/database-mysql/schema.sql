-- MySQL Workbench Forward Engineering

 
-- -----------------------------------------------------
-- Schema all-in1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema all-in1
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `all-in1`;

CREATE SCHEMA IF NOT EXISTS `all-in1` ;
USE `all-in1` ;

-- -----------------------------------------------------
-- Table `all-in1`.`Admins`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Admins` (
  `admin_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`));



-- -----------------------------------------------------
-- Table `all-in1`.`Contributors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Contributors` (
  `contributor_id` INT NOT NULL AUTO_INCREMENT,
  `first name` VARCHAR(45) NOT NULL,
  `last name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(120) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`contributor_id`));




-- -----------------------------------------------------
-- Table `all-in1`.`donations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`donations` (
  `donation_id` INT NOT NULL AUTO_INCREMENT,
  `donation_name` VARCHAR(255) NULL,
  `type` VARCHAR(45) NULL,
  `status` VARCHAR(255) NOT NULL,
  `image_url` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `receiver_id` INT NOT NULL,
  `owner_id` INT NOT NULL,
  PRIMARY KEY (`donation_id`, `receiver_id`, `owner_id`),
  INDEX `fk_donations_Contributors1_idx` (`receiver_id` ASC) ,
  INDEX `fk_donations_Contributors2_idx` (`owner_id` ASC) ,
  CONSTRAINT `fk_donations_Contributors1`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `all-in1`.`Contributors` (`contributor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donations_Contributors2`
    FOREIGN KEY (`owner_id`)
    REFERENCES `all-in1`.`Contributors` (`contributor_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `all-in1`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Events` (
  `event_id` INT(20) NOT NULL,
  `eventName` VARCHAR(40) NOT NULL,
  `category` VARCHAR(40) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `socialMedia` VARCHAR(255) NULL,
  `amount` INT(255) NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`event_id`));



-- -----------------------------------------------------
-- Table `all-in1`.`Needs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Needs` (
  `need_id` INT NOT NULL AUTO_INCREMENT,
  `donation name` VARCHAR(255) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` FLOAT NOT NULL,
  `type` ENUM('money', 'goods') NOT NULL,
  PRIMARY KEY (`need_id`));




-- -----------------------------------------------------
-- Table `all-in1`.`Contributors_has_Needs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Contributors_has_Needs` (
  `owner_id` INT NOT NULL,
  `Needs_need_id` INT NOT NULL,
  `provider_id` INT NOT NULL,
  `amount` FLOAT NULL,
  PRIMARY KEY (`owner_id`, `Needs_need_id`, `provider_id`),
  INDEX `fk_Contributors_has_Needs_Needs1_idx` (`Needs_need_id` ASC) ,
  INDEX `fk_Contributors_has_Needs_Contributors1_idx` (`owner_id` ASC) ,
  INDEX `fk_Contributors_has_Needs_Contributors2_idx` (`provider_id` ASC) ,
  CONSTRAINT `fk_Contributors_has_Needs_Contributors1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `all-in1`.`Contributors` (`contributor_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contributors_has_Needs_Needs1`
    FOREIGN KEY (`Needs_need_id`)
    REFERENCES `all-in1`.`Needs` (`need_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contributors_has_Needs_Contributors2`
    FOREIGN KEY (`provider_id`)
    REFERENCES `all-in1`.`Contributors` (`contributor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `all-in1`.`Contributors_has_Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `all-in1`.`Contributors_has_Events` (
  `Contributors_contributor_id` INT NOT NULL,
  `Events_event_id` INT(20) NOT NULL,
  PRIMARY KEY (`Contributors_contributor_id`, `Events_event_id`),
  INDEX `fk_Contributors_has_Events_Events1_idx` (`Events_event_id` ASC) ,
  INDEX `fk_Contributors_has_Events_Contributors1_idx` (`Contributors_contributor_id` ASC) ,
  CONSTRAINT `fk_Contributors_has_Events_Contributors1`
    FOREIGN KEY (`Contributors_contributor_id`)
    REFERENCES `all-in1`.`Contributors` (`contributor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contributors_has_Events_Events1`
    FOREIGN KEY (`Events_event_id`)
    REFERENCES `all-in1`.`Events` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


