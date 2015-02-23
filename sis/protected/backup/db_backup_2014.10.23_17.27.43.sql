-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `alternativasatisfacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `alternativasatisfacao`;
CREATE TABLE IF NOT EXISTS `alternativasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdPerguntaSatisfacao` int(10) unsigned NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alternativasatisfacao_perguntasatisfacao` (`IdPerguntaSatisfacao`) USING BTREE,
  CONSTRAINT `FK_alternativasatisfacao_perguntasatisfacao` FOREIGN KEY (`IdPerguntaSatisfacao`) REFERENCES `perguntasatisfacao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `aluno`
-- -------------------------------------------
DROP TABLE IF EXISTS `aluno`;
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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `alunoalternativasatisfacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoalternativasatisfacao`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `alunochat`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunochat`;
CREATE TABLE IF NOT EXISTS `alunochat` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `Mensagem` text NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_alunochat_turma` (`IdTurma`) USING BTREE,
  KEY `FK_alunochat_usuario` (`IdAluno`),
  CONSTRAINT `FK_alunochat_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK_alunochat_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=88;

-- -------------------------------------------
-- TABLE `alunoresponsavel`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoresponsavel`;
CREATE TABLE IF NOT EXISTS `alunoresponsavel` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdResponsavel` int(11) NOT NULL,
  `Data` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FKIdUsuario` (`IdResponsavel`) USING BTREE,
  KEY `FK_alunoresponsavel_usuario` (`IdAluno`),
  CONSTRAINT `FKIdResponsavel` FOREIGN KEY (`IdResponsavel`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_alunoresponsavel_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `alunoturma`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturma`;
CREATE TABLE IF NOT EXISTS `alunoturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DataHoraRespostaSatisfacao` datetime DEFAULT NULL,
  `Situacao` enum('E','A','R') NOT NULL COMMENT 'E = Em Andamento; A = Aprovado; R = Reprovado;',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IdAluno_IdTurma` (`IdAluno`,`IdTurma`),
  KEY `FK_alunoturma_turma` (`IdTurma`),
  CONSTRAINT `FK_alunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK_alunoturma_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `alunoturmaedc`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturmaedc`;
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
  CONSTRAINT `FK_alunoturmaedc_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_alunoturmaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_alunoturmaedc_edcmidia` FOREIGN KEY (`IdLastEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='registra o desenvolvimento do aluno em um edc.';

-- -------------------------------------------
-- TABLE `alunoturmaedcmidia`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturmaedcmidia`;
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
  CONSTRAINT `FK_alunoturmaedcmidia_alunoturmaedc` FOREIGN KEY (`IdAlunoTurmaEdc`) REFERENCES `alunoturmaedc` (`Id`),
  CONSTRAINT `FK_alunoturmaedcmidia_edcmidia` FOREIGN KEY (`IdEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1369 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092;

-- -------------------------------------------
-- TABLE `alunoturmaedcmidiainteracao`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturmaedcmidiainteracao`;
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
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_alunoturmaedcmidia` FOREIGN KEY (`IdAlunoTurmaEdcMidia`) REFERENCES `alunoturmaedcmidia` (`Id`),
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_tipointeracao` FOREIGN KEY (`IdTipoInteracao`) REFERENCES `tipointeracao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2877 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `alunoturmaprova`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturmaprova`;
CREATE TABLE IF NOT EXISTS `alunoturmaprova` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurma` int(10) NOT NULL,
  `DataHoraInicio` datetime NOT NULL,
  `DataHoraFim` datetime DEFAULT NULL,
  `Nota` tinyint(3) unsigned DEFAULT NULL,
  `Situacao` enum('A','R','E') DEFAULT NULL COMMENT 'A = Aprovado; R = Reprovado; E = Em Avaliação',
  `Comentario` text,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaprova_alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_alunoturmaprova_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `alunoturmaprovaquestao`
-- -------------------------------------------
DROP TABLE IF EXISTS `alunoturmaprovaquestao`;
CREATE TABLE IF NOT EXISTS `alunoturmaprovaquestao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaProva` int(10) unsigned NOT NULL,
  `IdQuestao` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaprovaquestao_alunoturmaprova` (`IdAlunoTurmaProva`),
  KEY `FK_alunoturmaprovaquestao_questao` (`IdQuestao`),
  CONSTRAINT `FK_alunoturmaprovaquestao_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`),
  CONSTRAINT `FK_alunoturmaprovaquestao_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `auditoria`
