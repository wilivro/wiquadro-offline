-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.34 - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para wiquadro
CREATE DATABASE IF NOT EXISTS `wiquadro` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wiquadro`;


-- Copiando estrutura para tabela wiquadro.aluno
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
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UniqId` (`UniqId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.aluno: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`Id`, `Nome`, `Email`, `Senha`, `Nascimento`, `Cidade`, `UF`, `Ativo`, `UniqId`) VALUES
	(1, 'Aluno Teste', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'T', '{E7DD8CED-D528-588B-3B21-7A10E7A1E0B0}'),
	(33, 'Henri Michel', 'henri@wilivro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-04', 'Natal', 'RN', 'T', '{65091028-E60A-D992-620F-35F981B31931}'),
	(35, 'David de Lima Figueiredo', 'david@fonosystem.com', 'c33367701511b4f6020ec61ded352059', '2000-02-12', 'Natal', 'RN', 'T', NULL),
	(36, 'teste de cadastro de aluno', 'tertiyre@roityr.com', 'e10adc3949ba59abbe56e057f20f883e', '2000-02-12', 'Natal', 'RN', 'F', NULL),
	(40, 'Mauricio Figueiredo', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'PARNAMIRIM', 'RN', 'T', '{FD7AFDE9-75BE-C7CC-4FA8-EA824666A317}');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturma
CREATE TABLE IF NOT EXISTS `alunoturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_AlunoTurma_Id` (`IdAluno`,`IdTurma`),
  KEY `FK_alunoturma_turma` (`IdTurma`),
  CONSTRAINT `FK_alunoturma_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_alunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoturma: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturma` DISABLE KEYS */;
INSERT INTO `alunoturma` (`Id`, `IdAluno`, `IdTurma`) VALUES
	(1, 1, 1),
	(4, 1, 3),
	(8, 1, 4),
	(10, 33, 4),
	(11, 35, 4),
	(5, 40, 2),
	(6, 40, 3),
	(7, 40, 4);
/*!40000 ALTER TABLE `alunoturma` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.auditoria
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

-- Copiando dados para a tabela wiquadro.auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.auditoriacampo
CREATE TABLE IF NOT EXISTS `auditoriacampo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAuditoria` int(11) NOT NULL,
  `Campo` varchar(50) NOT NULL,
  `Valor` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_auditoriacampo_auditoria` (`IdAuditoria`),
  CONSTRAINT `FK_auditoriacampo_auditoria` FOREIGN KEY (`IdAuditoria`) REFERENCES `auditoria` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.auditoriacampo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoriacampo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoriacampo` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.auditorialogin
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

-- Copiando dados para a tabela wiquadro.auditorialogin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditorialogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditorialogin` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.aula
CREATE TABLE IF NOT EXISTS `aula` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Numero` int(11) DEFAULT '1',
  `Descricao` varchar(255) DEFAULT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Aula_Titulo` (`IdDisciplina`,`Titulo`),
  UNIQUE KEY `UI_Aula_Numero` (`IdDisciplina`,`Numero`),
  CONSTRAINT `FK_aula_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.aula: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` (`Id`, `Titulo`, `Numero`, `Descricao`, `IdDisciplina`, `Ativo`) VALUES
	(1, 'Teste de Aula', 4, 'teste para ver a exclusão das disciplinas', 8, 'T'),
	(2, 'Teste de Aula2', 1, 'teste para ver a exclusão das disciplinas2', 8, 'T'),
	(3, 'Teste de Aula3', 3, 'teste para ver a exclusão das disciplinas3', 8, 'T'),
	(5, 'Teste de aula 4', 2, 'sei lá o que devo escrever!!', 8, 'T'),
	(7, 'mais um teste de disciplina', 2, 'Já estou ficando cansado disso! mais um teste de edição de aula!!@!!', 1, 'T'),
	(8, 'teste!@!', 5, 'Teste para ver dados enviados', 8, 'T'),
	(9, 'Aula invocada 1', 1, 'Primeira aula desta disciplina invocada!!!@!!!@!!!', 3, 'T'),
	(10, 'É nóis!', 1, 'É muita treta mano, tá ligado?!?', 2, 'T');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.aulamidia
CREATE TABLE IF NOT EXISTS `aulamidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Url` varchar(1024) NOT NULL,
  `IdAula` int(11) NOT NULL,
  `IdTipoMidia` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_AulaMidia_Numero` (`IdAula`,`Numero`),
  UNIQUE KEY `UI_AulaMidia_Titulo` (`IdAula`,`Titulo`),
  KEY `FK_aulamidia_tipomidia` (`IdTipoMidia`),
  CONSTRAINT `FK_aulamidia_aula` FOREIGN KEY (`IdAula`) REFERENCES `aula` (`Id`),
  CONSTRAINT `FK_aulamidia_tipomidia` FOREIGN KEY (`IdTipoMidia`) REFERENCES `tipomidia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.aulamidia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aulamidia` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulamidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.aulamidiacomentario
CREATE TABLE IF NOT EXISTS `aulamidiacomentario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` varchar(8000) NOT NULL,
  `DataHora` datetime NOT NULL,
  `IdAluno` int(11) NOT NULL,
  `IdAulaMidia` int(11) NOT NULL,
  `IdComentarioRespondido` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_aulamidiacomentario_aluno` (`IdAluno`),
  KEY `FK_aulamidiacomentario_aulamidia` (`IdAulaMidia`),
  KEY `FK_aulamidiacomentario_aulamidiacomentario` (`IdComentarioRespondido`),
  CONSTRAINT `FK_aulamidiacomentario_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_aulamidiacomentario_aulamidia` FOREIGN KEY (`IdAulaMidia`) REFERENCES `aulamidia` (`Id`),
  CONSTRAINT `FK_aulamidiacomentario_aulamidiacomentario` FOREIGN KEY (`IdComentarioRespondido`) REFERENCES `aulamidiacomentario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.aulamidiacomentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aulamidiacomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `aulamidiacomentario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authassignment
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`,`bizrule`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authassignment: 4 rows
/*!40000 ALTER TABLE `authassignment` DISABLE KEYS */;
INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
	('SuperAdmin', '3', '', NULL),
	('Admin', '1-4', '', NULL),
	('Guest', 'NULL', '', NULL),
	('Professor', '1-3', '', NULL);
/*!40000 ALTER TABLE `authassignment` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authitem
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authitem: 83 rows
/*!40000 ALTER TABLE `authitem` DISABLE KEYS */;
INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
	('AlunoView', 0, 'Visualizar Detalhes do Aluno', NULL, 'N;'),
	('AlunoCreate', 0, 'Criar Aluno', NULL, 'N;'),
	('AlunoUpdate', 0, 'Atualizar Aluno', NULL, 'N;'),
	('AlunoDelete', 0, 'Deletar Aluno', NULL, 'N;'),
	('AlunoIndex', 0, 'Listar Alunos', NULL, 'N;'),
	('Aluno', 1, 'Gerenciar Cliente', NULL, 'N;'),
	('AulaChangeStatus', 0, 'Alterar  Status da Turma', NULL, 'N;'),
	('AulaOrdem', 0, 'Alterar ordem das Aulas', NULL, 'N;'),
	('AulaView', 0, 'Visualizar detalhes da Aula', NULL, 'N;'),
	('AulaCreate', 0, 'Criar aula', NULL, 'N;'),
	('AulaUpdate', 0, 'Atualizar Aula', NULL, 'N;'),
	('AulaDelete', 0, 'Deletar Aula', NULL, 'N;'),
	('AulaConteudo', 0, 'Gerenciar conteúdo da Aula', NULL, 'N;'),
	('AulaExercicio', 0, 'Gerenciar Exercicios da Aula', NULL, 'N;'),
	('AulaCreateQuestao', 0, 'Criar Questões para as aulas', NULL, 'N;'),
	('AulaUpdateQuestao', 0, 'Atualizar questões', NULL, 'N;'),
	('AulaIndex', 0, 'Listar Aulas', NULL, 'N;'),
	('Aula', 1, 'Gerenciar Aulas', NULL, 'N;'),
	('ClienteView', 0, 'Visualiza detalhes da turma', NULL, 'N;'),
	('ClienteCreate', 0, 'Criar turma', NULL, 'N;'),
	('ClienteUpdate', 0, 'Atualizar Turma', NULL, 'N;'),
	('ClienteDelete', 0, 'Deletar turma', NULL, 'N;'),
	('ClienteIndex', 0, 'Listar Turmas', NULL, 'N;'),
	('Cliente', 1, 'Gerenciar Cliente', NULL, 'N;'),
	('QuestaoIndex', 0, 'Listar Questões', NULL, 'N;'),
	('QuestaoCreate', 0, 'Criar Questão', NULL, 'N;'),
	('QuestaoUpdate', 0, 'Editar Questão', NULL, 'N;'),
	('QuestaoView', 0, 'Visualizar detalhes da Questão', NULL, 'N;'),
	('QuestaoDelete', 0, 'Deletar Questão', NULL, 'N;'),
	('QuestaoDeleteAlternativa', 0, 'Deletar Alternativa da Questão', NULL, 'N;'),
	('QuestaoDeleteDica', 0, 'Deletar Dica da Questão', NULL, 'N;'),
	('QuestaoDeleteMidia', 0, 'Deletar Mídia da Questão', NULL, 'N;'),
	('QuestaoOrdem', 0, 'alterar ordem das Questões', NULL, 'N;'),
	('QuestaoStatus', 0, 'alterar Status da Questão', NULL, 'N;'),
	('Questao', 1, 'Gerenciar Questão', NULL, 'N;'),
	('UsuarioCreate', 0, 'Criar Usuario', NULL, 'N;'),
	('UsuarioDelete', 0, 'Deletar Usuario', NULL, 'N;'),
	('UsuarioUpdate', 0, 'Atualizar Usuario', NULL, 'N;'),
	('UsuarioView', 0, 'Visualizar detalhes do Usuario', NULL, 'N;'),
	('UsuarioIndex', 0, 'Listar Usuarios', NULL, 'N;'),
	('UsuarioAtivo', 0, 'Mudar status do Usuario', NULL, 'N;'),
	('UsuarioLogin', 0, 'Fazer Login', NULL, 'N;'),
	('Usuario', 1, 'Gerenciar Usuario', NULL, 'N;'),
	('EscolaIndex', 0, 'Listar Escolas', NULL, 'N;'),
	('EscolaCreate', 0, 'Criar Escola', NULL, 'N;'),
	('EscolaUpdate', 0, 'Editar Escola', NULL, 'N;'),
	('EscolaView', 0, 'Visualizar detalhes da Escola', NULL, 'N;'),
	('EscolaDelete', 0, 'Deletar Escola', NULL, 'N;'),
	('Escola', 1, 'Gerenciar Escolas', NULL, 'N;'),
	('ProjetoIndex', 0, 'Listar Projetos', NULL, 'N;'),
	('ProjetoCreate', 0, 'Criar Projeto', NULL, 'N;'),
	('ProjetoUpdate', 0, 'Editar Projeto', NULL, 'N;'),
	('ProjetoView', 0, 'Visualizar detalhes do Projeto', NULL, 'N;'),
	('ProjetoDelete', 0, 'Deletar Projeto', NULL, 'N;'),
	('ProjetoGetDisciplinasNotAssoc', 0, 'Visualizar disciplinas não associdas ao Projeto', NULL, 'N;'),
	('ProjetoGetAddDisciplinaProjeto', 0, 'Adicionar disciplina ao Projeto', NULL, 'N;'),
	('ProjetoSelectDefault', 0, 'Selecionar projeto padrão', NULL, 'N;'),
	('ProjetoGetChangeProjeto', 0, 'Alterar projeto padrão', NULL, 'N;'),
	('ProjetoGetDescritoresPorDisciplina', 0, 'Visualizar descritores associados as disciplinas dos projetos', NULL, 'N;'),
	('ProjetoRemoverDescritor', 0, 'Remover descritor da disciplina', NULL, 'N;'),
	('Projeto', 1, 'Gerenciar Projeto', NULL, 'N;'),
	('TurmaSave', 0, 'Criar Turma', NULL, 'N;'),
	('TurmaDelete', 0, 'Deletar Turma', NULL, 'N;'),
	('TurmaUpdate', 0, 'Atualizar Turma', NULL, 'N;'),
	('TurmaView', 0, 'Visualizar detalhes Turma', NULL, 'N;'),
	('TurmaChangeStatus', 0, 'alterar status da Turma', NULL, 'N;'),
	('TurmaGetTurma', 0, 'visualizar recuperar Turma', NULL, 'N;'),
	('TurmaAddAluno', 0, 'Adicionar Alunos à Turma', NULL, 'N;'),
	('TurmaRemoveAluno', 0, 'remover Aluno da Turma', NULL, 'N;'),
	('Turma', 1, 'Gerenciar Turma', NULL, 'N;'),
	('DisciplinaView', 0, 'Visualizar Detalhes da disciplina', NULL, 'N;'),
	('DisciplinaCreate', 0, 'Criar Disciplina', NULL, 'N;'),
	('DisciplinaRemoveByProjeto', 0, 'Remover Disciplina do Projeto', NULL, 'N;'),
	('DisciplinaGetAulas', 0, 'Acessar aulas da Disciplina', NULL, 'N;'),
	('DisciplinaUpdate', 0, 'Atualizar Disciplina', NULL, 'N;'),
	('DisciplinaDelete', 0, 'Deletar Disciplina', NULL, 'N;'),
	('DisciplinaIndex', 0, 'Listar Disciplinas', NULL, 'N;'),
	('Disciplina', 1, 'Gerenciar Disciplina', NULL, 'N;'),
	('Professor', 2, '', NULL, 'N;'),
	('Admin', 2, '', NULL, 'N;'),
	('SuperAdmin', 2, '', NULL, 'N;'),
	('Wilivro', 2, '', NULL, 'N;'),
	('ProjetoCreateDescritor', 0, 'Criar descritor', NULL, 'N;');
/*!40000 ALTER TABLE `authitem` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authitemchild
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authitemchild: 87 rows
/*!40000 ALTER TABLE `authitemchild` DISABLE KEYS */;
INSERT INTO `authitemchild` (`parent`, `child`) VALUES
	('Admin', 'Aluno'),
	('Admin', 'Escola'),
	('Admin', 'Professor'),
	('Admin', 'ProjetoCreateDescritor'),
	('Admin', 'ProjetoGetDescritoresPorDisciplina'),
	('Admin', 'ProjetoRemoverDescritor'),
	('Admin', 'ProjetoView'),
	('Admin', 'Usuario'),
	('Aluno', 'AlunoCreate'),
	('Aluno', 'AlunoDelete'),
	('Aluno', 'AlunoIndex'),
	('Aluno', 'AlunoUpdate'),
	('Aluno', 'AlunoView'),
	('Aula', 'AulaChangeStatus'),
	('Aula', 'AulaConteudo'),
	('Aula', 'AulaCreate'),
	('Aula', 'AulaCreateQuestao'),
	('Aula', 'AulaDelete'),
	('Aula', 'AulaExercicio'),
	('Aula', 'AulaIndex'),
	('Aula', 'AulaOrdem'),
	('Aula', 'AulaUpdate'),
	('Aula', 'AulaUpdateQuestao'),
	('Aula', 'AulaView'),
	('Cliente', 'ClienteCreate'),
	('Cliente', 'ClienteDelete'),
	('Cliente', 'ClienteIndex'),
	('Cliente', 'ClienteUpdate'),
	('Cliente', 'ClienteView'),
	('Disciplina', 'DisciplinaCreate'),
	('Disciplina', 'DisciplinaDelete'),
	('Disciplina', 'DisciplinaGetAulas'),
	('Disciplina', 'DisciplinaIndex'),
	('Disciplina', 'DisciplinaRemoveByProjeto'),
	('Disciplina', 'DisciplinaUpdate'),
	('Disciplina', 'DisciplinaView'),
	('Escola', 'EscolaCreate'),
	('Escola', 'EscolaDelete'),
	('Escola', 'EscolaIndex'),
	('Escola', 'EscolaUpdate'),
	('Escola', 'EscolaView'),
	('Professor', 'Aula'),
	('Professor', 'Disciplina'),
	('Professor', 'ProjetoView'),
	('Professor', 'Questao'),
	('Professor', 'Turma'),
	('Professor', 'UsuarioLogin'),
	('Professor', 'UsuarioView'),
	('Projeto', 'ProjetoCreate'),
	('Projeto', 'ProjetoDelete'),
	('Projeto', 'ProjetoGetAddDisciplinaProjeto'),
	('Projeto', 'ProjetoGetChangeProjeto'),
	('Projeto', 'ProjetoGetDescritoresPorDisciplina'),
	('Projeto', 'ProjetoGetDisciplinasNotAssoc'),
	('Projeto', 'ProjetoIndex'),
	('Projeto', 'ProjetoRemoverDescritor'),
	('Projeto', 'ProjetoSelectDefault'),
	('Projeto', 'ProjetoUpdate'),
	('Projeto', 'ProjetoView'),
	('Questao', 'QuestaoCreate'),
	('Questao', 'QuestaoDelete'),
	('Questao', 'QuestaoDeleteAlternativa'),
	('Questao', 'QuestaoDeleteDica'),
	('Questao', 'QuestaoDeleteMidia'),
	('Questao', 'QuestaoIndex'),
	('Questao', 'QuestaoOrdem'),
	('Questao', 'QuestaoStatus'),
	('Questao', 'QuestaoUpdate'),
	('Questao', 'QuestaoView'),
	('SuperAdmin', 'Admin'),
	('SuperAdmin', 'Projeto'),
	('Turma', 'TurmaAddAluno'),
	('Turma', 'TurmaChangeStatus'),
	('Turma', 'TurmaDelete'),
	('Turma', 'TurmaGetTurma'),
	('Turma', 'TurmaRemoveAluno'),
	('Turma', 'TurmaSave'),
	('Turma', 'TurmaUpdate'),
	('Turma', 'TurmaView'),
	('Usuario', 'UsuarioAtivo'),
	('Usuario', 'UsuarioCreate'),
	('Usuario', 'UsuarioDelete'),
	('Usuario', 'UsuarioIndex'),
	('Usuario', 'UsuarioLogin'),
	('Usuario', 'UsuarioUpdate'),
	('Usuario', 'UsuarioView'),
	('Wilivro', 'SuperAdmin');
/*!40000 ALTER TABLE `authitemchild` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `TipoDoc` enum('CPF','CNPJ') NOT NULL DEFAULT 'CPF',
  `Doc` varchar(20) NOT NULL,
  `Tipo` char(1) NOT NULL,
  `IdEndereco` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Cliente_Nome` (`Nome`),
  UNIQUE KEY `UI_CLiente_CPF_CNPJ` (`Doc`),
  KEY `FK_cliente_endereco` (`IdEndereco`),
  CONSTRAINT `FK_cliente_endereco` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.cliente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`Id`, `Nome`, `TipoDoc`, `Doc`, `Tipo`, `IdEndereco`) VALUES
	(1, 'Wilivro', 'CNPJ', '2558643564356', 'E', 1),
	(2, 'Escola José Pereira', 'CNPJ', '1243253234577', 'A', 2),
	(15, 'Exemplo de Cliente', 'CPF', '05624350422', 'H', 15),
	(16, 'teste com isolamento da view de endereço', 'CNPJ', '2315442353', 'D', 16);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.descritor
