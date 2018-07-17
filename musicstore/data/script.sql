-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mvcmusicstore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mvcmusicstore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mvcmusicstore` DEFAULT CHARACTER SET latin1 ;
USE `mvcmusicstore` ;

-- -----------------------------------------------------
-- Table `mvcmusicstore`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`genre` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`genre` (
  `GenreId` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Description` VARCHAR(4000) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`GenreId`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`artist` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`artist` (
  `ArtistId` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`ArtistId`))
ENGINE = InnoDB
AUTO_INCREMENT = 279
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`album` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`album` (
  `AlbumId` INT(11) NOT NULL AUTO_INCREMENT,
  `GenreId` INT(11) NOT NULL,
  `ArtistId` INT(11) NOT NULL,
  `Title` VARCHAR(160) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  `AlbumArtUrl` VARCHAR(1024) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT 'D:\Code\MvcMusicStore-v3.0\MvcMusicStore-Assets\Content\Images\placeholder.gif',
  PRIMARY KEY (`AlbumId`),
  INDEX `FK_Album_Genre_idx` (`GenreId` ASC),
  INDEX `FK__Album__ArtistId__276EDEB3_idx` (`ArtistId` ASC),
  CONSTRAINT `FK_Album_Genre`
    FOREIGN KEY (`GenreId`)
    REFERENCES `mvcmusicstore`.`genre` (`GenreId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Album__ArtistId__276EDEB3`
    FOREIGN KEY (`ArtistId`)
    REFERENCES `mvcmusicstore`.`artist` (`ArtistId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 720
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`user` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(100) NULL DEFAULT NULL,
  `confirmpassword` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`cart`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`cart` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`cart` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `AlbumId` INT(11) NOT NULL,
  `UserId` INT(11) NOT NULL,
  `Count` INT(11) NOT NULL,
  `DateCreated` DATETIME NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `FK_Cart_Album_idx` (`AlbumId` ASC),
  INDEX `FK_Cart_User_idx` (`UserId` ASC),
  CONSTRAINT `FK_Cart_Album`
    FOREIGN KEY (`AlbumId`)
    REFERENCES `mvcmusicstore`.`album` (`AlbumId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cart_User`
    FOREIGN KEY (`UserId`)
    REFERENCES `mvcmusicstore`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`hibernate_sequence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`hibernate_sequence` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`hibernate_sequence` (
  `next_val` BIGINT(20) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`orders` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`orders` (
  `OrderId` INT(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` DATETIME NOT NULL,
  `UserName` VARCHAR(256) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `FirstName` VARCHAR(160) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `LastName` VARCHAR(160) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Address` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `City` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `State` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Country` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Phone` VARCHAR(24) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Email` VARCHAR(160) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`orderdetail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`orderdetail` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`orderdetail` (
  `OrderDetailId` INT(11) NOT NULL AUTO_INCREMENT,
  `OrderId` INT(11) NOT NULL,
  `AlbumId` INT(11) NOT NULL,
  `Quantity` INT(11) NOT NULL,
  `UnitPrice` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`OrderDetailId`),
  INDEX `FK__InvoiceLi__Invoi__2F10007B_idx` (`OrderId` ASC),
  INDEX `FK_InvoiceLine_Album_idx` (`AlbumId` ASC),
  CONSTRAINT `FK_InvoiceLine_Album`
    FOREIGN KEY (`AlbumId`)
    REFERENCES `mvcmusicstore`.`album` (`AlbumId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__InvoiceLi__Invoi__2F10007B`
    FOREIGN KEY (`OrderId`)
    REFERENCES `mvcmusicstore`.`orders` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`role` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `mvcmusicstore`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mvcmusicstore`.`user_role` ;

CREATE TABLE IF NOT EXISTS `mvcmusicstore`.`user_role` (
  `user_id` INT(11) NOT NULL,
  `role_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
