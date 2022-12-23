-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema postoInflamavel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema postoInflamavel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `postoInflamavel` DEFAULT CHARACTER SET utf8 ;
USE `postoInflamavel` ;

-- -----------------------------------------------------
-- Table `postoInflamavel`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Empregado` (
  `CPF` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `nomeSocial` VARCHAR(60) NULL,
  `sexo` CHAR(1) NOT NULL,
  `salario` DECIMAL(6,2) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `email` VARCHAR(45) NULL,
  `dataAdm` DATETIME NOT NULL,
  `dataDem` DATETIME NULL,
  `statusEmp` TINYINT NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Endereco` (
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(60) NOT NULL,
  `numero` INT NOT NULL,
  `comp` VARCHAR(45) NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`Empregado_CPF`),
  CONSTRAINT `fk_Endereco_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Ferias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Ferias` (
  `idFerias` INT NOT NULL AUTO_INCREMENT,
  `anoRef` YEAR(4) NOT NULL,
  `dataIni` DATE NOT NULL,
  `dataFim` DATE NOT NULL,
  `qtdDias` INT NOT NULL,
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idFerias`, `Empregado_CPF`),
  CONSTRAINT `fk_Ferias_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Dependente` (
  `cpf` VARCHAR(14) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `dataNasc` DATE NOT NULL,
  `parentesco` VARCHAR(15) NOT NULL,
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`cpf`, `Empregado_CPF`),
  INDEX `fk_Dependente_Empregado1_idx` (`Empregado_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Gerente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Gerente` (
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  `funcaoGrat` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Empregado_CPF`),
  CONSTRAINT `fk_Gerente_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `localDep` VARCHAR(45) NOT NULL,
  `horario` VARCHAR(45) NOT NULL,
  `Gerente_Empregado_CPF` VARCHAR(14) NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `fk_Departamento_Gerente1_idx` (`Gerente_Empregado_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Gerente1`
    FOREIGN KEY (`Gerente_Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Gerente` (`Empregado_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Vendas` (
  `idVendas` INT NOT NULL AUTO_INCREMENT,
  `dataVenda` DATETIME NOT NULL,
  `valorTotal` DECIMAL(7,2) NOT NULL,
  `desconto` DECIMAL(4,2) ZEROFILL NULL,
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idVendas`),
  INDEX `fk_Vendas_Empregado1_idx` (`Empregado_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`FormaPag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`FormaPag` (
  `idFormaPag` INT NOT NULL AUTO_INCREMENT,
  `tipoPag` VARCHAR(45) NOT NULL,
  `valorPag` DECIMAL(7,2) NOT NULL,
  `qtdParcelas` INT NULL,
  `Vendas_idVendas` INT NOT NULL,
  INDEX `fk_FormaPag_Vendas1_idx` (`Vendas_idVendas` ASC) VISIBLE,
  PRIMARY KEY (`idFormaPag`),
  CONSTRAINT `fk_FormaPag_Vendas1`
    FOREIGN KEY (`Vendas_idVendas`)
    REFERENCES `postoInflamavel`.`Vendas` (`idVendas`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Estoque` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `codigoBarra` VARCHAR(80) NOT NULL,
  `valor` DECIMAL(7,2) ZEROFILL NOT NULL,
  `quantidade` DECIMAL(7,2) UNSIGNED NOT NULL,
  `validade` DATE NULL,
  `descricao` VARCHAR(150) NULL,
  `lote` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `codigoBarra_UNIQUE` (`codigoBarra` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`ItensVenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`ItensVenda` (
  `Estoque_idProduto` INT NOT NULL,
  `Vendas_idVendas` INT NOT NULL,
  `qtdProduto` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`Estoque_idProduto`, `Vendas_idVendas`),
  INDEX `fk_Produto_has_Vendas_Vendas1_idx` (`Vendas_idVendas` ASC) VISIBLE,
  INDEX `fk_Produto_has_Vendas_Produto1_idx` (`Estoque_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Vendas_Produto1`
    FOREIGN KEY (`Estoque_idProduto`)
    REFERENCES `postoInflamavel`.`Estoque` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Vendas_Vendas1`
    FOREIGN KEY (`Vendas_idVendas`)
    REFERENCES `postoInflamavel`.`Vendas` (`idVendas`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Fornecedor` (
  `cnpj/cpf` VARCHAR(18) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `valorFrete` DECIMAL(6,2) NULL,
  `email` VARCHAR(45) NULL,
  `statusFron` TINYINT NOT NULL,
  PRIMARY KEY (`cnpj/cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Compras` (
  `idCompras` INT NOT NULL AUTO_INCREMENT,
  `Fornecedor_cnpj/cpf` VARCHAR(18) NOT NULL,
  `Estoque_idProduto` INT NOT NULL,
  `dataComp` DATETIME NOT NULL,
  `qtdComp` DECIMAL(6,2) NOT NULL,
  `valorComp` DECIMAL(6,2) NOT NULL,
  `obs` VARCHAR(280) NULL,
  PRIMARY KEY (`idCompras`, `Fornecedor_cnpj/cpf`, `Estoque_idProduto`),
  INDEX `fk_Fornecedor_has_Estoque_Estoque1_idx` (`Estoque_idProduto` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Estoque_Fornecedor1_idx` (`Fornecedor_cnpj/cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Estoque_Fornecedor1`
    FOREIGN KEY (`Fornecedor_cnpj/cpf`)
    REFERENCES `postoInflamavel`.`Fornecedor` (`cnpj/cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fornecedor_has_Estoque_Estoque1`
    FOREIGN KEY (`Estoque_idProduto`)
    REFERENCES `postoInflamavel`.`Estoque` (`idProduto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(11) NOT NULL,
  `Departamento_idDepartamento` INT NULL,
  `Empregado_CPF` VARCHAR(14) NULL,
  `Fornecedor_cnpj/cpf` VARCHAR(18) NULL,
  PRIMARY KEY (`idTelefone`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC) VISIBLE,
  INDEX `fk_Telefone_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Telefone_Empregado1_idx` (`Empregado_CPF` ASC) VISIBLE,
  INDEX `fk_Telefone_Fornecedor1_idx` (`Fornecedor_cnpj/cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `postoInflamavel`.`Departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Telefone_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Telefone_Fornecedor1`
    FOREIGN KEY (`Fornecedor_cnpj/cpf`)
    REFERENCES `postoInflamavel`.`Fornecedor` (`cnpj/cpf`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Ocupacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Ocupacao` (
  `cbo` VARCHAR(8) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cbo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`FormaPagComp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`FormaPagComp` (
  `idFormaPagComp` INT NOT NULL AUTO_INCREMENT,
  `tipoFormaPag` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `Compras_idCompras` INT NOT NULL,
  `Compras_Fornecedor_cnpj/cpf` VARCHAR(18) NOT NULL,
  `Compras_Estoque_idProduto` INT NOT NULL,
  PRIMARY KEY (`idFormaPagComp`),
  INDEX `fk_FormaPagComp_Compras1_idx` (`Compras_idCompras` ASC, `Compras_Fornecedor_cnpj/cpf` ASC, `Compras_Estoque_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_FormaPagComp_Compras1`
    FOREIGN KEY (`Compras_idCompras` , `Compras_Fornecedor_cnpj/cpf` , `Compras_Estoque_idProduto`)
    REFERENCES `postoInflamavel`.`Compras` (`idCompras` , `Fornecedor_cnpj/cpf` , `Estoque_idProduto`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `postoInflamavel`.`Trabalhar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `postoInflamavel`.`Trabalhar` (
  `Empregado_CPF` VARCHAR(14) NOT NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `Ocupacao_cbo` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Empregado_CPF`, `Departamento_idDepartamento`, `Ocupacao_cbo`),
  INDEX `fk_Trabalhar_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  INDEX `fk_Trabalhar_Ocupacao1_idx` (`Ocupacao_cbo` ASC) VISIBLE,
  CONSTRAINT `fk_Trabalhar_Empregado1`
    FOREIGN KEY (`Empregado_CPF`)
    REFERENCES `postoInflamavel`.`Empregado` (`CPF`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Trabalhar_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `postoInflamavel`.`Departamento` (`idDepartamento`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabalhar_Ocupacao1`
    FOREIGN KEY (`Ocupacao_cbo`)
    REFERENCES `postoInflamavel`.`Ocupacao` (`cbo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*Destravar a base de dados para permitir delete sem where*/
SET SQL_SAFE_UPDATES = 0;

/*Travar a base de dados para permitir delete sem where*/
/*SET SQL_SAFE_UPDATES = 1;*/

-- Alter Table --
alter table empregado add column ctps varchar(15) after email;

alter table departamento add column email varchar(60) unique not null after nome;

alter table departamento add column descricao varchar(200) after horario;