CREATE TABLE IF NOT EXISTS `descritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo` varchar(10) NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Descricao` text NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Codigo` (`Codigo`,`IdDisciplina`),
  KEY `FK__disciplina` (`IdDisciplina`),
  CONSTRAINT `FK__disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.descritor: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `descritor` DISABLE KEYS */;
INSERT INTO `descritor` (`Id`, `Codigo`, `Titulo`, `Descricao`, `IdDisciplina`) VALUES
	(3, 'a25', 'asd asdf sadf s fsdf', ' sdf sd fsf sdf s fsd fsdf', 53),
	(4, 'a22', 'asdasdsdf  sdfsd sdf sdf sdf', 'asdasdasd', 53),
	(10, 'a26', 'sdfsdf', 'sdfsdf', 53),
	(12, 'T12', 'Mais um teste de descritores', 'Descritores', 8);
/*!40000 ALTER TABLE `descritor` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'T',
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Disciplina_Titulo` (`IdCliente`,`Titulo`),
  CONSTRAINT `FK_disciplina_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.disciplina: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`Id`, `Titulo`, `Descricao`, `Publico`, `IdCliente`) VALUES
	(1, 'Teste de Disciplina', 'Esta é uma disciplina de teste para o sistema', 'T', 15),
	(2, 'Segundo teste de disciplina', 'Esta disciplina é para testar se o relacionamento esta vindo correto das tabelas', 'T', 2),
	(3, 'Disciplina Invocada!', 'Pense em uma disciplina invocada! ', 'T', 15),
	(4, 'Curso Genérico', 'Este é um curso genérico e publico para teste de novos alunos.', 'T', 15),
	(5, 'sdgsgsd', 'gs', 'T', 15),
	(7, 'dsdhsfhdfhghsfhdfgh', 'gsdgsdgsdgsd', 'T', 15),
	(8, 'Lero Lero', 'Neste sentido, a mobilidade dos capitais internacionais causa impacto indireto na reavaliação de todos os recursos funcionais envolvidos.', 'T', 15),
	(9, 'foi sem querer!dsgfg', 'sadldjhlkvjbclaksjhgkfdjg', 'T', 15),
	(10, 'foi sem querer!dsgfgasdfdsg', 'sadldjhlkvjbclaksjhgkfdjg', 'T', 15),
	(11, '2346345756', 'fd', 'T', 15),
	(14, '2346345756sdgf', 'fddshshghfhdgdfagfge', 'T', 15),
	(15, '2346345756sdgfdsgfdsghsdfg', 'fddshshghfhdgdfagfge', 'T', 15),
	(16, 'Esse teste é pra valer!!', 'teste de save via ajax!', 'T', 15),
	(17, 'Mais um teste pra valer!!', 'Teste de save via ajax sem associar a projeto!@!', 'T', 15),
	(18, 'Mais um teste pra valer, valer!', 'Teste save sem associar ao projeto 2!@!', 'T', 15),
	(20, 'gdfhfhfgjhgfj789090980', 'fjfdhsfhfgdhjdfhdfghfdhdfgh', 'T', 15),
	(27, 'dsfgdfsgsd', 'gsdgsdgdsfgsgsdf', 'T', 15),
	(30, 'Teste de Transação!', 'sddsfgh teste, teste, teste', 'T', 15),
	(33, 'Teste de Transação!2', 'sddsfgh teste, teste, teste', 'T', 15),
	(40, 'sdfsasfsdf', 'sdafsfdsafasfdsa', 'T', 15),
	(41, 'sdgasdgdasg', 'sdgasgsda', 'T', 15),
	(47, 'sdgasdgdasgasfdsf', 'sdgasgsdadsds', 'T', 15),
	(49, 'dsgsgdfg', 'wgfdd,ssadd lslkgd;sdglh', 'T', 15),
	(53, 'Teste de Disciplina', 'Teste para ver se verificação de duplicação na tabela está funcionando!', 'T', 1),
	(54, 'Teste com campo ID2324', 'Teste para ver se o campo escondido ID irá interferir no salvamento de novas Disciplinas.', 'T', 15),
	(55, 'Teste de edição!32', 'Teste para ver se o campo escondido ID irá interferir no salvamento de novas Disciplinas. foi testado', 'T', 15),
	(56, 'Disciplina de Testes', 'Este é uma disciplina para teste.', 'T', 15),
	(57, 'Teste de boa!', 'É treta truta!', 'T', 2);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(50) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.endereco: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`Id`, `Logradouro`, `Bairro`, `Cidade`, `UF`, `CEP`) VALUES
	(1, 'Rua José Pereira', 'Ambrósio', 'Natal', 'RN', '59000-000'),
	(2, 'Rua José Pereira', 'Ambrósio', 'PARNAMIRIM', 'RN', '59149-356'),
	(15, 'Rua Aeroporto de Navegantes, 434', 'Emaús2', 'PARNAMIRIM', 'RN', '59149-356'),
	(16, 'Rua Joaquim Pereira', 'Centro', 'Natal', 'RN', '34534-534');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.escola
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.escola: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
INSERT INTO `escola` (`Id`, `Nome`, `IdEndereco`, `IdCliente`) VALUES
	(1, 'Escola José pereira', 15, 15),
	(3, 'Escola Fulaninho de Tal', 2, 2),
	(4, 'Escola Zizi', 1, 15),
	(5, 'Escola Estadual FFF', 15, 1);
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.grupousuario
CREATE TABLE IF NOT EXISTS `grupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_GrupoUsuario_Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.grupousuario: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `grupousuario` DISABLE KEYS */;
INSERT INTO `grupousuario` (`Id`, `Nome`) VALUES
	(2, 'Admin'),
	(4, 'Aluno'),
	(1, 'Professor'),
	(3, 'SuperAdmin'),
	(5, 'WiLivro');
