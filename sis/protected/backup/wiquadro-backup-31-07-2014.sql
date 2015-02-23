-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.5.34-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              8.2.0.4675
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela wiquadro.alternativasatisfacao
DROP TABLE IF EXISTS `alternativasatisfacao`;
CREATE TABLE IF NOT EXISTS `alternativasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdPerguntaSatisfacao` int(10) unsigned NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_alternativasatisfacao_perguntasatisfacao` (`IdPerguntaSatisfacao`),
  CONSTRAINT `FK_alternativasatisfacao_perguntasatisfacao` FOREIGN KEY (`IdPerguntaSatisfacao`) REFERENCES `perguntasatisfacao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alternativasatisfacao: ~42 rows (aproximadamente)
/*!40000 ALTER TABLE `alternativasatisfacao` DISABLE KEYS */;
INSERT INTO `alternativasatisfacao` (`Id`, `IdPerguntaSatisfacao`, `Descricao`) VALUES
	(31, 12, 'explicativos e fáceis de entender.'),
	(32, 12, 'confusos e complicados.'),
	(33, 13, 'criativos, dinâmicos e divertidos.'),
	(34, 13, 'cansativos e repetitivos.'),
	(35, 14, 'ótimo'),
	(36, 14, 'bom'),
	(37, 14, 'regular'),
	(38, 14, 'ruim'),
	(39, 14, 'prefiro não opinar sobre este tópico'),
	(40, 15, 'ótimo'),
	(41, 15, 'bom'),
	(42, 15, 'regular'),
	(43, 15, 'ruim'),
	(44, 15, 'prefiro não opinar sobre este tópico'),
	(45, 16, 'ótimo'),
	(46, 16, 'bom'),
	(47, 16, 'regular'),
	(48, 16, 'ruim'),
	(49, 16, 'prefiro não opinar sobre este tópico'),
	(50, 17, 'ótimo'),
	(51, 17, 'bom'),
	(52, 17, 'regular'),
	(53, 17, 'ruim'),
	(54, 17, 'prefiro não opinar sobre este tópico'),
	(55, 18, 'ótimo'),
	(56, 18, 'bom'),
	(57, 18, 'regular'),
	(58, 18, 'ruim'),
	(59, 18, 'prefiro não opinar sobre este tópico'),
	(60, 19, 'ótimo'),
	(61, 19, 'bom'),
	(62, 19, 'regular'),
	(63, 19, 'ruim'),
	(64, 19, 'prefiro não opinar sobre este tópico'),
	(65, 20, 'Lição 01'),
	(66, 20, 'Lição 02'),
	(67, 20, 'Lição N'),
	(68, 21, 'ótimo'),
	(69, 21, 'bom'),
	(70, 21, 'regular'),
	(71, 21, 'ruim'),
	(72, 21, 'prefiro não opinar sobre este tópico');
/*!40000 ALTER TABLE `alternativasatisfacao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.aluno
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.aluno: ~52 rows (aproximadamente)
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` (`Id`, `Nome`, `Email`, `Senha`, `Nascimento`, `Cidade`, `UF`, `Ativo`, `UniqId`, `Foto`, `reqCode`) VALUES
	(1, 'Emmerson Siqueira de Lima', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70', '1993-10-10', 'Natal', 'RN', 'T', '{7AE654E1-CBB6-BCE8-91E5-349B1EC2EB63}', '1398689917859_graduate-member.jpg', NULL),
	(33, 'Henri Michel', 'henri@wilivro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-04', 'Natal', 'RN', 'T', '{65091028-E60A-D992-620F-35F981B31931}', NULL, NULL),
	(35, 'David de Lima Figueiredo', 'david@fonosystem.com', '202cb962ac59075b964b07152d234b70', '2000-02-12', 'Natal', 'RN', 'T', '{A09221CC-8FA2-E1E7-3907-134BB7F604C1}', NULL, NULL),
	(36, 'teste de cadastro de aluno', 'tertiyre@roityr.com', 'e10adc3949ba59abbe56e057f20f883e', '2000-02-12', 'Natal', 'RN', 'F', NULL, NULL, NULL),
	(40, 'Mauricio Figueiredo', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'PARNAMIRIM', 'RN', 'T', '{FD7AFDE9-75BE-C7CC-4FA8-EA824666A317}', NULL, NULL),
	(41, 'emmerson siqueira', 'emmerson@emmerson.com', '202cb962ac59075b964b07152d234b70', '1993-07-01', 'natal', 'rn', 'F', '{8EAD5593-03C5-0ABF-8587-0E4856D71A27}', NULL, NULL),
	(44, 'Aluno Teste', 'sergio_felipe7@hotmail.com', '123456', '2014-04-08', 'Natal', 'RN', 'F', '{8D00CC1C-B427-F2BF-5F4B-74BB7B9A10DE}', NULL, '5346f4fd7457c'),
	(47, 'Eu', 'davidfigueiredo@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2014-04-08', 'PARNAMIRIM', 'RN', 'F', '{2FDCFFF8-4003-F809-1B72-A2C8708D7DE9}', NULL, NULL),
	(48, 'Eu', 'contato@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '2014-04-08', 'PARNAMIRIM', 'RN', 'F', '{CA9EB03F-6AA5-62DD-AD09-7D257BAC5FD6}', NULL, NULL),
	(49, 'Sergio Felipe G Roza', 'sergio.12@gmail.com', '202cb962ac59075b964b07152d234b70', '1993-03-12', 'natal', 'rn', 'F', '{398A8737-AB43-3E6B-C539-DC1B453B7341}', NULL, NULL),
	(50, 'Sergio Felipe G Roza', 'sergio.123@gmail.com', '202cb962ac59075b964b07152d234b70', '1993-03-12', 'natal', 'rn', 'F', '{CCFA069B-F9B1-26C8-69C0-3CAFF455DCA4}', NULL, NULL),
	(51, 'Sergio Felipe G Roza', 'sergio.1234@gmail.com', '202cb962ac59075b964b07152d234b70', '1993-03-12', 'natal', 'rn', 'F', '{A347DDF9-90BA-56BE-DFD1-3F6FB0F0290F}', NULL, NULL),
	(52, 'Sergio Felipe G Roza', 'sergio.kalmik33@gmail.com', '202cb962ac59075b964b07152d234b70', '1994-03-12', '123', '13', 'F', '{F34AA1BE-A1FF-C369-6EF0-FDEECB7CB067}', NULL, NULL),
	(53, 'Sergio Felipe G Roza', 'sergio.kalmik333@gmail.com', '202cb962ac59075b964b07152d234b70', '1998-02-12', 'natal', 'rn', 'F', '{B9EB1416-7BDF-DA49-B9BA-7493B95EED0E}', NULL, NULL),
	(54, 'Sergio Felipe G Roza', 'sergio.kalmik12312@gmail.com', '202cb962ac59075b964b07152d234b70', '1993-02-12', 'natal', 'rn', 'F', '{F16164D4-C5BC-03E7-881F-9BA11632AF99}', NULL, NULL),
	(55, 'Sergio Felipe G Roza', 'sergio.kalmik123123@gmail.com', '202cb962ac59075b964b07152d234b70', '1993-02-12', 'natal', 'rn', 'F', '{C52FB51D-0B8F-9A23-3D45-F5CD7B47AFAC}', NULL, NULL),
	(56, 'Serginho', 'webmaster@elejase.com', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'F', '{E6E26DC8-BF55-13BF-260B-3DDC9C57F7A2}', NULL, NULL),
	(57, 'joao', 'joao@joao.com', '7815696ecbf1c96e6894b779456d330e', '1990-03-05', 'natal', 'rn', 'F', '{C618984B-B2DA-C73E-A5AC-61045592BED6}', NULL, NULL),
	(69, 'joao', 'joao@joao.com.br', '7815696ecbf1c96e6894b779456d330e', '1990-03-05', 'Natal', 'RN', 'F', '{BA506CB4-5585-9752-BADB-B4A560162B8E}', NULL, NULL),
	(71, 'joao', 'joao@joao.com.brr', '7815696ecbf1c96e6894b779456d330e', '1980-02-05', 'Natal', 'RN', 'F', '{8A91E75C-A474-AB8A-77B6-8875D245B1D5}', NULL, NULL),
	(73, 'DivTestes', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'Natal', 'RN', 'T', '{E75CF6F9-E6D5-9EC7-AD7D-91B5A440CC53}', NULL, NULL),
	(76, 'felipe', 'teste@teste.com', '202cb962ac59075b964b07152d234b70', '1993-04-12', 'natal', 'rn', 'T', '{BABEF2FF-38DD-FBFC-4B6F-86CA25C19C37}', NULL, NULL),
	(77, 'felipe2', 'teste2@teste.com', '202cb962ac59075b964b07152d234b70', '1992-02-12', 'natal', 'rn', 'T', '{119B7673-591B-BEC4-4D66-A127B475B60B}', NULL, NULL),
	(78, 'teste3', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70', '1993-02-12', 'natan', 'rn', 'T', '{9DA19577-7760-E46A-A8BA-09A2D1F39C0E}', NULL, NULL),
	(79, 'Emmerson Wiquadro', 'emmerson@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'T', '{51030CC3-981E-582B-3CA3-7D5AF7BEAF3D}', NULL, NULL),
	(80, 'Ewerton', 'ewerton@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'T', '{8DF0F0C1-CB63-0AE6-B798-7364851CA8C0}', NULL, NULL),
	(81, 'emmerson hotmail', 'emmersonsiqueira@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '1993-07-01', 'Natal', 'RN', 'T', '{2E791B0F-17C6-CB3D-A3E5-01412AFB6863}', NULL, NULL),
	(82, 'joao wiquadro', 'joao@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'T', '{E4256934-DAB0-D247-8C6F-28A366AC1B50}', NULL, NULL),
	(83, 'teste de server offline', 'manel@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'Natal', 'RN', 'T', '{EB99C28E-9B35-A213-C0BC-E1F9CF6BF92C}', NULL, NULL),
	(85, 'teste de server online', 'dayane@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'São Gonçalo do Amarante', 'RN', 'T', '{612EF507-2A1A-7EC7-1007-7A4E24211814}', NULL, NULL),
	(86, 'segundo teste online', 'heriberto@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'Natal', 'RN', 'T', '{EE7D52DE-FE82-401F-B315-21652BA8941B}', NULL, NULL),
	(87, 'mais um teste server offline', 'david@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1986-12-26', 'Natal', 'RN', 'T', '{078E2BF5-1EB1-BF8A-146C-9540A1D3F2B5}', NULL, NULL),
	(89, 'teste wiquadro online', 'fortaleza@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '0000-00-00', 'Natal', 'RN', 'T', '{8C8EEF50-9D76-B2F5-E42A-BD6E29268306}', NULL, NULL),
	(117, 'teste1', 'testee@teste.com', '123456', '2004-07-08', 'Natal', 'RN', 'T', '\'{7AE654E1-CBB6-BCE8-91E5-349B1EC2EB88}\'', 'NULL', 'NULL'),
	(118, 'teste2', 'testeee@teste.com', '123654', '2003-07-08', 'Natal', 'RN', 'T', '\'{7AE654E1-CBB6-BCE8-91E5-349B1EC2EB77}\'', 'NULL', 'NULL'),
	(119, 'aluno1954', 'teste@aluno1954.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1993-07-01', 'natal', 'rn', 'T', '{11CD7961-1037-A3CA-B2CF-2D0849F05107}', '1405952245023_Funny 7.gif', NULL),
	(120, 'babi', 'babi@babi.com', '202cb962ac59075b964b07152d234b70', '1992-04-07', 'natal', 'rn', 'F', '{A70788D7-AC6E-C5C4-29EE-AB0DB93D3908}', NULL, NULL),
	(122, 'babi', 'babi@wiquadro.com.br', '202cb962ac59075b964b07152d234b70', '1992-04-07', 'natal', 'rn', 'F', '{A780637B-A962-4A8F-470C-A58A1ECD627F}', NULL, NULL),
	(123, 'emmerson', 'emmesrson@wiquadro.com.br', '202cb962ac59075b964b07152d234b70', '0000-00-00', 'natal', 'rn', 'T', '{715D023E-375C-98EC-E71D-314CE9DD8944}', NULL, NULL),
	(125, 'emmerson', 'henri@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e', '1993-06-01', 'natal', 'rn', 'T', '{6B380E4D-7BE5-8A28-9749-64E4B8A70292}', NULL, NULL),
	(140, 'teste', 'teste@wiquadro.com.br', '202cb962ac59075b964b07152d234b70', '1990-02-07', 'natal', 'rn', 'T', '{C077FFE5-7F3D-EA07-3AF2-EB5CAF31437A}', NULL, NULL),
	(141, 'testee', 'testee@gmail.com', '202cb962ac59075b964b07152d234b70', '1992-02-01', 'natal', 'rn', 'F', '{0F06A0F1-B448-777F-CE69-4380AEBFFDB4}', NULL, NULL),
	(142, 'emmerson', 'emmerson@emmerson.net', '202cb962ac59075b964b07152d234b70', '1992-03-01', 'natal', 'rn', 'F', '{B75890D1-47BB-6778-2402-16A75BB604A9}', NULL, NULL),
	(143, 'testee', 'teste55@wiquadro.com.br', '202cb962ac59075b964b07152d234b70', '1993-06-07', 'natal', 'rn', 'T', '{43261D84-6780-8132-3575-90E84DCBD3C4}', NULL, NULL),
	(145, 'emmerson', 'testeeeee@wiquadro.com.br', '202cb962ac59075b964b07152d234b70', '1990-04-01', 'natal', 'rn', 'T', '{67D194C4-872A-17C0-7C77-AEE50DB6447A}', NULL, NULL),
	(146, 'emmerson', 'emmerson@emmerson.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1990-06-30', 'natal', 'rn', 'F', '{B6BE8FD5-D8DB-F34F-3687-6F70C1711779}', NULL, NULL),
	(147, 'teste offline', 'teste@testeoffline.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1992-02-25', 'natal', 'rn', 'T', '{6E1A7132-B6D4-72B5-EBCC-2A71D8558E5A}', NULL, NULL),
	(148, 'ewerton siqueira', 'ewerton@ewerton.com', 'c3184c089a3047eff3950d77b023d0dd', '1990-12-25', 'natal', 'rn', 'T', '{7EF8CC9F-5BFC-FCC0-1319-2ECC6C40396C}', '', NULL),
	(149, 'hello google', 'hello@google.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1990-02-15', 'natal', 'rn', 'F', '{D51245BB-47B9-E326-CE17-6895B217E82F}', NULL, NULL),
	(150, 'henri novo layout', 'henri@novolayout.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1987-12-22', 'natal', 'RN', 'F', '{E4A816FC-DAF4-0A45-A220-58871022583A}', NULL, NULL),
	(151, 'teste sem email flag', 'email@wiquadro.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1995-01-01', 'natal', 'RN', 'T', '{D24DE8C8-E3D6-8205-BE19-83F6946E7F56}', NULL, NULL),
	(152, 'teste', 'test@wiquadro.com.br', 'c3184c089a3047eff3950d77b023d0dd', '1995-02-05', 'natal', 'RN', 'T', '{65109CFB-DDB4-0C18-0B24-42509E5EC9EC}', NULL, NULL);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoalternativasatisfacao
DROP TABLE IF EXISTS `alunoalternativasatisfacao`;
CREATE TABLE IF NOT EXISTS `alunoalternativasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurma` int(10) NOT NULL,
  `IdPerguntaSatisfacao` int(10) unsigned NOT NULL,
  `IdAlternativaSatisfacao` int(10) unsigned NOT NULL,
  `DataHora` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoalternativasatisfacao_alternativasatisfacao` (`IdAlternativaSatisfacao`),
  KEY `FK_alunoalternativasatisfacao_perguntasatisfacao` (`IdPerguntaSatisfacao`),
  KEY `FK_alunoalternativasatisfacao_alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_alunoalternativasatisfacao_alternativasatisfacao` FOREIGN KEY (`IdAlternativaSatisfacao`) REFERENCES `alternativasatisfacao` (`Id`),
  CONSTRAINT `FK_alunoalternativasatisfacao_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_alunoalternativasatisfacao_perguntasatisfacao` FOREIGN KEY (`IdPerguntaSatisfacao`) REFERENCES `perguntasatisfacao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoalternativasatisfacao: ~45 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoalternativasatisfacao` DISABLE KEYS */;
INSERT INTO `alunoalternativasatisfacao` (`Id`, `IdAlunoTurma`, `IdPerguntaSatisfacao`, `IdAlternativaSatisfacao`, `DataHora`) VALUES
	(55, 1, 13, 33, '2014-05-26 16:05:38'),
	(56, 1, 14, 35, '2014-05-26 16:05:38'),
	(57, 1, 15, 41, '2014-05-26 16:05:38'),
	(58, 1, 16, 48, '2014-05-26 16:05:38'),
	(59, 1, 17, 50, '2014-05-26 16:05:38'),
	(60, 1, 18, 57, '2014-05-26 16:05:38'),
	(61, 1, 19, 63, '2014-05-26 16:05:38'),
	(62, 1, 20, 65, '2014-05-26 16:05:38'),
	(63, 1, 20, 67, '2014-05-26 16:05:38'),
	(64, 1, 21, 69, '2014-05-26 16:05:38'),
	(68, 1, 12, 31, '2014-05-26 17:05:49'),
	(80, 4, 12, 31, '2014-06-23 13:06:58'),
	(81, 4, 13, 33, '2014-06-23 13:06:58'),
	(82, 4, 14, 35, '2014-06-23 13:06:58'),
	(83, 4, 15, 40, '2014-06-23 13:07:11'),
	(84, 4, 16, 45, '2014-06-23 13:07:11'),
	(85, 4, 17, 50, '2014-06-23 13:07:11'),
	(86, 4, 18, 55, '2014-06-23 13:07:11'),
	(87, 4, 20, 65, '2014-06-23 13:07:11'),
	(88, 4, 20, 66, '2014-06-23 13:07:11'),
	(89, 4, 20, 67, '2014-06-23 13:07:11'),
	(90, 4, 21, 69, '2014-06-23 13:07:11'),
	(91, 59, 12, 31, '2014-06-26 12:01:15'),
	(92, 59, 13, 34, '2014-06-26 12:01:15'),
	(93, 59, 14, 36, '2014-06-26 12:01:15'),
	(94, 59, 15, 42, '2014-06-26 12:01:15'),
	(95, 59, 16, 45, '2014-06-26 12:01:15'),
	(96, 59, 17, 51, '2014-06-26 12:01:15'),
	(97, 59, 18, 57, '2014-06-26 12:01:15'),
	(98, 59, 19, 60, '2014-06-26 12:01:15'),
	(99, 59, 20, 65, '2014-06-26 12:01:15'),
	(100, 59, 20, 66, '2014-06-26 12:01:15'),
	(101, 59, 20, 67, '2014-06-26 12:01:15'),
	(102, 59, 21, 72, '2014-06-26 12:01:15'),
	(103, 110, 12, 31, '2014-06-27 09:25:23'),
	(104, 110, 13, 34, '2014-06-27 09:25:23'),
	(105, 110, 14, 37, '2014-06-27 09:25:23'),
	(106, 110, 15, 41, '2014-06-27 09:25:23'),
	(107, 110, 16, 46, '2014-06-27 09:25:23'),
	(108, 110, 17, 52, '2014-06-27 09:25:23'),
	(109, 110, 18, 55, '2014-06-27 09:25:23'),
	(110, 110, 19, 62, '2014-06-27 09:25:23'),
	(111, 110, 20, 65, '2014-06-27 09:25:23'),
	(112, 110, 20, 67, '2014-06-27 09:25:23'),
	(113, 110, 21, 72, '2014-06-27 09:25:23');
/*!40000 ALTER TABLE `alunoalternativasatisfacao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunochat
DROP TABLE IF EXISTS `alunochat`;
CREATE TABLE IF NOT EXISTS `alunochat` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `Mensagem` text NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `DataHora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_alunochat_aluno` (`IdAluno`),
  KEY `FK_alunochat_turma` (`IdTurma`),
  CONSTRAINT `FK_alunochat_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_alunochat_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunochat: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alunochat` DISABLE KEYS */;
/*!40000 ALTER TABLE `alunochat` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturma
DROP TABLE IF EXISTS `alunoturma`;
CREATE TABLE IF NOT EXISTS `alunoturma` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) NOT NULL,
  `IdTurma` int(11) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DataHoraRespostaSatisfacao` datetime DEFAULT NULL,
  `Situacao` enum('E','A','R') NOT NULL COMMENT 'E = Em Andamento; A = Aprovado; R = Reprovado;',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_AlunoTurma_Id` (`IdAluno`,`IdTurma`),
  KEY `FK_alunoturma_turma` (`IdTurma`),
  CONSTRAINT `FK_alunoturma_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_alunoturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='essa tabela funciona como "matricula" do aluno para a turma.';

-- Copiando dados para a tabela wiquadro.alunoturma: ~148 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturma` DISABLE KEYS */;
INSERT INTO `alunoturma` (`Id`, `IdAluno`, `IdTurma`, `Data`, `DataHoraRespostaSatisfacao`, `Situacao`) VALUES
	(1, 1, 1, '2014-02-11 10:46:20', '2014-05-26 17:05:49', 'E'),
	(4, 1, 3, '2014-02-11 10:46:20', '2014-06-23 13:06:00', 'E'),
	(5, 40, 2, '2014-02-11 10:46:20', NULL, 'E'),
	(6, 40, 3, '2014-02-11 10:46:20', NULL, 'E'),
	(7, 40, 4, '2014-02-11 10:46:20', NULL, 'E'),
	(8, 1, 4, '2014-02-11 10:46:20', NULL, 'E'),
	(10, 33, 4, '2014-02-11 10:46:20', NULL, 'E'),
	(11, 35, 4, '2014-02-11 10:46:20', NULL, 'E'),
	(12, 41, 5, '2014-02-11 10:46:20', NULL, 'E'),
	(13, 41, 2, '2014-02-11 10:46:20', NULL, 'E'),
	(14, 41, 3, '2014-02-11 10:46:20', NULL, 'E'),
	(15, 41, 4, '2014-02-11 10:46:20', NULL, 'E'),
	(24, 44, 4, '2014-04-08 11:07:53', NULL, 'E'),
	(25, 44, 5, '2014-04-08 11:07:53', NULL, 'E'),
	(26, 44, 6, '2014-04-08 11:07:53', NULL, 'E'),
	(27, 44, 7, '2014-04-08 11:07:53', NULL, 'E'),
	(28, 44, 8, '2014-04-08 11:07:53', NULL, 'E'),
	(29, 44, 2, '2014-04-08 11:07:53', NULL, 'E'),
	(30, 44, 3, '2014-04-08 11:07:53', NULL, 'E'),
	(38, 47, 4, '2014-04-08 11:18:26', NULL, 'E'),
	(39, 47, 5, '2014-04-08 11:18:26', NULL, 'E'),
	(40, 47, 6, '2014-04-08 11:18:26', NULL, 'E'),
	(41, 47, 7, '2014-04-08 11:18:26', NULL, 'E'),
	(42, 47, 8, '2014-04-08 11:18:26', NULL, 'E'),
	(43, 47, 2, '2014-04-08 11:18:26', NULL, 'E'),
	(44, 47, 3, '2014-04-08 11:18:26', NULL, 'E'),
	(45, 48, 4, '2014-04-08 11:39:08', NULL, 'E'),
	(46, 48, 5, '2014-04-08 11:39:08', NULL, 'E'),
	(48, 48, 7, '2014-04-08 11:39:08', NULL, 'E'),
	(50, 48, 2, '2014-04-08 11:39:08', NULL, 'E'),
	(51, 48, 3, '2014-04-08 11:39:08', NULL, 'E'),
	(57, 1, 5, '2014-05-02 09:18:58', NULL, 'E'),
	(58, 1, 2, '2014-05-02 16:13:21', NULL, 'E'),
	(59, 1, 9, '2014-05-02 17:43:24', '2014-06-26 12:06:01', 'E'),
	(60, 49, 4, '2014-05-05 17:52:33', NULL, 'E'),
	(61, 49, 5, '2014-05-05 17:52:33', NULL, 'E'),
	(62, 49, 6, '2014-05-05 17:52:33', NULL, 'E'),
	(63, 49, 7, '2014-05-05 17:52:33', NULL, 'E'),
	(64, 49, 8, '2014-05-05 17:52:33', NULL, 'E'),
	(65, 49, 2, '2014-05-05 17:52:33', NULL, 'E'),
	(66, 49, 3, '2014-05-05 17:52:33', NULL, 'E'),
	(67, 49, 11, '2014-05-05 17:52:33', NULL, 'E'),
	(68, 49, 9, '2014-05-05 17:52:33', NULL, 'E'),
	(69, 49, 10, '2014-05-05 17:52:33', NULL, 'E'),
	(70, 50, 4, '2014-05-05 17:56:56', NULL, 'E'),
	(71, 50, 5, '2014-05-05 17:56:56', NULL, 'E'),
	(72, 50, 6, '2014-05-05 17:56:56', NULL, 'E'),
	(73, 50, 7, '2014-05-05 17:56:56', NULL, 'E'),
	(74, 50, 8, '2014-05-05 17:56:56', NULL, 'E'),
	(75, 50, 2, '2014-05-05 17:56:56', NULL, 'E'),
	(78, 50, 9, '2014-05-05 17:56:56', NULL, 'E'),
	(79, 50, 10, '2014-05-05 17:56:56', NULL, 'E'),
	(80, 51, 4, '2014-05-05 17:57:39', NULL, 'E'),
	(81, 51, 5, '2014-05-05 17:57:39', NULL, 'E'),
	(82, 51, 6, '2014-05-05 17:57:39', NULL, 'E'),
	(83, 51, 7, '2014-05-05 17:57:39', NULL, 'E'),
	(84, 51, 8, '2014-05-05 17:57:40', NULL, 'E'),
	(85, 51, 2, '2014-05-05 17:57:40', NULL, 'E'),
	(86, 51, 3, '2014-05-05 17:57:40', NULL, 'E'),
	(87, 51, 11, '2014-05-05 17:57:40', NULL, 'E'),
	(88, 51, 9, '2014-05-05 17:57:40', NULL, 'E'),
	(89, 51, 10, '2014-05-05 17:57:40', NULL, 'E'),
	(90, 52, 4, '2014-05-06 13:07:20', NULL, 'E'),
	(91, 52, 5, '2014-05-06 13:07:20', NULL, 'E'),
	(92, 52, 6, '2014-05-06 13:07:20', NULL, 'E'),
	(93, 52, 7, '2014-05-06 13:07:20', NULL, 'E'),
	(94, 52, 8, '2014-05-06 13:07:20', NULL, 'E'),
	(95, 52, 2, '2014-05-06 13:07:20', NULL, 'E'),
	(96, 52, 3, '2014-05-06 13:07:20', NULL, 'E'),
	(97, 52, 11, '2014-05-06 13:07:20', NULL, 'E'),
	(98, 52, 9, '2014-05-06 13:07:20', NULL, 'E'),
	(99, 52, 10, '2014-05-06 13:07:20', NULL, 'E'),
	(100, 53, 4, '2014-05-06 13:09:32', NULL, 'E'),
	(101, 53, 5, '2014-05-06 13:09:32', NULL, 'E'),
	(102, 53, 6, '2014-05-06 13:09:32', NULL, 'E'),
	(103, 53, 7, '2014-05-06 13:09:32', NULL, 'E'),
	(104, 53, 8, '2014-05-06 13:09:32', NULL, 'E'),
	(105, 53, 2, '2014-05-06 13:09:32', NULL, 'E'),
	(106, 53, 3, '2014-05-06 13:09:32', NULL, 'E'),
	(107, 53, 11, '2014-05-06 13:09:32', NULL, 'E'),
	(108, 53, 9, '2014-05-06 13:09:32', NULL, 'E'),
	(109, 53, 10, '2014-05-06 13:09:32', NULL, 'E'),
	(110, 1, 13, '2014-05-14 09:06:19', '2014-06-27 09:06:25', 'E'),
	(111, 54, 4, '2014-05-15 15:55:23', NULL, 'E'),
	(112, 54, 5, '2014-05-15 15:55:23', NULL, 'E'),
	(113, 54, 6, '2014-05-15 15:55:23', NULL, 'E'),
	(114, 54, 7, '2014-05-15 15:55:23', NULL, 'E'),
	(115, 54, 8, '2014-05-15 15:55:23', NULL, 'E'),
	(116, 54, 2, '2014-05-15 15:55:23', NULL, 'E'),
	(117, 54, 3, '2014-05-15 15:55:23', NULL, 'E'),
	(118, 54, 11, '2014-05-15 15:55:23', NULL, 'E'),
	(119, 54, 9, '2014-05-15 15:55:23', NULL, 'E'),
	(120, 54, 10, '2014-05-15 15:55:23', NULL, 'E'),
	(121, 55, 4, '2014-05-15 16:06:05', NULL, 'E'),
	(122, 55, 5, '2014-05-15 16:06:05', NULL, 'E'),
	(123, 55, 6, '2014-05-15 16:06:05', NULL, 'E'),
	(124, 55, 7, '2014-05-15 16:06:05', NULL, 'E'),
	(125, 55, 8, '2014-05-15 16:06:05', NULL, 'E'),
	(126, 55, 2, '2014-05-15 16:06:05', NULL, 'E'),
	(127, 55, 3, '2014-05-15 16:06:05', NULL, 'E'),
	(128, 55, 11, '2014-05-15 16:06:05', NULL, 'E'),
	(129, 55, 9, '2014-05-15 16:06:05', NULL, 'E'),
	(130, 55, 10, '2014-05-15 16:06:05', NULL, 'E'),
	(131, 56, 4, '2014-05-15 16:10:39', NULL, 'E'),
	(132, 56, 5, '2014-05-15 16:10:39', NULL, 'E'),
	(133, 56, 6, '2014-05-15 16:10:39', NULL, 'E'),
	(134, 56, 7, '2014-05-15 16:10:39', NULL, 'E'),
	(135, 56, 8, '2014-05-15 16:10:39', NULL, 'E'),
	(136, 56, 2, '2014-05-15 16:10:39', NULL, 'E'),
	(137, 56, 3, '2014-05-15 16:10:39', NULL, 'E'),
	(138, 56, 11, '2014-05-15 16:10:39', NULL, 'E'),
	(139, 56, 9, '2014-05-15 16:10:39', NULL, 'E'),
	(140, 56, 10, '2014-05-15 16:10:39', NULL, 'E'),
	(141, 57, 4, '2014-05-17 10:37:07', NULL, 'E'),
	(142, 57, 5, '2014-05-17 10:37:07', NULL, 'E'),
	(143, 57, 6, '2014-05-17 10:37:07', NULL, 'E'),
	(144, 57, 7, '2014-05-17 10:37:07', NULL, 'E'),
	(145, 57, 8, '2014-05-17 10:37:07', NULL, 'E'),
	(146, 69, 4, '2014-05-17 11:18:26', NULL, 'E'),
	(147, 69, 5, '2014-05-17 11:18:26', NULL, 'E'),
	(148, 69, 6, '2014-05-17 11:18:26', NULL, 'E'),
	(149, 69, 7, '2014-05-17 11:18:26', NULL, 'E'),
	(150, 69, 8, '2014-05-17 11:18:26', NULL, 'E'),
	(151, 71, 4, '2014-05-17 11:20:29', NULL, 'E'),
	(152, 71, 5, '2014-05-17 11:20:29', NULL, 'E'),
	(153, 71, 6, '2014-05-17 11:20:29', NULL, 'E'),
	(154, 71, 7, '2014-05-17 11:20:29', NULL, 'E'),
	(155, 71, 8, '2014-05-17 11:20:29', NULL, 'E'),
	(176, 73, 11, '2014-05-19 14:51:35', NULL, 'E'),
	(199, 76, 4, '2014-06-03 16:51:52', NULL, 'E'),
	(200, 76, 5, '2014-06-03 16:51:52', NULL, 'E'),
	(201, 76, 6, '2014-06-03 16:51:52', NULL, 'E'),
	(202, 76, 7, '2014-06-03 16:51:52', NULL, 'E'),
	(203, 76, 8, '2014-06-03 16:51:52', NULL, 'E'),
	(204, 76, 14, '2014-06-03 16:51:52', NULL, 'E'),
	(205, 76, 2, '2014-06-03 16:51:52', NULL, 'E'),
	(206, 76, 3, '2014-06-03 16:51:52', NULL, 'E'),
	(207, 76, 11, '2014-06-03 16:51:52', NULL, 'E'),
	(208, 76, 9, '2014-06-03 16:51:52', NULL, 'E'),
	(209, 76, 10, '2014-06-03 16:51:52', NULL, 'E'),
	(210, 77, 14, '2014-06-03 17:02:14', NULL, 'E'),
	(211, 40, 13, '2014-06-04 09:47:30', NULL, 'E'),
	(212, 77, 5, '2014-06-04 09:53:38', NULL, 'E'),
	(213, 78, 6, '2014-06-04 11:22:46', NULL, 'E'),
	(214, 78, 14, '2014-06-04 11:23:40', NULL, 'E'),
	(215, 35, 1, '2014-07-18 14:55:46', NULL, 'E'),
	(216, 35, 13, '2014-07-18 16:38:51', NULL, 'E'),
	(217, 119, 13, '2014-07-21 10:31:46', NULL, 'E');
/*!40000 ALTER TABLE `alunoturma` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturmaedc
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
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaedc_alunoturma` (`IdAlunoTurma`),
  KEY `FK_alunoturmaedc_edc` (`IdEdc`),
  KEY `FK_alunoturmaedc_edcmidia` (`IdLastEdcMidia`),
  CONSTRAINT `FK_alunoturmaedc_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_alunoturmaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_alunoturmaedc_edcmidia` FOREIGN KEY (`IdLastEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='registra o desenvolvimento do aluno em um edc.';

-- Copiando dados para a tabela wiquadro.alunoturmaedc: ~41 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturmaedc` DISABLE KEYS */;
INSERT INTO `alunoturmaedc` (`Id`, `IdAlunoTurma`, `DataInicio`, `DataConclusao`, `IdEdc`, `IdLastEdcMidia`, `UltimoAcesso`, `Aprovado`) VALUES
	(48, 45, '2014-04-16', NULL, 7, 317, '2014-04-17 11:44:41', NULL),
	(49, 45, '2014-04-16', NULL, 1, NULL, '2014-04-16 09:56:35', NULL),
	(50, 45, '2014-04-16', NULL, 31, NULL, '2014-04-16 15:02:09', NULL),
	(51, 1, '2014-04-16', NULL, 41, 768, '2014-07-21 16:04:59', NULL),
	(52, 1, '2014-04-16', NULL, 7, 284, '2014-04-16 11:03:22', NULL),
	(53, 8, '2014-04-17', NULL, 1, 321, '2014-04-28 08:14:57', NULL),
	(54, 8, '2014-04-17', NULL, 7, 323, '2014-04-30 08:13:27', NULL),
	(55, 8, '2014-04-17', NULL, 32, NULL, '2014-04-17 08:24:27', NULL),
	(56, 8, '2014-04-17', NULL, 30, NULL, '2014-04-17 09:14:51', NULL),
	(57, 8, '2014-04-17', NULL, 31, NULL, '2014-04-17 09:20:56', NULL),
	(58, 8, '2014-04-17', NULL, 23, NULL, '2014-04-17 09:31:01', NULL),
	(59, 8, '2014-04-17', NULL, 24, NULL, '2014-04-17 10:05:41', NULL),
	(60, 8, '2014-04-17', NULL, 10, NULL, '2014-04-17 10:31:31', NULL),
	(61, 8, '2014-04-17', NULL, 33, 315, '2014-04-25 04:35:19', NULL),
	(62, 8, '2014-04-17', NULL, 16, NULL, '2014-04-17 12:25:19', NULL),
	(63, 8, '2014-04-17', NULL, 25, NULL, '2014-04-17 12:27:11', NULL),
	(64, 8, '2014-04-17', NULL, 19, NULL, '2014-04-17 12:27:28', NULL),
	(65, 8, '2014-04-17', NULL, 11, NULL, '2014-04-17 12:27:47', NULL),
	(66, 8, '2014-04-17', NULL, 9, NULL, '2014-04-17 12:31:58', NULL),
	(67, 8, '2014-04-17', NULL, 27, NULL, '2014-04-17 13:52:55', NULL),
	(68, 8, '2014-04-17', NULL, 14, NULL, '2014-04-17 14:16:17', NULL),
	(69, 8, '2014-04-17', NULL, 15, NULL, '2014-04-17 14:16:27', NULL),
	(70, 8, '2014-04-23', NULL, 26, NULL, '2014-04-23 15:50:03', NULL),
	(71, 8, '2014-04-23', NULL, 17, NULL, '2014-04-23 17:21:29', NULL),
	(72, 8, '2014-04-23', NULL, 29, NULL, '2014-04-23 17:26:23', NULL),
	(73, 8, '2014-04-23', NULL, 28, NULL, '2014-04-23 17:27:18', NULL),
	(74, 8, '2014-04-23', NULL, 22, NULL, '2014-04-23 17:27:35', NULL),
	(75, 8, '2014-04-24', NULL, 20, NULL, '2014-04-24 13:19:33', NULL),
	(76, 59, '2014-05-02', NULL, 7, 323, '2014-05-27 10:27:22', NULL),
	(77, 59, '2014-05-05', NULL, 9, 326, '2014-05-26 14:34:26', 'F'),
	(78, 59, '2014-05-05', '2014-05-14', 1, 659, '2014-07-14 10:13:56', 'T'),
	(79, 8, '2014-05-05', '2014-05-13', 37, 363, '2014-07-15 17:25:34', 'T'),
	(80, 109, '2014-05-06', NULL, 1, NULL, '2014-05-06 17:09:35', NULL),
	(81, 109, '2014-05-06', NULL, 7, 295, '2014-05-06 10:10:10', NULL),
	(82, 8, '2014-05-07', '2014-05-13', 39, 387, '2014-05-15 09:16:52', 'T'),
	(85, 211, '2014-06-04', NULL, 44, 667, '2014-06-04 09:55:57', NULL),
	(86, 214, '2014-06-04', NULL, 39, 365, '2014-06-04 04:24:59', NULL),
	(87, 57, '2014-06-24', '2014-06-24', 52, 715, '2014-06-24 10:23:21', 'T'),
	(89, 215, '2014-07-18', NULL, 41, 768, '2014-07-18 15:17:20', NULL),
	(90, 217, '2014-07-21', NULL, 45, 716, '2014-07-21 10:43:20', NULL),
	(91, 110, '2014-07-21', NULL, 45, 719, '2014-07-30 15:25:44', NULL);