-- -------------------------------------------
DROP TABLE IF EXISTS `auditoria`;
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

-- -------------------------------------------
-- TABLE `auditoriacampo`
-- -------------------------------------------
DROP TABLE IF EXISTS `auditoriacampo`;
CREATE TABLE IF NOT EXISTS `auditoriacampo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAuditoria` int(11) NOT NULL,
  `Campo` varchar(50) NOT NULL,
  `Valor` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auditoriacampo_auditoria` (`IdAuditoria`),
  CONSTRAINT `FK_auditoriacampo_auditoria` FOREIGN KEY (`IdAuditoria`) REFERENCES `auditoria` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `auditorialogin`
-- -------------------------------------------
DROP TABLE IF EXISTS `auditorialogin`;
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

-- -------------------------------------------
-- TABLE `authassignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `authassignment`;
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` varchar(255) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=23;

-- -------------------------------------------
-- TABLE `authitem`
-- -------------------------------------------
DROP TABLE IF EXISTS `authitem`;
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  `link` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=46;

-- -------------------------------------------
-- TABLE `authitemchild`
-- -------------------------------------------
DROP TABLE IF EXISTS `authitemchild`;
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=27;

-- -------------------------------------------
-- TABLE `cartoes`
-- -------------------------------------------
DROP TABLE IF EXISTS `cartoes`;
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
  KEY `FK_cartoes_projeto` (`IdProjeto`),
  CONSTRAINT `FK_cartoes_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_cartoes_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_cartoes_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_cartoes_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`),
  CONSTRAINT `FK_cartoes_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8845902 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=72;

