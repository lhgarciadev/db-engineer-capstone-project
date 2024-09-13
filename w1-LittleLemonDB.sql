-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customerdetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customerdetails` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `ContactNumber` VARCHAR(15) NOT NULL,
  `EmailAddress` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `CustomerID` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `bookings_ibfk_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`customerdetails` (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(100) NOT NULL,
  `Starter` VARCHAR(100) NOT NULL,
  `MainCourse` VARCHAR(100) NOT NULL,
  `Drinks` VARCHAR(100) NOT NULL,
  `Desserts` VARCHAR(100) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `StaffID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Role` VARCHAR(50) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `BookingID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `BookingID` (`BookingID` ASC) VISIBLE,
  INDEX `StaffID` (`StaffID` ASC) VISIBLE,
  INDEX `MenuID` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`bookings` (`BookingID`),
  CONSTRAINT `orders_ibfk_2`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`staff` (`StaffID`),
  CONSTRAINT `orders_ibfk_3`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`menu` (`MenuID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orderdeliverystatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orderdeliverystatus` (
  `DeliveryID` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `OrderID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `OrderID` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `orderdeliverystatus_ibfk_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`orders` (`OrderID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