/*!40000 ALTER TABLE `alunoturmaedc` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturmaedcmidia
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
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaedcmidia_edcmidia` (`IdEdcMidia`),
  KEY `FK_alunoturmaedcmidia_alunoturmaedc` (`IdAlunoTurmaEdc`),
  CONSTRAINT `FK_alunoturmaedcmidia_alunoturmaedc` FOREIGN KEY (`IdAlunoTurmaEdc`) REFERENCES `alunoturmaedc` (`Id`),
  CONSTRAINT `FK_alunoturmaedcmidia_edcmidia` FOREIGN KEY (`IdEdcMidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoturmaedcmidia: ~176 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturmaedcmidia` DISABLE KEYS */;
INSERT INTO `alunoturmaedcmidia` (`Id`, `IdAlunoTurmaEdc`, `IdEdcMidia`, `TempoTotal`, `TempoConclusao`, `Visualizacao`, `DataInicio`, `DataConclusao`, `UltimoAcesso`, `Favorito`, `PassarParaProximo`) VALUES
	(125, 48, 284, 28, 28, 1, '2014-04-16 00:00:00', '2014-04-16 00:00:00', '1397652775', 'F', 'F'),
	(126, 48, 295, 660, 18, 4, '2014-04-16 00:00:00', '2014-04-16 00:00:00', '1397746512', 'F', 'F'),
	(127, 48, 306, 10382, 6212, 27, '2014-04-16 00:00:00', '2014-04-16 00:00:00', '1397745882', 'F', 'F'),
	(128, 48, 317, 15522, 10055, 41, '2014-04-16 00:00:00', '2014-04-17 00:00:00', '1397744586', 'F', 'F'),
	(129, 52, 284, 31, NULL, 1, '2014-04-16 00:00:00', NULL, '1397682233', 'F', 'F'),
	(130, 54, 284, 8793, 13, 113, '2014-04-17 00:00:00', '2014-04-22 00:00:00', '1398715245', 'F', 'F'),
	(131, 54, 295, 20779, 2, 116, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398776249', 'F', 'F'),
	(132, 54, 306, 30436, 5, 93, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398801963', 'F', 'F'),
	(133, 54, 317, 24733, 4, 38, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398803941', 'F', 'F'),
	(134, 54, 320, 6104, 9, 39, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398860646', 'F', 'F'),
	(135, 53, 321, 8456, 6, 56, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398709018', 'F', 'F'),
	(136, 54, 322, 730, 8, 15, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398860657', 'F', 'F'),
	(137, 54, 323, 68100, 2054, 13, '2014-04-22 00:00:00', '2014-04-22 00:00:00', '1398860692', 'F', 'F'),
	(138, 54, 274, 1349, 1090, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398860773', 'F', 'F'),
	(139, NULL, 275, 165, 4, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398860782', 'F', 'F'),
	(140, 54, 276, 287, 3, 6, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398860837', 'F', 'F'),
	(141, 54, 277, 575, 3, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398860812', 'F', 'F'),
	(142, 54, 278, 882, 2, 8, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398861045', 'F', 'F'),
	(143, NULL, 279, 271, 3, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398861097', 'F', 'F'),
	(144, 54, 280, 2539, 2, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398861144', 'F', 'F'),
	(145, 54, 281, 199, 8, 6, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398861127', 'F', 'F'),
	(146, 54, 282, 2435, 2, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863415', 'F', 'F'),
	(147, 54, 283, 145, 2, 6, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863431', 'F', 'F'),
	(148, 54, 285, 174, 2, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863473', 'F', 'F'),
	(149, 54, 286, 109, 2, 7, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863480', 'F', 'F'),
	(150, 54, 287, 150, 2, 4, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863535', 'F', 'F'),
	(151, 54, 288, 148, 11, 6, '2014-04-23 00:00:00', '2014-04-23 00:00:00', '1398863545', 'F', 'F'),
	(152, 54, 289, 1667, 32, 5, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865086', 'F', 'F'),
	(153, 54, 290, 140, 31, 5, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865100', 'F', 'F'),
	(154, 54, 291, 144, 32, 5, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865116', 'F', 'F'),
	(155, 54, 292, 397, 32, 7, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865381', 'F', 'F'),
	(156, 54, 293, 364, 2, 7, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865597', 'F', 'F'),
	(157, NULL, 208, 14, 8, 4, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398364659', 'F', 'F'),
	(158, 61, 315, 15434, 7, 127, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398436579', 'F', 'F'),
	(159, 54, 294, 188, 32, 7, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865671', 'F', 'F'),
	(160, 54, 296, 199, 32, 4, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398865750', 'F', 'F'),
	(161, 54, 297, 949, 32, 4, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398866574', 'F', 'F'),
	(162, 54, 298, 3709, 10, 8, '2014-04-24 00:00:00', '2014-04-24 00:00:00', '1398866699', 'F', 'F'),
	(163, 54, 299, 839, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398867438', 'F', 'F'),
	(164, 54, 300, 137, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398867407', 'F', 'F'),
	(165, 54, 301, 12732, 31, 46, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880735', 'F', 'F'),
	(166, 54, 302, 121, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880793', 'F', 'F'),
	(167, 54, 303, 68, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880797', 'F', 'F'),
	(168, 54, 304, 77, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880811', 'F', 'F'),
	(169, 54, 305, 107, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880854', 'F', 'F'),
	(170, 54, 307, 81, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880872', 'F', 'F'),
	(171, 54, 308, 170, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398880977', 'F', 'F'),
	(172, 54, 309, 120, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881034', 'F', 'F'),
	(173, 54, 310, 64, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881007', 'F', 'F'),
	(174, 54, 311, 127, 31, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881098', 'F', 'F'),
	(175, 54, 312, 97, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881098', 'F', 'F'),
	(176, 54, 313, 152, 31, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881184', 'F', 'F'),
	(177, 54, 314, 471, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881565', 'F', 'F'),
	(178, 54, 316, 174, 32, 3, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881595', 'F', 'F'),
	(179, 54, 318, 226, 32, 4, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398881641', 'F', 'F'),
	(180, 54, 319, 36477, 617, 66, '2014-04-25 00:00:00', '2014-04-25 00:00:00', '1398884534', 'F', 'F'),
	(181, 76, 284, 27, NULL, 3, '2014-05-02 00:00:00', NULL, '1399895022', 'F', 'F'),
	(182, 76, 295, 10, NULL, 2, '2014-05-02 00:00:00', NULL, '1399063466', 'F', 'F'),
	(183, 76, 306, 569, NULL, 5, '2014-05-02 00:00:00', NULL, '1399895033', 'F', 'F'),
	(184, 76, 317, 3253, NULL, 14, '2014-05-05 00:00:00', NULL, '1399300906', 'F', 'F'),
	(185, 77, 326, 0, NULL, 2, '2014-05-05 00:00:00', NULL, '1400074400', 'F', 'F'),
	(186, 76, 320, 6943, NULL, 10, '2014-05-05 00:00:00', NULL, '1401197242', 'F', 'F'),
	(187, 76, 322, 10, NULL, 2, '2014-05-05 00:00:00', NULL, '1399313406', 'F', 'F'),
	(188, 79, 325, 632, NULL, 6, '2014-05-05 00:00:00', NULL, '1405455934', 'F', 'F'),
	(189, 76, 323, 43, NULL, 5, '2014-05-05 00:00:00', NULL, '1399895479', 'F', 'F'),
	(190, 76, 274, 88, NULL, 2, '2014-05-05 00:00:00', NULL, '1399318272', 'F', 'F'),
	(191, NULL, 275, 111, NULL, 4, '2014-05-05 00:00:00', NULL, '1399318674', 'F', 'F'),
	(192, 76, 276, 21, NULL, 1, '2014-05-05 00:00:00', NULL, '1399318695', 'F', 'F'),
	(193, 76, 278, 5733, NULL, 8, '2014-05-05 00:00:00', NULL, '1399384099', 'F', 'F'),
	(194, NULL, 279, 36708, NULL, 20, '2014-05-05 00:00:00', NULL, '1399484646', 'F', 'F'),
	(195, 81, 284, 9, NULL, 2, '2014-05-06 00:00:00', NULL, '1399407010', 'T', 'F'),
	(196, 81, 295, 120, NULL, 1, '2014-05-06 00:00:00', NULL, '1399407130', 'T', 'F'),
	(197, 82, 365, 26859, NULL, 77, '2014-05-09 00:00:00', NULL, '1400070031', 'F', 'F'),
	(198, 76, 280, 4, NULL, 1, '2014-05-12 00:00:00', NULL, '1399894850', 'F', 'F'),
	(199, 76, 288, 5, NULL, 1, '2014-05-12 00:00:00', NULL, '1399894861', 'F', 'F'),
	(200, 76, 282, 12, NULL, 1, '2014-05-12 00:00:00', NULL, '1399894872', 'F', 'F'),
	(201, 76, 286, 54, NULL, 4, '2014-05-12 00:00:00', NULL, '1399895043', 'F', 'F'),
	(202, 76, 286, 0, NULL, 0, '2014-05-12 00:00:00', NULL, '1399895032', 'F', 'F'),
	(203, 76, 290, 15323, NULL, 5, '2014-05-12 00:00:00', NULL, '1399910417', 'F', 'F'),
	(204, 76, 291, 0, NULL, 0, '2014-05-12 00:00:00', NULL, '1399894935', 'F', 'F'),
	(205, 82, 387, 15099, NULL, 69, '2014-05-12 00:00:00', NULL, '1400156212', 'T', 'F'),
	(206, 79, 324, 1162, NULL, 6, '2014-05-13 00:00:00', NULL, '1405455934', 'F', 'F'),
	(207, 79, 330, 34, NULL, 3, '2014-05-13 00:00:00', NULL, '1405454771', 'F', 'F'),
	(208, 79, 331, 34, NULL, 2, '2014-05-13 00:00:00', NULL, '1400154687', 'F', 'F'),
	(209, 79, 333, 63, NULL, 1, '2014-05-13 00:00:00', NULL, '1400009466', 'F', 'F'),
	(210, 79, 332, 192, NULL, 3, '2014-05-13 00:00:00', NULL, '1400071532', 'F', 'F'),
	(211, 79, 328, 63, NULL, 1, '2014-05-13 00:00:00', NULL, '1400009693', 'F', 'F'),
	(212, 79, 335, 91, NULL, 1, '2014-05-13 00:00:00', NULL, '1400009784', 'F', 'F'),
	(213, 79, 329, 213, NULL, 2, '2014-05-13 00:00:00', NULL, '1400009998', 'F', 'F'),
	(214, 79, 336, 14, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010001', 'F', 'F'),
	(215, 79, 334, 122, NULL, 2, '2014-05-13 00:00:00', NULL, '1400071622', 'F', 'F'),
	(216, 79, 337, 91, NULL, 2, '2014-05-13 00:00:00', NULL, '1400010122', 'F', 'F'),
	(217, 79, 327, 9, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010131', 'F', 'F'),
	(218, 79, 338, 40, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010171', 'F', 'F'),
	(219, 79, 339, 103, NULL, 2, '2014-05-13 00:00:00', NULL, '1400010286', 'F', 'F'),
	(220, 79, 340, 31, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010317', 'F', 'F'),
	(221, 79, 341, 39, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010337', 'F', 'F'),
	(222, 79, 342, 129, NULL, 2, '2014-05-13 00:00:00', NULL, '1400010470', 'F', 'F'),
	(223, 79, 343, 29, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010498', 'F', 'F'),
	(224, 79, 346, 62, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010560', 'F', 'F'),
	(225, 79, 345, 152, NULL, 2, '2014-05-13 00:00:00', NULL, '1400010713', 'F', 'F'),
	(226, 79, 347, 31, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010740', 'F', 'F'),
	(227, 79, 348, 31, NULL, 1, '2014-05-13 00:00:00', NULL, '1400010764', 'F', 'F'),
	(228, 79, 349, 922, NULL, 3, '2014-05-13 00:00:00', NULL, '1400071679', 'F', 'F'),
	(229, 79, 363, 16461, NULL, 22, '2014-05-13 00:00:00', NULL, '1405454765', 'F', 'F'),
	(230, 78, 321, 3104, 69, 16, '2014-05-14 00:00:00', '2014-05-14 00:00:00', '1403100960', 'F', 'F'),
	(231, 78, 450, 3051, NULL, 16, '2014-05-14 00:00:00', NULL, '1403718205', 'F', 'F'),
	(232, 78, 451, 44, 30, 4, '2014-05-14 00:00:00', '2014-05-14 00:00:00', '1400268741', 'F', 'F'),
	(233, 78, 452, 98, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268745', 'F', 'F'),
	(234, 78, 453, 1140, NULL, 19, '2014-05-14 00:00:00', NULL, '1400268750', 'F', 'F'),
	(235, 78, 454, 2681, NULL, 5, '2014-05-14 00:00:00', NULL, '1400240478', 'F', 'F'),
	(236, 78, 455, 21, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268754', 'F', 'F'),
	(237, 78, 456, 16, NULL, 2, '2014-05-14 00:00:00', NULL, '1400240494', 'F', 'F'),
	(238, 78, 457, 33, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268759', 'F', 'F'),
	(239, 78, 458, 9052, NULL, 19, '2014-05-14 00:00:00', NULL, '1400268762', 'F', 'F'),
	(240, 78, 459, 3457, NULL, 7, '2014-05-14 00:00:00', NULL, '1400268766', 'F', 'F'),
	(241, 78, 460, 2415, 503, 10, '2014-05-14 00:00:00', '2014-05-15 00:00:00', '1403718218', 'F', 'F'),
	(242, 78, 461, 66, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268771', 'F', 'F'),
	(243, 78, 462, 21, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268776', 'F', 'F'),
	(244, 78, 463, 21, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268780', 'F', 'F'),
	(245, 78, 464, 40, 34, 3, '2014-05-14 00:00:00', '2014-05-16 00:00:00', '1400268782', 'F', 'F'),
	(246, 78, 465, 402, NULL, 7, '2014-05-14 00:00:00', NULL, '1400268788', 'F', 'F'),
	(247, 78, 466, 93, NULL, 4, '2014-05-14 00:00:00', NULL, '1400268796', 'F', 'F'),
	(248, 78, 467, 9708, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268801', 'F', 'F'),
	(249, 78, 468, 23, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268807', 'F', 'F'),
	(250, 78, 469, 38, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268811', 'F', 'F'),
	(251, 78, 470, 59, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268816', 'F', 'F'),
	(252, 78, 471, 7548, 4912, 51, '2014-05-14 00:00:00', '2014-05-15 00:00:00', '1403718261', 'F', 'F'),
	(253, 78, 472, 50, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268819', 'F', 'F'),
	(254, 78, 473, 251, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268823', 'F', 'F'),
	(255, 78, 474, 306, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268827', 'F', 'F'),
	(256, 78, 475, 26, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268832', 'F', 'F'),
	(257, 78, 476, 35, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268836', 'F', 'F'),
	(258, 78, 477, 51, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268841', 'F', 'F'),
	(259, 78, 478, 25, NULL, 2, '2014-05-14 00:00:00', NULL, '1400260784', 'F', 'F'),
	(260, 78, 479, 26, NULL, 2, '2014-05-14 00:00:00', NULL, '1400260796', 'F', 'F'),
	(261, 78, 480, 26, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268845', 'F', 'F'),
	(262, 78, 481, 21, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268847', 'F', 'F'),
	(263, 78, 482, 3238, NULL, 11, '2014-05-14 00:00:00', NULL, '1403719642', 'F', 'F'),
	(264, 78, 483, 32, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268851', 'F', 'F'),
	(265, 78, 484, 22, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268853', 'F', 'F'),
	(266, 78, 485, 44, 39, 3, '2014-05-14 00:00:00', '2014-05-16 00:00:00', '1400268855', 'F', 'F'),
	(267, 78, 486, 2728, NULL, 11, '2014-05-14 00:00:00', NULL, '1400270211', 'F', 'F'),
	(268, 78, 487, 20, NULL, 3, '2014-05-14 00:00:00', NULL, '1400268860', 'F', 'F'),
	(269, 78, 488, 318, NULL, 2, '2014-05-14 00:00:00', NULL, '1400265073', 'F', 'F'),
	(270, 78, 489, 16, NULL, 2, '2014-05-14 00:00:00', NULL, '1400265081', 'F', 'F'),
	(271, 78, 490, 22, NULL, 2, '2014-05-14 00:00:00', NULL, '1400265089', 'F', 'F'),
	(272, 78, 491, 58, NULL, 4, '2014-05-14 00:00:00', NULL, '1400265097', 'F', 'F'),
	(273, 78, 492, 860, NULL, 6, '2014-05-14 00:00:00', NULL, '1400265946', 'F', 'F'),
	(274, 78, 493, 114, NULL, 4, '2014-05-14 00:00:00', NULL, '1400178947', 'F', 'F'),
	(275, 78, 494, 121, NULL, 6, '2014-05-14 00:00:00', NULL, '1400267873', 'F', 'F'),
	(276, 78, 495, 11874, NULL, 28, '2014-05-14 00:00:00', NULL, '1400268492', 'F', 'F'),
	(277, 78, 496, 3112, 113, 11, '2014-05-14 00:00:00', '2014-05-15 00:00:00', '1400178954', 'F', 'F'),
	(278, 78, 497, 1560, NULL, 16, '2014-05-14 00:00:00', NULL, '1400183364', 'F', 'F'),
	(279, 78, 498, 159, NULL, 6, '2014-05-14 00:00:00', NULL, '1400262551', 'F', 'F'),
	(280, 78, 499, 5218, NULL, 25, '2014-05-14 00:00:00', NULL, '1400268737', 'F', 'F'),
	(285, 78, 659, 2195, NULL, 11, '2014-05-16 00:00:00', NULL, '1405345018', 'F', 'F'),
	(344, 85, 660, 207, 204, 1, '2014-06-04 09:47:58', '2014-06-04 09:51:22', '1401886285', 'F', 'F'),
	(345, 85, 661, 66, 64, 1, '2014-06-04 09:51:25', '2014-06-04 09:52:29', '1401886351', 'F', 'F'),
	(346, 85, 662, 36, 34, 1, '2014-06-04 09:52:31', '2014-06-04 09:53:05', '1401886387', 'F', 'F'),
	(347, 85, 663, 54, 51, 1, '2014-06-04 09:53:07', '2014-06-04 09:53:58', '1401886441', 'F', 'F'),
	(348, 85, 664, 38, 35, 1, '2014-06-04 09:54:01', '2014-06-04 09:54:37', '1401886479', 'F', 'F'),
	(349, 85, 665, 40, 36, 1, '2014-06-04 09:54:39', '2014-06-04 09:55:16', '1401886519', 'F', 'F'),
	(350, 85, 666, 38, 35, 1, '2014-06-04 09:55:19', '2014-06-04 09:55:54', '1401886557', 'F', 'F'),
	(351, 85, 667, 30, NULL, 1, '2014-06-04 09:55:57', NULL, '1401886587', 'F', 'F'),
	(352, 86, 365, 0, NULL, 1, '2014-06-04 04:24:59', NULL, '1401891899', 'F', 'F'),
	(353, 87, 713, 8, NULL, 2, '2014-06-24 10:22:27', NULL, '1403616194', 'F', 'F'),
	(354, 87, 714, 9, NULL, 1, '2014-06-24 10:23:13', NULL, '1403616202', 'F', 'F'),
	(355, 87, 715, 0, NULL, 1, '2014-06-24 10:23:21', NULL, '1403616201', 'F', 'F'),
	(375, 89, 768, 5614, NULL, 12, '2014-07-18 02:56:04', NULL, '1405712271', 'F', 'F'),
	(376, 51, 768, 0, NULL, 2, '2014-07-21 10:23:29', NULL, '1405969499', 'F', 'F'),
	(377, 90, 716, 0, NULL, 1, '2014-07-21 10:43:20', NULL, '1405950200', 'F', 'F'),
	(378, 91, 716, 1474, 1458, 9, '2014-07-21 16:09:21', '2014-07-21 16:35:38', '1405971388', 'F', 'F'),
	(379, 91, 717, 61, 55, 2, '2014-07-21 16:35:40', '2014-07-21 16:36:44', '1405971410', 'F', 'F'),
	(380, 91, 718, 45, 39, 1, '2014-07-21 16:36:48', '2014-07-21 16:37:27', '1405971453', 'F', 'F'),
	(381, 91, 719, 391, NULL, 3, '2014-07-21 16:37:32', NULL, '1406745104', 'F', 'F');
/*!40000 ALTER TABLE `alunoturmaedcmidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturmaedcmidiainteracao
DROP TABLE IF EXISTS `alunoturmaedcmidiainteracao`;
CREATE TABLE IF NOT EXISTS `alunoturmaedcmidiainteracao` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdAlunoTurmaEdcMidia` int(11) unsigned NOT NULL DEFAULT '0',
  `IdTipoInteracao` int(11) unsigned NOT NULL DEFAULT '0',
  `ObjetoInteragido` text NOT NULL,
  `Interacao` text,
  `Acertou` enum('T','F') DEFAULT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_alunoturmaedcmidiainteracao_alunoturmaedcmidia` (`IdAlunoTurmaEdcMidia`),
  KEY `FK_alunoturmaedcmidiainteracao_tipointeracao` (`IdTipoInteracao`),
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_alunoturmaedcmidia` FOREIGN KEY (`IdAlunoTurmaEdcMidia`) REFERENCES `alunoturmaedcmidia` (`Id`),
  CONSTRAINT `FK_alunoturmaedcmidiainteracao_tipointeracao` FOREIGN KEY (`idTipoInteracao`) REFERENCES `tipointeracao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoturmaedcmidiainteracao: ~45 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturmaedcmidiainteracao` DISABLE KEYS */;
INSERT INTO `alunoturmaedcmidiainteracao` (`Id`, `IdAlunoTurmaEdcMidia`, `IdTipoInteracao`, `ObjetoInteragido`, `Interacao`, `Acertou`, `Data`) VALUES
	(2, 130, 1, 'OnjTeste', '1', '', '2014-04-25 03:42:06'),
	(3, 130, 1, 'OnjTeste', '1', 'T', '2014-04-25 03:42:34'),
	(4, 130, 1, 'OnjTeste', '1', 'F', '2014-04-25 03:42:37'),
	(5, 130, 1, 'OnjTeste', '1', 'F', '2014-04-25 04:17:13'),
	(6, 130, 1, 'TestedObject', '1', 'F', '2014-04-25 04:17:23'),
	(7, 130, 1, 'TestedObject', '1', '', '2014-04-25 04:21:54'),
	(8, 130, 1, 'TestedObject', '1', NULL, '2014-04-25 04:22:00'),
	(230, 267, 7, 'qtdLetras', '2', 'F', '2014-05-16 09:35:19'),
	(727, 345, 1, 'clica2', NULL, NULL, '2014-06-04 09:51:48'),
	(728, 345, 1, 'clica', NULL, NULL, '2014-06-04 09:51:52'),
	(729, 345, 1, 'clica3', NULL, NULL, '2014-06-04 09:52:03'),
	(730, 345, 1, 'clica4', NULL, NULL, '2014-06-04 09:52:07'),
	(731, 345, 1, 'clica5', NULL, NULL, '2014-06-04 09:52:11'),
	(732, 345, 1, 'clica6', NULL, NULL, '2014-06-04 09:52:17'),
	(733, 346, 7, 'input1', 'Mauricio', NULL, '2014-06-04 09:53:05'),
	(734, 347, 2, 'arrasta2', 'alvo2', 'T', '2014-06-04 09:53:34'),
	(735, 347, 2, 'arrasta1', 'alvo3', 'F', '2014-06-04 09:53:38'),
	(736, 347, 2, 'arrasta3', 'alvo1', 'F', '2014-06-04 09:53:42'),
	(737, 347, 2, 'arrasta1', 'alvo1', 'T', '2014-06-04 09:53:45'),
	(738, 347, 2, 'arrasta3', 'alvo3', 'T', '2014-06-04 09:53:49'),
	(739, 348, 1, 'clica', NULL, NULL, '2014-06-04 09:54:19'),
	(740, 348, 1, 'clica2', NULL, NULL, '2014-06-04 09:54:21'),
	(741, 348, 1, 'clica3', NULL, NULL, '2014-06-04 09:54:22'),
	(742, 348, 1, 'clica6', NULL, NULL, '2014-06-04 09:54:27'),
	(743, 348, 1, 'clica5', NULL, NULL, '2014-06-04 09:54:29'),
	(744, 348, 1, 'clica4', NULL, NULL, '2014-06-04 09:54:31'),
	(745, 349, 5, 'btn0', 'null', 'T', '2014-06-04 09:54:53'),
	(746, 349, 5, 'btn2', 'null', 'F', '2014-06-04 09:54:54'),
	(747, 349, 5, 'btn3', 'null', 'F', '2014-06-04 09:54:55'),
	(748, 349, 5, 'btn4', 'null', 'T', '2014-06-04 09:54:55'),
	(749, 349, 5, 'btn6', 'null', 'T', '2014-06-04 09:54:56'),
	(750, 349, 5, 'btn7', 'null', 'T', '2014-06-04 09:54:56'),
	(751, 349, 5, 'btn0', 'null', 'T', '2014-06-04 09:55:09'),
	(752, 349, 5, 'btn1', 'null', 'T', '2014-06-04 09:55:09'),
	(753, 349, 5, 'btn4', 'null', 'T', '2014-06-04 09:55:10'),
	(754, 349, 5, 'btn5', 'null', 'T', '2014-06-04 09:55:11'),
	(755, 349, 5, 'btn7', 'null', 'T', '2014-06-04 09:55:11'),
	(756, 349, 5, 'btn6', 'null', 'T', '2014-06-04 09:55:12'),
	(757, 350, 1, 'caneta', NULL, NULL, '2014-06-04 09:55:37'),
	(758, 350, 1, 'notebook', NULL, NULL, '2014-06-04 09:55:43'),
	(759, 231, 2, 'arrasta1', 'alvo1', 'T', '2014-06-25 02:41:15'),
	(760, 231, 2, 'arrasta4', 'alvo2', 'T', '2014-06-25 02:41:49'),
	(761, 231, 2, 'arrasta3', 'alvo1', 'T', '2014-06-25 02:42:38'),
	(762, 252, 7, 'input1', 'David', NULL, '2014-06-25 02:44:17'),
	(859, 380, 7, 'input1', 'emmerson', NULL, '2014-07-21 04:37:25');
/*!40000 ALTER TABLE `alunoturmaedcmidiainteracao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturmaprova
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoturmaprova: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturmaprova` DISABLE KEYS */;
INSERT INTO `alunoturmaprova` (`Id`, `IdAlunoTurma`, `DataHoraInicio`, `DataHoraFim`, `Nota`, `Situacao`, `Comentario`) VALUES
	(34, 8, '2014-06-18 11:45:22', '2014-06-18 16:27:00', 80, 'A', ''),
	(35, 7, '2014-06-23 10:57:15', NULL, NULL, NULL, NULL),
	(36, 57, '2014-06-24 10:23:47', '2014-06-24 10:24:05', 100, 'A', NULL),
	(37, 110, '2014-06-27 09:29:45', '2014-06-27 10:36:18', 0, 'R', NULL),
	(38, 110, '2014-06-27 10:38:07', '2014-06-27 11:22:06', 100, 'A', NULL);
/*!40000 ALTER TABLE `alunoturmaprova` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.alunoturmaprovaquestao
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.alunoturmaprovaquestao: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `alunoturmaprovaquestao` DISABLE KEYS */;
INSERT INTO `alunoturmaprovaquestao` (`Id`, `IdAlunoTurmaProva`, `IdQuestao`) VALUES
	(45, 34, 42),
	(46, 34, 49),
	(47, 34, 43),
	(48, 35, 49),
	(49, 35, 50),
	(50, 35, 42),
	(51, 36, 51),
	(52, 36, 53),
	(53, 36, 52),
	(54, 37, 72),
	(55, 38, 72);
/*!40000 ALTER TABLE `alunoturmaprovaquestao` ENABLE KEYS */;


-- Copiando estrutura para procedure wiquadro.atualizarBancodedadosComDadosDoBackup
DROP PROCEDURE IF EXISTS `atualizarBancodedadosComDadosDoBackup`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizarBancodedadosComDadosDoBackup`(IN `p_backup_id` INT, IN `p_backup_database_name` VARCHAR(50))
BEGIN
	DECLARE v_last_aluno_id INTEGER;
	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
	
	SET @v_servidor_offline_id := (SELECT IdServidoroffline FROM wiquadro.servidorofflinebackup WHERE Id = p_backup_id);
	SET autocommit = 0;
	
	START TRANSACTION;
	
		SET v_last_aluno_id = (SELECT AUTO_INCREMENT FROM information_schema.tables WHERE TABLE_SCHEMA = 'wiquadro' AND TABLE_NAME = 'aluno');
		
		SET @v_sql_aluno = CONCAT('INSERT INTO wiquadro.aluno (Nome,Email,Senha,Nascimento,Cidade,UF,Ativo,UniqId,Foto,reqCode) 
		SELECT Nome,Email,Senha,Nascimento,Cidade,UF,Ativo,QUOTE(UniqId),QUOTE(Foto),QUOTE(reqCode) FROM ', p_backup_database_name, '.aluno wb_a 
		LEFT JOIN wiquadro.servidorofflinedado w_sod ON w_sod.PkServidorOffline = wb_a.Id AND w_sod.Tabela = \'aluno\' WHERE w_sod.PkServidorOffline IS NULL');
		PREPARE stmt_aluno FROM @v_sql_aluno;
		EXECUTE stmt_aluno;
		DEALLOCATE PREPARE stmt_aluno;
		
		SET @v_last_aluno_id_ = v_last_aluno_id - 1;
		SET @v_sql_servidorofflinedado_aluno = CONCAT('INSERT INTO wiquadro.servidorofflinedado (IdServidorOffline, Tabela, PkServidorOffline, PkLocal) 
		SELECT ', @v_servidor_offline_id ,', ''aluno'', wb_a.Id, @v_last_aluno_id_ := @v_last_aluno_id_ + 1 FROM ', p_backup_database_name, '.aluno wb_a 
		LEFT JOIN wiquadro.servidorofflinedado w_sod ON w_sod.PkServidorOffline = wb_a.Id AND w_sod.Tabela = \'aluno\' WHERE w_sod.PkServidorOffline IS NULL');
		PREPARE stmt_aluno FROM @v_sql_servidorofflinedado_aluno;
		EXECUTE stmt_aluno;
		DEALLOCATE PREPARE stmt_aluno;
	
	COMMIT;
	
END//
DELIMITER ;


-- Copiando estrutura para tabela wiquadro.auditoria
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

-- Copiando dados para a tabela wiquadro.auditoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.auditoriacampo
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

-- Copiando dados para a tabela wiquadro.auditoriacampo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoriacampo` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoriacampo` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.auditorialogin
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

-- Copiando dados para a tabela wiquadro.auditorialogin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auditorialogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditorialogin` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authassignment
DROP TABLE IF EXISTS `authassignment`;
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` varchar(255) NOT NULL,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authassignment: 45 rows
/*!40000 ALTER TABLE `authassignment` DISABLE KEYS */;
INSERT INTO `authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
	('admin', '3', '', NULL),
	('wilivro', '8', '', NULL),
	('usuarioview', '1-6', '', 'N;'),
	('usuariologin', '1-6', '', 'N;'),
	('turma', '1-6', '', 'N;'),
	('questao', '1-6', '', 'N;'),
	('projetoview', '1-6', '', 'N;'),
	('edcmidiadelete', '1-6', '', 'N;'),
	('professor', '14-4', '', 'N;'),
	('supervisor', '14-5', '', 'N;'),
	('admin', '13', '', NULL),
	('admin', '12', '', NULL),
	('aluno', '2-4', '', 'N;'),
	('admin', '2-5', '', 'N;'),
	('supervisor', '2-2', '', 'N;'),
	('aulaview', '2-2', '', 'N;'),
	('aulaupdatequestao', '2-2', '', 'N;'),
	('aulaupdate', '2-2', '', 'N;'),
	('aulaordem', '2-2', '', 'N;'),
	('aulaindex', '2-2', '', 'N;'),
	('aulaexercicio', '2-2', '', 'N;'),
	('auladelete', '2-2', '', 'N;'),
	('aulacreatequestao', '2-2', '', 'N;'),
	('aulaconteudo', '2-2', '', 'N;'),
	('aulachangestatus', '2-2', '', 'N;'),
	('professor', '10-29', '', 'N;'),
	('supervisor', '15-29', '', 'N;'),
	('backup', '2-4', '', 'N;'),
	('professor', '2-4', '', 'N;'),
	('professor', '10-8', '', 'N;'),
	('disciplina', '1-6', '', 'N;'),
	('Admin', '11', '', NULL),
	('clienteview', '4-1', '', 'N;'),
	('clienteupdate', '4-1', '', 'N;'),
	('clientepesquisasatisfacao', '4-1', '', 'N;'),
	('clienteindex', '4-1', '', 'N;'),
	('clientedelete', '4-1', '', 'N;'),
	('clientecreate', '4-1', '', 'N;'),
	('cartoes', '4-1', '', 'N;'),
	('admin', '4-1', '', 'N;'),
	('projetoremoverdescritor', '9-1', '', 'N;'),
	('projetogetdescritorespordisciplina', '9-1', '', 'N;'),
	('aluno', '9-1', '', 'N;'),
	('escola', '9-1', '', 'N;'),
	('professor', '9-1', '', 'N;');
/*!40000 ALTER TABLE `authassignment` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authitem
DROP TABLE IF EXISTS `authitem`;
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authitem: 103 rows
/*!40000 ALTER TABLE `authitem` DISABLE KEYS */;
INSERT INTO `authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
	('alunoview', 0, 'Visualizar Detalhes do Aluno', NULL, 'N;'),
	('alunocreate', 0, 'Criar Aluno', NULL, 'N;'),
	('alunoupdate', 0, 'Atualizar Aluno', NULL, 'N;'),
	('alunodelete', 0, 'Deletar Aluno', NULL, 'N;'),
	('alunoindex', 0, 'Listar Alunos', NULL, 'N;'),
	('aluno', 1, 'Gerenciar Aluno', NULL, 'N;'),
	('edcchangeativo', 0, 'Alterar  Status do EDC', NULL, 'N;'),
	('edcmidiadelete', 0, 'Excluir Midia', NULL, NULL),
	('edcmidia', 1, 'Gerenciar Midias', NULL, NULL),
	('edccreate', 0, 'Criar EDC', NULL, 'N;'),
	('disciplinacertificado', 0, 'Adicionar Certificado', NULL, NULL),
	('edcdelete', 0, 'Deletar EDC', NULL, 'N;'),
	('edcexercicio', 0, 'Gerenciar Exercicios do EDC', '', 'N;'),
	('edccreatequestao', 0, 'Criar Questões para os EDCs', NULL, 'N;'),
	('edcupdatequestao', 0, 'Atualizar questões', NULL, 'N;'),
	('edcindex', 0, 'Listar EDCs', NULL, 'N;'),
	('edc', 1, 'Gerenciar EDCs', NULL, 'N;'),
	('clienteview', 0, 'Visualiza detalhes do Cliente', NULL, 'N;'),
	('clientecreate', 0, 'Criar Cliente', NULL, 'N;'),
	('clienteupdate', 0, 'Atualizar Cliente', NULL, 'N;'),
	('clientedelete', 0, 'Deletar Cliente', NULL, 'N;'),
	('clienteindex', 0, 'Listar Cliente', NULL, 'N;'),
	('cliente', 1, 'Gerenciar Cliente', NULL, 'N;'),
	('questaoindex', 0, 'Listar Questões', NULL, 'N;'),
	('questaocreate', 0, 'Criar Questão', NULL, 'N;'),
	('questaoupdate', 0, 'Editar Questão', NULL, 'N;'),
	('questaoview', 0, 'Visualizar detalhes da Questão', NULL, 'N;'),
	('questaodelete', 0, 'Deletar Questão', NULL, 'N;'),
	('questaodeletealternativa', 0, 'Deletar Alternativa da Questão', NULL, 'N;'),
	('questaodeletedica', 0, 'Deletar Dica da Questão', NULL, 'N;'),
	('questaodeletemidia', 0, 'Deletar Mídia da Questão', NULL, 'N;'),
	('questaoordem', 0, 'alterar ordem das Questões', NULL, 'N;'),
	('questaostatus', 0, 'alterar Status da Questão', NULL, 'N;'),
	('questao', 1, 'Gerenciar Questão', NULL, 'N;'),
	('usuariocreate', 0, 'Criar Usuario', NULL, 'N;'),
	('usuariodelete', 0, 'Deletar Usuario', NULL, 'N;'),
	('usuarioupdate', 0, 'Atualizar Usuario', NULL, 'N;'),
	('usuarioview', 0, 'Visualizar detalhes do Usuario', NULL, 'N;'),
	('usuarioindex', 0, 'Listar Usuarios', NULL, 'N;'),
	('usuarioativo', 0, 'Mudar status do Usuario', NULL, 'N;'),
	('usuariologin', 0, 'Fazer Login', NULL, 'N;'),
	('usuario', 1, 'Gerenciar Usuario', NULL, 'N;'),
	('escolaindex', 0, 'Listar Escolas', NULL, 'N;'),
	('escolacreate', 0, 'Criar Escola', NULL, 'N;'),
	('escolaupdate', 0, 'Editar Escola', NULL, 'N;'),
	('escolaview', 0, 'Visualizar detalhes da Escola', NULL, 'N;'),
	('escoladelete', 0, 'Deletar Escola', NULL, 'N;'),
	('escola', 1, 'Gerenciar Escolas', NULL, 'N;'),
	('projetoindex', 0, 'Listar Projetos', NULL, 'N;'),
	('projetocreate', 0, 'Criar Projeto', NULL, 'N;'),
	('projetoupdate', 0, 'Editar Projeto', NULL, 'N;'),
	('projetoview', 0, 'Visualizar detalhes do Projeto', NULL, 'N;'),
	('projetodelete', 0, 'Deletar Projeto', NULL, 'N;'),
	('projetogetdisciplinasnotassoc', 0, 'Visualizar disciplinas não associdas ao Projeto', NULL, 'N;'),
	('projetogetadddisciplinaprojeto', 0, 'Adicionar disciplina ao Projeto', NULL, 'N;'),
	('projetoselectdefault', 0, 'Selecionar projeto padrão', NULL, 'N;'),
	('projetogetchangeprojeto', 0, 'Alterar projeto padrão', NULL, 'N;'),
	('projetogetdescritorespordisciplina', 0, 'Visualizar descritores associados as disciplinas dos projetos', NULL, 'N;'),
	('projetoremoverdescritor', 0, 'Remover descritor da disciplina', NULL, 'N;'),
	('projeto', 1, 'Gerenciar Projeto', NULL, 'N;'),
	('turmacreate', 0, 'Criar Turma', NULL, 'N;'),
	('turmadelete', 0, 'Deletar Turma', NULL, 'N;'),
	('turmaupdate', 0, 'Atualizar Turma', NULL, 'N;'),
	('turmaview', 0, 'Visualizar detalhes Turma', NULL, 'N;'),
	('turmachangestatus', 0, 'alterar status da Turma', NULL, 'N;'),
	('turmagetturma', 0, 'visualizar recuperar Turma', NULL, 'N;'),
	('turmaaddaluno', 0, 'Adicionar Alunos à Turma', NULL, 'N;'),
	('turmaremovealuno', 0, 'remover Aluno da Turma', NULL, 'N;'),
	('turma', 1, 'Gerenciar Turma', NULL, 'N;'),
	('disciplinaview', 0, 'Visualizar Detalhes da disciplina', NULL, 'N;'),
	('disciplinacreate', 0, 'Criar Disciplina', NULL, 'N;'),
	('disciplinaremovebyprojeto', 0, 'Remover Disciplina do Projeto', NULL, 'N;'),
	('disciplinagetaulas', 0, 'Acessar aulas da Disciplina', NULL, 'N;'),
	('disciplinaupdate', 0, 'Atualizar Disciplina', NULL, 'N;'),
	('disciplinadelete', 0, 'Deletar Disciplina', NULL, 'N;'),
	('disciplinaindex', 0, 'Listar Disciplinas', NULL, 'N;'),
	('disciplina', 1, 'Gerenciar Disciplina', NULL, 'N;'),
	('professor', 2, 'Professor', NULL, 'N;'),
	('supervisor', 2, 'Supervisor', NULL, 'N;'),
	('admin', 2, 'Administrador', NULL, 'N;'),
	('wilivro', 2, 'Wilivro', NULL, 'N;'),
	('projetocreatedescritor', 0, 'Criar descritor', NULL, 'N;'),
	('edcmidiasaveedcmidiadata', 0, 'Adicionar Midias ao EDC', NULL, NULL),
	('backup', 1, 'Gerenciar Backups', NULL, NULL),
	('backupcreate', 0, 'Criar Backup', NULL, NULL),
	('cartoes', 1, 'Gerenciar Cartões', NULL, NULL),
	('backupindex', 0, 'Listar Backups', NULL, NULL),
	('cartoesindex', 0, 'Visualizar Cartões', NULL, NULL),
	('cartoescreate', 0, 'Gerar Cartões', NULL, NULL),
	('cartoesdelete', 0, 'Deletar Cartões', NULL, NULL),
	('cartoeschangeativo', 0, 'Ativar/Bloquear Cartões', NULL, NULL),
	('edcsaveconfig', 0, 'Configurar EDC', NULL, NULL),
	('edcupdate', 0, 'Editar EDC', NULL, NULL),
	('edcmidiaupdate', 0, 'Editar Midia', NULL, NULL),
	('edcmidiaindex', 0, 'Listar Midias', NULL, NULL),
	('clientepesquisasatisfacao', 0, 'Criar perguntas de satisfação', NULL, NULL),
	('formulario', 1, 'Gerenciar Formulários', NULL, NULL),
	('formularioindex', 0, 'Visualizar Formulários cadastrados', NULL, NULL),
	('formulariocreate', 0, 'Criar Formulários', NULL, NULL),
	('formularioupdate', 0, 'Alterar Formulários', NULL, NULL),
	('formularioviewresposta', 0, 'Visualizar respostas dos Formulários', NULL, NULL),
	('formulariodelete', 0, 'Excluir Formulários', NULL, NULL),
	('alunorecuperarsenha', 0, 'Recuperar senha do aluno quando o sistema estiver em servidor offline', 'return Yii::app()->params["server"] === "offline";', NULL);
/*!40000 ALTER TABLE `authitem` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.authitemchild
DROP TABLE IF EXISTS `authitemchild`;
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela wiquadro.authitemchild: 110 rows
/*!40000 ALTER TABLE `authitemchild` DISABLE KEYS */;
INSERT INTO `authitemchild` (`parent`, `child`) VALUES
	('admin', 'backup'),
	('admin', 'formulario'),
	('admin', 'projeto'),
	('admin', 'supervisor'),
	('admin', 'usuario'),
	('aluno', 'alunocreate'),
	('aluno', 'alunodelete'),
	('aluno', 'alunoindex'),
	('aluno', 'alunorecuperarsenha'),
	('aluno', 'alunoupdate'),
	('aluno', 'alunoview'),
	('backup', 'backupcreate'),
	('backup', 'backupindex'),
	('cartoes', 'cartoeschangeativo'),
	('cartoes', 'cartoescreate'),
	('cartoes', 'cartoesdelete'),
	('cartoes', 'cartoesindex'),
	('cliente', 'clientecreate'),
	('cliente', 'clientedelete'),
	('cliente', 'clienteindex'),
	('cliente', 'clientepesquisasatisfacao'),
	('cliente', 'clienteupdate'),
	('cliente', 'clienteview'),
	('disciplina', 'disciplinacertificado'),
	('disciplina', 'disciplinacreate'),
	('disciplina', 'disciplinadelete'),
	('disciplina', 'disciplinagetaulas'),
	('disciplina', 'disciplinaindex'),
	('disciplina', 'disciplinaremovebyprojeto'),
	('disciplina', 'disciplinaupdate'),
	('disciplina', 'disciplinaview'),
	('disciplina', 'projetocreatedescritor'),
	('edc', 'edcchangeativo'),
	('edc', 'edccreate'),
	('edc', 'edccreatequestao'),
	('edc', 'edcdelete'),
	('edc', 'edcexercicio'),
	('edc', 'edcindex'),
	('edc', 'edcsaveconfig'),
	('edc', 'edcupdate'),
	('edc', 'edcupdatequestao'),
	('edcmidia', 'edcmidiadelete'),
	('edcmidia', 'edcmidiaindex'),
	('edcmidia', 'edcmidiasaveedcmidiadata'),
	('edcmidia', 'edcmidiaupdate'),
	('escola', 'escolacreate'),
	('escola', 'escoladelete'),
	('escola', 'escolaindex'),
	('escola', 'escolaupdate'),
	('escola', 'escolaview'),
	('formulario', 'formulariocreate'),
	('formulario', 'formulariodelete'),
	('formulario', 'formularioindex'),
	('formulario', 'formularioupdate'),
	('formulario', 'formularioviewresposta'),
	('professor', 'disciplina'),
	('professor', 'edc'),
	('professor', 'edcmidia'),
	('professor', 'projetoview'),
	('professor', 'questao'),
	('professor', 'turma'),
	('professor', 'usuariologin'),
	('professor', 'usuarioview'),
	('projeto', 'projetocreate'),
	('projeto', 'projetodelete'),
	('projeto', 'projetogetadddisciplinaprojeto'),
	('projeto', 'projetogetchangeprojeto'),
	('projeto', 'projetogetdescritorespordisciplina'),
	('projeto', 'projetogetdisciplinasnotassoc'),
	('projeto', 'projetoindex'),
	('projeto', 'projetoremoverdescritor'),
	('projeto', 'projetoselectdefault'),
	('projeto', 'projetoupdate'),
	('projeto', 'projetoview'),
	('questao', 'questaocreate'),
	('questao', 'questaodelete'),
	('questao', 'questaodeletealternativa'),
	('questao', 'questaodeletedica'),
	('questao', 'questaodeletemidia'),
	('questao', 'questaoindex'),
	('questao', 'questaoordem'),
	('questao', 'questaostatus'),
	('questao', 'questaoupdate'),
	('questao', 'questaoview'),
	('supervisor', 'aluno'),
	('supervisor', 'escola'),
	('supervisor', 'professor'),
	('supervisor', 'projetocreatedescritor'),
	('supervisor', 'projetogetdescritorespordisciplina'),
	('supervisor', 'projetoremoverdescritor'),
	('supervisor', 'projetoview'),
	('supervisor', 'usuarioview'),
	('turma', 'turmaaddaluno'),
	('turma', 'turmachangestatus'),
	('turma', 'turmacreate'),
	('turma', 'turmadelete'),
	('turma', 'turmagetturma'),
	('turma', 'turmaremovealuno'),
	('turma', 'turmaupdate'),
	('turma', 'turmaview'),
	('usuario', 'usuarioativo'),
	('usuario', 'usuariocreate'),
	('usuario', 'usuariodelete'),
	('usuario', 'usuarioindex'),
	('usuario', 'usuariologin'),
	('usuario', 'usuarioupdate'),
	('usuario', 'usuarioview'),
	('wilivro', 'admin'),
	('wilivro', 'cartoes'),
	('wilivro', 'cliente');
/*!40000 ALTER TABLE `authitemchild` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.cartoes
DROP TABLE IF EXISTS `cartoes`;
CREATE TABLE IF NOT EXISTS `cartoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sequencia` int(11) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `DataCreate` datetime NOT NULL,
  `DataUso` datetime DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Codigo` (`Codigo`),
  KEY `FK_cartoes_cliente` (`IdCliente`),
  KEY `FK_cartoes_disciplina` (`IdDisciplina`),
  KEY `FK_cartoes_usuario` (`IdUsuario`),
  KEY `FK_cartoes_alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_cartoes_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_cartoes_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_cartoes_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_cartoes_usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=265725 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.cartoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cartoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartoes` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `TipoDoc` enum('CPF','CNPJ') NOT NULL DEFAULT 'CPF',
  `Doc` varchar(20) NOT NULL,
  `Tipo` char(1) NOT NULL,
  `IdEndereco` int(11) NOT NULL,
  `CreatePublicProject` enum('T','F') NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Cliente_Nome` (`Nome`),
  UNIQUE KEY `UI_CLiente_CPF_CNPJ` (`Doc`),
  KEY `FK_cliente_endereco` (`IdEndereco`),
  CONSTRAINT `FK_cliente_endereco` FOREIGN KEY (`IdEndereco`) REFERENCES `endereco` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.cliente: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`Id`, `Nome`, `TipoDoc`, `Doc`, `Tipo`, `IdEndereco`, `CreatePublicProject`) VALUES
	(1, 'Wilivro', 'CPF', '71454650354', 'E', 1, 'F'),
	(2, 'Escola José Pereira', 'CNPJ', '1243253234577', 'A', 2, 'F'),
	(15, 'Exemplo de Cliente', 'CPF', '05624350422', 'H', 15, 'F'),
	(18, 'Danilo Thiago Alves de Oliveira', 'CPF', '21787711226', '1', 20, 'F'),
	(19, 'Leandro Fortaleza', 'CPF', '76898447319', '2', 21, 'T');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.configuracao
DROP TABLE IF EXISTS `configuracao`;
CREATE TABLE IF NOT EXISTS `configuracao` (
  `NomeServidor` varchar(80) NOT NULL,
  `DataHoraUltimoBackup` datetime NOT NULL,
  `IdUsuarioUltimoBackup` int(10) unsigned NOT NULL,
  `DataInstalacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.configuracao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracao` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.conteudoassociadoedc
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.conteudoassociadoedc: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `conteudoassociadoedc` DISABLE KEYS */;
INSERT INTO `conteudoassociadoedc` (`Id`, `IdTipoMidia`, `IdEdc`, `Titulo`, `Conteudo`, `Url`, `Ativo`) VALUES
	(1, 7, 43, 'teste renomeado', '<b><i><u>asdfasf</u></i></b>', 'dev.wiquadro/uploads/conteudoassociadoedc/1406753908441_asabranca.swf', 'T'),
	(2, 1, 43, 'teste', '<b><i><u>asdfasf</u></i></b>', '', 'T'),
	(3, 1, 43, 'Teste de inclusão automática do conteúdo a questão', 'Desta maneira, o comprometimento entre as equipes faz parte de um processo de gerenciamento do retorno esperado a longo prazo.', '', 'T'),
	(4, 1, 43, 'Teste de atualização automática do grid', 'A prática cotidiana prova que o aumento do diálogo entre os diferentes setores produtivos pode nos levar a considerar a reestruturação das regras de conduta normativas.', '', 'T'),
	(5, 1, 43, 'ai ai', '<i>sfsdfdsf</i>', '', 'T'),
	(6, 1, 43, 'Teste show!', 'A prática cotidiana prova que a consolidação das estruturas pode nos levar a considerar a reestruturação do sistema de formação de quadros que corresponde às necessidades.', '', 'T'),
	(7, 3, 43, 'sdgsdg', '<br>', 'dsfds', 'T'),
	(8, 2, 43, 'Teste de edição depois do gridview ser atualizado', '<br>', 'http://www.yiiframework.com/doc/api/1.1/CGridView#rowHtmlOptionsExpression-detail', 'T'),
	(9, 2, 43, 'sadfhg', '<br>', 'http://www.yiiframework.com/doc/api/1.1/CArrayDataProvider', 'T'),
	(10, 2, 43, 'update ta dando certo', '<br>', 'http://stackoverflow.com/questions/14134653/how-to-convert-model-data-objects-array-to-dataprovider', 'T'),
	(12, 2, 43, 'teste com nova função', '<br>', 'http://imasters.com.br/', 'T'),
	(13, 4, 43, 'segundo teste', 'É importante questionar o quanto o julgamento imparcial das eventualidades promove a alavancagem dos níveis de motivação departamental.<br>', '<iframe width="560" height="315" src="//www.youtube.com/embed/XdXUZLMBfy0" frameborder="0" allowfullscreen></iframe>', 'T'),
	(14, 1, 43, 'teste 3', 'É importante questionar o quanto o consenso sobre a necessidade de qualificação estende o alcance e a importância das condições inegavelmente apropriadas.<br>', '', 'T'),
	(16, 6, 43, 'PDF', 'sdgdsg', 'dev.wiquadro/uploads/conteudoassociadoedc/1406746077393_matriculasSergio.pdf', 'T'),
	(17, 2, 43, 'Deu certo!', '<br>', 'http://stackoverflow.com/questions/14134653/how-to-convert-model-data-objects-array-to-dataprovider', 'T'),
	(18, 2, 43, 'mais uma vez!', '<br>', 'http://stackoverflow.com/questions/14134653/how-to-convert-model-data-objects-array-to-dataprovider', 'T'),
	(19, 5, 43, 'Não sei mais o que colocar para testar!', '<br>', 'dev.wiquadro/uploads/conteudoassociadoedc/1406750750928_16 Faixa 16.mp3', 'T'),
	(20, 1, 43, 'Só um teste para ter certeza que está funcionando', 'Ainda assim, existem dúvidas a respeito de como o surgimento do comércio virtual possibilita uma melhor visão global das condições financeiras e administrativas exigidas.<br>', '', 'T'),
	(21, 1, 37, 'Teste para EDC diferente', 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o fenômeno da Internet obstaculiza a apreciação da importância da gestão inovadora da qual fazemos parte.<br>', '', 'T'),
	(22, 5, 37, 'Teste sem associação', '', 'dev.wiquadro/uploads/conteudoassociadoedc/1406640606673_01 Faixa 1.mp3', 'T'),
	(23, 5, 37, 'novo teste sem associação', '', 'dev.wiquadro/uploads/conteudoassociadoedc/1406640881938_16 Faixa 16.mp3', 'T');
/*!40000 ALTER TABLE `conteudoassociadoedc` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.conteudoassociadoedcquestao
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.conteudoassociadoedcquestao: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `conteudoassociadoedcquestao` DISABLE KEYS */;
INSERT INTO `conteudoassociadoedcquestao` (`Id`, `IdConteudoAssociadoEdc`, `IdQuestao`) VALUES
	(1, 3, 71),
	(2, 4, 71),
	(4, 6, 71),
	(9, 3, 73),
	(43, 13, 71),
	(47, 16, 71),
	(48, 9, 71),
	(50, 2, 74),
	(51, 20, 74),
	(52, 1, 74),
	(55, 3, 74),
	(56, 4, 74),
	(57, 9, 74),
	(58, 21, 64),
	(60, 23, 64),
	(61, 19, 71),
	(62, 1, 71);
/*!40000 ALTER TABLE `conteudoassociadoedcquestao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.descritor
DROP TABLE IF EXISTS `descritor`;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.descritor: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `descritor` DISABLE KEYS */;
INSERT INTO `descritor` (`Id`, `Codigo`, `Titulo`, `Descricao`, `IdDisciplina`) VALUES
	(3, 'a25', 'titulo descenteeee', 'descrição descentee', 53),
	(4, 'a22', 'asdasdsdf  sdfsd sdf sdf sdf', 'asdasdasd', 53),
	(10, 'a26', 'sdfsdf', 'sdfsdf', 53),
	(12, 'T11', 'mais um Teste', 'O empenho em analisar o julgamento imparcial das eventualidades causa impacto indireto na reavaliação do investimento em reciclagem técnica.', 62),
	(13, 'T1', 'Lógica de programação', 'No mundo atual, o comprometimento entre as equipes apresenta tendências no sentido de aprovar a manutenção das posturas dos órgãos dirigentes com relação às suas atribuições.', 62),
	(14, 'T2', 'Lero lero', 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual representa uma abertura para a melhoria da gestão inovadora da qual fazemos parte.', 62),
	(15, 'T3', 'Mais Testes', 'A certificação de metodologias que nos auxiliam a lidar com o novo modelo estrutural aqui preconizado prepara-nos para enfrentar situações atípicas decorrentes do levantamento das variáveis envolvidas.', 62),
	(16, 'T4', 'Ai, ai', 'As experiências acumuladas demonstram que a estrutura atual da organização é uma das consequências de alternativas às soluções ortodoxas.', 62),
	(17, 'T5', 'Não tenho mais ideia do que colocar', 'É claro que a expansão dos mercados mundiais nos obriga à análise dos níveis de motivação departamental.', 62),
	(18, 'T6', 'Cansei :(', 'O empenho em analisar o consenso sobre a necessidade de qualificação faz parte de um processo de gerenciamento de todos os recursos funcionais envolvidos.', 62),
	(19, 'T7', 'Pi, piiiiiii', 'Gostaria de enfatizar que a expansão dos mercados mundiais desafia a capacidade de equalização das diretrizes de desenvolvimento para o futuro.', 62);
/*!40000 ALTER TABLE `descritor` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.disciplina
DROP TABLE IF EXISTS `disciplina`;
CREATE TABLE IF NOT EXISTS `disciplina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) NOT NULL,
  `Descricao` varchar(255) DEFAULT NULL,
  `Publico` enum('T','F') NOT NULL DEFAULT 'T',
  `IdCliente` int(11) NOT NULL,
  `CertificadoImagem` varchar(100) DEFAULT NULL,
  `CertificadoX` int(11) DEFAULT NULL,
  `CertificadoY` int(11) DEFAULT NULL,
  `CertificadoTexto` varchar(500) DEFAULT NULL,
  `CargaHoraria` tinyint(3) unsigned NOT NULL,
  `TentativaProva` int(11) NOT NULL DEFAULT '0' COMMENT 'Quantidade de vezes que o aluno pode tentar passar na Prova. 0 = Infinitas vezes',
  `Media` tinyint(3) NOT NULL,
  `TipoCorrecao` enum('A','P') NOT NULL COMMENT 'A = Automático; P = Pelo professor;',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Disciplina_Titulo` (`IdCliente`,`Titulo`),
  CONSTRAINT `FK_disciplina_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.disciplina: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`Id`, `Titulo`, `Descricao`, `Publico`, `IdCliente`, `CertificadoImagem`, `CertificadoX`, `CertificadoY`, `CertificadoTexto`, `CargaHoraria`, `TentativaProva`, `Media`, `TipoCorrecao`) VALUES
	(1, 'Teste de Alfabetização', 'Esta é uma disciplina de teste para o sistema', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(2, 'Segundo teste de disciplina', 'Esta disciplina é para testar se o relacionamento esta vindo correto das tabelas', 'T', 2, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(3, 'Disciplina Invocada!', 'Pense em uma disciplina invocada! ', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(4, 'Curso Genérico', 'Este é um curso genérico e publico para teste de novos alunos.', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(5, 'sdgsgsd', 'gs', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(7, 'dsdhsfhdfhghsfhdfgh', 'gsdgsdgsdgsd', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(8, 'Lero Lero', 'Neste sentido, a mobilidade dos capitais internacionais causa impacto indireto na reavaliação de todos os recursos funcionais envolvidos.', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(9, 'foi sem querer!dsgfg', 'swdfsdfsdf', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(10, 'foi sem querer!dsgfgasdfdsg', 'sadldjhlkvjbclaksjhgkfdjg', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(11, '2346345756', 'fd', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(14, '2346345756sdgf', 'fddshshghfhdgdfagfge', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(15, '2346345756sdgfdsgfdsghsdfg', 'fddshshghfhdgdfagfge', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(16, 'Esse teste é pra valer!!', 'teste de save via ajax!', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(17, 'Mais um teste pra valer!!', 'Teste de save via ajax sem associar a projeto!@!', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(18, 'Mais um teste pra valer, valer!', 'Teste save sem associar ao projeto 2!@!', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(20, 'gdfhfhfgjhgfj789090980', 'fjfdhsfhfgdhjdfhdfghfdhdfgh', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(27, 'dsfgdfsgsd', 'gsdgsdgdsfgsgsdf', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(30, 'Teste de Transação!', 'sddsfgh teste, teste, teste', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(33, 'Teste de Transação!2', 'sddsfgh teste, teste, teste', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(40, 'sdfsasfsdf', 'sdafsfdsafasfdsa', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(41, 'sdgasdgdasg', 'sdgasgsda', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(47, 'sdgasdgdasgasfdsf', 'sdgasgsdadsds', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(49, 'dsgsgdfg', 'wgfdd,ssadd lslkgd;sdglh', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(53, 'Teste de Disciplina', 'Teste para ver se verificação de duplicação na tabela está funcionando!!', 'T', 1, '1399300957690_italiano.jpg', 100, 150, 'O aluno {{aluno}}', 10, 2, 70, 'P'),
	(56, 'Disciplina de Testes', 'Este é uma disciplina para teste.', 'T', 15, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(57, 'Matemática', 'Matemática', 'T', 1, '1399301269259_certificado.jpg', 80, 180, 'sadfsdfs\r\nsdf\r\nsdf\r\nsdfs\r\ndfs\r\n', 5, 2, 70, 'A'),
	(58, 'Matemática 2', 'math', 'T', 1, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(60, 'ads', 'ads', 'T', 1, '', NULL, NULL, '', 0, 0, 70, 'A'),
	(61, 'as1', 'as1', 'T', 1, NULL, NULL, NULL, NULL, 12, 0, 70, 'A'),
	(62, 'Apps para dispositivos moveis.', 'A certificação de metodologias que nos auxiliam a lidar com a percepção das dificuldades não pode mais se dissociar das formas de ação.', 'T', 15, '1400251640901_IMG_14052014_105937.png', 120, 220, '{{aluno}} teste teste {{curso}} teste teste teste {{carga_horaria}}', 80, 0, 70, 'A'),
	(63, 'Criação de WebServices', 'Percebemos, cada vez mais, que o entendimento das metas propostas representa uma abertura para a melhoria dos procedimentos normalmente adotados.', 'T', 15, NULL, NULL, NULL, NULL, 60, 0, 70, 'A'),
	(64, 'nova disciplina', '', 'T', 1, NULL, NULL, NULL, NULL, 40, 0, 50, 'A'),
	(65, 'disciplina tipo correção', '', 'T', 1, NULL, NULL, NULL, NULL, 60, 2, 70, 'P');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.edc
DROP TABLE IF EXISTS `edc`;
CREATE TABLE IF NOT EXISTS `edc` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdc` int(11) unsigned DEFAULT NULL,
  `Titulo` varchar(250) NOT NULL,
  `Descricao` text NOT NULL,
  `IdDisciplina` int(11) NOT NULL,
  `QuantidadeQuestoesProva` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'a quantidade de questões desse edc que irão para a prova',
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `LiberaAvaliacao` enum('T','F') NOT NULL COMMENT 'determina se a partir desse EDC o aluno pode fazer a prova.',
  `MetodoAprovacao` enum('A','P') NOT NULL COMMENT 'A = Aprenda; P = Pratique',
  `Orientacao` text COMMENT 'Orientação ao professor de como trabalhar o EDC',
  `Ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_edc_edc` (`IdEdc`),
  KEY `FK_edc_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_edc_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_edc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.edc: ~51 rows (aproximadamente)
/*!40000 ALTER TABLE `edc` DISABLE KEYS */;
INSERT INTO `edc` (`Id`, `IdEdc`, `Titulo`, `Descricao`, `IdDisciplina`, `QuantidadeQuestoesProva`, `Ativo`, `LiberaAvaliacao`, `MetodoAprovacao`, `Orientacao`, `Ordem`) VALUES
	(1, NULL, 'Licao de Alfabetização', 'teste edição true x 2!', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(4, NULL, 'Não me canso de testar EDCs', 'Todavia, o surgimento do comércio virtual causa impacto indireto na reavaliação do sistema de formação de quadros que corresponde às necessidades.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(7, NULL, 'EDC Pai', 'Ainda assim, existem dúvidas a respeito de como a adoção de políticas descentralizadoras causa impacto indireto na reavaliação dos paradigmas corporativos.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(9, 7, 'EDC Filho', 'Por conseguinte, o novo modelo estrutural aqui preconizado oferece uma interessante oportunidade para verificação das diversas correntes de pensamento.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(10, NULL, 'Teste de EDC Pai Editado', 'Desta maneira, o julgamento imparcial das eventualidades garante a contribuição de um grupo importante na determinação das regras de conduta normativas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(11, 9, 'EDC Neto', 'A nível organizacional, o fenômeno da Internet maximiza as possibilidades por conta dos procedimentos normalmente adotados.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(12, 11, 'EDC Bisneto', 'O que temos que ter sempre em mente é que o início da atividade geral de formação de atitudes ainda não demonstrou convincentemente que vai participar na mudança do sistema de formação de quadros que corresponde às necessidades.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(13, 12, 'EDC Tataraneto', 'O que temos que ter sempre em mente é que a crescente influência da mídia assume importantes posições no estabelecimento das novas proposições.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(14, 9, 'EDC Neto 2', 'No entanto, não podemos esquecer que a consolidação das estruturas auxilia a preparação e a composição do processo de comunicação como um todo.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(15, 9, 'EDC Neto 3', 'Ainda assim, existem dúvidas a respeito de como o julgamento imparcial das eventualidades apresenta tendências no sentido de aprovar a manutenção dos métodos utilizados na avaliação de resultados.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(16, NULL, 'Teste EDC UL', 'Evidentemente, a valorização de fatores subjetivos exige a precisão e a definição das condições financeiras e administrativas exigidas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(17, 16, 'Teste EDC Filho UL', 'Desta maneira, a percepção das dificuldades desafia a capacidade de equalização do investimento em reciclagem técnica.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(19, 13, 'EDC Tatataraneto', 'Não obstante, o entendimento das metas propostas pode nos levar a considerar a reestruturação do investimento em reciclagem técnica.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(20, 13, 'EDC Tatataraneto 2', 'Caros amigos, a adoção de políticas descentralizadoras afeta positivamente a correta previsão das condições inegavelmente apropriadas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(21, 20, 'EDC Tatatataraneto', 'A prática cotidiana prova que o aumento do diálogo entre os diferentes setores produtivos pode nos levar a considerar a reestruturação das regras de conduta normativas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(22, 7, 'EDC Filho 2', 'É claro que o fenômeno da Internet maximiza as possibilidades por conta do orçamento setorial.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(23, 1, 'EDC Lero Lero', 'As experiências acumuladas demonstram que a estrutura atual da organização talvez venha a ressaltar a relatividade do investimento em reciclagem técnica.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(24, 1, 'EDC Lero Lero 2', 'Percebemos, cada vez mais, que a percepção das dificuldades representa uma abertura para a melhoria das novas proposições.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(25, 1, 'EDC Lero Lero 3', 'Desta maneira, o julgamento imparcial das eventualidades cumpre um papel essencial na formulação do impacto na agilidade decisória.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(26, 1, 'EDC Lero Lero 4', 'Gostaria de enfatizar que o novo modelo estrutural aqui preconizado nos obriga à análise dos conhecimentos estratégicos para atingir a excelência.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(27, 14, 'EDC Bisneto do Neto 2', 'No entanto, não podemos esquecer que a consolidação das estruturas auxilia a preparação e a composição do processo de comunicação como um todo.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(28, 22, 'EDC Certificação de metodologias', 'A certificação de metodologias que nos auxiliam a lidar com a contínua expansão de nossa atividade faz parte de um processo de gerenciamento das posturas dos órgãos dirigentes com relação às suas atribuições.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(29, 21, 'EDC Regras de conduta normativas', 'É importante questionar o quanto a valorização de fatores subjetivos pode nos levar a considerar a reestruturação das regras de conduta normativas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(30, NULL, 'EDC Do mesmo modo', 'Do mesmo modo, a consulta aos diversos militantes estende o alcance e a importância do processo de comunicação como um todo.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(31, NULL, 'Nome de EDC enoooooooooooooooorme para teste de UI', 'Assim mesmo, a execução dos pontos do programa facilita a criação das direções preferenciais no sentido do progresso.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(32, NULL, 'Edição pré-requisitos', 'Desta maneira, a expansão dos mercados mundiais cumpre um papel essencial na formulação das regras de conduta normativas.', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(33, 23, 'dtgergtert', 'rtretretre', 1, 0, 'T', 'T', 'A', NULL, NULL),
	(34, NULL, 'Teste Master', 'Podemos já vislumbrar o modo pelo qual a necessidade de renovação processual é uma das consequências das direções preferenciais no sentido do progresso.', 20, 0, 'T', 'T', 'A', NULL, NULL),
	(35, 34, 'Teste Master Filho', 'Todavia, o novo modelo estrutural aqui preconizado facilita a criação de alternativas às soluções ortodoxas.', 20, 0, 'T', 'T', 'A', NULL, NULL),
	(36, NULL, 'O teste invocado!', 'A certificação de metodologias que nos auxiliam a lidar com a necessidade de renovação processual representa uma abertura para a melhoria das condições financeiras e administrativas exigidas.', 18, 0, 'T', 'T', 'A', NULL, NULL),
	(37, NULL, '12332', '123', 53, 3, 'T', 'F', 'A', NULL, NULL),
	(38, NULL, '456', '456', 53, 0, 'T', 'F', 'A', NULL, NULL),
	(39, 37, '123456', '123123123', 53, 1, 'T', 'T', 'A', NULL, NULL),
	(41, NULL, 'as', 'as', 56, 0, 'T', 'T', 'A', NULL, NULL),
	(42, NULL, 'Só para cumprir tabela!', 'Podemos já vislumbrar o modo pelo qual o novo modelo estrutural aqui preconizado obstaculiza a apreciação da importância do investimento em reciclagem técnica.', 60, 0, 'T', 'T', 'A', NULL, NULL),
	(43, NULL, 'Apps para Android', 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se a contínua expansão de nossa atividade exige a precisão e a definição do remanejamento dos quadros funcionais.', 62, 10, 'T', 'T', 'P', 'dsgsdgdffg', 2),
	(44, NULL, 'Apps para IOS', 'Assim mesmo, a expansão dos mercados mundiais exige a precisão e a definição da gestão inovadora da qual fazemos parte.', 62, 0, 'T', 'T', 'A', NULL, 1),
	(45, NULL, 'Apps para Windows Phone', 'Todavia, a competitividade nas transações comerciais pode nos levar a considerar a reestruturação da gestão inovadora da qual fazemos parte.', 62, 0, 'T', 'T', 'A', NULL, 5),
	(46, NULL, 'Apps para Firefox OS', 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o início da atividade geral de formação de atitudes assume importantes posições no estabelecimento dos índices pretendidos.', 62, 0, 'T', 'T', 'A', NULL, 7),
	(47, NULL, 'Apps multiplataforma com HTML5 e phoneGap', 'É importante questionar o quanto a consulta aos diversos militantes exige a precisão e a definição das diretrizes de desenvolvimento para o futuro.', 62, 0, 'T', 'T', 'A', NULL, 6),
	(49, 43, 'Configuração de Ambiente de Desenvolvimento', 'A nível organizacional, a crescente influência da mídia estimula a padronização do fluxo de informações.', 62, 0, 'T', 'T', 'A', NULL, 2),
	(50, 43, 'Layout Responsivo', 'A prática cotidiana prova que o acompanhamento das preferências de consumo auxilia a preparação e a composição de alternativas às soluções ortodoxas.', 62, 0, 'T', 'T', 'A', NULL, 1),
	(51, NULL, '12332', '1233321', 53, 0, 'T', 'T', 'A', NULL, NULL),
	(52, NULL, 'edc pai', 'edc pai, primeiro edc.', 57, 3, 'T', 'T', 'A', NULL, 3),
	(53, NULL, 'edc com qtd de questões prova', 'asd', 53, 5, 'T', 'T', 'A', NULL, NULL),
	(55, NULL, 'novo edc', 'novo edc', 53, 4, 'T', 'F', 'A', '', NULL),
	(56, 50, 'EDC para teste de ordenação no terceiro nível', 'EDC para teste de ordenação no terceiro nível', 62, 12, 'T', 'T', 'A', '', 3),
	(57, 50, '2 EDC para teste de ordenação no terceiro nível', '2 EDC para teste de ordenação no terceiro nível', 62, 12, 'T', 'T', 'A', '', 1),
	(58, 50, '3 EDC para teste de ordenação no terceiro nível', '3 EDC para teste de ordenação no terceiro nível', 62, 12, 'T', 'T', 'A', '', 2),
	(59, NULL, 'oi', 'oi', 57, 10, 'T', 'T', 'A', '', 1),
	(60, NULL, 'aa', 'aa', 57, 5, 'T', 'F', 'A', '', 2);
/*!40000 ALTER TABLE `edc` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.edcmidia
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
  `IdEdc` int(11) unsigned NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Titulo_IdEdc` (`Titulo`,`IdEdc`),
  KEY `FK_edcmidia_edc` (`IdEdc`),
  KEY `FK_edcmidia_tipomidia` (`IdTipoMidia`),
  CONSTRAINT `FK_edcmidia_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_edcmidia_tipomidia` FOREIGN KEY (`IdTipoMidia`) REFERENCES `tipomidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.edcmidia: ~521 rows (aproximadamente)
/*!40000 ALTER TABLE `edcmidia` DISABLE KEYS */;
INSERT INTO `edcmidia` (`Id`, `Titulo`, `Ordem`, `Descricao`, `Url`, `Conteudo`, `IdTipoMidia`, `TempoMinimo`, `RequerInteracao`, `IdEdc`, `Ativo`) VALUES
	(208, 'google-chrome-stable 24.0.1312.57-r178923 amd64', 4, 'google-chrome-stable 24.0.1312.57-r178923 amd64', 'http://www.google.com/', NULL, 2, 5, 'F', 4, 'T'),
	(209, 'google-chrome-stable 24.0.1312.68-r180326 amd64', 1, 'google-chrome-stable 24.0.1312.68-r180326 amd64', 'http://www.imasters.com.br/', NULL, 5, 5, 'T', 4, 'T'),
	(210, 'google-chrome-stable 24.0.1312.69-r180721 amd64', 2, 'google-chrome-stable 24.0.1312.69-r180721 amd64', 'http://www.google.com/', NULL, 2, 5, 'F', 4, 'T'),
	(211, 'google-chrome-stable 24.0.1312.69-r180721 i386', 3, 'google-chrome-stable 24.0.1312.69-r180721 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_24.0.1312.69-r180721_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(212, 'google-chrome-stable 24.0.1312.70-r181759 amd64', 5, 'google-chrome-stable 24.0.1312.70-r181759 amd64', 'http://www.google.com/', NULL, 2, 5, 'F', 4, 'T'),
	(213, 'google-chrome-stable 24.0.1312.70-r181759 i386', 6, 'google-chrome-stable 24.0.1312.70-r181759 i386', 'http://www.google.com/', NULL, 2, 5, 'F', 4, 'T'),
	(214, 'google-chrome-stable 25.0.1364.97-r183676 amd64', 7, 'google-chrome-stable 25.0.1364.97-r183676 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_25.0.1364.97-r183676_amd64.deb', NULL, 4, 5, 'F', 4, 'T'),
	(215, 'google-chrome-stable 25.0.1364.97-r183676 i386', 8, 'google-chrome-stable 25.0.1364.97-r183676 i386', 'http://www.google.com/', NULL, 2, 5, 'F', 4, 'T'),
	(216, 'google-chrome-stable 25.0.1364.152-r185281 amd64', 9, 'google-chrome-stable 25.0.1364.152-r185281 amd64', 'http://globo.com/', NULL, 2, 5, 'F', 4, 'T'),
	(217, 'google-chrome-stable 25.0.1364.152-r185281 i386', 10, 'google-chrome-stable 25.0.1364.152-r185281 i386', 'http://www.yahoo.com/', NULL, 4, 5, 'F', 4, 'T'),
	(218, 'google-chrome-stable 25.0.1364.160-r186726 amd64', 11, 'google-chrome-stable 25.0.1364.160-r186726 amd64', 'http://www.imasters.com.br/', NULL, 2, 5, 'F', 4, 'T'),
	(219, 'google-chrome-stable 25.0.1364.160-r186726 i386', 12, 'google-chrome-stable 25.0.1364.160-r186726 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_25.0.1364.160-r186726_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(220, 'google-chrome-stable 25.0.1364.172-r187217 amd64', 13, 'google-chrome-stable 25.0.1364.172-r187217 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_25.0.1364.172-r187217_amd64.deb', NULL, 5, 5, 'F', 4, 'T'),
	(221, 'google-chrome-stable 25.0.1364.172-r187217 i386', 14, 'google-chrome-stable 25.0.1364.172-r187217 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_25.0.1364.172-r187217_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(222, 'google-chrome-stable 26.0.1410.43-r189671 amd64', 15, 'google-chrome-stable 26.0.1410.43-r189671 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_26.0.1410.43-r189671_amd64.deb', NULL, 5, 5, 'F', 4, 'T'),
	(223, 'google-chrome-stable 26.0.1410.43-r189671 i386', 17, 'google-chrome-stable 26.0.1410.43-r189671 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_26.0.1410.43-r189671_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(224, 'google-chrome-stable 26.0.1410.63-r192696 amd64', 16, 'google-chrome-stable 26.0.1410.63-r192696 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_26.0.1410.63-r192696_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(225, 'google-chrome-stable 26.0.1410.63-r192696 i386', 18, 'google-chrome-stable 26.0.1410.63-r192696 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_26.0.1410.63-r192696_i386.deb', NULL, 4, 5, 'F', 4, 'T'),
	(226, 'google-chrome-stable 27.0.1453.93-r200836 amd64', 19, 'google-chrome-stable 27.0.1453.93-r200836 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_27.0.1453.93-r200836_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(227, 'google-chrome-stable 27.0.1453.93-r200836 i386', 20, 'google-chrome-stable 27.0.1453.93-r200836 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_27.0.1453.93-r200836_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(228, 'google-chrome-stable 27.0.1453.110-r202711 amd64', 21, 'google-chrome-stable 27.0.1453.110-r202711 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_27.0.1453.110-r202711_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(229, 'google-chrome-stable 27.0.1453.110-r202711 i386', 22, 'google-chrome-stable 27.0.1453.110-r202711 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_27.0.1453.110-r202711_i386.deb', NULL, 4, 5, 'F', 4, 'T'),
	(230, 'google-chrome-stable 28.0.1500.45-r205727 amd64', 23, 'google-chrome-stable 28.0.1500.45-r205727 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.45-r205727_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(231, 'google-chrome-stable 28.0.1500.45-r205727 i386', 24, 'google-chrome-stable 28.0.1500.45-r205727 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.45-r205727_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(232, 'google-chrome-stable 28.0.1500.52-r207119 amd64', 25, 'google-chrome-stable 28.0.1500.52-r207119 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.52-r207119_amd64.deb', NULL, 4, 5, 'F', 4, 'T'),
	(233, 'google-chrome-stable 28.0.1500.52-r207119 i386', 26, 'google-chrome-stable 28.0.1500.52-r207119 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.52-r207119_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(234, 'google-chrome-stable 28.0.1500.63-r208724 amd64', 27, 'google-chrome-stable 28.0.1500.63-r208724 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.63-r208724_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(235, 'google-chrome-stable 28.0.1500.63-r208724 i386', 28, 'google-chrome-stable 28.0.1500.63-r208724 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.63-r208724_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(236, 'google-chrome-stable 28.0.1500.68-r209102 amd64', 29, 'google-chrome-stable 28.0.1500.68-r209102 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.68-r209102_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(237, 'google-chrome-stable 28.0.1500.68-r209102 i386', 30, 'google-chrome-stable 28.0.1500.68-r209102 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.68-r209102_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(238, 'google-chrome-stable 28.0.1500.70-r209565 amd64', 31, 'google-chrome-stable 28.0.1500.70-r209565 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.70-r209565_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(239, 'google-chrome-stable 28.0.1500.70-r209565 i386', 32, 'google-chrome-stable 28.0.1500.70-r209565 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.70-r209565_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(240, 'google-chrome-stable 28.0.1500.71-r209842 amd64', 33, 'google-chrome-stable 28.0.1500.71-r209842 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.71-r209842_amd64.deb', NULL, 4, 5, 'F', 4, 'T'),
	(241, 'google-chrome-stable 28.0.1500.71-r209842 i386', 34, 'google-chrome-stable 28.0.1500.71-r209842 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.71-r209842_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(242, 'google-chrome-stable 28.0.1500.95-r213514 amd64', 35, 'google-chrome-stable 28.0.1500.95-r213514 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.95-r213514_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(243, 'google-chrome-stable 28.0.1500.95-r213514 i386', 36, 'google-chrome-stable 28.0.1500.95-r213514 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_28.0.1500.95-r213514_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(244, 'google-chrome-stable 29.0.1547.57-r217859 amd64', 37, 'google-chrome-stable 29.0.1547.57-r217859 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.57-r217859_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(245, 'google-chrome-stable 29.0.1547.57-r217859 i386', 38, 'google-chrome-stable 29.0.1547.57-r217859 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.57-r217859_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(246, 'google-chrome-stable 29.0.1547.62-r219432 amd64', 39, 'google-chrome-stable 29.0.1547.62-r219432 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.62-r219432_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(247, 'google-chrome-stable 29.0.1547.62-r219432 i386', 40, 'google-chrome-stable 29.0.1547.62-r219432 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.62-r219432_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(248, 'google-chrome-stable 29.0.1547.65-r220622 amd64', 41, 'google-chrome-stable 29.0.1547.65-r220622 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.65-r220622_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(249, 'google-chrome-stable 29.0.1547.65-r220622 i386', 42, 'google-chrome-stable 29.0.1547.65-r220622 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.65-r220622_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(250, 'google-chrome-stable 29.0.1547.76-r223446 amd64', 43, 'google-chrome-stable 29.0.1547.76-r223446 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.76-r223446_amd64.deb', NULL, 5, 5, 'F', 4, 'T'),
	(251, 'google-chrome-stable 29.0.1547.76-r223446 i386', 44, 'google-chrome-stable 29.0.1547.76-r223446 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_29.0.1547.76-r223446_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(252, 'google-chrome-stable 30.0.1599.66-1 amd64', 45, 'google-chrome-stable 30.0.1599.66-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.66-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(253, 'google-chrome-stable 30.0.1599.66-1 i386', 46, 'google-chrome-stable 30.0.1599.66-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.66-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(254, 'google-chrome-stable 30.0.1599.101-1 amd64', 47, 'google-chrome-stable 30.0.1599.101-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.101-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(255, 'google-chrome-stable 30.0.1599.101-1 i386', 48, 'google-chrome-stable 30.0.1599.101-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.101-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(256, 'google-chrome-stable 30.0.1599.114-1 amd64', 49, 'google-chrome-stable 30.0.1599.114-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.114-1_amd64.deb', NULL, 5, 5, 'F', 4, 'T'),
	(257, 'google-chrome-stable 30.0.1599.114-1 i386', 50, 'google-chrome-stable 30.0.1599.114-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_30.0.1599.114-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(258, 'google-chrome-stable 31.0.1650.48-1 amd64', 51, 'google-chrome-stable 31.0.1650.48-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.48-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(259, 'google-chrome-stable 31.0.1650.48-1 i386', 52, 'google-chrome-stable 31.0.1650.48-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.48-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(260, 'google-chrome-stable 31.0.1650.57-1 amd64', 53, 'google-chrome-stable 31.0.1650.57-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.57-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(261, 'google-chrome-stable 31.0.1650.57-1 i386', 54, 'google-chrome-stable 31.0.1650.57-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.57-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(262, 'google-chrome-stable 31.0.1650.63-1 amd64', 55, 'google-chrome-stable 31.0.1650.63-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.63-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(263, 'google-chrome-stable 31.0.1650.63-1 i386', 56, 'google-chrome-stable 31.0.1650.63-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_31.0.1650.63-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(264, 'google-chrome-stable 32.0.1700.77-1 amd64', 57, 'google-chrome-stable 32.0.1700.77-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.77-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(265, 'google-chrome-stable 32.0.1700.77-1 i386', 58, 'google-chrome-stable 32.0.1700.77-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.77-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(266, 'google-chrome-stable 32.0.1700.102-1 amd64', 59, 'google-chrome-stable 32.0.1700.102-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.102-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(267, 'google-chrome-stable 32.0.1700.102-1 i386', 60, 'google-chrome-stable 32.0.1700.102-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.102-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(268, 'google-chrome-stable 32.0.1700.107-1 amd64', 61, 'google-chrome-stable 32.0.1700.107-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.107-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(269, 'google-chrome-stable 32.0.1700.107-1 i386', 62, 'google-chrome-stable 32.0.1700.107-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_32.0.1700.107-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(270, 'google-chrome-stable 33.0.1750.115-1 amd64', 63, 'google-chrome-stable 33.0.1750.115-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_33.0.1750.115-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(271, 'google-chrome-stable 33.0.1750.115-1 i386', 64, 'google-chrome-stable 33.0.1750.115-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_33.0.1750.115-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(272, 'google-chrome-stable 33.0.1750.117-1 amd64', 65, 'google-chrome-stable 33.0.1750.117-1 amd64', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_33.0.1750.117-1_amd64.deb', NULL, 2, 5, 'F', 4, 'T'),
	(273, 'google-chrome-stable 33.0.1750.117-1 i386', 66, 'google-chrome-stable 33.0.1750.117-1 i386', 'http://95.31.35.30/chrome/pool/main/g/google-chrome-stable/google-chrome-stable_33.0.1750.117-1_i386.deb', NULL, 2, 5, 'F', 4, 'T'),
	(274, '10', 30, '10', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/10.htm', '', 2, 5, 'F', 7, 'T'),
	(275, '11', 47, '11', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/11.htm', '', 2, 5, 'F', 7, 'F'),
	(276, '12', 31, '12', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/12.htm', '', 2, 5, 'F', 7, 'T'),
	(277, '13', 39, '13', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/13.htm', '', 2, 5, 'F', 7, 'T'),
	(278, '14', 34, '14', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/14.htm', '', 2, 5, 'F', 7, 'T'),
	(279, '15', NULL, '15', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/15.htm', '', 2, 5, 'F', 7, 'F'),
	(280, '16', 10, '16', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/16.htm', NULL, 2, 5, 'F', 7, 'T'),
	(281, 'asf,sadgfdgkhgkd', 32, 'ldskgjfdgfkhj', '', 'dsgfdh', 1, 21, 'F', 7, 'T'),
	(282, '18', 4, '18', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/18.htm', NULL, 2, 5, 'F', 7, 'T'),
	(283, '19', 41, '19', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/19.htm', '', 2, 5, 'F', 7, 'T'),
	(284, '2', 1, '2', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/2.htm', NULL, 2, 5, 'F', 7, 'T'),
	(285, '20', 43, '20', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/20.htm', '', 2, 5, 'F', 7, 'T'),
	(286, '21', 5, '21', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/21.htm', NULL, 2, 5, 'F', 7, 'T'),
	(287, '22', 42, '22', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/22.htm', '', 2, 5, 'F', 7, 'T'),
	(288, '23', 3, '23', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/23.htm', NULL, 2, 5, 'F', 7, 'T'),
	(289, '24', 40, '24', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/24.htm', '', 2, 5, 'F', 7, 'T'),
	(290, '25', 6, '25', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/25.htm', NULL, 2, 5, 'F', 7, 'T'),
	(291, '26', 8, '26', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/26.htm', NULL, 2, 5, 'F', 7, 'T'),
	(292, '27', 9, '27', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/27.htm', NULL, 2, 5, 'F', 7, 'T'),
	(293, '28', 35, '28', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/28.htm', '', 2, 5, 'F', 7, 'T'),
	(294, '29', 44, '29', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/29.htm', '', 2, 5, 'F', 7, 'T'),
	(295, 'Evidentemente, a consulta aos diversos militantes', 33, '3', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/3.htm', '', 2, 5, 'F', 7, 'T'),
	(296, '30', 11, '30', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/30.htm', NULL, 2, 5, 'F', 7, 'T'),
	(297, '31', 12, '31', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/31.htm', NULL, 2, 5, 'F', 7, 'T'),
	(298, '32', 13, '32', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/32.htm', NULL, 2, 5, 'F', 7, 'T'),
	(299, '33', 14, '33', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/33.htm', NULL, 2, 5, 'F', 7, 'T'),
	(300, '34', 15, '34', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/34.htm', NULL, 2, 5, 'F', 7, 'T'),
	(301, '35', 16, '35', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/35.htm', NULL, 2, 5, 'F', 7, 'T'),
	(302, '36', 18, '36', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/36.htm', NULL, 2, 5, 'F', 7, 'T'),
	(303, '37', 17, '37', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/37.htm', NULL, 2, 5, 'F', 7, 'T'),
	(304, '38', 19, '38', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/38.htm', NULL, 2, 5, 'F', 7, 'T'),
	(305, '39', 20, '39', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/39.htm', NULL, 2, 5, 'F', 7, 'T'),
	(306, '4', 2, '4', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/4.htm', '', 2, 5, 'F', 7, 'T'),
	(307, '40', 21, '40', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/40.htm', NULL, 2, 5, 'F', 7, 'T'),
	(308, '41', 22, '41', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/41.htm', NULL, 2, 5, 'F', 7, 'T'),
	(309, '42', 23, '42', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/42.htm', NULL, 2, 5, 'F', 7, 'T'),
	(310, '43', 24, '43', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/43.htm', NULL, 2, 5, 'F', 7, 'T'),
	(311, '44', 26, '44', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/44.htm', NULL, 2, 5, 'F', 7, 'T'),
	(312, '45', 36, '45', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/45.htm', '', 2, 5, 'F', 7, 'T'),
	(313, '46', 25, '46', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/46.htm', NULL, 2, 5, 'F', 7, 'T'),
	(314, '47', 28, '47', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/47.htm', NULL, 2, 5, 'F', 7, 'T'),
	(315, '48', 47, '48', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/48.htm', NULL, 2, 5, 'F', 33, 'T'),
	(316, '49', 27, '49', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/49.htm', NULL, 2, 5, 'F', 7, 'T'),
	(317, '5', 38, '5', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/5.htm', '', 2, 5, 'F', 7, 'T'),
	(318, '50', 37, '50', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/50.htm', '', 2, 5, 'F', 7, 'T'),
	(319, '51', 29, '51', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/51.htm', NULL, 2, 5, 'F', 7, 'T'),
	(320, '6444', 46, '6', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/6.htm', '', 2, 5, 'F', 7, 'T'),
	(321, '1', 1, '1', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/01.htm', NULL, 2, 5, 'F', 1, 'T'),
	(322, '8', 7, '8', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/8.htm', '', 2, 5, 'F', 7, 'T'),
	(323, '91', 45, '9', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/9.htm', '', 2, 5, 'F', 7, 'T'),
	(324, 'asdasd', 1, 'asdasd', NULL, 'dfrtwer sdfsd <br><b><br>sdf</b><br>sdf<br>', 1, 5, 'T', 37, 'T'),
	(325, 'oioi', 3, 'oioi', 'http://oioi.com', NULL, 2, 5, 'T', 37, 'T'),
	(326, 'Pesquisa', 1, 'Pesquisa', 'http://www.google.com/Pesquisa', '', 2, 5, 'T', 9, 'T'),
	(327, 'Imagens', 13, 'Imagens', 'http://www.google.com/Imagens', NULL, 2, 5, 'T', 37, 'T'),
	(328, 'Maps', 7, 'Maps', 'http://www.google.com/Maps', NULL, 2, 5, 'T', 37, 'T'),
	(329, 'Play', 9, 'Play', 'http://www.google.com/Play', NULL, 2, 5, 'T', 37, 'T'),
	(330, 'YouTube', 2, 'YouTube', 'http://www.google.com/YouTube', NULL, 2, 15, 'T', 37, 'T'),
	(331, 'Not�cias', 4, 'Not�cias', 'http://www.google.com/Not�cias', NULL, 2, 5, 'T', 37, 'T'),
	(332, 'Gmail', 6, 'Gmail', 'http://www.google.com/Gmail', NULL, 2, 5, 'T', 37, 'T'),
	(333, 'Drive', 5, 'Drive', 'http://www.google.com/Drive', NULL, 2, 5, 'T', 37, 'T'),
	(334, 'Mais', 11, 'Mais', 'http://www.google.com/Mais', NULL, 2, 5, 'T', 37, 'T'),
	(335, 'Agenda', 8, 'Agenda', 'http://www.google.com/Agenda', NULL, 2, 5, 'T', 37, 'T'),
	(336, 'Orkut', 10, 'Orkut', 'http://www.google.com/Orkut', NULL, 2, 5, 'T', 37, 'T'),
	(337, 'Tradutor', 12, 'Tradutor', 'http://www.google.com/Tradutor', NULL, 2, 5, 'T', 37, 'T'),
	(338, 'Livros', 14, 'Livros', 'http://www.google.com/Livros', NULL, 2, 5, 'T', 37, 'T'),
	(339, 'Shopping', 15, 'Shopping', 'http://www.google.com/Shopping', NULL, 2, 5, 'T', 37, 'T'),
	(340, 'Blogger', 16, 'Blogger', 'http://www.google.com/Blogger', NULL, 2, 5, 'T', 37, 'T'),
	(341, 'Fotos', 17, 'Fotos', 'http://www.google.com/Fotos', NULL, 2, 5, 'T', 37, 'T'),
	(342, 'V�deos', 18, 'V�deos', 'http://www.google.com/V�deos', NULL, 2, 5, 'T', 37, 'T'),
	(343, 'Ainda mais', 19, 'Ainda mais', 'http://www.google.com/Ainda mais', NULL, 2, 5, 'T', 37, 'T'),
	(344, 'Fazer login', 20, 'Fazer login', 'http://www.google.com/Fazer login', '', 2, 5, 'F', 37, 'F'),
	(345, '', 22, '', 'http://www.google.com/', NULL, 2, 5, 'T', 37, 'T'),
	(346, 'Hist�rico da Web', 20, 'Hist�rico da Web', 'http://www.google.com/Hist�rico da Web', NULL, 2, 5, 'T', 37, 'T'),
	(347, '+Google', 22, '+Google', 'http://www.google.com/+Google', NULL, 2, 5, 'T', 37, 'T'),
	(348, 'Sobre o Google', 23, 'Sobre o Google', 'http://www.google.com/Sobre o Google', NULL, 2, 5, 'T', 37, 'T'),
	(349, 'Google', 24, 'Google', 'http://www.google.com/Google.com', NULL, 2, 5, 'T', 37, 'T'),
	(363, 'testee', 25, 'testee', 'http://wiquadro.dev/uploads/edcmidia/1399638353743_LPLbook.pdf', NULL, 6, 5, 'T', 37, 'T'),
	(365, 'teste de pdf', 1, 'teste de pdf', NULL, '<b>Olá</b><br><br>isso é um texto]<br><br>isso é um texto<br>isso é um texto<br>isso é um texto<br>isso é um texto<br>isso é um texto<br><br><br><br><br><br><br><br>', 1, 10, 'F', 39, 'T'),
	(387, 'prox edc midia', 2, 'prox edc midia', NULL, '<b><i>olá eu sou o segundooo!</i></b>', 1, 5, 'F', 39, 'T'),
	(388, 'PHP, PDO e Oracle', 1, 'PHP, PDO e Oracle', NULL, '<b style="font-weight:normal;" id="docs-internal-guid-e0389255-62fb-2b10-d99b-b1b6500ca226"><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:32px;font-family:Arial;color:#111111;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Gravidade, de Newton a Einstein</span></p><br><br><p dir="ltr" style="line-height:1.125;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:32px;font-family:Arial;color:#111111;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;"><img src="https://lh3.googleusercontent.com/mpWar142fis6z5ICnwAPihSEqrtxMlGvYId8AJsntQSqfDXlIJzKa06supAakIm_G3AHnjiaT2lqngp_dtj1tCF3hVmc1SfPMgoVziclug3qP69o7OkQqpCezm4" style="border: none; transform: rotate(0.00rad); -webkit-transform: rotate(0.00rad);" height="321px;" width="274px;"></span></p><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:7.5pt;text-align: justify;"><span style="font-size:11px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Esquerda: Espaço para Newton; Direita: Espaço para Einstein. Fonte: http://www.onlineinvestingai.com</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:0pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:italic;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">A teoria de Newton, estudada no ensino médio e acomparação com a de Einstein.</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:12pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">A gravidade está presente a todo o momento, tudo o que vemos na Terra está sujeito aos efeitos da gravidade. Ela foi primeiramente identificada pelo cientista inglês Isaac Newton. Diz o mito que Newton estava embaixo de uma macieira e, quando uma maçã caiu, Newton começou a se perguntar o porquê de ela ter caído ao invés de ter flutuado. Ele associou esse fenômeno com o mesmo que deixa a Lua na órbita da Terra, criando assim o conceito de gravidade. Apesar de Isaac Newton ter demonstrado que a gravidade existe, ele não sabia explicá-la. Apenas após 200 anos alguém pôde explicá-la e mudar a visão que Newton passou; essa pessoa era um humilde físico alemão chamado Albert Einstein.</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:0pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">A História</span><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;"><br class="kix-line-break"></span><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Milênios antes das teorias de Einstein e de Newton, acreditava-se que a força que nos mantêm na Terra era um Deus que “puxava” tudo e todos para que ficassem no chão. Com o passar do tempo a ciência se desenvolveu. Galileu Galilei provou, através de observações, que não era o Sol que rodeava a Terra, mas sim a Terra que rodeava o Sol. Galileu foi duramente criticado em sua época e sua teoria até foi considerada uma heresia. Se ele, em público, não tivesse declarado que suas teorias estavam erradas, seria morto. Foi apenas no século XVII que o cientista inglês Isaac Newton descobriu que isto ocorria por causa da gravidade. Por muitos anos essas teorias de Newton, muito estudadas hoje no Ensino Médio, pareciam inabaláveis, já que era precisa em propósitos práticos. Todavia, após 200 anos, Albert Einstein descobriu que não era bem assim.</span></p><p dir="ltr" style="line-height:1.125;margin-top:0pt;margin-bottom:0pt;text-align: center;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;"><img src="https://lh5.googleusercontent.com/S2_PGBRXtoiNSJjT1NHrehsEOOH4vhaPbjKrCmsu5OfXOVhbH8tic81kc9_55EBo_4S6GMwTajCT2OXe9yR5_kySRfztVhoodmETcylCFeNjHOUFEXzw_mVvT4Y" style="border: none; transform: rotate(0.00rad); -webkit-transform: rotate(0.00rad);" height="320px;" width="265px;"></span></p><p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:7.5pt;text-align: justify;"><span style="font-size:11px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Charge sobre Einstein. Fonte: http://3.bp.blogspot.com</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:0pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:bold;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Albert Einstein (1879-1955)</span><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;"><br class="kix-line-break"></span><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Albert Einstein nasceu em 14 de Março de 1879. A sua famosa teoria é denominada como a teoria da Relatividade Geral, melhor aplicada a grandes velocidades, como a da luz. Albert Einstein discordava da teoria de Newton nos seguintes pontos: as teorias de Newton precediam o entendimento que as alterações na força gravitacional eram instantâneas, o que contradiz o fato de que existe uma velocidade limite (a da luz). As teorias de Newton também não explicam a existência de buracos negros. Buracos negros são corpos dotados de imensurável densidade e gravidade, podendo até mesmo capturar a luz.</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:12pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">A gravidade é uma força de atração entre todas as partículas do Universo. Esta força é determinada pela massa dessas partículas: quanto maior a massa, maior a atração. Newton não pôde explicar como a gravidade funciona. Como a figura acima mostra, Einstein dizia que a gravidade era uma distorção do espaço-tempo. Para uma melhor vizualição, basta imaginarmos uma cama elástica (por analogia, é o espaço tempo) e uma bola de boliche. A bola irá distorcer a cama elástica; nessa distorção se colocarmos um objeto mais “leve”, esse objeto tenderá a aproximar do objeto mais “pesado”.</span></p><p dir="ltr" style="line-height:1.5999999999999999;margin-top:0pt;margin-bottom:12pt;text-align: justify;"><span style="font-size:12px;font-family:Verdana;color:#333333;background-color:transparent;font-weight:normal;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap;">Foi assim que Albert Einstein definiu a Gravidade: sua teoria é bem aceita até os dias de hoje, apesar de ele ter vivido quase um século antes de nós.</span></p><br></b>', 1, 12, 'F', 43, 'T'),
	(389, 'Múltiplas notificações push c/ PhoneGap no Android', 8, 'Múltiplas notificações push c/ PhoneGap no Android', 'http://imasters.com.br/desenvolvimento/multiplas-notificacoes-push-na-barra-de-status-do-android-com-o-phonegap/', NULL, 2, 12, 'F', 43, 'T'),
	(390, 'Criando para o Android Wear', 2, 'Criando para o Android Wear', NULL, '<div align="center"><img src="/images/questoes/95ef03ae5d9cdd8f9b27eb2fbbeaa060.jpg"><img src="/images/questoes/d8b11267762ccc8378f786debe3cbff9.png" height="421" width="396"><br></div>', 1, 12, 'F', 43, 'T'),
	(391, 'Google Glass vai ganhar teclado virtual', 6, 'Google Glass vai ganhar teclado virtual', 'http://imasters.com.br/noticia/google-glass-vai-ganhar-teclado-virtual/', NULL, 2, 12, 'F', 43, 'T'),
	(392, 'Groovy + Procedure = Groovedure', 3, 'Groovy + Procedure = Groovedure', 'http://imasters.com.br/linguagens/java/groovy-procedure-groovedure/', NULL, 2, 12, 'F', 43, 'T'),
	(393, 'MySQL e tabelas temporárias', 7, 'MySQL e tabelas temporárias', 'http://imasters.com.br/banco-de-dados/mysql/mysql-e-tabelas-temporarias/', NULL, 2, 12, 'F', 43, 'T'),
	(394, 'Como tirar proveito do CGI para testes funcionais', 5, 'Como tirar proveito do CGI para testes funcionais', 'http://imasters.com.br/linguagens/php/como-tirar-proveito-cgi-para-testes-funcionais/', NULL, 2, 12, 'F', 43, 'T'),
	(396, 'Controle o computador por voz com Simon', 4, 'Controle o computador por voz com Simon', 'http://imasters.com.br/tecnologia/controle-o-computador-por-voz-com-simon/', NULL, 2, 12, 'F', 43, 'T'),
	(450, '10', 10, '10', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/10.htm', NULL, 2, 5, 'F', 1, 'T'),
	(451, '11', 11, '11', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/11.htm', NULL, 2, 5, 'T', 1, 'T'),
	(452, '12', 12, '12', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/12.htm', NULL, 2, 5, 'F', 1, 'T'),
	(453, '13', 13, '13', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/13.htm', NULL, 2, 5, 'F', 1, 'T'),
	(454, '14', 14, '14', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/14.htm', NULL, 2, 5, 'F', 1, 'T'),
	(455, '15', 15, '15', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/15.htm', NULL, 2, 5, 'F', 1, 'T'),
	(456, '16', 16, '16', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/16.htm', NULL, 2, 5, 'F', 1, 'T'),
	(457, '17', 17, '17', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/17.htm', NULL, 2, 5, 'F', 1, 'T'),
	(458, '18', 18, '18', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/18.htm', NULL, 2, 5, 'F', 1, 'T'),
	(459, '19', 19, '19', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/19.htm', NULL, 2, 5, 'F', 1, 'T'),
	(460, '2', 2, '2', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/02.htm', NULL, 2, 5, 'F', 1, 'T'),
	(461, '20', 20, '20', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/20.htm', NULL, 2, 5, 'F', 1, 'T'),
	(462, '21', 21, '21', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/21.htm', NULL, 2, 5, 'F', 1, 'T'),
	(463, '22', 22, '22', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/22.htm', NULL, 2, 5, 'F', 1, 'T'),
	(464, '23', 23, '23', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/23.htm', NULL, 2, 5, 'F', 1, 'T'),
	(465, '24', 24, '24', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/24.htm', NULL, 2, 5, 'F', 1, 'T'),
	(466, '25', 25, '25', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/25.htm', NULL, 2, 5, 'F', 1, 'T'),
	(467, '26', 26, '26', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/26.htm', NULL, 2, 5, 'F', 1, 'T'),
	(468, '27', 27, '27', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/27.htm', NULL, 2, 5, 'F', 1, 'T'),
	(469, '28', 28, '28', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/28.htm', NULL, 2, 5, 'F', 1, 'T'),
	(470, '29', 29, '29', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/29.htm', NULL, 2, 5, 'F', 1, 'T'),
	(471, '3', 3, '3', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/03.htm', NULL, 2, 5, 'F', 1, 'T'),
	(472, '30', 30, '30', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/30.htm', NULL, 2, 5, 'F', 1, 'T'),
	(473, '31', 31, '31', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/31.htm', NULL, 2, 5, 'F', 1, 'T'),
	(474, '32', 32, '32', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/32.htm', NULL, 2, 5, 'F', 1, 'T'),
	(475, '33', 33, '33', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/33.htm', NULL, 2, 5, 'F', 1, 'T'),
	(476, '34', 34, '34', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/34.htm', NULL, 2, 5, 'F', 1, 'T'),
	(477, '35', 35, '35', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/35.htm', NULL, 2, 5, 'F', 1, 'T'),
	(478, '36', 36, '36', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/36.htm', NULL, 2, 5, 'F', 1, 'T'),
	(479, '37', 37, '37', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/37.htm', NULL, 2, 5, 'F', 1, 'T'),
	(480, '38', 38, '38', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/38.htm', NULL, 2, 5, 'F', 1, 'T'),
	(481, '39', 39, '39', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/39.htm', NULL, 2, 5, 'F', 1, 'T'),
	(482, '4', 4, '4', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/04.htm', NULL, 2, 5, 'F', 1, 'T'),
	(483, '40', 40, '40', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/40.htm', NULL, 2, 5, 'F', 1, 'T'),
	(484, '41', 41, '41', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/41.htm', NULL, 2, 5, 'F', 1, 'T'),
	(485, '42', 42, '42', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/42.htm', NULL, 2, 5, 'F', 1, 'T'),
	(486, '43', 43, '43', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/43.htm', NULL, 2, 5, 'F', 1, 'T'),
	(487, '44', 44, '44', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/44.htm', NULL, 2, 5, 'F', 1, 'T'),
	(488, '45', 45, '45', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/45.htm', NULL, 2, 5, 'F', 1, 'T'),
	(489, '46', 46, '46', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/46.htm', NULL, 2, 5, 'F', 1, 'T'),
	(490, '47', 47, '47', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/47.htm', NULL, 2, 5, 'F', 1, 'T'),
	(491, '48', 48, '48', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/48.htm', NULL, 2, 5, 'F', 1, 'T'),
	(492, '49', 49, '49', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/49.htm', NULL, 2, 5, 'F', 1, 'T'),
	(493, '5', 5, '5', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/05.htm', NULL, 2, 5, 'F', 1, 'T'),
	(494, '50', 50, '50', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/50.htm', NULL, 2, 5, 'F', 1, 'T'),
	(495, '51', 51, '51', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/51.htm', NULL, 2, 5, 'F', 1, 'T'),
	(496, '6', 6, '6', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/06.htm', NULL, 2, 5, 'F', 1, 'T'),
	(497, '7', 7, '7', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/07.htm', NULL, 2, 5, 'F', 1, 'T'),
	(498, '8', 8, '8', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/08.htm', NULL, 2, 5, 'F', 1, 'T'),
	(499, '9', 9, '9', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/09.htm', NULL, 2, 5, 'F', 1, 'T'),
	(609, '10', 26, '10', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/10.htm', NULL, 2, 5, 'T', 37, 'T'),
	(610, '11', 27, '11', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/11.htm', NULL, 2, 5, 'T', 37, 'T'),
	(611, '12', 28, '12', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/12.htm', NULL, 2, 5, 'T', 37, 'T'),
	(612, '13', 29, '13', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/13.htm', NULL, 2, 5, 'T', 37, 'T'),
	(613, '14', 30, '14', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/14.htm', NULL, 2, 5, 'T', 37, 'T'),
	(614, '15', 31, '15', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/15.htm', NULL, 2, 5, 'T', 37, 'T'),
	(615, '16', 32, '16', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/16.htm', NULL, 2, 5, 'T', 37, 'T'),
	(616, '17', 33, '17', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/17.htm', NULL, 2, 5, 'T', 37, 'T'),
	(617, '18', 34, '18', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/18.htm', NULL, 2, 5, 'T', 37, 'T'),
	(618, '19', 35, '19', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/19.htm', NULL, 2, 5, 'T', 37, 'T'),
	(619, '2', 36, '2', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/2.htm', NULL, 2, 5, 'T', 37, 'T'),
	(620, '20', 37, '20', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/20.htm', NULL, 2, 5, 'T', 37, 'T'),
	(621, '21', 38, '21', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/21.htm', NULL, 2, 5, 'T', 37, 'T'),
	(622, '22', 39, '22', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/22.htm', NULL, 2, 5, 'T', 37, 'T'),
	(623, '23', 40, '23', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/23.htm', NULL, 2, 5, 'T', 37, 'T'),
	(624, '24', 41, '24', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/24.htm', NULL, 2, 5, 'T', 37, 'T'),
	(625, '25', 42, '25', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/25.htm', NULL, 2, 5, 'T', 37, 'T'),
	(626, '26', 43, '26', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/26.htm', NULL, 2, 5, 'T', 37, 'T'),
	(627, '27', 44, '27', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/27.htm', NULL, 2, 5, 'T', 37, 'T'),
	(628, '28', 45, '28', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/28.htm', NULL, 2, 5, 'T', 37, 'T'),
	(629, '29', 46, '29', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/29.htm', NULL, 2, 5, 'T', 37, 'T'),
	(630, '3', 47, '3', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/3.htm', NULL, 2, 5, 'T', 37, 'T'),
	(631, '30', 48, '30', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/30.htm', NULL, 2, 5, 'T', 37, 'T'),
	(632, '31', 49, '31', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/31.htm', NULL, 2, 5, 'T', 37, 'T'),
	(633, '32', 50, '32', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/32.htm', NULL, 2, 5, 'T', 37, 'T'),
	(634, '33', 51, '33', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/33.htm', NULL, 2, 5, 'T', 37, 'T'),
	(635, '34', 52, '34', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/34.htm', NULL, 2, 5, 'T', 37, 'T'),
	(636, '35', 53, '35', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/35.htm', NULL, 2, 5, 'T', 37, 'T'),
	(637, '36', 54, '36', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/36.htm', NULL, 2, 5, 'T', 37, 'T'),
	(638, '37', 55, '37', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/37.htm', NULL, 2, 5, 'T', 37, 'T'),
	(639, '38', 56, '38', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/38.htm', NULL, 2, 5, 'T', 37, 'T'),
	(640, '39', 57, '39', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/39.htm', NULL, 2, 5, 'T', 37, 'T'),
	(641, '4', 58, '4', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/4.htm', NULL, 2, 5, 'T', 37, 'T'),
	(642, '40', 59, '40', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/40.htm', NULL, 2, 5, 'T', 37, 'T'),
	(643, '41', 60, '41', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/41.htm', NULL, 2, 5, 'T', 37, 'T'),
	(644, '42', 61, '42', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/42.htm', NULL, 2, 5, 'T', 37, 'T'),
	(645, '43', 62, '43', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/43.htm', NULL, 2, 5, 'T', 37, 'T'),
	(646, '44', 63, '44', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/44.htm', NULL, 2, 5, 'T', 37, 'T'),
	(647, '45', 64, '45', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/45.htm', NULL, 2, 5, 'T', 37, 'T'),
	(648, '46', 65, '46', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/46.htm', NULL, 2, 5, 'T', 37, 'T'),
	(649, '47', 66, '47', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/47.htm', NULL, 2, 5, 'T', 37, 'T'),
	(650, '48', 67, '48', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/48.htm', NULL, 2, 5, 'T', 37, 'T'),
	(651, '49', 68, '49', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/49.htm', NULL, 2, 5, 'T', 37, 'T'),
	(652, '5', 69, '5', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/5.htm', NULL, 2, 5, 'T', 37, 'T'),
	(653, '50', 70, '50', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/50.htm', NULL, 2, 5, 'T', 37, 'T'),
	(654, '51', 71, '51', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/51.htm', NULL, 2, 5, 'T', 37, 'T'),
	(655, '6', 72, '6', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/6.htm', NULL, 2, 5, 'T', 37, 'T'),
	(656, '7', 73, '7', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/7.htm', NULL, 2, 5, 'T', 37, 'T'),
	(657, '8', 74, '8', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/8.htm', NULL, 2, 5, 'T', 37, 'T'),
	(658, '9', 75, '9', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/9.htm', NULL, 2, 5, 'T', 37, 'T'),
	(659, '52', 52, '52', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/52.htm', NULL, 2, 5, 'F', 1, 'T'),
	(660, '01', 1, '01', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/01.htm', NULL, 2, 5, 'T', 44, 'T'),
	(661, '02', 2, '02', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/02.htm', NULL, 2, 5, 'T', 44, 'T'),
	(662, '03', 3, '03', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/03.htm', NULL, 2, 5, 'T', 44, 'T'),
	(663, '04', 4, '04', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/04.htm', NULL, 2, 5, 'T', 44, 'T'),
	(664, '05', 5, '05', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/05.htm', NULL, 2, 5, 'T', 44, 'T'),
	(665, '06', 6, '06', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/06.htm', NULL, 2, 5, 'T', 44, 'T'),
	(666, '07', 7, '07', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/07.htm', NULL, 2, 5, 'T', 44, 'T'),
	(667, '08', 8, '08', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/08.htm', NULL, 2, 5, 'T', 44, 'T'),
	(668, '09', 9, '09', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/09.htm', NULL, 2, 5, 'T', 44, 'T'),
	(669, '10', 10, '10', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/10.htm', NULL, 2, 5, 'T', 44, 'T'),
	(670, '11', 11, '11', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/11.htm', NULL, 2, 5, 'T', 44, 'T'),
	(671, '12', 12, '12', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/12.htm', NULL, 2, 5, 'T', 44, 'T'),
	(672, '13', 13, '13', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/13.htm', NULL, 2, 5, 'T', 44, 'T'),
	(673, '14', 14, '14', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/14.htm', NULL, 2, 5, 'T', 44, 'T'),
	(674, '15', 15, '15', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/15.htm', NULL, 2, 5, 'T', 44, 'T'),
	(675, '16', 16, '16', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/16.htm', NULL, 2, 5, 'T', 44, 'T'),
	(676, '17', 17, '17', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/17.htm', NULL, 2, 5, 'T', 44, 'T'),
	(677, '18', 18, '18', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/18.htm', NULL, 2, 5, 'T', 44, 'T'),
	(678, '19', 19, '19', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/19.htm', NULL, 2, 5, 'T', 44, 'T'),
	(679, '20', 20, '20', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/20.htm', NULL, 2, 5, 'T', 44, 'T'),
	(680, '21', 21, '21', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/21.htm', NULL, 2, 5, 'T', 44, 'T'),
	(681, '22', 22, '22', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/22.htm', NULL, 2, 5, 'T', 44, 'T'),
	(682, '23', 23, '23', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/23.htm', NULL, 2, 5, 'T', 44, 'T'),
	(683, '24', 24, '24', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/24.htm', NULL, 2, 5, 'T', 44, 'T'),
	(684, '25', 25, '25', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/25.htm', NULL, 2, 5, 'T', 44, 'T'),
	(685, '26', 26, '26', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/26.htm', NULL, 2, 5, 'T', 44, 'T'),
	(686, '27', 27, '27', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/27.htm', NULL, 2, 5, 'T', 44, 'T'),
	(687, '28', 28, '28', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/28.htm', NULL, 2, 5, 'T', 44, 'T'),
	(688, '29', 29, '29', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/29.htm', NULL, 2, 5, 'T', 44, 'T'),
	(689, '30', 30, '30', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/30.htm', NULL, 2, 5, 'T', 44, 'T'),
	(690, '31', 31, '31', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/31.htm', NULL, 2, 5, 'T', 44, 'T'),
	(691, '32', 32, '32', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/32.htm', NULL, 2, 5, 'T', 44, 'T'),
	(692, '33', 33, '33', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/33.htm', NULL, 2, 5, 'T', 44, 'T'),
	(693, '34', 34, '34', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/34.htm', NULL, 2, 5, 'T', 44, 'T'),
	(694, '35', 35, '35', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/35.htm', NULL, 2, 5, 'T', 44, 'T'),
	(695, '36', 36, '36', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/36.htm', NULL, 2, 5, 'T', 44, 'T'),
	(696, '37', 37, '37', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/37.htm', NULL, 2, 5, 'T', 44, 'T'),
	(697, '38', 38, '38', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/38.htm', NULL, 2, 5, 'T', 44, 'T'),
	(698, '39', 39, '39', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/39.htm', NULL, 2, 5, 'T', 44, 'T'),
	(699, '40', 40, '40', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/40.htm', NULL, 2, 5, 'T', 44, 'T'),
	(700, '41', 41, '41', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/41.htm', NULL, 2, 5, 'T', 44, 'T'),
	(701, '42', 42, '42', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/42.htm', NULL, 2, 5, 'T', 44, 'T'),
	(702, '43', 43, '43', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/43.htm', NULL, 2, 5, 'T', 44, 'T'),
	(703, '44', 44, '44', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/44.htm', NULL, 2, 5, 'T', 44, 'T'),
	(704, '45', 45, '45', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/45.htm', NULL, 2, 5, 'T', 44, 'T'),
	(705, '46', 46, '46', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/46.htm', NULL, 2, 5, 'T', 44, 'T'),
	(706, '47', 47, '47', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/47.htm', NULL, 2, 5, 'T', 44, 'T'),
	(707, '48', 48, '48', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/48.htm', NULL, 2, 5, 'T', 44, 'T'),
	(708, '49', 49, '49', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/49.htm', NULL, 2, 5, 'T', 44, 'T'),
	(709, '50', 50, '50', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/50.htm', NULL, 2, 5, 'T', 44, 'T'),
	(710, '51', 51, '51', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/51.htm', NULL, 2, 5, 'T', 44, 'T'),
	(711, '52', 52, '52', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/52.htm', NULL, 2, 5, 'T', 44, 'T'),
	(712, 'texto', 76, 'texto', NULL, 'olá eu sou um <b>texto</b><br>', 1, 5, 'F', 37, 'T'),
	(713, '01', 1, '01', NULL, '01<br>', 1, 3, 'F', 52, 'T'),
	(714, '02', 2, '02', NULL, '02<br>', 1, 3, 'F', 52, 'T'),
	(715, '03', 3, '03', NULL, '03<br>', 1, 3, 'F', 52, 'T'),
	(716, '01', 1, '01', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/01.htm', NULL, 2, 5, 'F', 45, 'T'),
	(717, '02', 2, '02', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/02.htm', NULL, 2, 5, 'T', 45, 'T'),
	(718, '03', 3, '03', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/03.htm', NULL, 2, 5, 'T', 45, 'T'),
	(719, '04', 4, '04', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/04.htm', NULL, 2, 5, 'T', 45, 'T'),
	(720, '05', 5, '05', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/05.htm', NULL, 2, 5, 'T', 45, 'T'),
	(721, '06', 6, '06', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/06.htm', NULL, 2, 5, 'T', 45, 'T'),
	(722, '07', 7, '07', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/07.htm', NULL, 2, 5, 'T', 45, 'T'),
	(723, '08', 8, '08', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/08.htm', NULL, 2, 5, 'T', 45, 'T'),
	(724, '09', 9, '09', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/09.htm', NULL, 2, 5, 'T', 45, 'T'),
	(725, '10', 10, '10', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/10.htm', NULL, 2, 5, 'T', 45, 'T'),
	(726, '11', 11, '11', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/11.htm', NULL, 2, 5, 'T', 45, 'T'),
	(727, '12', 12, '12', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/12.htm', NULL, 2, 5, 'T', 45, 'T'),
	(728, '13', 13, '13', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/13.htm', NULL, 2, 5, 'T', 45, 'T'),
	(729, '14', 14, '14', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/14.htm', NULL, 2, 5, 'T', 45, 'T'),
	(730, '15', 15, '15', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/15.htm', NULL, 2, 5, 'T', 45, 'T'),
	(731, '16', 16, '16', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/16.htm', NULL, 2, 5, 'T', 45, 'T'),
	(732, '17', 17, '17', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/17.htm', NULL, 2, 5, 'T', 45, 'T'),
	(733, '18', 18, '18', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/18.htm', NULL, 2, 5, 'T', 45, 'T'),
	(734, '19', 19, '19', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/19.htm', NULL, 2, 5, 'T', 45, 'T'),
	(735, '20', 20, '20', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/20.htm', NULL, 2, 5, 'T', 45, 'T'),
	(736, '21', 21, '21', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/21.htm', NULL, 2, 5, 'T', 45, 'T'),
	(737, '22', 22, '22', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/22.htm', NULL, 2, 5, 'T', 45, 'T'),
	(738, '23', 23, '23', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/23.htm', NULL, 2, 5, 'T', 45, 'T'),
	(739, '24', 24, '24', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/24.htm', NULL, 2, 5, 'T', 45, 'T'),
	(740, '25', 25, '25', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/25.htm', NULL, 2, 5, 'T', 45, 'T'),
	(741, '26', 26, '26', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/26.htm', NULL, 2, 5, 'T', 45, 'T'),
	(742, '27', 27, '27', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/27.htm', NULL, 2, 5, 'T', 45, 'T'),
	(743, '28', 28, '28', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/28.htm', NULL, 2, 5, 'T', 45, 'T'),
	(744, '29', 29, '29', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/29.htm', NULL, 2, 5, 'T', 45, 'T'),
	(745, '30', 30, '30', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/30.htm', NULL, 2, 5, 'T', 45, 'T'),
	(746, '31', 31, '31', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/31.htm', NULL, 2, 5, 'T', 45, 'T'),
	(747, '32', 32, '32', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/32.htm', NULL, 2, 5, 'T', 45, 'T'),
	(748, '33', 33, '33', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/33.htm', NULL, 2, 5, 'T', 45, 'T'),
	(749, '34', 34, '34', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/34.htm', NULL, 2, 5, 'T', 45, 'T'),
	(750, '35', 35, '35', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/35.htm', NULL, 2, 5, 'T', 45, 'T'),
	(751, '36', 36, '36', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/36.htm', NULL, 2, 5, 'T', 45, 'T'),
	(752, '37', 37, '37', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/37.htm', NULL, 2, 5, 'T', 45, 'T'),
	(753, '38', 38, '38', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/38.htm', NULL, 2, 5, 'T', 45, 'T'),
	(754, '39', 39, '39', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/39.htm', NULL, 2, 5, 'T', 45, 'T'),
	(755, '40', 40, '40', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/40.htm', NULL, 2, 5, 'T', 45, 'T'),
	(756, '41', 41, '41', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/41.htm', NULL, 2, 5, 'T', 45, 'T'),
	(757, '42', 42, '42', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/42.htm', NULL, 2, 5, 'T', 45, 'T'),
	(758, '43', 43, '43', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/43.htm', NULL, 2, 5, 'T', 45, 'T'),
	(759, '44', 44, '44', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/44.htm', NULL, 2, 5, 'T', 45, 'T'),
	(760, '45', 45, '45', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/45.htm', NULL, 2, 5, 'T', 45, 'T'),
	(761, '46', 46, '46', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/46.htm', NULL, 2, 5, 'T', 45, 'T'),
	(762, '47', 47, '47', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/47.htm', NULL, 2, 5, 'T', 45, 'T'),
	(763, '48', 48, '48', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/48.htm', NULL, 2, 5, 'T', 45, 'T'),
	(764, '49', 49, '49', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/49.htm', NULL, 2, 5, 'T', 45, 'T'),
	(765, 'AudioMultiPlataforma', 50, 'AudioMultiPlataforma', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/AudioMultiPlataforma.htm', NULL, 2, 5, 'T', 45, 'T'),
	(766, 'jquery.wiquadro', 51, 'jquery.wiquadro', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/jquery.wiquadro.js', NULL, 2, 5, 'T', 45, 'T'),
	(767, 'Multi Prova4Alternativas', 52, 'Multi Prova4Alternativas', 'http://edc.wilivro.com.br/alfabetizacao_escala/alfabetizacao_escala/Licao01/Multi_Prova4Alternativas.html', NULL, 2, 5, 'T', 45, 'T'),
	(768, 'teste', 1, 'teste', NULL, '<div style="text-align: center;">&lt;iframe width="560" height="315" src="//www.youtube.com/embed/5KR4pZHUFOs" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</div><div><br></div><div><i>Muito legal</i> essa <b>solução </b><u>legal</u>&nbsp; - Ficou chato! dfgf haaaa! dgdfsg</div>', 1, 12, 'F', 41, 'T'),
	(769, 'Midia Legal', 1, 'Midia Legal', NULL, '<div style="text-align: center;">&lt;iframe width="1060" height="515" src="//www.youtube.com/embed/N2FRyjLBprk" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</div>', 1, 12, 'F', 49, 'T'),
	(770, 'Segunda midia legal', 1, 'Segunda midia legal', NULL, '<div style="text-align: center;">&lt;iframe width="1060" height="515" src="//www.youtube.com/embed/ZsFrZTSV2nA" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</div>', 1, 12, 'F', 50, 'T');
/*!40000 ALTER TABLE `edcmidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.edcmidiadescritor
DROP TABLE IF EXISTS `edcmidiadescritor`;
CREATE TABLE IF NOT EXISTS `edcmidiadescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEdcmidia` int(10) unsigned NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_edcmidia` (`IdEdcmidia`),
  KEY `fk_descritor` (`IdDescritor`),
  CONSTRAINT `fk_descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `fk_edcmidia` FOREIGN KEY (`IdEdcmidia`) REFERENCES `edcmidia` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1858 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.edcmidiadescritor: ~87 rows (aproximadamente)
/*!40000 ALTER TABLE `edcmidiadescritor` DISABLE KEYS */;
INSERT INTO `edcmidiadescritor` (`Id`, `IdEdcmidia`, `IdDescritor`) VALUES
	(68, 326, 10),
	(1663, 660, 12),
	(1664, 660, 14),
	(1665, 661, 15),
	(1666, 661, 16),
	(1667, 662, 12),
	(1668, 662, 19),
	(1669, 663, 17),
	(1670, 664, 16),
	(1671, 664, 17),
	(1672, 665, 12),
	(1673, 665, 19),
	(1674, 666, 12),
	(1675, 666, 17),
	(1676, 667, 19),
	(1677, 668, 14),
	(1678, 669, 15),
	(1679, 669, 18),
	(1680, 670, 17),
	(1681, 671, 12),
	(1682, 671, 13),
	(1683, 671, 14),
	(1684, 671, 15),
	(1685, 671, 16),
	(1686, 671, 17),
	(1687, 671, 18),
	(1688, 671, 19),
	(1689, 672, 12),
	(1690, 672, 15),
	(1691, 673, 12),
	(1692, 673, 14),
	(1693, 673, 19),
	(1694, 674, 16),
	(1695, 674, 17),
	(1696, 675, 17),
	(1697, 675, 18),
	(1698, 675, 19),
	(1699, 676, 13),
	(1700, 677, 12),
	(1701, 677, 13),
	(1702, 678, 17),
	(1703, 678, 19),
	(1704, 679, 12),
	(1705, 680, 13),
	(1706, 680, 16),
	(1707, 681, 16),
	(1708, 682, 13),
	(1709, 682, 17),
	(1710, 683, 12),
	(1711, 683, 18),
	(1712, 684, 17),
	(1713, 684, 19),
	(1714, 685, 14),
	(1715, 685, 16),
	(1716, 686, 17),
	(1717, 687, 14),
	(1718, 688, 12),
	(1719, 688, 17),
	(1720, 689, 12),
	(1721, 689, 13),
	(1722, 689, 14),
	(1723, 689, 15),
	(1724, 689, 16),
	(1725, 689, 17),
	(1726, 689, 18),
	(1727, 689, 19),
	(1728, 690, 14),
	(1729, 690, 16),
	(1730, 691, 12),
	(1731, 691, 17),
	(1732, 692, 12),
	(1733, 692, 13),
	(1734, 692, 14),
	(1735, 692, 15),
	(1736, 693, 19),
	(1737, 694, 14),
	(1762, 388, 14),
	(1763, 388, 16),
	(1764, 390, 12),
	(1765, 396, 16),
	(1851, 324, 4),
	(1852, 325, 3),
	(1853, 325, 4),
	(1854, 325, 10),
	(1855, 363, 3),
	(1856, 363, 4),
	(1857, 363, 10);
/*!40000 ALTER TABLE `edcmidiadescritor` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.edcprerequisito
DROP TABLE IF EXISTS `edcprerequisito`;
CREATE TABLE IF NOT EXISTS `edcprerequisito` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `IdEdc` int(11) unsigned NOT NULL,
  `IdEdcPreRequisito` int(11) unsigned NOT NULL,
  `Grupo` int(11) unsigned DEFAULT '0' COMMENT 'Determina grupos para a realizacao dos edcs.',
  PRIMARY KEY (`Id`),
  KEY `FK__edc` (`IdEdc`),
  KEY `FK__edc_2` (`IdEdcPreRequisito`),
  CONSTRAINT `FK__edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK__edc_2` FOREIGN KEY (`IdEdcPreRequisito`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.edcprerequisito: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `edcprerequisito` DISABLE KEYS */;
INSERT INTO `edcprerequisito` (`Id`, `IdEdc`, `IdEdcPreRequisito`, `Grupo`) VALUES
	(91, 4, 9, 0),
	(92, 4, 7, 0),
	(93, 4, 14, 0),
	(94, 4, 23, 0),
	(95, 4, 12, 1),
	(96, 4, 1, 1),
	(97, 4, 17, 2),
	(98, 4, 19, 2),
	(99, 37, 39, 0),
	(101, 55, 53, 0),
	(102, 60, 59, 0);
/*!40000 ALTER TABLE `edcprerequisito` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.edcturma
DROP TABLE IF EXISTS `edcturma`;
CREATE TABLE IF NOT EXISTS `edcturma` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdEdc` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_edcturma_turma` (`IdTurma`),
  KEY `FK_edcturma_edc` (`IdEdc`),
  CONSTRAINT `FK_edcturma_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK_edcturma_turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.edcturma: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `edcturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `edcturma` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.endereco
DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Logradouro` varchar(50) NOT NULL,
  `Bairro` varchar(50) NOT NULL,
  `Cidade` varchar(50) NOT NULL,
  `UF` char(2) NOT NULL,
  `CEP` varchar(9) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.endereco: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`Id`, `Logradouro`, `Bairro`, `Cidade`, `UF`, `CEP`) VALUES
	(1, 'Rua José Pereira', 'Ambrósio', 'Natal', 'RN', '59000-000'),
	(2, 'Rua José Pereira', 'Ambrósio', 'PARNAMIRIM', 'RN', '59149-356'),
	(15, 'Rua Aeroporto de Navegantes, 434', 'Emaús2', 'PARNAMIRIM', 'RN', '59149-356'),
	(16, 'Maracajaú', 'Maracajaú', 'Maxaranguape', 'RN', '59000-000'),
	(17, 'Maracajaú', 'Maracajaú', 'PARNAMIRIM', 'RN', '59149-356'),
	(20, 'rua alguma coisa não me lembro', 'alecrim', 'Natal', 'rn', '59054-795'),
	(21, 'rua alguma coisa não me lembro', 'alecrim', 'Natal', 'RN', '59054-795'),
	(22, 'Rua Antônio Conselheiro, 44', 'Jequiti', 'Silvio Santos', 'RN', '59000-000'),
	(23, 'Avenida Engenheiro Armando de Arruda Pereira, 1266', 'bairro teste', 'PARNAMIRIM', 'RN', '59000-000'),
	(24, 'teste huhu', 'teste', 'teste', 'RN', '59999-999'),
	(25, 'tec sdafadsgfsd', 'tec', 'tec', 'RN', '59000-000');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.escola
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.escola: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
INSERT INTO `escola` (`Id`, `Nome`, `IdEndereco`, `IdCliente`) VALUES
	(1, 'Escola José pereira', 15, 15),
	(3, 'Escola Fulaninho de Tal', 2, 15),
	(4, 'Escola Zizi', 1, 15),
	(5, 'Escola Estadual FFF', 15, 1),
	(6, 'Escola Teste', 16, 15),
	(7, 'Mais uma escola teste!', 17, 15),
	(8, 'Escola Estadual Leandro Fortaleza', 22, 15);
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.formulariodinamico
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.formulariodinamico: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `formulariodinamico` DISABLE KEYS */;
INSERT INTO `formulariodinamico` (`Id`, `Nome`, `IdCliente`, `IdUsuario`, `IdGrupoUsuario`, `DataCriacao`, `DataAlteracao`) VALUES
	(1, 'Formulário de teste', 15, 3, 4, '2014-06-06 10:14:58', '2014-06-13 10:34:39'),
	(5, 'Mais um formulário de teste', 18, 3, 4, '2014-06-13 10:13:10', '2014-07-18 11:10:56'),
	(8, 'formulario para testar exclusão de campos', 15, 3, 4, '2014-06-18 06:13:07', '2014-06-18 18:13:08'),
	(9, 'formulário de teste', 1, 8, 4, '2014-07-18 11:54:27', '2014-07-18 11:54:28');
/*!40000 ALTER TABLE `formulariodinamico` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.formulariodinamicocampo
DROP TABLE IF EXISTS `formulariodinamicocampo`;
CREATE TABLE IF NOT EXISTS `formulariodinamicocampo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdForm` int(11) NOT NULL,
  `Tipo` int(11) unsigned NOT NULL,
  `Label` varchar(50) NOT NULL,
  `Opcoes` text,
  `Obrigatorio` enum('T','F') NOT NULL,
  `Ordem` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_form` (`IdForm`),
  KEY `FK_tipo` (`Tipo`),
  CONSTRAINT `FK_form` FOREIGN KEY (`IdForm`) REFERENCES `formulariodinamico` (`Id`),
  CONSTRAINT `FK_tipo` FOREIGN KEY (`Tipo`) REFERENCES `tiposcamposformulario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.formulariodinamicocampo: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `formulariodinamicocampo` DISABLE KEYS */;
INSERT INTO `formulariodinamicocampo` (`Id`, `IdForm`, `Tipo`, `Label`, `Opcoes`, `Obrigatorio`, `Ordem`) VALUES
	(1, 1, 1, 'Pergunta teste 1', NULL, 'T', 1),
	(2, 1, 4, 'Pergunta teste 2', 'alteração tipo campo;funfou', 'F', 3),
	(3, 1, 3, 'Pergunta teste 3', 'opção 4;opção 1;opção 3;opção 5 funfou!', 'T', 2),
	(4, 5, 2, 'pergunta besta 1', NULL, 'T', 1),
	(5, 5, 1, 'pergunta besta 3', NULL, 'T', 2),
	(6, 5, 4, 'pergunta besta 2', '1;gdfgdf;dfgfds', 'T', 4),
	(7, 5, 5, 'pergunta besta 4', 'dsfdsf;dsfsdfd;sfdsfsd;dfd', 'T', 3),
	(9, 8, 3, 'ui, ui', 'dsgsdg;dsgds', 'F', 1),
	(10, 8, 2, 'miau, miau', NULL, 'T', 2),
	(11, 8, 1, 'dsgdsgdsg', NULL, 'F', 3),
	(12, 8, 4, 'safdsfdas', 'wqrwqr;wrwr', 'F', 4),
	(14, 8, 2, 'fsdfdsfdsfds', NULL, 'T', 6),
	(15, 8, 4, 'esse é penultimo', 'dsfdsfdsf;dfdsfd', 'F', 5),
	(16, 9, 1, 'Pergunta 1', NULL, 'T', 1),
	(17, 9, 3, 'Pergunta 2', 'teste 1;teste 2;teste 3', 'F', 2);
/*!40000 ALTER TABLE `formulariodinamicocampo` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.formulariodinamicoresposta
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
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.formulariodinamicoresposta: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `formulariodinamicoresposta` DISABLE KEYS */;
INSERT INTO `formulariodinamicoresposta` (`Id`, `IdForm`, `IdCampo`, `Resposta`, `IdUsuario`, `DataResposta`) VALUES
	(98, 5, 4, 'SFD', 1, '2014-06-17 11:23:47'),
	(99, 5, 5, 'sfd', 1, '2014-06-17 11:23:47'),
	(100, 5, 7, 'dsfsdfd', 1, '2014-06-17 11:23:47'),
	(101, 5, 6, '1', 1, '2014-06-17 11:23:47'),
	(103, 1, 1, 'sadsaf', 1, '2014-06-17 11:24:03'),
	(104, 1, 3, 'opção 4;opção 5 funfou!', 1, '2014-06-17 11:24:03'),
	(105, 1, 2, 'funfou', 1, '2014-06-17 11:24:03'),
	(108, 9, 16, 'Tecnoblog', 35, '2014-07-18 14:07:31'),
	(109, 9, 17, 'teste 1;teste 2', 35, '2014-07-18 14:07:31');
/*!40000 ALTER TABLE `formulariodinamicoresposta` ENABLE KEYS */;


-- Copiando estrutura para procedure wiquadro.geraCartoes
DROP PROCEDURE IF EXISTS `geraCartoes`;
DELIMITER //
CREATE DEFINER=`root`@`%` PROCEDURE `geraCartoes`(IN `_cliente` INT, IN `_disciplina` INT, IN `_usuario` INT, IN `_total` INT, IN `_email` VARCHAR(150))
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
  
	INSERT INTO cartoes 
		(Sequencia, Codigo, IdCliente, IdDisciplina, IdUsuario, DataCreate,Email)
	VALUES
		(seq, random, _cliente, _disciplina, _usuario, NOW(),_email);
	
END WHILE;
COMMIT;
END//
DELIMITER ;


-- Copiando estrutura para tabela wiquadro.grupousuario
DROP TABLE IF EXISTS `grupousuario`;
CREATE TABLE IF NOT EXISTS `grupousuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_GrupoUsuario_Nome` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.grupousuario: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `grupousuario` DISABLE KEYS */;
INSERT INTO `grupousuario` (`Id`, `Nome`) VALUES
	(3, 'Admin'),
	(4, 'Aluno'),
	(1, 'Professor'),
	(2, 'Supervisor'),
	(5, 'Wilivro');
/*!40000 ALTER TABLE `grupousuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.grupousuariopermissaoacesso
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

-- Copiando dados para a tabela wiquadro.grupousuariopermissaoacesso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `grupousuariopermissaoacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupousuariopermissaoacesso` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.logdicas
DROP TABLE IF EXISTS `logdicas`;
CREATE TABLE IF NOT EXISTS `logdicas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdAluno` int(11) DEFAULT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdQuestao` int(11) DEFAULT '0',
  `IdDica` int(11) DEFAULT '0',
  `DataHoraPedidoAluno` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `FK_logdicas_aluno` (`IdAluno`),
  KEY `FK_logdicas_questao` (`IdQuestao`),
  KEY `FK_logdicas_questaodica` (`IdDica`),
  KEY `FK_logdicas_alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_logdicas_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_logdicas_alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_logdicas_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`),
  CONSTRAINT `FK_logdicas_questaodica` FOREIGN KEY (`IdDica`) REFERENCES `questaodica` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.logdicas: ~23 rows (aproximadamente)
/*!40000 ALTER TABLE `logdicas` DISABLE KEYS */;
INSERT INTO `logdicas` (`Id`, `IdAluno`, `IdAlunoTurma`, `IdQuestao`, `IdDica`, `DataHoraPedidoAluno`) VALUES
	(19, 1, 59, 1, 1, '2013-12-09 14:52:45'),
	(20, 1, 59, 1, 2, '2013-12-09 14:52:55'),
	(21, 1, 59, 1, 3, '2013-12-09 14:52:58'),
	(22, 1, 59, 1, 26, '2013-12-09 14:53:01'),
	(26, 1, 59, 11, 32, '2013-12-09 14:55:47'),
	(27, 1, 59, 11, 32, '2013-12-09 14:59:04'),
	(28, 1, 59, 11, 32, '2013-12-09 14:59:43'),
	(29, 1, 59, 11, 32, '2013-12-09 15:00:52'),
	(30, 1, 59, 11, 32, '2013-12-09 15:02:24'),
	(47, 1, 59, 41, 56, '2014-04-17 09:14:48'),
	(48, 1, 59, 41, 56, '2014-05-06 11:15:03'),
	(49, 1, 59, 41, 56, '2014-05-06 11:17:28'),
	(50, 1, 8, 42, 57, '2014-05-16 11:27:17'),
	(51, 1, 8, 42, 58, '2014-05-16 11:27:20'),
	(52, 1, 8, 42, 59, '2014-05-16 11:27:21'),
	(53, 1, 8, 43, 60, '2014-05-29 14:34:05'),
	(54, 78, 214, 56, 68, '2014-06-05 13:58:47'),
	(55, 1, 8, 64, 72, '2014-06-09 15:01:05'),
	(56, 1, 8, 64, 72, '2014-06-11 14:43:06'),
	(57, 76, 204, 64, 72, '2014-06-18 10:17:53'),
	(58, 78, 214, 64, 72, '2014-06-20 12:13:07'),
	(59, NULL, 57, 66, 74, '2014-06-30 10:53:30'),
	(60, NULL, 57, 68, 76, '2014-07-29 11:30:03');
/*!40000 ALTER TABLE `logdicas` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.loglogin
DROP TABLE IF EXISTS `loglogin`;
CREATE TABLE IF NOT EXISTS `loglogin` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Url` varchar(200) NOT NULL,
  `DataHora` datetime NOT NULL,
  `IP` varchar(15) NOT NULL,
  `UserAgent` varchar(150) NOT NULL,
  `Acao` varchar(50) NOT NULL,
  `Login` varchar(100) NOT NULL,
  `Senha` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=849 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.loglogin: ~906 rows (aproximadamente)
/*!40000 ALTER TABLE `loglogin` DISABLE KEYS */;
INSERT INTO `loglogin` (`Id`, `Url`, `DataHora`, `IP`, `UserAgent`, `Acao`, `Login`, `Senha`) VALUES
	(13, 'http://wiquadro.dev/usuario/login', '2014-05-27 17:46:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456789'),
	(14, 'http://wiquadro.dev/usuario/login', '2014-05-27 17:47:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '78'),
	(15, 'http://wiquadro.dev/usuario/login', '2014-05-27 17:47:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(16, 'http://wiquadro.dev/usuario/login', '2014-05-27 17:47:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(17, 'http://wiquadro.dev/site/logout', '2014-05-27 17:47:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(18, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:36:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(19, 'http://wiquadro.dev/site/logout', '2014-05-28 09:45:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(20, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:47:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Tentativa de Login', 'wiquadro@gmail.com', '4524420420'),
	(21, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:54:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(22, 'http://wiquadro.dev/site/logout', '2014-05-28 09:55:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(23, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:55:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(24, 'http://wiquadro.dev/site/logout', '2014-05-28 09:56:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(25, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:56:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(26, 'http://wiquadro.dev/site/logout', '2014-05-28 09:58:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(27, 'http://wiquadro.dev/usuario/login', '2014-05-28 09:58:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(28, 'http://wiquadro.dev/site/logout', '2014-05-28 10:16:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(29, 'http://wiquadro.dev/usuario/login', '2014-05-28 10:20:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(30, 'http://wiquadro.dev/site/logout', '2014-05-28 15:22:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(31, 'http://wiquadro.dev/usuario/login', '2014-05-28 15:22:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(32, 'http://dev.wiquadro/usuario/login', '2014-05-29 08:43:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(33, 'http://wiquadro.dev/usuario/login', '2014-05-29 09:26:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(34, 'http://wiquadro.dev/site/logout', '2014-05-29 09:26:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(35, 'http://wiquadro.dev/usuario/login', '2014-05-29 09:27:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(36, 'http://wiquadro.dev/usuario/login', '2014-05-29 14:09:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(37, 'http://wiquadro.dev/site/logout', '2014-05-29 14:11:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(38, 'http://wiquadro.dev/usuario/login', '2014-05-29 14:30:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(39, 'http://wiquadro.dev/usuario/login', '2014-05-29 16:06:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(40, 'http://wiquadro.dev/usuario/login', '2014-05-29 16:33:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(41, 'http://dev.wiquadro/usuario/login', '2014-05-29 17:02:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(42, 'http://dev.wiquadro/usuario/login', '2014-05-30 08:10:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(43, 'http://wiquadro.dev/usuario/login', '2014-05-30 08:21:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(44, 'http://wiquadro.dev/site/logout', '2014-05-30 09:15:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(45, 'http://wiquadro.dev/usuario/login', '2014-05-30 09:15:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(46, 'http://dev.wiquadro/usuario/login', '2014-06-02 08:50:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(47, 'http://wiquadro.dev/usuario/login', '2014-06-02 09:03:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(48, 'http://wiquadro.dev/site/logout', '2014-06-02 09:03:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(49, 'http://wiquadro.dev/usuario/login', '2014-06-02 09:03:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(50, 'http://dev.wiquadro/site/logout', '2014-06-02 09:33:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(51, 'http://dev.wiquadro/usuario/login', '2014-06-02 09:33:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(52, 'http://dev.wiquadro/site/logout', '2014-06-02 09:52:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(53, 'http://dev.wiquadro/usuario/login', '2014-06-02 09:52:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(54, 'http://dev.wiquadro/site/logout', '2014-06-02 09:52:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(55, 'http://dev.wiquadro/usuario/login', '2014-06-02 09:52:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(56, 'http://dev.wiquadro/site/novoAluno', '2014-06-02 09:52:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(57, 'http://dev.wiquadro/usuario/login', '2014-06-02 09:53:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(58, 'http://dev.wiquadro/site/logout', '2014-06-02 09:53:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(59, 'http://dev.wiquadro/usuario/login', '2014-06-02 09:53:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(60, 'http://dev.wiquadro/site/novoAluno', '2014-06-02 09:53:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(61, 'http://dev.wiquadro/usuario/login', '2014-06-02 10:13:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(62, 'http://dev.wiquadro/site/logout', '2014-06-02 10:13:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(63, 'http://dev.wiquadro/usuario/login', '2014-06-02 10:13:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(64, 'http://dev.wiquadro/site/logout', '2014-06-02 10:13:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(65, 'http://dev.wiquadro/usuario/login', '2014-06-02 10:17:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(66, 'http://dev.wiquadro/site/novoAluno', '2014-06-03 08:28:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(67, 'http://dev.wiquadro/usuario/login', '2014-06-03 08:32:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(68, 'http://dev.wiquadro/site/logout', '2014-06-03 08:53:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(69, 'http://dev.wiquadro/usuario/login', '2014-06-03 08:53:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(70, 'http://wiquadro.dev/usuario/login', '2014-06-03 09:38:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(71, 'http://wiquadro.dev/site/logout', '2014-06-03 09:49:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(72, 'http://wiquadro.dev/usuario/login', '2014-06-03 09:49:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(73, 'http://wiquadro.dev/site/logout', '2014-06-03 11:00:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(74, 'http://wiquadro.dev/usuario/login', '2014-06-03 11:00:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(75, 'http://wiquadro.dev/site/logout', '2014-06-03 11:02:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(76, 'http://wiquadro.dev/usuario/login', '2014-06-03 11:02:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(77, 'http://wiquadro.dev/usuario/login', '2014-06-03 11:06:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(78, 'http://wiquadro.dev/usuario/login', '2014-06-03 14:01:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(79, 'http://dev.wiquadro/site/logout', '2014-06-03 14:37:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(80, 'http://dev.wiquadro/usuario/login', '2014-06-03 14:37:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(81, 'http://dev.wiquadro/usuario/login', '2014-06-03 15:08:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(82, 'http://wiquadro.dev/site/logout', '2014-06-03 16:43:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(83, 'http://wiquadro.dev/usuario/login', '2014-06-03 16:43:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(84, 'http://wiquadro.dev/site/logout', '2014-06-03 16:45:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(85, 'http://wiquadro.dev/usuario/login', '2014-06-03 16:45:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(86, 'http://wiquadro.dev/site/logout', '2014-06-03 16:47:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(87, 'http://wiquadro.dev/usuario/login', '2014-06-03 16:47:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(88, 'http://wiquadro.dev/site/logout', '2014-06-03 16:54:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(89, 'http://wiquadro.dev/usuario/login', '2014-06-03 16:54:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(90, 'http://wiquadro.dev/site/logout', '2014-06-03 17:54:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(91, 'http://dev.wiquadro/usuario/login', '2014-06-04 08:39:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(92, 'http://wiquadro.dev/usuario/login', '2014-06-04 09:12:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(93, 'http://dev.wiquadro/site/logout', '2014-06-04 09:46:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(94, 'http://dev.wiquadro/usuario/login', '2014-06-04 09:47:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(95, 'http://dev.wiquadro/site/logout', '2014-06-04 09:47:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(96, 'http://dev.wiquadro/usuario/login', '2014-06-04 09:47:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(97, 'http://localhost:8081/site/logout', '2014-06-04 14:57:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'teste2@teste.com', '202cb962ac59075b964b07152d234b70'),
	(98, 'http://localhost:8081/usuario/login', '2014-06-04 14:58:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(99, 'http://wiquadro.dev/site/logout', '2014-06-04 10:14:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(100, 'http://wiquadro.dev/usuario/login', '2014-06-04 10:14:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(101, 'http://dev.wiquadro/usuario/login', '2014-06-04 11:40:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(102, 'http://wiquadro.dev/site/logout', '2014-06-04 15:56:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(103, 'http://wiquadro.dev/usuario/login', '2014-06-04 15:56:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(104, 'http://wiquadro.dev/site/logout', '2014-06-04 16:02:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(105, 'http://wiquadro.dev/usuario/login', '2014-06-04 16:02:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(106, 'http://wiquadro.dev/site/logout', '2014-06-04 16:02:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(107, 'http://wiquadro.dev/usuario/login', '2014-06-04 16:02:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(108, 'http://192.168.1.158/usuario/login', '2014-06-04 16:07:28', '192.168.1.158', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(109, 'http://dev.wiquadro/usuario/login', '2014-06-05 08:31:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(110, 'http://wiquadro.dev/usuario/login', '2014-06-05 09:34:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(111, 'http://localhost:8081/usuario/login', '2014-06-05 17:01:05', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(112, 'http://wiquadro.dev/usuario/login', '2014-06-05 14:02:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(113, 'http://wiquadro.dev/usuario/login', '2014-06-05 14:07:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(114, 'http://localhost:8081/usuario/login', '2014-06-05 19:14:53', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(115, 'http://wiquadro.dev/site/logout', '2014-06-05 14:44:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(116, 'http://wiquadro.dev/usuario/login', '2014-06-05 14:44:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(117, 'http://wiquadro.dev/site/logout', '2014-06-05 17:20:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(118, 'http://wiquadro.dev/usuario/login', '2014-06-05 17:20:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(119, 'http://wiquadro.dev/site/logout', '2014-06-05 17:24:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(120, 'http://wiquadro.dev/usuario/login', '2014-06-05 17:24:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(121, 'http://dev.wiquadro/usuario/login', '2014-06-06 08:38:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(122, 'http://wiquadro.dev/usuario/login', '2014-06-06 09:10:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(123, 'http://dev.wiquadro/site/logout', '2014-06-06 10:09:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(124, 'http://dev.wiquadro/usuario/login', '2014-06-06 10:09:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(125, 'http://dev.wiquadro/site/logout', '2014-06-06 10:11:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(126, 'http://dev.wiquadro/usuario/login', '2014-06-06 10:11:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(127, 'http://wiquadro.dev/usuario/login', '2014-06-06 10:30:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(128, 'http://wiquadro.dev/usuario/login', '2014-06-06 11:09:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(129, 'http://localhost:8081/usuario/login', '2014-06-06 18:50:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(130, 'http://localhost:8081/usuario/login', '2014-06-06 19:10:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(131, 'http://wiquadro.dev/usuario/login', '2014-06-06 16:57:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(132, 'http://dev.wiquadro/usuario/login', '2014-06-09 08:38:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(133, 'http://wiquadro.dev/usuario/login', '2014-06-09 08:43:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(134, 'http://wiquadro.dev/usuario/login', '2014-06-09 13:34:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(135, 'http://wiquadro.dev/site/logout', '2014-06-09 14:06:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(136, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:06:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(137, 'http://wiquadro.dev/site/logout', '2014-06-09 14:17:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(138, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:17:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(139, 'http://wiquadro.dev/site/logout', '2014-06-09 14:17:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(140, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:17:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(141, 'http://wiquadro.dev/site/logout', '2014-06-09 14:18:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(142, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:28:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(143, 'http://wiquadro.dev/site/logout', '2014-06-09 14:35:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(144, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:35:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(145, 'http://wiquadro.dev/site/logout', '2014-06-09 14:36:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(146, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:36:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(147, 'http://wiquadro.dev/site/logout', '2014-06-09 14:44:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(148, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:48:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(149, 'http://wiquadro.dev/site/logout', '2014-06-09 14:55:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(150, 'http://wiquadro.dev/usuario/login', '2014-06-09 14:55:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(151, 'http://wiquadro.dev/site/logout', '2014-06-09 15:01:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(152, 'http://wiquadro.dev/usuario/login', '2014-06-09 15:02:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(153, 'http://localhost:8081/usuario/login', '2014-06-09 20:03:52', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(154, 'http://wiquadro.dev/site/logout', '2014-06-09 15:16:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(155, 'http://wiquadro.dev/usuario/login', '2014-06-09 15:16:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(156, 'http://wiquadro.dev/site/logout', '2014-06-09 15:17:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(157, 'http://wiquadro.dev/usuario/login', '2014-06-09 15:17:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(158, 'http://wiquadro.dev/site/logout', '2014-06-09 16:04:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(159, 'http://dev.wiquadro/usuario/login', '2014-06-09 16:05:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(160, 'http://wiquadro.dev/usuario/login', '2014-06-09 16:13:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(161, 'http://wiquadro.dev/site/logout', '2014-06-09 16:46:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(162, 'http://wiquadro.dev/usuario/login', '2014-06-09 16:46:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(163, 'http://dev.wiquadro/usuario/login', '2014-06-09 17:22:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(164, 'http://wiquadro.dev/site/logout', '2014-06-09 17:54:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(165, 'http://dev.wiquadro/usuario/login', '2014-06-10 08:56:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(166, 'http://wiquadro.dev/usuario/login', '2014-06-10 09:10:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(167, 'http://wiquadro.dev/usuario/login', '2014-06-10 14:25:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(168, 'http://wiquadro.dev/site/logout', '2014-06-10 15:48:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(169, 'http://wiquadro.dev/usuario/login', '2014-06-10 15:48:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(170, 'http://wiquadro.dev/site/logout', '2014-06-10 15:50:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(171, 'http://wiquadro.dev/usuario/login', '2014-06-10 15:50:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(172, 'http://dev.wiquadro/usuario/login', '2014-06-11 08:19:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(173, 'http://wiquadro.dev/usuario/login', '2014-06-11 08:41:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(174, 'http://wiquadro.dev/site/logout', '2014-06-11 09:52:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(175, 'http://wiquadro.dev/usuario/login', '2014-06-11 09:52:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(176, 'http://wiquadro.dev/usuario/login', '2014-06-11 14:11:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(177, 'http://wiquadro.dev/site/logout', '2014-06-11 15:11:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(178, 'http://wiquadro.dev/usuario/login', '2014-06-11 15:12:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(179, 'http://dev.wiquadro/usuario/login', '2014-06-11 15:12:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(180, 'http://wiquadro.dev/usuario/login', '2014-06-11 15:13:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(181, 'http://wiquadro.dev/site/logout', '2014-06-11 17:53:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(182, 'http://dev.wiquadro/usuario/login', '2014-06-12 08:28:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(183, 'http://wiquadro.dev/usuario/login', '2014-06-12 08:47:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', 'isdlphp'),
	(184, 'http://wiquadro.dev/usuario/login', '2014-06-12 09:00:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(185, 'http://wiquadro.dev/usuario/login', '2014-06-12 13:18:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(186, 'http://dev.wiquadro/usuario/login', '2014-06-13 08:28:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(187, 'http://wiquadro.dev/usuario/login', '2014-06-13 10:48:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(188, 'http://wiquadro.dev/usuario/login', '2014-06-13 11:58:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(189, 'http://dev.wiquadro/site/logout', '2014-06-13 13:14:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(190, 'http://dev.wiquadro/usuario/login', '2014-06-13 13:14:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(191, 'http://wiquadro.dev/usuario/login', '2014-06-13 16:29:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(192, 'http://wiquadro.dev/site/logout', '2014-06-13 16:30:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(193, 'http://wiquadro.dev/usuario/login', '2014-06-13 16:30:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(194, 'http://localhost:8081/usuario/login', '2014-06-16 13:29:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(195, 'http://dev.wiquadro/usuario/login', '2014-06-16 09:12:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(196, 'http://wiquadro.dev/usuario/login', '2014-06-16 11:07:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(197, 'http://dev.wiquadro/site/logout', '2014-06-16 11:11:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(198, 'http://dev.wiquadro/usuario/login', '2014-06-16 11:11:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(199, 'http://wiquadro.dev/site/logout', '2014-06-16 11:31:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(200, 'http://wiquadro.dev/usuario/login', '2014-06-16 11:31:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', '123'),
	(201, 'http://wiquadro.dev/usuario/login', '2014-06-16 11:31:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(202, 'http://wiquadro.dev/site/logout', '2014-06-16 11:32:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(203, 'http://wiquadro.dev/usuario/login', '2014-06-16 11:32:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(204, 'http://wiquadro.dev/site/logout', '2014-06-16 14:23:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(205, 'http://dev.wiquadro/site/logout', '2014-06-16 15:10:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(206, 'http://dev.wiquadro/usuario/login', '2014-06-16 15:10:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(207, 'http://dev.wiquadro/site/logout', '2014-06-16 15:54:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(208, 'http://dev.wiquadro/usuario/login', '2014-06-16 15:57:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(209, 'http://dev.wiquadro/site/logout', '2014-06-16 16:21:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(210, 'http://dev.wiquadro/usuario/login', '2014-06-16 16:21:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(211, 'http://dev.wiquadro/site/logout', '2014-06-16 16:22:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(212, 'http://dev.wiquadro/usuario/login', '2014-06-16 16:22:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(213, 'http://dev.wiquadro/site/logout', '2014-06-16 16:22:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(214, 'http://wiquadro.com.br/usuario/login', '2014-06-16 16:28:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(215, 'http://wiquadro.com.br/site/logout', '2014-06-16 16:29:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(216, 'http://localhost:8081/usuario/login', '2014-06-17 13:39:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(217, 'http://wiquadro.dev/usuario/login', '2014-06-17 08:49:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(218, 'http://wiquadro.dev/site/logout', '2014-06-17 08:58:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(219, 'http://wiquadro.dev/usuario/login', '2014-06-17 09:02:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(220, 'http://dev.wiquadro/usuario/login', '2014-06-17 09:18:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(221, 'http://dev.wiquadro/usuario/login', '2014-06-17 10:49:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(222, 'http://localhost:8081/site/logout', '2014-06-17 15:55:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(223, 'http://localhost:8081/usuario/login', '2014-06-17 15:55:51', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(224, 'http://localhost:8081/site/logout', '2014-06-17 15:56:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(225, 'http://localhost:8081/usuario/login', '2014-06-17 15:57:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(226, 'http://localhost:8081/site/logout', '2014-06-17 15:58:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(227, 'http://localhost:8081/usuario/login', '2014-06-17 15:58:21', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(228, 'http://localhost:8081/usuario/login', '2014-06-17 15:58:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(229, 'http://localhost:8081/site/logout', '2014-06-17 16:09:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(230, 'http://localhost:8081/usuario/login', '2014-06-17 16:16:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(231, 'http://localhost:8081/site/logout', '2014-06-17 16:20:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(232, 'http://localhost:8081/usuario/login', '2014-06-17 16:20:39', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(233, 'http://localhost:8081/site/logout', '2014-06-17 16:20:45', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(234, 'http://localhost:8081/usuario/login', '2014-06-17 16:20:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(235, 'http://localhost:8081/site/logout', '2014-06-17 16:29:04', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(236, 'http://localhost:8081/usuario/login', '2014-06-17 16:29:09', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(237, 'http://wiquadro.dev/usuario/login', '2014-06-17 12:20:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(238, 'http://wiquadro.dev/site/logout', '2014-06-17 12:46:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(239, 'http://wiquadro.dev/usuario/login', '2014-06-17 12:46:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(240, 'http://wiquadro.dev/site/logout', '2014-06-17 12:48:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(241, 'http://wiquadro.dev/usuario/login', '2014-06-17 12:51:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(242, 'http://wiquadro.dev/site/logout', '2014-06-17 13:02:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(243, 'http://wiquadro.dev/usuario/login', '2014-06-17 13:09:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(244, 'http://wiquadro.dev/usuario/login', '2014-06-17 13:36:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(245, 'http://dev.wiquadro/usuario/login', '2014-06-17 13:36:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(246, 'http://localhost:8081/usuario/login', '2014-06-17 18:39:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'sergio.kalmik@gmail.com', 'felipe123456'),
	(247, 'http://localhost:8081/usuario/login', '2014-06-17 18:39:54', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(248, 'http://dev.wiquadro/site/logout', '2014-06-17 13:54:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(249, 'http://dev.wiquadro/usuario/login', '2014-06-17 13:54:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(250, 'http://dev.wiquadro/site/logout', '2014-06-18 08:46:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(251, 'http://dev.wiquadro/usuario/login', '2014-06-18 08:46:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(252, 'http://wiquadro.dev/usuario/login', '2014-06-18 09:16:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(253, 'http://localhost:8081/usuario/login', '2014-06-18 14:35:25', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(254, 'http://localhost:8081/site/logout', '2014-06-18 14:35:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(255, 'http://localhost:8081/usuario/login', '2014-06-18 14:36:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(256, 'http://localhost:8081/site/logout', '2014-06-18 14:36:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(257, 'http://localhost:8081/usuario/login', '2014-06-18 14:36:22', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(258, 'http://localhost:8081/site/logout', '2014-06-18 14:44:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(259, 'http://localhost:8081/usuario/login', '2014-06-18 14:44:46', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'sergio.kalmik@gmail.com', 'felipe123456'),
	(260, 'http://localhost:8081/usuario/login', '2014-06-18 14:45:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(261, 'http://localhost:8081/site/logout', '2014-06-18 14:46:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(262, 'http://localhost:8081/usuario/login', '2014-06-18 14:46:48', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(263, 'http://localhost:8081/site/logout', '2014-06-18 14:46:58', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(264, 'http://localhost:8081/usuario/login', '2014-06-18 14:47:23', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(265, 'http://localhost:8081/site/logout', '2014-06-18 14:48:16', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(266, 'http://localhost:8081/usuario/login', '2014-06-18 14:59:37', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(267, 'http://localhost:8081/site/logout', '2014-06-18 15:14:38', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(268, 'http://localhost:8081/usuario/login', '2014-06-18 15:14:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'teste3@teste.com', '123456'),
	(269, 'http://localhost:8081/usuario/login', '2014-06-18 15:14:50', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(270, 'http://localhost:8081/usuario/login', '2014-06-18 15:15:13', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'teste@teste.com', '202cb962ac59075b964b07152d234b70'),
	(271, 'http://dev.wiquadro/usuario/login', '2014-06-18 10:19:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(272, 'http://localhost:8081/site/logout', '2014-06-18 15:21:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'teste@teste.com', '202cb962ac59075b964b07152d234b70'),
	(273, 'http://localhost:8081/usuario/login', '2014-06-18 15:21:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(274, 'http://localhost:8081/site/logout', '2014-06-18 15:22:24', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(275, 'http://localhost:8081/usuario/login', '2014-06-18 15:22:29', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'teste@teste.com', '123456'),
	(276, 'http://localhost:8081/usuario/login', '2014-06-18 15:22:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'teste@teste.com', '23'),
	(277, 'http://localhost:8081/usuario/login', '2014-06-18 15:22:41', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'teste@teste.com', '123456'),
	(278, 'http://localhost:8081/usuario/login', '2014-06-18 15:22:47', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(279, 'http://localhost:8081/usuario/login', '2014-06-18 15:27:40', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(280, 'http://localhost:8081/site/logout', '2014-06-18 15:28:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(281, 'http://localhost:8081/usuario/login', '2014-06-18 15:28:10', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(282, 'http://localhost:8081/site/logout', '2014-06-18 15:34:44', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(283, 'http://localhost:8081/usuario/login', '2014-06-18 15:34:49', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(284, 'http://localhost:8081/site/logout', '2014-06-18 15:34:59', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(285, 'http://localhost:8081/usuario/login', '2014-06-18 15:35:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(286, 'http://dev.wiquadro/site/logout', '2014-06-18 10:42:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(287, 'http://dev.wiquadro/usuario/login', '2014-06-18 10:43:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'davidmkt@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(288, 'http://dev.wiquadro/usuario/login', '2014-06-18 10:43:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(289, 'http://localhost:8081/site/logout', '2014-06-18 15:47:14', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(290, 'http://localhost:8081/usuario/login', '2014-06-18 15:47:18', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(291, 'http://dev.wiquadro/site/logout', '2014-06-18 10:48:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(292, 'http://dev.wiquadro/usuario/login', '2014-06-18 10:48:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(293, 'http://wiquadro.dev/usuario/login', '2014-06-18 11:06:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(294, 'http://localhost:8081/site/logout', '2014-06-18 16:16:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(295, 'http://localhost:8081/usuario/login', '2014-06-18 16:16:23', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(296, 'http://wiquadro.dev/usuario/login', '2014-06-18 11:33:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(297, 'http://dev.wiquadro/site/logout', '2014-06-18 11:38:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(298, 'http://dev.wiquadro/usuario/login', '2014-06-18 11:38:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(299, 'http://wiquadro.dev/site/logout', '2014-06-18 11:54:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(300, 'http://wiquadro.dev/usuario/login', '2014-06-18 14:25:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(301, 'http://wiquadro.dev/usuario/login', '2014-06-18 15:31:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(302, 'http://wiquadro.dev/usuario/login', '2014-06-18 15:31:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(303, 'http://wiquadro.dev/usuario/login', '2014-06-18 16:20:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(304, 'http://wiquadro.dev/site/logout', '2014-06-18 16:26:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(305, 'http://wiquadro.dev/usuario/login', '2014-06-18 16:26:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(306, 'http://wiquadro.dev/site/logout', '2014-06-18 16:33:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(307, 'http://dev.wiquadro/usuario/login', '2014-06-18 16:55:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(308, 'http://wiquadro.dev/usuario/login', '2014-06-18 17:00:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(309, 'http://dev.wiquadro/usuario/login', '2014-06-18 17:11:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(310, 'http://localhost:8081/usuario/login', '2014-06-20 13:25:06', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(311, 'http://dev.wiquadro/usuario/login', '2014-06-20 08:49:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(312, 'http://localhost:8081/site/logout', '2014-06-20 14:20:30', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(313, 'http://localhost:8081/usuario/login', '2014-06-20 14:20:35', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(314, 'http://localhost:8081/site/logout', '2014-06-20 14:23:03', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(315, 'http://localhost:8081/usuario/login', '2014-06-20 14:23:11', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'wiquadro@gmail.com', 'felipe123456'),
	(316, 'http://localhost:8081/usuario/login', '2014-06-20 14:23:17', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(317, 'http://localhost:8081/site/logout', '2014-06-20 14:27:12', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(318, 'http://localhost:8081/usuario/login', '2014-06-20 14:27:19', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(319, 'http://dev.wiquadro/usuario/login', '2014-06-20 09:56:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(320, 'http://dev.wiquadro/site/logout', '2014-06-20 10:57:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(321, 'http://dev.wiquadro/usuario/login', '2014-06-20 10:58:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'contato@henrimichel.com.br', '123456'),
	(322, 'http://dev.wiquadro/usuario/login', '2014-06-20 10:59:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'wiquadro@gmail.com', '1vFPjW6v'),
	(323, 'http://dev.wiquadro/usuario/login', '2014-06-20 10:59:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'wiquadro@gmail.com', '1vFPjW6v'),
	(324, 'http://dev.wiquadro/usuario/login', '2014-06-20 11:10:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(325, 'http://wiquadro.dev/usuario/login', '2014-06-20 11:11:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(326, 'http://localhost:8081/usuario/login', '2014-06-20 17:10:33', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'teste3@teste.com', '202cb962ac59075b964b07152d234b70'),
	(327, 'http://wiquadro.dev/site/logout', '2014-06-20 12:56:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(328, 'http://wiquadro.dev/usuario/login', '2014-06-20 12:56:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(329, 'http://wiquadro.dev/site/logout', '2014-06-20 12:57:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(330, 'http://wiquadro.dev/usuario/login', '2014-06-20 13:03:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(331, 'http://wiquadro.dev/site/logout', '2014-06-20 13:08:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(332, 'http://wiquadro.dev/usuario/login', '2014-06-20 13:08:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(333, 'http://wiquadro.dev/site/logout', '2014-06-20 14:16:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(334, 'http://wiquadro.dev/usuario/login', '2014-06-20 14:16:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(335, 'http://dev.wiquadro/usuario/login', '2014-06-20 15:39:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(336, 'http://wiquadro.dev/usuario/login', '2014-06-20 17:39:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(337, 'http://wiquadro.dev/site/logout', '2014-06-20 17:43:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(338, 'http://wiquadro.dev/usuario/login', '2014-06-20 17:47:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(339, 'http://wiquadro.dev/site/logout', '2014-06-20 17:47:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(340, 'http://wiquadro.dev/usuario/login', '2014-06-23 09:05:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(341, 'http://wiquadro.dev/site/logout', '2014-06-23 10:15:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(342, 'http://wiquadro.dev/usuario/login', '2014-06-23 10:15:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'aluno@teste.com', '1234586'),
	(343, 'http://wiquadro.dev/usuario/login', '2014-06-23 10:15:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(344, 'http://dev.wiquadro/site/logout', '2014-06-23 10:56:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(345, 'http://dev.wiquadro/usuario/login', '2014-06-23 10:57:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(346, 'http://dev.wiquadro/usuario/login', '2014-06-23 10:58:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(347, 'http://dev.wiquadro/site/logout', '2014-06-23 10:58:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(348, 'http://dev.wiquadro/usuario/login', '2014-06-23 10:58:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(349, 'http://dev.wiquadro/site/logout', '2014-06-23 10:59:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(350, 'http://dev.wiquadro/usuario/login', '2014-06-23 10:59:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'wilivro@gmail.com', '123456'),
	(351, 'http://dev.wiquadro/usuario/login', '2014-06-23 10:59:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(352, 'http://wiquadro.dev/usuario/login', '2014-06-23 11:54:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(353, 'http://dev.wiquadro/site/logout', '2014-06-23 12:45:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(354, 'http://dev.wiquadro/usuario/login', '2014-06-23 12:46:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(355, 'http://wiquadro.dev/usuario/login', '2014-06-23 13:53:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(356, 'http://wiquadro.dev/usuario/login', '2014-06-24 08:08:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(357, 'http://wiquadro.dev/site/logout', '2014-06-24 09:11:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(358, 'http://wiquadro.dev/usuario/login', '2014-06-24 09:11:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(359, 'http://wiquadro.dev/site/logout', '2014-06-24 10:18:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(360, 'http://wiquadro.dev/usuario/login', '2014-06-24 10:18:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(361, 'http://wiquadro.dev/site/logout', '2014-06-24 10:20:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(362, 'http://wiquadro.dev/usuario/login', '2014-06-24 10:20:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(363, 'http://wiquadro.dev/site/logout', '2014-06-24 10:22:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(364, 'http://wiquadro.dev/usuario/login', '2014-06-24 10:22:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(365, 'http://dev.wiquadro/site/logout', '2014-06-24 12:12:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(366, 'http://wiquadro.dev/usuario/login', '2014-06-24 14:14:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(367, 'http://dev.wiquadro/usuario/login', '2014-06-24 15:05:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(368, 'http://wiquadro.dev/site/logout', '2014-06-24 15:52:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(369, 'http://dev.wiquadro/site/logout', '2014-06-24 16:50:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(370, 'http://dev.wiquadro/usuario/login', '2014-06-24 16:50:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(371, 'http://dev.wiquadro/site/logout', '2014-06-24 16:51:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'mauricio@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(372, 'http://dev.wiquadro/usuario/login', '2014-06-24 16:57:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(373, 'http://dev.wiquadro/site/logout', '2014-06-24 17:10:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(374, 'http://dev.wiquadro/usuario/login', '2014-06-24 17:10:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(375, 'http://wiquadro.dev/usuario/login', '2014-06-24 17:34:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(376, 'http://wiquadro.dev/site/logout', '2014-06-24 17:34:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(377, 'http://wiquadro.dev/usuario/login', '2014-06-24 17:34:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(378, 'http://wiquadro.dev/site/logout', '2014-06-24 17:34:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(379, 'http://wiquadro.dev/usuario/login', '2014-06-24 17:34:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(380, 'http://wiquadro.dev/site/logout', '2014-06-24 17:35:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(381, 'http://wiquadro.dev/usuario/login', '2014-06-24 17:35:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(382, 'http://wiquadro.dev/site/logout', '2014-06-24 17:42:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(383, 'http://wiquadro.dev/usuario/login', '2014-06-24 17:42:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(384, 'http://dev.wiquadro/usuario/login', '2014-06-25 09:01:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(385, 'http://wiquadro.dev/usuario/login', '2014-06-25 14:03:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(386, 'http://wiquadro.dev/site/logout', '2014-06-25 14:08:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(387, 'http://wiquadro.dev/usuario/login', '2014-06-25 14:08:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(388, 'http://wiquadro.dev/site/logout', '2014-06-25 16:03:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(389, 'http://wiquadro.dev/usuario/login', '2014-06-25 16:44:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(390, 'http://wiquadro.dev/usuario/login', '2014-06-26 08:50:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(391, 'http://dev.wiquadro/usuario/login', '2014-06-26 09:12:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(392, 'http://dev.wiquadro/site/logout', '2014-06-26 12:55:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(393, 'http://dev.wiquadro/usuario/login', '2014-06-26 12:55:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(394, 'http://dev.wiquadro/site/logout', '2014-06-26 12:58:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(395, 'http://dev.wiquadro/usuario/login', '2014-06-26 12:59:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(396, 'http://wiquadro.dev/usuario/login', '2014-06-26 13:04:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(397, 'http://wiquadro.dev/site/logout', '2014-06-26 16:23:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(398, 'http://wiquadro.dev/usuario/login', '2014-06-26 16:38:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(399, 'http://wiquadro.dev/site/logout', '2014-06-26 17:51:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(400, 'http://wiquadro.dev/usuario/login', '2014-06-27 08:17:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(401, 'http://dev.wiquadro/usuario/login', '2014-06-27 08:57:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(402, 'http://dev.wiquadro/usuario/login', '2014-06-27 09:25:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(403, 'http://dev.wiquadro/site/logout', '2014-06-27 11:35:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(404, 'http://dev.wiquadro/usuario/login', '2014-06-27 11:35:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(405, 'http://dev.wiquadro/site/logout', '2014-06-27 11:36:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(406, 'http://dev.wiquadro/usuario/login', '2014-06-27 11:36:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(407, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:21:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(408, 'http://wiquadro.dev/site/logout', '2014-06-27 14:29:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(409, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:29:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(410, 'http://wiquadro.dev/site/logout', '2014-06-27 14:29:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(411, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:29:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(412, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:30:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(413, 'http://wiquadro.dev/site/logout', '2014-06-27 14:40:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(414, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:40:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(415, 'http://wiquadro.dev/usuario/login', '2014-06-27 14:55:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(416, 'http://wiquadro.dev/site/logout', '2014-06-27 15:13:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(417, 'http://wiquadro.dev/usuario/login', '2014-06-27 15:13:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(418, 'http://wiquadro.dev/site/logout', '2014-06-27 15:20:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(419, 'http://wiquadro.dev/usuario/login', '2014-06-27 15:20:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(420, 'http://wiquadro.dev/site/logout', '2014-06-27 15:20:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(421, 'http://wiquadro.dev/usuario/login', '2014-06-27 15:29:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(422, 'http://dev.wiquadro/site/logout', '2014-06-27 17:35:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(423, 'http://dev.wiquadro/usuario/login', '2014-06-27 17:36:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(424, 'http://dev.wiquadro/site/logout', '2014-06-27 17:36:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(425, 'http://wiquadro.dev/usuario/login', '2014-06-30 08:15:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(426, 'http://dev.wiquadro/usuario/login', '2014-06-30 08:38:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(427, 'http://dev.wiquadro/site/logout', '2014-06-30 08:39:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(428, 'http://dev.wiquadro/usuario/login', '2014-06-30 08:39:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(429, 'http://dev.wiquadro/usuario/login', '2014-06-30 09:57:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(430, 'http://wiquadro.dev/usuario/login', '2014-07-01 08:58:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(431, 'http://dev.wiquadro/usuario/login', '2014-07-01 09:39:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(432, 'http://wiquadro.dev/usuario/login', '2014-07-01 14:19:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(433, 'http://dev.wiquadro/site/logout', '2014-07-01 15:40:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(434, 'http://dev.wiquadro/usuario/login', '2014-07-01 15:40:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(435, 'http://dev.wiquadro/site/logout', '2014-07-01 16:42:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(436, 'http://dev.wiquadro/usuario/login', '2014-07-01 16:43:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(437, 'http://dev.wiquadro/site/logout', '2014-07-01 16:51:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(438, 'http://dev.wiquadro/usuario/login', '2014-07-01 16:51:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(439, 'http://dev.wiquadro/usuario/login', '2014-07-02 09:24:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(440, 'http://dev.wiquadro/site/logout', '2014-07-02 09:34:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(441, 'http://dev.wiquadro/usuario/login', '2014-07-02 09:34:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(442, 'http://wiquadro.dev/usuario/login', '2014-07-02 10:09:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(443, 'http://dev.wiquadro/site/logout', '2014-07-02 11:37:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(444, 'http://dev.wiquadro/usuario/login', '2014-07-02 11:37:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(445, 'http://wiquadro.dev/usuario/login', '2014-07-03 08:22:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(446, 'http://dev.wiquadro/usuario/login', '2014-07-03 08:34:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(447, 'http://wiquadro.dev/site/logout', '2014-07-03 15:44:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(448, 'http://wiquadro.dev/usuario/login', '2014-07-03 15:44:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(449, 'http://dev.wiquadro/usuario/login', '2014-07-04 09:13:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'dea27022007'),
	(450, 'http://dev.wiquadro/usuario/login', '2014-07-04 09:14:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(451, 'http://dev.wiquadro/usuario/login', '2014-07-04 10:01:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(452, 'http://wiquadro.dev/usuario/login', '2014-07-07 15:20:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(453, 'http://wiquadro.dev/usuario/login', '2014-07-07 15:30:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(454, 'http://wiquadro.dev/site/logout', '2014-07-07 15:48:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(455, 'http://wiquadro.dev/site/logout', '2014-07-07 17:25:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(456, 'http://wiquadro.dev/usuario/login', '2014-07-08 07:19:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'emmerson@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(457, 'http://wiquadro.dev/site/logout', '2014-07-08 07:19:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'emmerson@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(458, 'http://wiquadro.dev/usuario/login', '2014-07-08 07:27:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'ewerton@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(459, 'http://wiquadro.dev/site/logout', '2014-07-08 07:27:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'ewerton@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(460, 'http://wiquadro.dev/usuario/login', '2014-07-08 07:30:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'emmersonsiqueira@hotmail.com', '123456'),
	(461, 'http://wiquadro.dev/aluno/confirmMail/?uniqId=%7b2E791B0F-17C6-CB3D-A3E5-01412AFB6863%7d', '2014-07-08 07:30:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'emmersonsiqueira@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(462, 'http://wiquadro.dev/site/logout', '2014-07-08 07:33:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'emmersonsiqueira@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(463, 'http://wiquadro.dev/usuario/login', '2014-07-08 07:33:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'joao@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(464, 'http://wiquadro.dev/site/logout', '2014-07-08 07:33:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'joao@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(465, 'http://wiquadro.dev/usuario/login', '2014-07-08 08:52:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(466, 'http://wiquadro.dev/usuario/login', '2014-07-08 09:29:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(467, 'http://dev.wiquadro/usuario/login', '2014-07-08 09:42:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(468, 'http://wiquadro.dev/site/logout', '2014-07-08 09:46:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(469, 'http://wiquadro.dev/usuario/login', '2014-07-08 09:53:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(470, 'http://dev.wiquadro/usuario/login', '2014-07-08 11:22:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(471, 'http://dev.wiquadro/usuario/login', '2014-07-09 08:27:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(472, 'http://wiquadro.dev/usuario/login', '2014-07-09 08:54:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(473, 'http://wiquadro.dev/site/logout', '2014-07-09 09:33:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(474, 'http://dev.wiquadro/usuario/login', '2014-07-09 09:40:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'contato@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(475, 'http://dev.wiquadro/site/logout', '2014-07-09 09:40:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'contato@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(476, 'http://dev.wiquadro/usuario/login', '2014-07-09 09:40:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(477, 'http://dev.wiquadro/site/logout', '2014-07-09 10:42:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(478, 'http://dev.wiquadro/usuario/login', '2014-07-09 10:42:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(479, 'http://wiquadro.dev/usuario/login', '2014-07-10 10:01:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(480, 'http://wiquadro.dev/site/logout', '2014-07-10 10:01:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(481, 'http://dev.wi2/usuario/login', '2014-07-10 10:30:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(482, 'http://dev.wi2/site/logout', '2014-07-10 10:31:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(483, 'http://dev.wiquadro/site/novoAluno', '2014-07-10 11:11:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(484, 'http://dev.wiquadro/usuario/login', '2014-07-10 12:33:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'manel@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(485, 'http://dev.wiquadro/site/logout', '2014-07-10 12:33:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'manel@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(486, 'http://dev.wiquadro/aluno/confirmMail/?uniqId={612EF507-2A1A-7EC7-1007-7A4E24211814}', '2014-07-10 12:42:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'dayane@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(487, 'http://dev.wiquadro/site/novoAluno', '2014-07-10 12:46:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'dayane@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(488, 'http://dev.wiquadro/aluno/confirmMail/?uniqId={EE7D52DE-FE82-401F-B315-21652BA8941B}', '2014-07-10 12:47:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'heriberto@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(489, 'http://dev.wiquadro/site/logout', '2014-07-10 12:48:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'heriberto@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(490, 'http://dev.wiquadro/usuario/login', '2014-07-10 12:55:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(491, 'http://dev.wiquadro/site/logout', '2014-07-10 12:55:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(492, 'http://dev.wiquadro/usuario/login', '2014-07-10 12:57:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'fortaleza@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(493, 'http://dev.wiquadro/site/logout', '2014-07-10 12:57:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'fortaleza@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(494, 'http://wiquadro.dev/usuario/login', '2014-07-10 13:09:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(495, 'http://wiquadro.dev/usuario/login', '2014-07-10 13:31:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(496, 'http://wiquadro.dev/site/logout', '2014-07-10 13:32:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(497, 'http://wiquadro.dev/usuario/login', '2014-07-10 13:32:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(498, 'http://dev.wiquadro/usuario/login', '2014-07-10 15:00:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(499, 'http://dev.wiquadro/site/logout', '2014-07-10 15:00:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(500, 'http://dev.wiquadro/usuario/login', '2014-07-10 15:00:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(501, 'http://dev.wiquadro/usuario/login', '2014-07-10 15:01:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(502, 'http://wiquadro.dev/site/logout', '2014-07-10 15:54:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(503, 'http://wiquadro.dev/usuario/login', '2014-07-10 15:54:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'aluno@teste.com', '123456,'),
	(504, 'http://wiquadro.dev/usuario/login', '2014-07-10 15:54:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(505, 'http://wiquadro.dev/site/logout', '2014-07-10 15:54:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(506, 'http://wiquadro.dev/usuario/login', '2014-07-10 15:54:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(507, 'http://wiquadro.dev/site/logout', '2014-07-10 15:56:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(508, 'http://wiquadro.dev/usuario/login', '2014-07-10 15:56:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(509, 'http://wiquadro.dev/site/logout', '2014-07-10 16:00:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(510, 'http://wiquadro.dev/usuario/login', '2014-07-10 16:01:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(511, 'http://dev.wiquadro/site/logout', '2014-07-10 16:13:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(512, 'http://dev.wiquadro/usuario/login', '2014-07-10 16:14:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(513, 'http://dev.wiquadro/site/logout', '2014-07-10 16:14:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(514, 'http://dev.wiquadro/usuario/login', '2014-07-10 16:14:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(515, 'http://dev.wiquadro/usuario/login', '2014-07-11 08:25:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(516, 'http://dev.wiquadro/site/logout', '2014-07-11 08:26:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(517, 'http://dev.wiquadro/usuario/login', '2014-07-11 08:26:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(518, 'http://dev.wiquadro/site/logout', '2014-07-11 08:26:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(519, 'http://dev.wiquadro/usuario/login', '2014-07-11 08:26:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(520, 'http://dev.wiquadro/usuario/login', '2014-07-11 08:28:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(521, 'http://dev.wiquadro/usuario/login', '2014-07-11 08:28:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(522, 'http://dev.wiquadro/site/logout', '2014-07-11 11:36:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(523, 'http://dev.wiquadro/usuario/login', '2014-07-11 11:36:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(524, 'http://dev.wiquadro/usuario/login', '2014-07-11 11:56:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(525, 'http://dev.wiquadro/usuario/login', '2014-07-11 11:56:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(526, 'http://dev.wiquadro/site/logout', '2014-07-11 11:56:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(527, 'http://wiquadro.dev/usuario/login', '2014-07-14 08:47:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(528, 'http://dev.wiquadro/usuario/login', '2014-07-14 08:55:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(529, 'http://dev.wiquadro/usuario/login', '2014-07-14 08:55:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(530, 'http://dev.wiquadro/usuario/login', '2014-07-14 10:03:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(531, 'http://dev.wiquadro/usuario/login', '2014-07-14 10:22:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(532, 'http://wiquadro.dev/site/logout', '2014-07-14 10:49:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(533, 'http://wiquadro.dev/usuario/login', '2014-07-14 10:50:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(534, 'http://dev.wiquadro/usuario/login', '2014-07-14 15:37:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(535, 'http://dev.wiquadro/usuario/login', '2014-07-14 15:41:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(536, 'http://dev.wiquadro/usuario/login', '2014-07-14 16:18:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(537, 'http://wiquadro.dev/usuario/login', '2014-07-14 16:44:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(538, 'http://wiquadro.dev/site/logout', '2014-07-14 16:46:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(539, 'http://wiquadro.dev/usuario/login', '2014-07-14 16:46:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(540, 'http://wiquadro.dev/usuario/login', '2014-07-15 08:33:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(541, 'http://dev.wiquadro/usuario/login', '2014-07-15 08:37:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(542, 'http://wiquadro.dev/site/logout', '2014-07-15 09:34:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(543, 'http://wiquadro.dev/usuario/login', '2014-07-15 10:18:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(544, 'http://dev.wiquadro/site/logout', '2014-07-15 10:44:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(545, 'http://dev.wiquadro/usuario/login', '2014-07-15 10:52:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123fey'),
	(546, 'http://wiquadro.dev/site/logout', '2014-07-15 11:55:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(547, 'http://wiquadro.dev/usuario/login', '2014-07-15 11:55:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(548, 'http://wiquadro.dev/usuario/login', '2014-07-15 14:26:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(549, 'http://wiquadro.dev/site/logout', '2014-07-15 14:27:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(550, 'http://wiquadro.dev/usuario/login', '2014-07-15 14:27:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(551, 'http://dev.wiquadro/usuario/login', '2014-07-15 17:14:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(552, 'http://dev.wiquadro/usuario/login', '2014-07-15 17:15:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(553, 'http://wiquadro.dev/usuario/login', '2014-07-16 08:55:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(554, 'http://dev.wiquadro/usuario/login', '2014-07-16 09:05:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(555, 'http://dev.wiquadro/site/logout', '2014-07-16 09:08:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(556, 'http://dev.wiquadro/usuario/login', '2014-07-16 09:08:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(557, 'http://wiquadro.dev/usuario/login', '2014-07-16 09:29:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(558, 'http://wiquadro.dev/usuario/login', '2014-07-16 13:49:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(559, 'http://dev.wiquadro/site/logout', '2014-07-16 15:09:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(560, 'http://dev.wiquadro/usuario/login', '2014-07-16 15:19:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(561, 'http://dev.wiquadro/site/logout', '2014-07-16 16:51:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(562, 'http://dev.wiquadro/usuario/login', '2014-07-16 16:51:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(563, 'http://dev.wiquadro/usuario/login', '2014-07-16 16:52:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(564, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:05:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(565, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:06:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(566, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:13:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(567, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:13:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'sdfhgh@dfg.com', '123'),
	(568, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:18:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(569, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:19:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(570, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:19:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(571, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:19:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(572, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:21:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(573, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:21:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(574, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:22:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', 'sd'),
	(575, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:39:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(576, 'http://dev.wiquadro/site/logout', '2014-07-16 17:40:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(577, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:40:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(578, 'http://dev.wiquadro/site/logout', '2014-07-16 17:40:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(579, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:40:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(580, 'http://dev.wiquadro/site/logout', '2014-07-16 17:40:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(581, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:44:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(582, 'http://dev.wiquadro/site/logout', '2014-07-16 17:45:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(583, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:45:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(584, 'http://dev.wiquadro/site/logout', '2014-07-16 17:50:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(585, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:54:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(586, 'http://dev.wiquadro/site/logout', '2014-07-16 17:54:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(587, 'http://dev.wiquadro/usuario/login', '2014-07-16 17:55:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(588, 'http://dev.wiquadro/site/logout', '2014-07-17 08:35:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(589, 'http://dev.wiquadro/usuario/login', '2014-07-17 08:35:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(590, 'http://dev.wiquadro/site/logout', '2014-07-17 08:35:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(591, 'http://dev.wiquadro/usuario/login', '2014-07-17 08:36:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(592, 'http://dev.wiquadro/site/logout', '2014-07-17 08:40:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(593, 'http://dev.wiquadro/usuario/login', '2014-07-17 08:40:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(594, 'http://dev.wiquadro/usuario/login', '2014-07-17 08:41:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(595, 'http://dev.wiquadro/usuario/login', '2014-07-17 08:41:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(596, 'http://wiquadro.dev/usuario/login', '2014-07-17 08:54:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(597, 'http://dev.wiquadro/site/logout', '2014-07-17 09:15:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(598, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:15:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(599, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:44:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(600, 'http://dev.wiquadro/site/logout', '2014-07-17 09:44:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(601, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:45:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(602, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:46:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(603, 'http://dev.wiquadro/site/logout', '2014-07-17 09:48:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(604, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:48:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(605, 'http://dev.wiquadro/site/logout', '2014-07-17 09:49:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(606, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:50:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(607, 'http://dev.wiquadro/site/logout', '2014-07-17 09:55:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(608, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:55:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(609, 'http://dev.wiquadro/site/logout', '2014-07-17 09:56:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(610, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:56:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(611, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:56:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(612, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:57:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(613, 'http://dev.wiquadro/site/logout', '2014-07-17 09:58:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(614, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:58:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(615, 'http://dev.wiquadro/site/logout', '2014-07-17 09:58:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(616, 'http://dev.wiquadro/usuario/login', '2014-07-17 09:58:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(617, 'http://dev.wiquadro/site/logout', '2014-07-17 09:58:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(618, 'http://dev.wiquadro/usuario/login', '2014-07-17 10:57:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(619, 'http://dev.wiquadro/usuario/login', '2014-07-17 11:13:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(620, 'http://wiquadro.dev/usuario/login', '2014-07-17 11:26:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(621, 'http://wiquadro.dev/usuario/login', '2014-07-17 13:57:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(622, 'http://wiquadro.dev/site/logout', '2014-07-17 14:11:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(623, 'http://wiquadro.dev/usuario/login', '2014-07-17 14:11:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(624, 'http://dev.wiquadro/site/logout', '2014-07-17 16:33:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(625, 'http://wiquadro.dev/usuario/login', '2014-07-17 17:11:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(626, 'http://wiquadro.dev/usuario/login', '2014-07-17 17:29:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'wiquadro@gmail.com', '123'),
	(627, 'http://wiquadro.dev/usuario/login', '2014-07-17 17:40:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(628, 'http://wiquadro.dev/site/logout', '2014-07-17 17:42:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(629, 'http://wiquadro.dev/usuario/login', '2014-07-17 17:42:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(630, 'http://wiquadro.dev/usuario/login', '2014-07-18 09:01:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(631, 'http://dev.wiquadro/usuario/login', '2014-07-18 10:27:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(632, 'http://dev.wiquadro/site/logout', '2014-07-18 11:34:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(633, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:34:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(634, 'http://dev.wiquadro/site/logout', '2014-07-18 11:35:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(635, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:37:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(636, 'http://dev.wiquadro/site/logout', '2014-07-18 11:44:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(637, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:44:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@fonosystem.com', '123456'),
	(638, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:44:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Tentativa de Login', 'david@fonosystem.com', '123'),
	(639, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:45:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@fonosystem.com', '202cb962ac59075b964b07152d234b70'),
	(640, 'http://dev.wiquadro/usuario/login', '2014-07-18 11:47:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(641, 'http://dev.wiquadro/site/logout', '2014-07-18 14:19:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@fonosystem.com', '202cb962ac59075b964b07152d234b70'),
	(642, 'http://dev.wiquadro/usuario/login', '2014-07-18 14:19:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(643, 'http://dev.wiquadro/site/logout', '2014-07-18 14:52:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(644, 'http://dev.wiquadro/usuario/login', '2014-07-18 14:52:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@fonosystem.com', '202cb962ac59075b964b07152d234b70'),
	(645, 'http://dev.wiquadro/site/logout', '2014-07-18 17:27:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(646, 'http://dev.wiquadro/usuario/login', '2014-07-21 09:34:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(647, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:22:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(648, 'http://wiquadro.dev/site/logout', '2014-07-21 10:22:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(649, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:22:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(650, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:23:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(651, 'http://wiquadro.dev/site/logout', '2014-07-21 10:24:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(652, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:28:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'teste@aluno1954.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(653, 'http://wiquadro.dev/site/logout', '2014-07-21 10:28:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'teste@aluno1954.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(654, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:28:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(655, 'http://wiquadro.dev/site/logout', '2014-07-21 10:31:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(656, 'http://wiquadro.dev/usuario/login', '2014-07-21 10:31:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'teste@aluno1954.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(657, 'http://wiquadro.dev/usuario/login', '2014-07-21 15:15:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(658, 'http://wiquadro.dev/site/logout', '2014-07-21 15:28:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(659, 'http://wiquadro.dev/usuario/login', '2014-07-21 15:28:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'contato@henrimichel.com.br', '123456'),
	(660, 'http://wiquadro.dev/usuario/login', '2014-07-21 15:29:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Tentativa de Login', 'contato@henrimichel.com.br', '123456'),
	(661, 'http://wiquadro.dev/usuario/login', '2014-07-21 15:42:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(662, 'http://dev.wiquadro/usuario/login', '2014-07-21 16:04:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(663, 'http://dev.wiquadro/usuario/login', '2014-07-22 08:33:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(664, 'http://wiquadro.dev/usuario/login', '2014-07-22 10:51:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(665, 'http://wiquadro.dev/site/logout', '2014-07-22 14:51:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(666, 'http://wiquadro.dev/usuario/login', '2014-07-22 16:16:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'emmerson@wiquadro.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(667, 'http://wiquadro.dev/usuario/login', '2014-07-22 16:16:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(668, 'http://wiquadro.dev/site/logout', '2014-07-22 16:17:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(669, 'http://wiquadro.dev/usuario/login', '2014-07-23 09:45:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(670, 'http://wiquadro.dev/site/logout', '2014-07-23 09:46:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(671, 'http://wiquadro.dev/usuario/login', '2014-07-23 09:46:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'ewerton@ewerton.com', 'c3184c089a3047eff3950d77b023d0dd'),
	(672, 'http://wiquadro.dev/site/logout', '2014-07-23 09:50:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Logout', 'ewerton@ewerton.com', 'c3184c089a3047eff3950d77b023d0dd'),
	(673, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:14:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(674, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:15:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(675, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:18:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(676, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:18:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(677, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:18:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(678, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:18:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(679, 'http://wiquadro.dev/usuario/login', '2014-07-23 11:20:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(680, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:29:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(681, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:49:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(682, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:49:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(683, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:50:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(684, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:50:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'oi', ''),
	(685, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:51:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(686, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:51:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(687, 'http://wiquadro.dev/usuario/login', '2014-07-23 16:52:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(688, 'http://dev.wiquadro/site/logout', '2014-07-23 16:54:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(689, 'http://dev.wiquadro/usuario/login', '2014-07-23 16:55:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Tentativa de Login', 'mauricio@divmaster.com.br', 'qwrewf'),
	(690, 'http://dev.wiquadro/usuario/login', '2014-07-23 16:55:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(691, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:00:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(692, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:00:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(693, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:00:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'oi', ''),
	(694, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:01:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(695, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:03:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(696, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:04:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(697, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:04:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(698, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:05:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(699, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:05:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(700, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:05:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(701, 'http://wiquadro.dev/usuario/login', '2014-07-23 17:11:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', '', ''),
	(702, 'http://wiquadro.dev/site/login', '2014-07-23 17:23:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '123'),
	(703, 'http://wiquadro.dev/site/login', '2014-07-23 17:23:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '1234'),
	(704, 'http://wiquadro.dev/site/login', '2014-07-23 17:23:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(705, 'http://wiquadro.dev/site/login', '2014-07-23 17:25:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(706, 'http://wiquadro.dev/site/logout', '2014-07-23 17:25:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(707, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '1245'),
	(708, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '12345'),
	(709, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(710, 'http://wiquadro.dev/site/logout', '2014-07-23 17:29:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(711, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com.br', '456'),
	(712, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '456'),
	(713, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'wiquadro@gmail.com', '12345'),
	(714, 'http://wiquadro.dev/site/login', '2014-07-23 17:29:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(715, 'http://wiquadro.dev/site/logout', '2014-07-23 17:29:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(716, 'http://dev.wiquadro/usuario/login', '2014-07-24 08:22:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(717, 'http://wiquadro.dev/site/login', '2014-07-24 08:36:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'henri@novolayout.com.br', 'natal'),
	(718, 'http://wiquadro.dev/site/login', '2014-07-24 08:47:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'test@wiquadro.com.br', 'c3184c089a3047eff3950d77b023d0dd'),
	(719, 'http://wiquadro.dev/site/logout', '2014-07-24 08:47:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'test@wiquadro.com.br', 'c3184c089a3047eff3950d77b023d0dd'),
	(720, 'http://wiquadro.dev/site/login', '2014-07-24 08:56:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(721, 'http://wiquadro.dev/site/logout', '2014-07-24 08:57:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(722, 'http://dev.wiquadro/site/logout', '2014-07-24 08:57:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(723, 'http://dev.wiquadro/site/login', '2014-07-24 09:00:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(724, 'http://dev.wiquadro/site/logout', '2014-07-24 09:00:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(725, 'http://dev.wiquadro/site/login', '2014-07-24 09:01:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', '123456l'),
	(726, 'http://dev.wiquadro/site/login', '2014-07-24 09:01:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Tentativa de Login', 'david@divmaster.com.br', '12345'),
	(727, 'http://dev.wiquadro/site/login', '2014-07-24 09:01:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(728, 'http://wiquadro.dev/site/login', '2014-07-24 09:48:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(729, 'http://wiquadro.dev/site/login', '2014-07-24 10:11:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(730, 'http://wiquadro.dev/site/login', '2014-07-24 10:48:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(731, 'http://wiquadro.dev/site/logout', '2014-07-24 11:58:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(732, 'http://wiquadro.dev/site/login', '2014-07-24 14:16:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(733, 'http://wiquadro.dev/site/login', '2014-07-25 09:20:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(734, 'http://wiquadro.dev/site/logout', '2014-07-25 09:21:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(735, 'http://wiquadro.dev/site/login', '2014-07-25 09:50:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(736, 'http://wiquadro.dev/site/logout', '2014-07-25 09:50:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(737, 'http://wiquadro.dev/site/login', '2014-07-25 10:33:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@hotmail.com', '1234'),
	(738, 'http://wiquadro.dev/site/login', '2014-07-25 10:33:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(739, 'http://wiquadro.dev/site/logout', '2014-07-25 10:33:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@hotmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
	(740, 'http://dev.wiquadro/site/login', '2014-07-28 08:16:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(741, 'http://wiquadro.dev/site/login', '2014-07-28 08:35:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(742, 'http://wiquadro.dev/site/logout', '2014-07-28 10:01:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(743, 'http://wiquadro.dev/site/login', '2014-07-28 10:01:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '1234546'),
	(744, 'http://wiquadro.dev/site/login', '2014-07-28 10:01:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(745, 'http://wiquadro.dev/site/login', '2014-07-28 10:01:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(746, 'http://wiquadro.dev/site/login', '2014-07-28 14:24:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(747, 'http://wiquadro.dev/site/login', '2014-07-28 14:24:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(748, 'http://dev.wiquadro/site/login', '2014-07-29 08:42:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(749, 'http://wiquadro.dev/site/login', '2014-07-29 08:50:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(750, 'http://wiquadro.dev/site/logout', '2014-07-29 09:02:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(751, 'http://wiquadro.dev/site/login', '2014-07-29 09:04:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(752, 'http://wiquadro.dev/site/logout', '2014-07-29 09:04:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(753, 'http://wiquadro.dev/site/login', '2014-07-29 09:06:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(754, 'http://wiquadro.dev/site/logout', '2014-07-29 09:48:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(755, 'http://wiquadro.dev/site/login', '2014-07-29 09:48:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(756, 'http://wiquadro.dev/site/login', '2014-07-29 09:48:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(757, 'http://wiquadro.dev/site/registro', '2014-07-29 09:55:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(758, 'http://wiquadro.dev/site/login', '2014-07-29 09:56:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(759, 'http://wiquadro.dev/site/login', '2014-07-29 10:01:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(760, 'http://dev.wiquadro/site/logout', '2014-07-29 10:27:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(761, 'http://dev.wiquadro/site/login', '2014-07-29 10:27:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(762, 'http://dev.wiquadro/site/logout', '2014-07-29 10:52:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(763, 'http://dev.wiquadro/site/login', '2014-07-29 10:52:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '123456'),
	(764, 'http://dev.wiquadro/site/login', '2014-07-29 10:52:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(765, 'http://wiquadro.dev/site/logout', '2014-07-29 11:38:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(766, 'http://wiquadro.dev/site/login', '2014-07-29 11:39:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(767, 'http://wiquadro.dev/site/login', '2014-07-29 11:39:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(768, 'http://wiquadro.dev/site/login', '2014-07-29 13:54:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(769, 'http://wiquadro.dev/site/login', '2014-07-29 13:59:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(770, 'http://wiquadro.dev/site/logout', '2014-07-29 14:45:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(771, 'http://wiquadro.dev/site/login', '2014-07-29 14:45:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(772, 'http://wiquadro.dev/site/logout', '2014-07-29 14:47:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(773, 'http://wiquadro.dev/site/login', '2014-07-29 14:48:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(774, 'http://wiquadro.dev/site/registro', '2014-07-29 15:02:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(775, 'http://wiquadro.dev/site/login', '2014-07-29 15:04:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(776, 'http://wiquadro.dev/site/login', '2014-07-29 15:12:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(777, 'http://wiquadro.dev/site/registro', '2014-07-29 15:13:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(778, 'http://wiquadro.dev/site/login', '2014-07-29 15:14:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(779, 'http://wiquadro.dev/site/registro', '2014-07-29 15:20:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(780, 'http://wiquadro.dev/site/login', '2014-07-29 15:24:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(781, 'http://wiquadro.dev/site/logout', '2014-07-29 15:28:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(782, 'http://wiquadro.dev/site/login', '2014-07-29 15:28:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(783, 'http://wiquadro.dev/site/login', '2014-07-29 16:01:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(784, 'http://wiquadro.dev/site/logout', '2014-07-29 16:01:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(785, 'http://wiquadro.dev/site/login', '2014-07-29 16:02:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(786, 'http://wiquadro.dev/site/logout', '2014-07-29 16:02:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(787, 'http://wiquadro.dev/site/login', '2014-07-29 16:02:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(788, 'http://wiquadro.dev/site/logout', '2014-07-29 16:02:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(789, 'http://wiquadro.dev/site/login', '2014-07-29 16:02:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(790, 'http://wiquadro.dev/site/logout', '2014-07-29 16:02:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(791, 'http://wiquadro.dev/site/login', '2014-07-29 16:02:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(792, 'http://wiquadro.dev/site/login', '2014-07-29 16:07:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(793, 'http://wiquadro.dev/site/logout', '2014-07-29 16:07:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(794, 'http://wiquadro.dev/site/login', '2014-07-29 16:08:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(795, 'http://wiquadro.dev/site/logout', '2014-07-29 16:14:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(796, 'http://wiquadro.dev/site/login', '2014-07-29 16:14:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(797, 'http://wiquadro.dev/site/login', '2014-07-29 16:28:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(798, 'http://dev.wiquadro/site/login', '2014-07-30 08:21:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(799, 'http://dev.wiquadro/site/logout', '2014-07-30 08:21:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(800, 'http://dev.wiquadro/site/login', '2014-07-30 08:26:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Tentativa de Login', 'aluno@teste.com', '1234'),
	(801, 'http://dev.wiquadro/site/login', '2014-07-30 08:27:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(802, 'http://wiquadro.dev/site/login', '2014-07-30 08:38:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(803, 'http://wiquadro.dev/site/logout', '2014-07-30 08:39:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(804, 'http://wiquadro.dev/site/login', '2014-07-30 08:58:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(805, 'http://wiquadro.dev/site/logout', '2014-07-30 09:10:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(806, 'http://wiquadro.dev/site/login', '2014-07-30 09:10:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(807, 'http://wiquadro.dev/site/logout', '2014-07-30 09:10:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(808, 'http://wiquadro.dev/site/login', '2014-07-30 09:10:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(809, 'http://wiquadro.dev/site/logout', '2014-07-30 09:11:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(810, 'http://wiquadro.dev/site/login', '2014-07-30 09:11:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(811, 'http://dev.wiquadro/site/login', '2014-07-30 11:18:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 'Login', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e'),
	(812, 'http://192.168.1.158/site/login', '2014-07-30 14:53:49', '192.168.1.123', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(813, 'http://wiquadro.dev/site/login', '2014-07-30 15:50:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(814, 'http://wiquadro.dev/site/logout', '2014-07-30 16:15:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(815, 'http://wiquadro.dev/site/login', '2014-07-30 16:15:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(816, 'http://dev.wiquadro/site/login', '2014-07-30 16:28:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(817, 'http://dev.wiquadro/site/logout', '2014-07-30 16:48:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(818, 'http://dev.wiquadro/site/login', '2014-07-30 16:48:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(819, 'http://dev.wiquadro/site/logout', '2014-07-30 17:01:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(820, 'http://dev.wiquadro/site/login', '2014-07-30 17:01:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(821, 'http://dev.wiquadro/site/logout', '2014-07-30 17:04:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(822, 'http://dev.wiquadro/site/login', '2014-07-30 17:05:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(823, 'http://dev.wiquadro/site/logout', '2014-07-30 17:06:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(824, 'http://dev.wiquadro/site/login', '2014-07-30 17:06:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(825, 'http://dev.wiquadro/site/logout', '2014-07-30 17:20:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(826, 'http://dev.wiquadro/site/login', '2014-07-30 17:20:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(827, 'http://dev.wiquadro/site/logout', '2014-07-30 17:50:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(828, 'http://dev.wiquadro/site/login', '2014-07-30 17:50:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(829, 'http://wiquadro.dev/site/login', '2014-07-30 17:52:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(830, 'http://wiquadro.dev/site/logout', '2014-07-30 17:52:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(831, 'http://dev.wiquadro/site/logout', '2014-07-30 17:55:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(832, 'http://dev.wiquadro/site/login', '2014-07-30 17:55:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(833, 'http://dev.wiquadro/site/logout', '2014-07-30 17:58:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(834, 'http://dev.wiquadro/site/login', '2014-07-30 17:58:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(835, 'http://dev.wiquadro/site/login', '2014-07-31 08:27:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(836, 'http://wiquadro.dev/site/login', '2014-07-31 08:52:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(837, 'http://wiquadro.dev/site/login', '2014-07-31 08:52:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(838, 'http://wiquadro.dev/site/logout', '2014-07-31 08:53:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(839, 'http://wiquadro.dev/site/login', '2014-07-31 08:56:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(840, 'http://wiquadro.dev/site/login', '2014-07-31 11:28:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(841, 'http://dev.wiquadro/site/logout', '2014-07-31 11:34:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Logout', 'aluno@teste.com', '202cb962ac59075b964b07152d234b70'),
	(842, 'http://dev.wiquadro/site/login', '2014-07-31 11:34:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(843, 'http://wiquadro.dev/site/login', '2014-07-31 13:59:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Tentativa de Login', 'emmersonsiqueira@gmail.com', '123456'),
	(844, 'http://wiquadro.dev/site/login', '2014-07-31 13:59:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(845, 'http://wiquadro.dev/site/registro', '2014-07-31 14:55:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Logout', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70'),
	(846, 'http://wiquadro.dev/site/login', '2014-07-31 14:55:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(847, 'http://192.168.1.158/site/login', '2014-07-31 15:18:12', '192.168.1.117', 'Mozilla/5.0 (Linux; Android 4.2.2; GT-I9300 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.131 Mobile Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
	(848, 'http://192.168.1.158/site/login', '2014-07-31 15:34:15', '192.168.1.117', 'Mozilla/5.0 (Linux; Android 4.2.2; GT-I9300 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.131 Mobile Safari/537.36', 'Login', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e');
/*!40000 ALTER TABLE `loglogin` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.perguntasatisfacao
DROP TABLE IF EXISTS `perguntasatisfacao`;
CREATE TABLE IF NOT EXISTS `perguntasatisfacao` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdCliente` int(11) NOT NULL,
  `Descricao` varchar(500) NOT NULL,
  `TipoResposta` enum('U','M') NOT NULL COMMENT 'U - Única; M - Multipla',
  `IdDisciplina` int(11) DEFAULT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  PRIMARY KEY (`Id`),
  KEY `FK_perguntasatisfacao_cliente` (`IdCliente`),
  KEY `FK_perguntasatisfacao_disciplina` (`IdDisciplina`),
  CONSTRAINT `FK_perguntasatisfacao_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`),
  CONSTRAINT `FK_perguntasatisfacao_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.perguntasatisfacao: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `perguntasatisfacao` DISABLE KEYS */;
INSERT INTO `perguntasatisfacao` (`Id`, `IdCliente`, `Descricao`, `TipoResposta`, `IdDisciplina`, `Ativo`) VALUES
	(12, 15, 'Como você avalia os textos do curso?', 'U', NULL, 'T'),
	(13, 15, 'Como você avalia os exercícios do curso?', 'U', NULL, 'T'),
	(14, 15, 'Como você avalia a interação do aluno com o curso participação do aluno pela internet?', 'U', NULL, 'T'),
	(15, 15, 'Como você avalia o visual do curso?', 'U', NULL, 'T'),
	(16, 15, 'Como você avalia o Ger@tendimento atendimento para tirar dúvidas on-line?', 'U', NULL, 'T'),
	(17, 15, 'Como você avalia o tempo total para a realização do curso?', 'U', NULL, 'T'),
	(18, 15, 'Como você avalia a facilidade de navegação no curso?', 'U', NULL, 'T'),
	(19, 15, 'Como você avalia o conteúdo abordado no curso para ser utilizado no seu dia-a-dia?', 'U', NULL, 'T'),
	(20, 15, 'Selecione a lição que MAIS GOSTOU.', 'M', NULL, 'T'),
	(21, 15, 'Como você avalia o seu aproveitamento geral do curso?', 'U', NULL, 'T');
/*!40000 ALTER TABLE `perguntasatisfacao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.permissaoacesso
DROP TABLE IF EXISTS `permissaoacesso`;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projeto: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` (`Id`, `Nome`, `Descricao`, `Publico`, `IdCliente`) VALUES
	(1, 'Curso Grátis', 'O PHP é hoje a linguagem de programação Web mais popular em todo o mundo. Mais de 25 milhões de sites na Internet utilizam esta tecnologia, conforme dados do site oficial - PHP.net.', 'F', 1),
	(2, 'Mais um projeto', 'projeto criado para testar a seleção de mais de um projeto por usuário. é!!', 'F', 15),
	(3, 'Mais um projeto de Testes', 'Este projeto tem com objetivo promover os testes de cadastro de um novo projeto.', 'T', 2),
	(4, 'Fortalecimento da Educação nas Escolas', 'Vemos que é bem parecido com a forma não-relacional. A única diferença é uma chamada ao método', 'T', 15),
	(5, 'Projeto de teste para permissões do usuáro', 'A nível organizacional, o acompanhamento das preferências de consumo facilita a criação do levantame', 'T', 15),
	(6, 'Teste 01', 'teste', 'T', 1),
	(7, 'novo projeto', 'novo projeto', 'F', 1),
	(8, 'Projeto para teste do sistema', 'A certificação de metodologias que nos auxiliam a lidar com a determinação clara de objetivos facili', 'T', 15),
	(10, 'teste 24das', 'dasdas', 'F', 18),
	(29, 'Para um futuro melhor', 'Percebemos, cada vez mais, que a crescente influência da mídia assume importantes posições no estabe', 'F', 15),
	(30, 'projeto de tela nova', 'tela nova! :DD', 'F', 1);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.projetodisciplina
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projetodisciplina: ~19 rows (aproximadamente)
/*!40000 ALTER TABLE `projetodisciplina` DISABLE KEYS */;
INSERT INTO `projetodisciplina` (`Id`, `IdProjeto`, `IdDisciplina`) VALUES
	(11, 1, 53),
	(19, 1, 57),
	(25, 1, 61),
	(29, 1, 64),
	(30, 1, 65),
	(18, 2, 56),
	(2, 3, 2),
	(1, 4, 1),
	(13, 4, 3),
	(17, 4, 4),
	(14, 4, 8),
	(16, 4, 9),
	(7, 4, 16),
	(8, 4, 18),
	(21, 4, 33),
	(23, 6, 58),
	(24, 8, 1),
	(26, 29, 62),
	(28, 29, 63);
/*!40000 ALTER TABLE `projetodisciplina` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.projetoescola
DROP TABLE IF EXISTS `projetoescola`;
CREATE TABLE IF NOT EXISTS `projetoescola` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProjeto` int(11) NOT NULL,
  `IdEscola` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IdProjeto_IdEscola` (`IdProjeto`,`IdEscola`),
  KEY `FK__escola` (`IdEscola`),
  CONSTRAINT `FK__escola` FOREIGN KEY (`IdEscola`) REFERENCES `escola` (`Id`),
  CONSTRAINT `FK__projeto` FOREIGN KEY (`IdProjeto`) REFERENCES `projeto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.projetoescola: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `projetoescola` DISABLE KEYS */;
INSERT INTO `projetoescola` (`Id`, `IdProjeto`, `IdEscola`) VALUES
	(5, 1, 5),
	(1, 2, 1),
	(4, 4, 1),
	(2, 4, 3),
	(3, 4, 4),
	(6, 8, 1),
	(8, 29, 1),
	(7, 29, 8);
/*!40000 ALTER TABLE `projetoescola` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questao
DROP TABLE IF EXISTS `questao`;
CREATE TABLE IF NOT EXISTS `questao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Texto` text NOT NULL,
  `Imagem` varchar(4000) DEFAULT NULL,
  `Numero` int(11) DEFAULT '1',
  `Tipo` enum('OBJ','DIS') NOT NULL DEFAULT 'OBJ',
  `Resposta` varchar(4000) DEFAULT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `Secao` enum('P','T') NOT NULL COMMENT 'P = Pratique; T = Teste',
  `Orientacao` text COMMENT 'Orientação ao professor de como trabalhar a questão',
  PRIMARY KEY (`Id`),
  KEY `FK_questao_edc` (`IdEdc`),
  CONSTRAINT `FK_questao_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questao: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `questao` DISABLE KEYS */;
INSERT INTO `questao` (`Id`, `Texto`, `Imagem`, `Numero`, `Tipo`, `Resposta`, `IdEdc`, `Ativo`, `Secao`, `Orientacao`) VALUES
	(1, 'É claro que o acompanhamento das preferências de consumo afeta positivamente a correta previsão das condições inegavelmente apropriadas. Baseado nessas informações responda:\r\n\r\nQual o resultado da soma de 4 + 4 ?<div><br></div><div style="text-align: center;"><img src="/images/questoes/8b4a87b850e0cf17d2b4c1f2a5642246.png"><br></div><div><br></div><div style="text-align: center;">sadlgksg,jgsdkgjhdfkgjhddgk</div>', '0', 2, 'OBJ', '', 4, 'T', 'P', NULL),
	(8, 'teste de questão para salvar mídia?? alterei!', '0', 5, 'OBJ', 'Teste', 4, 'T', 'P', NULL),
	(9, 'Esse é um teste muito importante, para verificar se ordem das questões estão corretas.', NULL, 1, 'OBJ', '', 4, 'T', 'P', NULL),
	(10, 'só mais um teste, por isso peguei um texto do lerolero.com\r\n\r\nÉ claro que a contínua expansão de nossa atividade estende o alcance e a importância do sistema de formação de quadros que corresponde às necessidades.', NULL, 3, 'OBJ', '', 4, 'T', 'P', NULL),
	(11, 'jdfjhgasdjfg', NULL, 4, 'OBJ', '', 12, 'T', 'P', NULL),
	(36, 'erteterrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, 1, 'DIS', 'rterterrt', 12, 'T', 'P', NULL),
	(37, 'as da sd<br>a<br>sd<br>as<br>das<br>d<br>asd<br>asdasd<br>asd<br><br>asd<br>asda<br>asda<br><br>asdadas da da sdas<br><br>as<br>da<br>sd<br>asd<br>', NULL, 2, 'DIS', 'asdasd asd\r\na sda\r\nsda\r\nsd\r\n\r\n\r\nasdasdasdasdasdsad', 12, 'T', 'P', NULL),
	(38, 'Qual é o resultado de 1 + 1?<br>', NULL, 3, 'OBJ', '', 12, 'T', 'P', NULL),
	(39, '<div style="text-align: center;">Gostaria de enfatizar que o julgamento imparcial das eventualidades promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.</div><div style="text-align: center;"><br></div><div style="text-align: center;"><img src="/images/questoes/aafcd9c698253d243d9fe3373d87e82f.png"><br></div><div style="text-align: center;"><img src="/images/questoes/4f1f40a57bc89ff73c86c190a0aaea63.png"><br></div>', NULL, 3, 'OBJ', '', 1, 'T', 'P', NULL),
	(40, 'Podemos já vislumbrar o modo pelo qual o início da atividade geral de formação de atitudes estimula a padronização das diretrizes de desenvolvimento para o futuro.', NULL, 2, 'DIS', 'O que temos que ter sempre em mente é que a valorização de fatores subjetivos promove a alavancagem dos procedimentos normalmente adotados.', 1, 'T', 'P', NULL),
	(41, 'Evidentemente, a execução dos pontos do programa agrega valor ao estabelecimento dos modos de operação convencionais.<br>', NULL, 1, 'DIS', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 1, 'T', 'P', NULL),
	(42, 'No mundo atual, o julgamento imparcial das eventualidades possibilita uma melhor visão global do orçamento setorial.<br>', NULL, 1, 'OBJ', '', 37, 'T', 'T', NULL),
	(43, 'zasdasd', NULL, 2, 'DIS', 'asdasdasd', 37, 'T', 'T', NULL),
	(49, 'Diga oi<br>&lt;iframe width="560" height="315" src="//www.youtube.com/embed/IKzoBWNidPI" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;<br>', NULL, 3, 'DIS', 'oi', 37, 'T', 'T', NULL),
	(50, 'Diga um Oi para praticar<br>', NULL, 4, 'OBJ', 'oi', 37, 'T', 'T', NULL),
	(51, 'Quanto é 1 + 2?<br>', NULL, 1, 'OBJ', '', 52, 'T', 'T', NULL),
	(52, 'Qual é a raiz quadrada do número 9?<br>', NULL, 2, 'OBJ', '', 52, 'T', 'T', NULL),
	(53, 'Quantas letras tem a palavra Matemática?<br>', NULL, 3, 'DIS', '10', 52, 'T', 'T', NULL),
	(54, 'Qual é a metade de dois, mais dois?<br>', NULL, 4, 'OBJ', '', 52, 'T', 'T', NULL),
	(55, 'teste', NULL, 5, 'OBJ', '', 37, 'T', 'P', NULL),
	(56, 'rtestesde', NULL, 6, 'DIS', 'qwe123', 37, 'T', 'P', NULL),
	(57, 'testando sa coisa', NULL, 7, 'DIS', 'e', 37, 'T', 'P', NULL),
	(64, 'asasd', NULL, 4, 'DIS', '1212', 37, 'T', 'P', NULL),
	(65, 'testando', NULL, 1, 'DIS', '1', 52, 'T', 'P', NULL),
	(66, 'testando2', NULL, 2, 'OBJ', '', 52, 'T', 'P', NULL),
	(67, 'Teste3', NULL, 3, 'DIS', 'ok', 52, 'T', 'P', NULL),
	(68, 'teste4', NULL, 4, 'OBJ', '', 52, 'T', 'P', NULL),
	(69, 'teste5', NULL, 5, 'DIS', 'a', 52, 'T', 'P', NULL),
	(70, 'adsdsadsadasd<br>', NULL, 5, 'DIS', 'dsdsadsadsa', 37, 'T', 'P', NULL),
	(71, 'A prática cotidiana prova que a percepção das dificuldades possibilita uma melhor visão global do fluxo de informações.<br>', NULL, 1, 'DIS', 'fddsfdsd', 43, 'T', 'P', 'A certificação de metodologias que nos auxiliam a lidar com a estrutura atual da organização agrega valor ao estabelecimento do sistema de participação geral.'),
	(72, 'A nível organizacional, a expansão dos mercados mundiais é uma das consequências do remanejamento dos quadros funcionais.<br>', NULL, 1, 'DIS', 'A certificação de metodologias que nos auxiliam a lidar com o início da atividade geral de formação de atitudes possibilita uma melhor visão global dos índices pretendidos.', 43, 'T', 'T', 'A nível organizacional, o comprometimento entre as equipes faz parte de um processo de gerenciamento das condições financeiras e administrativas exigidas.'),
	(73, 'Caros amigos, o desafiador cenário globalizado assume importantes posições no estabelecimento das direções preferenciais no sentido do progresso.<br>', NULL, 2, 'DIS', 'A nível organizacional, a percepção das dificuldades facilita a criação de todos os recursos funcionais envolvidos.', 43, 'T', 'P', 'Todavia, o comprometimento entre as equipes acarreta um processo de reformulação e modernização do sistema de formação de quadros que corresponde às necessidades.'),
	(74, 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o consenso sobre a necessidade de qualificação ainda não demonstrou convincentemente que vai participar na mudança das diretrizes de desenvolvimento para o futuro.<br>', NULL, 3, 'OBJ', '', 43, 'T', 'P', 'A nível organizacional, a determinação clara de objetivos obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(75, 'No entanto, não podemos esquecer que o início da atividade geral de formação de atitudes cumpre um papel essencial na formulação de alternativas às soluções ortodoxas.<br>', NULL, 4, 'OBJ', '', 43, 'T', 'P', ''),
	(76, 'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos paradigmas corporativos.<br>', NULL, 5, 'OBJ', '', 43, 'T', 'P', ''),
	(77, '<b>afdsfdsfd</b><div><b><i><br></i></b></div><div><b><i>dsfgdsgdsg</i></b></div><div><b><i><br></i></b></div><div><b><i><br></i></b></div><div style="text-align: center;"><b><i>dfsfdsfsdfag</i></b></div>', NULL, 6, 'OBJ', '', 43, 'T', 'P', '');
/*!40000 ALTER TABLE `questao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaoalternativa
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaoalternativa: ~65 rows (aproximadamente)
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
	(26, 11, 3, '<img src="/images/questoes/0345609a9a1596aaa27f18759da60f33.png"><br>', 'F'),
	(27, 38, 1, '2<br>', 'T'),
	(28, 38, 2, '1<br>', 'F'),
	(29, 39, 1, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o acompanhamento das preferências de consumo estimula a padronização dos métodos utilizados na avaliação de resultados.<br>', 'F'),
	(30, 39, 2, 'Assim mesmo, o consenso sobre a necessidade de qualificação cumpre um papel essencial na formulação das condições financeiras e administrativas exigidas.<br>', 'F'),
	(31, 39, 3, 'No entanto, não podemos esquecer que o desafiador cenário globalizado promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'T'),
	(32, 39, 4, 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a consulta aos diversos militantes acarreta um processo de reformulação e modernização dos níveis de motivação departamental.<br>', 'F'),
	(33, 39, 5, 'Pensando mais a longo prazo, a percepção das dificuldades faz parte de um processo de gerenciamento das diretrizes de desenvolvimento para o futuro.<br>', 'F'),
	(34, 42, 1, 'A nível organizacional, o entendimento das metas propostas facilita a criação do sistema de participação geral.<br>', 'F'),
	(35, 42, 2, 'Neste sentido, a valorização de fatores subjetivos estimula a padronização das diversas correntes de pensamento.<br>', 'T'),
	(36, 42, 3, 'No mundo atual, a revolução dos costumes maximiza as possibilidades por conta dos relacionamentos verticais entre as hierarquias.<br>', 'F'),
	(37, 50, 1, 'a', 'F'),
	(38, 50, 2, 'b', 'T'),
	(39, 50, 3, 'c', 'F'),
	(40, 51, 1, '2<br>', 'F'),
	(41, 51, 2, '3<br>', 'T'),
	(42, 51, 3, '1<br>', 'F'),
	(43, 52, 1, '9<br>', 'F'),
	(44, 52, 2, '6<br>', 'F'),
	(45, 52, 3, '3<br>', 'T'),
	(46, 54, 1, '2<br>', 'F'),
	(47, 54, 2, '3<br>', 'T'),
	(48, 55, 1, '1', 'F'),
	(49, 55, 2, '2', 'T'),
	(50, 66, 1, '1', 'F'),
	(51, 66, 2, '2', 'T'),
	(52, 66, 3, '3', 'F'),
	(53, 66, 4, '4', 'F'),
	(54, 68, 1, '1', 'F'),
	(55, 68, 2, '2', 'F'),
	(56, 68, 3, '3 aki a certa', 'T'),
	(57, 71, NULL, 'Do mesmo modo, a necessidade de renovação processual causa impacto indireto na reavaliação do sistema de formação de quadros que corresponde às necessidades.<br>', 'F'),
	(58, 71, NULL, 'Ainda assim, existem dúvidas a respeito de como a expansão dos mercados mundiais representa uma abertura para a melhoria dos índices pretendidos.<br>', 'T'),
	(59, 71, NULL, 'Do mesmo modo, a competitividade nas transações comerciais acarreta um processo de reformulação e modernização dos níveis de motivação departamental.<br>', 'F'),
	(60, 74, 1, 'Pensando mais a longo prazo, a hegemonia do ambiente político promove a alavancagem do retorno esperado a longo prazo.<br>', 'F'),
	(61, 74, 2, 'É importante questionar o quanto a consulta aos diversos militantes exige a precisão e a definição das diretrizes de desenvolvimento para o futuro.<br>', 'T'),
	(62, 74, 3, 'A certificação de metodologias que nos auxiliam a lidar com a complexidade dos estudos efetuados possibilita uma melhor visão global das novas proposições.<br>', 'F'),
	(63, 75, 1, 'As experiências acumuladas demonstram que a valorização de fatores subjetivos aponta para a melhoria das direções preferenciais no sentido do progresso.<br>', 'T'),
	(64, 75, 2, 'Do mesmo modo, a consulta aos diversos militantes ainda não demonstrou convincentemente que vai participar na mudança das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'F'),
	(65, 75, 3, 'O que temos que ter sempre em mente é que o surgimento do comércio virtual pode nos levar a considerar a reestruturação das novas proposições.<br>', 'F'),
	(66, 76, 1, 'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos paradigmas corporativos.<br>', 'F'),
	(67, 76, 2, 'Todavia, a constante divulgação das informações talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.<br>', 'F'),
	(68, 76, 3, 'O cuidado em identificar pontos críticos no desafiador cenário globalizado auxilia a preparação e a composição do processo de comunicação como um todo.<br>', 'F'),
	(69, 76, 4, 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual representa uma abertura para a melhoria da gestão inovadora da qual fazemos parte.<br>', 'T'),
	(70, 77, 1, 'dfasdfadf', 'F'),
	(71, 77, 2, 'asfassa', 'F'),
	(72, 77, 3, '<i>safsafsaf</i>', 'T');
/*!40000 ALTER TABLE `questaoalternativa` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaoalunocomentario
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
  KEY `FK_questaoalunocomentario_aluno` (`IdAluno`),
  KEY `FK_questaoalunocomentario_questao` (`IdQuestao`),
  CONSTRAINT `FKusuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`),
  CONSTRAINT `FK_questaoalunocomentario_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_questaoalunocomentario_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaoalunocomentario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `questaoalunocomentario` DISABLE KEYS */;
INSERT INTO `questaoalunocomentario` (`Id`, `IdQuestao`, `IdAluno`, `IdProfessor`, `DataHora`, `Comentario`) VALUES
	(7, 36, 1, 9, '2014-06-11 09:27:16', 'Olá Olá Olá'),
	(8, 39, 1, 9, '2014-06-11 09:27:33', 'oi'),
	(9, 64, 1, 9, '2014-06-11 15:14:17', 'Demonstrar conhecimento e compreensão da disciplina com suas próprias palavras - Muito bem. Você está no caminho certo para obter ‘excelente’ neste resultado de aprendizagem. Você só precisa elaborar uma explicação mais completa a respeito das idéias de gestão que você escolheu.');
/*!40000 ALTER TABLE `questaoalunocomentario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaocomentario
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
DROP TABLE IF EXISTS `questaodescritor`;
CREATE TABLE IF NOT EXISTS `questaodescritor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `IdDescritor` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__questao` (`IdQuestao`),
  KEY `FK__descritor` (`IdDescritor`),
  CONSTRAINT `FK__descritor` FOREIGN KEY (`IdDescritor`) REFERENCES `descritor` (`Id`),
  CONSTRAINT `FK__questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaodescritor: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `questaodescritor` DISABLE KEYS */;
INSERT INTO `questaodescritor` (`Id`, `IdQuestao`, `IdDescritor`) VALUES
	(6, 37, 3),
	(7, 37, 10),
	(8, 38, 3),
	(9, 38, 4),
	(10, 38, 10),
	(11, 43, 4),
	(34, 72, 12),
	(35, 72, 14),
	(36, 72, 16),
	(37, 72, 18),
	(38, 73, 12),
	(39, 73, 14),
	(40, 73, 15),
	(44, 74, 13),
	(45, 74, 15),
	(46, 74, 17),
	(47, 74, 19),
	(48, 75, 12),
	(49, 75, 14),
	(50, 75, 16),
	(51, 75, 18),
	(52, 76, 13),
	(53, 76, 15),
	(54, 76, 17),
	(55, 76, 19),
	(65, 55, 3),
	(66, 56, 3),
	(67, 66, 4),
	(68, 57, 4),
	(69, 65, 18),
	(70, 71, 13),
	(71, 71, 14),
	(72, 71, 18);
/*!40000 ALTER TABLE `questaodescritor` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaodica
DROP TABLE IF EXISTS `questaodica`;
CREATE TABLE IF NOT EXISTS `questaodica` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Texto` text NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_QuestaoDica_Numero` (`IdQuestao`,`Numero`),
  CONSTRAINT `FK_questaodica_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaodica: ~37 rows (aproximadamente)
/*!40000 ALTER TABLE `questaodica` DISABLE KEYS */;
INSERT INTO `questaodica` (`Id`, `IdQuestao`, `Numero`, `Texto`) VALUES
	(1, 1, 1, 'Muito fácil!\r\ndfgdfgfd  sdgfdghfdgf dsgg\r\n<b>fdgfdgdg</b>'),
	(2, 1, 2, 'asdfdsafafasdg'),
	(3, 1, 3, 'saasdsd fbdfb dfg'),
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
	(49, 36, 1, 'ertrer'),
	(50, 37, 1, '<br>'),
	(51, 38, 1, '<br>'),
	(52, 39, 1, 'Pensando mais a longo prazo, a hegemonia do ambiente político promove a alavancagem do retorno esperado a longo prazo.<br>'),
	(53, 39, 2, 'Do mesmo modo, a constante divulgação das informações nos obriga à análise do impacto na agilidade decisória.<br>'),
	(54, 39, 3, 'Acima de tudo, é fundamental ressaltar que o consenso sobre a necessidade de qualificação apresenta tendências no sentido de aprovar a manutenção de alternativas às soluções ortodoxas.<br>'),
	(55, 40, 1, 'Caros amigos, a estrutura atual da organização promove a alavancagem do processo de comunicação como um todo.'),
	(56, 41, 1, 'A prática cotidiana prova que a hegemonia do ambiente político ainda não demonstrou convincentemente que vai participar na mudança dos procedimentos normalmente adotados.<br>'),
	(57, 42, 1, 'Percebemos, cada vez mais, que a percepção das dificuldades oferece uma interessante oportunidade para verificação do levantamento das variáveis envolvidas.<br>'),
	(58, 42, 2, 'Assim mesmo, a complexidade dos estudos efetuados possibilita uma melhor visão global de todos os recursos funcionais envolvidos.<br>'),
	(59, 42, 3, 'O que temos que ter sempre em mente é que o início da atividade geral de formação de atitudes ainda não demonstrou convincentemente que vai participar na mudança do sistema de formação de quadros que corresponde às necessidades.<br>'),
	(60, 43, 1, '<br>'),
	(66, 50, 1, 'Diga Oi<br>'),
	(67, 55, 1, '<br>'),
	(68, 56, 1, '<br>'),
	(69, 57, 1, '<br>'),
	(72, 64, 1, '<br>'),
	(73, 65, 1, '<br>'),
	(74, 66, 1, '<br>'),
	(75, 67, 1, '<br>'),
	(76, 68, 1, '<br>'),
	(77, 69, 1, '<br>'),
	(78, 70, 1, 'asdsdsa<br>'),
	(79, 73, 1, 'A nível organizacional, o desafiador cenário globalizado garante a contribuição de um grupo importante na determinação das novas proposições.<br>');
/*!40000 ALTER TABLE `questaodica` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.questaorespostamidia
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.questaorespostamidia: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `questaorespostamidia` DISABLE KEYS */;
INSERT INTO `questaorespostamidia` (`Id`, `IdQuestao`, `Url`, `IdTipoMidia`) VALUES
	(1, 8, 'http://www.youtube.com/watch?v=BfXKKxHQsGo', 4),
	(2, 9, 'http://www.youtube.com/watch?v=jofNR_WkoCE', 4),
	(3, 10, 'http://www.youtube.com/watch?v=L9-eCejHQXI', 4),
	(4, 10, 'dsadfasfaf', 2),
	(5, 10, 'asfasfasfasf', 1),
	(6, 37, 'http://www.youtube.com/watch?v=qfiRBNQAlJY', 4),
	(7, 37, 'http://www.youtube.com/watch?v=qfiRBNQAlJY', 4),
	(8, 39, 'https://www.youtube.com/watch?v=q104YhObyV0', 4),
	(9, 42, '&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;//www.youtube.com/embed/qJWCXmwj4fE&quot; frameborder=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 4);
/*!40000 ALTER TABLE `questaorespostamidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.respostaaluno
DROP TABLE IF EXISTS `respostaaluno`;
CREATE TABLE IF NOT EXISTS `respostaaluno` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdQuestao` int(11) NOT NULL,
  `TextoQuestao` varchar(4000) NOT NULL,
  `ImagemQuestao` varchar(4000) DEFAULT NULL,
  `TipoQuestao` char(3) NOT NULL,
  `RespostaQuestao` varchar(4000) NOT NULL,
  `PediuDica` enum('T','F') NOT NULL DEFAULT 'F',
  `RespostaAluno` varchar(4000) DEFAULT NULL,
  `Acertou` enum('T','F') NOT NULL DEFAULT 'F',
  `TempoAluno` time DEFAULT NULL,
  `DataHoraRespostaAluno` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IdAluno` int(11) DEFAULT NULL,
  `IdAlunoTurma` int(11) DEFAULT NULL,
  `IdAlunoTurmaProva` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_respostaaluno_questao` (`IdQuestao`),
  KEY `FK_respostaaluno_aluno` (`IdAluno`),
  KEY `FK_respostaaluno_alunoturmaprova` (`IdAlunoTurmaProva`),
  KEY `FK_Alunoturma` (`IdAlunoTurma`),
  CONSTRAINT `FK_aluno` FOREIGN KEY (`IdAluno`) REFERENCES `aluno` (`Id`),
  CONSTRAINT `FK_Alunoturma` FOREIGN KEY (`IdAlunoTurma`) REFERENCES `alunoturma` (`Id`),
  CONSTRAINT `FK_respostaaluno_alunoturmaprova` FOREIGN KEY (`IdAlunoTurmaProva`) REFERENCES `alunoturmaprova` (`Id`),
  CONSTRAINT `FK_respostaaluno_questao` FOREIGN KEY (`IdQuestao`) REFERENCES `questao` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.respostaaluno: ~91 rows (aproximadamente)
/*!40000 ALTER TABLE `respostaaluno` DISABLE KEYS */;
INSERT INTO `respostaaluno` (`Id`, `IdQuestao`, `TextoQuestao`, `ImagemQuestao`, `TipoQuestao`, `RespostaQuestao`, `PediuDica`, `RespostaAluno`, `Acertou`, `TempoAluno`, `DataHoraRespostaAluno`, `IdAluno`, `IdAlunoTurma`, `IdAlunoTurmaProva`) VALUES
	(50, 36, 'erteterrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, 'DIS', 'rterterrt', 'F', 'ddgfdsgfd', 'F', '00:00:00', '2014-03-31 15:21:11', 1, 59, NULL),
	(51, 36, 'erteterrrrrrrrrrrrrrrrrrrrrrrrrrrr', NULL, 'DIS', 'rterterrt', 'F', 'rterterrt', 'T', '00:00:00', '2014-03-31 15:22:00', 1, 59, NULL),
	(56, 39, '<div style="text-align: center;">Gostaria de enfatizar que o julgamento imparcial das eventualidades promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.</div><div style="text-align: center;"><br></div><div style="text-align: center;"><img src="/images/questoes/aafcd9c698253d243d9fe3373d87e82f.png"><br></div><div style="text-align: center;"><img src="/images/questoes/4f1f40a57bc89ff73c86c190a0aaea63.png"><br></div>', NULL, 'OBJ', 'No entanto, não podemos esquecer que o desafiador cenário globalizado promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'F', 'Assim mesmo, o consenso sobre a necessidade de qualificação cumpre um papel essencial na formulação das condições financeiras e administrativas exigidas.<br>', 'F', '00:00:00', '2014-04-07 10:07:52', 1, 59, NULL),
	(57, 39, '<div style="text-align: center;">Gostaria de enfatizar que o julgamento imparcial das eventualidades promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.</div><div style="text-align: center;"><br></div><div style="text-align: center;"><img src="/images/questoes/aafcd9c698253d243d9fe3373d87e82f.png"><br></div><div style="text-align: center;"><img src="/images/questoes/4f1f40a57bc89ff73c86c190a0aaea63.png"><br></div>', NULL, 'OBJ', 'No entanto, não podemos esquecer que o desafiador cenário globalizado promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'F', 'No entanto, não podemos esquecer que o desafiador cenário globalizado promove a alavancagem das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'T', '00:00:00', '2014-04-07 10:07:54', 1, 59, NULL),
	(58, 41, 'Evidentemente, a execução dos pontos do programa agrega valor ao estabelecimento dos modos de operação convencionais.<br>', NULL, 'DIS', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 'F', 'teste', 'F', '00:00:00', '2014-04-17 09:14:44', 1, 59, NULL),
	(59, 41, 'Evidentemente, a execução dos pontos do programa agrega valor ao estabelecimento dos modos de operação convencionais.<br>', NULL, 'DIS', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 'F', ' prática cotidiana prova que a hegemonia do ambiente político ainda não demonstrou convincentemente que vai participar na mudança dos procedimentos normalmente adotados.', 'F', NULL, '2014-05-06 11:15:37', 1, 59, NULL),
	(60, 41, 'Evidentemente, a execução dos pontos do programa agrega valor ao estabelecimento dos modos de operação convencionais.<br>', NULL, 'DIS', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 'F', 'A prática cotidiana prova que a hegemonia do ambiente político ainda não demonstrou convincentemente que vai participar na mudança dos procedimentos normalmente adotados.', 'F', NULL, '2014-05-06 11:17:33', 1, 59, NULL),
	(61, 41, 'Evidentemente, a execução dos pontos do programa agrega valor ao estabelecimento dos modos de operação convencionais.<br>', NULL, 'DIS', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 'F', 'No mundo atual, o julgamento imparcial das eventualidades nos obriga à análise de alternativas às soluções ortodoxas.', 'T', NULL, '2014-05-06 11:20:24', 1, 59, NULL),
	(111, 55, 'teste', NULL, 'OBJ', '2', 'F', '1', 'F', NULL, '2014-06-04 12:10:30', 78, 214, NULL),
	(112, 55, 'teste', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-04 12:10:33', 78, 214, NULL),
	(113, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'asdee', 'T', NULL, '2014-06-05 12:54:19', 78, 214, NULL),
	(114, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'qwe123', 'T', NULL, '2014-06-04 12:24:49', 78, 214, NULL),
	(118, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'qwe123', 'T', NULL, '2014-06-05 13:58:59', 78, 214, NULL),
	(119, 55, 'teste', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 13:59:13', 78, 214, NULL),
	(120, 55, 'teste', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 13:59:24', 78, 214, NULL),
	(121, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'dadasd', 'F', NULL, '2014-06-05 13:59:42', 78, 214, NULL),
	(122, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', '2', 'F', NULL, '2014-06-05 14:17:28', 78, 214, NULL),
	(123, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'e', 'T', NULL, '2014-06-05 14:17:34', 78, 214, NULL),
	(124, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'r', 'F', NULL, '2014-06-05 14:20:23', 78, 214, NULL),
	(125, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'r', 'F', NULL, '2014-06-05 14:26:56', 78, 214, NULL),
	(126, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'e', 'T', NULL, '2014-06-05 14:27:03', 78, 214, NULL),
	(127, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'e', 'T', NULL, '2014-06-05 14:43:39', 78, 214, NULL),
	(128, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'qwe123', 'T', NULL, '2014-06-05 14:44:17', 78, 214, NULL),
	(129, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'asd', 'F', NULL, '2014-06-05 14:44:24', 78, 214, NULL),
	(130, 65, 'testando<div><br></div>', NULL, 'DIS', '1', 'F', '2', 'F', NULL, '2014-06-05 15:29:08', 78, 213, NULL),
	(131, 65, 'testando<div><br></div>', NULL, 'DIS', '1', 'F', '1', 'T', NULL, '2014-06-05 15:29:19', 78, 213, NULL),
	(132, 66, 'testando2', NULL, 'OBJ', '2', 'F', '1', 'F', NULL, '2014-06-05 15:29:24', 78, 213, NULL),
	(133, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 15:29:45', 78, 213, NULL),
	(140, 66, 'testando2', NULL, 'OBJ', '2', 'F', '3', 'F', NULL, '2014-06-05 16:50:42', 78, 213, NULL),
	(141, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 16:50:47', 78, 213, NULL),
	(145, 66, 'testando2', NULL, 'OBJ', '2', 'F', '1', 'F', NULL, '2014-06-05 16:53:13', 78, 213, NULL),
	(146, 66, 'testando2', NULL, 'OBJ', '2', 'F', '3', 'F', NULL, '2014-06-05 16:53:14', 78, 213, NULL),
	(147, 66, 'testando2', NULL, 'OBJ', '2', 'F', '1', 'F', NULL, '2014-06-05 16:53:16', 78, 213, NULL),
	(148, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 16:53:16', 78, 213, NULL),
	(149, 66, 'testando2', NULL, 'OBJ', '2', 'F', '3', 'F', NULL, '2014-06-05 16:53:28', 78, 213, NULL),
	(150, 66, 'testando2', NULL, 'OBJ', '2', 'F', '1', 'F', NULL, '2014-06-05 16:53:30', 78, 213, NULL),
	(151, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 16:57:50', 78, 213, NULL),
	(152, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-05 16:58:05', 78, 213, NULL),
	(153, 67, 'Teste3', NULL, 'DIS', 'ok', 'F', 'dont', 'F', NULL, '2014-06-05 17:13:34', 78, 213, NULL),
	(154, 68, 'teste4', NULL, 'OBJ', '3 aki a certa', 'F', '1', 'F', NULL, '2014-06-05 17:14:22', 78, 213, NULL),
	(155, 67, 'Teste3', NULL, 'DIS', 'ok', 'F', 'oks', 'F', NULL, '2014-06-05 17:19:09', 78, 213, NULL),
	(156, 67, 'Teste3', NULL, 'DIS', 'ok', 'F', 'ok', 'T', NULL, '2014-06-05 17:19:40', 78, 213, NULL),
	(157, 68, 'teste4', NULL, 'OBJ', '3 aki a certa', 'F', '2', 'F', NULL, '2014-06-05 17:19:54', 78, 213, NULL),
	(158, 68, 'teste4', NULL, 'OBJ', '3 aki a certa', 'F', '3 aki a certa', 'T', NULL, '2014-06-05 17:20:00', 78, 213, NULL),
	(159, 69, 'teste5', NULL, 'DIS', 'a', 'F', 'b', 'F', NULL, '2014-06-05 17:21:32', 78, 213, NULL),
	(160, 69, 'teste5', NULL, 'DIS', 'a', 'F', 'bb', 'F', NULL, '2014-06-05 17:21:42', 78, 213, NULL),
	(161, 69, 'teste5', NULL, 'DIS', 'a', 'F', 'asmsa', 'F', NULL, '2014-06-05 17:22:02', 78, 213, NULL),
	(162, 69, 'teste5', NULL, 'DIS', 'a', 'F', 'a', 'T', NULL, '2014-06-05 17:22:11', 78, 213, NULL),
	(163, 65, 'testando', NULL, 'DIS', '1', 'F', '1', 'T', NULL, '2014-06-09 15:42:02', 1, 57, NULL),
	(164, 64, 'asasd', NULL, 'DIS', '1212', 'F', 'oi', 'F', NULL, '2014-06-11 14:42:57', 1, 8, NULL),
	(165, 64, 'asasd', NULL, 'DIS', '1212', 'F', '1212', 'T', NULL, '2014-06-11 14:43:35', 1, 8, NULL),
	(175, 42, 'No mundo atual, o julgamento imparcial das eventualidades possibilita uma melhor visão global do orçamento setorial.<br>', NULL, 'OBJ', 'Neste sentido, a valorização de fatores subjetivos estimula a padronização das diversas correntes de pensamento.<br>', 'F', 'Neste sentido, a valorização de fatores subjetivos estimula a padronização das diversas correntes de pensamento.<br>', 'T', NULL, '2014-06-18 16:27:00', 1, 8, 34),
	(176, 49, 'Diga oi<br>', NULL, 'DIS', 'oi', 'F', 'b', 'F', NULL, '2014-06-18 16:27:00', 1, 8, 34),
	(177, 43, 'zasdasd', NULL, 'DIS', 'asdasdasd', 'F', 'b', 'F', NULL, '2014-06-18 16:27:00', 1, 8, 34),
	(178, 64, 'asasd', NULL, 'DIS', '1212', 'F', 'er', 'F', NULL, '2014-06-20 12:12:45', 78, 214, NULL),
	(179, 64, 'asasd', NULL, 'DIS', '1212', 'F', 'qwe', 'F', NULL, '2014-06-20 12:13:13', 78, 214, NULL),
	(180, 64, 'asasd', NULL, 'DIS', '1212', 'F', '1212', 'T', NULL, '2014-06-20 12:13:52', 78, 214, NULL),
	(181, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'asd', 'F', NULL, '2014-06-20 12:16:34', 78, 214, NULL),
	(182, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'qwe123', 'T', NULL, '2014-06-20 12:17:00', 78, 214, NULL),
	(183, 51, 'Quanto é 1 + 2?<br>', NULL, 'OBJ', '3<br>', 'F', '3<br>', 'T', NULL, '2014-06-24 10:24:05', 1, 57, 36),
	(184, 53, 'Quantas letras tem a palavra Matemática?<br>', NULL, 'DIS', '10', 'F', '10', 'T', NULL, '2014-06-24 10:24:05', 1, 57, 36),
	(185, 52, 'Qual é a raiz quadrada do número 9?<br>', NULL, 'OBJ', '3<br>', 'F', '3<br>', 'T', NULL, '2014-06-24 10:24:05', 1, 57, 36),
	(186, 55, 'teste', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-25 15:18:32', 1, 8, NULL),
	(187, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'a', 'F', NULL, '2014-06-25 15:18:39', 1, 8, NULL),
	(188, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'a', 'F', NULL, '2014-06-25 15:18:59', 1, 8, NULL),
	(189, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'a', 'F', NULL, '2014-06-25 15:19:40', 1, 8, NULL),
	(190, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'a', 'F', NULL, '2014-06-25 15:20:01', 1, 8, NULL),
	(191, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'abc', 'F', NULL, '2014-06-25 15:20:04', 1, 8, NULL),
	(192, 56, 'rtestesde', NULL, 'DIS', 'qwe123', 'F', 'qwe123', 'T', NULL, '2014-06-25 15:20:59', 1, 8, NULL),
	(193, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'ui', 'F', NULL, '2014-06-25 15:23:39', 1, 8, NULL),
	(194, 57, 'testando sa coisa', NULL, 'DIS', 'e', 'F', 'e', 'T', NULL, '2014-06-25 15:23:47', 1, 8, NULL),
	(195, 9, 'Esse é um teste muito importante, para verificar se ordem das questões estão corretas.', NULL, 'OBJ', 'dsgdgfgsgsdggfsdg', 'F', 'dsfgdfgdsgdfgdsgsdg', 'F', NULL, '2014-06-25 16:00:32', 1, 59, NULL),
	(201, 69, 'teste5', NULL, 'DIS', 'a', 'F', '12', 'F', NULL, '2014-06-26 13:16:24', NULL, 57, NULL),
	(202, 69, 'teste5', NULL, 'DIS', 'a', 'F', 'a', 'T', NULL, '2014-06-26 13:16:29', NULL, 57, NULL),
	(203, 72, 'A nível organizacional, a expansão dos mercados mundiais é uma das consequências do remanejamento dos quadros funcionais.<br>', NULL, 'DIS', 'A certificação de metodologias que nos auxiliam a lidar com o início da atividade geral de formação de atitudes possibilita uma melhor visão global dos índices pretendidos.', 'F', 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o aumento do diálogo entre os diferentes setores produtivos desafia a capacidade de equalização das posturas dos órgãos dirigentes com relação às suas atribuições.', 'F', NULL, '2014-06-27 10:36:18', NULL, 110, 37),
	(204, 71, 'A prática cotidiana prova que a percepção das dificuldades possibilita uma melhor visão global do fluxo de informações.<br>', NULL, 'DIS', 'fddsfdsd', 'F', '1', 'F', NULL, '2014-06-27 11:09:15', NULL, 62, NULL),
	(205, 71, 'A prática cotidiana prova que a percepção das dificuldades possibilita uma melhor visão global do fluxo de informações.<br>', NULL, 'DIS', 'fddsfdsd', 'F', 'fddsfdsd', 'T', NULL, '2014-06-27 11:09:47', NULL, 62, NULL),
	(206, 71, 'A prática cotidiana prova que a percepção das dificuldades possibilita uma melhor visão global do fluxo de informações.<br>', NULL, 'DIS', 'fddsfdsd', 'F', 'fddsfdsd', 'T', NULL, '2014-06-27 11:19:54', NULL, 110, NULL),
	(207, 72, 'A nível organizacional, a expansão dos mercados mundiais é uma das consequências do remanejamento dos quadros funcionais.<br>', NULL, 'DIS', 'A certificação de metodologias que nos auxiliam a lidar com o início da atividade geral de formação de atitudes possibilita uma melhor visão global dos índices pretendidos.', 'F', 'A certificação de metodologias que nos auxiliam a lidar com o início da atividade geral de formação de atitudes possibilita uma melhor visão global dos índices pretendidos.', 'T', NULL, '2014-06-27 11:22:06', NULL, 110, 38),
	(208, 66, 'testando2', NULL, 'OBJ', '2', 'F', '2', 'T', NULL, '2014-06-30 10:49:47', NULL, 57, NULL),
	(209, 73, 'Caros amigos, o desafiador cenário globalizado assume importantes posições no estabelecimento das direções preferenciais no sentido do progresso.<br>', NULL, 'DIS', 'A nível organizacional, a percepção das dificuldades facilita a criação de todos os recursos funcionais envolvidos.', 'F', 'A nível organizacional, a percepção das dificuldades facilita a criação de todos os recursos funcionais envolvidos.', 'T', NULL, '2014-07-04 12:33:29', NULL, 110, NULL),
	(210, 74, 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que o consenso sobre a necessidade de qualificação ainda não demonstrou convincentemente que vai participar na mudança das diretrizes de desenvolvimento para o futuro.<br>', NULL, 'OBJ', 'É importante questionar o quanto a consulta aos diversos militantes exige a precisão e a definição das diretrizes de desenvolvimento para o futuro.<br>', 'F', 'É importante questionar o quanto a consulta aos diversos militantes exige a precisão e a definição das diretrizes de desenvolvimento para o futuro.<br>', 'T', NULL, '2014-07-04 12:33:33', NULL, 110, NULL),
	(211, 75, 'No entanto, não podemos esquecer que o início da atividade geral de formação de atitudes cumpre um papel essencial na formulação de alternativas às soluções ortodoxas.<br>', NULL, 'OBJ', 'As experiências acumuladas demonstram que a valorização de fatores subjetivos aponta para a melhoria das direções preferenciais no sentido do progresso.<br>', 'F', 'O que temos que ter sempre em mente é que o surgimento do comércio virtual pode nos levar a considerar a reestruturação das novas proposições.<br>', 'F', NULL, '2014-07-04 12:33:42', NULL, 110, NULL),
	(212, 75, 'No entanto, não podemos esquecer que o início da atividade geral de formação de atitudes cumpre um papel essencial na formulação de alternativas às soluções ortodoxas.<br>', NULL, 'OBJ', 'As experiências acumuladas demonstram que a valorização de fatores subjetivos aponta para a melhoria das direções preferenciais no sentido do progresso.<br>', 'F', 'Do mesmo modo, a consulta aos diversos militantes ainda não demonstrou convincentemente que vai participar na mudança das posturas dos órgãos dirigentes com relação às suas atribuições.<br>', 'F', NULL, '2014-07-04 12:33:45', NULL, 110, NULL),
	(213, 75, 'No entanto, não podemos esquecer que o início da atividade geral de formação de atitudes cumpre um papel essencial na formulação de alternativas às soluções ortodoxas.<br>', NULL, 'OBJ', 'As experiências acumuladas demonstram que a valorização de fatores subjetivos aponta para a melhoria das direções preferenciais no sentido do progresso.<br>', 'F', 'As experiências acumuladas demonstram que a valorização de fatores subjetivos aponta para a melhoria das direções preferenciais no sentido do progresso.<br>', 'T', NULL, '2014-07-04 12:33:47', NULL, 110, NULL),
	(214, 76, 'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos paradigmas corporativos.<br>', NULL, 'OBJ', 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual representa uma abertura para a melhoria da gestão inovadora da qual fazemos parte.<br>', 'F', 'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos paradigmas corporativos.<br>', 'F', NULL, '2014-07-04 12:33:51', NULL, 110, NULL),
	(215, 76, 'No entanto, não podemos esquecer que o acompanhamento das preferências de consumo cumpre um papel essencial na formulação dos paradigmas corporativos.<br>', NULL, 'OBJ', 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual representa uma abertura para a melhoria da gestão inovadora da qual fazemos parte.<br>', 'F', 'Nunca é demais lembrar o peso e o significado destes problemas, uma vez que a necessidade de renovação processual representa uma abertura para a melhoria da gestão inovadora da qual fazemos parte.<br>', 'T', NULL, '2014-07-04 12:33:53', NULL, 110, NULL),
	(220, 77, '<b>afdsfdsfd</b><div><b><i><br></i></b></div><div><b><i>dsfgdsgdsg</i></b></div><div><b><i><br></i></b></div><div><b><i><br></i></b></div><div style="text-align: center;"><b><i>dfsfdsfsdfag</i></b></div>', NULL, 'OBJ', '<i>safsafsaf</i>', 'F', '<i>safsafsaf</i>', 'T', NULL, '2014-07-17 10:56:36', NULL, 110, NULL),
	(221, 67, 'Teste3', NULL, 'DIS', 'ok', 'F', 'dsf', 'F', NULL, '2014-07-29 11:08:33', NULL, 57, NULL),
	(222, 68, 'teste4', NULL, 'OBJ', '3 aki a certa', 'F', '2', 'F', NULL, '2014-07-29 11:08:54', NULL, 57, NULL),
	(223, 68, 'teste4', NULL, 'OBJ', '3 aki a certa', 'F', '3 aki a certa', 'T', NULL, '2014-07-29 11:10:32', NULL, 57, NULL);
/*!40000 ALTER TABLE `respostaaluno` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.respostaalunoalternativa
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

-- Copiando dados para a tabela wiquadro.respostaalunoalternativa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `respostaalunoalternativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `respostaalunoalternativa` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.servidoroffline
DROP TABLE IF EXISTS `servidoroffline`;
CREATE TABLE IF NOT EXISTS `servidoroffline` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(120) NOT NULL,
  `Descricao` text,
  `IdCliente` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__cliente` (`IdCliente`),
  CONSTRAINT `FK__cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.servidoroffline: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `servidoroffline` DISABLE KEYS */;
INSERT INTO `servidoroffline` (`Id`, `Titulo`, `Descricao`, `IdCliente`) VALUES
	(1, 'Computador de teste Wilivro', '', 1),
	(2, 'Computador de teste Piauí', '', 1);
/*!40000 ALTER TABLE `servidoroffline` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.servidorofflinebackup
DROP TABLE IF EXISTS `servidorofflinebackup`;
CREATE TABLE IF NOT EXISTS `servidorofflinebackup` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdUsuario` int(11) NOT NULL,
  `NomeArquivoServidor` varchar(150) NOT NULL,
  `NomeArquivoOriginal` varchar(150) NOT NULL,
  `DataHoraUpload` datetime DEFAULT NULL,
  `IdServidoroffline` int(10) unsigned NOT NULL,
  `DataHoraRestauracao` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK___usuario` (`IdUsuario`),
  KEY `FK___servidoroffline` (`IdServidoroffline`),
  CONSTRAINT `FK___servidoroffline` FOREIGN KEY (`IdServidoroffline`) REFERENCES `servidoroffline` (`Id`),
  CONSTRAINT `FK___usuario` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.servidorofflinebackup: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `servidorofflinebackup` DISABLE KEYS */;
INSERT INTO `servidorofflinebackup` (`Id`, `IdUsuario`, `NomeArquivoServidor`, `NomeArquivoOriginal`, `DataHoraUpload`, `IdServidoroffline`, `DataHoraRestauracao`) VALUES
	(6, 8, '3233853b1c7933706d3.43896686.sql', 'backup.sql', '2014-06-30 17:24:51', 1, NULL);
/*!40000 ALTER TABLE `servidorofflinebackup` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.servidorofflinedado
DROP TABLE IF EXISTS `servidorofflinedado`;
CREATE TABLE IF NOT EXISTS `servidorofflinedado` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IdServidorOffline` int(10) unsigned NOT NULL,
  `Tabela` varchar(50) NOT NULL,
  `PkServidorOffline` int(10) unsigned NOT NULL,
  `PkLocal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__servidoroffline` (`IdServidorOffline`),
  CONSTRAINT `FK__servidoroffline` FOREIGN KEY (`IdServidorOffline`) REFERENCES `servidoroffline` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.servidorofflinedado: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `servidorofflinedado` DISABLE KEYS */;
INSERT INTO `servidorofflinedado` (`Id`, `IdServidorOffline`, `Tabela`, `PkServidorOffline`, `PkLocal`) VALUES
	(16, 1, 'aluno', 1, 117),
	(17, 1, 'aluno', 2, 118);
/*!40000 ALTER TABLE `servidorofflinedado` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.sincronizacao
DROP TABLE IF EXISTS `sincronizacao`;
CREATE TABLE IF NOT EXISTS `sincronizacao` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tabela` int(11) NOT NULL DEFAULT '0',
  `IdTrunk` int(11) NOT NULL DEFAULT '0',
  `IdBranch` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.sincronizacao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `sincronizacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `sincronizacao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.tipointeracao
DROP TABLE IF EXISTS `tipointeracao`;
CREATE TABLE IF NOT EXISTS `tipointeracao` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.tipointeracao: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `tipointeracao` DISABLE KEYS */;
INSERT INTO `tipointeracao` (`Id`, `Nome`) VALUES
	(1, 'Revela'),
	(2, 'Arrasta'),
	(3, 'Pergunta'),
	(4, 'Liga'),
	(5, 'Alternativa Botão'),
	(6, 'Alternativa'),
	(7, 'Key Press'),
	(8, 'Liga');
/*!40000 ALTER TABLE `tipointeracao` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.tipomidia
DROP TABLE IF EXISTS `tipomidia`;
CREATE TABLE IF NOT EXISTS `tipomidia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(50) NOT NULL,
  `RequerInteracao` enum('T','F') NOT NULL,
  `ClasseDoIcone` varchar(50) NOT NULL,
  `ExtensaoUpload` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.tipomidia: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tipomidia` DISABLE KEYS */;
INSERT INTO `tipomidia` (`Id`, `Tipo`, `RequerInteracao`, `ClasseDoIcone`, `ExtensaoUpload`) VALUES
	(1, 'TEXT', 'F', 'icon-font', NULL),
	(2, 'HTML', 'F', 'icon-font', NULL),
	(3, 'EDI', 'T', 'icon-font', NULL),
	(4, 'VIDEO', 'F', 'icon-facetime-video', NULL),
	(5, 'AUDIO', 'F', 'icon-headphones', 'mp3|wav'),
	(6, 'PDF', 'F', 'icon-file', 'pdf'),
	(7, 'SWF', 'F', 'icon-font', 'swf');
/*!40000 ALTER TABLE `tipomidia` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.tiposcamposformulario
DROP TABLE IF EXISTS `tiposcamposformulario`;
CREATE TABLE IF NOT EXISTS `tiposcamposformulario` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Label` varchar(50) NOT NULL DEFAULT '0',
  `Referencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.tiposcamposformulario: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tiposcamposformulario` DISABLE KEYS */;
INSERT INTO `tiposcamposformulario` (`Id`, `Label`, `Referencia`) VALUES
	(1, 'Texto', 'text'),
	(2, 'Parágrafo', 'textarea'),
	(3, 'Multipla escolha', 'checkbox'),
	(4, 'Caixas de seleção', 'radio'),
	(5, 'Escolha de uma lista', 'select');
/*!40000 ALTER TABLE `tiposcamposformulario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.turma
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
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Turma_Nome` (`Nome`),
  KEY `FK_turma_usuario` (`IdProfessor`),
  KEY `FK_turma_disciplina` (`IdDisciplina`),
  KEY `FK_turma_projetoescola` (`IdProjetoEscola`),
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`IdDisciplina`) REFERENCES `disciplina` (`Id`),
  CONSTRAINT `FK_turma_projetoescola` FOREIGN KEY (`IdProjetoEscola`) REFERENCES `projetoescola` (`Id`),
  CONSTRAINT `FK_turma_usuario` FOREIGN KEY (`IdProfessor`) REFERENCES `usuario` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.turma: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`Id`, `Nome`, `IdProfessor`, `Status`, `IdProjetoEscola`, `BloqueiaMidia`, `IdDisciplina`, `Horario`, `Capacidade`) VALUES
	(1, 'Turma 01', 1, 'CADASTRADA', 1, 0, 56, NULL, 0),
	(2, '204.1LL-INT', 2, 'ATIVA', 4, 1, 8, '09:00 as 13:00', 0),
	(3, 'Turma 03', 2, 'CADASTRADA', 4, 0, 4, 'NOTURNO', 0),
	(4, '2014.1M-LO32', 9, 'CADASTRADA', 5, 0, 53, 'NOTURMO', 20),
	(5, 'turma a', 9, 'CADASTRADA', 5, 0, 57, 'MATUTINO', 19),
	(6, 'turma bb', 9, 'CADASTRADA', 5, 0, 57, 'VESPERTINO', 0),
	(7, 'sadffsafdf', 9, 'CADASTRADA', 5, 0, 53, 'DIURNO', 0),
	(8, '43244343', 9, 'CADASTRADA', 5, 0, 53, '15:00 as 19:00', 0),
	(9, '0014', 10, 'CADASTRADA', 6, 0, 1, NULL, 0),
	(10, '0015', 10, 'CADASTRADA', 6, 0, 1, NULL, 0),
	(11, '2014.1LL-M', 2, 'CADASTRADA', 3, 1, 8, 'MATUTINO', 0),
	(13, '2014.2ADM', 10, 'CADASTRADA', 8, 0, 62, 'NOTURNO', 0),
	(14, 'testando', 9, 'CADASTRADA', 5, 0, 53, '2', 0),
	(15, 'turma de emmerson', 4, 'CADASTRADA', 5, 0, 57, 'MATUTINO', 15);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.turmaedc
DROP TABLE IF EXISTS `turmaedc`;
CREATE TABLE IF NOT EXISTS `turmaedc` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdTurma` int(11) NOT NULL,
  `IdEdc` int(11) unsigned NOT NULL,
  `DataInicio` date DEFAULT NULL,
  `DataFim` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK__turma` (`IdTurma`),
  KEY `FK_turmaedc_edc` (`IdEdc`),
  CONSTRAINT `FK_turmaedc_edc` FOREIGN KEY (`IdEdc`) REFERENCES `edc` (`Id`),
  CONSTRAINT `FK__turma` FOREIGN KEY (`IdTurma`) REFERENCES `turma` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.turmaedc: ~14 rows (aproximadamente)
/*!40000 ALTER TABLE `turmaedc` DISABLE KEYS */;
INSERT INTO `turmaedc` (`Id`, `IdTurma`, `IdEdc`, `DataInicio`, `DataFim`) VALUES
	(1, 8, 37, NULL, '2014-05-07'),
	(2, 8, 38, NULL, '2014-01-07'),
	(3, 8, 39, NULL, '2014-04-07'),
	(4, 7, 37, '2014-05-01', '2014-05-15'),
	(5, 4, 37, '2014-05-06', NULL),
	(6, 4, 39, NULL, '2014-05-31'),
	(7, 4, 38, NULL, '2014-05-07'),
	(8, 13, 47, '2014-05-31', '2014-06-11'),
	(9, 13, 43, '2014-05-14', '2014-06-27'),
	(10, 13, 50, '2014-07-01', '2014-07-04'),
	(11, 13, 46, '2014-07-07', '2014-07-18'),
	(12, 13, 44, '2014-05-25', '2014-07-25'),
	(13, 13, 45, '2014-07-14', '2014-07-31'),
	(14, 13, 49, '2014-06-30', '2014-07-01');
/*!40000 ALTER TABLE `turmaedc` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(32) NOT NULL,
  `Ativo` enum('T','F') NOT NULL DEFAULT 'T',
  `IdCliente` int(11) NOT NULL,
  `UniqId` varchar(50) DEFAULT NULL,
  `reqCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UI_Usuario_Email` (`Email`),
  KEY `FK_usuario_cliente` (`IdCliente`),
  CONSTRAINT `FK_usuario_cliente` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.usuario: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`Id`, `Nome`, `Email`, `Senha`, `Ativo`, `IdCliente`, `UniqId`, `reqCode`) VALUES
	(1, 'David Figueiredo', 'davidmkt@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, '{D07E978C-C2A5-EBC6-1E98-1F029C936A44}', NULL),
	(2, 'Leandro Fortaleza2', 'leandro@fortaleza.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, '{888FF35A-D040-F3BC-060A-6417674F24D5}', NULL),
	(3, 'Figueiredo', 'david@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, '{4E997C94-EEF0-4EAF-214E-42816E093FEE}', NULL),
	(4, 'Emmerson Siqueira', 'emmersonsiqueira@gmail.com', '202cb962ac59075b964b07152d234b70', 'T', 1, '{ADB857A6-D768-BBCB-1E66-95EAC57CF68D}', '537fa683d3808'),
	(8, 'WiQuadro', 'wiquadro@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 1, '{1E98170C-0FE9-5BDD-C9F7-6A7CAD49D920}', NULL),
	(9, 'Sergio', 'sergio.kalmik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 1, '{A16DFCB0-F9C6-3BE6-73FF-B4C3DFE51A45}', '537cd4ab8ca37'),
	(10, 'Deyse Jeciene', 'deyse@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, NULL, NULL),
	(11, 'a', 'va criar alunos em usuario na sua casa', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, '{5C2AF7F9-7546-1A35-5933-6D9B77F7E908}', NULL),
	(12, 'Danilo Thiago', 'danilo.t.a.oliveira@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'T', 18, '{9BCF8965-D8EE-A16F-328D-1CAE282A0053}', NULL),
	(13, 'leandro', 'leandro555@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'F', 19, '{5A1F9FC7-61AF-204C-DA7A-92AC1846FDF3}', NULL),
	(14, 'teste de usuario', 'dayane@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, NULL, NULL),
	(15, 'Antonio Sirilo', 'contato@divmaster.com.br', 'e10adc3949ba59abbe56e057f20f883e', 'T', 15, '{BBB91112-6D60-32CB-07B6-89EB16D1016D}', NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuariogrupousuario
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wiquadro.usuariogrupousuario: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariogrupousuario` DISABLE KEYS */;
INSERT INTO `usuariogrupousuario` (`Id`, `IdUsuario`, `IdGrupoUsuario`, `IdProjeto`) VALUES
	(13, 1, 1, 6),
	(7, 2, 1, 4),
	(12, 2, 1, 5),
	(11, 2, 2, 2),
	(1, 3, 3, NULL),
	(36, 4, 1, 1),
	(9, 8, 5, NULL),
	(34, 9, 1, 1),
	(19, 10, 1, 8),
	(25, 10, 1, 29),
	(38, 11, 3, NULL),
	(21, 12, 3, NULL),
	(22, 13, 3, NULL),
	(23, 14, 1, 4),
	(24, 14, 2, 5),
	(26, 15, 2, 29);
/*!40000 ALTER TABLE `usuariogrupousuario` ENABLE KEYS */;


-- Copiando estrutura para tabela wiquadro.usuariopermissaoacesso
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

-- Copiando dados para a tabela wiquadro.usuariopermissaoacesso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuariopermissaoacesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuariopermissaoacesso` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
