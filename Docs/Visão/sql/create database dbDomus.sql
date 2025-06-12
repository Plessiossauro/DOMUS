--CREATE DATABASE dbDomus CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

--ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dataprev00';

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbDomus
-- -----------------------------------------------------
-- Banco de dados para o sistema DOMUS de corretores de imóveis.
DROP SCHEMA IF EXISTS `dbDomus` ;

-- -----------------------------------------------------
-- Schema dbDomus
--
-- Banco de dados para o sistema DOMUS de corretores de imóveis.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbDomus` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `dbDomus` ;

-- -----------------------------------------------------
-- Table `dbDomus`.`tb_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`tb_usuario` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`tb_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT COMMENT 'Campo identificador PK',
  `nm_usuario` VARCHAR(200) NOT NULL COMMENT 'Nome do usuário',
  `nm_email` VARCHAR(200) NOT NULL COMMENT 'email do usuário . campo com Unique index.',
  `nm_senha` VARCHAR(100) NOT NULL COMMENT 'senha \"criptografada\" do usuário',
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nm_email_UNIQUE` (`nm_email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`tb_perfil_acesso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`tb_perfil_acesso` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`tb_perfil_acesso` (
  `id_perfil_acesso` INT NOT NULL AUTO_INCREMENT COMMENT 'Campo identificador do perfil de acesso (PK): \n\n1 - Cadastrador\n2 - Corretor de Imóveis',
  `nm_perfil_acesso` VARCHAR(200) NOT NULL COMMENT 'Nome do perfil de acesso:\n\n1 - Cadastrador\n2 - Corretor de Imóveis',
  PRIMARY KEY (`id_perfil_acesso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`tb_usuario_perfil_acesso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`tb_usuario_perfil_acesso` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`tb_usuario_perfil_acesso` (
  `id_usuario` INT NOT NULL,
  `id_perfil_acesso` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_perfil_acesso`),
  INDEX `fk_tb_usuario_has_tb_perfil_acesso_tb_perfil_acesso1_idx` (`id_perfil_acesso` ASC) VISIBLE,
  INDEX `fk_tb_usuario_has_tb_perfil_acesso_tb_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tb_usuario_has_tb_perfil_acesso_tb_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `dbDomus`.`tb_usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_usuario_has_tb_perfil_acesso_tb_perfil_acesso1`
    FOREIGN KEY (`id_perfil_acesso`)
    REFERENCES `dbDomus`.`tb_perfil_acesso` (`id_perfil_acesso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`imovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`imovel` (
  `id_imovel` INT NOT NULL AUTO_INCREMENT,
  `nu_comodos` INT NOT NULL COMMENT 'Quantidade de cômodos',
  `nu_banheiros` INT NOT NULL COMMENT 'Quantidade de banheiros',
  `nu_area` DECIMAL(12,3) NULL COMMENT 'Area do imóvel em metros quiadrados',
  `imovelcol` VARCHAR(45) NULL,
  `vl_imovel` DECIMAL(17,2) NOT NULL COMMENT 'Valor declarado do imóvel',
  `dt_cadastramento` DATE NULL,
  PRIMARY KEY (`id_imovel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`tb_posicao_imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`tb_posicao_imovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`tb_posicao_imovel` (
  `id_posicao_imovel` INT NOT NULL COMMENT 'identificador da posição do imóvel',
  `nm_posicao_imovelcol` VARCHAR(200) NOT NULL COMMENT 'posicões do imóvel\n1 - Norte\n2 - Sul\n3 - Leste\n4 - Oeste\n5 - Nascente\n6 - Poente',
  PRIMARY KEY (`id_posicao_imovel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`tb_imovel_posicao_imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`tb_imovel_posicao_imovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`tb_imovel_posicao_imovel` (
  `id_imovel` INT NOT NULL,
  `id_posicao_imovel` INT NOT NULL,
  PRIMARY KEY (`id_imovel`, `id_posicao_imovel`),
  INDEX `fk_imovel_has_tb_posicao_imovel_tb_posicao_imovel1_idx` (`id_posicao_imovel` ASC) VISIBLE,
  INDEX `fk_imovel_has_tb_posicao_imovel_imovel1_idx` (`id_imovel` ASC) VISIBLE,
  CONSTRAINT `fk_imovel_has_tb_posicao_imovel_imovel1`
    FOREIGN KEY (`id_imovel`)
    REFERENCES `dbDomus`.`imovel` (`id_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_imovel_has_tb_posicao_imovel_tb_posicao_imovel1`
    FOREIGN KEY (`id_posicao_imovel`)
    REFERENCES `dbDomus`.`tb_posicao_imovel` (`id_posicao_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`CorretorDeImovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`CorretorDeImovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`CorretorDeImovel` (
  `id_corretor_imovel` INT NOT NULL,
  PRIMARY KEY (`id_corretor_imovel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`cliente` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`cliente` (
  `id_cliente` INT NOT NULL COMMENT 'campo identificador  do cliente',
  `nm_cliente` VARCHAR(200) NOT NULL,
  `cd_documento_identificacao` VARCHAR(45) NOT NULL COMMENT 'documento de identificaçao\n\nCNPJ, CPF',
  `tp_documento_identificacao` INT NOT NULL COMMENT 'tipo do documento de identificaçao\n\nCNPJ, CPF',
  `nm_email` VARCHAR(200) NULL,
  `nu_celular` BIGINT(15) NULL,
  `nu_fone` BIGINT(15) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`transacao_imobiliaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`transacao_imobiliaria` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`transacao_imobiliaria` (
  `id_trans_imob` INT NOT NULL COMMENT 'campo chave da Transação Imobiliária',
  `tp_trans_imob` INT NOT NULL COMMENT 'Tipo de transaçao imobiliária:\n1 - compra e venda\n2 - aluguel',
  `dt_trans_imob` DATE NULL COMMENT 'Data de realização da transação imobiliária',
  `vl_entrada` DECIMAL(17,2) NULL COMMENT 'Valor da entrada da transação imobiliária',
  `vl_parcelas` DECIMAL(17,2) NULL COMMENT 'Valor das parcelas para o restante que falta para completar a transação imobiliária',
  `nu_parcelas` INT NULL COMMENT 'Quantidade de parcelas para o restante que falta para completar a transação imobiliária',
  `id_imovel` INT NOT NULL,
  PRIMARY KEY (`id_trans_imob`),
  INDEX `fk_transacao_imobiliaria_imovel1_idx` (`id_imovel` ASC) VISIBLE,
  CONSTRAINT `fk_transacao_imobiliaria_imovel1`
    FOREIGN KEY (`id_imovel`)
    REFERENCES `dbDomus`.`imovel` (`id_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`corretor_transacao_imobiliaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`corretor_transacao_imobiliaria` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`corretor_transacao_imobiliaria` (
  `id_corretor_imovel` INT NOT NULL,
  `id_trans_imob` INT NOT NULL,
  PRIMARY KEY (`id_corretor_imovel`, `id_trans_imob`),
  INDEX `fk_CorretorDeImovel_has_transacao_imobiliaria_transacao_imo_idx` (`id_trans_imob` ASC) VISIBLE,
  INDEX `fk_CorretorDeImovel_has_transacao_imobiliaria_CorretorDeImo_idx` (`id_corretor_imovel` ASC) VISIBLE,
  CONSTRAINT `fk_CorretorDeImovel_has_transacao_imobiliaria_CorretorDeImovel1`
    FOREIGN KEY (`id_corretor_imovel`)
    REFERENCES `dbDomus`.`CorretorDeImovel` (`id_corretor_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CorretorDeImovel_has_transacao_imobiliaria_transacao_imobi1`
    FOREIGN KEY (`id_trans_imob`)
    REFERENCES `dbDomus`.`transacao_imobiliaria` (`id_trans_imob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`captacao_imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`captacao_imovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`captacao_imovel` (
  `id_captacao` INT NOT NULL,
  `dt_captacao` DATE NOT NULL,
  `id_imovel` INT NOT NULL,
  PRIMARY KEY (`id_captacao`),
  INDEX `fk_captacao_imovel_imovel1_idx` (`id_imovel` ASC) VISIBLE,
  CONSTRAINT `fk_captacao_imovel_imovel1`
    FOREIGN KEY (`id_imovel`)
    REFERENCES `dbDomus`.`imovel` (`id_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`corretor_captacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`corretor_captacao` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`corretor_captacao` (
  `id_corretor_imovel` INT NOT NULL,
  `id_captacao` INT NOT NULL,
  PRIMARY KEY (`id_corretor_imovel`, `id_captacao`),
  INDEX `fk_CorretorDeImovel_has_captacao_imovel_captacao_imovel1_idx` (`id_captacao` ASC) VISIBLE,
  INDEX `fk_CorretorDeImovel_has_captacao_imovel_CorretorDeImovel1_idx` (`id_corretor_imovel` ASC) VISIBLE,
  CONSTRAINT `fk_CorretorDeImovel_has_captacao_imovel_CorretorDeImovel1`
    FOREIGN KEY (`id_corretor_imovel`)
    REFERENCES `dbDomus`.`CorretorDeImovel` (`id_corretor_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CorretorDeImovel_has_captacao_imovel_captacao_imovel1`
    FOREIGN KEY (`id_captacao`)
    REFERENCES `dbDomus`.`captacao_imovel` (`id_captacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`visita_imovel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`visita_imovel` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`visita_imovel` (
  `id_visita` INT NOT NULL,
  `id_imovel` INT NOT NULL,
  `id_corretor_imovel` INT NOT NULL,
  `id_cliente` INT NOT NULL COMMENT 'Cliente que visita um imóvel',
  `dt_visita` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_visita`),
  INDEX `fk_imovel_has_CorretorDeImovel_CorretorDeImovel1_idx` (`id_corretor_imovel` ASC) VISIBLE,
  INDEX `fk_imovel_has_CorretorDeImovel_imovel1_idx` (`id_imovel` ASC) VISIBLE,
  INDEX `fk_visita_imovel_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_imovel_has_CorretorDeImovel_imovel1`
    FOREIGN KEY (`id_imovel`)
    REFERENCES `dbDomus`.`imovel` (`id_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_imovel_has_CorretorDeImovel_CorretorDeImovel1`
    FOREIGN KEY (`id_corretor_imovel`)
    REFERENCES `dbDomus`.`CorretorDeImovel` (`id_corretor_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_visita_imovel_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `dbDomus`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`propriedade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`propriedade` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`propriedade` (
  `id_proprietario` INT NOT NULL,
  `id_imovel` INT NOT NULL,
  PRIMARY KEY (`id_proprietario`, `id_imovel`),
  INDEX `fk_cliente_has_imovel_imovel1_idx` (`id_imovel` ASC) VISIBLE,
  INDEX `fk_cliente_has_imovel_cliente1_idx` (`id_proprietario` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_has_imovel_cliente1`
    FOREIGN KEY (`id_proprietario`)
    REFERENCES `dbDomus`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_imovel_imovel1`
    FOREIGN KEY (`id_imovel`)
    REFERENCES `dbDomus`.`imovel` (`id_imovel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbDomus`.`transacao_imobiliaria_cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbDomus`.`transacao_imobiliaria_cliente` ;

CREATE TABLE IF NOT EXISTS `dbDomus`.`transacao_imobiliaria_cliente` (
  `id_trans_imob` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `tp_relacionamento` INT NULL COMMENT 'Os tipos de relacionamento entre os clientes e a transação são:\n1 - vendedor\n2 - comprador\n3 - locador\n4 - locatário',
  PRIMARY KEY (`id_trans_imob`, `id_cliente`),
  INDEX `fk_transacao_imobiliaria_has_cliente_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_transacao_imobiliaria_has_cliente_transacao_imobiliaria1_idx` (`id_trans_imob` ASC) VISIBLE,
  CONSTRAINT `fk_transacao_imobiliaria_has_cliente_transacao_imobiliaria1`
    FOREIGN KEY (`id_trans_imob`)
    REFERENCES `dbDomus`.`transacao_imobiliaria` (`id_trans_imob`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transacao_imobiliaria_has_cliente_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `dbDomus`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