/*!40000 ALTER TABLE `grupousuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.grupousuariopermissaoacesso
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

-- Copiando dados para a tabela wiquadro.grupousuariopermissaoacesso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grupousuariopermissaoacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupousuariopermissaoacesso` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.logdicas
CREATE TABLE IF NOT EXISTS `logdicas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) DEFAULT '0',
  `IdQuestao` int(11) DEFAULT '0',
  `IdDica` int(11) DEFAULT '0',
  `DataHoraPedidoAluno` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_logdicas_aluno` (`IdAluno`),
  KEY `FK_logdicas_questao` (`IdQuestao`),
  KEY `FK_logdicas_questaodica` (`IdDica`),
  CONSTRAINT `FK_logdicas_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_logdicas_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`),
  CONSTRAINT `FK_logdicas_questaodica` FOREIGN KEY (`IdDica`) REFERENCES `questaodica` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.logdicas: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `logdicas` DISABLE KEYS */;
INSERT INTO `logdicas` (`Id`, `IdAluno`, `IdQuestao`, `IdDica`, `DataHoraPedidoAluno`) VALUES
	(41, 1, 36, 49, '2014-01-23 17:14:42'),
	(42, 1, 36, 49, '2014-01-23 17:14:49'),
	(43, 1, 36, 49, '2014-01-23 17:19:03'),
	(44, 1, 36, 49, '2014-01-23 17:20:43'),
	(45, 1, 36, 49, '2014-01-23 17:24:53'),
	(46, 1, 36, 49, '2014-01-23 17:25:27'),
	(47, 1, 36, 49, '2014-01-23 17:25:48'),
	(48, 1, 36, 49, '2014-01-23 17:26:31'),
	(49, 1, 36, 49, '2014-01-23 17:34:04'),
	(50, 1, 36, 49, '2014-01-23 17:34:57'),
	(51, 1, 36, 49, '2014-01-23 17:35:56'),
	(52, 1, 36, 49, '2014-01-23 17:37:24');
