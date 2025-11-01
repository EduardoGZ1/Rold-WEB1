SET
    SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
    time_zone = "+00:00";

USE `if0_40297372_teste`;

-- Estrutura da tabela `cadastro`:
CREATE TABLE
    IF NOT EXISTS `cadastro` (
        `NomeCliente` varchar(20) DEFAULT NULL,
        `SobrenomeCliente` varchar(30) DEFAULT NULL,
        `Sexo` char(1) DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;

-- Extraindo dados da tabela `cadastro`:
INSERT INTO
    `cadastro` (`NomeCliente`, `SobrenomeCliente`, `Sexo`)
VALUES
    ('Fábio', 'dos Reis', 'M'),
    ('Ana', 'Paulo', 'F'),
    ('Ana', 'Maria', 'F'),
    ('Jonas', 'Batista', 'M');

-- Estrutura da tabela `listas`:
CREATE TABLE
    IF NOT EXISTS `listas` (
        `ID_item` smallint (6) NOT NULL AUTO_INCREMENT,
        `Item` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
        PRIMARY KEY (`ID_item`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT = 7;

-- Extraindo dados da tabela `listas`:
INSERT INTO
    `listas` (`ID_item`, `Item`)
VALUES
    (1, 'Laranja'),
    (2, 'Banana'),
    (3, 'Maçã'),
    (4, 'Uva'),
    (5, 'Caqui'),
    (6, 'Caju');