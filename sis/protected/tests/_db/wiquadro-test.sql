-- --------------------------------------------------------
-- Host:                         192.168.1.150
-- Server version:               5.5.39-MariaDB-0ubuntu0.14.04.1-log - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.1.0.4868
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for wiquadro
CREATE DATABASE IF NOT EXISTS `wiquadro_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wiquadro_test`;


-- Dumping structure for table wiquadro.alternativasatisfacao
CREATE TABLE IF NOT EXISTS `alternativasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdPerguntaSatisfacao` int(10) unsigned NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alternativasatisfacao_perguntasatisfacao` (`IdPerguntaSatisfacao`) USING BTREE,
  CONSTRAINT `FK_alternativasatisfacao_perguntasatisfacao` FOREIGN KEY (`IdPerguntaSatisfacao`) REFERENCES `perguntasatisfacao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.aluno
CREATE TABLE IF NOT EXISTS `aluno` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `Nascimento` date NOT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `UF` char(2) DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'F',
  `UniqId` varchar(50) DEFAULT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  `reqCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UniqId` (`UniqId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoalternativasatisfacao
CREATE TABLE IF NOT EXISTS `alunoalternativasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurma` int(10) NOT NULL,
  `IdPerguntaSatisfacao` int(10) unsigned NOT NULL,
  `IdAlternativaSatisfacao` int(10) unsigned NOT NULL,
  `DataHora` datetime NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunoalternativasatisfacao_alternativasatisfacao` (`IdAlternativaSatisfacao`) USING BTREE,
  KEY `FK_alunoalternativasatisfacao_perguntasatisfacao` (`IdPerguntaSatisfacao`),
  KEY `FK_alunoalternativasatisfacao_alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_alunoalternativasatisfacao_alternativasatisfacao` FOREIGN KEY (`IdAlternativaSatisfacao`) REFERENCES `alternativasatisfacao` (`Id`),
  CONSTRAINT `FK_alunoalternativasatisfacao_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_alunoalternativasatisfacao_perguntasatisfacao` FOREIGN KEY (`IdPerguntaSatisfacao`) REFERENCES `perguntasatisfacao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunochat
CREATE TABLE IF NOT EXISTS `alunochat` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `Mensagem` text NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunochat_turma` (`IdTurma`) USING BTREE,
  KEY `FK_alunochat_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FK_alunochat_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK_alunochat_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=88;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoresponsavel
CREATE TABLE IF NOT EXISTS `alunoresponsavel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdResponsavel` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKIdUsuario` (`IdResponsavel`) USING BTREE,
  KEY `FK_alunoresponsavel_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FKIdResponsavel` FOREIGN KEY (`IdResponsavel`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_alunoresponsavel_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturma
CREATE TABLE IF NOT EXISTS `alunoturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DataHoraRespostaSatisfacao` datetime DEFAULT NULL,
  `DataHoraUltimoAcesso` datetime DEFAULT NULL,
  `Situacao` enum('E','A','R') NOT NULL COMMENT 'E = Em Andamento; A = Aprovado; R = Reprovado;',
  `DataConclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IdAluno_IdTurma` (`IdAluno`,`IdTurma`),
  KEY `FK_alunoturma_turma` (`IdTurma`),
  CONSTRAINT `FK_alunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK_alunoturma_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaedc
CREATE TABLE IF NOT EXISTS `alunoturmaedc` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurma` int(10) NOT NULL,
  `DataInicio` date NOT NULL,
  `DataConclusao` date DEFAULT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `IdLastEdcMidia` int(11) unsigned DEFAULT NULL,
  `UltimoAcesso` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Aprovado` enum('T','F') DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunoturmaedc_alunoturma` (`IdAlunoTurma`) USING BTREE,
  KEY `FK_alunoturmaedc_edc` (`IdEdc`) USING BTREE,
  KEY `FK_alunoturmaedc_edcmidia` (`IdLastEdcMidia`) USING BTREE,
  CONSTRAINT `FK_alunoturmaedc_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alunoturmaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_alunoturmaedc_edcmidia` FOREIGN KEY (`IdLastEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='registra o desenvolvimento do aluno em um edc.';

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaedcmidia
CREATE TABLE IF NOT EXISTS `alunoturmaedcmidia` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaEdc` int(11) unsigned DEFAULT NULL,
  `IdEdcMidia` int(11) unsigned NOT NULL,
  `TempoTotal` int(11) NOT NULL COMMENT 'Tempo em segundos',
  `TempoConclusao` int(11) DEFAULT NULL COMMENT 'Tempo em segundos',
  `Visualizacao` tinyint(4) NOT NULL,
  `DataInicio` datetime NOT NULL,
  `DataConclusao` datetime DEFAULT NULL,
  `UltimoAcesso` varchar(15) DEFAULT NULL,
  `Favorito` enum('T','F') DEFAULT 'F',
  `PassarParaProximo` enum('T','F') NOT NULL DEFAULT 'F' COMMENT 'Armazena se o usuário efetuou a ação para passar para a próxima mídia',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunoturmaedcmidia_edcmidia` (`IdEdcMidia`) USING BTREE,
  KEY `FK_alunoturmaedcmidia_alunoturmaedc` (`IdAlunoTurmaEdc`) USING BTREE,
  CONSTRAINT `FK_alunoturmaedcmidia_alunoturmaedc` FOREIGN KEY (`IdAlunoTurmaEdc`) REFERENCES `alunoturmaedc` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alunoturmaedcmidia_edcmidia` FOREIGN KEY (`IdEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaedcmidiainteracao
CREATE TABLE IF NOT EXISTS `alunoturmaedcmidiainteracao` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaEdcMidia` int(11) unsigned NOT NULL DEFAULT '0',
  `IdTipoInteracao` int(11) unsigned NOT NULL DEFAULT '0',
  `ObjetoInteragido` text NOT NULL,
  `Interacao` text,
  `Acertou` enum('T','F') DEFAULT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunoturmaedcmidiainteracao_alunoturmaedcmidia` (`IdAlunoTurmaEdcMidia`) USING BTREE,
  KEY `FK_alunoturmaedcmidiainteracao_tipointeracao` (`IdTipoInteracao`) USING BTREE,
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_alunoturmaedcmidia` FOREIGN KEY (`IdAlunoTurmaEdcMidia`) REFERENCES `alunoturmaedcmidia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_tipointeracao` FOREIGN KEY (`IdTipoInteracao`) REFERENCES `tipointeracao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaprova
CREATE TABLE IF NOT EXISTS `alunoturmaprova` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurma` int(10) NOT NULL,
  `IdProvaTurma` int(10) DEFAULT NULL,
  `DataHoraInicio` datetime NOT NULL,
  `DataHoraFim` datetime DEFAULT NULL,
  `Nota` tinyint(3) unsigned DEFAULT NULL,
  `Situacao` enum('A','R','E') DEFAULT NULL COMMENT 'A = Aprovado; R = Reprovado; E = Em Avaliação',
  `Comentario` text,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaprova_alunoturma` (`IdAlunoTurma`),
  KEY `FK_alunoturmaprova_provaturma` (`IdProvaTurma`),
  CONSTRAINT `FK_alunoturmaprova_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alunoturmaprova_provaturma` FOREIGN KEY (`IdProvaTurma`) REFERENCES `provaturma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaprovacartaoresposta
CREATE TABLE IF NOT EXISTS `alunoturmaprovacartaoresposta` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaProva` int(10) unsigned NOT NULL,
  `Imagem` varchar(200) NOT NULL,
  `DataHoraUpload` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaprovacartaoresposta_alunoturmaprova` (`IdAlunoTurmaProva`),
  CONSTRAINT `FK_alunoturmaprovacartaoresposta_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.alunoturmaprovaquestao
CREATE TABLE IF NOT EXISTS `alunoturmaprovaquestao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaProva` int(10) unsigned NOT NULL,
  `IdQuestao` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaprovaquestao_alunoturmaprova` (`IdAlunoTurmaProva`),
  KEY `FK_alunoturmaprovaquestao_questao` (`IdQuestao`),
  CONSTRAINT `FK_alunoturmaprovaquestao_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_alunoturmaprovaquestao_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.auditoria
CREATE TABLE IF NOT EXISTS `auditoria` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdObjeto` int(11) NOT NULL,
  `Tabela` varchar(50) NOT NULL,
  `TipoAlteracao` char(1) NOT NULL,
  `DataHora` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auditoria_usuario` (`IdUsuario`),
  CONSTRAINT `FK_auditoria_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.auditoriacampo
CREATE TABLE IF NOT EXISTS `auditoriacampo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAuditoria` int(11) NOT NULL,
  `Campo` varchar(50) NOT NULL,
  `Valor` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auditoriacampo_auditoria` (`IdAuditoria`),
  CONSTRAINT `FK_auditoriacampo_auditoria` FOREIGN KEY (`IdAuditoria`) REFERENCES `auditoria` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.auditorialogin
CREATE TABLE IF NOT EXISTS `auditorialogin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `Navegador` varchar(50) NOT NULL,
  `TipoUsuario` varchar(50) NOT NULL,
  `DataHoraLogin` datetime NOT NULL,
  `DataHoraLogout` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auditorialogin_usuario` (`IdUsuario`),
  CONSTRAINT `FK_auditorialogin_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.authassignment
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` varchar(255) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=23;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.authitem
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  `link` varchar(50) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=46;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.authitemchild
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=27;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.cartoes
CREATE TABLE IF NOT EXISTS `cartoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sequencia` int(11) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `IdProjeto` int(11) DEFAULT NULL,
  `IdTurma` int(11) DEFAULT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `DataCreate` datetime NOT NULL,
  `DataUso` datetime DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `Codigo` (`Codigo`) USING BTREE,
  KEY `FK_cartoes_cliente` (`IdCliente`) USING BTREE,
  KEY `FK_cartoes_disciplina` (`IdDisciplina`) USING BTREE,
  KEY `FK_cartoes_usuario` (`IdUsuario`) USING BTREE,
  KEY `FK_cartoes_alunoturma` (`IdAlunoTurma`) USING BTREE,
  KEY `FK_cartoes_projeto` (`IdProjeto`) USING BTREE,
  CONSTRAINT `FK_cartoes_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_cartoes_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_cartoes_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_cartoes_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`),
  CONSTRAINT `FK_cartoes_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=72;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `TipoDoc` enum('CPF','CNPJ') NOT NULL DEFAULT 'CPF',
  `Doc` varchar(20) NOT NULL,
  `Tipo` char(1) NOT NULL DEFAULT 'E',
  `IdEndereco` int(11) NOT NULL,
  `CreatePublicProject` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Cliente_Nome` (`Nome`),
  UNIQUE KEY `UI_CLiente_CPF_CNPJ` (`Doc`),
  KEY `FK_cliente_endereco` (`IdEndereco`),
  CONSTRAINT `FK_cliente_endereco` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.configuracao
CREATE TABLE IF NOT EXISTS `configuracao` (
  `NomeServidor` varchar(80) NOT NULL,
  `DataHoraUltimoBackup` datetime NOT NULL,
  `IdUsuarioUltimoBackup` int(10) unsigned NOT NULL,
  `DataInstalacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.conteudoassociadoedc
CREATE TABLE IF NOT EXISTS `conteudoassociadoedc` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdTipoMidia` int(11) NOT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Conteudo` text,
  `Url` varchar(1024) DEFAULT NULL,
  `Ativo` enum('T','F') DEFAULT 'T',
  PRIMARY KEY (`Id`),
  KEY `FK_midiaauxiliaredc_edc` (`IdEdc`),
  KEY `FK_midiaauxiliaredc_tipoMidia` (`IdTipoMidia`),
  CONSTRAINT `FK_midiaauxiliaredc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_midiaauxiliaredc_tipoMidia` FOREIGN KEY (`IdTipoMidia`) REFERENCES `tipomidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.conteudoassociadoedcquestao
CREATE TABLE IF NOT EXISTS `conteudoassociadoedcquestao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdConteudoAssociadoEdc` int(11) NOT NULL,
  `IdQuestao` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_conteudoassociadoedcquestao_questao` (`IdQuestao`),
  KEY `FK_conteudoassociadoedcquestao_conteudoassociadoedc` (`IdConteudoAssociadoEdc`),
  CONSTRAINT `FK_conteudoassociadoedcquestao_conteudoassociadoedc` FOREIGN KEY (`IdConteudoAssociadoEdc`) REFERENCES `conteudoassociadoedc` (`Id`),
  CONSTRAINT `FK_conteudoassociadoedcquestao_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.descritor
CREATE TABLE IF NOT EXISTS `descritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Descricao` text NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `Codigo` (`Codigo`,`IdDisciplina`) USING BTREE,
  KEY `FK__disciplina` (`IdDisciplina`) USING BTREE,
  CONSTRAINT `FK__disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.descritormaterialreforco
CREATE TABLE IF NOT EXISTS `descritormaterialreforco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdLink` int(11) NOT NULL,
  `Descricao` varchar(200) NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_descritormaterialreforco_link` (`IdLink`),
  KEY `FK_descritormaterialreforco_descritor` (`IdDescritor`),
  CONSTRAINT `FK_descritormaterialreforco_descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `FK_descritormaterialreforco_link` FOREIGN KEY (`IdLink`) REFERENCES `link` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'T',
  `IdCliente` int(11) NOT NULL,
  `IdDisciplinaDependencia` int(11) DEFAULT NULL,
  `CertificadoImagem` varchar(100) DEFAULT NULL,
  `CertificadoX` int(11) DEFAULT NULL,
  `CertificadoY` int(11) DEFAULT NULL,
  `CertificadoTexto` varchar(500) DEFAULT NULL,
  `CargaHoraria` int(5) unsigned NOT NULL,
  `Media` tinyint(3) NOT NULL,
  `Estude` enum('T','F') NOT NULL DEFAULT 'T',
  `Pratique` enum('T','F') NOT NULL DEFAULT 'T',
  `Desempenho` enum('T','F') NOT NULL DEFAULT 'T',
  `Teste` enum('T','F') NOT NULL DEFAULT 'T',
  `TentativaProva` int(11) DEFAULT '1',
  `TipoCorrecao` enum('A','P') DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Disciplina_Titulo` (`IdCliente`,`Titulo`),
  KEY `FK_disciplina_disciplina` (`IdDisciplinaDependencia`) USING BTREE,
  CONSTRAINT `FK_disciplina_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_disciplina_disciplina` FOREIGN KEY (`IdDisciplinaDependencia`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edc
CREATE TABLE IF NOT EXISTS `edc` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdc` int(11) unsigned DEFAULT NULL,
  `Titulo` varchar(600) NOT NULL,
  `Descricao` text NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `QuantidadeQuestoesProva` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'a quantidade de questões desse edc que irão para a prova',
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `LiberaAvaliacao` enum('T','F') NOT NULL COMMENT 'determina se a partir desse EDC o aluno pode fazer a prova.',
  `MetodoAprovacao` enum('A','P') NOT NULL COMMENT 'A = Aprenda; P = Pratique',
  `Orientacao` text COMMENT 'Orientação ao professor de como trabalhar o EDC',
  `Ordem` int(11) DEFAULT NULL,
  `Estude` enum('T','F') DEFAULT 'T',
  `Pratique` enum('T','F') DEFAULT 'T',
  `TarefaComplementar` enum('T','F') DEFAULT 'F',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_edc_edc` (`IdEdc`) USING BTREE,
  KEY `FK_edc_disciplina` (`IdDisciplina`) USING BTREE,
  CONSTRAINT `FK_edc_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_edc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=496;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edcmidia
CREATE TABLE IF NOT EXISTS `edcmidia` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(200) NOT NULL,
  `Ordem` int(11) DEFAULT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Url` varchar(1024) DEFAULT NULL,
  `Conteudo` text,
  `IdTipoMidia` int(11) NOT NULL,
  `TempoMinimo` int(11) NOT NULL DEFAULT '5',
  `RequerInteracao` enum('T','F') NOT NULL DEFAULT 'T' COMMENT 'Caso T só pode passar após interação, caso contrário poderá passar assim que o tempo mínimo expirar',
  `IdEdc` int(11) unsigned DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE KEY `Titulo_IdEdc` (`Titulo`,`IdEdc`) USING BTREE,
  KEY `FK_edcmidia_edc` (`IdEdc`) USING BTREE,
  KEY `FK_edcmidia_tipomidia` (`IdTipoMidia`) USING BTREE,
  CONSTRAINT `FK_edcmidia_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_edcmidia_tipomidia` FOREIGN KEY (`IdTipoMidia`) REFERENCES `tipomidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=294;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edcmidiaalunoturma
CREATE TABLE IF NOT EXISTS `edcmidiaalunoturma` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdcMidia` int(10) unsigned NOT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdTurma` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__edcmidia` (`IdEdcMidia`) USING BTREE,
  KEY `FK__alunoturma` (`IdAlunoTurma`) USING BTREE,
  KEY `FK_edcmidiaalunoturma_turma` (`IdTurma`) USING BTREE,
  CONSTRAINT `FK_edcmidiaalunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK__alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK__edcmidia` FOREIGN KEY (`IdEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edcmidiadescritor
CREATE TABLE IF NOT EXISTS `edcmidiadescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEdcmidia` int(10) unsigned NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `fk_edcmidia` (`IdEdcmidia`) USING BTREE,
  KEY `fk_descritor` (`IdDescritor`) USING BTREE,
  CONSTRAINT `fk_descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `fk_edcmidia` FOREIGN KEY (`IdEdcmidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edcprerequisito
CREATE TABLE IF NOT EXISTS `edcprerequisito` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdc` int(11) unsigned NOT NULL,
  `IdEdcPreRequisito` int(11) unsigned NOT NULL,
  `Grupo` int(11) unsigned DEFAULT '0' COMMENT 'Determina grupos para a realizacao dos edcs.',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__edc` (`IdEdc`) USING BTREE,
  KEY `FK__edc_2` (`IdEdcPreRequisito`) USING BTREE,
  CONSTRAINT `FK__edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK__edc_2` FOREIGN KEY (`IdEdcPreRequisito`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.edcturma
CREATE TABLE IF NOT EXISTS `edcturma` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdEdc` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_edcturma_turma` (`IdTurma`) USING BTREE,
  KEY `FK_edcturma_edc` (`IdEdc`) USING BTREE,
  CONSTRAINT `FK_edcturma_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_edcturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(50) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.escola
CREATE TABLE IF NOT EXISTS `escola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `IdEndereco` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Escola_Nome` (`IdCliente`,`Nome`),
  KEY `FK_escola_endereco` (`IdEndereco`),
  CONSTRAINT `FK_escola_endereco` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_escola_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.formulariodinamico
CREATE TABLE IF NOT EXISTS `formulariodinamico` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdGrupoUsuario` int(11) NOT NULL,
  `DataCriacao` datetime NOT NULL,
  `DataAlteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_cliente` (`IdCliente`),
  KEY `FK_usuario` (`IdUsuario`),
  KEY `FK_grupoUsuario` (`IdGrupoUsuario`),
  CONSTRAINT `FK_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_grupoUsuario` FOREIGN KEY (`IdGrupoUsuario`) REFERENCES `grupousuario` (`Id`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.formulariodinamicocampo
CREATE TABLE IF NOT EXISTS `formulariodinamicocampo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdForm` int(11) NOT NULL,
  `Tipo` int(11) unsigned NOT NULL,
  `Label` varchar(50) NOT NULL,
  `Opcoes` text,
  `Obrigatorio` enum('T','F') NOT NULL,
  `Ordem` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_form` (`IdForm`) USING BTREE,
  KEY `FK_tipo` (`Tipo`) USING BTREE,
  CONSTRAINT `FK_form` FOREIGN KEY (`IdForm`) REFERENCES `formulariodinamico` (`Id`),
  CONSTRAINT `FK_tipo` FOREIGN KEY (`Tipo`) REFERENCES `tiposcamposformulario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.formulariodinamicoresposta
CREATE TABLE IF NOT EXISTS `formulariodinamicoresposta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdForm` int(11) NOT NULL DEFAULT '0',
  `IdCampo` int(11) NOT NULL DEFAULT '0',
  `Resposta` text NOT NULL,
  `IdUsuario` int(11) NOT NULL DEFAULT '0',
  `DataResposta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_formulario` (`IdForm`),
  KEY `FK_formulario_campo` (`IdCampo`),
  CONSTRAINT `FK_formulario` FOREIGN KEY (`IdForm`) REFERENCES `formulariodinamico` (`Id`),
  CONSTRAINT `FK_formulario_campo` FOREIGN KEY (`IdCampo`) REFERENCES `formulariodinamicocampo` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for procedure wiquadro.geraCartoes
DELIMITER //
CREATE DEFINER=`wiquadro`@`%` PROCEDURE `geraCartoes`(IN `_cliente` INT, IN `_disciplina` INT, IN `_projeto` INT, IN `_turma` INT, IN `_usuario` INT, IN `_total` INT, IN `_email` VARCHAR(150))
BEGIN
DECLARE seq, qtd INT DEFAULT 0;
DECLARE random varchar(100);

DECLARE CONTINUE HANDLER FOR SQLSTATE '23000'
BEGIN
    SET qtd = qtd - 1;
    SET seq = seq - 1;
END;

SELECT coalesce(max(Sequencia),0) INTO seq FROM cartoes WHERE IdCliente = _cliente AND IdDisciplina = _disciplina;
START TRANSACTION;
WHILE qtd < _total DO

	SET qtd = qtd + 1;
	SET seq = seq + 1;
  	SET random = RPAD(LEFT(CONVERT(RAND() * 999999999999, UNSIGNED), 12),12,0);
  
  	IF _turma = 0 THEN SET _turma = null;
  	END IF;
  
	INSERT INTO cartoes 
		(Sequencia, Codigo, IdCliente, IdDisciplina, IdProjeto, IdTurma, IdUsuario, DataCreate,Email)
	VALUES
		(seq, random, _cliente, _disciplina, _projeto, _turma, _usuario, NOW(),_email);
	
END WHILE;
COMMIT;
END//
DELIMITER ;


-- Dumping structure for table wiquadro.grupousuario
CREATE TABLE IF NOT EXISTS `grupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Nivel` int(2) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_GrupoUsuario_Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.grupousuariopermissaoacesso
CREATE TABLE IF NOT EXISTS `grupousuariopermissaoacesso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdGrupoUsuario` int(11) NOT NULL,
  `IdPermissaoAcesso` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_GrupoUsuarioPermissaoAcesso_Id` (`IdGrupoUsuario`,`IdPermissaoAcesso`),
  KEY `FK_grupousuariopermissaoacesso_permissaoacesso` (`IdPermissaoAcesso`),
  CONSTRAINT `FK_grupousuariopermissaoacesso_grupousuario` FOREIGN KEY (`IdGrupoUsuario`) REFERENCES `grupousuario` (`Id`),
  CONSTRAINT `FK_grupousuariopermissaoacesso_permissaoacesso` FOREIGN KEY (`IdPermissaoAcesso`) REFERENCES `permissaoacesso` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.link
CREATE TABLE IF NOT EXISTS `link` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Url` varchar(400) NOT NULL,
  `ContadorDenuncia` int(11) NOT NULL DEFAULT '0',
  `ContadorAcesso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.logdicas
CREATE TABLE IF NOT EXISTS `logdicas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) DEFAULT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdQuestao` int(11) DEFAULT '0',
  `IdDica` int(11) DEFAULT '0',
  `DataHoraPedidoAluno` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_logdicas_questao` (`IdQuestao`),
  KEY `FK_logdicas_questaodica` (`IdDica`),
  KEY `FK_logdicas_alunoturma` (`IdAlunoTurma`) USING BTREE,
  KEY `FK_logdicas_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FK_logdicas_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_logdicas_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_logdicas_questaodica` FOREIGN KEY (`IdDica`) REFERENCES `questaodica` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_logdicas_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.loglogin
CREATE TABLE IF NOT EXISTS `loglogin` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Url` varchar(200) NOT NULL,
  `DataHora` datetime NOT NULL,
  `IP` varchar(15) NOT NULL,
  `UserAgent` varchar(400) NOT NULL,
  `Acao` varchar(50) NOT NULL,
  `Login` varchar(100) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_loglogin_usuario` (`IdUsuario`),
  CONSTRAINT `FK_loglogin_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.logtransferencia
CREATE TABLE IF NOT EXISTS `logtransferencia` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdTurmaAnterior` int(11) DEFAULT NULL,
  `NomeTurmaAnterior` varchar(200) DEFAULT NULL,
  `IdTurmaNova` int(11) DEFAULT NULL,
  `NomeTurmaNova` varchar(200) DEFAULT NULL,
  `IdAluno` int(11) DEFAULT NULL,
  `NomeAluno` varchar(200) DEFAULT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdQuemTransferiu` int(11) DEFAULT NULL,
  `NomeQuemTransferiu` varchar(200) DEFAULT NULL,
  `DataHoraTransferencia` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.mensagem
CREATE TABLE IF NOT EXISTS `mensagem` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdUsuarioEnviou` int(11) DEFAULT NULL,
  `IdUsuarioRecebeu` int(11) DEFAULT NULL,
  `DataEnvio` datetime NOT NULL,
  `DataExpira` date DEFAULT NULL,
  `Ativo` enum('T','F') DEFAULT 'T',
  `Titulo` tinytext,
  `Texto` longtext NOT NULL,
  `Lido` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  KEY `FKnotificacaoIdUsuarioEnviou` (`IdUsuarioEnviou`),
  KEY `FKnotificacaoIdUsuarioRecebeu` (`IdUsuarioRecebeu`),
  CONSTRAINT `mensagem_ibfk_2` FOREIGN KEY (`IdUsuarioEnviou`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `mensagem_ibfk_3` FOREIGN KEY (`IdUsuarioRecebeu`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.notificacao
CREATE TABLE IF NOT EXISTS `notificacao` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdUsuarioEnviou` int(11) DEFAULT NULL,
  `IdUsuarioRecebeu` int(11) DEFAULT NULL,
  `IdTipoNotificacao` int(11) DEFAULT NULL,
  `DataEnvio` datetime NOT NULL,
  `DataExpira` date DEFAULT NULL,
  `Ativo` enum('T','F') DEFAULT NULL,
  `Texto` longtext NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKnotificacaoIdTipoNotificacao` (`IdTipoNotificacao`),
  KEY `FKnotificacaoIdUsuarioEnviou` (`IdUsuarioEnviou`),
  KEY `FKnotificacaoIdUsuarioRecebeu` (`IdUsuarioRecebeu`),
  CONSTRAINT `FKnotificacaoIdTipoNotificacao` FOREIGN KEY (`IdTipoNotificacao`) REFERENCES `tiponotificacao` (`Id`),
  CONSTRAINT `FKnotificacaoIdUsuarioEnviou` FOREIGN KEY (`IdUsuarioEnviou`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FKnotificacaoIdUsuarioRecebeu` FOREIGN KEY (`IdUsuarioRecebeu`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.perguntasatisfacao
CREATE TABLE IF NOT EXISTS `perguntasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  `TipoResposta` enum('U','M') NOT NULL COMMENT 'U - Única; M - Multipla',
  `IdDisciplina` int(11) DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_perguntasatisfacao_cliente` (`IdCliente`) USING BTREE,
  KEY `FK_perguntasatisfacao_disciplina` (`IdDisciplina`) USING BTREE,
  CONSTRAINT `FK_perguntasatisfacao_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_perguntasatisfacao_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.permissaoacesso
CREATE TABLE IF NOT EXISTS `permissaoacesso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_PermissaoAcesso_Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_acl_groups
CREATE TABLE IF NOT EXISTS `phpbb_acl_groups` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `group_id` (`group_id`),
  KEY `auth_opt_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_acl_options
CREATE TABLE IF NOT EXISTS `phpbb_acl_options` (
  `auth_option_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `auth_option` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_global` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_local` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `founder_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auth_option_id`),
  UNIQUE KEY `auth_option` (`auth_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_acl_roles
CREATE TABLE IF NOT EXISTS `phpbb_acl_roles` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_description` text COLLATE utf8_bin NOT NULL,
  `role_type` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `role_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`),
  KEY `role_type` (`role_type`),
  KEY `role_order` (`role_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_acl_roles_data
CREATE TABLE IF NOT EXISTS `phpbb_acl_roles_data` (
  `role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`,`auth_option_id`),
  KEY `ath_op_id` (`auth_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_acl_users
CREATE TABLE IF NOT EXISTS `phpbb_acl_users` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_role_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `auth_setting` tinyint(2) NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `auth_option_id` (`auth_option_id`),
  KEY `auth_role_id` (`auth_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_attachments
CREATE TABLE IF NOT EXISTS `phpbb_attachments` (
  `attach_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `post_msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `in_message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_orphan` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `physical_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `real_filename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `download_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `attach_comment` text COLLATE utf8_bin NOT NULL,
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mimetype` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `filetime` int(11) unsigned NOT NULL DEFAULT '0',
  `thumbnail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `filetime` (`filetime`),
  KEY `post_msg_id` (`post_msg_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_id` (`poster_id`),
  KEY `is_orphan` (`is_orphan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_banlist
CREATE TABLE IF NOT EXISTS `phpbb_banlist` (
  `ban_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ban_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ban_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_start` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_end` int(11) unsigned NOT NULL DEFAULT '0',
  `ban_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ban_give_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`ban_id`),
  KEY `ban_end` (`ban_end`),
  KEY `ban_user` (`ban_userid`,`ban_exclude`),
  KEY `ban_email` (`ban_email`,`ban_exclude`),
  KEY `ban_ip` (`ban_ip`,`ban_exclude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_bbcodes
CREATE TABLE IF NOT EXISTS `phpbb_bbcodes` (
  `bbcode_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `bbcode_tag` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_helpline` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_match` text COLLATE utf8_bin NOT NULL,
  `bbcode_tpl` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `first_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_match` mediumtext COLLATE utf8_bin NOT NULL,
  `second_pass_replace` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`bbcode_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_bookmarks
CREATE TABLE IF NOT EXISTS `phpbb_bookmarks` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_bots
CREATE TABLE IF NOT EXISTS `phpbb_bots` (
  `bot_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bot_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `bot_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bot_agent` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bot_ip` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`bot_id`),
  KEY `bot_active` (`bot_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_config
CREATE TABLE IF NOT EXISTS `phpbb_config` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `is_dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config_name`),
  KEY `is_dynamic` (`is_dynamic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_config_text
CREATE TABLE IF NOT EXISTS `phpbb_config_text` (
  `config_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `config_value` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_confirm
CREATE TABLE IF NOT EXISTS `phpbb_confirm` (
  `confirm_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `confirm_type` tinyint(3) NOT NULL DEFAULT '0',
  `code` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `seed` int(10) unsigned NOT NULL DEFAULT '0',
  `attempts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`,`confirm_id`),
  KEY `confirm_type` (`confirm_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_disallow
CREATE TABLE IF NOT EXISTS `phpbb_disallow` (
  `disallow_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `disallow_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`disallow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_drafts
CREATE TABLE IF NOT EXISTS `phpbb_drafts` (
  `draft_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `save_time` int(11) unsigned NOT NULL DEFAULT '0',
  `draft_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `draft_message` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`draft_id`),
  KEY `save_time` (`save_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_ext
CREATE TABLE IF NOT EXISTS `phpbb_ext` (
  `ext_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ext_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ext_state` text COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `ext_name` (`ext_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_extensions
CREATE TABLE IF NOT EXISTS `phpbb_extensions` (
  `extension_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_extension_groups
CREATE TABLE IF NOT EXISTS `phpbb_extension_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cat_id` tinyint(2) NOT NULL DEFAULT '0',
  `allow_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `download_mode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `upload_icon` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `max_filesize` int(20) unsigned NOT NULL DEFAULT '0',
  `allowed_forums` text COLLATE utf8_bin NOT NULL,
  `allow_in_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_forums
CREATE TABLE IF NOT EXISTS `phpbb_forums` (
  `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_parents` mediumtext COLLATE utf8_bin NOT NULL,
  `forum_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc` text COLLATE utf8_bin NOT NULL,
  `forum_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules` text COLLATE utf8_bin NOT NULL,
  `forum_rules_link` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_rules_options` int(11) unsigned NOT NULL DEFAULT '7',
  `forum_rules_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_topics_per_page` tinyint(4) NOT NULL DEFAULT '0',
  `forum_type` tinyint(4) NOT NULL DEFAULT '1',
  `forum_status` tinyint(4) NOT NULL DEFAULT '0',
  `forum_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `forum_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `forum_flags` tinyint(4) NOT NULL DEFAULT '32',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_indexing` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_icons` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_next` int(11) unsigned NOT NULL DEFAULT '0',
  `prune_days` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_viewed` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `prune_freq` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_subforum_list` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `forum_options` int(20) unsigned NOT NULL DEFAULT '0',
  `forum_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_topics_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `enable_shadow_prune` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `prune_shadow_days` mediumint(8) unsigned NOT NULL DEFAULT '7',
  `prune_shadow_freq` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `prune_shadow_next` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `forum_lastpost_id` (`forum_last_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_forums_access
CREATE TABLE IF NOT EXISTS `phpbb_forums_access` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`forum_id`,`user_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_forums_track
CREATE TABLE IF NOT EXISTS `phpbb_forums_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_forums_watch
CREATE TABLE IF NOT EXISTS `phpbb_forums_watch` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `forum_id` (`forum_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_groups
CREATE TABLE IF NOT EXISTS `phpbb_groups` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_type` tinyint(4) NOT NULL DEFAULT '1',
  `group_founder_manage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_skip_auth` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc` text COLLATE utf8_bin NOT NULL,
  `group_desc_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_desc_options` int(11) unsigned NOT NULL DEFAULT '7',
  `group_desc_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_display` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `group_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_sig_chars` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_receive_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_message_limit` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_legend` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_max_recipients` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`),
  KEY `group_legend_name` (`group_legend`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_icons
CREATE TABLE IF NOT EXISTS `phpbb_icons` (
  `icons_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `icons_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `icons_width` tinyint(4) NOT NULL DEFAULT '0',
  `icons_height` tinyint(4) NOT NULL DEFAULT '0',
  `icons_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`icons_id`),
  KEY `display_on_posting` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_lang
CREATE TABLE IF NOT EXISTS `phpbb_lang` (
  `lang_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `lang_iso` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_dir` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_english_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_local_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_author` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`lang_id`),
  KEY `lang_iso` (`lang_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_log
CREATE TABLE IF NOT EXISTS `phpbb_log` (
  `log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reportee_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_time` int(11) unsigned NOT NULL DEFAULT '0',
  `log_operation` text COLLATE utf8_bin NOT NULL,
  `log_data` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `reportee_id` (`reportee_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_login_attempts
CREATE TABLE IF NOT EXISTS `phpbb_login_attempts` (
  `attempt_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `attempt_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '0',
  KEY `att_ip` (`attempt_ip`,`attempt_time`),
  KEY `att_for` (`attempt_forwarded_for`,`attempt_time`),
  KEY `att_time` (`attempt_time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_migrations
CREATE TABLE IF NOT EXISTS `phpbb_migrations` (
  `migration_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `migration_depends_on` text COLLATE utf8_bin NOT NULL,
  `migration_schema_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `migration_data_state` text COLLATE utf8_bin NOT NULL,
  `migration_start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `migration_end_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`migration_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_moderator_cache
CREATE TABLE IF NOT EXISTS `phpbb_moderator_cache` (
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_on_index` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `disp_idx` (`display_on_index`),
  KEY `forum_id` (`forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_modules
CREATE TABLE IF NOT EXISTS `phpbb_modules` (
  `module_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `module_basename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_class` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `left_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `right_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module_langname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_mode` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `module_auth` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`),
  KEY `left_right_id` (`left_id`,`right_id`),
  KEY `module_enabled` (`module_enabled`),
  KEY `class_left_id` (`module_class`,`left_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_notifications
CREATE TABLE IF NOT EXISTS `phpbb_notifications` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item_parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notification_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notification_time` int(11) unsigned NOT NULL DEFAULT '1',
  `notification_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `item_ident` (`notification_type_id`,`item_id`),
  KEY `user` (`user_id`,`notification_read`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_notification_types
CREATE TABLE IF NOT EXISTS `phpbb_notification_types` (
  `notification_type_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `notification_type_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notification_type_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`notification_type_id`),
  UNIQUE KEY `type` (`notification_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_oauth_accounts
CREATE TABLE IF NOT EXISTS `phpbb_oauth_accounts` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_provider_id` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`,`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_oauth_tokens
CREATE TABLE IF NOT EXISTS `phpbb_oauth_tokens` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `provider` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `oauth_token` mediumtext COLLATE utf8_bin NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_poll_options
CREATE TABLE IF NOT EXISTS `phpbb_poll_options` (
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_text` text COLLATE utf8_bin NOT NULL,
  `poll_option_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `poll_opt_id` (`poll_option_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_poll_votes
CREATE TABLE IF NOT EXISTS `phpbb_poll_votes` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_option_id` tinyint(4) NOT NULL DEFAULT '0',
  `vote_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `vote_user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  KEY `topic_id` (`topic_id`),
  KEY `vote_user_id` (`vote_user_id`),
  KEY `vote_user_ip` (`vote_user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_posts
CREATE TABLE IF NOT EXISTS `phpbb_posts` (
  `post_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poster_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `post_checksum` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_postcount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `post_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_edit_locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `post_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `post_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `post_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `post_delete_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`),
  KEY `poster_ip` (`poster_ip`),
  KEY `poster_id` (`poster_id`),
  KEY `tid_post_time` (`topic_id`,`post_time`),
  KEY `post_username` (`post_username`),
  KEY `post_visibility` (`post_visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_privmsgs
CREATE TABLE IF NOT EXISTS `phpbb_privmsgs` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root_level` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_time` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_sig` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_text` mediumtext COLLATE utf8_bin NOT NULL,
  `message_edit_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `message_edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `message_edit_count` smallint(4) unsigned NOT NULL DEFAULT '0',
  `to_address` text COLLATE utf8_bin NOT NULL,
  `bcc_address` text COLLATE utf8_bin NOT NULL,
  `message_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `author_ip` (`author_ip`),
  KEY `message_time` (`message_time`),
  KEY `author_id` (`author_id`),
  KEY `root_level` (`root_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_privmsgs_folder
CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_folder` (
  `folder_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `folder_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pm_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`folder_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_privmsgs_rules
CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_rules` (
  `rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_check` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_connection` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_string` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rule_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rule_folder_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rule_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_privmsgs_to
CREATE TABLE IF NOT EXISTS `phpbb_privmsgs_to` (
  `msg_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pm_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pm_replied` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_marked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pm_forwarded` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(11) NOT NULL DEFAULT '0',
  KEY `msg_id` (`msg_id`),
  KEY `author_id` (`author_id`),
  KEY `usr_flder_id` (`user_id`,`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_profile_fields
CREATE TABLE IF NOT EXISTS `phpbb_profile_fields` (
  `field_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_ident` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_length` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_minlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_maxlen` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_novalue` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_validation` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_reg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_no_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_show_profile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_vt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_novalue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_pm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_show_on_ml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_is_contact` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_contact_desc` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `field_contact_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`),
  KEY `fld_type` (`field_type`),
  KEY `fld_ordr` (`field_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_profile_fields_data
CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_data` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pf_phpbb_interests` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_occupation` mediumtext COLLATE utf8_bin NOT NULL,
  `pf_phpbb_facebook` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_twitter` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_location` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_youtube` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_googleplus` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_icq` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_skype` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_website` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_wlm` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_yahoo` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pf_phpbb_aol` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_profile_fields_lang
CREATE TABLE IF NOT EXISTS `phpbb_profile_fields_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_type` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_profile_lang
CREATE TABLE IF NOT EXISTS `phpbb_profile_lang` (
  `field_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lang_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lang_explain` text COLLATE utf8_bin NOT NULL,
  `lang_default_value` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_ranks
CREATE TABLE IF NOT EXISTS `phpbb_ranks` (
  `rank_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rank_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `rank_min` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `rank_special` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rank_image` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_reports
CREATE TABLE IF NOT EXISTS `phpbb_reports` (
  `report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `reason_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_closed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `report_time` int(11) unsigned NOT NULL DEFAULT '0',
  `report_text` mediumtext COLLATE utf8_bin NOT NULL,
  `pm_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reported_post_enable_bbcode` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_smilies` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_enable_magic_url` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `reported_post_text` mediumtext COLLATE utf8_bin NOT NULL,
  `reported_post_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reported_post_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`),
  KEY `pm_id` (`pm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_reports_reasons
CREATE TABLE IF NOT EXISTS `phpbb_reports_reasons` (
  `reason_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `reason_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `reason_description` mediumtext COLLATE utf8_bin NOT NULL,
  `reason_order` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reason_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_search_results
CREATE TABLE IF NOT EXISTS `phpbb_search_results` (
  `search_key` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_time` int(11) unsigned NOT NULL DEFAULT '0',
  `search_keywords` mediumtext COLLATE utf8_bin NOT NULL,
  `search_authors` mediumtext COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`search_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_search_wordlist
CREATE TABLE IF NOT EXISTS `phpbb_search_wordlist` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word_text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `word_common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `word_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  UNIQUE KEY `wrd_txt` (`word_text`),
  KEY `wrd_cnt` (`word_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_search_wordmatch
CREATE TABLE IF NOT EXISTS `phpbb_search_wordmatch` (
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `word_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title_match` tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `un_mtch` (`word_id`,`post_id`,`title_match`),
  KEY `word_id` (`word_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_sessions
CREATE TABLE IF NOT EXISTS `phpbb_sessions` (
  `session_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `session_last_visit` int(11) unsigned NOT NULL DEFAULT '0',
  `session_start` int(11) unsigned NOT NULL DEFAULT '0',
  `session_time` int(11) unsigned NOT NULL DEFAULT '0',
  `session_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_browser` varchar(150) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_forwarded_for` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_page` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `session_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `session_autologin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `session_forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `session_time` (`session_time`),
  KEY `session_user_id` (`session_user_id`),
  KEY `session_fid` (`session_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_sessions_keys
CREATE TABLE IF NOT EXISTS `phpbb_sessions_keys` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_login` (`last_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_sitelist
CREATE TABLE IF NOT EXISTS `phpbb_sitelist` (
  `site_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `site_hostname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip_exclude` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_smilies
CREATE TABLE IF NOT EXISTS `phpbb_smilies` (
  `smiley_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `emotion` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_url` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '',
  `smiley_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `smiley_order` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `display_on_posting` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`smiley_id`),
  KEY `display_on_post` (`display_on_posting`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_styles
CREATE TABLE IF NOT EXISTS `phpbb_styles` (
  `style_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_copyright` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `style_active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `style_path` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'kNg=',
  `style_parent_id` int(4) unsigned NOT NULL DEFAULT '0',
  `style_parent_tree` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`style_id`),
  UNIQUE KEY `style_name` (`style_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_teampage
CREATE TABLE IF NOT EXISTS `phpbb_teampage` (
  `teampage_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `teampage_position` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `teampage_parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`teampage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_topics
CREATE TABLE IF NOT EXISTS `phpbb_topics` (
  `topic_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `icon_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_reported` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_poster` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_time_limit` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_views` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_status` tinyint(3) NOT NULL DEFAULT '0',
  `topic_type` tinyint(3) NOT NULL DEFAULT '0',
  `topic_first_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_first_poster_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic_first_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_last_poster_name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_poster_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_subject` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_last_post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_last_view_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_moved_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_bumped` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_bumper` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `poll_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `poll_start` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_length` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_max_options` tinyint(4) NOT NULL DEFAULT '1',
  `poll_last_vote` int(11) unsigned NOT NULL DEFAULT '0',
  `poll_vote_change` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `topic_visibility` tinyint(3) NOT NULL DEFAULT '0',
  `topic_delete_time` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_delete_reason` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `topic_delete_user` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_approved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_unapproved` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posts_softdeleted` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `forum_id_type` (`forum_id`,`topic_type`),
  KEY `last_post_time` (`topic_last_post_time`),
  KEY `fid_time_moved` (`forum_id`,`topic_last_post_time`,`topic_moved_id`),
  KEY `topic_visibility` (`topic_visibility`),
  KEY `forum_vis_last` (`forum_id`,`topic_visibility`,`topic_last_post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_topics_posted
CREATE TABLE IF NOT EXISTS `phpbb_topics_posted` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_posted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_topics_track
CREATE TABLE IF NOT EXISTS `phpbb_topics_track` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `forum_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mark_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`topic_id`),
  KEY `forum_id` (`forum_id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_topics_watch
CREATE TABLE IF NOT EXISTS `phpbb_topics_watch` (
  `topic_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `notify_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `topic_id` (`topic_id`),
  KEY `user_id` (`user_id`),
  KEY `notify_stat` (`notify_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_users
CREATE TABLE IF NOT EXISTS `phpbb_users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(2) NOT NULL DEFAULT '0',
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '3',
  `user_permissions` mediumtext COLLATE utf8_bin NOT NULL,
  `user_perm_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `username_clean` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_passchg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_email_hash` bigint(20) NOT NULL DEFAULT '0',
  `user_birthday` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_lastvisit` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastmark` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpost_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_lastpage` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_confirm_key` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_last_search` int(11) unsigned NOT NULL DEFAULT '0',
  `user_warnings` tinyint(4) NOT NULL DEFAULT '0',
  `user_last_warning` int(11) unsigned NOT NULL DEFAULT '0',
  `user_login_attempts` tinyint(4) NOT NULL DEFAULT '0',
  `user_inactive_reason` tinyint(2) NOT NULL DEFAULT '0',
  `user_inactive_time` int(11) unsigned NOT NULL DEFAULT '0',
  `user_posts` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_lang` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_timezone` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_dateformat` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'd M Y H:i',
  `user_style` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_rank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_colour` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_unread_privmsg` int(4) NOT NULL DEFAULT '0',
  `user_last_privmsg` int(11) unsigned NOT NULL DEFAULT '0',
  `user_message_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_full_folder` int(11) NOT NULL DEFAULT '-3',
  `user_emailtime` int(11) unsigned NOT NULL DEFAULT '0',
  `user_topic_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_topic_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_topic_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'd',
  `user_post_show_days` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_post_sortby_type` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 't',
  `user_post_sortby_dir` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT 'a',
  `user_notify` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_notify_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_notify_type` tinyint(4) NOT NULL DEFAULT '0',
  `user_allow_pm` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewonline` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_viewemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_allow_massemail` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_options` int(11) unsigned NOT NULL DEFAULT '230271',
  `user_avatar` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_avatar_width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_avatar_height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `user_sig` mediumtext COLLATE utf8_bin NOT NULL,
  `user_sig_bbcode_uid` varchar(8) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_sig_bbcode_bitfield` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_jabber` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_actkey` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_newpasswd` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_form_salt` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_new` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_reminded` tinyint(4) NOT NULL DEFAULT '0',
  `user_reminded_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_clean` (`username_clean`),
  KEY `user_birthday` (`user_birthday`),
  KEY `user_email_hash` (`user_email_hash`),
  KEY `user_type` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_user_group
CREATE TABLE IF NOT EXISTS `phpbb_user_group` (
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `group_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_pending` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `group_leader` (`group_leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_user_notifications
CREATE TABLE IF NOT EXISTS `phpbb_user_notifications` (
  `item_type` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `item_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `method` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `notify` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_warnings
CREATE TABLE IF NOT EXISTS `phpbb_warnings` (
  `warning_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `warning_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`warning_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_words
CREATE TABLE IF NOT EXISTS `phpbb_words` (
  `word_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `replacement` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.phpbb_zebra
CREATE TABLE IF NOT EXISTS `phpbb_zebra` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `zebra_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `friend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `foe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`zebra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.projeto
CREATE TABLE IF NOT EXISTS `projeto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` text NOT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'F',
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Projeto_Nome` (`IdCliente`,`Nome`),
  CONSTRAINT `FK_projeto_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.projetodisciplina
CREATE TABLE IF NOT EXISTS `projetodisciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_ProjetoDisciplina_Id` (`IdProjeto`,`IdDisciplina`),
  KEY `FK_projetodisciplina_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_projetodisciplina_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_projetodisciplina_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.projetoescola
CREATE TABLE IF NOT EXISTS `projetoescola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IdProjeto_IdEscola` (`IdProjeto`,`IdEscola`) USING BTREE,
  KEY `FK__escola` (`IdEscola`) USING BTREE,
  CONSTRAINT `FK__escola` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`Id`),
  CONSTRAINT `FK__projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.projetohorarioturma
CREATE TABLE IF NOT EXISTS `projetohorarioturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) DEFAULT '0',
  `Horario` varchar(50) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `FK_Id_Projeto` (`IdProjeto`),
  CONSTRAINT `FK_Id_Projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.prova
CREATE TABLE IF NOT EXISTS `prova` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` text NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `TipoCorrecao` enum('A','P') NOT NULL DEFAULT 'A' COMMENT 'A = Automático; P = Pelo professor;',
  `DataCriacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  KEY `FK_prova_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_prova_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.provaedc
CREATE TABLE IF NOT EXISTS `provaedc` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProva` int(11) NOT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `QtdQuestoes` int(11) NOT NULL,
  `Rand` enum('T','F') NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_provaedc_edc` (`IdEdc`),
  KEY `FK_provaedc_prova` (`IdProva`),
  CONSTRAINT `FK_provaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_provaedc_prova` FOREIGN KEY (`IdProva`) REFERENCES `prova` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.provaturma
CREATE TABLE IF NOT EXISTS `provaturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProva` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  `Peso` int(11) NOT NULL,
  `Tentativas` int(11) NOT NULL DEFAULT '0',
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  KEY `FK_provaturma_prova` (`IdProva`),
  KEY `FK_provaturma_turma` (`IdTurma`),
  CONSTRAINT `FK_provaturma_prova` FOREIGN KEY (`IdProva`) REFERENCES `prova` (`Id`),
  CONSTRAINT `FK_provaturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questao
CREATE TABLE IF NOT EXISTS `questao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` text NOT NULL,
  `Imagem` varchar(4000) DEFAULT NULL,
  `Numero` int(11) DEFAULT '1',
  `Tipo` enum('OBJ','DIS','DIS_POS') NOT NULL DEFAULT 'OBJ',
  `Resposta` varchar(4000) DEFAULT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `Secao` enum('P','T') NOT NULL COMMENT 'P = Pratique; T = Teste',
  `Orientacao` text COMMENT 'Orientação ao professor de como trabalhar a questão',
  PRIMARY KEY (`Id`),
  KEY `FK_questao_edc` (`IdEdc`) USING BTREE,
  CONSTRAINT `FK_questao_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaoalternativa
CREATE TABLE IF NOT EXISTS `questaoalternativa` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT '1',
  `Texto` varchar(8000) NOT NULL,
  `Correta` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoAlternativa_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaoalternativa_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaoalunocomentario
CREATE TABLE IF NOT EXISTS `questaoalunocomentario` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdAluno` int(11) NOT NULL,
  `IdProfessor` int(11) NOT NULL,
  `DataHora` datetime NOT NULL,
  `Comentario` text NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKusuario` (`IdProfessor`),
  KEY `FK_questaoalunocomentario_questao` (`IdQuestao`),
  KEY `FK_questaoalunocomentario_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FKusuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_questaoalunocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_questaoalunocomentario_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaocomentario
CREATE TABLE IF NOT EXISTS `questaocomentario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdComentarioRespondido` int(11) DEFAULT NULL,
  `IdAluno` int(11) NOT NULL,
  `NomeAluno` varchar(50) NOT NULL,
  `EmailAluno` varchar(50) NOT NULL,
  `Comentario` varchar(8000) NOT NULL,
  `DataHora` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_questaocomentario_questao` (`IdQuestao`),
  KEY `FK_questaocomentario_questaocomentario` (`IdComentarioRespondido`),
  KEY `FK_questaocomentario_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FK_questaocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_questaocomentario_questaocomentario` FOREIGN KEY (`IdComentarioRespondido`) REFERENCES `questaocomentario` (`Id`),
  CONSTRAINT `FK_questaocomentario_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaodescritor
CREATE TABLE IF NOT EXISTS `questaodescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__questao` (`IdQuestao`) USING BTREE,
  KEY `FK__descritor` (`IdDescritor`) USING BTREE,
  CONSTRAINT `FK__descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `FK__questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaodica
CREATE TABLE IF NOT EXISTS `questaodica` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Texto` text NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoDica_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaodica_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.questaorespostamidia
CREATE TABLE IF NOT EXISTS `questaorespostamidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Url` varchar(1024) NOT NULL,
  `IdTipoMidia` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_questaorespostamidia_questao` (`IdQuestao`),
  KEY `FK_questaorespostamidia_tipomidia` (`IdTipoMidia`),
  CONSTRAINT `FK_questaorespostamidia_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_questaorespostamidia_tipomidia` FOREIGN KEY (`IdTipoMidia`) REFERENCES `tipomidia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.respostaaluno
CREATE TABLE IF NOT EXISTS `respostaaluno` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) DEFAULT NULL,
  `TextoQuestao` varchar(4000) NOT NULL,
  `ImagemQuestao` varchar(4000) DEFAULT NULL,
  `TipoQuestao` enum('DIS','OBJ','DIS_POS') NOT NULL,
  `RespostaQuestao` varchar(4000) DEFAULT NULL,
  `PediuDica` enum('T','F') NOT NULL DEFAULT 'F',
  `RespostaAluno` varchar(4000) DEFAULT NULL,
  `Acertou` enum('T','F') DEFAULT NULL,
  `TempoAluno` time DEFAULT NULL,
  `DataHoraRespostaAluno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IdAluno` int(11) DEFAULT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdAlunoTurmaProva` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_respostaaluno_questao` (`IdQuestao`),
  KEY `FK_respostaaluno_alunoturmaprova` (`IdAlunoTurmaProva`),
  KEY `FK_Alunoturma` (`IdAlunoTurma`) USING BTREE,
  KEY `FK_respostaaluno_usuario` (`IdAluno`) USING BTREE,
  CONSTRAINT `FK_Alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_respostaaluno_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`),
  CONSTRAINT `FK_respostaaluno_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_respostaaluno_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.respostaalunoalternativa
CREATE TABLE IF NOT EXISTS `respostaalunoalternativa` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdRespostaAluno` int(11) NOT NULL,
  `NumeroAlternativa` int(11) NOT NULL,
  `TextoAlternativa` varchar(8000) NOT NULL,
  `AlternativaCorreta` enum('T','F') NOT NULL,
  `RespostaAluno` int(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_RespostaAlunoAlternativa_Numero` (`IdRespostaAluno`,`NumeroAlternativa`),
  CONSTRAINT `FK_respostaalunoalternativa_respostaaluno` FOREIGN KEY (`IdRespostaAluno`) REFERENCES `respostaaluno` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.respostaalunoalternativaacao
CREATE TABLE IF NOT EXISTS `respostaalunoalternativaacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestaoAlternativa` int(11) NOT NULL,
  `IdAlunoTurma` int(11) NOT NULL,
  `DataHora` datetime NOT NULL,
  `Tipo` enum('D','R') DEFAULT 'D',
  PRIMARY KEY (`Id`),
  KEY `FK__questaoalternativa` (`IdQuestaoAlternativa`),
  KEY `FK____alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK__questaoalternativa` FOREIGN KEY (`IdQuestaoAlternativa`) REFERENCES `questaoalternativa` (`Id`),
  CONSTRAINT `FK____alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.servidoroffline
CREATE TABLE IF NOT EXISTS `servidoroffline` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(120) NOT NULL,
  `Descricao` text,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__cliente` (`IdCliente`) USING BTREE,
  CONSTRAINT `FK__cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.servidorofflinebackup
CREATE TABLE IF NOT EXISTS `servidorofflinebackup` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `NomeArquivoServidor` varchar(150) NOT NULL,
  `NomeArquivoOriginal` varchar(150) NOT NULL,
  `DataHoraUpload` datetime DEFAULT NULL,
  `IdServidoroffline` int(10) unsigned NOT NULL,
  `DataHoraRestauracao` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK___usuario` (`IdUsuario`) USING BTREE,
  KEY `FK___servidoroffline` (`IdServidoroffline`) USING BTREE,
  CONSTRAINT `FK___servidoroffline` FOREIGN KEY (`IdServidoroffline`) REFERENCES `servidoroffline` (`Id`),
  CONSTRAINT `FK___usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.servidorofflinedado
CREATE TABLE IF NOT EXISTS `servidorofflinedado` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdServidorOffline` int(10) unsigned NOT NULL,
  `Tabela` varchar(50) NOT NULL,
  `PkServidorOffline` int(10) unsigned NOT NULL,
  `PkLocal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__servidoroffline` (`IdServidorOffline`) USING BTREE,
  CONSTRAINT `FK__servidoroffline` FOREIGN KEY (`IdServidorOffline`) REFERENCES `servidoroffline` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.sincronizacao
CREATE TABLE IF NOT EXISTS `sincronizacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tabela` int(11) NOT NULL DEFAULT '0',
  `IdTrunk` int(11) NOT NULL DEFAULT '0',
  `IdBranch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.tipointeracao
CREATE TABLE IF NOT EXISTS `tipointeracao` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.tipomidia
CREATE TABLE IF NOT EXISTS `tipomidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `RequerInteracao` enum('T','F') NOT NULL,
  `ClasseDoIcone` varchar(50) NOT NULL,
  `ExtensaoUpload` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.tiponotificacao
CREATE TABLE IF NOT EXISTS `tiponotificacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` longtext NOT NULL,
  `EnviaEmail` enum('T','F') NOT NULL,
  `Expiravel` enum('T','F') NOT NULL,
  `Desativavel` enum('T','F') NOT NULL,
  `TextoPadrao` longtext NOT NULL,
  `Icone` varchar(50) NOT NULL DEFAULT 'fa fa-comments-o',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.tiposcamposformulario
CREATE TABLE IF NOT EXISTS `tiposcamposformulario` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL DEFAULT '0',
  `Referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `IdProfessor` int(11) NOT NULL,
  `Status` enum('CADASTRADA','ATIVA','CONCLUIDA','CANCELADA') NOT NULL DEFAULT 'CADASTRADA',
  `IdProjetoEscola` int(11) NOT NULL,
  `BloqueiaMidia` tinyint(4) NOT NULL COMMENT 'Determina se a midia é exibida ou não antes de selecionar todas as dicas.',
  `IdDisciplina` int(11) NOT NULL,
  `Horario` varchar(50) DEFAULT NULL,
  `Domingo` enum('T','F') NOT NULL DEFAULT 'F',
  `Segunda` enum('T','F') NOT NULL DEFAULT 'F',
  `Terca` enum('T','F') NOT NULL DEFAULT 'F',
  `Quarta` enum('T','F') NOT NULL DEFAULT 'F',
  `Quinta` enum('T','F') NOT NULL DEFAULT 'F',
  `Sexta` enum('T','F') NOT NULL DEFAULT 'F',
  `Sabado` enum('T','F') NOT NULL DEFAULT 'F',
  `Capacidade` int(4) unsigned DEFAULT '0',
  `Estude` enum('T','F') NOT NULL DEFAULT 'T',
  `Pratique` enum('T','F') NOT NULL DEFAULT 'T',
  `Desempenho` enum('T','F') NOT NULL DEFAULT 'T',
  `Teste` enum('T','F') NOT NULL DEFAULT 'T',
  `IdForumBoard` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Turma_Nome` (`Nome`,`IdProjetoEscola`),
  KEY `FK_turma_usuario` (`IdProfessor`),
  KEY `FK_turma_disciplina` (`IdDisciplina`) USING BTREE,
  KEY `FK_turma_projetoescola` (`IdProjetoEscola`) USING BTREE,
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_turma_projetoescola` FOREIGN KEY (`IdProjetoEscola`) REFERENCES `projetoescola` (`Id`),
  CONSTRAINT `FK_turma_usuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.turmaedc
CREATE TABLE IF NOT EXISTS `turmaedc` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__turma` (`IdTurma`) USING BTREE,
  KEY `FK_turmaedc_edc` (`IdEdc`) USING BTREE,
  CONSTRAINT `FK_turmaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK__turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `Nascimento` date NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `UniqId` varchar(50) DEFAULT NULL,
  `reqCode` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  `IdForumUser` int(11) DEFAULT NULL,
  `ForumUserAuth` varchar(50) DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Usuario_Email` (`Email`),
  KEY `Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.usuariogrupousuario
CREATE TABLE IF NOT EXISTS `usuariogrupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdGrupoUsuario` int(11) NOT NULL,
  `IdProjeto` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_UsuarioGrupoUsuario_Id` (`IdUsuario`,`IdGrupoUsuario`,`IdProjeto`),
  KEY `FK_usuariogrupousuario_grupousuario` (`IdGrupoUsuario`),
  KEY `FK_usuariogrupousuario_projeto` (`IdProjeto`),
  KEY `FK_usuariogrupousuario_cliente` (`IdCliente`),
  CONSTRAINT `FK_usuariogrupousuario_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_usuariogrupousuario_grupousuario` FOREIGN KEY (`IdGrupoUsuario`) REFERENCES `grupousuario` (`Id`),
  CONSTRAINT `FK_usuariogrupousuario_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usuariogrupousuario_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.usuariopermissaoacesso
CREATE TABLE IF NOT EXISTS `usuariopermissaoacesso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdPermissaoAcesso` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_UsuarioPermissaoAcesso_Id` (`IdUsuario`,`IdPermissaoAcesso`),
  KEY `FK_usuariopermissaoacesso_permissaoacesso` (`IdPermissaoAcesso`),
  CONSTRAINT `FK_usuariopermissaoacesso_permissaoacesso` FOREIGN KEY (`IdPermissaoAcesso`) REFERENCES `permissaoacesso` (`Id`),
  CONSTRAINT `FK_usuariopermissaoacesso_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.usuariosugestao
CREATE TABLE IF NOT EXISTS `usuariosugestao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Mensagem` text NOT NULL,
  `Pagina` varchar(300) DEFAULT NULL,
  `DataHora` datetime NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Lido` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  KEY `FK__usuario` (`IdUsuario`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for view wiquadro.vw_classificacao_aluno_turma
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_classificacao_aluno_turma` (
	`IdAluno` INT(11) NOT NULL,
	`IdTurma` INT(11) NOT NULL,
	`TituloDisciplina` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`IdAlunoTurma` INT(11) NOT NULL,
	`Nome` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`Pontos` DECIMAL(24,0) NULL
) ENGINE=MyISAM;


-- Dumping structure for view wiquadro.vw_disciplina_aluno_turma
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vw_disciplina_aluno_turma` (
	`IdDisciplina` INT(11) NOT NULL,
	`TituloDisciplina` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`IdTurma` INT(11) NOT NULL,
	`IdAluno` INT(11) NOT NULL,
	`IdAlunoTurma` INT(11) NOT NULL,
	`IdEdc` INT(11) UNSIGNED NOT NULL,
	`IdAlunoTurmaEdc` INT(10) UNSIGNED NOT NULL,
	`UltimoAcesso` TIMESTAMP NULL
) ENGINE=MyISAM;


-- Dumping structure for table wiquadro.widget
CREATE TABLE IF NOT EXISTS `widget` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` text NOT NULL,
  `Link` text NOT NULL,
  `Conteudo` text NOT NULL,
  `X` int(3) NOT NULL DEFAULT '1',
  `Y` int(3) NOT NULL DEFAULT '1',
  `Cor` varchar(7) NOT NULL DEFAULT '#777777',
  `Padrao` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.widgetgrupousuario
CREATE TABLE IF NOT EXISTS `widgetgrupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdGrupoUsuario` int(11) NOT NULL,
  `IdWidget` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_widgetGrupoUsuario_tipoUsuario` (`IdGrupoUsuario`),
  KEY `FK_widgetGrupoUsuario_widget` (`IdWidget`),
  CONSTRAINT `FK_widgetGrupoUsuario_tipoUsuario` FOREIGN KEY (`IdGrupoUsuario`) REFERENCES `grupousuario` (`Id`),
  CONSTRAINT `FK_widgetGrupoUsuario_widget` FOREIGN KEY (`IdWidget`) REFERENCES `widget` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table wiquadro.widgetusuario
CREATE TABLE IF NOT EXISTS `widgetusuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdWidget` int(11) NOT NULL,
  `Linha` int(3) NOT NULL,
  `Coluna` int(3) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_widgetGrupoUsuarioUsuario_usuario` (`IdUsuario`),
  KEY `FK_widgetUsuario_widget` (`IdWidget`),
  CONSTRAINT `FK_widgetUsuario_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_widgetUsuario_widget` FOREIGN KEY (`IdWidget`) REFERENCES `widget` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for view wiquadro.vw_classificacao_aluno_turma
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_classificacao_aluno_turma`;
CREATE ALGORITHM=UNDEFINED DEFINER=`wiquadro`@`%` SQL SECURITY DEFINER VIEW `vw_classificacao_aluno_turma` AS (select `a`.`Id` AS `IdAluno`,`at`.`IdTurma` AS `IdTurma`,`d`.`Titulo` AS `TituloDisciplina`,`at`.`Id` AS `IdAlunoTurma`,`a`.`Nome` AS `Nome`,sum(((case `atemi`.`Acertou` when 'T' then 1 when 'F' then -(1) else 0 end) + (case when (`ra`.`Acertou` = 'T') then 1 else -(1) end))) AS `Pontos` from ((((((((`usuario` `a` join `alunoturma` `at` on((`a`.`Id` = `at`.`IdAluno`))) join `turma` `t` on((`at`.`IdTurma` = `t`.`Id`))) join `disciplina` `d` on((`t`.`IdDisciplina` = `d`.`Id`))) join `usuariogrupousuario` `ugu` on((`ugu`.`IdUsuario` = `a`.`Id`))) left join `alunoturmaedc` `ate` on((`at`.`Id` = `ate`.`IdAlunoTurma`))) left join `alunoturmaedcmidia` `atem` on((`ate`.`Id` = `atem`.`IdAlunoTurmaEdc`))) left join `alunoturmaedcmidiainteracao` `atemi` on((`atem`.`Id` = `atemi`.`IdAlunoTurmaEdcMidia`))) left join `respostaaluno` `ra` on((`at`.`Id` = `ra`.`IdAlunoTurma`))) where ((`ugu`.`IdGrupoUsuario` = 4) and isnull(`ugu`.`IdProjeto`)) group by `a`.`Id`,`at`.`IdTurma`,`at`.`Id`,`a`.`Nome`);


-- Dumping structure for view wiquadro.vw_disciplina_aluno_turma
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vw_disciplina_aluno_turma`;
CREATE ALGORITHM=UNDEFINED DEFINER=`wiquadro`@`%` SQL SECURITY DEFINER VIEW `vw_disciplina_aluno_turma` AS (select `d`.`Id` AS `IdDisciplina`,`d`.`Titulo` AS `TituloDisciplina`,`t`.`Id` AS `IdTurma`,`at`.`IdAluno` AS `IdAluno`,`at`.`Id` AS `IdAlunoTurma`,`ate`.`IdEdc` AS `IdEdc`,`ate`.`Id` AS `IdAlunoTurmaEdc`,`ate`.`UltimoAcesso` AS `UltimoAcesso` from (((`disciplina` `d` join `turma` `t` on((`t`.`IdDisciplina` = `d`.`Id`))) join `alunoturma` `at` on((`at`.`IdTurma` = `t`.`Id`))) join `alunoturmaedc` `ate` on((`ate`.`IdAlunoTurma` = `at`.`Id`))));
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