/*!40000 ALTER TABLE `logdicas` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.permissaoacesso
CREATE TABLE IF NOT EXISTS `permissaoacesso` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_PermissaoAcesso_Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.permissaoacesso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `permissaoacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissaoacesso` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.projeto
CREATE TABLE IF NOT EXISTS `projeto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'F',
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Projeto_Nome` (`IdCliente`,`Nome`),
  CONSTRAINT `FK_projeto_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projeto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` (`Id`, `Nome`, `Descricao`, `Publico`, `IdCliente`) VALUES
	(1, 'Curso Grátis', 'Este é um curso de teste para o novo sistema.', 'T', 1),
	(2, 'Mais um projeto', 'projeto criado para testar a seleção de mais de um projeto por usuário. é!!', 'F', 15),
	(3, 'Mais um projeto de Testes', 'Este projeto tem com objetivo promover os testes de cadastro de um novo projeto.', 'T', 2),
	(4, 'Fortalecimento da Educação nas Escolas', 'Vemos que é bem parecido com a forma não-relacional. A única diferença é uma chamada ao método', 'T', 15);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.projetodisciplina
CREATE TABLE IF NOT EXISTS `projetodisciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_ProjetoDisciplina_Id` (`IdProjeto`,`IdDisciplina`),
  KEY `FK_projetodisciplina_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_projetodisciplina_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_projetodisciplina_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projetodisciplina: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `projetodisciplina` DISABLE KEYS */;
