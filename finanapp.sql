-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 14-03-2025 a las 02:26:25
-- Versión del servidor: 8.0.35
-- Versión de PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `finanapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address_credit_user`
--

CREATE TABLE `address_credit_user` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `condicion` enum('Propio','No propio') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tipo` enum('Domicilio','Negocio','Propio') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `principal` tinyint(1) DEFAULT NULL,
  `depatamento_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  `distrito_id` int NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `denominacion` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `latitud` decimal(10,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `address_credit_user`
--

INSERT INTO `address_credit_user` (`id`, `user_id`, `condicion`, `tipo`, `principal`, `depatamento_id`, `provincia_id`, `distrito_id`, `direccion`, `denominacion`, `latitud`) VALUES
(1, 4, 'Propio', 'Propio', 1, 1, 1, 1, 'JR. MIGUEL UNTIVEROS 314', '0', 10.20000000),
(2, 9, 'Propio', 'Propio', 1, 1, 1, 1, 'JR. MIGUEL UNTIVEROS 314', '', 0.00000000),
(3, 12, 'Propio', 'Propio', 1, 1, 1, 1, 'JR. MIGUEL UNTIVEROS 314', '', NULL),
(4, 13, 'Propio', 'Propio', 1, 1, 1, 1, 'JR. MIGUEL UNTIVEROS 314', '', NULL),
(5, 14, 'Propio', 'Propio', 1, 1, 1, 1, 'JR. MIGUEL UNTIVEROS 314', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `civil_state`
--

CREATE TABLE `civil_state` (
  `id` int NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `civil_state`
--

INSERT INTO `civil_state` (`id`, `state`) VALUES
(1, 'SOLTERO'),
(2, 'CASADO'),
(3, 'VIUDO'),
(4, 'DIVORCIADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_user`
--

CREATE TABLE `credit_user` (
  `id` int NOT NULL,
  `dni` char(8) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lastname` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `birthday` date NOT NULL,
  `civil_state` int NOT NULL,
  `occupation_id` int NOT NULL,
  `phone` int NOT NULL,
  `document` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `gender` int NOT NULL,
  `persontype` int NOT NULL,
  `asesor_id` int NOT NULL
) ;

--
-- Volcado de datos para la tabla `credit_user`
--

INSERT INTO `credit_user` (`id`, `dni`, `name`, `lastname`, `birthday`, `civil_state`, `occupation_id`, `phone`, `document`, `gender`, `persontype`, `asesor_id`) VALUES
(1, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, '', 1, 1, 0),
(2, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(3, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(4, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(5, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(6, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(7, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(8, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(9, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(10, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(11, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(12, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(13, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1),
(14, '70934108', 'efrael', 'villanueva', '2001-11-10', 1, 1, 915068001, 'asdasdasd', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `daysExcluded`
--

CREATE TABLE `daysExcluded` (
  `id` int NOT NULL,
  `days` varchar(12) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `daysExcluded`
--

INSERT INTO `daysExcluded` (`id`, `days`, `status`) VALUES
(1, 'sunday', 0),
(2, 'monday', 1),
(3, 'tuesday', 1),
(4, 'wednesday', 1),
(5, 'thursday', 1),
(6, 'friday', 1),
(7, 'saturday', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int NOT NULL DEFAULT '0',
  `slug` varchar(100) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `slug`, `nombre`) VALUES
(1, 'amazonas', 'AMAZONAS'),
(2, 'ancash', 'ANCASH'),
(3, 'apurimac', 'APURIMAC'),
(4, 'arequipa', 'AREQUIPA'),
(5, 'ayacucho', 'AYACUCHO'),
(6, 'cajamarca', 'CAJAMARCA'),
(7, 'callao', 'CALLAO'),
(8, 'cusco', 'CUSCO'),
(9, 'huancavelica', 'HUANCAVELICA'),
(10, 'huanuco', 'HUANUCO'),
(11, 'ica', 'ICA'),
(12, 'junin', 'JUNIN'),
(13, 'la-libertad', 'LA LIBERTAD'),
(14, 'lambayeque', 'LAMBAYEQUE'),
(15, 'lima', 'LIMA'),
(16, 'loreto', 'LORETO'),
(17, 'madre-de-dios', 'MADRE DE DIOS'),
(18, 'moquegua', 'MOQUEGUA'),
(19, 'pasco', 'PASCO'),
(20, 'piura', 'PIURA'),
(21, 'puno', 'PUNO'),
(22, 'san-martin', 'SAN MARTIN'),
(23, 'tacna', 'TACNA'),
(24, 'tumbes', 'TUMBES'),
(25, 'ucayali', 'UCAYALI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deuda_pendiente`
--

CREATE TABLE `deuda_pendiente` (
  `id` int NOT NULL,
  `client_id_prestamo` int NOT NULL,
  `monto_pendiente` decimal(10,2) NOT NULL,
  `monto_pagado` decimal(10,2) NOT NULL,
  `termino` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `id` int NOT NULL,
  `slug` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `provincias_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id`, `slug`, `nombre`, `provincias_id`) VALUES
(1, 'aramango', 'ARAMANGO', 1),
(2, 'copallin', 'COPALLIN', 1),
(3, 'el-parco', 'EL PARCO', 1),
(4, 'imaza', 'IMAZA', 1),
(5, 'la-peca', 'LA PECA', 1),
(6, 'chisquilla', 'CHISQUILLA', 2),
(7, 'churuja', 'CHURUJA', 2),
(8, 'corosha', 'COROSHA', 2),
(9, 'cuispes', 'CUISPES', 2),
(10, 'florida', 'FLORIDA', 2),
(11, 'jazan', 'JAZAN', 2),
(12, 'recta', 'RECTA', 2),
(13, 'san-carlos', 'SAN CARLOS', 2),
(14, 'shipasbamba', 'SHIPASBAMBA', 2),
(15, 'valera', 'VALERA', 2),
(16, 'yambrasbamba', 'YAMBRASBAMBA', 2),
(17, 'asuncion', 'ASUNCION', 3),
(18, 'balsas', 'BALSAS', 3),
(19, 'cheto', 'CHETO', 3),
(20, 'chiliquin', 'CHILIQUIN', 3),
(21, 'chuquibamba', 'CHUQUIBAMBA', 3),
(22, 'granada', 'GRANADA', 3),
(23, 'huancas', 'HUANCAS', 3),
(24, 'la-jalca', 'LA JALCA', 3),
(25, 'leimebamba', 'LEIMEBAMBA', 3),
(26, 'levanto', 'LEVANTO', 3),
(27, 'magdalena', 'MAGDALENA', 3),
(28, 'mariscal-castilla', 'MARISCAL CASTILLA', 3),
(29, 'molinopampa', 'MOLINOPAMPA', 3),
(30, 'montevideo', 'MONTEVIDEO', 3),
(31, 'olleros', 'OLLEROS', 3),
(32, 'quinjalca', 'QUINJALCA', 3),
(33, 'san-francisco-de-daguas', 'SAN FRANCISCO DE DAGUAS', 3),
(34, 'san-isidro-de-maino', 'SAN ISIDRO DE MAINO', 3),
(35, 'soloco', 'SOLOCO', 3),
(36, 'sonche', 'SONCHE', 3),
(37, 'el-cenepa', 'EL CENEPA', 4),
(38, 'rio-santiago', 'RIO SANTIAGO', 4),
(39, 'camporredondo', 'CAMPORREDONDO', 5),
(40, 'cocabamba', 'COCABAMBA', 5),
(41, 'colcamar', 'COLCAMAR', 5),
(42, 'conila', 'CONILA', 5),
(43, 'inguilpata', 'INGUILPATA', 5),
(44, 'longuita', 'LONGUITA', 5),
(45, 'lonya-chico', 'LONYA CHICO', 5),
(46, 'luya', 'LUYA', 5),
(47, 'luya-viejo', 'LUYA VIEJO', 5),
(48, 'maria', 'MARIA', 5),
(49, 'ocalli', 'OCALLI', 5),
(50, 'ocumal', 'OCUMAL', 5),
(51, 'pisuquia', 'PISUQUIA', 5),
(52, 'providencia', 'PROVIDENCIA', 5),
(53, 'san-cristobal', 'SAN CRISTOBAL', 5),
(54, 'san-francisco-de-yeso', 'SAN FRANCISCO DE YESO', 5),
(55, 'san-jeronimo', 'SAN JERONIMO', 5),
(56, 'san-juan-de-lopecancha', 'SAN JUAN DE LOPECANCHA', 5),
(57, 'santa-catalina', 'SANTA CATALINA', 5),
(58, 'santo-tomas', 'SANTO TOMAS', 5),
(59, 'tingo', 'TINGO', 5),
(60, 'trita', 'TRITA', 5),
(61, 'chirimoto', 'CHIRIMOTO', 6),
(62, 'cochamal', 'COCHAMAL', 6),
(63, 'huambo', 'HUAMBO', 6),
(64, 'limabamba', 'LIMABAMBA', 6),
(65, 'longar', 'LONGAR', 6),
(66, 'mariscal-benavides', 'MARISCAL BENAVIDES', 6),
(67, 'milpucc', 'MILPUCC', 6),
(68, 'omia', 'OMIA', 6),
(69, 'santa-rosa', 'SANTA ROSA', 6),
(70, 'totora', 'TOTORA', 6),
(71, 'vista-alegre', 'VISTA ALEGRE', 6),
(72, 'cajaruro', 'CAJARURO', 7),
(73, 'cumba', 'CUMBA', 7),
(74, 'el-milagro', 'EL MILAGRO', 7),
(75, 'jamalca', 'JAMALCA', 7),
(76, 'lonya-grande', 'LONYA GRANDE', 7),
(77, 'yamon', 'YAMON', 7),
(78, 'coris', 'CORIS', 8),
(79, 'huacllan', 'HUACLLAN', 8),
(80, 'la-merced', 'LA MERCED', 8),
(81, 'succha', 'SUCCHA', 8),
(82, 'aczo', 'ACZO', 9),
(83, 'chaccho', 'CHACCHO', 9),
(84, 'chingas', 'CHINGAS', 9),
(85, 'mirgas', 'MIRGAS', 9),
(86, 'san-juan-de-rontoy', 'SAN JUAN DE RONTOY', 9),
(87, 'acochaca', 'ACOCHACA', 10),
(88, 'abelardo-pardo-lezameta', 'ABELARDO PARDO LEZAMETA', 11),
(89, 'antonio-raimondi', 'ANTONIO RAIMONDI', 11),
(90, 'aquia', 'AQUIA', 11),
(91, 'cajacay', 'CAJACAY', 11),
(92, 'canis', 'CANIS', 11),
(93, 'colquioc', 'COLQUIOC', 11),
(94, 'huallanca', 'HUALLANCA', 11),
(95, 'huasta', 'HUASTA', 11),
(96, 'huayllacayan', 'HUAYLLACAYAN', 11),
(97, 'la-primavera', 'LA PRIMAVERA', 11),
(98, 'mangas', 'MANGAS', 11),
(99, 'pacllon', 'PACLLON', 11),
(100, 'san-miguel-de-corpanqui', 'SAN MIGUEL DE CORPANQUI', 11),
(101, 'ticllos', 'TICLLOS', 11),
(102, 'acopampa', 'ACOPAMPA', 12),
(103, 'amashca', 'AMASHCA', 12),
(104, 'anta', 'ANTA', 12),
(105, 'ataquero', 'ATAQUERO', 12),
(106, 'marcara', 'MARCARA', 12),
(107, 'pariahuanca', 'PARIAHUANCA', 12),
(108, 'san-miguel-de-aco', 'SAN MIGUEL DE ACO', 12),
(109, 'shilla', 'SHILLA', 12),
(110, 'tinco', 'TINCO', 12),
(111, 'yungar', 'YUNGAR', 12),
(112, 'san-nicolas', 'SAN NICOLAS', 13),
(113, 'yauya', 'YAUYA', 13),
(114, 'buena-vista-alta', 'BUENA VISTA ALTA', 14),
(115, 'comandante-noel', 'COMANDANTE NOEL', 14),
(116, 'yautan', 'YAUTAN', 14),
(117, 'aco', 'ACO', 15),
(118, 'bambas', 'BAMBAS', 15),
(119, 'cusca', 'CUSCA', 15),
(120, 'la-pampa', 'LA PAMPA', 15),
(121, 'yanac', 'YANAC', 15),
(122, 'yupan', 'YUPAN', 15),
(123, 'cochabamba', 'COCHABAMBA', 16),
(124, 'colcabamba', 'COLCABAMBA', 16),
(125, 'huanchay', 'HUANCHAY', 16),
(126, 'independencia', 'INDEPENDENCIA', 16),
(127, 'jangas', 'JANGAS', 16),
(128, 'la-libertad', 'LA LIBERTAD', 16),
(129, 'olleros', 'OLLEROS', 16),
(130, 'pampas', 'PAMPAS', 16),
(131, 'pariacoto', 'PARIACOTO', 16),
(132, 'pira', 'PIRA', 16),
(133, 'tarica', 'TARICA', 16),
(134, 'anra', 'ANRA', 17),
(135, 'cajay', 'CAJAY', 17),
(136, 'chavin-de-huantar', 'CHAVIN DE HUANTAR', 17),
(137, 'huacachi', 'HUACACHI', 17),
(138, 'huacchis', 'HUACCHIS', 17),
(139, 'huachis', 'HUACHIS', 17),
(140, 'huantar', 'HUANTAR', 17),
(141, 'masin', 'MASIN', 17),
(142, 'paucas', 'PAUCAS', 17),
(143, 'ponto', 'PONTO', 17),
(144, 'rahuapampa', 'RAHUAPAMPA', 17),
(145, 'rapayan', 'RAPAYAN', 17),
(146, 'san-marcos', 'SAN MARCOS', 17),
(147, 'san-pedro-de-chana', 'SAN PEDRO DE CHANA', 17),
(148, 'uco', 'UCO', 17),
(149, 'cochapeti', 'COCHAPETI', 18),
(150, 'culebras', 'CULEBRAS', 18),
(151, 'huayan', 'HUAYAN', 18),
(152, 'malvas', 'MALVAS', 18),
(153, 'huallanca', 'HUALLANCA', 19),
(154, 'huata', 'HUATA', 19),
(155, 'huaylas', 'HUAYLAS', 19),
(156, 'mato', 'MATO', 19),
(157, 'pamparomas', 'PAMPAROMAS', 19),
(158, 'pueblo-libre', 'PUEBLO LIBRE', 19),
(159, 'santa-cruz', 'SANTA CRUZ', 19),
(160, 'santo-toribio', 'SANTO TORIBIO', 19),
(161, 'yuracmarca', 'YURACMARCA', 19),
(162, 'casca', 'CASCA', 20),
(163, 'eleazar-guzman-barron', 'ELEAZAR GUZMAN BARRON', 20),
(164, 'fidel-olivas-escudero', 'FIDEL OLIVAS ESCUDERO', 20),
(165, 'llama', 'LLAMA', 20),
(166, 'llumpa', 'LLUMPA', 20),
(167, 'lucma', 'LUCMA', 20),
(168, 'musga', 'MUSGA', 20),
(169, 'acas', 'ACAS', 21),
(170, 'cajamarquilla', 'CAJAMARQUILLA', 21),
(171, 'carhuapampa', 'CARHUAPAMPA', 21),
(172, 'cochas', 'COCHAS', 21),
(173, 'congas', 'CONGAS', 21),
(174, 'llipa', 'LLIPA', 21),
(175, 'san-cristobal-de-rajan', 'SAN CRISTOBAL DE RAJAN', 21),
(176, 'san-pedro', 'SAN PEDRO', 21),
(177, 'santiago-de-chilcas', 'SANTIAGO DE CHILCAS', 21),
(178, 'bolognesi', 'BOLOGNESI', 22),
(179, 'conchucos', 'CONCHUCOS', 22),
(180, 'huacaschuque', 'HUACASCHUQUE', 22),
(181, 'huandoval', 'HUANDOVAL', 22),
(182, 'lacabamba', 'LACABAMBA', 22),
(183, 'llapo', 'LLAPO', 22),
(184, 'pallasca', 'PALLASCA', 22),
(185, 'pampas', 'PAMPAS', 22),
(186, 'santa-rosa', 'SANTA ROSA', 22),
(187, 'tauca', 'TAUCA', 22),
(188, 'huayllan', 'HUAYLLAN', 23),
(189, 'parobamba', 'PAROBAMBA', 23),
(190, 'quinuabamba', 'QUINUABAMBA', 23),
(191, 'catac', 'CATAC', 24),
(192, 'cotaparaco', 'COTAPARACO', 24),
(193, 'huayllapampa', 'HUAYLLAPAMPA', 24),
(194, 'llacllin', 'LLACLLIN', 24),
(195, 'marca', 'MARCA', 24),
(196, 'pampas-chico', 'PAMPAS CHICO', 24),
(197, 'pararin', 'PARARIN', 24),
(198, 'tapacocha', 'TAPACOCHA', 24),
(199, 'ticapampa', 'TICAPAMPA', 24),
(200, 'caceres-del-peru', 'CACERES DEL PERU', 25),
(201, 'coishco', 'COISHCO', 25),
(202, 'macate', 'MACATE', 25),
(203, 'moro', 'MORO', 25),
(204, 'nepea', 'NEPEÑA', 25),
(205, 'nuevo-chimbote', 'NUEVO CHIMBOTE', 25),
(206, 'samanco', 'SAMANCO', 25),
(207, 'santa', 'SANTA', 25),
(208, 'acobamba', 'ACOBAMBA', 26),
(209, 'alfonso-ugarte', 'ALFONSO UGARTE', 26),
(210, 'cashapampa', 'CASHAPAMPA', 26),
(211, 'chingalpo', 'CHINGALPO', 26),
(212, 'huayllabamba', 'HUAYLLABAMBA', 26),
(213, 'quiches', 'QUICHES', 26),
(214, 'ragash', 'RAGASH', 26),
(215, 'san-juan', 'SAN JUAN', 26),
(216, 'sicsibamba', 'SICSIBAMBA', 26),
(217, 'cascapara', 'CASCAPARA', 27),
(218, 'mancos', 'MANCOS', 27),
(219, 'matacoto', 'MATACOTO', 27),
(220, 'quillo', 'QUILLO', 27),
(221, 'ranrahirca', 'RANRAHIRCA', 27),
(222, 'shupluy', 'SHUPLUY', 27),
(223, 'yanama', 'YANAMA', 27),
(224, 'chacoche', 'CHACOCHE', 28),
(225, 'circa', 'CIRCA', 28),
(226, 'curahuasi', 'CURAHUASI', 28),
(227, 'huanipaca', 'HUANIPACA', 28),
(228, 'lambrama', 'LAMBRAMA', 28),
(229, 'pichirhua', 'PICHIRHUA', 28),
(230, 'san-pedro-de-cachora', 'SAN PEDRO DE CACHORA', 28),
(231, 'tamburco', 'TAMBURCO', 28),
(232, 'andarapa', 'ANDARAPA', 29),
(233, 'chiara', 'CHIARA', 29),
(234, 'huancarama', 'HUANCARAMA', 29),
(235, 'huancaray', 'HUANCARAY', 29),
(236, 'huayana', 'HUAYANA', 29),
(237, 'jose-maria-arguedas', 'JOSE MARIA ARGUEDAS', 29),
(238, 'kaquiabamba', 'KAQUIABAMBA', 29),
(239, 'kishuara', 'KISHUARA', 29),
(240, 'pacobamba', 'PACOBAMBA', 29),
(241, 'pacucha', 'PACUCHA', 29),
(242, 'pampachiri', 'PAMPACHIRI', 29),
(243, 'pomacocha', 'POMACOCHA', 29),
(244, 'san-antonio-de-cachi', 'SAN ANTONIO DE CACHI', 29),
(245, 'san-jeronimo', 'SAN JERONIMO', 29),
(246, 'san-miguel-de-chaccrampa', 'SAN MIGUEL DE CHACCRAMPA', 29),
(247, 'santa-maria-de-chicmo', 'SANTA MARIA DE CHICMO', 29),
(248, 'talavera', 'TALAVERA', 29),
(249, 'tumay-huaraca', 'TUMAY HUARACA', 29),
(250, 'turpo', 'TURPO', 29),
(251, 'el-oro', 'EL ORO', 30),
(252, 'huaquirca', 'HUAQUIRCA', 30),
(253, 'juan-espinoza-medrano', 'JUAN ESPINOZA MEDRANO', 30),
(254, 'oropesa', 'OROPESA', 30),
(255, 'pachaconas', 'PACHACONAS', 30),
(256, 'sabaino', 'SABAINO', 30),
(257, 'capaya', 'CAPAYA', 31),
(258, 'caraybamba', 'CARAYBAMBA', 31),
(259, 'chapimarca', 'CHAPIMARCA', 31),
(260, 'colcabamba', 'COLCABAMBA', 31),
(261, 'cotaruse', 'COTARUSE', 31),
(262, 'huayllo', 'HUAYLLO', 31),
(263, 'justo-apu-sahuaraura', 'JUSTO APU SAHUARAURA', 31),
(264, 'lucre', 'LUCRE', 31),
(265, 'pocohuanca', 'POCOHUANCA', 31),
(266, 'san-juan-de-chaca', 'SAN JUAN DE CHACÑA', 31),
(267, 'saayca', 'SAÑAYCA', 31),
(268, 'soraya', 'SORAYA', 31),
(269, 'tapairihua', 'TAPAIRIHUA', 31),
(270, 'tintay', 'TINTAY', 31),
(271, 'toraya', 'TORAYA', 31),
(272, 'yanaca', 'YANACA', 31),
(273, 'anco-huallo', 'ANCO HUALLO', 32),
(274, 'cocharcas', 'COCHARCAS', 32),
(275, 'el-porvenir', 'EL PORVENIR', 32),
(276, 'huaccana', 'HUACCANA', 32),
(277, 'los-chankas', 'LOS CHANKAS', 32),
(278, 'ocobamba', 'OCOBAMBA', 32),
(279, 'ongoy', 'ONGOY', 32),
(280, 'ranracancha', 'RANRACANCHA', 32),
(281, 'rocchacc', 'ROCCHACC', 32),
(282, 'uranmarca', 'URANMARCA', 32),
(283, 'challhuahuacho', 'CHALLHUAHUACHO', 33),
(284, 'cotabambas', 'COTABAMBAS', 33),
(285, 'coyllurqui', 'COYLLURQUI', 33),
(286, 'haquira', 'HAQUIRA', 33),
(287, 'mara', 'MARA', 33),
(288, 'curasco', 'CURASCO', 34),
(289, 'curpahuasi', 'CURPAHUASI', 34),
(290, 'huaillati', 'HUAILLATI', 34),
(291, 'mamara', 'MAMARA', 34),
(292, 'mariscal-gamarra', 'MARISCAL GAMARRA', 34),
(293, 'micaela-bastidas', 'MICAELA BASTIDAS', 34),
(294, 'pataypampa', 'PATAYPAMPA', 34),
(295, 'progreso', 'PROGRESO', 34),
(296, 'san-antonio', 'SAN ANTONIO', 34),
(297, 'santa-rosa', 'SANTA ROSA', 34),
(298, 'turpay', 'TURPAY', 34),
(299, 'vilcabamba', 'VILCABAMBA', 34),
(300, 'virundo', 'VIRUNDO', 34),
(301, 'alto-selva-alegre', 'ALTO SELVA ALEGRE', 35),
(302, 'cayma', 'CAYMA', 35),
(303, 'cerro-colorado', 'CERRO COLORADO', 35),
(304, 'characato', 'CHARACATO', 35),
(305, 'chiguata', 'CHIGUATA', 35),
(306, 'jacobo-hunter', 'JACOBO HUNTER', 35),
(307, 'jose-luis-bustamante-y-rivero', 'JOSE LUIS BUSTAMANTE Y RIVERO', 35),
(308, 'la-joya', 'LA JOYA', 35),
(309, 'mariano-melgar', 'MARIANO MELGAR', 35),
(310, 'miraflores', 'MIRAFLORES', 35),
(311, 'mollebaya', 'MOLLEBAYA', 35),
(312, 'paucarpata', 'PAUCARPATA', 35),
(313, 'pocsi', 'POCSI', 35),
(314, 'polobaya', 'POLOBAYA', 35),
(315, 'quequea', 'QUEQUEÑA', 35),
(316, 'sabandia', 'SABANDIA', 35),
(317, 'sachaca', 'SACHACA', 35),
(318, 'san-juan-de-siguas', 'SAN JUAN DE SIGUAS', 35),
(319, 'san-juan-de-tarucani', 'SAN JUAN DE TARUCANI', 35),
(320, 'santa-isabel-de-siguas', 'SANTA ISABEL DE SIGUAS', 35),
(321, 'santa-rita-de-sihuas', 'SANTA RITA DE SIHUAS', 35),
(322, 'socabaya', 'SOCABAYA', 35),
(323, 'tiabaya', 'TIABAYA', 35),
(324, 'uchumayo', 'UCHUMAYO', 35),
(325, 'vitor', 'VITOR', 35),
(326, 'yanahuara', 'YANAHUARA', 35),
(327, 'yarabamba', 'YARABAMBA', 35),
(328, 'yura', 'YURA', 35),
(329, 'jose-maria-quimper', 'JOSE MARIA QUIMPER', 36),
(330, 'mariano-nicolas-valcarcel', 'MARIANO NICOLAS VALCARCEL', 36),
(331, 'mariscal-caceres', 'MARISCAL CACERES', 36),
(332, 'nicolas-de-pierola', 'NICOLAS DE PIEROLA', 36),
(333, 'ocoa', 'OCOÑA', 36),
(334, 'quilca', 'QUILCA', 36),
(335, 'samuel-pastor', 'SAMUEL PASTOR', 36),
(336, 'acari', 'ACARI', 37),
(337, 'atico', 'ATICO', 37),
(338, 'atiquipa', 'ATIQUIPA', 37),
(339, 'bella-union', 'BELLA UNION', 37),
(340, 'cahuacho', 'CAHUACHO', 37),
(341, 'chala', 'CHALA', 37),
(342, 'chaparra', 'CHAPARRA', 37),
(343, 'huanuhuanu', 'HUANUHUANU', 37),
(344, 'jaqui', 'JAQUI', 37),
(345, 'lomas', 'LOMAS', 37),
(346, 'quicacha', 'QUICACHA', 37),
(347, 'yauca', 'YAUCA', 37),
(348, 'andagua', 'ANDAGUA', 38),
(349, 'ayo', 'AYO', 38),
(350, 'chachas', 'CHACHAS', 38),
(351, 'chilcaymarca', 'CHILCAYMARCA', 38),
(352, 'choco', 'CHOCO', 38),
(353, 'huancarqui', 'HUANCARQUI', 38),
(354, 'machaguay', 'MACHAGUAY', 38),
(355, 'orcopampa', 'ORCOPAMPA', 38),
(356, 'pampacolca', 'PAMPACOLCA', 38),
(357, 'tipan', 'TIPAN', 38),
(358, 'uon', 'UÑON', 38),
(359, 'uraca', 'URACA', 38),
(360, 'viraco', 'VIRACO', 38),
(361, 'achoma', 'ACHOMA', 39),
(362, 'cabanaconde', 'CABANACONDE', 39),
(363, 'callalli', 'CALLALLI', 39),
(364, 'caylloma', 'CAYLLOMA', 39),
(365, 'coporaque', 'COPORAQUE', 39),
(366, 'huambo', 'HUAMBO', 39),
(367, 'huanca', 'HUANCA', 39),
(368, 'ichupampa', 'ICHUPAMPA', 39),
(369, 'lari', 'LARI', 39),
(370, 'lluta', 'LLUTA', 39),
(371, 'maca', 'MACA', 39),
(372, 'madrigal', 'MADRIGAL', 39),
(373, 'majes', 'MAJES', 39),
(374, 'san-antonio-de-chuca', 'SAN ANTONIO DE CHUCA', 39),
(375, 'sibayo', 'SIBAYO', 39),
(376, 'tapay', 'TAPAY', 39),
(377, 'tisco', 'TISCO', 39),
(378, 'tuti', 'TUTI', 39),
(379, 'yanque', 'YANQUE', 39),
(380, 'andaray', 'ANDARAY', 40),
(381, 'cayarani', 'CAYARANI', 40),
(382, 'chichas', 'CHICHAS', 40),
(383, 'iray', 'IRAY', 40),
(384, 'rio-grande', 'RIO GRANDE', 40),
(385, 'salamanca', 'SALAMANCA', 40),
(386, 'yanaquihua', 'YANAQUIHUA', 40),
(387, 'cocachacra', 'COCACHACRA', 41),
(388, 'dean-valdivia', 'DEAN VALDIVIA', 41),
(389, 'islay', 'ISLAY', 41),
(390, 'mejia', 'MEJIA', 41),
(391, 'punta-de-bombon', 'PUNTA DE BOMBON', 41),
(392, 'alca', 'ALCA', 42),
(393, 'charcana', 'CHARCANA', 42),
(394, 'huaynacotas', 'HUAYNACOTAS', 42),
(395, 'pampamarca', 'PAMPAMARCA', 42),
(396, 'puyca', 'PUYCA', 42),
(397, 'quechualla', 'QUECHUALLA', 42),
(398, 'sayla', 'SAYLA', 42),
(399, 'tauria', 'TAURIA', 42),
(400, 'tomepampa', 'TOMEPAMPA', 42),
(401, 'toro', 'TORO', 42),
(402, 'chuschi', 'CHUSCHI', 43),
(403, 'los-morochucos', 'LOS MOROCHUCOS', 43),
(404, 'maria-parado-de-bellido', 'MARIA PARADO DE BELLIDO', 43),
(405, 'paras', 'PARAS', 43),
(406, 'totos', 'TOTOS', 43),
(407, 'acocro', 'ACOCRO', 44),
(408, 'acos-vinchos', 'ACOS VINCHOS', 44),
(409, 'andres-avelino-caceres', 'ANDRES AVELINO CACERES', 44),
(410, 'carmen-alto', 'CARMEN ALTO', 44),
(411, 'chiara', 'CHIARA', 44),
(412, 'jesus-nazareno', 'JESUS NAZARENO', 44),
(413, 'ocros', 'OCROS', 44),
(414, 'pacaycasa', 'PACAYCASA', 44),
(415, 'quinua', 'QUINUA', 44),
(416, 'san-jose-de-ticllas', 'SAN JOSE DE TICLLAS', 44),
(417, 'san-juan-bautista', 'SAN JUAN BAUTISTA', 44),
(418, 'santiago-de-pischa', 'SANTIAGO DE PISCHA', 44),
(419, 'socos', 'SOCOS', 44),
(420, 'tambillo', 'TAMBILLO', 44),
(421, 'vinchos', 'VINCHOS', 44),
(422, 'carapo', 'CARAPO', 45),
(423, 'sacsamarca', 'SACSAMARCA', 45),
(424, 'santiago-de-lucanamarca', 'SANTIAGO DE LUCANAMARCA', 45),
(425, 'ayahuanco', 'AYAHUANCO', 46),
(426, 'canayre', 'CANAYRE', 46),
(427, 'chaca', 'CHACA', 46),
(428, 'huamanguilla', 'HUAMANGUILLA', 46),
(429, 'iguain', 'IGUAIN', 46),
(430, 'llochegua', 'LLOCHEGUA', 46),
(431, 'luricocha', 'LURICOCHA', 46),
(432, 'pucacolpa', 'PUCACOLPA', 46),
(433, 'santillana', 'SANTILLANA', 46),
(434, 'sivia', 'SIVIA', 46),
(435, 'uchuraccay', 'UCHURACCAY', 46),
(436, 'anchihuay', 'ANCHIHUAY', 47),
(437, 'anco', 'ANCO', 47),
(438, 'ayna', 'AYNA', 47),
(439, 'chilcas', 'CHILCAS', 47),
(440, 'chungui', 'CHUNGUI', 47),
(441, 'luis-carranza', 'LUIS CARRANZA', 47),
(442, 'oronccoy', 'ORONCCOY', 47),
(443, 'samugari', 'SAMUGARI', 47),
(444, 'santa-rosa', 'SANTA ROSA', 47),
(445, 'tambo', 'TAMBO', 47),
(446, 'aucara', 'AUCARA', 48),
(447, 'cabana', 'CABANA', 48),
(448, 'carmen-salcedo', 'CARMEN SALCEDO', 48),
(449, 'chavia', 'CHAVIÑA', 48),
(450, 'chipao', 'CHIPAO', 48),
(451, 'huac-huas', 'HUAC-HUAS', 48),
(452, 'laramate', 'LARAMATE', 48),
(453, 'leoncio-prado', 'LEONCIO PRADO', 48),
(454, 'llauta', 'LLAUTA', 48),
(455, 'lucanas', 'LUCANAS', 48),
(456, 'ocaa', 'OCAÑA', 48),
(457, 'otoca', 'OTOCA', 48),
(458, 'saisa', 'SAISA', 48),
(459, 'san-cristobal', 'SAN CRISTOBAL', 48),
(460, 'san-juan', 'SAN JUAN', 48),
(461, 'san-pedro', 'SAN PEDRO', 48),
(462, 'san-pedro-de-palco', 'SAN PEDRO DE PALCO', 48),
(463, 'sancos', 'SANCOS', 48),
(464, 'santa-ana-de-huaycahuacho', 'SANTA ANA DE HUAYCAHUACHO', 48),
(465, 'santa-lucia', 'SANTA LUCIA', 48),
(466, 'chumpi', 'CHUMPI', 49),
(467, 'coronel-castaeda', 'CORONEL CASTAÑEDA', 49),
(468, 'pacapausa', 'PACAPAUSA', 49),
(469, 'pullo', 'PULLO', 49),
(470, 'puyusca', 'PUYUSCA', 49),
(471, 'san-francisco-de-ravacayco', 'SAN FRANCISCO DE RAVACAYCO', 49),
(472, 'upahuacho', 'UPAHUACHO', 49),
(473, 'colta', 'COLTA', 50),
(474, 'corculla', 'CORCULLA', 50),
(475, 'lampa', 'LAMPA', 50),
(476, 'marcabamba', 'MARCABAMBA', 50),
(477, 'oyolo', 'OYOLO', 50),
(478, 'pararca', 'PARARCA', 50),
(479, 'san-javier-de-alpabamba', 'SAN JAVIER DE ALPABAMBA', 50),
(480, 'san-jose-de-ushua', 'SAN JOSE DE USHUA', 50),
(481, 'sara-sara', 'SARA SARA', 50),
(482, 'belen', 'BELEN', 51),
(483, 'chalcos', 'CHALCOS', 51),
(484, 'chilcayoc', 'CHILCAYOC', 51),
(485, 'huacaa', 'HUACAÑA', 51),
(486, 'morcolla', 'MORCOLLA', 51),
(487, 'paico', 'PAICO', 51),
(488, 'san-pedro-de-larcay', 'SAN PEDRO DE LARCAY', 51),
(489, 'san-salvador-de-quije', 'SAN SALVADOR DE QUIJE', 51),
(490, 'santiago-de-paucaray', 'SANTIAGO DE PAUCARAY', 51),
(491, 'soras', 'SORAS', 51),
(492, 'alcamenca', 'ALCAMENCA', 52),
(493, 'apongo', 'APONGO', 52),
(494, 'asquipata', 'ASQUIPATA', 52),
(495, 'canaria', 'CANARIA', 52),
(496, 'cayara', 'CAYARA', 52),
(497, 'colca', 'COLCA', 52),
(498, 'hualla', 'HUALLA', 52),
(499, 'huamanquiquia', 'HUAMANQUIQUIA', 52),
(500, 'huancaraylla', 'HUANCARAYLLA', 52),
(501, 'sarhua', 'SARHUA', 52),
(502, 'vilcanchos', 'VILCANCHOS', 52),
(503, 'accomarca', 'ACCOMARCA', 53),
(504, 'carhuanca', 'CARHUANCA', 53),
(505, 'concepcion', 'CONCEPCION', 53),
(506, 'huambalpa', 'HUAMBALPA', 53),
(507, 'independencia', 'INDEPENDENCIA', 53),
(508, 'saurama', 'SAURAMA', 53),
(509, 'vischongo', 'VISCHONGO', 53),
(510, 'cachachi', 'CACHACHI', 54),
(511, 'condebamba', 'CONDEBAMBA', 54),
(512, 'sitacocha', 'SITACOCHA', 54),
(513, 'asuncion', 'ASUNCION', 55),
(514, 'chetilla', 'CHETILLA', 55),
(515, 'cospan', 'COSPAN', 55),
(516, 'encaada', 'ENCAÑADA', 55),
(517, 'jesus', 'JESUS', 55),
(518, 'llacanora', 'LLACANORA', 55),
(519, 'los-baos-del-inca', 'LOS BAÑOS DEL INCA', 55),
(520, 'magdalena', 'MAGDALENA', 55),
(521, 'matara', 'MATARA', 55),
(522, 'namora', 'NAMORA', 55),
(523, 'san-juan', 'SAN JUAN', 55),
(524, 'chumuch', 'CHUMUCH', 56),
(525, 'cortegana', 'CORTEGANA', 56),
(526, 'huasmin', 'HUASMIN', 56),
(527, 'jorge-chavez', 'JORGE CHAVEZ', 56),
(528, 'jose-galvez', 'JOSE GALVEZ', 56),
(529, 'la-libertad-de-pallan', 'LA LIBERTAD DE PALLAN', 56),
(530, 'miguel-iglesias', 'MIGUEL IGLESIAS', 56),
(531, 'oxamarca', 'OXAMARCA', 56),
(532, 'sorochuco', 'SOROCHUCO', 56),
(533, 'sucre', 'SUCRE', 56),
(534, 'utco', 'UTCO', 56),
(535, 'anguia', 'ANGUIA', 57),
(536, 'chadin', 'CHADIN', 57),
(537, 'chalamarca', 'CHALAMARCA', 57),
(538, 'chiguirip', 'CHIGUIRIP', 57),
(539, 'chimban', 'CHIMBAN', 57),
(540, 'choropampa', 'CHOROPAMPA', 57),
(541, 'cochabamba', 'COCHABAMBA', 57),
(542, 'conchan', 'CONCHAN', 57),
(543, 'huambos', 'HUAMBOS', 57),
(544, 'lajas', 'LAJAS', 57),
(545, 'llama', 'LLAMA', 57),
(546, 'miracosta', 'MIRACOSTA', 57),
(547, 'paccha', 'PACCHA', 57),
(548, 'pion', 'PION', 57),
(549, 'querocoto', 'QUEROCOTO', 57),
(550, 'san-juan-de-licupis', 'SAN JUAN DE LICUPIS', 57),
(551, 'tacabamba', 'TACABAMBA', 57),
(552, 'tocmoche', 'TOCMOCHE', 57),
(553, 'chilete', 'CHILETE', 58),
(554, 'cupisnique', 'CUPISNIQUE', 58),
(555, 'guzmango', 'GUZMANGO', 58),
(556, 'san-benito', 'SAN BENITO', 58),
(557, 'santa-cruz-de-toled', 'SANTA CRUZ DE TOLED', 58),
(558, 'tantarica', 'TANTARICA', 58),
(559, 'yonan', 'YONAN', 58),
(560, 'callayuc', 'CALLAYUC', 59),
(561, 'choros', 'CHOROS', 59),
(562, 'cujillo', 'CUJILLO', 59),
(563, 'la-ramada', 'LA RAMADA', 59),
(564, 'pimpingos', 'PIMPINGOS', 59),
(565, 'querocotillo', 'QUEROCOTILLO', 59),
(566, 'san-andres-de-cutervo', 'SAN ANDRES DE CUTERVO', 59),
(567, 'san-juan-de-cutervo', 'SAN JUAN DE CUTERVO', 59),
(568, 'san-luis-de-lucma', 'SAN LUIS DE LUCMA', 59),
(569, 'santa-cruz', 'SANTA CRUZ', 59),
(570, 'santo-domingo-de-la-capilla', 'SANTO DOMINGO DE LA CAPILLA', 59),
(571, 'santo-tomas', 'SANTO TOMAS', 59),
(572, 'socota', 'SOCOTA', 59),
(573, 'toribio-casanova', 'TORIBIO CASANOVA', 59),
(574, 'chugur', 'CHUGUR', 60),
(575, 'hualgayoc', 'HUALGAYOC', 60),
(576, 'bellavista', 'BELLAVISTA', 61),
(577, 'chontali', 'CHONTALI', 61),
(578, 'colasay', 'COLASAY', 61),
(579, 'huabal', 'HUABAL', 61),
(580, 'las-pirias', 'LAS PIRIAS', 61),
(581, 'pomahuaca', 'POMAHUACA', 61),
(582, 'pucara', 'PUCARA', 61),
(583, 'sallique', 'SALLIQUE', 61),
(584, 'san-felipe', 'SAN FELIPE', 61),
(585, 'san-jose-del-alto', 'SAN JOSE DEL ALTO', 61),
(586, 'santa-rosa', 'SANTA ROSA', 61),
(587, 'chirinos', 'CHIRINOS', 62),
(588, 'huarango', 'HUARANGO', 62),
(589, 'la-coipa', 'LA COIPA', 62),
(590, 'namballe', 'NAMBALLE', 62),
(591, 'san-jose-de-lourdes', 'SAN JOSE DE LOURDES', 62),
(592, 'tabaconas', 'TABACONAS', 62),
(593, 'chancay', 'CHANCAY', 63),
(594, 'eduardo-villanueva', 'EDUARDO VILLANUEVA', 63),
(595, 'gregorio-pita', 'GREGORIO PITA', 63),
(596, 'ichocan', 'ICHOCAN', 63),
(597, 'jose-manuel-quiroz', 'JOSE MANUEL QUIROZ', 63),
(598, 'jose-sabogal', 'JOSE SABOGAL', 63),
(599, 'bolivar', 'BOLIVAR', 64),
(600, 'calquis', 'CALQUIS', 64),
(601, 'catilluc', 'CATILLUC', 64),
(602, 'el-prado', 'EL PRADO', 64),
(603, 'la-florida', 'LA FLORIDA', 64),
(604, 'llapa', 'LLAPA', 64),
(605, 'nanchoc', 'NANCHOC', 64),
(606, 'niepos', 'NIEPOS', 64),
(607, 'san-gregorio', 'SAN GREGORIO', 64),
(608, 'san-silvestre-de-cochan', 'SAN SILVESTRE DE COCHAN', 64),
(609, 'tongod', 'TONGOD', 64),
(610, 'union-agua-blanca', 'UNION AGUA BLANCA', 64),
(611, 'san-bernardino', 'SAN BERNARDINO', 65),
(612, 'san-luis', 'SAN LUIS', 65),
(613, 'tumbaden', 'TUMBADEN', 65),
(614, 'andabamba', 'ANDABAMBA', 66),
(615, 'catache', 'CATACHE', 66),
(616, 'chancaybaos', 'CHANCAYBAÑOS', 66),
(617, 'la-esperanza', 'LA ESPERANZA', 66),
(618, 'ninabamba', 'NINABAMBA', 66),
(619, 'pulan', 'PULAN', 66),
(620, 'saucepampa', 'SAUCEPAMPA', 66),
(621, 'sexi', 'SEXI', 66),
(622, 'uticyacu', 'UTICYACU', 66),
(623, 'yauyucan', 'YAUYUCAN', 66),
(624, 'bellavista', 'BELLAVISTA', 67),
(625, 'carmen-de-la-legua-reynoso', 'CARMEN DE LA LEGUA-REYNOSO', 67),
(626, 'la-perla', 'LA PERLA', 67),
(627, 'la-punta', 'LA PUNTA', 67),
(628, 'mi-peru', 'MI PERU', 67),
(629, 'ventanilla', 'VENTANILLA', 67),
(630, 'acopia', 'ACOPIA', 68),
(631, 'acos', 'ACOS', 68),
(632, 'mosoc-llacta', 'MOSOC LLACTA', 68),
(633, 'pomacanchi', 'POMACANCHI', 68),
(634, 'rondocan', 'RONDOCAN', 68),
(635, 'sangarara', 'SANGARARA', 68),
(636, 'ancahuasi', 'ANCAHUASI', 69),
(637, 'cachimayo', 'CACHIMAYO', 69),
(638, 'chinchaypujio', 'CHINCHAYPUJIO', 69),
(639, 'huarocondo', 'HUAROCONDO', 69),
(640, 'limatambo', 'LIMATAMBO', 69),
(641, 'mollepata', 'MOLLEPATA', 69),
(642, 'pucyura', 'PUCYURA', 69),
(643, 'zurite', 'ZURITE', 69),
(644, 'coya', 'COYA', 70),
(645, 'lamay', 'LAMAY', 70),
(646, 'lares', 'LARES', 70),
(647, 'pisac', 'PISAC', 70),
(648, 'san-salvador', 'SAN SALVADOR', 70),
(649, 'taray', 'TARAY', 70),
(650, 'yanatile', 'YANATILE', 70),
(651, 'checca', 'CHECCA', 71),
(652, 'kunturkanki', 'KUNTURKANKI', 71),
(653, 'langui', 'LANGUI', 71),
(654, 'layo', 'LAYO', 71),
(655, 'pampamarca', 'PAMPAMARCA', 71),
(656, 'quehue', 'QUEHUE', 71),
(657, 'tupac-amaru', 'TUPAC AMARU', 71),
(658, 'checacupe', 'CHECACUPE', 72),
(659, 'combapata', 'COMBAPATA', 72),
(660, 'marangani', 'MARANGANI', 72),
(661, 'pitumarca', 'PITUMARCA', 72),
(662, 'san-pablo', 'SAN PABLO', 72),
(663, 'san-pedro', 'SAN PEDRO', 72),
(664, 'tinta', 'TINTA', 72),
(665, 'capacmarca', 'CAPACMARCA', 73),
(666, 'chamaca', 'CHAMACA', 73),
(667, 'colquemarca', 'COLQUEMARCA', 73),
(668, 'livitaca', 'LIVITACA', 73),
(669, 'llusco', 'LLUSCO', 73),
(670, 'quiota', 'QUIÑOTA', 73),
(671, 'velille', 'VELILLE', 73),
(672, 'ccorca', 'CCORCA', 74),
(673, 'poroy', 'POROY', 74),
(674, 'san-jeronimo', 'SAN JERONIMO', 74),
(675, 'san-sebastian', 'SAN SEBASTIAN', 74),
(676, 'santiago', 'SANTIAGO', 74),
(677, 'saylla', 'SAYLLA', 74),
(678, 'wanchaq', 'WANCHAQ', 74),
(679, 'alto-pichigua', 'ALTO PICHIGUA', 75),
(680, 'condoroma', 'CONDOROMA', 75),
(681, 'coporaque', 'COPORAQUE', 75),
(682, 'ocoruro', 'OCORURO', 75),
(683, 'pallpata', 'PALLPATA', 75),
(684, 'pichigua', 'PICHIGUA', 75),
(685, 'suyckutambo', 'SUYCKUTAMBO', 75),
(686, 'echarate', 'ECHARATE', 76),
(687, 'huayopata', 'HUAYOPATA', 76),
(688, 'inkawasi', 'INKAWASI', 76),
(689, 'kimbiri', 'KIMBIRI', 76),
(690, 'maranura', 'MARANURA', 76),
(691, 'megantoni', 'MEGANTONI', 76),
(692, 'ocobamba', 'OCOBAMBA', 76),
(693, 'pichari', 'PICHARI', 76),
(694, 'quellouno', 'QUELLOUNO', 76),
(695, 'santa-teresa', 'SANTA TERESA', 76),
(696, 'vilcabamba', 'VILCABAMBA', 76),
(697, 'villa-kintiarina', 'VILLA KINTIARINA', 76),
(698, 'villa-virgen', 'VILLA VIRGEN', 76),
(699, 'accha', 'ACCHA', 77),
(700, 'ccapi', 'CCAPI', 77),
(701, 'colcha', 'COLCHA', 77),
(702, 'huanoquite', 'HUANOQUITE', 77),
(703, 'omacha', 'OMACHA', 77),
(704, 'paccaritambo', 'PACCARITAMBO', 77),
(705, 'pillpinto', 'PILLPINTO', 77),
(706, 'yaurisque', 'YAURISQUE', 77),
(707, 'caicay', 'CAICAY', 78),
(708, 'challabamba', 'CHALLABAMBA', 78),
(709, 'colquepata', 'COLQUEPATA', 78),
(710, 'huancarani', 'HUANCARANI', 78),
(711, 'kosipata', 'KOSÑIPATA', 78),
(712, 'andahuaylillas', 'ANDAHUAYLILLAS', 79),
(713, 'camanti', 'CAMANTI', 79),
(714, 'ccarhuayo', 'CCARHUAYO', 79),
(715, 'ccatca', 'CCATCA', 79),
(716, 'cusipata', 'CUSIPATA', 79),
(717, 'huaro', 'HUARO', 79),
(718, 'lucre', 'LUCRE', 79),
(719, 'marcapata', 'MARCAPATA', 79),
(720, 'ocongate', 'OCONGATE', 79),
(721, 'oropesa', 'OROPESA', 79),
(722, 'quiquijana', 'QUIQUIJANA', 79),
(723, 'chinchero', 'CHINCHERO', 80),
(724, 'huayllabamba', 'HUAYLLABAMBA', 80),
(725, 'machupicchu', 'MACHUPICCHU', 80),
(726, 'maras', 'MARAS', 80),
(727, 'ollantaytambo', 'OLLANTAYTAMBO', 80),
(728, 'yucay', 'YUCAY', 80),
(729, 'andabamba', 'ANDABAMBA', 81),
(730, 'anta', 'ANTA', 81),
(731, 'caja', 'CAJA', 81),
(732, 'marcas', 'MARCAS', 81),
(733, 'paucara', 'PAUCARA', 81),
(734, 'pomacocha', 'POMACOCHA', 81),
(735, 'rosario', 'ROSARIO', 81),
(736, 'anchonga', 'ANCHONGA', 82),
(737, 'callanmarca', 'CALLANMARCA', 82),
(738, 'ccochaccasa', 'CCOCHACCASA', 82),
(739, 'chincho', 'CHINCHO', 82),
(740, 'congalla', 'CONGALLA', 82),
(741, 'huallay-grande', 'HUALLAY-GRANDE', 82),
(742, 'huanca-huanca', 'HUANCA-HUANCA', 82),
(743, 'julcamarca', 'JULCAMARCA', 82),
(744, 'san-antonio-de-antaparco', 'SAN ANTONIO DE ANTAPARCO', 82),
(745, 'santo-tomas-de-pata', 'SANTO TOMAS DE PATA', 82),
(746, 'secclla', 'SECCLLA', 82),
(747, 'arma', 'ARMA', 83),
(748, 'aurahua', 'AURAHUA', 83),
(749, 'capillas', 'CAPILLAS', 83),
(750, 'chupamarca', 'CHUPAMARCA', 83),
(751, 'cocas', 'COCAS', 83),
(752, 'huachos', 'HUACHOS', 83),
(753, 'huamatambo', 'HUAMATAMBO', 83),
(754, 'mollepampa', 'MOLLEPAMPA', 83),
(755, 'san-juan', 'SAN JUAN', 83),
(756, 'santa-ana', 'SANTA ANA', 83),
(757, 'tantara', 'TANTARA', 83),
(758, 'ticrapo', 'TICRAPO', 83),
(759, 'anco', 'ANCO', 84),
(760, 'chinchihuasi', 'CHINCHIHUASI', 84),
(761, 'cosme', 'COSME', 84),
(762, 'el-carmen', 'EL CARMEN', 84),
(763, 'la-merced', 'LA MERCED', 84),
(764, 'locroja', 'LOCROJA', 84),
(765, 'pachamarca', 'PACHAMARCA', 84),
(766, 'paucarbamba', 'PAUCARBAMBA', 84),
(767, 'san-miguel-de-mayocc', 'SAN MIGUEL DE MAYOCC', 84),
(768, 'san-pedro-de-coris', 'SAN PEDRO DE CORIS', 84),
(769, 'acobambilla', 'ACOBAMBILLA', 85),
(770, 'acoria', 'ACORIA', 85),
(771, 'ascension', 'ASCENSION', 85),
(772, 'conayca', 'CONAYCA', 85),
(773, 'cuenca', 'CUENCA', 85),
(774, 'huachocolpa', 'HUACHOCOLPA', 85),
(775, 'huando', 'HUANDO', 85),
(776, 'huayllahuara', 'HUAYLLAHUARA', 85),
(777, 'izcuchaca', 'IZCUCHACA', 85),
(778, 'laria', 'LARIA', 85),
(779, 'manta', 'MANTA', 85),
(780, 'mariscal-caceres', 'MARISCAL CACERES', 85),
(781, 'moya', 'MOYA', 85),
(782, 'nuevo-occoro', 'NUEVO OCCORO', 85),
(783, 'palca', 'PALCA', 85),
(784, 'pilchaca', 'PILCHACA', 85),
(785, 'vilca', 'VILCA', 85),
(786, 'yauli', 'YAULI', 85),
(787, 'ayavi', 'AYAVI', 86),
(788, 'cordova', 'CORDOVA', 86),
(789, 'huayacundo-arma', 'HUAYACUNDO ARMA', 86),
(790, 'laramarca', 'LARAMARCA', 86),
(791, 'ocoyo', 'OCOYO', 86),
(792, 'pilpichaca', 'PILPICHACA', 86),
(793, 'querco', 'QUERCO', 86),
(794, 'quito-arma', 'QUITO ARMA', 86),
(795, 'san-antonio-de-cusicancha', 'SAN ANTONIO DE CUSICANCHA', 86),
(796, 'san-francisco-de-sangayaico', 'SAN FRANCISCO DE SANGAYAICO', 86),
(797, 'san-isidro', 'SAN ISIDRO', 86),
(798, 'santiago-de-chocorvos', 'SANTIAGO DE CHOCORVOS', 86),
(799, 'santiago-de-quirahuara', 'SANTIAGO DE QUIRAHUARA', 86),
(800, 'santo-domingo-de-capillas', 'SANTO DOMINGO DE CAPILLAS', 86),
(801, 'tambo', 'TAMBO', 86),
(802, 'acostambo', 'ACOSTAMBO', 87),
(803, 'acraquia', 'ACRAQUIA', 87),
(804, 'ahuaycha', 'AHUAYCHA', 87),
(805, 'andaymarca', 'ANDAYMARCA', 87),
(806, 'colcabamba', 'COLCABAMBA', 87),
(807, 'daniel-hernandez', 'DANIEL HERNANDEZ', 87),
(808, 'huachocolpa', 'HUACHOCOLPA', 87),
(809, 'huaribamba', 'HUARIBAMBA', 87),
(810, 'ahuimpuquio', 'ÑAHUIMPUQUIO', 87),
(811, 'pazos', 'PAZOS', 87),
(812, 'pichos', 'PICHOS', 87),
(813, 'quichuas', 'QUICHUAS', 87),
(814, 'quishuar', 'QUISHUAR', 87),
(815, 'roble', 'ROBLE', 87),
(816, 'salcabamba', 'SALCABAMBA', 87),
(817, 'salcahuasi', 'SALCAHUASI', 87),
(818, 'san-marcos-de-rocchac', 'SAN MARCOS DE ROCCHAC', 87),
(819, 'santiago-de-tucuma', 'SANTIAGO DE TUCUMA', 87),
(820, 'surcubamba', 'SURCUBAMBA', 87),
(821, 'tintay-puncu', 'TINTAY PUNCU', 87),
(822, 'cayna', 'CAYNA', 88),
(823, 'colpas', 'COLPAS', 88),
(824, 'conchamarca', 'CONCHAMARCA', 88),
(825, 'huacar', 'HUACAR', 88),
(826, 'san-francisco', 'SAN FRANCISCO', 88),
(827, 'san-rafael', 'SAN RAFAEL', 88),
(828, 'tomay-kichwa', 'TOMAY-KICHWA', 88),
(829, 'chuquis', 'CHUQUIS', 89),
(830, 'marias', 'MARIAS', 89),
(831, 'pachas', 'PACHAS', 89),
(832, 'quivilla', 'QUIVILLA', 89),
(833, 'ripan', 'RIPAN', 89),
(834, 'shunqui', 'SHUNQUI', 89),
(835, 'sillapata', 'SILLAPATA', 89),
(836, 'yanas', 'YANAS', 89),
(837, 'canchabamba', 'CANCHABAMBA', 90),
(838, 'cochabamba', 'COCHABAMBA', 90),
(839, 'pinra', 'PINRA', 90),
(840, 'arancay', 'ARANCAY', 91),
(841, 'chavin-de-pariarca', 'CHAVIN DE PARIARCA', 91),
(842, 'jacas-grande', 'JACAS GRANDE', 91),
(843, 'jircan', 'JIRCAN', 91),
(844, 'miraflores', 'MIRAFLORES', 91),
(845, 'monzon', 'MONZON', 91),
(846, 'punchao', 'PUNCHAO', 91),
(847, 'puos', 'PUÑOS', 91),
(848, 'singa', 'SINGA', 91),
(849, 'tantamayo', 'TANTAMAYO', 91),
(850, 'amarilis', 'AMARILIS', 92),
(851, 'chinchao', 'CHINCHAO', 92),
(852, 'churubamba', 'CHURUBAMBA', 92),
(853, 'margos', 'MARGOS', 92),
(854, 'pillco-marca', 'PILLCO MARCA', 92),
(855, 'quisqui', 'QUISQUI', 92),
(856, 'san-francisco-de-cayran', 'SAN FRANCISCO DE CAYRAN', 92),
(857, 'san-pablo-de-pillao', 'SAN PABLO DE PILLAO', 92),
(858, 'san-pedro-de-chaulan', 'SAN PEDRO DE CHAULAN', 92),
(859, 'santa-maria-del-valle', 'SANTA MARIA DEL VALLE', 92),
(860, 'yacus', 'YACUS', 92),
(861, 'yarumayo', 'YARUMAYO', 92),
(862, 'baos', 'BAÑOS', 93),
(863, 'jivia', 'JIVIA', 93),
(864, 'queropalca', 'QUEROPALCA', 93),
(865, 'rondos', 'RONDOS', 93),
(866, 'san-francisco-de-asis', 'SAN FRANCISCO DE ASIS', 93),
(867, 'san-miguel-de-cauri', 'SAN MIGUEL DE CAURI', 93),
(868, 'castillo-grande', 'CASTILLO GRANDE', 94),
(869, 'daniel-alomia-robles', 'DANIEL ALOMIA ROBLES', 94),
(870, 'hermilio-valdizan', 'HERMILIO VALDIZAN', 94),
(871, 'jose-crespo-y-castillo', 'JOSE CRESPO Y CASTILLO', 94),
(872, 'luyando', 'LUYANDO', 94),
(873, 'mariano-damaso-beraun', 'MARIANO DAMASO BERAUN', 94),
(874, 'pucayacu', 'PUCAYACU', 94),
(875, 'pueblo-nuevo', 'PUEBLO NUEVO', 94),
(876, 'santo-domingo-de-anda', 'SANTO DOMINGO DE ANDA', 94),
(877, 'cholon', 'CHOLON', 95),
(878, 'la-morada', 'LA MORADA', 95),
(879, 'san-buenaventura', 'SAN BUENAVENTURA', 95),
(880, 'santa-rosa-de-alto-yanajanca', 'SANTA ROSA DE ALTO YANAJANCA', 95),
(881, 'chaglla', 'CHAGLLA', 96),
(882, 'molino', 'MOLINO', 96),
(883, 'umari', 'UMARI', 96),
(884, 'codo-del-pozuzo', 'CODO DEL POZUZO', 97),
(885, 'honoria', 'HONORIA', 97),
(886, 'tournavista', 'TOURNAVISTA', 97),
(887, 'yuyapichis', 'YUYAPICHIS', 97),
(888, 'aparicio-pomares', 'APARICIO POMARES', 98),
(889, 'cahuac', 'CAHUAC', 98),
(890, 'chacabamba', 'CHACABAMBA', 98),
(891, 'choras', 'CHORAS', 98),
(892, 'jacas-chico', 'JACAS CHICO', 98),
(893, 'obas', 'OBAS', 98),
(894, 'pampamarca', 'PAMPAMARCA', 98),
(895, 'alto-laran', 'ALTO LARAN', 99),
(896, 'chavin', 'CHAVIN', 99),
(897, 'chincha-baja', 'CHINCHA BAJA', 99),
(898, 'el-carmen', 'EL CARMEN', 99),
(899, 'grocio-prado', 'GROCIO PRADO', 99),
(900, 'pueblo-nuevo', 'PUEBLO NUEVO', 99),
(901, 'san-juan-de-yanac', 'SAN JUAN DE YANAC', 99),
(902, 'san-pedro-de-huacarpana', 'SAN PEDRO DE HUACARPANA', 99),
(903, 'sunampe', 'SUNAMPE', 99),
(904, 'tambo-de-mora', 'TAMBO DE MORA', 99),
(905, 'la-tinguia', 'LA TINGUIÑA', 100),
(906, 'los-aquijes', 'LOS AQUIJES', 100),
(907, 'ocucaje', 'OCUCAJE', 100),
(908, 'pachacutec', 'PACHACUTEC', 100),
(909, 'parcona', 'PARCONA', 100),
(910, 'pueblo-nuevo', 'PUEBLO NUEVO', 100),
(911, 'salas', 'SALAS', 100),
(912, 'san-jose-de-los-molinos', 'SAN JOSE DE LOS MOLINOS', 100),
(913, 'san-juan-bautista', 'SAN JUAN BAUTISTA', 100),
(914, 'santiago', 'SANTIAGO', 100),
(915, 'subtanjalla', 'SUBTANJALLA', 100),
(916, 'tate', 'TATE', 100),
(917, 'yauca-del-rosario', 'YAUCA DEL ROSARIO', 100),
(918, 'changuillo', 'CHANGUILLO', 101),
(919, 'el-ingenio', 'EL INGENIO', 101),
(920, 'marcona', 'MARCONA', 101),
(921, 'vista-alegre', 'VISTA ALEGRE', 101),
(922, 'llipata', 'LLIPATA', 102),
(923, 'rio-grande', 'RIO GRANDE', 102),
(924, 'santa-cruz', 'SANTA CRUZ', 102),
(925, 'tibillo', 'TIBILLO', 102),
(926, 'huancano', 'HUANCANO', 103),
(927, 'humay', 'HUMAY', 103),
(928, 'independencia', 'INDEPENDENCIA', 103),
(929, 'paracas', 'PARACAS', 103),
(930, 'san-andres', 'SAN ANDRES', 103),
(931, 'san-clemente', 'SAN CLEMENTE', 103),
(932, 'tupac-amaru-inca', 'TUPAC AMARU INCA', 103),
(933, 'perene', 'PERENE', 104),
(934, 'pichanaqui', 'PICHANAQUI', 104),
(935, 'san-luis-de-shuaro', 'SAN LUIS DE SHUARO', 104),
(936, 'san-ramon', 'SAN RAMON', 104),
(937, 'vitoc', 'VITOC', 104),
(938, 'ahuac', 'AHUAC', 105),
(939, 'chongos-bajo', 'CHONGOS BAJO', 105),
(940, 'huachac', 'HUACHAC', 105),
(941, 'huamancaca-chico', 'HUAMANCACA CHICO', 105),
(942, 'san-juan-de-jarpa', 'SAN JUAN DE JARPA', 105),
(943, 'san-juan-de-yscos', 'SAN JUAN DE YSCOS', 105),
(944, 'tres-de-diciembre', 'TRES DE DICIEMBRE', 105),
(945, 'yanacancha', 'YANACANCHA', 105),
(946, 'aco', 'ACO', 106),
(947, 'andamarca', 'ANDAMARCA', 106),
(948, 'chambara', 'CHAMBARA', 106),
(949, 'cochas', 'COCHAS', 106),
(950, 'comas', 'COMAS', 106),
(951, 'heroinas-toledo', 'HEROINAS TOLEDO', 106),
(952, 'manzanares', 'MANZANARES', 106),
(953, 'mariscal-castilla', 'MARISCAL CASTILLA', 106),
(954, 'matahuasi', 'MATAHUASI', 106),
(955, 'mito', 'MITO', 106),
(956, 'nueve-de-julio', 'NUEVE DE JULIO', 106),
(957, 'orcotuna', 'ORCOTUNA', 106),
(958, 'san-jose-de-quero', 'SAN JOSE DE QUERO', 106),
(959, 'santa-rosa-de-ocopa', 'SANTA ROSA DE OCOPA', 106),
(960, 'carhuacallanga', 'CARHUACALLANGA', 107),
(961, 'chacapampa', 'CHACAPAMPA', 107),
(962, 'chicche', 'CHICCHE', 107),
(963, 'chilca', 'CHILCA', 107),
(964, 'chongos-alto', 'CHONGOS ALTO', 107),
(965, 'chupuro', 'CHUPURO', 107),
(966, 'colca', 'COLCA', 107),
(967, 'cullhuas', 'CULLHUAS', 107),
(968, 'el-tambo', 'EL TAMBO', 107),
(969, 'huacrapuquio', 'HUACRAPUQUIO', 107),
(970, 'hualhuas', 'HUALHUAS', 107),
(971, 'huancan', 'HUANCAN', 107),
(972, 'huasicancha', 'HUASICANCHA', 107),
(973, 'huayucachi', 'HUAYUCACHI', 107),
(974, 'ingenio', 'INGENIO', 107),
(975, 'pariahuanca', 'PARIAHUANCA', 107),
(976, 'pilcomayo', 'PILCOMAYO', 107),
(977, 'pucara', 'PUCARA', 107),
(978, 'quichuay', 'QUICHUAY', 107),
(979, 'quilcas', 'QUILCAS', 107),
(980, 'san-agustin', 'SAN AGUSTIN', 107),
(981, 'san-jeronimo-de-tunan', 'SAN JERONIMO DE TUNAN', 107),
(982, 'sao', 'SAÑO', 107),
(983, 'santo-domingo-de-acobamba', 'SANTO DOMINGO DE ACOBAMBA', 107),
(984, 'sapallanga', 'SAPALLANGA', 107),
(985, 'sicaya', 'SICAYA', 107),
(986, 'viques', 'VIQUES', 107),
(987, 'acolla', 'ACOLLA', 108),
(988, 'apata', 'APATA', 108),
(989, 'ataura', 'ATAURA', 108),
(990, 'canchayllo', 'CANCHAYLLO', 108),
(991, 'curicaca', 'CURICACA', 108),
(992, 'el-mantaro', 'EL MANTARO', 108),
(993, 'huamali', 'HUAMALI', 108),
(994, 'huaripampa', 'HUARIPAMPA', 108),
(995, 'huertas', 'HUERTAS', 108),
(996, 'janjaillo', 'JANJAILLO', 108),
(997, 'julcan', 'JULCAN', 108),
(998, 'leonor-ordoez', 'LEONOR ORDOÑEZ', 108),
(999, 'llocllapampa', 'LLOCLLAPAMPA', 108),
(1000, 'marco', 'MARCO', 108),
(1001, 'masma', 'MASMA', 108),
(1002, 'masma-chicche', 'MASMA CHICCHE', 108),
(1003, 'molinos', 'MOLINOS', 108),
(1004, 'monobamba', 'MONOBAMBA', 108),
(1005, 'muqui', 'MUQUI', 108),
(1006, 'muquiyauyo', 'MUQUIYAUYO', 108),
(1007, 'paca', 'PACA', 108),
(1008, 'paccha', 'PACCHA', 108),
(1009, 'pancan', 'PANCAN', 108),
(1010, 'parco', 'PARCO', 108),
(1011, 'pomacancha', 'POMACANCHA', 108),
(1012, 'ricran', 'RICRAN', 108),
(1013, 'san-lorenzo', 'SAN LORENZO', 108),
(1014, 'san-pedro-de-chunan', 'SAN PEDRO DE CHUNAN', 108),
(1015, 'sausa', 'SAUSA', 108),
(1016, 'sincos', 'SINCOS', 108),
(1017, 'tunan-marca', 'TUNAN MARCA', 108),
(1018, 'yauli', 'YAULI', 108),
(1019, 'yauyos', 'YAUYOS', 108),
(1020, 'carhuamayo', 'CARHUAMAYO', 109),
(1021, 'ondores', 'ONDORES', 109),
(1022, 'ulcumayo', 'ULCUMAYO', 109),
(1023, 'coviriali', 'COVIRIALI', 110),
(1024, 'llaylla', 'LLAYLLA', 110),
(1025, 'mazamari', 'MAZAMARI', 110),
(1026, 'pampa-hermosa', 'PAMPA HERMOSA', 110),
(1027, 'pangoa', 'PANGOA', 110),
(1028, 'rio-negro', 'RIO NEGRO', 110),
(1029, 'rio-tambo', 'RIO TAMBO', 110),
(1030, 'vizcatan-del-ene', 'VIZCATAN DEL ENE', 110),
(1031, 'acobamba', 'ACOBAMBA', 111),
(1032, 'huaricolca', 'HUARICOLCA', 111),
(1033, 'huasahuasi', 'HUASAHUASI', 111),
(1034, 'la-union', 'LA UNION', 111),
(1035, 'palca', 'PALCA', 111),
(1036, 'palcamayo', 'PALCAMAYO', 111),
(1037, 'san-pedro-de-cajas', 'SAN PEDRO DE CAJAS', 111),
(1038, 'tapo', 'TAPO', 111),
(1039, 'chacapalpa', 'CHACAPALPA', 112),
(1040, 'huay-huay', 'HUAY HUAY', 112),
(1041, 'marcapomacocha', 'MARCAPOMACOCHA', 112),
(1042, 'morococha', 'MOROCOCHA', 112),
(1043, 'paccha', 'PACCHA', 112),
(1044, 'santa-barbara-de-carhuacayan', 'SANTA BARBARA DE CARHUACAYAN', 112),
(1045, 'santa-rosa-de-sacco', 'SANTA ROSA DE SACCO', 112),
(1046, 'suitucancha', 'SUITUCANCHA', 112),
(1047, 'yauli', 'YAULI', 112),
(1048, 'casa-grande', 'CASA GRANDE', 113),
(1049, 'chicama', 'CHICAMA', 113),
(1050, 'chocope', 'CHOCOPE', 113),
(1051, 'magdalena-de-cao', 'MAGDALENA DE CAO', 113),
(1052, 'paijan', 'PAIJAN', 113),
(1053, 'razuri', 'RAZURI', 113),
(1054, 'santiago-de-cao', 'SANTIAGO DE CAO', 113),
(1055, 'bambamarca', 'BAMBAMARCA', 114),
(1056, 'condormarca', 'CONDORMARCA', 114),
(1057, 'longotea', 'LONGOTEA', 114),
(1058, 'uchumarca', 'UCHUMARCA', 114),
(1059, 'ucuncha', 'UCUNCHA', 114),
(1060, 'pacanga', 'PACANGA', 115),
(1061, 'pueblo-nuevo', 'PUEBLO NUEVO', 115),
(1062, 'lucma', 'LUCMA', 116),
(1063, 'marmot', 'MARMOT', 116),
(1064, 'sayapullo', 'SAYAPULLO', 116),
(1065, 'calamarca', 'CALAMARCA', 117),
(1066, 'carabamba', 'CARABAMBA', 117),
(1067, 'huaso', 'HUASO', 117),
(1068, 'agallpampa', 'AGALLPAMPA', 118),
(1069, 'charat', 'CHARAT', 118),
(1070, 'huaranchal', 'HUARANCHAL', 118),
(1071, 'la-cuesta', 'LA CUESTA', 118),
(1072, 'mache', 'MACHE', 118),
(1073, 'paranday', 'PARANDAY', 118),
(1074, 'salpo', 'SALPO', 118),
(1075, 'sinsicap', 'SINSICAP', 118),
(1076, 'usquil', 'USQUIL', 118),
(1077, 'guadalupe', 'GUADALUPE', 119),
(1078, 'jequetepeque', 'JEQUETEPEQUE', 119),
(1079, 'pacasmayo', 'PACASMAYO', 119),
(1080, 'san-jose', 'SAN JOSE', 119),
(1081, 'buldibuyo', 'BULDIBUYO', 120),
(1082, 'chillia', 'CHILLIA', 120),
(1083, 'huancaspata', 'HUANCASPATA', 120),
(1084, 'huaylillas', 'HUAYLILLAS', 120),
(1085, 'huayo', 'HUAYO', 120),
(1086, 'ongon', 'ONGON', 120),
(1087, 'parcoy', 'PARCOY', 120),
(1088, 'pataz', 'PATAZ', 120),
(1089, 'pias', 'PIAS', 120),
(1090, 'santiago-de-challas', 'SANTIAGO DE CHALLAS', 120),
(1091, 'taurija', 'TAURIJA', 120),
(1092, 'urpay', 'URPAY', 120),
(1093, 'chugay', 'CHUGAY', 121),
(1094, 'cochorco', 'COCHORCO', 121),
(1095, 'curgos', 'CURGOS', 121),
(1096, 'marcabal', 'MARCABAL', 121),
(1097, 'sanagoran', 'SANAGORAN', 121),
(1098, 'sarin', 'SARIN', 121),
(1099, 'sartimbamba', 'SARTIMBAMBA', 121),
(1100, 'angasmarca', 'ANGASMARCA', 122),
(1101, 'cachicadan', 'CACHICADAN', 122),
(1102, 'mollebamba', 'MOLLEBAMBA', 122),
(1103, 'mollepata', 'MOLLEPATA', 122),
(1104, 'quiruvilca', 'QUIRUVILCA', 122),
(1105, 'santa-cruz-de-chuca', 'SANTA CRUZ DE CHUCA', 122),
(1106, 'sitabamba', 'SITABAMBA', 122),
(1107, 'el-porvenir', 'EL PORVENIR', 123),
(1108, 'florencia-de-mora', 'FLORENCIA DE MORA', 123),
(1109, 'huanchaco', 'HUANCHACO', 123),
(1110, 'la-esperanza', 'LA ESPERANZA', 123),
(1111, 'laredo', 'LAREDO', 123),
(1112, 'moche', 'MOCHE', 123),
(1113, 'poroto', 'POROTO', 123),
(1114, 'salaverry', 'SALAVERRY', 123),
(1115, 'simbal', 'SIMBAL', 123),
(1116, 'victor-larco-herrera', 'VICTOR LARCO HERRERA', 123),
(1117, 'chao', 'CHAO', 124),
(1118, 'guadalupito', 'GUADALUPITO', 124),
(1119, 'cayalti', 'CAYALTI', 125),
(1120, 'chongoyape', 'CHONGOYAPE', 125),
(1121, 'eten', 'ETEN', 125),
(1122, 'eten-puerto', 'ETEN PUERTO', 125),
(1123, 'jose-leonardo-ortiz', 'JOSE LEONARDO ORTIZ', 125),
(1124, 'la-victoria', 'LA VICTORIA', 125),
(1125, 'lagunas', 'LAGUNAS', 125),
(1126, 'monsefu', 'MONSEFU', 125),
(1127, 'nueva-arica', 'NUEVA ARICA', 125),
(1128, 'oyotun', 'OYOTUN', 125),
(1129, 'patapo', 'PATAPO', 125),
(1130, 'picsi', 'PICSI', 125),
(1131, 'pimentel', 'PIMENTEL', 125),
(1132, 'pomalca', 'POMALCA', 125),
(1133, 'pucala', 'PUCALA', 125),
(1134, 'reque', 'REQUE', 125),
(1135, 'saa', 'SAÑA', 125),
(1136, 'santa-rosa', 'SANTA ROSA', 125),
(1137, 'tuman', 'TUMAN', 125),
(1138, 'caaris', 'CAÑARIS', 126),
(1139, 'incahuasi', 'INCAHUASI', 126),
(1140, 'manuel-antonio-mesones-muro', 'MANUEL ANTONIO MESONES MURO', 126),
(1141, 'pitipo', 'PITIPO', 126),
(1142, 'pueblo-nuevo', 'PUEBLO NUEVO', 126),
(1143, 'chochope', 'CHOCHOPE', 127),
(1144, 'illimo', 'ILLIMO', 127),
(1145, 'jayanca', 'JAYANCA', 127),
(1146, 'mochumi', 'MOCHUMI', 127),
(1147, 'morrope', 'MORROPE', 127),
(1148, 'motupe', 'MOTUPE', 127),
(1149, 'olmos', 'OLMOS', 127),
(1150, 'pacora', 'PACORA', 127),
(1151, 'salas', 'SALAS', 127),
(1152, 'san-jose', 'SAN JOSE', 127),
(1153, 'tucume', 'TUCUME', 127),
(1154, 'paramonga', 'PARAMONGA', 128),
(1155, 'pativilca', 'PATIVILCA', 128),
(1156, 'supe', 'SUPE', 128),
(1157, 'supe-puerto', 'SUPE PUERTO', 128),
(1158, 'copa', 'COPA', 129),
(1159, 'gorgor', 'GORGOR', 129),
(1160, 'huancapon', 'HUANCAPON', 129),
(1161, 'manas', 'MANAS', 129),
(1162, 'asia', 'ASIA', 130),
(1163, 'calango', 'CALANGO', 130),
(1164, 'cerro-azul', 'CERRO AZUL', 130),
(1165, 'chilca', 'CHILCA', 130),
(1166, 'coayllo', 'COAYLLO', 130),
(1167, 'imperial', 'IMPERIAL', 130),
(1168, 'lunahuana', 'LUNAHUANA', 130),
(1169, 'mala', 'MALA', 130),
(1170, 'nuevo-imperial', 'NUEVO IMPERIAL', 130),
(1171, 'pacaran', 'PACARAN', 130),
(1172, 'quilmana', 'QUILMANA', 130),
(1173, 'san-antonio', 'SAN ANTONIO', 130),
(1174, 'san-luis', 'SAN LUIS', 130),
(1175, 'santa-cruz-de-flores', 'SANTA CRUZ DE FLORES', 130),
(1176, 'zuiga', 'ZUÑIGA', 130),
(1177, 'arahuay', 'ARAHUAY', 131),
(1178, 'huamantanga', 'HUAMANTANGA', 131),
(1179, 'huaros', 'HUAROS', 131),
(1180, 'lachaqui', 'LACHAQUI', 131),
(1181, 'san-buenaventura', 'SAN BUENAVENTURA', 131),
(1182, 'santa-rosa-de-quives', 'SANTA ROSA DE QUIVES', 131),
(1183, 'atavillos-alto', 'ATAVILLOS ALTO', 132),
(1184, 'atavillos-bajo', 'ATAVILLOS BAJO', 132),
(1185, 'aucallama', 'AUCALLAMA', 132),
(1186, 'chancay', 'CHANCAY', 132),
(1187, 'ihuari', 'IHUARI', 132),
(1188, 'lampian', 'LAMPIAN', 132),
(1189, 'pacaraos', 'PACARAOS', 132),
(1190, 'san-miguel-de-acos', 'SAN MIGUEL DE ACOS', 132),
(1191, 'santa-cruz-de-andamarca', 'SANTA CRUZ DE ANDAMARCA', 132),
(1192, 'sumbilca', 'SUMBILCA', 132),
(1193, 'veintisiete-de-noviembre', 'VEINTISIETE DE NOVIEMBRE', 132),
(1194, 'antioquia', 'ANTIOQUIA', 133),
(1195, 'callahuanca', 'CALLAHUANCA', 133),
(1196, 'carampoma', 'CARAMPOMA', 133),
(1197, 'chicla', 'CHICLA', 133),
(1198, 'cuenca', 'CUENCA', 133),
(1199, 'huachupampa', 'HUACHUPAMPA', 133),
(1200, 'huanza', 'HUANZA', 133),
(1201, 'huarochiri', 'HUAROCHIRI', 133),
(1202, 'lahuaytambo', 'LAHUAYTAMBO', 133),
(1203, 'langa', 'LANGA', 133),
(1204, 'laraos', 'LARAOS', 133),
(1205, 'mariatana', 'MARIATANA', 133),
(1206, 'ricardo-palma', 'RICARDO PALMA', 133),
(1207, 'san-andres-de-tupicocha', 'SAN ANDRES DE TUPICOCHA', 133),
(1208, 'san-antonio', 'SAN ANTONIO', 133),
(1209, 'san-bartolome', 'SAN BARTOLOME', 133),
(1210, 'san-damian', 'SAN DAMIAN', 133),
(1211, 'san-juan-de-iris', 'SAN JUAN DE IRIS', 133),
(1212, 'san-juan-de-tantaranche', 'SAN JUAN DE TANTARANCHE', 133),
(1213, 'san-lorenzo-de-quinti', 'SAN LORENZO DE QUINTI', 133),
(1214, 'san-mateo', 'SAN MATEO', 133),
(1215, 'san-mateo-de-otao', 'SAN MATEO DE OTAO', 133),
(1216, 'san-pedro-de-casta', 'SAN PEDRO DE CASTA', 133),
(1217, 'san-pedro-de-huancayre', 'SAN PEDRO DE HUANCAYRE', 133),
(1218, 'sangallaya', 'SANGALLAYA', 133),
(1219, 'santa-cruz-de-cocachacra', 'SANTA CRUZ DE COCACHACRA', 133),
(1220, 'santa-eulalia', 'SANTA EULALIA', 133),
(1221, 'santiago-de-anchucaya', 'SANTIAGO DE ANCHUCAYA', 133),
(1222, 'santiago-de-tuna', 'SANTIAGO DE TUNA', 133),
(1223, 'santo-domingo-de-los-olleros', 'SANTO DOMINGO DE LOS OLLEROS', 133),
(1224, 'surco', 'SURCO', 133),
(1225, 'ambar', 'AMBAR', 134),
(1226, 'caleta-de-carquin', 'CALETA DE CARQUIN', 134),
(1227, 'checras', 'CHECRAS', 134),
(1228, 'hualmay', 'HUALMAY', 134),
(1229, 'huaura', 'HUAURA', 134),
(1230, 'leoncio-prado', 'LEONCIO PRADO', 134),
(1231, 'paccho', 'PACCHO', 134),
(1232, 'santa-leonor', 'SANTA LEONOR', 134),
(1233, 'santa-maria', 'SANTA MARIA', 134),
(1234, 'sayan', 'SAYAN', 134),
(1235, 'vegueta', 'VEGUETA', 134),
(1236, 'ancon', 'ANCON', 135),
(1237, 'ate', 'ATE', 135),
(1238, 'barranco', 'BARRANCO', 135),
(1239, 'brea', 'BREÑA', 135),
(1240, 'carabayllo', 'CARABAYLLO', 135),
(1241, 'chaclacayo', 'CHACLACAYO', 135),
(1242, 'chorrillos', 'CHORRILLOS', 135),
(1243, 'cieneguilla', 'CIENEGUILLA', 135),
(1244, 'comas', 'COMAS', 135),
(1245, 'el-agustino', 'EL AGUSTINO', 135),
(1246, 'independencia', 'INDEPENDENCIA', 135),
(1247, 'jesus-maria', 'JESUS MARIA', 135),
(1248, 'la-molina', 'LA MOLINA', 135),
(1249, 'la-victoria', 'LA VICTORIA', 135),
(1250, 'lince', 'LINCE', 135),
(1251, 'los-olivos', 'LOS OLIVOS', 135),
(1252, 'lurigancho', 'LURIGANCHO', 135),
(1253, 'lurin', 'LURIN', 135),
(1254, 'magdalena-del-mar', 'MAGDALENA DEL MAR', 135),
(1255, 'miraflores', 'MIRAFLORES', 135),
(1256, 'pachacamac', 'PACHACAMAC', 135),
(1257, 'pucusana', 'PUCUSANA', 135),
(1258, 'pueblo-libre', 'PUEBLO LIBRE', 135),
(1259, 'puente-piedra', 'PUENTE PIEDRA', 135),
(1260, 'punta-hermosa', 'PUNTA HERMOSA', 135),
(1261, 'punta-negra', 'PUNTA NEGRA', 135),
(1262, 'rimac', 'RIMAC', 135),
(1263, 'san-bartolo', 'SAN BARTOLO', 135),
(1264, 'san-borja', 'SAN BORJA', 135),
(1265, 'san-isidro', 'SAN ISIDRO', 135),
(1266, 'san-juan-de-lurigancho', 'SAN JUAN DE LURIGANCHO', 135),
(1267, 'san-juan-de-miraflores', 'SAN JUAN DE MIRAFLORES', 135),
(1268, 'san-luis', 'SAN LUIS', 135),
(1269, 'san-martin-de-porres', 'SAN MARTIN DE PORRES', 135),
(1270, 'san-miguel', 'SAN MIGUEL', 135),
(1271, 'santa-anita', 'SANTA ANITA', 135),
(1272, 'santa-maria-del-mar', 'SANTA MARIA DEL MAR', 135),
(1273, 'santa-rosa', 'SANTA ROSA', 135),
(1274, 'santiago-de-surco', 'SANTIAGO DE SURCO', 135),
(1275, 'surquillo', 'SURQUILLO', 135),
(1276, 'villa-el-salvador', 'VILLA EL SALVADOR', 135),
(1277, 'villa-maria-del-triunfo', 'VILLA MARIA DEL TRIUNFO', 135),
(1278, 'andajes', 'ANDAJES', 136),
(1279, 'caujul', 'CAUJUL', 136),
(1280, 'cochamarca', 'COCHAMARCA', 136),
(1281, 'navan', 'NAVAN', 136),
(1282, 'pachangara', 'PACHANGARA', 136),
(1283, 'alis', 'ALIS', 137),
(1284, 'allauca', 'ALLAUCA', 137),
(1285, 'ayaviri', 'AYAVIRI', 137),
(1286, 'azangaro', 'AZANGARO', 137),
(1287, 'cacra', 'CACRA', 137),
(1288, 'carania', 'CARANIA', 137),
(1289, 'catahuasi', 'CATAHUASI', 137),
(1290, 'chocos', 'CHOCOS', 137),
(1291, 'cochas', 'COCHAS', 137),
(1292, 'colonia', 'COLONIA', 137),
(1293, 'hongos', 'HONGOS', 137),
(1294, 'huampara', 'HUAMPARA', 137),
(1295, 'huancaya', 'HUANCAYA', 137),
(1296, 'huaec', 'HUAÑEC', 137),
(1297, 'huangascar', 'HUANGASCAR', 137),
(1298, 'huantan', 'HUANTAN', 137),
(1299, 'laraos', 'LARAOS', 137),
(1300, 'lincha', 'LINCHA', 137),
(1301, 'madean', 'MADEAN', 137),
(1302, 'miraflores', 'MIRAFLORES', 137),
(1303, 'omas', 'OMAS', 137),
(1304, 'putinza', 'PUTINZA', 137),
(1305, 'quinches', 'QUINCHES', 137),
(1306, 'quinocay', 'QUINOCAY', 137),
(1307, 'san-joaquin', 'SAN JOAQUIN', 137),
(1308, 'san-pedro-de-pilas', 'SAN PEDRO DE PILAS', 137),
(1309, 'tanta', 'TANTA', 137),
(1310, 'tauripampa', 'TAURIPAMPA', 137),
(1311, 'tomas', 'TOMAS', 137),
(1312, 'tupe', 'TUPE', 137),
(1313, 'viac', 'VIÑAC', 137),
(1314, 'vitis', 'VITIS', 137),
(1315, 'balsapuerto', 'BALSAPUERTO', 138),
(1316, 'jeberos', 'JEBEROS', 138),
(1317, 'lagunas', 'LAGUNAS', 138),
(1318, 'santa-cruz', 'SANTA CRUZ', 138),
(1319, 'teniente-cesar-lopez-rojas', 'TENIENTE CESAR LOPEZ ROJAS', 138),
(1320, 'andoas', 'ANDOAS', 139),
(1321, 'cahuapanas', 'CAHUAPANAS', 139),
(1322, 'manseriche', 'MANSERICHE', 139),
(1323, 'morona', 'MORONA', 139),
(1324, 'pastaza', 'PASTAZA', 139),
(1325, 'parinari', 'PARINARI', 140),
(1326, 'tigre', 'TIGRE', 140),
(1327, 'trompeteros', 'TROMPETEROS', 140),
(1328, 'urarinas', 'URARINAS', 140),
(1329, 'pebas', 'PEBAS', 141),
(1330, 'san-pablo', 'SAN PABLO', 141),
(1331, 'yavari', 'YAVARI', 141),
(1332, 'alto-nanay', 'ALTO NANAY', 142),
(1333, 'belen', 'BELEN', 142),
(1334, 'fernando-lores', 'FERNANDO LORES', 142),
(1335, 'indiana', 'INDIANA', 142),
(1336, 'las-amazonas', 'LAS AMAZONAS', 142),
(1337, 'mazan', 'MAZAN', 142),
(1338, 'napo', 'NAPO', 142),
(1339, 'punchana', 'PUNCHANA', 142),
(1340, 'san-juan-bautista', 'SAN JUAN BAUTISTA', 142),
(1341, 'torres-causana', 'TORRES CAUSANA', 142),
(1342, 'rosa-panduro', 'ROSA PANDURO', 143),
(1343, 'teniente-manuel-clavero', 'TENIENTE MANUEL CLAVERO', 143),
(1344, 'yaguas', 'YAGUAS', 143),
(1345, 'alto-tapiche', 'ALTO TAPICHE', 144),
(1346, 'capelo', 'CAPELO', 144),
(1347, 'emilio-san-martin', 'EMILIO SAN MARTIN', 144),
(1348, 'jenaro-herrera', 'JENARO HERRERA', 144),
(1349, 'maquia', 'MAQUIA', 144),
(1350, 'puinahua', 'PUINAHUA', 144),
(1351, 'saquena', 'SAQUENA', 144),
(1352, 'soplin', 'SOPLIN', 144),
(1353, 'tapiche', 'TAPICHE', 144),
(1354, 'yaquerana', 'YAQUERANA', 144),
(1355, 'inahuaya', 'INAHUAYA', 145),
(1356, 'padre-marquez', 'PADRE MARQUEZ', 145),
(1357, 'pampa-hermosa', 'PAMPA HERMOSA', 145),
(1358, 'sarayacu', 'SARAYACU', 145),
(1359, 'vargas-guerra', 'VARGAS GUERRA', 145),
(1360, 'fitzcarrald', 'FITZCARRALD', 146),
(1361, 'huepetuhe', 'HUEPETUHE', 146),
(1362, 'madre-de-dios', 'MADRE DE DIOS', 146),
(1363, 'iberia', 'IBERIA', 147),
(1364, 'tahuamanu', 'TAHUAMANU', 147),
(1365, 'inambari', 'INAMBARI', 148),
(1366, 'laberinto', 'LABERINTO', 148),
(1367, 'las-piedras', 'LAS PIEDRAS', 148),
(1368, 'chojata', 'CHOJATA', 149),
(1369, 'coalaque', 'COALAQUE', 149),
(1370, 'ichua', 'ICHUÑA', 149),
(1371, 'la-capilla', 'LA CAPILLA', 149),
(1372, 'lloque', 'LLOQUE', 149),
(1373, 'matalaque', 'MATALAQUE', 149),
(1374, 'puquina', 'PUQUINA', 149);
INSERT INTO `distritos` (`id`, `slug`, `nombre`, `provincias_id`) VALUES
(1375, 'quinistaquillas', 'QUINISTAQUILLAS', 149),
(1376, 'ubinas', 'UBINAS', 149),
(1377, 'yunga', 'YUNGA', 149),
(1378, 'el-algarrobal', 'EL ALGARROBAL', 150),
(1379, 'pacocha', 'PACOCHA', 150),
(1380, 'carumas', 'CARUMAS', 151),
(1381, 'cuchumbaya', 'CUCHUMBAYA', 151),
(1382, 'samegua', 'SAMEGUA', 151),
(1383, 'san-cristobal', 'SAN CRISTOBAL', 151),
(1384, 'torata', 'TORATA', 151),
(1385, 'chacayan', 'CHACAYAN', 152),
(1386, 'goyllarisquizga', 'GOYLLARISQUIZGA', 152),
(1387, 'paucar', 'PAUCAR', 152),
(1388, 'san-pedro-de-pillao', 'SAN PEDRO DE PILLAO', 152),
(1389, 'santa-ana-de-tusi', 'SANTA ANA DE TUSI', 152),
(1390, 'tapuc', 'TAPUC', 152),
(1391, 'vilcabamba', 'VILCABAMBA', 152),
(1392, 'chontabamba', 'CHONTABAMBA', 153),
(1393, 'constitucion', 'CONSTITUCION', 153),
(1394, 'huancabamba', 'HUANCABAMBA', 153),
(1395, 'palcazu', 'PALCAZU', 153),
(1396, 'pozuzo', 'POZUZO', 153),
(1397, 'puerto-bermudez', 'PUERTO BERMUDEZ', 153),
(1398, 'villa-rica', 'VILLA RICA', 153),
(1399, 'huachon', 'HUACHON', 154),
(1400, 'huariaca', 'HUARIACA', 154),
(1401, 'huayllay', 'HUAYLLAY', 154),
(1402, 'ninacaca', 'NINACACA', 154),
(1403, 'pallanchacra', 'PALLANCHACRA', 154),
(1404, 'paucartambo', 'PAUCARTAMBO', 154),
(1405, 'san-francisco-de-asis-de-yarusyacan', 'SAN FRANCISCO DE ASIS DE YARUSYACAN', 154),
(1406, 'simon-bolivar', 'SIMON BOLIVAR', 154),
(1407, 'ticlacayan', 'TICLACAYAN', 154),
(1408, 'tinyahuarco', 'TINYAHUARCO', 154),
(1409, 'vicco', 'VICCO', 154),
(1410, 'yanacancha', 'YANACANCHA', 154),
(1411, 'frias', 'FRIAS', 155),
(1412, 'jilili', 'JILILI', 155),
(1413, 'lagunas', 'LAGUNAS', 155),
(1414, 'montero', 'MONTERO', 155),
(1415, 'pacaipampa', 'PACAIPAMPA', 155),
(1416, 'paimas', 'PAIMAS', 155),
(1417, 'sapillica', 'SAPILLICA', 155),
(1418, 'sicchez', 'SICCHEZ', 155),
(1419, 'suyo', 'SUYO', 155),
(1420, 'canchaque', 'CANCHAQUE', 156),
(1421, 'el-carmen-de-la-frontera', 'EL CARMEN DE LA FRONTERA', 156),
(1422, 'huarmaca', 'HUARMACA', 156),
(1423, 'lalaquiz', 'LALAQUIZ', 156),
(1424, 'san-miguel-de-el-faique', 'SAN MIGUEL DE EL FAIQUE', 156),
(1425, 'sondor', 'SONDOR', 156),
(1426, 'sondorillo', 'SONDORILLO', 156),
(1427, 'buenos-aires', 'BUENOS AIRES', 157),
(1428, 'chalaco', 'CHALACO', 157),
(1429, 'la-matanza', 'LA MATANZA', 157),
(1430, 'morropon', 'MORROPON', 157),
(1431, 'salitral', 'SALITRAL', 157),
(1432, 'san-juan-de-bigote', 'SAN JUAN DE BIGOTE', 157),
(1433, 'santa-catalina-de-mossa', 'SANTA CATALINA DE MOSSA', 157),
(1434, 'santo-domingo', 'SANTO DOMINGO', 157),
(1435, 'yamango', 'YAMANGO', 157),
(1436, 'amotape', 'AMOTAPE', 158),
(1437, 'arenal', 'ARENAL', 158),
(1438, 'colan', 'COLAN', 158),
(1439, 'la-huaca', 'LA HUACA', 158),
(1440, 'tamarindo', 'TAMARINDO', 158),
(1441, 'vichayal', 'VICHAYAL', 158),
(1442, 'castilla', 'CASTILLA', 159),
(1443, 'catacaos', 'CATACAOS', 159),
(1444, 'cura-mori', 'CURA MORI', 159),
(1445, 'el-tallan', 'EL TALLAN', 159),
(1446, 'la-arena', 'LA ARENA', 159),
(1447, 'la-union', 'LA UNION', 159),
(1448, 'las-lomas', 'LAS LOMAS', 159),
(1449, 'tambo-grande', 'TAMBO GRANDE', 159),
(1450, 'veintiseis-de-octubre', 'VEINTISEIS DE OCTUBRE', 159),
(1451, 'bellavista-de-la-union', 'BELLAVISTA DE LA UNION', 160),
(1452, 'bernal', 'BERNAL', 160),
(1453, 'cristo-nos-valga', 'CRISTO NOS VALGA', 160),
(1454, 'rinconada-llicuar', 'RINCONADA-LLICUAR', 160),
(1455, 'vice', 'VICE', 160),
(1456, 'bellavista', 'BELLAVISTA', 161),
(1457, 'ignacio-escudero', 'IGNACIO ESCUDERO', 161),
(1458, 'lancones', 'LANCONES', 161),
(1459, 'marcavelica', 'MARCAVELICA', 161),
(1460, 'miguel-checa', 'MIGUEL CHECA', 161),
(1461, 'querecotillo', 'QUERECOTILLO', 161),
(1462, 'salitral', 'SALITRAL', 161),
(1463, 'el-alto', 'EL ALTO', 162),
(1464, 'la-brea', 'LA BREA', 162),
(1465, 'lobitos', 'LOBITOS', 162),
(1466, 'los-organos', 'LOS ORGANOS', 162),
(1467, 'mancora', 'MANCORA', 162),
(1468, 'achaya', 'ACHAYA', 163),
(1469, 'arapa', 'ARAPA', 163),
(1470, 'asillo', 'ASILLO', 163),
(1471, 'caminaca', 'CAMINACA', 163),
(1472, 'chupa', 'CHUPA', 163),
(1473, 'jose-domingo-choquehuanca', 'JOSE DOMINGO CHOQUEHUANCA', 163),
(1474, 'muani', 'MUÑANI', 163),
(1475, 'potoni', 'POTONI', 163),
(1476, 'saman', 'SAMAN', 163),
(1477, 'san-anton', 'SAN ANTON', 163),
(1478, 'san-jose', 'SAN JOSE', 163),
(1479, 'san-juan-de-salinas', 'SAN JUAN DE SALINAS', 163),
(1480, 'santiago-de-pupuja', 'SANTIAGO DE PUPUJA', 163),
(1481, 'tirapata', 'TIRAPATA', 163),
(1482, 'ajoyani', 'AJOYANI', 164),
(1483, 'ayapata', 'AYAPATA', 164),
(1484, 'coasa', 'COASA', 164),
(1485, 'corani', 'CORANI', 164),
(1486, 'crucero', 'CRUCERO', 164),
(1487, 'ituata', 'ITUATA', 164),
(1488, 'ollachea', 'OLLACHEA', 164),
(1489, 'san-gaban', 'SAN GABAN', 164),
(1490, 'usicayos', 'USICAYOS', 164),
(1491, 'desaguadero', 'DESAGUADERO', 165),
(1492, 'huacullani', 'HUACULLANI', 165),
(1493, 'kelluyo', 'KELLUYO', 165),
(1494, 'pisacoma', 'PISACOMA', 165),
(1495, 'pomata', 'POMATA', 165),
(1496, 'zepita', 'ZEPITA', 165),
(1497, 'capaso', 'CAPASO', 166),
(1498, 'conduriri', 'CONDURIRI', 166),
(1499, 'pilcuyo', 'PILCUYO', 166),
(1500, 'santa-rosa', 'SANTA ROSA', 166),
(1501, 'cojata', 'COJATA', 167),
(1502, 'huatasani', 'HUATASANI', 167),
(1503, 'inchupalla', 'INCHUPALLA', 167),
(1504, 'pusi', 'PUSI', 167),
(1505, 'rosaspata', 'ROSASPATA', 167),
(1506, 'taraco', 'TARACO', 167),
(1507, 'vilque-chico', 'VILQUE CHICO', 167),
(1508, 'cabanilla', 'CABANILLA', 168),
(1509, 'calapuja', 'CALAPUJA', 168),
(1510, 'nicasio', 'NICASIO', 168),
(1511, 'ocuviri', 'OCUVIRI', 168),
(1512, 'palca', 'PALCA', 168),
(1513, 'paratia', 'PARATIA', 168),
(1514, 'pucara', 'PUCARA', 168),
(1515, 'santa-lucia', 'SANTA LUCIA', 168),
(1516, 'vilavila', 'VILAVILA', 168),
(1517, 'antauta', 'ANTAUTA', 169),
(1518, 'cupi', 'CUPI', 169),
(1519, 'llalli', 'LLALLI', 169),
(1520, 'macari', 'MACARI', 169),
(1521, 'nuoa', 'NUÑOA', 169),
(1522, 'orurillo', 'ORURILLO', 169),
(1523, 'santa-rosa', 'SANTA ROSA', 169),
(1524, 'umachiri', 'UMACHIRI', 169),
(1525, 'conima', 'CONIMA', 170),
(1526, 'huayrapata', 'HUAYRAPATA', 170),
(1527, 'tilali', 'TILALI', 170),
(1528, 'acora', 'ACORA', 171),
(1529, 'amantani', 'AMANTANI', 171),
(1530, 'atuncolla', 'ATUNCOLLA', 171),
(1531, 'capachica', 'CAPACHICA', 171),
(1532, 'chucuito', 'CHUCUITO', 171),
(1533, 'coata', 'COATA', 171),
(1534, 'huata', 'HUATA', 171),
(1535, 'maazo', 'MAÑAZO', 171),
(1536, 'paucarcolla', 'PAUCARCOLLA', 171),
(1537, 'pichacani', 'PICHACANI', 171),
(1538, 'plateria', 'PLATERIA', 171),
(1539, 'san-antonio', 'SAN ANTONIO', 171),
(1540, 'tiquillaca', 'TIQUILLACA', 171),
(1541, 'vilque', 'VILQUE', 171),
(1542, 'ananea', 'ANANEA', 172),
(1543, 'pedro-vilca-apaza', 'PEDRO VILCA APAZA', 172),
(1544, 'quilcapuncu', 'QUILCAPUNCU', 172),
(1545, 'sina', 'SINA', 172),
(1546, 'cabana', 'CABANA', 173),
(1547, 'cabanillas', 'CABANILLAS', 173),
(1548, 'caracoto', 'CARACOTO', 173),
(1549, 'san-miguel', 'SAN MIGUEL', 173),
(1550, 'alto-inambari', 'ALTO INAMBARI', 174),
(1551, 'cuyocuyo', 'CUYOCUYO', 174),
(1552, 'limbani', 'LIMBANI', 174),
(1553, 'patambuco', 'PATAMBUCO', 174),
(1554, 'phara', 'PHARA', 174),
(1555, 'quiaca', 'QUIACA', 174),
(1556, 'san-juan-del-oro', 'SAN JUAN DEL ORO', 174),
(1557, 'san-pedro-de-putina-punco', 'SAN PEDRO DE PUTINA PUNCO', 174),
(1558, 'yanahuaya', 'YANAHUAYA', 174),
(1559, 'anapia', 'ANAPIA', 175),
(1560, 'copani', 'COPANI', 175),
(1561, 'cuturapi', 'CUTURAPI', 175),
(1562, 'ollaraya', 'OLLARAYA', 175),
(1563, 'tinicachi', 'TINICACHI', 175),
(1564, 'unicachi', 'UNICACHI', 175),
(1565, 'alto-biavo', 'ALTO BIAVO', 176),
(1566, 'bajo-biavo', 'BAJO BIAVO', 176),
(1567, 'huallaga', 'HUALLAGA', 176),
(1568, 'san-pablo', 'SAN PABLO', 176),
(1569, 'san-rafael', 'SAN RAFAEL', 176),
(1570, 'agua-blanca', 'AGUA BLANCA', 177),
(1571, 'san-martin', 'SAN MARTIN', 177),
(1572, 'santa-rosa', 'SANTA ROSA', 177),
(1573, 'shatoja', 'SHATOJA', 177),
(1574, 'alto-saposoa', 'ALTO SAPOSOA', 178),
(1575, 'el-eslabon', 'EL ESLABON', 178),
(1576, 'piscoyacu', 'PISCOYACU', 178),
(1577, 'sacanche', 'SACANCHE', 178),
(1578, 'tingo-de-saposoa', 'TINGO DE SAPOSOA', 178),
(1579, 'alonso-de-alvarado', 'ALONSO DE ALVARADO', 179),
(1580, 'barranquita', 'BARRANQUITA', 179),
(1581, 'caynarachi', 'CAYNARACHI', 179),
(1582, 'cuumbuqui', 'CUÑUMBUQUI', 179),
(1583, 'pinto-recodo', 'PINTO RECODO', 179),
(1584, 'rumisapa', 'RUMISAPA', 179),
(1585, 'san-roque-de-cumbaza', 'SAN ROQUE DE CUMBAZA', 179),
(1586, 'shanao', 'SHANAO', 179),
(1587, 'tabalosos', 'TABALOSOS', 179),
(1588, 'zapatero', 'ZAPATERO', 179),
(1589, 'campanilla', 'CAMPANILLA', 180),
(1590, 'huicungo', 'HUICUNGO', 180),
(1591, 'pachiza', 'PACHIZA', 180),
(1592, 'pajarillo', 'PAJARILLO', 180),
(1593, 'calzada', 'CALZADA', 181),
(1594, 'habana', 'HABANA', 181),
(1595, 'jepelacio', 'JEPELACIO', 181),
(1596, 'soritor', 'SORITOR', 181),
(1597, 'yantalo', 'YANTALO', 181),
(1598, 'buenos-aires', 'BUENOS AIRES', 182),
(1599, 'caspizapa', 'CASPIZAPA', 182),
(1600, 'pilluana', 'PILLUANA', 182),
(1601, 'pucacaca', 'PUCACACA', 182),
(1602, 'san-cristobal', 'SAN CRISTOBAL', 182),
(1603, 'san-hilarion', 'SAN HILARION', 182),
(1604, 'shamboyacu', 'SHAMBOYACU', 182),
(1605, 'tingo-de-ponasa', 'TINGO DE PONASA', 182),
(1606, 'tres-unidos', 'TRES UNIDOS', 182),
(1607, 'awajun', 'AWAJUN', 183),
(1608, 'elias-soplin', 'ELIAS SOPLIN', 183),
(1609, 'nueva-cajamarca', 'NUEVA CAJAMARCA', 183),
(1610, 'pardo-miguel', 'PARDO MIGUEL', 183),
(1611, 'posic', 'POSIC', 183),
(1612, 'san-fernando', 'SAN FERNANDO', 183),
(1613, 'yorongos', 'YORONGOS', 183),
(1614, 'yuracyacu', 'YURACYACU', 183),
(1615, 'alberto-leveau', 'ALBERTO LEVEAU', 184),
(1616, 'cacatachi', 'CACATACHI', 184),
(1617, 'chazuta', 'CHAZUTA', 184),
(1618, 'chipurana', 'CHIPURANA', 184),
(1619, 'el-porvenir', 'EL PORVENIR', 184),
(1620, 'huimbayoc', 'HUIMBAYOC', 184),
(1621, 'juan-guerra', 'JUAN GUERRA', 184),
(1622, 'la-banda-de-shilcayo', 'LA BANDA DE SHILCAYO', 184),
(1623, 'morales', 'MORALES', 184),
(1624, 'papaplaya', 'PAPAPLAYA', 184),
(1625, 'san-antonio', 'SAN ANTONIO', 184),
(1626, 'sauce', 'SAUCE', 184),
(1627, 'shapaja', 'SHAPAJA', 184),
(1628, 'nuevo-progreso', 'NUEVO PROGRESO', 185),
(1629, 'polvora', 'POLVORA', 185),
(1630, 'shunte', 'SHUNTE', 185),
(1631, 'uchiza', 'UCHIZA', 185),
(1632, 'cairani', 'CAIRANI', 186),
(1633, 'camilaca', 'CAMILACA', 186),
(1634, 'curibaya', 'CURIBAYA', 186),
(1635, 'huanuara', 'HUANUARA', 186),
(1636, 'quilahuani', 'QUILAHUANI', 186),
(1637, 'ilabaya', 'ILABAYA', 187),
(1638, 'ite', 'ITE', 187),
(1639, 'alto-de-la-alianza', 'ALTO DE LA ALIANZA', 188),
(1640, 'calana', 'CALANA', 188),
(1641, 'ciudad-nueva', 'CIUDAD NUEVA', 188),
(1642, 'coronel-gregorio-albarracin-lanchipa', 'CORONEL GREGORIO ALBARRACIN LANCHIPA', 188),
(1643, 'inclan', 'INCLAN', 188),
(1644, 'la-yarada-los-palos', 'LA YARADA LOS PALOS', 188),
(1645, 'pachia', 'PACHIA', 188),
(1646, 'palca', 'PALCA', 188),
(1647, 'pocollay', 'POCOLLAY', 188),
(1648, 'sama', 'SAMA', 188),
(1649, 'estique', 'ESTIQUE', 189),
(1650, 'estique-pampa', 'ESTIQUE PAMPA', 189),
(1651, 'heroes-albarracin', 'HEROES ALBARRACIN', 189),
(1652, 'sitajara', 'SITAJARA', 189),
(1653, 'susapaya', 'SUSAPAYA', 189),
(1654, 'tarucachi', 'TARUCACHI', 189),
(1655, 'ticaco', 'TICACO', 189),
(1656, 'canoas-de-punta-sal', 'CANOAS DE PUNTA SAL', 190),
(1657, 'casitas', 'CASITAS', 190),
(1658, 'corrales', 'CORRALES', 191),
(1659, 'la-cruz', 'LA CRUZ', 191),
(1660, 'pampas-de-hospital', 'PAMPAS DE HOSPITAL', 191),
(1661, 'san-jacinto', 'SAN JACINTO', 191),
(1662, 'san-juan-de-la-virgen', 'SAN JUAN DE LA VIRGEN', 191),
(1663, 'aguas-verdes', 'AGUAS VERDES', 192),
(1664, 'matapalo', 'MATAPALO', 192),
(1665, 'papayal', 'PAPAYAL', 192),
(1666, 'sepahua', 'SEPAHUA', 193),
(1667, 'tahuania', 'TAHUANIA', 193),
(1668, 'yurua', 'YURUA', 193),
(1669, 'campoverde', 'CAMPOVERDE', 194),
(1670, 'iparia', 'IPARIA', 194),
(1671, 'manantay', 'MANANTAY', 194),
(1672, 'masisea', 'MASISEA', 194),
(1673, 'nueva-requena', 'NUEVA REQUENA', 194),
(1674, 'yarinacocha', 'YARINACOCHA', 194),
(1675, 'alexander-von-humboldt', 'ALEXANDER VON HUMBOLDT', 195),
(1676, 'curimana', 'CURIMANA', 195),
(1677, 'irazola', 'IRAZOLA', 195),
(1678, 'neshuya', 'NESHUYA', 195);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `id` int NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`id`, `gender`) VALUES
(1, 'FEMENINO'),
(2, 'MASCULINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `id` int NOT NULL,
  `client_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `interest_rate` int DEFAULT NULL,
  `total_interest` decimal(10,2) DEFAULT NULL,
  `admin_fee` decimal(10,2) DEFAULT NULL,
  `risk_fee` decimal(10,2) DEFAULT NULL,
  `total_payable` decimal(10,2) DEFAULT NULL,
  `id_tipoPago` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `idEstadoPrestamo` int NOT NULL,
  `credit_portfolio` int DEFAULT NULL,
  `craete_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `periodopagos` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `occupation`
--

CREATE TABLE `occupation` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `occupation`
--

INSERT INTO `occupation` (`id`, `name`) VALUES
(1, 'TECNICO INFORMATICO'),
(2, 'TECNICO AGROPECUARIO\r\n'),
(4, 'TECNICO AGROPECUARIO'),
(5, 'TECNICO AGROPECUARIO'),
(6, 'TECNICO AGROPECUARIO'),
(7, 'TECNICO AGROPECUARIO'),
(8, 'TECNICO AGROPECUARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payments_register_credit_client`
--

CREATE TABLE `payments_register_credit_client` (
  `id` int NOT NULL,
  `client_id` int NOT NULL,
  `user_id` int NOT NULL,
  `date_prestamo` date NOT NULL,
  `payment_start_date` date NOT NULL,
  `payment_end_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `id_type_payment` int NOT NULL,
  `total_amount_verification` decimal(10,2) NOT NULL,
  `current_payment_amount` decimal(10,2) NOT NULL,
  `last_payment_amount` int NOT NULL,
  `total_payments` int NOT NULL,
  `idEstadoPrestamo` int NOT NULL,
  `tasaInteres` decimal(10,2) NOT NULL,
  `tramite_dministrativo` decimal(10,2) NOT NULL,
  `central_riesgo` decimal(10,2) NOT NULL,
  `total_payable` decimal(10,2) NOT NULL,
  `create_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_schedule`
--

CREATE TABLE `payment_schedule` (
  `id` int NOT NULL,
  `credit_client_id` int NOT NULL,
  `scheduled_date` date NOT NULL,
  `scheduled_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT '0.00',
  `status` enum('pendiente','pagado') COLLATE utf8mb4_spanish2_ci DEFAULT 'pendiente',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persontype`
--

CREATE TABLE `persontype` (
  `id` int NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `persontype`
--

INSERT INTO `persontype` (`id`, `type`) VALUES
(1, 'Natural'),
(2, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int NOT NULL,
  `slug` varchar(100) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `departamentos_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `slug`, `nombre`, `departamentos_id`) VALUES
(1, 'bagua', 'BAGUA', 1),
(2, 'bongara', 'BONGARA', 1),
(3, 'chachapoyas', 'CHACHAPOYAS', 1),
(4, 'condorcanqui', 'CONDORCANQUI', 1),
(5, 'luya', 'LUYA', 1),
(6, 'rodriguez-de-mendoza', 'RODRIGUEZ DE MENDOZA', 1),
(7, 'utcubamba', 'UTCUBAMBA', 1),
(8, 'aija', 'AIJA', 2),
(9, 'antonio-raimondi', 'ANTONIO RAIMONDI', 2),
(10, 'asuncion', 'ASUNCION', 2),
(11, 'bolognesi', 'BOLOGNESI', 2),
(12, 'carhuaz', 'CARHUAZ', 2),
(13, 'carlos-fermin-fitzcarrald', 'CARLOS FERMIN FITZCARRALD', 2),
(14, 'casma', 'CASMA', 2),
(15, 'corongo', 'CORONGO', 2),
(16, 'huaraz', 'HUARAZ', 2),
(17, 'huari', 'HUARI', 2),
(18, 'huarmey', 'HUARMEY', 2),
(19, 'huaylas', 'HUAYLAS', 2),
(20, 'mariscal-luzuriaga', 'MARISCAL LUZURIAGA', 2),
(21, 'ocros', 'OCROS', 2),
(22, 'pallasca', 'PALLASCA', 2),
(23, 'pomabamba', 'POMABAMBA', 2),
(24, 'recuay', 'RECUAY', 2),
(25, 'santa', 'SANTA', 2),
(26, 'sihuas', 'SIHUAS', 2),
(27, 'yungay', 'YUNGAY', 2),
(28, 'abancay', 'ABANCAY', 3),
(29, 'andahuaylas', 'ANDAHUAYLAS', 3),
(30, 'antabamba', 'ANTABAMBA', 3),
(31, 'aymaraes', 'AYMARAES', 3),
(32, 'chincheros', 'CHINCHEROS', 3),
(33, 'cotabambas', 'COTABAMBAS', 3),
(34, 'grau', 'GRAU', 3),
(35, 'arequipa', 'AREQUIPA', 4),
(36, 'camana', 'CAMANA', 4),
(37, 'caraveli', 'CARAVELI', 4),
(38, 'castilla', 'CASTILLA', 4),
(39, 'caylloma', 'CAYLLOMA', 4),
(40, 'condesuyos', 'CONDESUYOS', 4),
(41, 'islay', 'ISLAY', 4),
(42, 'la-union', 'LA UNION', 4),
(43, 'cangallo', 'CANGALLO', 5),
(44, 'huamanga', 'HUAMANGA', 5),
(45, 'huanca-sancos', 'HUANCA SANCOS', 5),
(46, 'huanta', 'HUANTA', 5),
(47, 'la-mar', 'LA MAR', 5),
(48, 'lucanas', 'LUCANAS', 5),
(49, 'parinacochas', 'PARINACOCHAS', 5),
(50, 'paucar-del-sara-sara', 'PAUCAR DEL SARA SARA', 5),
(51, 'sucre', 'SUCRE', 5),
(52, 'victor-fajardo', 'VICTOR FAJARDO', 5),
(53, 'vilcas-huaman', 'VILCAS HUAMAN', 5),
(54, 'cajabamba', 'CAJABAMBA', 6),
(55, 'cajamarca', 'CAJAMARCA', 6),
(56, 'celendin', 'CELENDIN', 6),
(57, 'chota', 'CHOTA', 6),
(58, 'contumaza', 'CONTUMAZA', 6),
(59, 'cutervo', 'CUTERVO', 6),
(60, 'hualgayoc', 'HUALGAYOC', 6),
(61, 'jaen', 'JAEN', 6),
(62, 'san-ignacio', 'SAN IGNACIO', 6),
(63, 'san-marcos', 'SAN MARCOS', 6),
(64, 'san-miguel', 'SAN MIGUEL', 6),
(65, 'san-pablo', 'SAN PABLO', 6),
(66, 'santa-cruz', 'SANTA CRUZ', 6),
(67, 'callao', 'CALLAO', 7),
(68, 'acomayo', 'ACOMAYO', 8),
(69, 'anta', 'ANTA', 8),
(70, 'calca', 'CALCA', 8),
(71, 'canas', 'CANAS', 8),
(72, 'canchis', 'CANCHIS', 8),
(73, 'chumbivilcas', 'CHUMBIVILCAS', 8),
(74, 'cusco', 'CUSCO', 8),
(75, 'espinar', 'ESPINAR', 8),
(76, 'la-convencion', 'LA CONVENCION', 8),
(77, 'paruro', 'PARURO', 8),
(78, 'paucartambo', 'PAUCARTAMBO', 8),
(79, 'quispicanchi', 'QUISPICANCHI', 8),
(80, 'urubamba', 'URUBAMBA', 8),
(81, 'acobamba', 'ACOBAMBA', 9),
(82, 'angaraes', 'ANGARAES', 9),
(83, 'castrovirreyna', 'CASTROVIRREYNA', 9),
(84, 'churcampa', 'CHURCAMPA', 9),
(85, 'huancavelica', 'HUANCAVELICA', 9),
(86, 'huaytara', 'HUAYTARA', 9),
(87, 'tayacaja', 'TAYACAJA', 9),
(88, 'ambo', 'AMBO', 10),
(89, 'dos-de-mayo', 'DOS DE MAYO', 10),
(90, 'huacaybamba', 'HUACAYBAMBA', 10),
(91, 'huamalies', 'HUAMALIES', 10),
(92, 'huanuco', 'HUANUCO', 10),
(93, 'lauricocha', 'LAURICOCHA', 10),
(94, 'leoncio-prado', 'LEONCIO PRADO', 10),
(95, 'maraon', 'MARAÑON', 10),
(96, 'pachitea', 'PACHITEA', 10),
(97, 'puerto-inca', 'PUERTO INCA', 10),
(98, 'yarowilca', 'YAROWILCA', 10),
(99, 'chincha', 'CHINCHA', 11),
(100, 'ica', 'ICA', 11),
(101, 'nasca', 'NASCA', 11),
(102, 'palpa', 'PALPA', 11),
(103, 'pisco', 'PISCO', 11),
(104, 'chanchamayo', 'CHANCHAMAYO', 12),
(105, 'chupaca', 'CHUPACA', 12),
(106, 'concepcion', 'CONCEPCION', 12),
(107, 'huancayo', 'HUANCAYO', 12),
(108, 'jauja', 'JAUJA', 12),
(109, 'junin', 'JUNIN', 12),
(110, 'satipo', 'SATIPO', 12),
(111, 'tarma', 'TARMA', 12),
(112, 'yauli', 'YAULI', 12),
(113, 'ascope', 'ASCOPE', 13),
(114, 'bolivar', 'BOLIVAR', 13),
(115, 'chepen', 'CHEPEN', 13),
(116, 'gran-chimu', 'GRAN CHIMU', 13),
(117, 'julcan', 'JULCAN', 13),
(118, 'otuzco', 'OTUZCO', 13),
(119, 'pacasmayo', 'PACASMAYO', 13),
(120, 'pataz', 'PATAZ', 13),
(121, 'sanchez-carrion', 'SANCHEZ CARRION', 13),
(122, 'santiago-de-chuco', 'SANTIAGO DE CHUCO', 13),
(123, 'trujillo', 'TRUJILLO', 13),
(124, 'viru', 'VIRU', 13),
(125, 'chiclayo', 'CHICLAYO', 14),
(126, 'ferreafe', 'FERREÑAFE', 14),
(127, 'lambayeque', 'LAMBAYEQUE', 14),
(128, 'barranca', 'BARRANCA', 15),
(129, 'cajatambo', 'CAJATAMBO', 15),
(130, 'caete', 'CAÑETE', 15),
(131, 'canta', 'CANTA', 15),
(132, 'huaral', 'HUARAL', 15),
(133, 'huarochiri', 'HUAROCHIRI', 15),
(134, 'huaura', 'HUAURA', 15),
(135, 'lima', 'LIMA', 15),
(136, 'oyon', 'OYON', 15),
(137, 'yauyos', 'YAUYOS', 15),
(138, 'alto-amazonas', 'ALTO AMAZONAS', 16),
(139, 'datem-del-maraon', 'DATEM DEL MARAÑON', 16),
(140, 'loreto', 'LORETO', 16),
(141, 'mariscal-ramon-castilla', 'MARISCAL RAMON CASTILLA', 16),
(142, 'maynas', 'MAYNAS', 16),
(143, 'putumayo', 'PUTUMAYO', 16),
(144, 'requena', 'REQUENA', 16),
(145, 'ucayali', 'UCAYALI', 16),
(146, 'manu', 'MANU', 17),
(147, 'tahuamanu', 'TAHUAMANU', 17),
(148, 'tambopata', 'TAMBOPATA', 17),
(149, 'general-sanchez-cerro', 'GENERAL SANCHEZ CERRO', 18),
(150, 'ilo', 'ILO', 18),
(151, 'mariscal-nieto', 'MARISCAL NIETO', 18),
(152, 'daniel-alcides-carrion', 'DANIEL ALCIDES CARRION', 19),
(153, 'oxapampa', 'OXAPAMPA', 19),
(154, 'pasco', 'PASCO', 19),
(155, 'ayabaca', 'AYABACA', 20),
(156, 'huancabamba', 'HUANCABAMBA', 20),
(157, 'morropon', 'MORROPON', 20),
(158, 'paita', 'PAITA', 20),
(159, 'piura', 'PIURA', 20),
(160, 'sechura', 'SECHURA', 20),
(161, 'sullana', 'SULLANA', 20),
(162, 'talara', 'TALARA', 20),
(163, 'azangaro', 'AZANGARO', 21),
(164, 'carabaya', 'CARABAYA', 21),
(165, 'chucuito', 'CHUCUITO', 21),
(166, 'el-collao', 'EL COLLAO', 21),
(167, 'huancane', 'HUANCANE', 21),
(168, 'lampa', 'LAMPA', 21),
(169, 'melgar', 'MELGAR', 21),
(170, 'moho', 'MOHO', 21),
(171, 'puno', 'PUNO', 21),
(172, 'san-antonio-de-putina', 'SAN ANTONIO DE PUTINA', 21),
(173, 'san-roman', 'SAN ROMAN', 21),
(174, 'sandia', 'SANDIA', 21),
(175, 'yunguyo', 'YUNGUYO', 21),
(176, 'bellavista', 'BELLAVISTA', 22),
(177, 'el-dorado', 'EL DORADO', 22),
(178, 'huallaga', 'HUALLAGA', 22),
(179, 'lamas', 'LAMAS', 22),
(180, 'mariscal-caceres', 'MARISCAL CACERES', 22),
(181, 'moyobamba', 'MOYOBAMBA', 22),
(182, 'picota', 'PICOTA', 22),
(183, 'rioja', 'RIOJA', 22),
(184, 'san-martin', 'SAN MARTIN', 22),
(185, 'tocache', 'TOCACHE', 22),
(186, 'candarave', 'CANDARAVE', 23),
(187, 'jorge-basadre', 'JORGE BASADRE', 23),
(188, 'tacna', 'TACNA', 23),
(189, 'tarata', 'TARATA', 23),
(190, 'contralmirante-villar', 'CONTRALMIRANTE VILLAR', 24),
(191, 'tumbes', 'TUMBES', 24),
(192, 'zarumilla', 'ZARUMILLA', 24),
(193, 'atalaya', 'ATALAYA', 25),
(194, 'coronel-portillo', 'CORONEL PORTILLO', 25),
(195, 'padre-abad', 'PADRE ABAD', 25),
(196, 'purus', 'PURUS', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `statusPrestamos`
--

CREATE TABLE `statusPrestamos` (
  `id` int NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `statusPrestamos`
--

INSERT INTO `statusPrestamos` (`id`, `estado`) VALUES
(1, 'Solicitado'),
(2, 'Reembolsado'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbInterest`
--

CREATE TABLE `tbInterest` (
  `id` int NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL DEFAULT '8.00',
  `admin_fee` decimal(10,2) NOT NULL,
  `risk_fee` decimal(10,2) NOT NULL,
  `status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tbInterest`
--

INSERT INTO `tbInterest` (`id`, `interest_rate`, `admin_fee`, `risk_fee`, `status`) VALUES
(1, 8.00, 0.01, 0.01, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoPago`
--

CREATE TABLE `tipoPago` (
  `id` int NOT NULL,
  `tipo` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipoPago`
--

INSERT INTO `tipoPago` (`id`, `tipo`) VALUES
(1, 'Diario'),
(2, 'Semanal'),
(3, 'Mensual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `lastname` varchar(120) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `password` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `status` int DEFAULT NULL,
  `fechainicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `typeuser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `password`, `email`, `status`, `fechainicio`, `created_at`, `typeuser`) VALUES
(1, 'Efraesl', 'Efraesl', '123123123', 'efrael2001@gmail.com', 1, '2025-03-11 20:52:26', '', 0),
(2, 'Efrael', 'Villanueva', '$2y$10$zRKuNT.2fSKmyyd6qODoDOhUoICfDTkC6TAP/.RkSwhuPPI78VU0q', 'asdasd@gmail.com', 1, '2025-03-06 05:37:54', '2025-03-05 21:57:05', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address_credit_user`
--
ALTER TABLE `address_credit_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `civil_state`
--
ALTER TABLE `civil_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `credit_user`
--
ALTER TABLE `credit_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `daysExcluded`
--
ALTER TABLE `daysExcluded`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deuda_pendiente`
--
ALTER TABLE `deuda_pendiente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `occupation`
--
ALTER TABLE `occupation`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payments_register_credit_client`
--
ALTER TABLE `payments_register_credit_client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment_schedule`
--
ALTER TABLE `payment_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persontype`
--
ALTER TABLE `persontype`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `statusPrestamos`
--
ALTER TABLE `statusPrestamos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbInterest`
--
ALTER TABLE `tbInterest`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoPago`
--
ALTER TABLE `tipoPago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address_credit_user`
--
ALTER TABLE `address_credit_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `civil_state`
--
ALTER TABLE `civil_state`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `credit_user`
--
ALTER TABLE `credit_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `daysExcluded`
--
ALTER TABLE `daysExcluded`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `deuda_pendiente`
--
ALTER TABLE `deuda_pendiente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1679;

--
-- AUTO_INCREMENT de la tabla `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `occupation`
--
ALTER TABLE `occupation`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `payments_register_credit_client`
--
ALTER TABLE `payments_register_credit_client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment_schedule`
--
ALTER TABLE `payment_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persontype`
--
ALTER TABLE `persontype`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `statusPrestamos`
--
ALTER TABLE `statusPrestamos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbInterest`
--
ALTER TABLE `tbInterest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipoPago`
--
ALTER TABLE `tipoPago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
