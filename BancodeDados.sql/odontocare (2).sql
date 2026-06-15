-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/06/2026 às 23:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `odontocare`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `idConsulta` int(11) NOT NULL,
  `dataConsulta` date NOT NULL,
  `horarioConsulta` time NOT NULL,
  `statusConsulta` varchar(30) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idProcedimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`idConsulta`, `dataConsulta`, `horarioConsulta`, `statusConsulta`, `observacoes`, `idUsuario`, `idPaciente`, `idProcedimento`) VALUES
(1, '2026-06-03', '15:15:00', 'Agendada', 'nenhuma.', 1, 4, 1),
(2, '2026-06-03', '10:40:00', 'Agendada', 'Não possui alergia;', 1, 6, 2),
(3, '2026-06-11', '09:45:00', 'Agendada', '', 1, 6, 3),
(4, '2026-07-09', '09:45:00', 'Agendada', '', 2, 7, 5),
(5, '2026-08-19', '15:15:00', 'Agendada', '', 1, 8, 4),
(6, '2026-09-29', '13:45:00', 'Agendada', '', 2, 9, 6),
(7, '2026-06-24', '14:30:00', 'Agendada', 'nenhum', 1, 6, 1),
(8, '2026-06-22', '09:15:00', 'Agendada', '', 2, 9, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `idEquipamento` int(11) NOT NULL,
  `nomeEquipamento` varchar(200) NOT NULL,
  `descricao` text DEFAULT NULL,
  `statusEquipamento` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `equipamento`
--

INSERT INTO `equipamento` (`idEquipamento`, `nomeEquipamento`, `descricao`, `statusEquipamento`) VALUES
(1, 'Raio-X Digital', 'Equipamento para exames de imagem odontológica', 'Disponível'),
(2, 'Ultrassom Odontológico', 'Equipamento utilizado para limpeza periodontal', 'Disponível'),
(3, 'Compressor Odontológico', 'Equipamento responsável pelo funcionamento de instrumentos pneumáticos', 'Em manutenção'),
(4, 'Autoclave', 'Equipamento utilizado para esterilização de instrumentos', 'Disponível');

-- --------------------------------------------------------

--
-- Estrutura para tabela `material`
--

CREATE TABLE `material` (
  `idMaterial` int(11) NOT NULL,
  `nomeMaterial` varchar(200) NOT NULL,
  `descricao` text DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `estoqueMinimo` int(11) NOT NULL,
  `unidade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `material`
--

INSERT INTO `material` (`idMaterial`, `nomeMaterial`, `descricao`, `quantidade`, `estoqueMinimo`, `unidade`) VALUES
(1, 'Luva Descartável', 'Luva para procedimentos odontológicos', 50, 20, 'Caixa'),
(2, 'Máscara Cirúrgica', 'Máscara descartável', 40, 15, 'Caixa'),
(3, 'Resina Fotopolimerizável', 'Material restaurador', 10, 3, 'Unidade'),
(4, 'Anestésico', 'Anestésico odontológico', 15, 5, 'Unidade'),
(5, 'Algodão', 'Algodão para procedimentos', 30, 10, 'Pacote');

-- --------------------------------------------------------

--
-- Estrutura para tabela `orcamento`
--

CREATE TABLE `orcamento` (
  `idOrcamento` int(11) NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `dataOrcamento` date NOT NULL,
  `statusOrcamento` varchar(30) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `idPaciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `orcamento`
--

INSERT INTO `orcamento` (`idOrcamento`, `valorTotal`, `dataOrcamento`, `statusOrcamento`, `observacoes`, `idPaciente`) VALUES
(1, 450.00, '2026-06-01', 'Aprovado', 'Orçamento para tratamento de canal.', 4),
(2, 800.00, '2026-06-05', 'Pendente', 'Orçamento para clareamento e limpeza.', 6),
(3, 280.00, '2026-06-10', 'Aprovado', 'Orçamento para extração.', 7),
(4, 1500.00, '2026-06-12', 'Cancelado', 'Orçamento para tratamento completo.', 8),
(5, 250.00, '2026-06-15', 'Aprovado', '', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `historicoOdontologico` text DEFAULT NULL,
  `alergias` text DEFAULT NULL,
  `exames` text DEFAULT NULL,
  `tratamentosAnteriores` text DEFAULT NULL,
  `prontuarioClinicoDigital` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `nome`, `cpf`, `telefone`, `email`, `cep`, `logradouro`, `numero`, `bairro`, `cidade`, `estado`, `dataNascimento`, `historicoOdontologico`, `alergias`, `exames`, `tratamentosAnteriores`, `prontuarioClinicoDigital`) VALUES
(4, 'ADLA SCHINAIDER FERREIRA', '12365478932', '32911332266', 'adlaschnneider@gmail.com', '36880041', 'rua coronel pereira sobrinho', '299', 'porto', 'Muriaé', 'MG', '1996-09-01', 'nenhum', 'Nenhuma alergia informada', 'Nenhum exame informado', 'Nenhum tratamento anterior informado', 'Nenhuma observação clínica registrada'),
(6, 'Ana Clara', '15426548633', '32988559966', 'anaclaralimadesouzafontes@gmail.com', '36880041', 'rua coronel pereira sobrinho', '410', 'Porto', 'Muriaé', 'MG', '2007-01-13', 'Paciente em tratamento ortodôntico com uso de aparelho fixo há aproximadamente 10 meses, realizando manutenções periódicas conforme orientação profissional. Relata boa adaptação ao aparelho, sem intercorrências significativas. Mantém hábitos regulares de higiene bucal, com escovação após as refeições e uso de fio dental. Não apresenta histórico de doenças sistêmicas relevantes ou alergias medicamentosas. Comparece às consultas para acompanhamento preventivo e avaliação da saúde bucal.', 'Tem alergia a anestesia.', 'Nenhum exame informado', 'Nenhum tratamento anterior informado', 'Nenhuma observação clínica registrada'),
(7, 'João Silva', '11122233345', '22988556366', 'joaosilva@gmail.com', '368811033', 'Rua Felisberto Couto', '23', 'Centro', 'Itaperuna', 'RJ', '2003-06-13', 'alergia a anestesia.', 'Nenhuma alergia informada', 'Nenhum exame informado', 'Nenhum tratamento anterior informado', 'Nenhuma observação clínica registrada'),
(8, 'Maria Oliveira', '22211133365', '32988556633', 'mariaoli@gmail.com', '26335002', 'Rua Mirai', '65', 'Centro', 'Muriaé', 'MG', '2005-05-21', 'nenhum', 'Nenhuma alergia informada', 'Nenhum exame informado', 'Nenhum tratamento anterior informado', 'Nenhuma observação clínica registrada'),
(9, 'Carlos Souza', '33311122289', '32996633508', 'carlossouza@gmail.com', '36558800', 'Rua da alegria', '22', 'centro', 'Muriaé', 'mg', '1998-11-15', 'Nenhum', 'Nenhuma alergia informada', 'Nenhum exame informado', 'Nenhum tratamento anterior informado', 'Nenhuma observação clínica registrada'),
(10, 'Silvia Torres', '33322255569', '3211663589', 'silvinhatorres@yahoo.com.br', '36547899', 'rua da felicidade', '23', 'Centro', 'Mirai', 'MG', '1998-06-03', 'Paciente realizou tratamento ortodôntico na adolescência e possui restaurações em molares.', 'Alergia à penicilina.', 'Radiografia panorâmica realizada em 15/06/2026.', 'Limpeza e restauração do dente 26.', 'Paciente apresenta boa higiene bucal, recomenda-se retorno em 6 meses para acompanhamento.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `idPagamento` int(11) NOT NULL,
  `valorTotal` decimal(10,2) NOT NULL,
  `formaPagamento` varchar(30) DEFAULT NULL,
  `statusPagamento` varchar(30) DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `idConsulta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`idPagamento`, `valorTotal`, `formaPagamento`, `statusPagamento`, `dataPagamento`, `idConsulta`) VALUES
(1, 160.00, 'Pix', 'Pago', '2026-06-01', 1),
(2, 360.00, 'Cartão de Crédito', 'Pago', '2026-06-16', 2),
(3, 900.00, 'Cartão de Débito', 'Pago', '2026-09-29', 6),
(4, 280.00, 'Pix', 'Pago', '2026-06-23', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `procedimento`
--

CREATE TABLE `procedimento` (
  `idProcedimento` int(11) NOT NULL,
  `nomeProcedimento` varchar(200) NOT NULL,
  `descricao` text DEFAULT NULL,
  `valorProcedimento` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `procedimento`
--

INSERT INTO `procedimento` (`idProcedimento`, `nomeProcedimento`, `descricao`, `valorProcedimento`) VALUES
(1, 'Limpeza', 'Limpeza odontológica simples', 160.00),
(2, 'Clareamento', 'Clareamento dental a laser.', 350.00),
(3, 'Manutenção Ortodôntica', 'Consulta realizada para acompanhamento e ajustes do aparelho ortodôntico, garantindo a correta movimentação dos dentes e a evolução do tratamento para um sorriso saudável e alinhado.', 100.00),
(4, 'Canal', 'O canal dentário, também chamado de tratamento endodôntico, é um procedimento realizado quando a polpa do dente, que contém nervos, vasos sanguíneos e tecido conectivo, está inflamada ou infectada devido a cáries profundas, traumas ou fraturas.', 450.00),
(5, 'Extração', 'A extração de dente é um procedimento odontológico indicado quando o dente está comprometido por cáries, infecções, fraturas ou problemas ortodônticos, sendo realizada com anestesia local e cuidados específicos antes e depois da cirurgia.', 280.00),
(6, 'Restauração', 'A restauração de dente é um procedimento odontológico que repara dentes danificados por cáries, fraturas ou desgaste, restaurando forma, função e estética.', 870.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(500) NOT NULL,
  `tipoUsuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `email`, `login`, `senha`, `tipoUsuario`) VALUES
(1, 'Dra. Ana', 'ana@odontocare.com', 'ana', '123', 'Dentista'),
(2, 'Dra. Larissa', 'larissa@odontocare.com', 'Larissa', '321', 'Dentista'),
(3, 'Carina', 'carina@odontocare.com', 'Carina', '123', 'Secretária'),
(4, 'Marcus', 'marcus@odontocare.com', 'Marcus', '123', 'Secretária'),
(5, 'Felipe', 'felipeadm@odontocare.com', 'Felipe', '123456', 'Administrador'),
(6, 'João', 'joaoadm@odontocare.com', 'João', '654321', 'Administrador');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`idConsulta`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idPaciente` (`idPaciente`),
  ADD KEY `idProcedimento` (`idProcedimento`);

--
-- Índices de tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`idEquipamento`);

--
-- Índices de tabela `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`idMaterial`);

--
-- Índices de tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD PRIMARY KEY (`idOrcamento`),
  ADD KEY `orcamento_ibfk_1` (`idPaciente`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idPaciente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`idPagamento`),
  ADD KEY `idConsulta` (`idConsulta`);

--
-- Índices de tabela `procedimento`
--
ALTER TABLE `procedimento`
  ADD PRIMARY KEY (`idProcedimento`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `idEquipamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `material`
--
ALTER TABLE `material`
  MODIFY `idMaterial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `orcamento`
--
ALTER TABLE `orcamento`
  MODIFY `idOrcamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `idPagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `procedimento`
--
ALTER TABLE `procedimento`
  MODIFY `idProcedimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`),
  ADD CONSTRAINT `consulta_ibfk_3` FOREIGN KEY (`idProcedimento`) REFERENCES `procedimento` (`idProcedimento`);

--
-- Restrições para tabelas `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`);

--
-- Restrições para tabelas `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idConsulta`) REFERENCES `consulta` (`idConsulta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
