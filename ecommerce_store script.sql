-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce_store` DEFAULT CHARACTER SET utf8 ;
USE `ecommerce_store` ;

-- -----------------------------------------------------
-- Table `ecommerce_store`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_store`.`CUSTOMER` (
  `CUSTOMER_ID` INT NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` VARCHAR(45) NOT NULL,
  `LAST_NAME` VARCHAR(45) NOT NULL,
  `ADDRESS` VARCHAR(100) NOT NULL,
  `CITY` VARCHAR(45) NOT NULL,
  `STATE` VARCHAR(45) NOT NULL,
  `COUNTRY` VARCHAR(45) NOT NULL,
  `ZIPCODE` VARCHAR(45) NOT NULL,
  `PHONE_NUMBER` VARCHAR(15) NOT NULL,
  `CUSTOMER_EMAIL` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CUSTOMER_ID`),
  UNIQUE INDEX `CUSTOMER_EMAIL_UNIQUE` (`CUSTOMER_EMAIL` ASC) VISIBLE,
  UNIQUE INDEX `PHONE_NUMBER_UNIQUE` (`PHONE_NUMBER` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_store`.`PRODUCT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_store`.`PRODUCT` (
  `PRODUCT_ID` INT NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` VARCHAR(200) NOT NULL,
  `PRODUCT_TYPE` VARCHAR(100) NOT NULL,
  `PRICE` VARCHAR(45) NOT NULL,
  `QUANTITY` INT NOT NULL,
  PRIMARY KEY (`PRODUCT_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_store`.`PAYMENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_store`.`PAYMENTS` (
  `PAYMENT_ID` INT NOT NULL AUTO_INCREMENT,
  `CUSTOMER_ID` INT NOT NULL,
  `PAYMENT_TYPE` VARCHAR(45) NOT NULL,
  `CREDIT_CARD_NUMBER` INT NOT NULL,
  `EXPIRY_DATE` DATE NOT NULL,
  `CVV` INT NOT NULL,
  `EMAIL_ID` VARCHAR(100) NULL,
  PRIMARY KEY (`PAYMENT_ID`),
  INDEX `CUSTOMER_ID_FK1_idx` (`CUSTOMER_ID` ASC) VISIBLE,
  CONSTRAINT `CUSTOMER_ID_FK1`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `ecommerce_store`.`CUSTOMER` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce_store`.`ORDERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce_store`.`ORDERS` (
  `ORDER_ID` INT NOT NULL AUTO_INCREMENT,
  `DEVICE` VARCHAR(45) NOT NULL,
  `PRODUCT_ID` INT NOT NULL,
  `CUSTOMER_ID` INT NOT NULL,
  `PAYMENT_ID` INT NOT NULL,
  `SHIPPING_ADDRESS` VARCHAR(100) NOT NULL,
  `SHIPPING_CITY` VARCHAR(100) NOT NULL,
  `SHIPPING_STATE` CHAR(50) NOT NULL,
  `SHIPPING_COUNTRY` VARCHAR(100) NOT NULL,
  `DELIVERED` CHAR(5) NULL DEFAULT 'NO',
  PRIMARY KEY (`ORDER_ID`),
  INDEX `PRODUCT_ID_idx` (`PRODUCT_ID` ASC) VISIBLE,
  INDEX `CUSTOMER_ID_idx` (`CUSTOMER_ID` ASC) VISIBLE,
  INDEX `PAYMENT_ID_idx` (`PAYMENT_ID` ASC) VISIBLE,
  CONSTRAINT `PRODUCT_ID`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `ecommerce_store`.`PRODUCT` (`PRODUCT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CUSTOMER_ID`
    FOREIGN KEY (`CUSTOMER_ID`)
    REFERENCES `ecommerce_store`.`CUSTOMER` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PAYMENT_ID`
    FOREIGN KEY (`PAYMENT_ID`)
    REFERENCES `ecommerce_store`.`PAYMENTS` (`PAYMENT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