-- -------------------------------------------
-- TABLE `cliente`
-- -------------------------------------------
DROP TABLE IF EXISTS `cliente`;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `configuracao`
-- -------------------------------------------
DROP TABLE IF EXISTS `configuracao`;
CREATE TABLE IF NOT EXISTS `configuracao` (
  `NomeServidor` varchar(80) NOT NULL,
  `DataHoraUltimoBackup` datetime NOT NULL,
  `IdUsuarioUltimoBackup` int(10) unsigned NOT NULL,
  `DataInstalacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `conteudoassociadoedc`
-- -------------------------------------------
DROP TABLE IF EXISTS `conteudoassociadoedc`;
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `conteudoassociadoedcquestao`
-- -------------------------------------------
DROP TABLE IF EXISTS `conteudoassociadoedcquestao`;
CREATE TABLE IF NOT EXISTS `conteudoassociadoedcquestao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdConteudoAssociadoEdc` int(11) NOT NULL,
  `IdQuestao` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_conteudoassociadoedcquestao_questao` (`IdQuestao`),
  KEY `FK_conteudoassociadoedcquestao_conteudoassociadoedc` (`IdConteudoAssociadoEdc`),
  CONSTRAINT `FK_conteudoassociadoedcquestao_conteudoassociadoedc` FOREIGN KEY (`IdConteudoAssociadoEdc`) REFERENCES `conteudoassociadoedc` (`Id`),
  CONSTRAINT `FK_conteudoassociadoedcquestao_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `descritor`
-- -------------------------------------------
DROP TABLE IF EXISTS `descritor`;
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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

-- -------------------------------------------
-- TABLE `disciplina`
-- -------------------------------------------
DROP TABLE IF EXISTS `disciplina`;
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
  `TentativaProva` int(11) NOT NULL DEFAULT '0' COMMENT 'Quantidade de vezes que o aluno pode tentar passar na Prova. 0 = Infinitas vezes',
  `Media` tinyint(3) NOT NULL,
  `TipoCorrecao` enum('A','P') NOT NULL COMMENT 'A = Automático; P = Pelo professor;',
  `Estude` enum('T','F') NOT NULL DEFAULT 'T',
  `Pratique` enum('T','F') NOT NULL DEFAULT 'T',
  `Desempenho` enum('T','F') NOT NULL DEFAULT 'T',
  `Teste` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Disciplina_Titulo` (`IdCliente`,`Titulo`),
  KEY `FK_disciplina_disciplina` (`IdDisciplinaDependencia`),
  CONSTRAINT `FK_disciplina_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_disciplina_disciplina` FOREIGN KEY (`IdDisciplinaDependencia`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `edc`
-- -------------------------------------------
DROP TABLE IF EXISTS `edc`;
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
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_edc_edc` (`IdEdc`) USING BTREE,
  KEY `FK_edc_disciplina` (`IdDisciplina`) USING BTREE,
  CONSTRAINT `FK_edc_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_edc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=496;

-- -------------------------------------------
-- TABLE `edcmidia`
-- -------------------------------------------
DROP TABLE IF EXISTS `edcmidia`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4304 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=294;

-- -------------------------------------------
-- TABLE `edcmidiaalunoturma`
-- -------------------------------------------
DROP TABLE IF EXISTS `edcmidiaalunoturma`;
CREATE TABLE IF NOT EXISTS `edcmidiaalunoturma` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdcMidia` int(10) unsigned NOT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdTurma` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__edcmidia` (`IdEdcMidia`),
  KEY `FK__alunoturma` (`IdAlunoTurma`),
  KEY `FK_edcmidiaalunoturma_turma` (`IdTurma`),
  CONSTRAINT `FK_edcmidiaalunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`),
  CONSTRAINT `FK__alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK__edcmidia` FOREIGN KEY (`IdEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `edcmidiadescritor`
-- -------------------------------------------
DROP TABLE IF EXISTS `edcmidiadescritor`;
CREATE TABLE IF NOT EXISTS `edcmidiadescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEdcmidia` int(10) unsigned NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `fk_edcmidia` (`IdEdcmidia`) USING BTREE,
  KEY `fk_descritor` (`IdDescritor`) USING BTREE,
  CONSTRAINT `fk_descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `fk_edcmidia` FOREIGN KEY (`IdEdcmidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;

-- -------------------------------------------
-- TABLE `edcprerequisito`
-- -------------------------------------------
DROP TABLE IF EXISTS `edcprerequisito`;
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092;

-- -------------------------------------------
-- TABLE `edcturma`
-- -------------------------------------------
DROP TABLE IF EXISTS `edcturma`;
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

-- -------------------------------------------
-- TABLE `endereco`
-- -------------------------------------------
DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(50) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `escola`
-- -------------------------------------------
DROP TABLE IF EXISTS `escola`;
CREATE TABLE IF NOT EXISTS `escola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `IdEndereco` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Escola_Nome` (`IdCliente`,`Nome`),
  KEY `FK_escola_endereco` (`IdEndereco`),
  CONSTRAINT `FK_escola_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_escola_endereco` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `formulariodinamico`
-- -------------------------------------------
DROP TABLE IF EXISTS `formulariodinamico`;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `formulariodinamicocampo`
-- -------------------------------------------
DROP TABLE IF EXISTS `formulariodinamicocampo`;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260;

-- -------------------------------------------
-- TABLE `formulariodinamicoresposta`
-- -------------------------------------------
DROP TABLE IF EXISTS `formulariodinamicoresposta`;
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

-- -------------------------------------------
-- TABLE `grupousuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `grupousuario`;
CREATE TABLE IF NOT EXISTS `grupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Nivel` int(2) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_GrupoUsuario_Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `grupousuariopermissaoacesso`
-- -------------------------------------------
DROP TABLE IF EXISTS `grupousuariopermissaoacesso`;
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

-- -------------------------------------------
-- TABLE `logdicas`
-- -------------------------------------------
DROP TABLE IF EXISTS `logdicas`;
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
  KEY `FK_logdicas_usuario` (`IdAluno`),
  CONSTRAINT `FK_logdicas_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_logdicas_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_logdicas_questaodica` FOREIGN KEY (`IdDica`) REFERENCES `questaodica` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_logdicas_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `loglogin`
-- -------------------------------------------
DROP TABLE IF EXISTS `loglogin`;
CREATE TABLE IF NOT EXISTS `loglogin` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Url` varchar(200) NOT NULL,
  `DataHora` datetime NOT NULL,
  `IP` varchar(15) NOT NULL,
  `UserAgent` varchar(400) NOT NULL,
  `Acao` varchar(50) NOT NULL,
  `Login` varchar(100) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2722 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `notificacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `notificacao`;
CREATE TABLE IF NOT EXISTS `notificacao` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdAlunoEnviou` int(11) DEFAULT NULL,
  `IdAlunoRecebeu` int(11) DEFAULT NULL,
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
  KEY `FK_notificacao_usuario` (`IdAlunoEnviou`),
  KEY `FK_notificacao_usuario_2` (`IdAlunoRecebeu`),
  CONSTRAINT `FKnotificacaoIdTipoNotificacao` FOREIGN KEY (`IdTipoNotificacao`) REFERENCES `tiponotificacao` (`Id`),
  CONSTRAINT `FKnotificacaoIdUsuarioEnviou` FOREIGN KEY (`IdUsuarioEnviou`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FKnotificacaoIdUsuarioRecebeu` FOREIGN KEY (`IdUsuarioRecebeu`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_notificacao_usuario` FOREIGN KEY (`IdAlunoEnviou`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_notificacao_usuario_2` FOREIGN KEY (`IdAlunoRecebeu`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `perguntasatisfacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `perguntasatisfacao`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `permissaoacesso`
-- -------------------------------------------
DROP TABLE IF EXISTS `permissaoacesso`;
CREATE TABLE IF NOT EXISTS `permissaoacesso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_PermissaoAcesso_Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `projeto`
-- -------------------------------------------
DROP TABLE IF EXISTS `projeto`;
CREATE TABLE IF NOT EXISTS `projeto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` text NOT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'F',
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Projeto_Nome` (`IdCliente`,`Nome`),
  CONSTRAINT `FK_projeto_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `projetodisciplina`
-- -------------------------------------------
DROP TABLE IF EXISTS `projetodisciplina`;
CREATE TABLE IF NOT EXISTS `projetodisciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_ProjetoDisciplina_Id` (`IdProjeto`,`IdDisciplina`),
  KEY `FK_projetodisciplina_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_projetodisciplina_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_projetodisciplina_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `projetoescola`
-- -------------------------------------------
DROP TABLE IF EXISTS `projetoescola`;
CREATE TABLE IF NOT EXISTS `projetoescola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IdProjeto_IdEscola` (`IdProjeto`,`IdEscola`) USING BTREE,
  KEY `FK__escola` (`IdEscola`) USING BTREE,
  CONSTRAINT `FK__escola` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`Id`),
  CONSTRAINT `FK__projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questao`
-- -------------------------------------------
DROP TABLE IF EXISTS `questao`;
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
) ENGINE=InnoDB AUTO_INCREMENT=1893 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questaoalternativa`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaoalternativa`;
CREATE TABLE IF NOT EXISTS `questaoalternativa` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT '1',
  `Texto` varchar(8000) NOT NULL,
  `Correta` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoAlternativa_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaoalternativa_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6060 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questaoalunocomentario`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaoalunocomentario`;
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
  KEY `FK_questaoalunocomentario_usuario` (`IdAluno`),
  CONSTRAINT `FKusuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_questaoalunocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_questaoalunocomentario_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questaocomentario`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaocomentario`;
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
  KEY `FK_questaocomentario_usuario` (`IdAluno`),
  CONSTRAINT `FK_questaocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_questaocomentario_questaocomentario` FOREIGN KEY (`IdComentarioRespondido`) REFERENCES `questaocomentario` (`Id`),
  CONSTRAINT `FK_questaocomentario_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questaodescritor`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaodescritor`;
CREATE TABLE IF NOT EXISTS `questaodescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__questao` (`IdQuestao`) USING BTREE,
  KEY `FK__descritor` (`IdDescritor`) USING BTREE,
  CONSTRAINT `FK__descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `FK__questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1891 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

-- -------------------------------------------
-- TABLE `questaodica`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaodica`;
CREATE TABLE IF NOT EXISTS `questaodica` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Texto` text NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoDica_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaodica_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1535 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `questaorespostamidia`
-- -------------------------------------------
DROP TABLE IF EXISTS `questaorespostamidia`;
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
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `respostaaluno`
-- -------------------------------------------
DROP TABLE IF EXISTS `respostaaluno`;
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
  KEY `FK_respostaaluno_usuario` (`IdAluno`),
  CONSTRAINT `FK_Alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_respostaaluno_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`),
  CONSTRAINT `FK_respostaaluno_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE SET NULL,
  CONSTRAINT `FK_respostaaluno_usuario` FOREIGN KEY (`IdAluno`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `respostaalunoalternativa`
-- -------------------------------------------
DROP TABLE IF EXISTS `respostaalunoalternativa`;
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

-- -------------------------------------------
-- TABLE `servidoroffline`
-- -------------------------------------------
DROP TABLE IF EXISTS `servidoroffline`;
CREATE TABLE IF NOT EXISTS `servidoroffline` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(120) NOT NULL,
  `Descricao` text,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK__cliente` (`IdCliente`) USING BTREE,
  CONSTRAINT `FK__cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;

-- -------------------------------------------
-- TABLE `servidorofflinebackup`
-- -------------------------------------------
DROP TABLE IF EXISTS `servidorofflinebackup`;
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

-- -------------------------------------------
-- TABLE `servidorofflinedado`
-- -------------------------------------------
DROP TABLE IF EXISTS `servidorofflinedado`;
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

-- -------------------------------------------
-- TABLE `sincronizacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `sincronizacao`;
CREATE TABLE IF NOT EXISTS `sincronizacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tabela` int(11) NOT NULL DEFAULT '0',
  `IdTrunk` int(11) NOT NULL DEFAULT '0',
  `IdBranch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tipointeracao`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipointeracao`;
CREATE TABLE IF NOT EXISTS `tipointeracao` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tipomidia`
-- -------------------------------------------
DROP TABLE IF EXISTS `tipomidia`;
CREATE TABLE IF NOT EXISTS `tipomidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `RequerInteracao` enum('T','F') NOT NULL,
  `ClasseDoIcone` varchar(50) NOT NULL,
  `ExtensaoUpload` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `tiponotificacao`
-- -------------------------------------------
DROP TABLE IF EXISTS `tiponotificacao`;
CREATE TABLE IF NOT EXISTS `tiponotificacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` longtext NOT NULL,
  `EnviaEmail` enum('T','F') NOT NULL,
  `Expiravel` enum('T','F') NOT NULL,
  `Desativavel` enum('T','F') NOT NULL,
  `TextoPadrao` longtext NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `tiposcamposformulario`
-- -------------------------------------------
DROP TABLE IF EXISTS `tiposcamposformulario`;
CREATE TABLE IF NOT EXISTS `tiposcamposformulario` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL DEFAULT '0',
  `Referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `turma`
-- -------------------------------------------
DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `IdProfessor` int(11) NOT NULL,
  `Status` enum('CADASTRADA','ATIVA','CONCLUIDA','CANCELADA') NOT NULL DEFAULT 'CADASTRADA',
  `IdProjetoEscola` int(11) NOT NULL,
  `BloqueiaMidia` tinyint(4) NOT NULL COMMENT 'Determina se a midia é exibida ou não antes de selecionar todas as dicas.',
  `IdDisciplina` int(11) NOT NULL,
  `Horario` varchar(50) DEFAULT NULL,
  `Capacidade` int(4) unsigned DEFAULT '0',
  `Estude` enum('T','F') NOT NULL DEFAULT 'T',
  `Pratique` enum('T','F') NOT NULL DEFAULT 'T',
  `Desempenho` enum('T','F') NOT NULL DEFAULT 'T',
  `Teste` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Turma_Nome` (`Nome`,`IdProjetoEscola`),
  KEY `FK_turma_usuario` (`IdProfessor`),
  KEY `FK_turma_disciplina` (`IdDisciplina`) USING BTREE,
  KEY `FK_turma_projetoescola` (`IdProjetoEscola`) USING BTREE,
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_turma_projetoescola` FOREIGN KEY (`IdProjetoEscola`) REFERENCES `projetoescola` (`Id`),
  CONSTRAINT `FK_turma_usuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `turmaedc`
-- -------------------------------------------
DROP TABLE IF EXISTS `turmaedc`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

-- -------------------------------------------
-- TABLE `usuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `Nascimento` date NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `IdAluno` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `UniqId` varchar(50) DEFAULT NULL,
  `reqCode` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `Foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Usuario_Email` (`Email`),
  KEY `FK_usuario_cliente` (`IdCliente`),
  CONSTRAINT `FK_usuario_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `usuariogrupousuario`
-- -------------------------------------------
DROP TABLE IF EXISTS `usuariogrupousuario`;
CREATE TABLE IF NOT EXISTS `usuariogrupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `IdGrupoUsuario` int(11) NOT NULL,
  `IdProjeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_UsuarioGrupoUsuario_Id` (`IdUsuario`,`IdGrupoUsuario`,`IdProjeto`),
  KEY `FK_usuariogrupousuario_grupousuario` (`IdGrupoUsuario`),
  KEY `FK_usuariogrupousuario_projeto` (`IdProjeto`),
  CONSTRAINT `FK_usuariogrupousuario_grupousuario` FOREIGN KEY (`IdGrupoUsuario`) REFERENCES `grupousuario` (`Id`),
  CONSTRAINT `FK_usuariogrupousuario_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_usuariogrupousuario_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1297 DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `usuariopermissaoacesso`
-- -------------------------------------------
DROP TABLE IF EXISTS `usuariopermissaoacesso`;
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

-- -------------------------------------------
-- TABLE `usuariosugestao`
-- -------------------------------------------
DROP TABLE IF EXISTS `usuariosugestao`;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