INSERT INTO `projetodisciplina` (`Id`, `IdProjeto`, `IdDisciplina`) VALUES
	(11, 1, 53),
	(18, 2, 56),
	(2, 3, 2),
	(19, 3, 57),
	(1, 4, 1),
	(13, 4, 3),
	(17, 4, 4),
	(14, 4, 8),
	(16, 4, 9),
	(7, 4, 16),
	(8, 4, 18),
	(15, 4, 33);
/*!40000 ALTER TABLE `projetodisciplina` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.projetoescola
CREATE TABLE IF NOT EXISTS `projetoescola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_ProjetoEscola_Id` (`IdProjeto`,`IdEscola`),
  KEY `FK_projetoescola_escola` (`IdEscola`),
  CONSTRAINT `FK_projetoescola_escola` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`Id`),
  CONSTRAINT `FK_projetoescola_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projetoescola: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `projetoescola` DISABLE KEYS */;
INSERT INTO `projetoescola` (`Id`, `IdProjeto`, `IdEscola`) VALUES
	(1, 1, 1),
	(2, 4, 1);
/*!40000 ALTER TABLE `projetoescola` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questao
CREATE TABLE IF NOT EXISTS `questao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` text NOT NULL,
  `Imagem` varchar(4000) DEFAULT NULL,
  `Numero` int(11) DEFAULT '1',
  `Tipo` enum('OBJ','DIS') NOT NULL DEFAULT 'OBJ',
  `Resposta` varchar(4000) DEFAULT NULL,
  `IdAula` int(11) NOT NULL DEFAULT '0',
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Numero` (`Numero`,`IdAula`),
  KEY `FK_questao_aula` (`IdAula`),
  CONSTRAINT `FK_questao_aula` FOREIGN KEY (`IdAula`) REFERENCES `aula` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questao: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` (`Id`, `Texto`, `Imagem`, `Numero`, `Tipo`, `Resposta`, `IdAula`, `Ativo`) VALUES
	(1, 'É claro que o acompanhamento das preferências de consumo afeta positivamente a correta previsão das condições inegavelmente apropriadas. Baseado nessas informações responda:\r\n\r\nQual o resultado da soma de 4 + 4 ?<div><br></div><div style="text-align: center;"><img src="/images/questoes/8b4a87b850e0cf17d2b4c1f2a5642246.png"><br></div><div><br></div><div style="text-align: center;">sadlgksg,jgsdkgjhdfkgjhddgk</div>', '0', 2, 'OBJ', '', 2, 'T'),
	(5, 'Teste de questão da aula Teste de Aula2', '0', 3, 'DIS', '0', 2, 'T'),
	(8, 'teste de questão para salvar mídia?? alterei!', '0', 5, 'OBJ', 'Teste', 2, 'T'),
	(9, 'Esse é um teste muito importante, para verificar se ordem das questões estão corretas.', NULL, 1, 'OBJ', '', 8, 'T'),
	(10, 'só mais um teste, por isso peguei um texto do lerolero.com\r\n\r\nÉ claro que a contínua expansão de nossa atividade estende o alcance e a importância do sistema de formação de quadros que corresponde às necessidades.', NULL, 2, 'OBJ', '', 8, 'T'),
	(11, 'jdfjhgasdjfg', NULL, 4, 'OBJ', '', 2, 'T'),
	(36, 'erteterrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, 1, 'DIS', 'rterterrt', 2, 'T');
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaoalternativa
CREATE TABLE IF NOT EXISTS `questaoalternativa` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT '1',
  `Texto` varchar(8000) NOT NULL,
  `Correta` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoAlternativa_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaoalternativa_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaoalternativa: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `questaoalternativa` DISABLE KEYS */;
INSERT INTO `questaoalternativa` (`Id`, `IdQuestao`, `Numero`, `Texto`, `Correta`) VALUES
	(1, 1, 1, 'sdfasfsafsaf', 'F'),
	(2, 1, 2, 'asfsafsaf', 'F'),
	(3, 1, 3, 'sfsafas', 'F'),
	(4, 1, 4, 'sdaasdfasdsdads<img src="/images/questoes/bc6f3f2bfd84ae356028f532f2774e0e.png">', 'T'),
	(12, 8, 1, 'alternativa doida 1', 'F'),
	(13, 8, 2, 'alternativa doida 2', 'F'),
	(14, 8, 3, 'alternativa doida 3', 'F'),
	(15, 8, 4, 'sdgsdgdsgdg', 'T'),
	(16, 9, 1, 'dsfgdfgdsgdfgdsgsdg', 'F'),
	(17, 9, 2, 'dsgdgfgsgsdggfsdg', 'T'),
	(18, 9, 3, 'sdfsdafasdfdasfs', 'F'),
	(19, 10, 1, 'O empenho em analisar a contínua expansão de nossa atividade estende o alcance e a importância das formas de ação.', 'F'),
	(20, 10, 2, 'Assim mesmo, a estrutura atual da organização não pode mais se dissociar da gestão inovadora da qual fazemos parte.', 'F'),
	(21, 10, 3, 'Do mesmo modo, a consulta aos diversos militantes acarreta um processo de reformulação e modernização do fluxo de informações.', 'T'),
	(22, 10, 4, 'A prática cotidiana prova que a competitividade nas transações comerciais facilita a criação do orçamento setorial.', 'F'),
	(23, 10, 5, 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a percepção das dificuldades desafia a capacidade de equalização dos relacionamentos verticais entre as hierarquias.', 'F'),
	(24, 11, 1, '<img src="/images/questoes/729dbc5e4dfaea74f6db167b2370e177.png">', 'F'),
	(25, 11, 2, '<img src="/images/questoes/52a0f65f9973bc093ed3e90b28676c73.png">', 'T'),
	(26, 11, 3, '<img src="/images/questoes/0345609a9a1596aaa27f18759da60f33.png"><br>', 'F');
/*!40000 ALTER TABLE `questaoalternativa` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaocomentario
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
  KEY `FK_questaocomentario_aluno` (`IdAluno`),
  KEY `FK_questaocomentario_questaocomentario` (`IdComentarioRespondido`),
  CONSTRAINT `FK_questaocomentario_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_questaocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`),
  CONSTRAINT `FK_questaocomentario_questaocomentario` FOREIGN KEY (`IdComentarioRespondido`) REFERENCES `questaocomentario` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaocomentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `questaocomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `questaocomentario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaodescritor
CREATE TABLE IF NOT EXISTS `questaodescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__questao` (`IdQuestao`),
  KEY `FK__descritor` (`IdDescritor`),
  CONSTRAINT `FK__descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `FK__questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaodescritor: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `questaodescritor` DISABLE KEYS */;
INSERT INTO `questaodescritor` (`Id`, `IdQuestao`, `IdDescritor`) VALUES
	(4, 37, 3),
	(5, 37, 10),
	(10, 36, 12);
/*!40000 ALTER TABLE `questaodescritor` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaodica
CREATE TABLE IF NOT EXISTS `questaodica` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Texto` text NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoDica_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaodica_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaodica: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `questaodica` DISABLE KEYS */;
INSERT INTO `questaodica` (`Id`, `IdQuestao`, `Numero`, `Texto`) VALUES
	(1, 1, 1, 'Muito fácil!\r\ndfgdfgfd  sdgfdghfdgf dsgg\r\n<b>fdgfdgdg</b>'),
	(2, 1, 2, 'asdfdsafafasdg'),
	(3, 1, 3, 'saasdsd fbdfb dfg'),
	(13, 5, 1, 'sadgfsgfdhsgdh'),
	(14, 5, 2, 'dfshsdhsd'),
	(15, 5, 3, 'dfshdfh'),
	(22, 8, 1, 'dica doida 1'),
	(23, 8, 2, 'dsagsdfgsd'),
	(24, 8, 3, 'dgsdgsdg'),
	(25, 8, 4, 'dfgsdgsdf'),
	(26, 1, 4, 'Essa dica é massa! é só prestar atenção que você consegue! :D'),
	(27, 9, 1, 'sdagjhlfkg\r\nagfdgfsdgfdg'),
	(29, 10, 1, 'A certificação de metodologias que nos auxiliam a lidar com o início da atividade geral de formação de atitudes possibilita uma melhor visão global dos índices pretendidos.'),
	(30, 10, 2, 'Ainda assim, existem dúvidas a respeito de como a expansão dos mercados mundiais cumpre um papel essencial na formulação do orçamento setorial.'),
	(31, 10, 3, 'O cuidado em identificar pontos críticos na necessidade de renovação processual apresenta tendências no sentido de aprovar a manutenção das novas proposições.'),
	(32, 11, 1, 'dsfdsfs'),
	(49, 36, 1, 'No mundo atual, o julgamento imparcial das eventualidades possibilita uma melhor visão global do orçamento setorial.');
/*!40000 ALTER TABLE `questaodica` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaorespostamidia
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaorespostamidia: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `questaorespostamidia` DISABLE KEYS */;
INSERT INTO `questaorespostamidia` (`Id`, `IdQuestao`, `Url`, `IdTipoMidia`) VALUES
	(1, 8, 'http://www.youtube.com/watch?v=BfXKKxHQsGo', 4),
	(2, 9, 'http://www.youtube.com/watch?v=jofNR_WkoCE', 4),
	(3, 10, 'http://www.youtube.com/watch?v=L9-eCejHQXI', 4),
	(4, 10, 'dsadfasfaf', 2),
	(5, 10, 'asfasfasfasf', 1),
	(7, 36, '&lt;iframe width=&quot;250&quot; height=&quot;220&quot; src=&quot;//www.youtube.com/embed/j9PWT_5gdzs&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 4);
/*!40000 ALTER TABLE `questaorespostamidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.respostaaluno
CREATE TABLE IF NOT EXISTS `respostaaluno` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `TextoQuestao` varchar(4000) NOT NULL,
  `ImagemQuestao` varchar(4000) DEFAULT NULL,
  `TipoQuestao` char(3) NOT NULL,
  `RespostaQuestao` varchar(4000) NOT NULL,
  `PediuDica` enum('T','F') NOT NULL DEFAULT 'F',
  `RespostaAluno` varchar(4000) NOT NULL,
  `Acertou` enum('T','F') NOT NULL DEFAULT 'F',
  `TempoAluno` time NOT NULL,
  `DataHoraRespostaAluno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IdAluno` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_respostaaluno_questao` (`IdQuestao`),
  KEY `FK_respostaaluno_aluno` (`IdAluno`),
  CONSTRAINT `FK_respostaaluno_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_respostaaluno_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.respostaaluno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `respostaaluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaaluno` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.respostaalunoalternativa
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

-- Copiando dados para a tabela wiquadro.respostaalunoalternativa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `respostaalunoalternativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaalunoalternativa` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.tipomidia
CREATE TABLE IF NOT EXISTS `tipomidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.tipomidia: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomidia` DISABLE KEYS */;
INSERT INTO `tipomidia` (`Id`, `Tipo`) VALUES
	(1, 'TEXT'),
	(2, 'HTML'),
	(3, 'EDI'),
	(4, 'VIDEO'),
	(5, 'AUDIO');
/*!40000 ALTER TABLE `tipomidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.turma
CREATE TABLE IF NOT EXISTS `turma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `IdProfessor` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  `IdProjeto` int(11) NOT NULL,
  `Status` enum('CADASTRADA','ATIVA','CONCLUIDA','CANCELADA') NOT NULL DEFAULT 'CADASTRADA',
  `IdDisciplina` int(11) NOT NULL,
  `BloqueiaMidia` tinyint(4) NOT NULL COMMENT 'Determina se a midia é exibida ou não antes de selecionar todas as dicas.',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Turma_Nome` (`IdEscola`,`Nome`),
  KEY `FK_turma_usuario` (`IdProfessor`),
  KEY `FK_turma_projeto` (`IdProjeto`),
  KEY `FK_turma_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_turma_escola` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`Id`),
  CONSTRAINT `FK_turma_projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`),
  CONSTRAINT `FK_turma_usuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.turma: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`Id`, `Nome`, `IdProfessor`, `IdEscola`, `IdProjeto`, `Status`, `IdDisciplina`, `BloqueiaMidia`) VALUES
	(1, 'Turma 01', 1, 3, 4, 'CADASTRADA', 8, 1),
	(2, 'Turma 023', 2, 3, 3, 'CADASTRADA', 8, 1),
	(3, 'Turma 03', 1, 4, 2, 'CADASTRADA', 4, 1),
	(4, '2014.1M-LO3', 2, 3, 2, 'CADASTRADA', 3, 1);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.turmaauladata
CREATE TABLE IF NOT EXISTS `turmaauladata` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdAula` int(11) NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__turma` (`IdTurma`),
  KEY `FK__aula` (`IdAula`),
  CONSTRAINT `FK__aula` FOREIGN KEY (`IdAula`) REFERENCES `aula` (`Id`),
  CONSTRAINT `FK__turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.turmaauladata: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `turmaauladata` DISABLE KEYS */;
INSERT INTO `turmaauladata` (`Id`, `IdTurma`, `IdAula`, `DataInicio`, `DataFim`) VALUES
	(1, 5, 11, '2014-01-25', '2014-01-29'),
	(2, 5, 10, '2014-01-18', '2014-01-22'),
	(3, 1, 2, '2014-01-01', '2014-01-03'),
	(4, 1, 5, '2014-01-27', '2014-01-29'),
	(5, 1, 3, '2014-01-30', '2014-01-31'),
	(6, 1, 1, '2014-02-23', '2014-02-26'),
	(7, 1, 8, '2014-03-19', '2014-03-31');
/*!40000 ALTER TABLE `turmaauladata` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `IdCliente` int(11) NOT NULL,
  `UniqId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Usuario_Email` (`Email`),
  KEY `FK_usuario_cliente` (`IdCliente`),
  CONSTRAINT `FK_usuario_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`Id`, `Nome`, `Email`, `Senha`, `Ativo`, `IdCliente`, `UniqId`) VALUES
	(1, 'David Figueiredo', 'davidmkt@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 2, '{03A9BC23-12F5-676E-A5CF-46E5F3C2C415}'),
	(2, 'Leandro Fortaleza', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 2, '{1A967D1E-5016-B920-79BA-EB149963FCA8}'),
	(3, 'Figueiredo', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'T', 2, '{131015DD-52B9-52E6-4A55-6DBE401A67C2}'),
	(4, 'Wiquadro', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 1, NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuariogrupousuario
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.usuariogrupousuario: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariogrupousuario` DISABLE KEYS */;
INSERT INTO `usuariogrupousuario` (`Id`, `IdUsuario`, `IdGrupoUsuario`, `IdProjeto`) VALUES
	(4, 1, 1, 3),
	(8, 1, 2, 4),
	(6, 2, 1, 1),
	(7, 2, 1, 4),
	(1, 3, 3, NULL),
	(9, 4, 5, NULL);
/*!40000 ALTER TABLE `usuariogrupousuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuariopermissaoacesso
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

-- Copiando dados para a tabela wiquadro.usuariopermissaoacesso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariopermissaoacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariopermissaoacesso` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
