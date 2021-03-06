-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2019 a las 05:46:18
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `melectro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_app`
--

CREATE TABLE `config_app` (
  `idconfig_app` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `ruc` text NOT NULL,
  `dep` text NOT NULL,
  `dist` text NOT NULL,
  `telefono` text NOT NULL,
  `telefono_2` text NOT NULL,
  `email` text NOT NULL,
  `bcp_cta` text NOT NULL,
  `bcp_name` text NOT NULL,
  `intbk_cta` text NOT NULL,
  `intbk_name` text NOT NULL,
  `sctk_cta` text NOT NULL,
  `sctk_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `config_app`
--

INSERT INTO `config_app` (`idconfig_app`, `nombre`, `ruc`, `dep`, `dist`, `telefono`, `telefono_2`, `email`, `bcp_cta`, `bcp_name`, `intbk_cta`, `intbk_name`, `sctk_cta`, `sctk_name`) VALUES
(1, 'Mega Electro Industrial SAC ', '20557579258', 'Lima - Perú', 'Villa el Salvador', '', '', 'Megaindustrial@gmail.com', '194-20196458-0-15', 'JIMMY JAKSON FARFAN SUAREZ', '194-20196458-0-15', 'JIMMY JAKSON FARFAN SUAREZ', '194-20196458-0-15', 'JIMMY JAKSON FARFAN SUAREZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `iddetalles` int(10) NOT NULL,
  `idventas` int(10) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `envio` text NOT NULL,
  `metodoPago` text NOT NULL,
  `precio` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idestado_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `idestado_pedido` int(11) NOT NULL,
  `nombre_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_pedido`
--

INSERT INTO `estado_pedido` (`idestado_pedido`, `nombre_estado`) VALUES
(1, 'pedido recibido'),
(2, 'pedido confirmado'),
(3, 'pedido listo'),
(4, 'pedido entregado'),
(5, 'pedido cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `idprivilegios` int(5) NOT NULL,
  `tipo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`idprivilegios`, `tipo`) VALUES
(1, 'cliente'),
(2, 'administrador'),
(3, 'superusuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idproducto` int(11) NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `imagen` varchar(400) DEFAULT NULL,
  `um` varchar(10) DEFAULT NULL,
  `presentacion` varchar(10) DEFAULT NULL,
  `precio` varchar(100) DEFAULT NULL,
  `descuento` varchar(100) NOT NULL,
  `moneda` varchar(5) DEFAULT NULL,
  `igv` varchar(10) DEFAULT NULL,
  `marca` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idproducto`, `codigo`, `nombre`, `descripcion`, `imagen`, `um`, `presentacion`, `precio`, `descuento`, `moneda`, `igv`, `marca`) VALUES
(1, '00BD', 'RIEL DIN SIMETRICO 35MM 2 MTS   ', 'NSYSDR200BD', 'r/upload/1.jpg', 'UNI', '0', '29.25', '', 'MN', 'NO', 'SCHNEIDER'),
(2, '0205', 'CAJA MICROPRAGMA ADOZADO 2 POLOS IP40   ', '10205', 'r/upload/2.jpg', 'UNI', '0', '11.1', '', 'MN', 'NO', 'SCHNEIDER'),
(3, '0206', 'CAJA MICROPRAGMA ADOZADO 4 POLOS IP40   ', '10206', 'r/upload/3.jpg', 'UNI', '0', '18.49', '', 'MN', 'NO', 'SCHNEIDER'),
(4, '0225', 'INTERRUPTOR DIFERENCIAL ilDK 2X25A 30mA    ', 'A9R50225', 'r/upload/4.jpg', 'UNI', '0', '182.31', '', 'MN', 'NO', 'SCHNEIDER'),
(5, '0240', 'INTERRUPTOR DIFERENCIAL ilDK 2X40A 30mA    ', 'A9R50240', 'r/upload/5.jpg', 'UNI', '0', '228.48', '', 'MN', 'NO', 'SCHNEIDER'),
(6, '0438', 'TOROIDES CERRADOS 85AMP      ', '50438', 'r/upload/6.png', 'UNI', '0', '273.6', '', 'MN', 'NO', 'SCHNEIDER'),
(7, '0439', 'TOROIDES CERRADOS 160AMP      ', '50439', 'r/upload/7.jpg', 'UNI', '0', '369.72', '', 'MN', 'NO', 'SCHNEIDER'),
(8, '0440', 'TOROIDES CERRADOS 250AMP      ', '50440', 'r/upload/8.jpg', 'UNI', '0', '470.4', '', 'MN', 'NO', 'SCHNEIDER'),
(9, '0441', 'TOROIDES CERRADOS 400AMP      ', '50441', 'r/upload/6.png', 'UNI', '0', '825.27', '', 'MN', 'NO', 'SCHNEIDER'),
(10, '0442', 'TOROIDES CERRADOS 630AMP      ', '50442', 'r/upload/6.png', 'UNI', '0', '1359.85', '', 'MN', 'NO', 'SCHNEIDER'),
(11, '0630', 'INT REGULABLE 112-160AMP 85KA/220V     ', 'LV430630', 'r/upload/9.jpg', 'BL', '0', '1003.32', '', 'MN', 'NO', 'SCHNEIDER'),
(12, '0631', 'INT REGULABLE 87.5-125AMP 85KA/220V     ', 'LV430631', 'r/upload/10.jpg', 'UNI', '0', '855.93', '', 'MN', 'NO', 'SCHNEIDER'),
(13, '0632', 'CONTACTORES BIPOLAR 2NA 25AMP 230/240VAC    ', 'A9C20632', 'r/upload/11.jpg', 'UNI', '0', '132.96', '', 'MN', 'NO', 'SCHNEIDER'),
(14, '0642', 'CONTACTORES BIPOLAR 2NA 40AMP 230/240VAC    ', 'A9C20642', 'r/upload/12.jpg', 'UNI', '0', '254.36', '', 'MN', 'NO', 'SCHNEIDER'),
(15, '0670', 'INT REG. 112-160AMP 100KA/220V     ', 'LV430670', 'r/upload/12.jpg', 'UNI', '0', '1949.19', '', 'MN', 'NO', 'SCHNEIDER'),
(16, '0671', 'INT REG. 87.5-125AMP 100KA/220V     ', 'LV430671', 'r/upload/13.jpg', 'UNI', '0', '1909.51', '', 'MN', 'NO', 'SCHNEIDER'),
(17, '0730', 'CONTACTOR 25 AMP 110VAC     ', '110730', 'r/upload/14.jpg', 'UNI', '0', '159.5', '', 'MN', 'NO', 'G.E.'),
(18, '0732', 'CL25A300T5 CONTACTOR 25 AMP 220VAC    ', '110732', 'r/upload/15.jpg', 'UNI', '0', '159.5', '', 'MN', 'NO', 'G.E.'),
(19, '0735', 'CONTACTOR 25 AMP 440VAC     ', '110735', 'r/upload/16.jpg', 'UNI', '0', '159.5', '', 'MN', 'NO', 'G.E.'),
(20, '0811', 'TELERRUPTOR UNIPOLAR 16AMP 220/240VAC     ', 'A9C30811', 'r/upload/17.jpg', 'UNI', '0', '103.61', '', 'MN', 'NO', 'SCHNEIDER'),
(21, '0812', 'TELERRUPTOR BIPOLAR 16AMP 220/240VAC     ', 'A9C30812', 'r/upload/18.jpg', 'UNI', '0', '165.65', '', 'MN', 'NO', 'SCHNEIDER'),
(22, '10101', 'INT. TIPO RIEL 1X01A 6KA/400VAC    ', 'BKN', 'r/upload/19.png', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(23, '10102', 'INT. TIPO RIEL 1X02A 6KA/400VAC    ', 'BKN', 'r/upload/20.jpg', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(24, '10104', 'INT. TIPO RIEL 1X04A 6KA/400VAC    ', 'BKN', 'r/upload/20.jpg', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(25, '10106', 'INT. TIPO RIEL 1X06A 6KA/400VAC    ', 'BKN', 'r/upload/4.jpg', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(26, '101060', 'PARA CK75CA3-CK08CA3 CONTROL 380V     ', 'BOBINA', 'r/upload/21.jpg', 'UNI', '0', '345.5', '', 'MN', 'NO', 'G.E.'),
(27, '10110', 'INT. TIPO RIEL 1X10A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '24.08', '', 'MN', 'NO', 'LS'),
(28, '10116', 'INT. TIPO RIEL 1X16A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '22.5', '', 'MN', 'NO', 'LS'),
(29, '10117', 'INT. TIPO RIEL 1X20A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '22.5', '', 'MN', 'NO', 'LS'),
(30, '10121', 'TIPO RIEL BKH 2X125A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '239.24', '', 'MN', 'NO', 'LS'),
(31, '101211', 'GUARDAMOTOR GPS1B-S 0.1-0.16AMP.      ', 'GPS1BSAA', '', 'UNI', '0', '140.5', '', 'MN', 'NO', 'G.E.'),
(32, '101212', 'GUARDAMOTOR GPS1B-S 0.16-0.25AMP.      ', 'GPS1BSAB', '', 'UNI', '0', '140.5', '', 'MN', 'NO', 'G.E.'),
(33, '101213', 'GUARDAMOTOR GPS1B-S 0.25-0.4AMP.      ', 'GPS1BSAC', '', 'UNI', '0', '140.5', '', 'MN', 'NO', 'G.E.'),
(34, '101214', 'GUARDAMOTOR GPS1B-S 0.4-0.63AMP.      ', 'GPS1BSAD', '', 'UNI', '0', '140.5', '', 'MN', 'NO', 'G.E.'),
(35, '101215', 'GUARDAMOTOR GPS1B-S 0.63-1AMP.      ', 'GPS1BSAE', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(36, '101216', 'GUARDAMOTOR GPS1B-S 1-1.6AMP.      ', 'GPS1BSAF', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(37, '101217', 'GUARDAMOTOR GPS1B-S 1.6-2.5AMP.      ', 'GPS1BSAG', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(38, '101218', 'GUARDAMOTOR GPS1B-S 2.5-4AMP.      ', 'GPS1BSAH', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(39, '101219', 'GUARDAMOTOR GPS1B-S 4-6.3AMP.      ', 'GPS1BSAJ', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(40, '101220', 'GUARDAMOTOR GPS1B-S 6.3-10AMP.      ', 'GPS1BSAK', '', 'UNI', '0', '182.5', '', 'MN', 'NO', 'G.E.'),
(41, '101221', 'GUARDAMOTOR GPS1B-S 9-13AMP.      ', 'GPS1BSAL', '', 'UNI', '0', '241.5', '', 'MN', 'NO', 'G.E.'),
(42, '101222', 'GUARDAMOTOR GPS1B-S 11-16AMP.      ', 'GPS1BSAM', '', 'UNI', '0', '241.5', '', 'MN', 'NO', 'G.E.'),
(43, '101223', 'GUARDAMOTOR GPS1B-S 14-20AMP.      ', 'GPS1BSAN', '', 'UNI', '0', '263', '', 'MN', 'NO', 'G.E.'),
(44, '101224', 'GUARDAMOTOR GPS1B-S 19-25AMP.      ', 'GPS1BSAP', '', 'UNI', '0', '305.5', '', 'MN', 'NO', 'G.E.'),
(45, '101225', 'GUARDAMOTOR GPS1B-S 24-32AMP.      ', 'GPS1BSAR', '', 'UNI', '0', '387.5', '', 'MN', 'NO', 'G.E.'),
(46, '101230', 'GUARDAMOTOR GPS2B-S 24-32AMP.      ', 'GPS2BSAR', '', 'UNI', '0', '523.5', '', 'MN', 'NO', 'G.E.'),
(47, '101231', 'GUARDAMOTOR GPS2B-S 28-40AMP.      ', 'GPS2BSAS', '', 'UNI', '0', '565.5', '', 'MN', 'NO', 'G.E.'),
(48, '101232', 'GUARDAMOTOR GPS2B-S 35-50AMP.      ', 'GPS2BSAT', '', 'UNI', '0', '621.5', '', 'MN', 'NO', 'G.E.'),
(49, '101233', 'GUARDAMOTOR GPS2B-S 45-63AMP.      ', 'GPS2BSAU', '', 'UNI', '0', '665', '', 'MN', 'NO', 'G.E.'),
(50, '101239', 'GUARDAMOTOR GPS1B-H 1-1.6AMP.      ', 'GPS1BHAF', '', 'UNI', '0', '168.5', '', 'MN', 'NO', 'G.E.'),
(51, '101240', 'GUARDAMOTOR GPS1B-H 1.6-2.5AMP.      ', 'GPS1BHAG', '', 'UNI', '0', '168.5', '', 'MN', 'NO', 'G.E.'),
(52, '101241', 'GUARDAMOTOR GPS1B-H 2.5-4AMP.      ', 'GPS1BHAH', '', 'UNI', '0', '168.5', '', 'MN', 'NO', 'G.E.'),
(53, '101242', 'GUARDAMOTOR GPS1B-H 4-6.3AMP.      ', 'GPS1BHAJ', '', 'UNI', '0', '168.5', '', 'MN', 'NO', 'G.E.'),
(54, '101243', 'GUARDAMOTOR GPS1B-H 6.3-10AMP.      ', 'GPS1BHAK', '', 'UNI', '0', '192.5', '', 'MN', 'NO', 'G.E.'),
(55, '101244', 'GUARDAMOTOR GPS1B-H 9-13AMP.      ', 'GPS1BHAL', '', 'UNI', '0', '257', '', 'MN', 'NO', 'G.E.'),
(56, '101245', 'GUARDAMOTOR GPS1B-H 11-16AMP.      ', 'GPS1BHAM', '', 'UNI', '0', '257', '', 'MN', 'NO', 'G.E.'),
(57, '101246', 'GUARDAMOTOR GPS1B-H 14-20AMP.      ', 'GPS1BHAN', '', 'UNI', '0', '278', '', 'MN', 'NO', 'G.E.'),
(58, '101247', 'GUARDAMOTOR GPS1B-H 19-25AMP.      ', 'GPS1BHAP', '', 'UNI', '0', '313', '', 'MN', 'NO', 'G.E.'),
(59, '101248', 'GUARDAMOTOR GPS1B-H 24-32AMP.      ', 'GPS1BHAR', '', 'UNI', '0', '395', '', 'MN', 'NO', 'G.E.'),
(60, '10125', 'INT. TIPO RIEL 1X25A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '22.03', '', 'MN', 'NO', 'LS'),
(61, '101254', 'GUARDAMOTOR GPS2B-H 28-40AMP.      ', 'GPS2BHAS', '', 'UNI', '0', '622', '', 'MN', 'NO', 'G.E.'),
(62, '101255', 'GUARDAMOTOR GPS2B-H 35-50AMP.      ', 'GPS2BHAT', '', 'UNI', '0', '683.5', '', 'MN', 'NO', 'G.E.'),
(63, '101256', 'GUARDAMOTOR GPS2B-H 45-63AMP.      ', 'GPS2BHAU', '', 'UNI', '0', '731.5', '', 'MN', 'NO', 'G.E.'),
(64, '101303', '101303 CONTACTO AUX. FRONTAL 1NA    ', 'GPAC10FBA', '', 'UNI', '0', '28', '', 'MN', 'NO', 'G.E.'),
(65, '101304', 'CONTACTO AUXILIAR FRONTAL 1NC     ', 'GPAC01FBA', '', 'UNI', '0', '28', '', 'MN', 'NO', 'G.E.'),
(66, '101305', 'CONTACTO AUXILIAR LATERAL 1NA+1NC     ', 'GPAC11LLA', '', 'UNI', '0', '36', '', 'MN', 'NO', 'G.E.'),
(67, '101311', 'CONTACTO DE ALARMA 1NA     ', 'GPAL10FRA', '', 'UNI', '0', '32.5', '', 'MN', 'NO', 'G.E.'),
(68, '101312', 'CONTACTO DE ALARMA 1NC     ', 'GPAL01FRA', '', 'UNI', '0', '32.5', '', 'MN', 'NO', 'G.E.'),
(69, '101313', 'CONTACTO AUX. FALLA 1NA+ AUX. 1NA   ', 'GPAD1010LLA', '', 'UNI', '0', '53', '', 'MN', 'NO', 'G.E.'),
(70, '101317', 'CONTACTO LAT. ALARMA DE CORTO 1NA+1NC   ', 'GPAE11LLA', '', 'UNI', '0', '67.5', '', 'MN', 'NO', 'G.E.'),
(71, '10132', 'INT. TIPO RIEL 1X32A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '22.5', '', 'MN', 'NO', 'LS'),
(72, '101365', 'CAJA DE PLÁSTICO IP41 MONT. EN SUPERFICIE  ', 'GPES41A', '', 'UNI', '0', '42.5', '', 'MN', 'NO', 'G.E.'),
(73, '101395', 'BARRA PARA 3 GPS1 PASO 54MM T/PIN 63A ', '101395', '', 'UNI', '0 UNI', '41', '', 'MN', 'NO', 'G.E.'),
(74, '101397', 'BARRA PARA 5 GPS1 PASO 54MM T/PIN 63A ', '101397', '', 'UNI', '0 UNI', '54', '', 'MN', 'NO', 'G.E.'),
(75, '10140', 'INT. TIPO RIEL 1X40A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(76, '10141', 'INT. TIPO RIEL 1X50A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '26.68', '', 'MN', 'NO', 'LS'),
(77, '10202', 'INT. TIPO RIEL 2X02A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '48.33', '', 'MN', 'NO', 'LS'),
(78, '10204', 'INT. TIPO RIEL 2X04A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '48.33', '', 'MN', 'NO', 'LS'),
(79, '10206', 'INT. TIPO RIEL 2X06A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '33', '', 'MN', 'NO', 'LS'),
(80, '10210', 'INT. TIPO RIEL 2X10A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '25.12', '', 'MN', 'NO', 'LS'),
(81, '10216', 'INT. TIPO RIEL 2X16A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '24.6', '', 'MN', 'NO', 'LS'),
(82, '10220', 'INT. TIPO RIEL 2X20A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '24.6', '', 'MN', 'NO', 'LS'),
(83, '10225', 'INT. TIPO RIEL 2X25A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '24.6', '', 'MN', 'NO', 'LS'),
(84, '10232', 'INT. TIPO RIEL 2X32A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '24.6', '', 'MN', 'NO', 'LS'),
(85, '10240', 'INT. TIPO RIEL 2X40A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '32.32', '', 'MN', 'NO', 'LS'),
(86, '10250', 'INT. TIPO RIEL 2X50A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '32.32', '', 'MN', 'NO', 'LS'),
(87, '10263', 'INT. TIPO RIEL 2X63A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '45.14', '', 'MN', 'NO', 'LS'),
(88, '10302', 'INT. TIPO RIEL 3X02A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '73.48', '', 'MN', 'NO', 'LS'),
(89, '10304', 'INT. TIPO RIEL 3X04A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '73.48', '', 'MN', 'NO', 'LS'),
(90, '10306', 'INT. TIPO RIEL 3X06A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '73.48', '', 'MN', 'NO', 'LS'),
(91, '10310', 'INT. TIPO RIEL 3X10A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '58.44', '', 'MN', 'NO', 'LS'),
(92, '10316', 'INT. TIPO RIEL 3X16A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '57.24', '', 'MN', 'NO', 'LS'),
(93, '10320', 'INT. TIPO RIEL 3X20A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '57.24', '', 'MN', 'NO', 'LS'),
(94, '10325', 'INT. TIPO RIEL 3X25A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '57.24', '', 'MN', 'NO', 'LS'),
(95, '10332', 'INT. TIPO RIEL 3X32A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '57.24', '', 'MN', 'NO', 'LS'),
(96, '10340', 'INT. TIPO RIEL 3X40A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '59.23', '', 'MN', 'NO', 'LS'),
(97, '10350', 'INT. TIPO RIEL 3X50A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '62.55', '', 'MN', 'NO', 'LS'),
(98, '10363', 'INT. TIPO RIEL 3X63A 6KA/400VAC    ', 'BKN', '', 'UNI', '0', '65', '', 'MN', 'NO', 'LS'),
(99, '104705', 'CONTACTO AUXILIAR LATERAL 1NA+1NC     ', '104705', '', 'UNI', '0', '38', '', 'MN', 'NO', 'G.E.'),
(100, '104707', 'CONTACTO AUXILIAR LATERAL 1NA+1NC     ', '104707', '', 'UNI', '0', '38', '', 'MN', 'NO', 'G.E.'),
(101, '104715', 'ANTIPARASITARIO PARA CL00...CL45, 130-250V     ', '104715', '', 'UNI', '0', '35.5', '', 'MN', 'NO', 'G.E.'),
(102, '104718', 'ANTIPARASITARIO PARA CL05...CL10, 130-250V     ', '104718', '', 'UNI', '0', '45', '', 'MN', 'NO', 'G.E.'),
(103, '104761', 'ANTIPARASITARIO PARA CK85...CK12, 260V     ', '104761', '', 'UNI', '0', '50', '', 'MN', 'NO', 'G.E.'),
(104, '104763', 'ENCLAVAMIENTO MECÁNICO HORIZONTAL      ', '104763', '', 'UNI', '0', '408', '', 'MN', 'NO', 'G.E.'),
(105, '104859', 'PARA CK85BE3...CK95BE3 CONTROL 380-415V     ', 'BOBINA', '', 'UNI', '0', '345.5', '', 'MN', 'NO', 'G.E.'),
(106, '104869', 'BOBINA PARA CK12BE3 CONTROL 380-415V    ', '104869', '', 'UNI', '0', '798', '', 'MN', 'NO', 'G.E.'),
(107, '105312', 'PARA CK75CA3-CK08CA3 CONTROL 440V     ', 'BOBINA', '', 'UNI', '0', '345.5', '', 'MN', 'NO', 'G.E.'),
(108, '107186', 'TER. DE ALIMENTACIÓN CONEXIÓN SUPERIOR    ', '107186', '', 'UNI', '0 UNI', '37.5', '', 'MN', 'NO', 'G.E.'),
(109, '108T', 'CAJA MINIPRAGMA EMPROTRADO 08POLOS IP40    ', 'MIP21108T', '', 'UNI', '0', '83.53', '', 'MN', 'NO', 'SCHNEIDER'),
(110, '109018', 'CONTACTOR AUXILIAR 4NA 110VAC     ', '109018', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(111, '109020', 'CONTACTOR AUXILIAR 4NA 220VAC     ', '109020', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(112, '109042', 'CONTACTOR AUXILIAR 3NA+1NC 110VAC     ', '109042', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(113, '109044', 'CONTACTOR AUXILIAR 3NA+1NC 220VAC     ', '109044', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(114, '109066', 'CONTACTOR AUXILIAR 2NA+2NC 110VAC     ', '109066', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(115, '109068', 'CONTACTOR AUXILIAR 2NA+2NC 220VAC     ', '109068', '', 'UNI', '0', '71', '', 'MN', 'NO', 'G.E.'),
(116, '110410', 'BOBINA PARA CL00..CL25, CONTROL 380V    ', '110410', '', 'UNI', '0', '66', '', 'MN', 'NO', 'G.E.'),
(117, '110418', 'BOBINA PARA CL00..CL25, CONTROL 110V    ', '110418', '', 'UNI', '0', '66', '', 'MN', 'NO', 'G.E.'),
(118, '110420', 'BOBINA PARA CL00..CL25, CONTROL 220V    ', '110420', '', 'UNI', '0', '66', '', 'MN', 'NO', 'G.E.'),
(119, '110423', 'BOBINA PARA CL00..CL25, CONTROL 440V    ', '110423', '', 'UNI', '0', '66', '', 'MN', 'NO', 'G.E.'),
(120, '110443', 'BOBINA PARA CL03..CL45, CONTROL 380V    ', '110443', '', 'UNI', '0', '88.5', '', 'MN', 'NO', 'G.E.'),
(121, '110451', 'BOBINA PARA CL03..CL45, CONTROL 110V    ', '110451', '', 'UNI', '0', '88.5', '', 'MN', 'NO', 'G.E.'),
(122, '110453', 'BOBINA PARA CL03..CL45, CONTROL 220V    ', '110453', '', 'UNI', '0', '88.5', '', 'MN', 'NO', 'G.E.'),
(123, '110456', 'BOBINA PARA CL03..CL45, CONTROL 440V    ', '110456', '', 'UNI', '0', '88.5', '', 'MN', 'NO', 'G.E.'),
(124, '110476', 'BOBINA PARA CL06..CL10, CONTROL 380V    ', '110476', '', 'UNI', '0', '128.5', '', 'MN', 'NO', 'G.E.'),
(125, '110484', 'BOBINA PARA CL06..CL10, CONTROL 110V    ', '110484', '', 'UNI', '0', '128.5', '', 'MN', 'NO', 'G.E.'),
(126, '110486', 'BOBINA PARA CL06..CL10, CONTROL 220V    ', '110486', '', 'UNI', '0', '128.5', '', 'MN', 'NO', 'G.E.'),
(127, '110489', 'BOBINA PARA CL06..CL10, CONTROL 440V    ', '110489', '', 'UNI', '0', '128.5', '', 'MN', 'NO', 'G.E.'),
(128, '1108', 'CAJA MICROPRAGMA ADOZADO 8 POLOS IP40   ', 'MIP11108T', '', 'UNI', '0', '119.34', '', 'MN', 'NO', 'SCHNEIDER'),
(129, '110831', 'PARA CK85BE3..CK95BE3 CONT. 440-500V AC/DC    ', 'BOBINA', '', 'UNI', '0', '345.5', '', 'MN', 'NO', 'G.E.'),
(130, '110832', 'PARA CK12BE3 CONTROL 440-500V AC/DC    ', 'BOBINA', '', 'UNI', '0', '798', '', 'MN', 'NO', 'G.E.'),
(131, '1112', 'CAJA MICROPRAGMA ADOZADO 12 POLOS IP40   ', 'MIP11112T', '', 'UNI', '0', '132.72', '', 'MN', 'NO', 'SCHNEIDER'),
(132, '112T', 'CAJA MINIPRAGMA EMPROTRADO 12POLOS IP40    ', 'MIP21112T', '', 'UNI', '0', '110.75', '', 'MN', 'NO', 'SCHNEIDER'),
(133, '113613', 'JUEGO DE CONTACTOS PARA CONTACTOR CK75C   ', '113613', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(134, '113614', 'JUEGO DE CONTACTOS PARA CONTACTOR CK08C   ', '113614', '', 'UNI', '0', '375.5', '', 'MN', 'NO', 'G.E.'),
(135, '113615', 'JUEGO DE CONTACTOS PARA CONTACTOR CK85B   ', '113615', '', 'UNI', '0', '375.5', '', 'MN', 'NO', 'G.E.'),
(136, '113616', 'JUEGO DE CONTACTOS PARA CONTACTOR CK09B   ', '113616', '', 'UNI', '0', '500', '', 'MN', 'NO', 'G.E.'),
(137, '113618', 'JUEGO DE CONTACTOS PARA CONTACTOR CK10C   ', '113618', '', 'UNI', '0', '711', '', 'MN', 'NO', 'G.E.'),
(138, '113619', 'JUEGO DE CONTACTOS PARA CONTACTOR CK11C   ', '113619', '', 'UNI', '0', '867', '', 'MN', 'NO', 'G.E.'),
(139, '113620', 'JUEGO DE CONTACTOS PARA CONTACTOR CK12B   ', '113620', '', 'UNI', '0', '924.5', '', 'MN', 'NO', 'G.E.'),
(140, '113670', 'PARA CK10CE3...CK11CE3 440-500V AC/DC     ', 'BOBINA', '', 'UNI', '0', '620', '', 'MN', 'NO', 'G.E.'),
(141, '113671', 'PARA CK10CE3...CK11CE3 CONTROL 380-415V     ', 'BOBINA', '', 'UNI', '0', '620', '', 'MN', 'NO', 'G.E.'),
(142, '113700', 'RT1B RELÉ TÉRMICO 0.16-0.26AMP.     ', '113700', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(143, '113701', 'RT1C RELÉ TÉRMICO 0.25-0.41AMP.     ', '113701', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(144, '113702', 'RT1D RELÉ TÉRMICO 0.4-0.65AMP.     ', '113702', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(145, '113703', 'RT1F RELÉ TÉRMICO 0.65-1.10AMP.     ', '113703', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(146, '113704', 'RT1G RELÉ TÉRMICO 1-1.50AMP.     ', '113704', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(147, '113705', 'RT1H RELÉ TÉRMICO 1.3-1.90AMP.     ', '113705', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(148, '113706', 'RT1J RELÉ TÉRMICO 1.8-2.70AMP.     ', '113706', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(149, '113707', 'RT1K RELÉ TÉRMICO 2.5-4AMP.     ', '113707', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(150, '113708', 'RT1L RELÉ TÉRMICO 4-6.30AMP.     ', '113708', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(151, '113709', 'RT1M RELÉ TÉRMICO 5.5-8.5AMP.     ', '113709', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(152, '113710', 'RT1N RELÉ TÉRMICO 8-12AMP.     ', '113710', '', 'UNI', '0', '120.5', '', 'MN', 'NO', 'G.E.'),
(153, '113711', 'RT1P RELÉ TÉRMICO 10-16AMP.     ', '113711', '', 'UNI', '0', '133', '', 'MN', 'NO', 'G.E.'),
(154, '113712', 'RT1S RELÉ TÉRMICO 14.5-18AMP.     ', '113712', '', 'UNI', '0', '133', '', 'MN', 'NO', 'G.E.'),
(155, '113713', 'RT1T RELÉ TÉRMICO 17.5-22AMP.     ', '113713', '', 'UNI', '0', '133', '', 'MN', 'NO', 'G.E.'),
(156, '113714', 'RT1U RELÉ TÉRMICO 21-26AMP.     ', '113714', '', 'UNI', '0', '147', '', 'MN', 'NO', 'G.E.'),
(157, '113715', 'RT1V RELÉ TÉRMICO 25-32AMP.     ', '113715', '', 'UNI', '0', '195.5', '', 'MN', 'NO', 'G.E.'),
(158, '113716', 'RT1W RELÉ TÉRMICO 30-40AMP.     ', '113716', '', 'UNI', '0', '201', '', 'MN', 'NO', 'G.E.'),
(159, '113720', 'RT2D RELÉ TÉRMICO 24-32AMP.     ', '113720', '', 'UNI', '0', '189', '', 'MN', 'NO', 'G.E.'),
(160, '113721', 'RT2E RELÉ TÉRMICO 30-43AMP.     ', '113721', '', 'UNI', '0', '244.5', '', 'MN', 'NO', 'G.E.'),
(161, '113722', 'RT2G RELÉ TÉRMICO 42-55AMP.     ', '113722', '', 'UNI', '0', '252', '', 'MN', 'NO', 'G.E.'),
(162, '113723', 'RT2H RELÉ TÉRMICO 54-65AMP.     ', '113723', '', 'UNI', '0', '259.5', '', 'MN', 'NO', 'G.E.'),
(163, '113724', 'RT2J RELÉ TÉRMICO 64-82AMP.     ', '113724', '', 'UNI', '0', '330', '', 'MN', 'NO', 'G.E.'),
(164, '113725', 'RT2L RELÉ TÉRMICO 78-97AMP.     ', '113725', '', 'UNI', '0', '357', '', 'MN', 'NO', 'G.E.'),
(165, '113726', 'RT2M RELÉ TÉRMICO 90-110AMP.     ', '113726', '', 'UNI', '0', '383', '', 'MN', 'NO', 'G.E.'),
(166, '113727', 'RT3B RELÉ TÉRMICO 55-80AMP.     ', '113727', '', 'UNI', '0', '457', '', 'MN', 'NO', 'G.E.'),
(167, '113728', 'RT3C RELÉ TÉRMICO 63-90AMP.     ', '113728', '', 'UNI', '0', '457', '', 'MN', 'NO', 'G.E.'),
(168, '113729', 'RT3D RELÉ TÉRMICO 90-120AMP.     ', '113729', '', 'UNI', '0', '457', '', 'MN', 'NO', 'G.E.'),
(169, '113730', 'RT3E RELÉ TÉRMICO 110-140AMP.     ', '113730', '', 'UNI', '0', '457', '', 'MN', 'NO', 'G.E.'),
(170, '113731', 'RT3F RELÉ TÉRMICO 140-190AMP.     ', '113731', '', 'UNI', '0', '457', '', 'MN', 'NO', 'G.E.'),
(171, '113732', 'RT4N RELÉ TÉRMICO 120-190AMP.     ', '113732', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(172, '113733', 'RT4P RELÉ TÉRMICO 175-280AMP.     ', '113733', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(173, '113734', 'RT4R RELÉ TÉRMICO 200-310AMP.     ', '113734', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(174, '113750', 'RT5A RELÉ TÉRMICO 120-190AMP.     ', '113750', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(175, '113751', 'RT5B RELÉ TÉRMICO 175-280AMP.     ', '113751', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(176, '113752', 'RT5C RELÉ TÉRMICO 250-400AMP.     ', '113752', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(177, '113753', 'RT5D RELÉ TÉRMICO 315-500AMP.     ', '113753', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(178, '113754', 'RT5E RELÉ TÉRMICO 430-700AMP.     ', '113754', '', 'UNI', '0', '667', '', 'MN', 'NO', 'G.E.'),
(179, '118T', 'CAJA MINIPRAGMA EMPROTRADO 18POLOS IP40    ', 'MIP21118T', '', 'UNI', '0', '139.42', '', 'MN', 'NO', 'SCHNEIDER'),
(180, '12080', 'TIPO RIEL BKH 2X80A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '187.88', '', 'MN', 'NO', 'LS'),
(181, '12100', 'TIPO RIEL BKH 2X100A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '191.84', '', 'MN', 'NO', 'LS'),
(182, '1212', 'CAJA MICROPRAGMA ADOZADO 24 POLOS IP40   ', 'MIP11212T', '', 'UNI', '0', '268.79', '', 'MN', 'NO', 'SCHNEIDER'),
(183, '1225', 'INTERRUPTOR DIFERENCIAL 2X25AMP 30mA     ', 'A9R71225', '', 'UNI', '0', '259.07', '', 'MN', 'NO', 'SCHNEIDER'),
(184, '123656', 'RELÉ DE CONTROL 220V/60HZ, 1NA/NC, 6A   ', '123656', '', 'UNI', '0 UNI', '344', '', 'MN', 'NO', 'G.E.'),
(185, '123700', 'SONDA ACERO INOXIDABLE A PRUEBA DE AGUA  ', '123700', '', 'UNI', '0 UNI', '58', '', 'MN', 'NO', 'G.E.'),
(186, '1240', 'INTERRUPTOR DIFERENCIAL 2X40AMP 30mA     ', 'A9R71240', '', 'UNI', '0', '282.1', '', 'MN', 'NO', 'SCHNEIDER'),
(187, '124901', 'NMTCV2 TEMPORIZADOR 24-240V AC/DC 1NANC    ', '124901', '', 'UNI', '0', '256', '', 'MN', 'NO', 'G.E.'),
(188, '124908', 'ARRANQUE ESTRELLA TRIÁNGULO 24-240V AC/DC    ', '124908', '', 'UNI', '0 UNI', '226', '', 'MN', 'NO', 'G.E.'),
(189, '13080', 'TIPO RIEL BKH 3X80A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '264.8', '', 'MN', 'NO', 'LS'),
(190, '13100', 'TIPO RIEL BKH 3X100A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '256.86', '', 'MN', 'NO', 'LS'),
(191, '13125', 'TIPO RIEL BKH 3X125A 10KA/400VAC    ', 'INT.', '', 'UNI', '0', '339.89', '', 'MN', 'NO', 'LS'),
(192, '1363', 'MINUTEROS MIN 16AMP 220VAC     ', '15363', '', 'UNI', '0', '401.26', '', 'MN', 'NO', 'SCHNEIDER'),
(193, '1365', 'INT. HORARIO ANALOGICO 16AMP 220VAC    ', 'CCT15365', '', 'UNI', '0', '452.57', '', 'MN', 'NO', 'SCHNEIDER'),
(194, '1425', 'INT. DIFERENCIAL 4X25AMP 30MA     ', 'A9R71425', '', 'UNI', '0', '406.87', '', 'MN', 'NO', 'SCHNEIDER'),
(195, '1440', 'INT. DIFERENCIAL 4X40AMP 30MA     ', 'A9R71440', '', 'UNI', '0', '450.66', '', 'MN', 'NO', 'SCHNEIDER'),
(196, '1463', 'INT. DIFERENCIAL 4X63AMP 30mA     ', 'A9R71463', '', 'UNI', '0', '552.1', '', 'MN', 'NO', 'SCHNEIDER'),
(197, '1506', 'INT. TIPO RIEL C60H-DC 1X6A 10KA-220VDC   ', 'A9N61506', '', 'BL', '0', '144.87', '', 'MN', 'NO', 'SCHNEIDER'),
(198, '1508', 'INT. TIPO RIEL C60H-DC 1X10A 10KA-220VDC   ', 'A9N61508', '', 'UNI', '0', '130.12', '', 'MN', 'NO', 'SCHNEIDER'),
(199, '1511', 'INT. TIPO RIEL C60H-DC 1X16A 10KA-220VDC   ', 'A9N61511', '', 'UNI', '0', '130.12', '', 'MN', 'NO', 'SCHNEIDER'),
(200, '1512', 'INT. TIPO RIEL C60H-DC 1X20A 10KA-220VDC   ', 'A9N61512', '', 'UNI', '0', '130.12', '', 'MN', 'NO', 'SCHNEIDER'),
(201, '1521', 'INT. TIPO RIEL C60H-DC 2X01A 20KA-220VDC   ', 'A9N61521', '', 'UNI', '0', '284.83', '', 'MN', 'NO', 'SCHNEIDER'),
(202, '1522', 'INT. TIPO RIEL C60H-DC 2X02A 20KA-220VDC   ', 'A9N61522', '', 'UNI', '0', '284.83', '', 'MN', 'NO', 'SCHNEIDER'),
(203, '1524', 'INT. TIPO RIEL C60H-DC 2X04A 20KA-220VDC   ', 'A9N61524', '', 'UNI', '0', '283.82', '', 'MN', 'NO', 'SCHNEIDER'),
(204, '1526', 'INT. TIPO RIEL C60H-DC 2X06A 20KA-220VDC   ', 'A9N61526', '', 'UNI', '0', '261.72', '', 'MN', 'NO', 'SCHNEIDER'),
(205, '1528', 'INT. TIPO RIEL C60H-DC 2X10A 20KA-220VDC   ', 'A9N61528', '', 'UNI', '0', '215.99', '', 'MN', 'NO', 'SCHNEIDER'),
(206, '1531', 'INT. TIPO RIEL C60H-DC 2X16A 20KA-220VDC   ', 'A9N61531', '', 'UNI', '0', '215.99', '', 'MN', 'NO', 'SCHNEIDER'),
(207, '1532', 'INT. TIPO RIEL C60H-DC 2X20A 20KA-220VDC   ', 'A9N61532', '', 'UNI', '0', '215.99', '', 'MN', 'NO', 'SCHNEIDER'),
(208, '1533', 'INT. TIPO RIEL C60H-DC 2X25A 20KA-220VDC   ', 'A9N61533', '', 'UNI', '0', '215.99', '', 'MN', 'NO', 'SCHNEIDER'),
(209, '1535', 'MOD DIF. NSX250 0.3AMP 200-440V    ', 'LV431535', '', 'UNI', '0', '1998.34', '', 'MN', 'NO', 'SCHNEIDER'),
(210, '1556', 'CONTACTOR 1NA+1NC 10/17KVAR-230/400VAC      ', '101556', '', 'UNI', '0', '317.5', '', 'MN', 'NO', 'G.E.'),
(211, '1593', 'CONTACTOR 2NA+1NC 12.5/20KVAR-230/400VAC      ', '101593', '', 'UNI', '0', '335', '', 'MN', 'NO', 'G.E.'),
(212, '1630', 'INT REGULABLE 175-250AMP 85KA/220V     ', 'LV431630', '', 'UNI', '0', '1401.5', '', 'MN', 'NO', 'SCHNEIDER'),
(213, '1631', 'INT REGULABLE 140-200AMP 85KA/220V     ', 'LV431631', '', 'UNI', '0', '1396.14', '', 'MN', 'NO', 'SCHNEIDER'),
(214, '1670', 'INT REG. 175-250AMP 100KA/220V     ', 'LV431670', '', 'UNI', '0', '2184.09', '', 'MN', 'NO', 'SCHNEIDER'),
(215, '1671', 'INT REG. 140-200AMP 100KA/220V     ', 'LV431671', '', 'UNI', '0', '2184.09', '', 'MN', 'NO', 'SCHNEIDER'),
(216, '170022', 'CONTACTOR DE 22A 220VAC 1NA+1NC    ', 'MC22B-220V', '', 'UNI', '0', '97.05', '', 'MN', 'NO', 'LS'),
(217, '170032', 'CONTACTOR DE 32A 220VAC 2NA+2NC    ', 'MC32-220V', '', 'UNI', '0', '143.34', '', 'MN', 'NO', 'LS'),
(218, '170040', 'CONTACTOR DE 40A 220VAC 2NA+2NC    ', 'MC40-220V', '', 'UNI', '0', '157.27', '', 'MN', 'NO', 'LS'),
(219, '170050', 'CONTACTOR DE 50A 220VAC 2NA+2NC    ', 'MC50-220V', '', 'UNI', '0', '355.24', '', 'MN', 'NO', 'LS'),
(220, '170065', 'CONTACTOR DE 65A 220VAC 2NA+2NC    ', 'MC65-220V', '', 'UNI', '0', '449.41', '', 'MN', 'NO', 'LS'),
(221, '170109', 'CONTACTOR DE 9A 220VAC 1NA+1NC    ', 'MC9B-220V', '', 'UNI', '0', '48.58', '', 'MN', 'NO', 'LS'),
(222, '170109A', 'CONTACTOR DE 9A 110VAC 1NA+1NC    ', 'MC9B-110V', '', 'UNI', '0', '48.58', '', 'MN', 'NO', 'LS'),
(223, '170112', 'CONTACTOR DE 12A 220VAC 1NA+1NC    ', 'MC12B-220V', '', 'UNI', '0', '50.89', '', 'MN', 'NO', 'LS'),
(224, '170112A', 'CONTACTOR DE 12A 110VAC 1NA+1NC    ', 'MC12B-110V', '', 'UNI', '0', '50.89', '', 'MN', 'NO', 'LS'),
(225, '170118', 'CONTACTOR DE 18A 220VAC 1NA+1NC    ', 'MC18B-220V', '', 'UNI', '0', '66.31', '', 'MN', 'NO', 'LS'),
(226, '170125', 'CONTACTOR DE 130A 220VAC 2NA+2NC    ', 'MC130-220V', '', 'UNI', '0', '965.09', '', 'MN', 'NO', 'LS'),
(227, '170125A', 'CONTACTOR DE 130A 110VAC 2NA+2NC    ', 'MC130-110V', '', 'UNI', '0', '965.09', '', 'MN', 'NO', 'LS'),
(228, '18M7', 'CONTACTOR 18 AMP-220VAC 1NA+1NC     ', 'LC1D18M7', '', 'UNI', '0', '213.21', '', 'MN', 'NO', 'SCHNEIDER'),
(229, '190002', 'RELE TERMICO 0.16 - 0.25 AMP   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(230, '190005', 'RELE TERMICO 0.63 - 1 AMP   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(231, '190009', 'RELE TERMICO 4 - 6 AMP.   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(232, '190010', 'RELE TERMICO 5 - 8 AMP.   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(233, '190012', 'RELE TERMICO 7 - 10 AMP.   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(234, '190013', 'RELE TERMICO 9 - 13 AMP.   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(235, '190014', 'RELE TERMICO 12 - 18 AMP.   ', 'MT-32', '', 'UNI', '0', '92.71', '', 'MN', 'NO', 'LS'),
(236, '190015', 'RELE TERMICO 18 - 25 AMP   ', 'MT-32', '', 'UNI', '0', '97.97', '', 'MN', 'NO', 'LS'),
(237, '190016', 'RELE TERMICO 22 - 32 AMP.   ', 'MT-32', '', 'UNI', '0', '103.23', '', 'MN', 'NO', 'LS'),
(238, '190023', 'RELE TERMICO 80 - 100 AMP.   ', 'MT-95', '', 'UNI', '0', '396.51', '', 'MN', 'NO', 'LS'),
(239, '2002', 'INT. TIPO RIEL 2X02A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '65.51', '', 'MN', 'NO', 'LS'),
(240, '2004', 'INT. TIPO RIEL 2X04A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '65.51', '', 'MN', 'NO', 'LS'),
(241, '2006', 'INT. TIPO RIEL 2X06A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '65.51', '', 'MN', 'NO', 'LS'),
(242, '2010LS', 'INT. TIPO RIEL 2X10A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '45.67', '', 'MN', 'NO', 'LS'),
(243, '2015C', 'INT. TERMOMAG. FIJO 2X15AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '136.87', '', 'MN', 'NO', 'LS'),
(244, '2016LS', 'INT. TIPO RIEL 2X16A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '45.67', '', 'MN', 'NO', 'LS'),
(245, '2020C', 'INT. TERMOMAG. FIJO 2X20AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '136.87', '', 'MN', 'NO', 'LS'),
(246, '2020LS', 'INT. TIPO RIEL 2X20A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '45.67', '', 'MN', 'NO', 'LS'),
(247, '2025A', 'INT. DIFERENCIAL INMUNIZADO 2X25A 30MA/230V    ', 'RKN-B', '', 'UNI', '0', '205.99', '', 'MN', 'NO', 'LS'),
(248, '2025LS', 'INT. TIPO RIEL 2X25A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '45.67', '', 'MN', 'NO', 'LS'),
(249, '2030C', 'INT. TERMOMAG. FIJO 2X30AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '136.87', '', 'MN', 'NO', 'LS'),
(250, '2032LS', 'INT. TIPO RIEL 2X32A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '45.67', '', 'MN', 'NO', 'LS'),
(251, '2040A', 'INT. DIFERENCIAL INMUNIZADO 2X40A 30MA/230V    ', 'RKN-B', '', 'UNI', '0', '228.94', '', 'MN', 'NO', 'LS'),
(252, '2040C', 'INT. TERMOMAG. FIJO 2X40AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '136.87', '', 'MN', 'NO', 'LS'),
(253, '2040LS', 'INT. TIPO RIEL 2X40A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '78.43', '', 'MN', 'NO', 'LS'),
(254, '2050C', 'INT. TERMOMAG. FIJO 2X50AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '142', '', 'MN', 'NO', 'LS'),
(255, '2050LS', 'INT. TIPO RIEL 2X50A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '91', '', 'MN', 'NO', 'LS'),
(256, '2063LS', 'INT. TIPO RIEL 2X63A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '97.34', '', 'MN', 'NO', 'LS'),
(257, '2075C', 'INT. TERMOMAG. FIJO 2X75AMP 30KA/230VAC    ', 'ABN', '', 'UNI', '0', '142', '', 'MN', 'NO', 'LS'),
(258, '212T', 'CAJA MINIPRAGMA EMPROTRADO 24POLOS IP40    ', 'MIP21212T', '', 'UNI', '0', '172.87', '', 'MN', 'NO', 'SCHNEIDER'),
(259, '220020', 'PRC2P20ADL RELÉ ENCAPSULADO 8 PINES 24VAC   ', '220020', '', 'UNI', '0', '41', '', 'MN', 'NO', 'G.E.'),
(260, '220023', 'PRC2P20CDL RELÉ ENCAPSULADO 8 PINES 24VDC   ', '220023', '', 'UNI', '0', '41', '', 'MN', 'NO', 'G.E.'),
(261, '220024', 'PRC2P20AJL RELÉ ENCAPSULADO 8 PINES 120VAC   ', '220024', '', 'UNI', '0', '43.5', '', 'MN', 'NO', 'G.E.'),
(262, '220026', 'PRC2P20ANL RELÉ ENCAPSULADO 8 PINES 230VAC   ', '220026', '', 'UNI', '0', '45', '', 'MN', 'NO', 'G.E.'),
(263, '220216', 'PRCZ8 SOCKET PARA RELÉ DE 8 PINES  ', '220216', '', 'UNI', '0', '21', '', 'MN', 'NO', 'G.E.'),
(264, '22025', 'INT. DIFERENCIAL 2X25 AMP 30mA/230V    ', 'RKN', '', 'UNI', '0', '84.97', '', 'MN', 'NO', 'G.E.'),
(265, '220311', 'PRC3P30ADL RELÉ ENCAPSULADO 11 PINES 24VAC   ', '220311', '', 'UNI', '0', '47', '', 'MN', 'NO', 'G.E.'),
(266, '220314', 'PRC3P30CDL RELÉ ENCAPSULADO 11 PINES 24VDC   ', '220314', '', 'UNI', '0', '44.5', '', 'MN', 'NO', 'G.E.'),
(267, '220315', 'PRC3P30AJL RELÉ ENCAPSULADO 11 PINES 120VDC   ', '220315', '', 'UNI', '0', '47', '', 'MN', 'NO', 'G.E.'),
(268, '220317', 'PRC3P30ANL RELÉ ENCAPSULADO 11 PINES 230VAC   ', '220317', '', 'UNI', '0', '44.5', '', 'MN', 'NO', 'G.E.'),
(269, '22040', 'INT. DIFERENCIAL 2X40 AMP 30MA/230V    ', 'RKN', '', 'UNI', '0', '106.71', '', 'MN', 'NO', 'LS'),
(270, '22063', 'INT. DIFERENCIAL 2X63 AMP 30MA/230V    ', 'RKN', '', 'UNI', '0', '173.63', '', 'MN', 'NO', 'LS'),
(271, '220647', 'PRCZ11 SOCKET PARA RELÉ DE 11 PINES  ', '220647', '', 'UNI', '0', '21', '', 'MN', 'NO', 'G.E.'),
(272, '220915', 'RETENEDOR/EXTRACTOR DE PLÁSTICO      ', '220915', '', 'UNI', '0 UNI', '7.5', '', 'MN', 'NO', 'G.E.'),
(273, '221810', 'PRC4M40ADL RELÉ ENCAPSULADO 14PINES 24VAC    ', '221810', '', 'UNI', '0', '31.5', '', 'MN', 'NO', 'G.E.'),
(274, '221813', 'PRC4M40CDL RELÉ ENCAPSULADO 14PINES 24VDC    ', '221813', '', 'UNI', '0', '30', '', 'MN', 'NO', 'G.E.'),
(275, '221814', 'PRC4M40AJL RELÉ ENCAPSULADO 14PINES 120VAC    ', '221814', '', 'UNI', '0', '32.5', '', 'MN', 'NO', 'G.E.'),
(276, '221816', 'PRC4M40ANL RELÉ ENCAP. 14PINES 230VAC    ', '221816', '', 'UNI', '0', '33.5', '', 'MN', 'NO', 'G.E.'),
(277, '221920', 'PRCPZ11 RETENEDOR/EXTRACTOR DE PLÁSTICO     ', '221920', '', 'UNI', '0', '7.5', '', 'MN', 'NO', 'G.E.'),
(278, '221934', 'PRCG-ES15/4N SOCKET PARA RELÉ DE 14 PINES  ', '221934', '', 'UNI', '0', '21', '', 'MN', 'NO', 'G.E.'),
(279, '24025', 'INT. DIFERENCIAL 4X25 AMP 30MA/230V    ', 'RKN', '', 'UNI', '0', '229', '', 'MN', 'NO', 'LS'),
(280, '24025A', 'INT. DIFERENCIAL INMUNIZADO 4X25A 30MA/230V    ', 'RKN-B', '', 'UNI', '0', '316.36', '', 'MN', 'NO', 'LS'),
(281, '24040', 'INT. DIFERENCIAL 4X40 AMP 30MA/230V    ', 'RKN', '', 'UNI', '0', '229', '', 'MN', 'NO', 'LS'),
(282, '24040A', 'INT. DIFERENCIAL INMUNIZADO 4X40A 30MA/230V    ', 'RKN-B', '', 'UNI', '0', '341.78', '', 'MN', 'NO', 'LS'),
(283, '24063', 'INT. DIFERENCIAL 4X63 AMP 30MA/230V    ', 'RKN', '', 'UNI', '0', '305.31', '', 'MN', 'NO', 'LS'),
(284, '2410', 'INT. TIPO RIEL IK60N 1X10AMP 5KA-230VAC   ', 'A9K24110', '', 'UNI', '0', '24.9', '', 'MN', 'NO', 'SCHNEIDER'),
(285, '2412', 'INT. TIPO RIEL iK60N 1X20AMP 5KA-230VAC   ', 'A9K24120', '', 'UNI', '0', '24.9', '', 'MN', 'NO', 'SCHNEIDER'),
(286, '2416', 'INT. TIPO RIEL iK60N 1X16AMP 5KA-230VAC   ', 'A9K24116', '', 'UNI', '0', '24.96', '', 'MN', 'NO', 'SCHNEIDER'),
(287, '2420', 'INT. TIPO RIEL iK60N 2X10AMP 10KA-230VAC   ', 'A9K24210', '', 'UNI', '0', '48.93', '', 'MN', 'NO', 'SCHNEIDER'),
(288, '2425', 'INT. TIPO RIEL iK60N 1X25AMP 5KA-230VAC   ', 'A9K24125', '', 'UNI', '0', '24.96', '', 'MN', 'NO', 'SCHNEIDER'),
(289, '2441', 'MINICONTACTOR 6 AMP 22VAC 1NA    ', '102441', '', 'UNI', '0', '60', '', 'MN', 'NO', 'SCHNEIDER'),
(290, '2455', 'MOD DIF. NSX400/630 0.3-1-3-10A 200-440V    ', 'LV432455', '', 'UNI', '0', '2159.88', '', 'MN', 'NO', 'SCHNEIDER'),
(291, '246152', 'CONTACTOR 150 AMP 100-250V 1NA + 1NC  ', '246152', '', 'UNI', '0', '1222.5', '', 'MN', 'NO', 'G.E.'),
(292, '246153', 'CONTACTOR 150 AMP 250-500V 1NA+1NC    ', '246153', '', 'UNI', '0', '1222.5', '', 'MN', 'NO', 'G.E.'),
(293, '246156', 'CONTACTOR 185 AMP 100-250V 1NA + 1NC  ', '246156', '', 'UNI', '0', '1487.5', '', 'MN', 'NO', 'G.E.'),
(294, '246157', 'CONTACTOR 185 AMP 250-500V 1NA + 1NC  ', '246157', '', 'UNI', '0', '1487.5', '', 'MN', 'NO', 'G.E.'),
(295, '246160', 'CONTACTOR 205 AMP 100-250V 1NA+1NC    ', '246160', '', 'UNI', '0 UNI', '1793', '', 'MN', 'NO', 'G.E.'),
(296, '246161', 'CONTACTOR 205 AMP 250-500V 1NA + 1NC  ', '246161', '', 'UNI', '0', '1793', '', 'MN', 'NO', 'G.E.'),
(297, '246164', 'CONTACTOR 250 AMP 100-250V 1NA+1NC    ', '246164', '', 'UNI', '0', '2185.5', '', 'MN', 'NO', 'G.E.'),
(298, '246165', 'CONTACTOR 250 AMP 250-500V 1NA+1NC    ', '246165', '', 'UNI', '0 UNI', '2185.5', '', 'MN', 'NO', 'G.E.'),
(299, '246168', 'CONTACTOR 309 AMP 100-250V 1NA+1NC    ', '246168', '', 'UNI', '0 UNI', '2244.5', '', 'MN', 'NO', 'G.E.'),
(300, '246169', 'CONTACTOR 309 AMP 250-500V 1NA+1NC    ', '246169', '', 'UNI', '0 UNI', '2244.5', '', 'MN', 'NO', 'G.E.'),
(301, '246172', 'CONTACTOR 420 AMP 100-250V 1NA+1NC    ', '246172', '', 'UNI', '0', '3630', '', 'MN', 'NO', 'G.E.'),
(302, '246173', 'CONTACTOR 420 AMP 250-500V 1NA+1NC    ', '246173', '', 'UNI', '0 UNI', '3630', '', 'MN', 'NO', 'G.E.'),
(303, '246176', 'CONTACTOR 550 AMP 100-250V 1NA+1NC    ', '246176', '', 'UNI', '0 UNI', '4481.5', '', 'MN', 'NO', 'G.E.'),
(304, '246177', 'CONTACTOR 550 AMP 250-500V 1NA+1NC    ', '246177', '', 'UNI', '0 UNI', '4481.5', '', 'MN', 'NO', 'G.E.'),
(305, '246181', 'CONTACTOR 700 AMP 250-500V 1NA+1NC    ', '246181', '', 'UNI', '0 UNI', '5407.5', '', 'MN', 'NO', 'G.E.'),
(306, '2479', 'ACCESORIOS 400/630 AMP- SET DE 3 UND  ', 'LV432479', '', 'UNI', '0', '183.11', '', 'MN', 'NO', 'SCHNEIDER'),
(307, '2570', 'SEPARAD.DE FASE NSX400-630- 6UND     ', 'LV432570', '', 'UNI', '0', '58.13', '', 'MN', 'NO', 'SCHNEIDER'),
(308, '2621', 'MINICONTACTOR 9 AMP 22VAC 1NA    ', '102621', '', 'UNI', '0', '60', '', 'MN', 'NO', 'G.E.'),
(309, '2624', 'CONTACTO DE SEÑALIZACION DE ESTADO OF   ', 'A9N26924', '', 'UNI', '0', '101.95', '', 'MN', 'NO', 'SCHNEIDER'),
(310, '2627', 'CONTACTO DE SEÑALIZACION DE DEFECTO SD   ', 'A9N26927', '', 'UNI', '0', '101.95', '', 'MN', 'NO', 'SCHNEIDER'),
(311, '2693', 'INT REGULABLE 160-400AMP 85KA/220V     ', 'LV432693', '', 'UNI', '0', '2205.73', '', 'MN', 'NO', 'SCHNEIDER'),
(312, '2695', 'INT REG. 160-400AMP 100KA/220V     ', 'LV432695', '', 'UNI', '0', '3149.49', '', 'MN', 'NO', 'SCHNEIDER'),
(313, '2697', 'DISPOSITIVO PARA ENCLAVAMIENTO 10 PZAS    ', 'A9A26970', '', 'UNI', '0', '173.43', '', 'MN', 'NO', 'SCHNEIDER'),
(314, '2823', 'CONTACTOR 40 AMP 110VAC 1NA+1NC    ', '112823', '', 'UNI', '0', '318', '', 'MN', 'NO', 'G.E.'),
(315, '2825', 'CONTACTOR 40 AMP 220VAC 1NA+1NC    ', '112825', '', 'UNI', '0', '318', '', 'MN', 'NO', 'G.E.'),
(316, '2828', 'CONTACTOR 40 AMP 440VAC 1NA+1NC    ', '112828', '', 'UNI', '0', '318', '', 'MN', 'NO', 'G.E.'),
(317, '2893', 'INT REGULABLE 252-630AMP 85KA/220V     ', 'LV432893', '', 'UNI', '0', '3669.53', '', 'MN', 'NO', 'SCHNEIDER'),
(318, '2895', 'INT REGULABLE 252-630AMP 100KA/220V     ', 'LV432895', '', 'UNI', '0', '4750.18', '', 'MN', 'NO', 'SCHNEIDER'),
(319, '3015C', 'INT. TERMOMAG. FIJO 3X15AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'LS'),
(320, '3016B', 'INTERRUP. REGULABLE 3X16AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(321, '3020', 'INT. DE FUERZA FIJO 20AMP 25KA-240V   ', 'EZC100N3020', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(322, '3020C', 'INT. TERMOMAG. FIJO 3X20AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'SCHNEIDER'),
(323, '3025', 'INT. DE FUERZA FIJO 25AMP 25KA-240V   ', 'EZC100N3025', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(324, '3025B', 'INTERRUP. REGULABLE 3X25AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(325, '3030', 'INT. DE FUERZA FIJO 30AMP 25KA-240V   ', 'EZC100N3030', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(326, '3030C', 'INT. TERMOMAG. FIJO 3X30AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'LS'),
(327, '3032B', 'INTERRUP. REGULABLE 3X32AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(328, '3040', 'INT. DE FUERZA FIJO 40AMP 25KA-240V   ', 'EZC100N3040', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(329, '3040B', 'INTERRUP. REGULABLE 3X40AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', '3 EN UNO'),
(330, '3040C', 'INT. TERMOMAG. FIJO 3X40AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'LS'),
(331, '3050', 'INT. DE FUERZA FIJO 50AMP 25KA-240V   ', 'EZC100N3050', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(332, '3050B', 'INTERRUP. REGULABLE 3X50AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(333, '3050C', 'INT. TERMOMAG. FIJO 3X50AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'LS'),
(334, '3060', 'INT. DE FUERZA FIJO 60AMP 25KA-240V   ', 'EZC100N3060', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(335, '3060C', 'INT. TERMOMAG. FIJO 3X60AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '205.38', '', 'MN', 'NO', 'LS'),
(336, '3063B', 'INTERRUP. REGULABLE 3X63AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(337, '3075C', 'INT. TERMOMAG. FIJO 3X75AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '214.72', '', 'MN', 'NO', 'LS'),
(338, '3080', 'INT. DE FUERZA FIJO 80AMP 25KA-240V   ', 'EZC100N3080', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(339, '3080B', 'INTERRUP. REGULABLE 3X80AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(340, '3100', 'INT. DE FUERZA 100AMP 25KA-240V    ', 'EZC100N3100', '', 'UNI', '0', '302.28', '', 'MN', 'NO', 'SCHNEIDER'),
(341, '3125', 'INT. DE FUERZA FIJO 125AMP 50KA-240V   ', 'EZC250N3125', '', 'UNI', '0', '509.85', '', 'MN', 'NO', 'SCHNEIDER'),
(342, '312T', 'CAJA MINIPRAGMA EMPROTRADO 36POLOS IP40    ', 'MIP21312T', '', 'UNI', '0', '231.06', '', 'MN', 'NO', 'SCHNEIDER'),
(343, '3150', 'INT. DE FUERZA FIJO 150AMP 50KA-240V   ', 'EZC250N3150', '', 'UNI', '0', '557.77', '', 'MN', 'NO', 'SCHNEIDER'),
(344, '3175', 'INT. DE FUERZA FIJO 175AMP 50KA-240V   ', 'EZC250N3175', '', 'UNI', '0', '677.76', '', 'MN', 'NO', 'SCHNEIDER'),
(345, '3200', 'INT. DE FUERZA FIJO 200AMP 50KA-240V   ', 'EZC250N3200', '', 'UNI', '0', '719.79', '', 'MN', 'NO', 'SCHNEIDER'),
(346, '32002', 'INT. TIPO RIEL 3X02A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '106.11', '', 'MN', 'NO', 'LS'),
(347, '32004', 'INT. TIPO RIEL 3X04A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '106.11', '', 'MN', 'NO', 'LS'),
(348, '32006', 'INT. TIPO RIEL 3X06A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '106.11', '', 'MN', 'NO', 'LS'),
(349, '32010', 'INT. TIPO RIEL 3X10A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '98.73', '', 'MN', 'NO', 'LS'),
(350, '32016', 'INT. TIPO RIEL 3X16A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '98.73', '', 'MN', 'NO', 'LS'),
(351, '32020', 'INT. TIPO RIEL 3X20A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '98.73', '', 'MN', 'NO', 'LS'),
(352, '32025', 'INT. TIPO RIEL 3X25A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '98.73', '', 'MN', 'NO', 'LS'),
(353, '32032', 'INT. TIPO RIEL 3X32A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '98.73', '', 'MN', 'NO', 'LS'),
(354, '32040', 'INT. TIPO RIEL 3X40A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '116.26', '', 'MN', 'NO', 'LS'),
(355, '320400', 'INT. REGUL. SUSOL 320-400AMP 100KA/230VAC    ', 'TS400N', '', 'UNI', '0', '1628', '', 'MN', 'NO', 'LS'),
(356, '32050', 'INT. TIPO RIEL 3X50A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '130.67', '', 'MN', 'NO', 'LS'),
(357, '32063', 'INT. TIPO RIEL 3X63A 20KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '146.94', '', 'MN', 'NO', 'LS'),
(358, '3225', 'INT. DE FUERZA FIJO 225AMP 50KA-240V   ', 'EZC250N3225', '', 'UNI', '0', '719.79', '', 'MN', 'NO', 'SCHNEIDER'),
(359, '3250', 'INT. DE FUERZA FIJO 250AMP 50KA-240V   ', 'EZC250N3250', '', 'UNI', '0', '719.79', '', 'MN', 'NO', 'SCHNEIDER'),
(360, '32M7', 'CONTACTOR 32 AMP-220VAC 1NA+1NC     ', 'LC1D32M7', '', 'UNI', '0', '420.24', '', 'MN', 'NO', 'SCHNEIDER'),
(361, '33100B', 'INTERRUP. REGULABLE 3X100AMP 50KA/230VAC     ', 'TE100S', '', 'UNI', '0', '352.69', '', 'MN', 'NO', 'LS'),
(362, '33100C', 'INT. TERMOMAG. FIJO 3X100AMP 35KA/230VAC    ', 'ABN', '', 'UNI', '0', '214.72', '', 'MN', 'NO', 'LS'),
(363, '33125B', 'INTERRUP. REGULABLE 3X125AMP 50KA/230VAC     ', 'TE160S', '', 'UNI', '0', '409.63', '', 'MN', 'NO', 'LS'),
(364, '33125C', 'INT. TERMOMAG. FIJO 3X125AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '323.94', '', 'MN', 'NO', 'LS'),
(365, '33150C', 'INT. TERMOMAG. FIJO 3X150AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '386.11', '', 'MN', 'NO', 'LS'),
(366, '33160B', 'INTERRUP. REGULABLE 3X160AMP 50KA/230VAC     ', 'TE160S', '', 'UNI', '0', '449.63', '', 'MN', 'NO', 'LS'),
(367, '33175C', 'INT. TERMOMAG. FIJO 3X175AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '386.03', '', 'MN', 'NO', 'LS'),
(368, '33200B', 'INTERRUP. REGULABLE 3X200AMP 50KA/230VAC     ', 'ABS203C', '', 'UNI', '0', '624.83', '', 'MN', 'NO', 'LS'),
(369, '33200C', 'INT. TERMOMAG. FIJO 3X200AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '499.46', '', 'MN', 'NO', 'LS'),
(370, '33225C', 'INT. TERMOMAG. FIJO 3X225AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '527.21', '', 'MN', 'NO', 'LS'),
(371, '33250B', 'INTERRUP. REGULABLE 3X250AMP 50KA/230VAC     ', 'ABS203C', '', 'UNI', '0', '656.59', '', 'MN', 'NO', 'LS'),
(372, '33250C', 'INT. TERMOMAG. FIJO 3X250AMP 65KA/230VAC    ', 'ABN', '', 'UNI', '0', '527.21', '', 'MN', 'NO', 'LS'),
(373, '3441', 'CAJA MINI KAEDRA ADOZADO 4 POLOS IP65  ', '13441', '', 'UNI', '0', '101.48', '', 'MN', 'NO', 'SCHNEIDER'),
(374, '3443', 'CAJA MINI KAEDRA ADOZADO 8 POLOS IP65  ', '13443', '', 'UNI', '0', '143.33', '', 'MN', 'NO', 'SCHNEIDER'),
(375, '3444', 'CAJA MINI KAEDRA ADOZADO 12 POLOS IP65  ', '13444', '', 'UNI', '0', '224.24', '', 'MN', 'NO', 'SCHNEIDER'),
(376, '3466', 'INT REGULABLE 320-800AMP 85KA/220V     ', '33466', '', 'UNI', '0', '7383.56', '', 'MN', 'NO', 'SCHNEIDER'),
(377, '3467', 'INT REGULABLE 320-800AMP 85KA/220V     ', '33467', '', 'UNI', '0', '8561.2', '', 'MN', 'NO', 'SCHNEIDER'),
(378, '3472', 'INT REGULABLE 400-1000AMP 85KA/220V     ', '33472', '', 'UNI', '0', '8534.06', '', 'MN', 'NO', 'SCHNEIDER'),
(379, '3478', 'INT REGULABLE 500-1250AMP 85KA/220V     ', '33478', '', 'UNI', '0', '10635.24', '', 'MN', 'NO', 'SCHNEIDER'),
(380, '3479', 'INT REGULABLE 500-1250AMP 85KA/220V     ', '33479', '', 'UNI', '0', '12047.57', '', 'MN', 'NO', 'SCHNEIDER'),
(381, '3483', 'INT REGULABLE 640-1600AMP 85KA/220V     ', '33483', '', 'UNI', '0', '15663.53', '', 'MN', 'NO', 'SCHNEIDER'),
(382, '3578', 'MC2A310AT5 MINICONTACTOR 12 AMP 22VAC 1NA   ', '103578', '', 'UNI', '0', '68', '', 'MN', 'NO', 'G.E.'),
(383, '4000069', 'INTERRUP. REGULABLE 3X25AMP 50KA/230VAC     ', 'ABS103G', '', 'UNI', '0', '285.36', '', 'MN', 'NO', 'LS'),
(384, '4000073', 'INTERRUP. REGULABLE 3X50AMP 50KA/230VAC     ', 'ABS103G', '', 'UNI', '0', '285.36', '', 'MN', 'NO', 'LS'),
(385, '4000077', 'INTERRUP. REGULABLE 3X100AMP 50KA/230VAC     ', 'ABS103G', '', 'UNI', '0', '285.36', '', 'MN', 'NO', 'LS'),
(386, '4002401', 'CONTACTO AUX. INST. LATER. 1NA+1NC MC9 A MC150 ', 'UA-1', '', 'UNI', '0', '34.97', '', 'MN', 'NO', 'LS'),
(387, '402402', 'SOPORTE PARA RELE TERMICO SERIE MT-32   ', 'UZ-32', '', 'UNI', '0', '28.21', '', 'MN', 'NO', 'LS'),
(388, '402403', 'SOPORTE PARA RELE TERMICO SERIE MT-63/L   ', 'UZ-63/L', '', 'UNI', '0', '28.21', '', 'MN', 'NO', 'LS'),
(389, '4101', 'INT. TIPO RIEL iC60N 1X01AMP 50KA-230VAC   ', 'A9F74101', '', 'UNI', '0', '75.26', '', 'MN', 'NO', 'SCHNEIDER'),
(390, '4101328', 'MAGN. MMS 32S 4-6A 100KA/415VAC    ', 'GUARDAMOTOR', '', 'UNI', '0', '148.28', '', 'MN', 'NO', 'LS'),
(391, '4101360', 'ADAPTADOR P/CONTACTORES DE CONDENSADORES     ', 'AC-9', '', 'UNI', '0', '95.35', '', 'MN', 'NO', 'LS'),
(392, '4101361', 'ADAPTADOR P/CONTACTORES DE CONDENSADORES     ', 'AC-50', '', 'UNI', '0', '121.35', '', 'MN', 'NO', 'LS'),
(393, '4101362', 'AUX. GMR 16A 4NA 220VAC    ', 'CONTACTOR', '', 'UNI', '0', '103.51', '', 'MN', 'NO', 'LS'),
(394, '4101363', 'AUX. GMR 16A 3NA+1NC 220VAC    ', 'CONTACTOR', '', 'UNI', '0', '103.51', '', 'MN', 'NO', 'LS'),
(395, '4101364', 'AUX. GMR 16A 2NA+2NC 220VAC    ', 'CONTACTOR', '', 'UNI', '0', '104', '', 'MN', 'NO', 'LS'),
(396, '4101410', 'VARIADOR DE VELO. IG5A 220VAC 3HP 12A  ', 'SV022IG5A-2', '', 'UNI', '0', '1091', '', 'MN', 'NO', 'LS'),
(397, '4102', 'INT. TIPO RIEL IC60N 1X02AMP 50KA-230VAC   ', 'A9F74102', '', 'UNI', '0', '75.47', '', 'MN', 'NO', 'SCHNEIDER'),
(398, '4104', 'INT. TIPO RIEL iC60N 1X04AMP 50KA-230VAC   ', 'A9F74104', '', 'UNI', '0', '70.77', '', 'MN', 'NO', 'SCHNEIDER'),
(399, '4105140', 'P/MINICONTACTORES GMR-4M       ', 'ENCLAVAMIENTO', '', 'UNI', '0', '13.54', '', 'MN', 'NO', 'LS'),
(400, '4106', 'INT. TIPO RIEL iC60N 1X06AMP 20KA-230VAC   ', 'A9F74106', '', 'UNI', '0', '68.04', '', 'MN', 'NO', 'SCHNEIDER'),
(401, '4110', 'INT. TIPO RIEL iC60N 1X10AMP 20KA-230VAC   ', 'A9F74110', '', 'UNI', '0', '59.5', '', 'MN', 'NO', 'SCHNEIDER'),
(402, '4116', 'INT. TIPO RIEL IC60N 1X16AMP 20KA-230VAC   ', 'A9F74116', '', 'UNI', '0', '58.52', '', 'MN', 'NO', 'SCHNEIDER'),
(403, '4120', 'INT. TIPO RIEL iC60N 1X20AMP 20KA-230VAC   ', 'A9F74120', '', 'UNI', '0', '58.52', '', 'MN', 'NO', 'SCHNEIDER'),
(404, '4125', 'INT. TIPO RIEL iC60N 1X25AMP 20KA-230VAC   ', 'A9F74125', '', 'UNI', '0', '58.36', '', 'MN', 'NO', 'SCHNEIDER'),
(405, '4132', 'INT. TIPO RIEL iC60N 1X32AMP 20KA-230VAC   ', 'A9F74132', '', 'UNI', '0', '58.52', '', 'MN', 'NO', 'SCHNEIDER'),
(406, '4140', 'INT. TIPO RIEL iC60N 1X40AMP 20KA-230VAC   ', 'A9F74140', '', 'UNI', '0', '82.79', '', 'MN', 'NO', 'SCHNEIDER'),
(407, '4150', 'INT. TIPO RIEL iC60N 1X50AMP 20KA-230VAC   ', 'A9F74150', '', 'UNI', '0', '83.55', '', 'MN', 'NO', 'SCHNEIDER'),
(408, '4163', 'INT. TIPO RIEL iC60N 1X63AMP 20KA-230VAC   ', 'A9F74163', '', 'UNI', '0', '84.55', '', 'MN', 'NO', 'SCHNEIDER'),
(409, '4201', 'INT. TIPO RIEL iC60N 2X01AMP 50KA-230VAC   ', 'A9F74201', '', 'UNI', '0', '136.53', '', 'MN', 'NO', 'SCHNEIDER'),
(410, '4202', 'INT. TIPO RIEL IC60N 2X02AMP 50KA-230VAC   ', 'A9F74202', '', 'UNI', '0', '136.53', '', 'MN', 'NO', 'SCHNEIDER'),
(411, '4204', 'INT. TIPO RIEL iC60N 2X04AMP 20KA-230VAC   ', 'A9F74204', '', 'UNI', '0', '136.53', '', 'MN', 'NO', 'SCHNEIDER'),
(412, '4206', 'INT. TIPO RIEL iC60N 2X06AMP 20KA-230VAC   ', 'A9F74206', '', 'UNI', '0', '134.12', '', 'MN', 'NO', 'SCHNEIDER'),
(413, '4210', 'INT. TIPO RIEL iC60N 2X10AMP 20KA-230VAC   ', 'A9F74210', '', 'UNI', '0', '102.37', '', 'MN', 'NO', 'SCHNEIDER'),
(414, '4216', 'INT. TIPO RIEL iC60N 2X16AMP 20KA-230VAC   ', 'A9F74216', '', 'UNI', '0', '98.64', '', 'MN', 'NO', 'SCHNEIDER'),
(415, '4220', 'INT. TIPO RIEL iC60N 2X20AMP 20KA-230VAC   ', 'A9F74220', '', 'UNI', '0', '98.18', '', 'MN', 'NO', 'SCHNEIDER'),
(416, '4225', 'INT. TIPO RIEL iC60N 2X25AMP 20KA-230VAC   ', 'A9F74225', '', 'UNI', '0', '98.18', '', 'MN', 'NO', 'SCHNEIDER'),
(417, '4232', 'INT. TIPO RIEL IC60N 2X32AMP 20KA-230VAC   ', 'A9F74232', '', 'UNI', '0', '98.18', '', 'MN', 'NO', 'SCHNEIDER'),
(418, '4240', 'INT. TIPO RIEL IC60N 2X40AMP 20KA-230VAC   ', 'A9F74240', '', 'UNI', '0', '129.78', '', 'MN', 'NO', 'SCHNEIDER'),
(419, '4250', 'INT. TIPO RIEL iC60N 2X50AMP 20KA-230VAC   ', 'A9F74250', '', 'UNI', '0', '130.99', '', 'MN', 'NO', 'SCHNEIDER'),
(420, '4263', 'INT. TIPO RIEL iC60N 2X63AMP 20KA-230VAC   ', 'A9F74263', '', 'UNI', '0', '130.99', '', 'MN', 'NO', 'SCHNEIDER'),
(421, '4301', 'INT. TIPO RIEL iC60N 3X01AMP 50KA-230VAC   ', 'A9F74301', '', 'UNI', '0', '282.11', '', 'MN', 'NO', 'SCHNEIDER'),
(422, '430100', 'FDN36TD016ED INT. REGULABLE FDN 12.8-16AMP.    ', '430100', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(423, '430102', 'FDN36TD025ED INT. REGULABLE FDN 20-25AMP.    ', '430102', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(424, '430103', 'FDN36TD032ED INT. REGULABLE FDN 25.6-32AMP.    ', '430103', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(425, '430104', 'FDN36TD040ED INT. REGULABLE FDN 32-40AMP.    ', '430104', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.');
INSERT INTO `productos` (`idproducto`, `codigo`, `nombre`, `descripcion`, `imagen`, `um`, `presentacion`, `precio`, `descuento`, `moneda`, `igv`, `marca`) VALUES
(426, '430105', 'FDN36TD050ED INT. REGULABLE FDN 40-50AMP.    ', '430105', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(427, '430106', 'FDN36TD063ED INT. REGULABLE FDN 50.4-63AMP.    ', '430106', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(428, '43016', 'INT. REGULABLE SUSOL 12.8-16AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(429, '430161', 'FDS36TD016ED INT. REGULABLE FDS 12.8-16AMP.    ', '430161', '', 'UNI', '0', '531.5', '', 'MN', 'NO', 'G.E.'),
(430, '430165', 'FDS36TD025ED INT. REGULABLE FDS 20-25AMP.    ', '430165', '', 'UNI', '0', '531.5', '', 'MN', 'NO', 'G.E.'),
(431, '430167', 'FDS36TD032ED INT. REGULABLE FDS 25.6-32AMP.    ', '430167', '', 'UNI', '0', '531.5', '', 'MN', 'NO', 'G.E.'),
(432, '430169', 'FDS36TD040ED INT. REGULABLE FDS 32-40AMP.    ', '430169', '', 'UNI', '0', '531.5', '', 'MN', 'NO', 'G.E.'),
(433, '430178', 'FDS36TD050ED INT. REGULABLE FDS 40-50AMP.    ', '430178', '', 'UNI', '0', '531.5', '', 'MN', 'NO', 'G.E.'),
(434, '4302', 'INT. TIPO RIEL iC60N 3X02AMP 50KA-230VAC   ', 'A9F74302', '', 'UNI', '0', '282.65', '', 'MN', 'NO', 'SCHNEIDER'),
(435, '43025', 'INT. REGULABLE SUSOL 20-25AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(436, '43032', 'INT. REGULABLE SUSOL 25-32AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(437, '4304', 'INT. TIPO RIEL iC60N 3X04AMP 50KA-230VAC   ', 'A9F74304', '', 'UNI', '0', '262.96', '', 'MN', 'NO', 'SCHNEIDER'),
(438, '43040', 'INT. REGULABLE SUSOL 32-40AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(439, '43050', 'INT. REGULABLE SUSOL 40-50AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(440, '4306', 'INT. TIPO RIEL iC60N 3X06AMP 20KA-230VAC   ', 'A9F74306', '', 'UNI', '0', '228.61', '', 'MN', 'NO', 'SCHNEIDER'),
(441, '43063', 'INT. REGULABLE SUSOL 50.4-63AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(442, '430630', 'FDN36TD080ED INT. REGULABLE FDN 64-80AMP.    ', '430630', '', 'UNI', '0', '569', '', 'MN', 'NO', 'G.E.'),
(443, '430633', 'FDN36TD100ED INT. REGULABLE FDN 80-100AMP.    ', '430633', '', 'UNI', '0', '574.5', '', 'MN', 'NO', 'ABB'),
(444, '430636', 'FDN36TD125ED INT. REGULABLE FDN 100-125AMP.    ', '430636', '', 'UNI', '0', '666', '', 'MN', 'NO', 'G.E.'),
(445, '43080', 'INT. REGULABLE SUSOL 64-80AMP 85KA/230VAC    ', 'TD100N', '', 'BL', '0', '509.28', '', 'MN', 'NO', 'LS'),
(446, '430818', 'DE ALARMA PARA FD,FE Y FG, ABIERTO  ', 'CONTACTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(447, '430828', 'AUXI. IZQUIERDA PARA FD,FE Y FG, CERRADO  ', 'CONTACTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(448, '430831', 'AUXI. DERECHA PARA FD,FE Y FG, CERRADO  ', 'CONTACTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(449, '430834', 'AUXI. IZQUIERDA PARA FD,FE Y FG, ABIERTO  ', 'CONTACTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(450, '430837', 'AUXI. DERECHA PARA FD,FE Y FG, ABIERTO  ', 'CONTACTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(451, '430852', 'DE DISPARO 220/240VAC PARA FD,FE Y FG  ', 'BOBINA', '', 'UNI', '0', '231.5', '', 'MN', 'NO', 'G.E.'),
(452, '430870', 'DE MÍNIMO VOLTAGE 220/240VAC PARA FD,FE Y FG ', 'RELÉ', '', 'UNI', '0', '368.5', '', 'MN', 'NO', 'G.E.'),
(453, '430879', 'TIPO CANDADO REMOVIBLE PARA FD,FE    ', 'ENCLAVAMIENTO', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(454, '430957', 'DE 12 SEPARADORES DE FASES PARA FD  ', 'SET', '', 'UNI', '0', '90.5', '', 'MN', 'NO', 'G.E.'),
(455, '4310', 'INT. TIPO RIEL iC60N 3X10AMP 20KA-230VAC   ', 'A9F74310', '', 'UNI', '0', '204.02', '', 'MN', 'NO', 'SCHNEIDER'),
(456, '43100', 'INT. REGULABLE SUSOL 80-100AMP 85KA/230VAC    ', 'TD100N', '', 'UNI', '0', '509.28', '', 'MN', 'NO', 'LS'),
(457, '431058', 'FEV36TA200KF INT. REGULABLE FEV 160-200AMP.    ', '431058', '', 'UNI', '0', '861', '', 'MN', 'NO', 'G.E.'),
(458, '431061', 'FEV36TA250KF INT. REGULABLE FEV 200-250AMP.    ', '431061', '', 'UNI', '0', '861', '', 'MN', 'NO', 'G.E.'),
(459, '43125', 'INT. REGULABLE SUSOL 100-125AMP 85KA/230VAC    ', 'TD160N', '', 'UNI', '0', '592.14', '', 'MN', 'NO', 'G.E.'),
(460, '431409', 'TIPO CANDADO REMOVIBLE PARA FG    ', 'ENCLAVAMIENTO', '', 'UNI', '0', '29', '', 'MN', 'NO', 'G.E.'),
(461, '4316', 'INT. TIPO RIEL iC60N 3X16AMP 20KA-230VAC   ', 'A9F74316', '', 'UNI', '0', '188.05', '', 'MN', 'NO', 'SCHNEIDER'),
(462, '43160', 'INT. REGULABLE SUSOL 128-160AMP 85KA/230VAC    ', 'TD160N', '', 'UNI', '0', '691.58', '', 'MN', 'NO', 'LS'),
(463, '4320', 'INT. TIPO RIEL IC60N 3X20AMP 20KA-230VAC   ', 'A9F74320', '', 'UNI', '0', '188.05', '', 'MN', 'NO', 'SCHNEIDER'),
(464, '43200', 'INT. REGULABLE SUSOL 160-200AMP 100KA/230VAC    ', 'TS250N', '', 'UNI', '0', '963.89', '', 'MN', 'NO', 'LS'),
(465, '432064', 'ELÉCTRICO, 220/250 VCC/VCA SERIE FE    ', 'COMANDO', '', 'UNI', '0', '1519', '', 'MN', 'NO', 'G.E.'),
(466, '432085', 'DE 12 SEPARADORES DE FASES PARA FE  ', 'SET', '', 'UNI', '0', '108.5', '', 'MN', 'NO', 'G.E.'),
(467, '4325', 'INT. TIPO RIEL iC60N 3X25AMP 20KA-230VAC   ', 'A9F74325', '', 'UNI', '0', '188.05', '', 'MN', 'NO', 'SCHNEIDER'),
(468, '43250', 'INT. REGULABLE SUSOL 200-250AMP 100KA/230VAC    ', 'TS250N', '', 'UNI', '0', '1013.56', '', 'MN', 'NO', 'LS'),
(469, '432829', 'ELÉCTRICO, 220/250 VCC/VCA SERIE FG    ', 'COMANDO', '', 'UNI', '0', '2852', '', 'MN', 'NO', 'G.E.'),
(470, '432852', 'DE 12 SEPARADORES DE FASES PARA FG  ', 'SET', '', 'UNI', '0', '90.5', '', 'MN', 'NO', 'G.E.'),
(471, '432952', 'FDS36TD063ED INT. REGULABLE FDS 50.4-63AMP.    ', '432952', '', 'UNI', '0', '551', '', 'MN', 'NO', 'G.E.'),
(472, '432955', 'FDS36TD080ED INT. REGULABLE FDS 64-80AMP.    ', '432955', '', 'UNI', '0', '551', '', 'MN', 'NO', 'G.E.'),
(473, '432958', 'FDS36TD100ED INT. REGULABLE FDS 80-100AMP.    ', '432958', '', 'UNI', '0', '562', '', 'MN', 'NO', 'G.E.'),
(474, '432961', 'FDS36TD125ED INT. REGULABLE FDS 100-125AMP.    ', '432961', '', 'UNI', '0', '650', '', 'MN', 'NO', 'G.E.'),
(475, '432979', 'FEN36TD200KF INT. REGULABLE FEN 160-200AMP.    ', '432979', '', 'UNI', '0', '1083', '', 'MN', 'NO', 'G.E.'),
(476, '432982', 'FEN36TD250KF INT. REGULABLE FEN 200-250AMP.    ', '432982', '', 'UNI', '0', '1083', '', 'MN', 'NO', 'G.E.'),
(477, '4332', 'INT. TIPO RIEL IC60N 3X32AMP 20KA-230VAC   ', 'A9F74332', '', 'UNI', '0', '188.05', '', 'MN', 'NO', 'SCHNEIDER'),
(478, '433417', 'TIPO CANDADO REMOVIBLE PARA FK    ', 'ENCLAVAMIENTO', '', 'UNI', '0', '173.5', '', 'MN', 'NO', 'G.E.'),
(479, '433572', 'FDN36TD160ED INT. REGULABLE FDN 128-160AMP.    ', '433572', '', 'UNI', '0', '721.5', '', 'MN', 'NO', 'G.E.'),
(480, '433602', 'FDS36TD160ED INT. REGULABLE FDS 128-160AMP.    ', '433602', '', 'UNI', '0', '709.5', '', 'MN', 'NO', 'G.E.'),
(481, '433649', 'FDE36TE016ED INT. REGULABLE FDE 12.8-16AMP.    ', '433649', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(482, '433653', 'FDE36TE025ED INT. REGULABLE FDE 20-25AMP.    ', '433653', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(483, '433655', 'FDE36TE032ED INT. REGULABLE FDE 25.6-32AMP.    ', '433655', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(484, '433657', 'FDE36TE040ED INT. REGULABLE FDE 32-40AMP.    ', '433657', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(485, '433659', 'FDE36TE050ED INT. REGULABLE FDE 40-50AMP.    ', '433659', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(486, '433661', 'FDE36TE063ED INT. REGULABLE FDE 50.4-63AMP.    ', '433661', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(487, '433663', 'FDE36TE080GD INT. REGULABLE FDE 64-80AMP.    ', '433663', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(488, '433665', 'FDE36TE100GD INT. REGULABLE FDE 80-100AMP.    ', '433665', '', 'UNI', '0', '402.5', '', 'MN', 'NO', 'G.E.'),
(489, '433667', 'FDE36TE125GD INT. REGULABLE FDE 100-125AMP.    ', '433667', '', 'UNI', '0', '516.5', '', 'MN', 'NO', 'G.E.'),
(490, '433669', 'FDE36TE160GD INT. REGULABLE FDE 128-160AMP.    ', '433669', '', 'UNI', '0', '516.5', '', 'MN', 'NO', 'G.E.'),
(491, '4340', 'INT. TIPO RIEL IC60N 3X40AMP 20KA-230VAC   ', 'A9F74340', '', 'UNI', '0', '218.78', '', 'MN', 'NO', 'SCHNEIDER'),
(492, '4350', 'INT. TIPO RIEL iC60N 3X50AMP 20KA-230VAC   ', 'A9F74350', '', 'UNI', '0', '218.78', '', 'MN', 'NO', 'SCHNEIDER'),
(493, '435336', 'FKN36NT800PF INT. REGULABLE FKN 640-800AMP.    ', '435336', '', 'UNI', '0', '5259.5', '', 'MN', 'NO', 'G.E.'),
(494, '435384', 'FKN36NE125SSF INT. REGULABLE FKN 500-1250A.    ', '435384', '', 'UNI', '0', '10000', '', 'MN', 'NO', 'G.E.'),
(495, '435387', 'FKN36NE160TTF INT. REGULABLE FKN 640-1600.A    ', '435387', '', 'UNI', '0', '10259.5', '', 'MN', 'NO', 'G.E.'),
(496, '435393', 'FKN36NE800PPF INT. REGULABLE FKN 320-800AMP.    ', '435393', '', 'UNI', '0', '7037.5', '', 'MN', 'NO', 'G.E.'),
(497, '435396', 'FKN36NE100SQF INT. REGULABLE FKN 400-1000A.    ', '435396', '', 'UNI', '0', '9148.5', '', 'MN', 'NO', 'G.E.'),
(498, '435550', 'FKN36NT100SF INT. REGULABLE FKN 800-1000AMP.    ', '435550', '', 'UNI', '0', '6519', '', 'MN', 'NO', 'G.E.'),
(499, '435551', 'FKN36NT125SF INT. REGULABLE FKN 1000-1250A.    ', '435551', '', 'UNI', '0', '7778', '', 'MN', 'NO', 'G.E.'),
(500, '435696', 'DE DISPARO 220/240VAC PARA FK    ', 'BOBINA', '', 'UNI', '0', '455', '', 'MN', 'NO', 'G.E.'),
(501, '435699', 'DE MÍNIMO VOLTAGE 230VAC PARA FK   ', 'RELÉ', '', 'UNI', '0', '679', '', 'MN', 'NO', 'G.E.'),
(502, '435761', 'DE ALARMA DERECHA PARA FK, CHANGE-OVER   ', 'CONT.', '', 'UNI', '0', '166.5', '', 'MN', 'NO', 'G.E.'),
(503, '4363', 'INT. TIPO RIEL iC60N 3X63AMP 20KA-230VAC   ', 'A9F74363', '', 'UNI', '0', '218.78', '', 'MN', 'NO', 'SCHNEIDER'),
(504, '43630', 'INT. REGULABLE SUSOL 504-630AMP 100KA/230VAC    ', 'TS630N', '', 'UNI', '0', '2119.26', '', 'MN', 'NO', 'LS'),
(505, '436401', 'AUXI. DERECHA PARA FK, CHANGE-OVER    ', 'CONTACTO', '', 'UNI', '0', '216.5', '', 'MN', 'NO', 'G.E.'),
(506, '436476', 'ROTATORIO CON EXTENSION PARA FD    ', 'MANDO', '', 'UNI', '0', '362.5', '', 'MN', 'NO', 'G.E.'),
(507, '436478', 'ROTATORIO DIRECTO PARA FD     ', 'MANDO', '', 'UNI', '0', '188', '', 'MN', 'NO', 'G.E.'),
(508, '436493', 'ROTATORIO CON EXTENSION PARA FE    ', 'MANDO', '', 'UNI', '0', '370', '', 'MN', 'NO', 'G.E.'),
(509, '436495', 'ROTATORIO DIRECTO PARA FE     ', 'MANDO', '', 'UNI', '0', '191.5', '', 'MN', 'NO', 'G.E.'),
(510, '436506', 'ROTATORIO CON EXTENSION PARA FG    ', 'MANDO', '', 'UNI', '0', '491.5', '', 'MN', 'NO', 'G.E.'),
(511, '436509', 'ROTATORIO DIRECTO PARA FG     ', 'MANDO', '', 'UNI', '0', '232.5', '', 'MN', 'NO', 'G.E.'),
(512, '436519', 'ROTATORIO CON EXTENSION PARA FK    ', 'MANDO', '', 'UNI', '0', '661.5', '', 'MN', 'NO', 'G.E.'),
(513, '436522', 'ROTATORIO DIRECTO PARA FK     ', 'MANDO', '', 'UNI', '0', '429', '', 'MN', 'NO', 'G.E.'),
(514, '43800', 'INT. REGULABLE SUSOL 640-800AMP 100KA/230VAC    ', 'TS800N', '', 'UNI', '0', '4073.57', '', 'MN', 'NO', 'LS'),
(515, '438432', 'FGN INT. REGULABLE FGN 125-400AMP.    ', '438432', '', 'UNI', '0', '2193.5', '', 'MN', 'NO', 'G.E.'),
(516, '438496', 'INT. REGULABLE FGN 180-630AMP. 85KA 220VAC   ', '438496', '', 'UNI', '0', '2835.5', '', 'MN', 'NO', 'G.E.'),
(517, '4425', 'INTERRUPTOR DIFERENCIAL 4X25AMP 300mA     ', 'A9R74425', '', 'UNI', '0', '292.78', '', 'MN', 'NO', 'SCHNEIDER'),
(518, '4440', 'INTERRUPTOR DIFERENCIAL 4X40AMP 300mA     ', 'A9R74440', '', 'UNI', '0', '304.32', '', 'MN', 'NO', 'SCHNEIDER'),
(519, '4463', 'INTERRUPTOR DIFERENCIAL 4X63AMP 300mA     ', 'A9R74463', '', 'UNI', '0', '474.94', '', 'MN', 'NO', 'SCHNEIDER'),
(520, '4519', 'CONTACTOR 700 AMP 100-250VAC 1NA+1NC    ', '246180', '', 'UNI', '0', '5407.5', '', 'MN', 'NO', 'G.E.'),
(521, '4524', 'CONTACTOR 825 AMP 220-240VAC 1NA+1NC    ', '104524', '', 'UNI', '0', '9818.5', '', 'MN', 'NO', 'G.E.'),
(522, '4525', 'CONTACTOR 825 AMP 360-440VAC 1NA+1NC    ', '104525', '', 'UNI', '0', '9818.5', '', 'MN', 'NO', 'G.E.'),
(523, '460001', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X16AMP.   ', '460001', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(524, '460002', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X20AMP.   ', '460002', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(525, '460003', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X25AMP.   ', '460003', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(526, '460004', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X32AMP.   ', '460004', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(527, '460005', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X40AMP.   ', '460005', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(528, '460006', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X50AMP.   ', '460006', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(529, '460007', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X63AMP.   ', '460007', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(530, '460008', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X80AMP.   ', '460008', '', 'UNI', '0', '289', '', 'MN', 'NO', 'G.E.'),
(531, '460009', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X100AMP.   ', '460009', '', 'UNI', '0', '289', '', 'MN', 'NO', 'G.E.'),
(532, '460010', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X125AMP.   ', '460010', '', 'UNI', '0', '385.5', '', 'MN', 'NO', 'G.E.'),
(533, '460011', 'INT. CAJA MOLDEADA RECORD C 3X160AMP.   ', '460011', '', 'UNI', '0', '479', '', 'MN', 'NO', 'G.E.'),
(534, '460063', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X200AMP.   ', '460063', '', 'UNI', '0', '696.5', '', 'MN', 'NO', 'G.E.'),
(535, '460065', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X250AMP.   ', '460065', '', 'UNI', '0', '696.5', '', 'MN', 'NO', 'G.E.'),
(536, '460081', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X315AMP.   ', '460081', '', 'UNI', '0', '1250', '', 'MN', 'NO', 'G.E.'),
(537, '460082', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X350AMP.   ', '460082', '', 'UNI', '0', '1350', '', 'MN', 'NO', 'G.E.'),
(538, '460083', 'INTERRUPTOR CAJA MOLDEADA RECORD C 3X400AMP.   ', '460083', '', 'UNI', '0', '1490', '', 'MN', 'NO', 'G.E.'),
(539, '4700', 'CONTACTO AUXILIAR FRONTAL 1NA     ', '104700', '', 'UNI', '0', '18', '', 'MN', 'NO', 'G.E.'),
(540, '4701', 'CONTACTO AUXILIAR FRONTAL 1NC     ', '104701', '', 'UNI', '0', '18', '', 'MN', 'NO', 'G.E.'),
(541, '4704', 'CONTACTO AUXILIAR LATERAL 2NA     ', '104704', '', 'UNI', '0', '38', '', 'MN', 'NO', 'G.E.'),
(542, '4709', 'TEMPORIZADOR A TRABAJO 1NA+1NC 0.1 A 30S  ', '104709', '', 'UNI', '0', '209.5', '', 'MN', 'NO', 'G.E.'),
(543, '4710', 'TEMPORIZADOR A TRABAJO 1NA+1NC 1 A 60S  ', '104710', '', 'UNI', '0', '238.5', '', 'MN', 'NO', 'G.E.'),
(544, '4711', 'TEMPORIZADOR A REPOSO 1NA+1NC 0.1 A 30S  ', '104711', '', 'UNI', '0', '209.5', '', 'MN', 'NO', 'G.E.'),
(545, '4712', 'TEMPORIZADOR A REPOSO 1NA+1NC 1 A 60S  ', '104712', '', 'UNI', '0', '238.5', '', 'MN', 'NO', 'G.E.'),
(546, '4723', 'ENCLAVAMIENTO PARA CL00....CL10      ', '104723', '', 'UNI', '0', '45.5', '', 'MN', 'NO', 'G.E.'),
(547, '5232', 'MINUTEROS MIN 16AMP 220VAC     ', 'CCT15232', '', 'UNI', '0', '481.64', '', 'MN', 'NO', 'SCHNEIDER'),
(548, '5240', 'INTERRUPTOR DIFERENCIAL ilDsi 2X40A 300mA    ', 'A9R35240', '', 'UNI', '0', '306.93', '', 'MN', 'NO', 'SCHNEIDER'),
(549, '5263', 'INTERRUPTOR DIFERENCIAL ilDsi 2X63A 300mA    ', 'A9R35263', '', 'UNI', '0', '479.93', '', 'MN', 'NO', 'SCHNEIDER'),
(550, '531000', 'NGO INT. REGUL. SUSOL 400-1000AMP 100KA/230VAC   ', 'TS1000N', '', 'UNI', '0', '5629.33', '', 'MN', 'NO', 'LS'),
(551, '531250', 'NGO INT. REGUL. SUSOL 500-1250AMP 100KA/230VAC   ', 'TS1250N', '', 'UNI', '0', '7437.17', '', 'MN', 'NO', 'LS'),
(552, '531600', 'NGO INT. REGUL. SUSOL 640-1600AMP 100KA/230VAC   ', 'TS1600N', '', 'UNI', '0', '9826.59', '', 'MN', 'NO', 'LS'),
(553, '5336', 'INT. HORARIO ANALOGICO 16AMP 220VAC    ', '15336', '', 'UNI', '0', '370.56', '', 'MN', 'NO', 'SCHNEIDER'),
(554, '53400', 'ETS INT. REGUL. SUSOL 160-400AMP 100KA/230VAC   ', 'TS400N', '', 'UNI', '0', '1722.21', '', 'MN', 'NO', 'LS'),
(555, '53800', 'ETS INT. REGUL. SUSOL 320-800AMP 100KA/230VAC   ', 'TS800N', '', 'UNI', '0', '4338.92', '', 'MN', 'NO', 'LS'),
(556, '5854', 'INT. HORARIO DIGITAL 16AMP 220VAC    ', 'CCT15854', '', 'UNI', '0', '686.66', '', 'MN', 'NO', 'SCHNEIDER'),
(557, '6053', 'TOROIDES CERRADOS 1600AMP      ', '56053', '', 'UNI', '0', '3163.7', '', 'MN', 'NO', 'SCHNEIDER'),
(558, '606135', 'INT. DIFERENCIAL BPC280/030 2X80AMP 30MA    ', '606135', '', 'UNI', '0', '250', '', 'MN', 'NO', 'G.E.'),
(559, '606136', 'INT. DIFERENCIAL BPC2100/030 2X100AMP 30MA    ', '606136', '', 'UNI', '0', '310', '', 'MN', 'NO', 'G.E.'),
(560, '606150', 'INT. DIFERENCIAL BDC263/300 2X63AMP 300MA    ', '606150', '', 'UNI', '0', '175', '', 'MN', 'NO', 'G.E.'),
(561, '606211', 'INT. DIFERENCIAL BPC480/030 4X80AMP 30MA    ', '606211', '', 'UNI', '0 UNI', '450', '', 'MN', 'NO', 'G.E.'),
(562, '606212', 'INT. DIFERENCIAL BPC4100/030 4X100AMP 30MA    ', '606212', '', 'UNI', '0', '490', '', 'MN', 'NO', 'G.E.'),
(563, '606224', 'INT. DIFERENCIAL BPC425/300 4X25AMP 300MA    ', '606224', '', 'UNI', '0', '250', '', 'MN', 'NO', 'G.E.'),
(564, '606225', 'INT. DIFERENCIAL BPC440/300 4X40AMP 300MA    ', '606225', '', 'UNI', '0', '275', '', 'MN', 'NO', 'G.E.'),
(565, '606226', 'INT. DIFERENCIAL BPC463/300 4X63AMP 300MA    ', '606226', '', 'UNI', '0', '300', '', 'MN', 'NO', 'G.E.'),
(566, '606227', 'INT. DIFERENCIAL BPC480/300 4X80AMP 300MA    ', '606227', '', 'UNI', '0', '445', '', 'MN', 'NO', 'G.E.'),
(567, '606228', 'INT. DIFERENCIAL BPC4100/300 4X100AMP 300MA    ', '606228', '', 'UNI', '0', '470', '', 'MN', 'NO', 'G.E.'),
(568, '607127', 'INT. DIFERENCIAL BDC225/300 2X25AMP 300MA    ', '607127', '', 'UNI', '0', '135', '', 'MN', 'NO', 'G.E.'),
(569, '607128', 'INT. DIFERENCIAL BDC240/300 2X40AMP 300MA    ', '607128', '', 'UNI', '0', '150', '', 'MN', 'NO', 'G.E.'),
(570, '6137', 'INT. TIPO RIEL C60H-DC 2X40A 20KA-220VDC   ', 'A9N61537', '', 'UNI', '0', '279.92', '', 'MN', 'NO', 'SCHNEIDER'),
(571, '624929', 'ENCLAVAMIENTO T. CANDADO PARA G60/G100    ', '624929', '', 'UNI', '0', '29', '', 'MN', 'NO', 'G.E.'),
(572, '6569', 'LIMITADORES SOBRETENC. 3P+N iPRD40 40kA    ', 'A9L40600', '', 'UNI', '0', '1265.66', '', 'MN', 'NO', 'SCHNEIDER'),
(573, '665190', 'ANALIZADOR DE RED 96X96mm F. ALIM. UNIVERSAL  ', '665190', '', 'UNI', '0', '1481.5', '', 'MN', 'NO', 'G.E.'),
(574, '665194', 'ANALIZADOR DE RED 144X144mm ALIM. 110/230VAC   ', '665194', '', 'UNI', '0', '11837', '', 'MN', 'NO', 'G.E.'),
(575, '666104', 'INT. HORARIO CLASSIC Q31 3 MÓDULOS 16AMP.  ', '666104', '', 'UNI', '0', '193', '', 'MN', 'NO', 'G.E.'),
(576, '666105', 'INT. HORARIO CLASSIC Q11 1 MÓDULO 16AMP.  ', '666105', '', 'UNI', '0', '193', '', 'MN', 'NO', 'G.E.'),
(577, '666131', 'CONTACTOR 20A 1 MODULO 2NA 230V AC  ', '666131', '', 'UNI', '0', '90', '', 'MN', 'NO', 'G.E.'),
(578, '666133', 'CONTACTOR 20A 1 MODULO 2NA 24V AC  ', '666133', '', 'UNI', '0', '90', '', 'MN', 'NO', 'G.E.'),
(579, '666151', 'CONTACTOR 40A 3 MODULO 4NA 230V AC/DC  ', '666151', '', 'UNI', '0', '180', '', 'MN', 'NO', 'G.E.'),
(580, '666153', 'CONTACTOR 40A 3 MODULO 4NA 24V AC/DC  ', '666153', '', 'UNI', '0 UNI', '180', '', 'MN', 'NO', 'G.E.'),
(581, '666162', 'CONTACTO AUXILIAR 1NA+1NC      ', '666162', '', 'UNI', '0', '75', '', 'MN', 'NO', 'G.E.'),
(582, '666163', 'CONTACTO AUXILIAR 2NA      ', '666163', '', 'UNI', '0', '75', '', 'MN', 'NO', 'G.E.'),
(583, '666178', 'INT. HORARIO CLASSIC Q41 4 MÓDULOS 16AMP.  ', '666178', '', 'UNI', '0', '166', '', 'MN', 'NO', 'G.E.'),
(584, '666312', 'INT. HORARIO DIG. GALAX Q21 2 MÓD. 16 AMP.', '666312', '', 'UNI', '0', '402', '', 'MN', 'NO', 'G.E.'),
(585, '671534', 'INT. TIPO RIEL HTI 2X80AMP 15KA-240VAC   ', '671534', '', 'UNI', '0', '204.5', '', 'MN', 'NO', 'G.E.'),
(586, '671535', 'INT. TIPO RIEL HTI 2X100AMP 15KA-240VAC   ', '671535', '', 'UNI', '0', '219', '', 'MN', 'NO', 'G.E.'),
(587, '671540', 'INT. TIPO RIEL HTI 3X80AMP 15KA-240VAC   ', '671540', '', 'UNI', '0', '297.5', '', 'MN', 'NO', 'G.E.'),
(588, '671541', 'INT. TIPO RIEL HTI 3X100AMP 15KA-240VAC   ', '671541', '', 'UNI', '0', '297.5', '', 'MN', 'NO', 'G.E.'),
(589, '671542', 'INT. TIPO RIEL HTI 3X125AMP 15KA-240VAC   ', '671542', '', 'UNI', '0', '374.5', '', 'MN', 'NO', 'G.E.'),
(590, '672567', 'CONTACTO DE INDICACIÓN DE ESTADO CA H  ', '672567', '', 'UNI', '0', '62', '', 'MN', 'NO', 'G.E.'),
(591, '672568', 'CONTACTO PARA SEÑAL DE FALLA CA S/H  ', '672568', '', 'UNI', '0', '68.5', '', 'MN', 'NO', 'G.E.'),
(592, '672572', 'DESCONECTADOR APERTURA D/PANEL,G60-G100      ', '672572', '', 'UNI', '0', '164.5', '', 'MN', 'NO', 'G.E.'),
(593, '672573', 'BOBINA DISPARO 24-48V AC/DC, G60-G100    ', '672573', '', 'UNI', '0 UNI', '70', '', 'MN', 'NO', 'G.E.'),
(594, '672574', 'BOBINA DISPARO 110-220V,110VDC, G60-G100     ', '672574', '', 'UNI', '0 UNI', '75', '', 'MN', 'NO', 'G.E.'),
(595, '672577', 'BOBINA MÍN.24V AC/DC PARA G60-G100    ', '672577', '', 'UNI', '0 UNI', '255.5', '', 'MN', 'NO', 'G.E.'),
(596, '672578', 'BOBINA MÍN.48V AC/DC PARA G60, G100   ', '672578', '', 'UNI', '0 UNI', '255.5', '', 'MN', 'NO', 'G.E.'),
(597, '672580', 'MANDO MOTOR 220V PARA G60-G100    ', '672580', '', 'UNI', '0', '596.5', '', 'MN', 'NO', 'G.E.'),
(598, '674605', 'INT. TIPO RIEL G60 1X16AMP 10KA-240VAC   ', '674605', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(599, '674608', 'INT. TIPO RIEL G60 1X32AMP 10KA-240VAC   ', '674608', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(600, '674630', 'INT. TIPO RIEL G60 2X2AMP 20KA/240VAC   ', '674630', '', 'UNI', '0', '62', '', 'MN', 'NO', 'G.E.'),
(601, '674632', 'INT. TIPO RIEL G60 2X4AMP 20KA/240VAC   ', '674632', '', 'UNI', '0', '62', '', 'MN', 'NO', 'G.E.'),
(602, '674646', 'INT. TIPO RIEL G60 3X02AMP 20KA/240VAC   ', '674646', '', 'UNI', '0', '130', '', 'MN', 'NO', 'G.E.'),
(603, '674648', 'INT. TIPO RIEL G60 3X04AMP 20KA/240VAC   ', '674648', '', 'UNI', '0', '130', '', 'MN', 'NO', 'G.E.'),
(604, '674916', 'INT. TIPO RIEL G100 3X50AMP 15KA-240VAC   ', '674916', '', 'UNI', '0 UNI', '167.5', '', 'MN', 'NO', 'G.E.'),
(605, '678936', 'INT. TIPO RIEL KG62C06 2X06AMP 10KA-240VAC   ', '678936', '', 'UNI', '0', '35.5', '', 'MN', 'NO', 'G.E.'),
(606, '678937', 'INT. TIPO RIEL KG62C10 2X10AMP 10KA-240VAC   ', '678937', '', 'UNI', '0', '35.5', '', 'MN', 'NO', 'G.E.'),
(607, '678938', 'INT. TIPO RIEL KG62C16 2X16AMP 10KA-240VAC   ', '678938', '', 'UNI', '0', '31', '', 'MN', 'NO', 'G.E.'),
(608, '678939', 'INT. TIPO RIEL KG62C20 2X20AMP 10KA-240VAC   ', '678939', '', 'UNI', '0', '31', '', 'MN', 'NO', 'G.E.'),
(609, '678940', 'INT. TIPO RIEL KG62C25 2X25AMP 10KA-240VAC   ', '678940', '', 'UNI', '0', '31', '', 'MN', 'NO', 'G.E.'),
(610, '678941', 'INT. TIPO RIEL KG62C32 2X32AMP 10KA-240VAC   ', '678941', '', 'UNI', '0', '31', '', 'MN', 'NO', 'G.E.'),
(611, '678942', 'INT. TIPO RIEL KG62C40 2X40AMP 10KA-240VAC   ', '678942', '', 'UNI', '0', '39', '', 'MN', 'NO', 'G.E.'),
(612, '678943', 'INT. TIPO RIEL KG62C50 2X50AMP 10KA-240VAC   ', '678943', '', 'UNI', '0', '39', '', 'MN', 'NO', 'G.E.'),
(613, '678945KG', 'INT.TIPO RIEL KG63C32 3X06AMP 10KA-240VAC    ', '678945', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(614, '678946', 'INT. TIPO RIEL KG63C10 3X10AMP 10KA-240VAC   ', '678946', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(615, '678947', 'INT. TIPO RIEL KG63C20 3X16AMP 10KA-240VAC   ', '678947', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(616, '678948', 'INT. TIPO RIEL KG63C20 3X20AMP 10KA-240VAC   ', '678948', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(617, '678949', 'INT. TIPO RIEL KG63C25 3X25AMP 10KA-240VAC   ', '678949', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(618, '678950', 'INT. TIPO RIEL KG63C32 3X32AMP 10KA-240VAC   ', '678950', '', 'UNI', '0', '70.5', '', 'MN', 'NO', 'G.E.'),
(619, '678953', 'INT. TIPO RIEL KG63C63 3X63AMP 10KA-240VAC   ', '678953', '', 'UNI', '0', '79.5', '', 'MN', 'NO', 'G.E.'),
(620, '686105', 'TELERRUPTOR 16A 2NA 24 VDC/48 VAC   ', '686105', '', 'UNI', '0', '130', '', 'MN', 'NO', 'G.E.'),
(621, '686107', 'TELERRUPTOR 16A 1 MÓDULO 2NA 230V AC  ', '686107', '', 'UNI', '0', '120', '', 'MN', 'NO', 'G.E.'),
(622, '686284', 'TELERRUPTOR 16A 1NA 230V AC    ', '686284', '', 'UNI', '0', '80', '', 'MN', 'NO', 'G.E.'),
(623, '6924', 'CONTACTO DE SEÑALIZACION DE ESTADO iOF   ', 'A9A26924', '', 'UNI', '0', '101.95', '', 'MN', 'NO', 'SCHNEIDER'),
(624, '6927', 'CONTACTO DE SEÑALIZACION DE DEFECTO iSD   ', 'A9A26927', '', 'UNI', '0', '101.95', '', 'MN', 'NO', 'SCHNEIDER'),
(625, '693493', 'INT. DIFERENCIAL KBD225/030 2X25AMP 30MA    ', '693493', '', 'UNI', '0', '101', '', 'MN', 'NO', 'G.E.'),
(626, '693494', 'INT. DIFERENCIAL KBD240/030 2X40AMP 30MA    ', '693494', '', 'UNI', '0', '121', '', 'MN', 'NO', 'G.E.'),
(627, '693495', 'INT. DIFERENCIAL KBP440/030 4X40AMP 30MA    ', '693495', '', 'UNI', '0', '273.5', '', 'MN', 'NO', 'G.E.'),
(628, '693496', 'INT. DIFERENCIAL KBP463/030 4X63AMP 30MA    ', '693496', '', 'UNI', '0', '301.5', '', 'MN', 'NO', 'G.E.'),
(629, '693698', 'INT. DIFERENCIAL KBP263/030 2X63AMP 30MA    ', '693698', '', 'UNI', '0', '176.5', '', 'MN', 'NO', 'G.E.'),
(630, '693699', 'INT. DIFERENCIAL KBP425/030 4X25AMP 30MA    ', '693699', '', 'UNI', '0', '247', '', 'MN', 'NO', 'G.E.'),
(631, '6970', 'DISPOSITIVO PARA ENCLAVAMIENTO 2 PZAS    ', '26970', '', 'UNI', '0', '35.48', '', 'MN', 'NO', 'SCHNEIDER'),
(632, '7193', 'CONTACTOR 1NA 20/30KVAR-230/400VAC      ', '247193', '', 'UNI', '0', '479', '', 'MN', 'NO', 'G.E.'),
(633, '7207', 'CONTACTOR 1NA+2NC 45/70KVAR-230/400VAC      ', '247207', '', 'UNI', '0', '1004.5', '', 'MN', 'NO', 'G.E.'),
(634, '7214', 'CONTACTOR 2NA+1NC 15/25KVAR-230/400VAC      ', '247214', '', 'UNI', '0', '355.5', '', 'MN', 'NO', 'G.E.'),
(635, '7215', 'CONTACTOR 1NA+1NC 25/45KVAR-230/400VAC      ', '247215', '', 'UNI', '0', '797.5', '', 'MN', 'NO', 'G.E.'),
(636, '7216', 'CONTACTOR 1NA+1NC 35/55KVAR-230/400VAC      ', '247216', '', 'UNI', '0', '845.5', '', 'MN', 'NO', 'G.E.'),
(637, '724600', 'INT. REGULABLE NS1000H 400-1000 85KA/220V    ', '33473', '', 'UNI', '0', '10841.86', '', 'MN', 'NO', 'SCHNEIDER'),
(638, '7426', 'INTERRUPTOR DIFERENCIAL 2X63AMP 300mA     ', 'A9R74263', '', 'UNI', '0', '345', '', 'MN', 'NO', 'SCHNEIDER'),
(639, '8358', 'INT. TIPO RIEL iC120N 1X100A 20KA-230VAC   ', 'A9N18358', '', 'UNI', '0', '242.24', '', 'MN', 'NO', 'SCHNEIDER'),
(640, '8361', 'INT. TIPO RIEL iC120N 2X80A 20KA-230VAC   ', 'A9N18361', '', 'UNI', '0', '414.69', '', 'MN', 'NO', 'SCHNEIDER'),
(641, '8362', 'INT. TIPO RIEL iC120N 2X100A 20KA-230VAC   ', 'A9N18362', '', 'UNI', '0', '416.16', '', 'MN', 'NO', 'SCHNEIDER'),
(642, '8363', 'INT. TIPO RIEL iC120N 2X125A 20KA-230VAC   ', 'A9N18363', '', 'UNI', '0', '465.21', '', 'MN', 'NO', 'SCHNEIDER'),
(643, '8365', 'INT. TIPO RIEL iC120N 3X80A 20KA-230VAC   ', 'A9N18365', '', 'UNI', '0', '563.84', '', 'MN', 'NO', 'SCHNEIDER'),
(644, '8367', 'INT. TIPO RIEL IC120N 3X100A 20KA-230VAC   ', 'A9N18367', '', 'UNI', '0', '563.84', '', 'MN', 'NO', 'SCHNEIDER'),
(645, '8369', 'INT. TIPO RIEL iC120N 3X125A 20KA-230VAC   ', 'A9N18369', '', 'UNI', '0', '633.62', '', 'MN', 'NO', 'SCHNEIDER'),
(646, '8402', 'INT. TIPO RIEL iC60H 2X02AMP 70KA-230VAC   ', 'A9F84202', '', 'UNI', '0', '174.1', '', 'MN', 'NO', 'SCHNEIDER'),
(647, '8404', 'INT. TIPO RIEL iC60H 2X04AMP 70KA-230VAC   ', 'A9F84204', '', 'UNI', '0', '163.06', '', 'MN', 'NO', 'SCHNEIDER'),
(648, '8410', 'INT. TIPO RIEL iC60H 2X10AMP 30KA-230VAC   ', 'A9F84210', '', 'UNI', '0', '119.96', '', 'MN', 'NO', 'SCHNEIDER'),
(649, '8416', 'INT. TIPO RIEL iC60H 2X16AMP 30KA-230VAC   ', 'A9F84216', '', 'UNI', '0', '119.96', '', 'MN', 'NO', 'SCHNEIDER'),
(650, '8420', 'INT. TIPO RIEL iC60H 2X20AMP 30KA-230VAC   ', 'A9F84220', '', 'UNI', '0', '119.96', '', 'MN', 'NO', 'SCHNEIDER'),
(651, '84206', 'INT. TIPO RIEL iC60H 2X06AMP 30KA-230VAC   ', 'A9F84206', '', 'UNI', '0', '147.13', '', 'MN', 'NO', 'SCHNEIDER'),
(652, '8425', 'INT. TIPO RIEL iC60H 2X25AMP 30KA-230VAC   ', 'A9F84225', '', 'UNI', '0', '119.96', '', 'MN', 'NO', 'SCHNEIDER'),
(653, '8432', 'INT. TIPO RIEL iC60H 2X32AMP 30KA-230VAC   ', 'A9F84232', '', 'UNI', '0', '119.96', '', 'MN', 'NO', 'SCHNEIDER'),
(654, '8440', 'INT. TIPO RIEL iC60H 2X40AMP 30KA-230VAC   ', 'A9F84240', '', 'UNI', '0', '155.75', '', 'MN', 'NO', 'SCHNEIDER'),
(655, '8450', 'INT. TIPO RIEL iC60H 2X50AMP 30KA-230VAC   ', 'A9F84250', '', 'UNI', '0', '155.75', '', 'MN', 'NO', 'SCHNEIDER'),
(656, '8463', 'INT. TIPO RIEL iC60H 2X63AMP 30KA-230VAC   ', 'A9F84263', '', 'UNI', '0', '155.75', '', 'MN', 'NO', 'SCHNEIDER'),
(657, '9125', 'INTERRUPTOR DIFERENCIAL ilDsi 2X25A 30mA    ', 'A9R91225', '', 'UNI', '0', '307.46', '', 'MN', 'NO', 'SCHNEIDER'),
(658, '9140', 'INTERRUPTOR DIFERENCIAL ilDsi 2X40A 30mA    ', 'A9R91240', '', 'UNI', '0', '350.43', '', 'MN', 'NO', 'SCHNEIDER'),
(659, '9175', 'CONTACTOR 9 AMP 110VAC 1NA    ', '109175', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(660, '9177', 'CONTACTOR 9 AMP 220VAC 1NA    ', '109177', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(661, '9180', 'CONTACTOR 9 AMP 440VAC 1NA    ', '109180', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(662, '9210', 'MOD DIF.NSX100/160-0.3-1-10A 200-440V      ', 'LV429210', '', 'UNI', '0', '1594.81', '', 'MN', 'NO', 'SCHNEIDER'),
(663, '9212', 'MOD DIF. NSX100/160 0.3A FIJO 200-440V   ', 'LV429212', '', 'UNI', '0', '1402.19', '', 'MN', 'NO', 'SCHNEIDER'),
(664, '9215', 'MOD DIF.NSX100/160-0.3-1-10A 440-550V      ', 'LV429215', '', 'UNI', '0', '1805.66', '', 'MN', 'NO', 'SCHNEIDER'),
(665, '9242', 'ACCESORIOS 160 AMP- SET DE 3 UND  ', 'LV429242', '', 'UNI', '0', '49.12', '', 'MN', 'NO', 'SCHNEIDER'),
(666, '9246', 'CL01A310T3 CONTACTOR 12 A 110VAC 1NA   ', '109246', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(667, '9248', 'CL01A310T5 CONTACTOR 12 A 220VAC 1NA   ', '109248', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(668, '9251', 'CONTACTOR 12 AMP 440VAC 1NA    ', '109251', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(669, '9259', 'ACCESORIOS 250 AMP- SET DE 3 UND  ', 'LV429259', '', 'UNI', '0', '121.36', '', 'MN', 'NO', 'SCHNEIDER'),
(670, '9319', 'CONTACTOR 18 AMP 110VAC 1NA    ', '109319', '', 'UNI', '0', '94.5', '', 'MN', 'NO', 'G.E.'),
(671, '9321', 'CL02A310T5 CONTACTOR 18 AMP 220VAC 1NA   ', '109321', '', 'UNI', '0', '94.5', '', 'MN', 'NO', 'G.E.'),
(672, '9324', 'CONTACTOR 18 AMP 440VAC 1NA    ', '109324', '', 'UNI', '0', '94.5', '', 'MN', 'NO', 'G.E.'),
(673, '9329', 'SEPARAD.DE FASE NSX100-250- 6UND     ', 'LV429329', '', 'UNI', '0', '49.64', '', 'MN', 'NO', 'SCHNEIDER'),
(674, '9425', 'INTERRUPTOR DIFERENCIAL ilDsi 4X25A 30mA    ', 'A9R91425', '', 'UNI', '0', '497.24', '', 'MN', 'NO', 'SCHNEIDER'),
(675, '9440', 'INTERRUPTOR DIFERENCIAL ilDsi 4X40A 30mA    ', 'A9R91440', '', 'UNI', '0', '537.63', '', 'MN', 'NO', 'SCHNEIDER'),
(676, '9450', 'BLOQ. DE CONTACT AUX. PARA NSX100/3200 AMP  ', '29450', '', 'UNI', '0', '161.04', '', 'MN', 'NO', 'SCHNEIDER'),
(677, '9451', 'ADAPTADOR SDE PARA TM,MA-NSX100-250AMP     ', 'LV429451', '', 'UNI', '0', '39.15', '', 'MN', 'NO', 'SCHNEIDER'),
(678, '9463', 'CONTACTOR 32 AMP 110VAC 1NA    ', '109463', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(679, '9465', 'CONTACTOR 32 AMP 220VAC 1NA    ', '109465', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(680, '9468', 'CONTACTOR 32 AMP 440VAC 1NA    ', '109468', '', 'UNI', '0', '274.5', '', 'MN', 'NO', 'G.E.'),
(681, '9582', 'CONTACTOR 50 AMP 110VAC 1NA+1NC    ', '109582', '', 'UNI', '0', '426.5', '', 'MN', 'NO', 'G.E.'),
(682, '9584', 'CONTACTOR 50 AMP 220VAC 1NA+1NC    ', '109584', '', 'UNI', '0', '426.5', '', 'MN', 'NO', 'G.E.'),
(683, '9587', 'CONTACTOR 50 AMP 440VAC 1NA+1NC    ', '109587', '', 'UNI', '0', '426.5', '', 'MN', 'NO', 'G.E.'),
(684, '9630', 'CONTACTOR 65 AMP 110VAC 1NA+1NC    ', '109630', '', 'UNI', '0', '504', '', 'MN', 'NO', 'G.E.'),
(685, '96303', 'INT. REGULABLE NSX100F 70-100 85KA/220V    ', 'LV429630', '', 'UNI', '0', '719.66', '', 'MN', 'NO', 'SCHNEIDER'),
(686, '9631', 'INT. REGULABLE NSX100F 56-80 85KA/220V    ', 'LV429631', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(687, '9632', 'CONTACTOR 65 AMP 220VAC 1NA+1NC    ', '109632', '', 'UNI', '0', '504', '', 'MN', 'NO', 'G.E.'),
(688, '96322', 'INT. REGULABLE NSX100F 44.1-63 85KA/220V    ', 'LV429632', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(689, '9633', 'INT. REGULABLE NSX100F 35-50 85KA/220V    ', 'LV429633', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(690, '9634', 'INT. REGULABLE NSX100F 28-40 85KA/220V    ', 'LV429634', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(691, '9635', 'CONTACTOR 65 AMP 440VAC 1NA+1NC    ', '109635', '', 'UNI', '0', '504', '', 'MN', 'NO', 'G.E.'),
(692, '96355', 'INT. REGULABLE NSX100F 22.4-32 85KA/220V    ', 'LV429635', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(693, '9636', 'INT. REGULABLE NSX100F 17.5-25 85KA/220V    ', 'LV429636', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(694, '9637', 'INT. REGULABLE NSX100F 11.2-16 85KA/220V    ', 'LV429637', '', 'UNI', '0', '726.71', '', 'MN', 'NO', 'SCHNEIDER'),
(695, '9670', 'INT REG. 70-100AMP 100KA/220V     ', 'LV429670', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(696, '9671', 'INT REG. 56-80AMP 100KA/220V     ', 'LV429671', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(697, '9672', 'INT REG. 44.1-63AMP 100KA/220V     ', 'LV429672', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(698, '9673', 'INT REG. 35-50AMP 100KA/220V     ', 'LV429673', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(699, '9675', 'INT REG. 22.4-32AMP 100KA/220V     ', 'LV429675', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(700, '9676', 'INT REG. 17.5-25AMP 100KA/220V     ', 'LV429676', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(701, '9677', 'INT REG. 11.2-16AMP 100KA/220V     ', 'LV429677', '', 'UNI', '0', '969.55', '', 'MN', 'NO', 'SCHNEIDER'),
(702, '9678', 'CONTACTOR 80 AMP 110VAC 1NA+1NC    ', '109678', '', 'UNI', '0', '614', '', 'MN', 'NO', 'G.E.'),
(703, '9680', 'CONTACTOR 80 AMP 220VAC 1NA+1NC    ', '109680', '', 'UNI', '0', '614', '', 'MN', 'NO', 'G.E.'),
(704, '9683', 'CONTACTOR 80 AMP 440VAC 1NA+1NC    ', '109683', '', 'UNI', '0', '614', '', 'MN', 'NO', 'G.E.'),
(705, '9726', 'CONTACTOR 95 AMP 110VAC 1NA+1NC    ', '109726', '', 'UNI', '0', '792', '', 'MN', 'NO', 'G.E.'),
(706, '9728', 'CONTACTOR 95 AMP 220VAC 1NA+1NC    ', '109728', '', 'UNI', '0', '792', '', 'MN', 'NO', 'G.E.'),
(707, '9731', 'CONTACTOR 95 AMP 440VAC 1NA+1NC    ', '109731', '', 'UNI', '0', '792', '', 'MN', 'NO', 'G.E.'),
(708, '9772', 'INT. REGULABLE NSX100F 16-40 85KA/220V    ', 'LV429770', '', 'UNI', '0', '980.59', '', 'MN', 'NO', 'SCHNEIDER'),
(709, '9774', 'CONTACTOR 105 AMP 110VAC 1NA+1NC    ', '109774', '', 'UNI', '0', '970', '', 'MN', 'NO', 'G.E.'),
(710, '9776', 'CONTACTOR 105 AMP 220VAC 1NA+1NC    ', '109776', '', 'UNI', '0', '970', '', 'MN', 'NO', 'G.E.'),
(711, '9779', 'CONTACTOR 105 AMP 440VAC 1NA+1NC    ', '109779', '', 'UNI', '0', '970', '', 'MN', 'NO', 'G.E.'),
(712, '9F84', 'INT. TIPO RIEL iC60H 3X50AMP 30KA-230VAC   ', 'A9F84350', '', 'UNI', '0', '264.9', '', 'MN', 'NO', 'SCHNEIDER'),
(713, '9F86', 'INT. TIPO RIEL iC60H 3X63AMP 30KA-230VAC   ', 'A9F84363', '', 'UNI', '0', '264.9', '', 'MN', 'NO', 'SCHNEIDER'),
(714, '9K25', 'INT. TIPO RIEL IK60N 2X50AMP 10KA-230VAC   ', 'A9K24250', '', 'UNI', '0', '74.8', '', 'MN', 'NO', 'SCHNEIDER'),
(715, 'A210', 'INT. TIPO RIEL iK60N 3X10AMP 10KA-230VAC   ', 'A9K24310', '', 'UNI', '0', '118.17', '', 'MN', 'NO', 'SCHNEIDER'),
(716, 'A316', 'INT. TIPO RIEL iK60N 3X16AMP 10KA-230VAC   ', 'A9K24316', '', 'UNI', '0', '117.86', '', 'MN', 'NO', 'SCHNEIDER'),
(717, 'A320', 'INT. TIPO RIEL iK60N 3X20AMP 10KA-230VAC   ', 'A9K24320', '', 'UNI', '0', '117.86', '', 'MN', 'NO', 'SCHNEIDER'),
(718, 'A325', 'INT. TIPO RIEL iK60N 3X25AMP 10KA-230VAC   ', 'A9K24325', '', 'UNI', '0', '117.86', '', 'MN', 'NO', 'SCHNEIDER'),
(719, 'A332', 'INT. TIPO RIEL IK60N 3X32AMP 10KA-230VAC   ', 'A9K24332', '', 'UNI', '0', '117.86', '', 'MN', 'NO', 'SCHNEIDER'),
(720, 'A340', 'INT. TIPO RIEL iK60N 3X40AMP 10KA-230VAC   ', 'A9K24340', '', 'UNI', '0', '127.57', '', 'MN', 'NO', 'SCHNEIDER'),
(721, 'A350', 'INT. TIPO RIEL IK60N 3X50AMP 10KA-230VAC   ', 'A9K24350', '', 'UNI', '0', '157.07', '', 'MN', 'NO', 'SCHNEIDER'),
(722, 'A363', 'INT. TIPO RIEL IK60N 3X63AMP 10KA-230VAC   ', 'A9K24363', '', 'UNI', '0', '168.11', '', 'MN', 'NO', 'SCHNEIDER'),
(723, 'A940321', 'LIMITADORES SOBRETENC. 3P iPRD40r 40kA    ', 'A9L40321', '', 'UNI', '0', '1256.33', '', 'MN', 'NO', 'SCHNEIDER'),
(724, 'A9L40102', 'CARTUCHO DE REPUESTO      ', 'A9L40102', '', 'UNI', '0 UNI', '256.35', '', 'MN', 'NO', 'SCHNEIDER'),
(725, 'A9L405', 'LIMITADORES SOBRETENC. 1P+N iPRD40 40kA    ', 'A9L40500', '', 'UNI', '0', '706.74', '', 'MN', 'NO', 'SCHNEIDER'),
(726, 'A9XP210', 'TAPA LATERAL PARA PEINE BIPOLAR-10PZAS    ', 'A9XPE210', '', 'UNI', '0', '9.9', '', 'MN', 'NO', 'SCHNEIDER'),
(727, 'A9XPH224', 'PEINE BIFÁSICO DE 24 POLOS    ', 'A9XPH224', '', 'UNI', '0 UNI', '50.58', '', 'MN', 'NO', 'SCHNEIDER'),
(728, 'BDC225', 'INT. DIFERENCIAL BDC225/030 2X25AMP 30MA    ', '607125', '', 'UNI', '0', '140', '', 'MN', 'NO', 'G.E.'),
(729, 'BDC240', 'INT. DIFERENCIAL BDC240/030 2X40AMP 30MA    ', '607126', '', 'UNI', '0', '155', '', 'MN', 'NO', 'G.E.'),
(730, 'BKB110', 'INT. TIPO RIEL 1X10A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '27.45', '', 'MN', 'NO', 'LS'),
(731, 'BKB116', 'INT. TIPO RIEL 1X16A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '27.45', '', 'MN', 'NO', 'LS'),
(732, 'BKB120', 'INT. TIPO RIEL 1X20A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '27.45', '', 'MN', 'NO', 'LS'),
(733, 'BKB125', 'INT. TIPO RIEL 1X25A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '27.45', '', 'MN', 'NO', 'LS'),
(734, 'BKB132', 'INT. TIPO RIEL 1X32A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '30.22', '', 'MN', 'NO', 'LS'),
(735, 'BKB140', 'INT. TIPO RIEL 1X40A 10KA/240VAC    ', 'BKN-B', '', 'UNI', '0', '40.02', '', 'MN', 'NO', 'LS'),
(736, 'BPA225', 'INT. DIFERENCIAL BPAI225/030 2X25AMP 30MA    ', '606331', '', 'UNI', '0', '282.5', '', 'MN', 'NO', 'G.E.'),
(737, 'BPA240', 'INT. DIFERENCIAL BPAI240/030 2X40AMP 30MA    ', '606332', '', 'UNI', '0', '293', '', 'MN', 'NO', 'G.E.'),
(738, 'BPA263', 'INT. DIFERENCIAL BPAI263/030 2X63AMP 30MA    ', '606333', '', 'UNI', '0', '398.5', '', 'MN', 'NO', 'G.E.'),
(739, 'BPA425', 'INT. DIFERENCIAL BPAI425/030 4X25AMP 30MA    ', '606334', '', 'UNI', '0', '441', '', 'MN', 'NO', 'G.E.'),
(740, 'BPA440', 'INT. DIFERENCIAL BPAI440/030 4X40AMP 30MA    ', '606335', '', 'UNI', '0', '478.5', '', 'MN', 'NO', 'G.E.'),
(741, 'BPA463', 'INT. DIFERENCIAL BPAI463/030 4X63AMP 30MA    ', '606336', '', 'UNI', '0', '663', '', 'MN', 'NO', 'G.E.'),
(742, 'BPC263', 'INT. DIFERENCIAL BPC263/030 2X63AMP 30MA    ', '606134', '', 'UNI', '0', '199', '', 'MN', 'NO', 'G.E.'),
(743, 'BPC425', 'INT. DIFERENCIAL BPC425/030 4X25AMP 30MA    ', '606208', '', 'UNI', '0', '255', '', 'MN', 'NO', 'G.E.'),
(744, 'BPC440', 'INT. DIFERENCIAL BPC440/030 4X40AMP 30MA    ', '606209', '', 'UNI', '0', '290', '', 'MN', 'NO', 'G.E.'),
(745, 'BPC463', 'INT. DIFERENCIAL BPC463/030 4X63AMP 30MA    ', '606210', '', 'UNI', '0', '320', '', 'MN', 'NO', 'G.E.'),
(746, 'C21100', 'INT. TIPO TOR. 2X100AMP 10KA-240VAC    ', 'THQC21100WL', '', 'UNI', '0', '187', '', 'MN', 'NO', 'G.E.'),
(747, 'C32100', 'INT. TIPO TOR. 3X100AMP 10KA-240VAC    ', 'THQC32100WL', '', 'UNI', '0', '255.5', '', 'MN', 'NO', 'G.E.'),
(748, 'CM04', 'CONECTOR PARA ALIMENTAR PEINE     ', 'A9XPCM04', '', 'UNI', '0', '42.54', '', 'MN', 'NO', 'SCHNEIDER'),
(749, 'E310', 'TAPA LATERAL PARA PEINE TRIPOLAR-10PZAS    ', 'A9XPE310', '', 'UNI', '0', '9.92', '', 'MN', 'NO', 'SCHNEIDER'),
(750, 'F840', 'INT. TIPO RIEL iC60H 3X20AMP 30KA-230VAC   ', 'A9F84320', '', 'UNI', '0', '230.53', '', 'MN', 'NO', 'SCHNEIDER'),
(751, 'F842', 'INT. TIPO RIEL iC60H 3X32AMP 30KA-230VAC   ', 'A9F84332', '', 'UNI', '0', '230.53', '', 'MN', 'NO', 'SCHNEIDER'),
(752, 'F843', 'INT. TIPO RIEL iC60H 3X40AMP 30KA-230VAC   ', 'A9F84340', '', 'UNI', '0', '264.9', '', 'MN', 'NO', 'SCHNEIDER'),
(753, 'F845', 'INT. TIPO RIEL iC60H 3X25AMP 30KA-230VAC   ', 'A9F84325', '', 'UNI', '0', '230.53', '', 'MN', 'NO', 'SCHNEIDER'),
(754, 'F846', 'INT. TIPO RIEL iC60H 3X16AMP 30KA-230VAC   ', 'A9F84316', '', 'UNI', '0', '230.53', '', 'MN', 'NO', 'SCHNEIDER'),
(755, 'G10102', 'INT. TIPO RIEL G100 1X2AMP 15KA-240VAC   ', '674856', '', 'UNI', '0', '50', '', 'MN', 'NO', 'G.E.'),
(756, 'G10104', 'INT. TIPO RIEL G100 1X4AMP 15KA-240VAC   ', '674858', '', 'UNI', '0', '40', '', 'MN', 'NO', 'G.E.'),
(757, 'G10106', 'INT. TIPO RIEL G100 1X6AMP 15KA-240VAC   ', '674859', '', 'UNI', '0', '40', '', 'MN', 'NO', 'G.E.'),
(758, 'G10110', 'INT. TIPO RIEL G100 1X10AMP 15KA-240VAC   ', '674861', '', 'UNI', '0', '37', '', 'MN', 'NO', 'G.E.'),
(759, 'G10116', 'INT. TIPO RIEL G100 1X16AMP 15KA-240VAC   ', '674863', '', 'UNI', '0', '37', '', 'MN', 'NO', 'G.E.'),
(760, 'G10120', 'INT. TIPO RIEL G100 1X20AMP 15KA-240VAC   ', '674864', '', 'UNI', '0', '37', '', 'MN', 'NO', 'G.E.'),
(761, 'G10125', 'INT. TIPO RIEL G100 1X25AMP 15KA-240VAC   ', '674865', '', 'UNI', '0', '37', '', 'MN', 'NO', 'G.E.'),
(762, 'G10132', 'INT. TIPO RIEL G100 1X32AMP 15KA-240VAC   ', '674866', '', 'UNI', '0', '40', '', 'MN', 'NO', 'G.E.'),
(763, 'G10140', 'INT. TIPO RIEL G100 1X40AMP 15KA-240VAC   ', '674867', '', 'UNI', '0', '58', '', 'MN', 'NO', 'G.E.'),
(764, 'G10150', 'INT. TIPO RIEL G100 1X50AMP 15KA-240VAC   ', '674868', '', 'UNI', '0', '58', '', 'MN', 'NO', 'G.E.'),
(765, 'G10163', 'INT. TIPO RIEL G100 1X63AMP 15KA-240VAC   ', '674869', '', 'UNI', '0', '58', '', 'MN', 'NO', 'G.E.'),
(766, 'G10206', 'INT. TIPO RIEL G100 2X6AMP 15KA-240VAC   ', '674891', '', 'UNI', '0', '82.5', '', 'MN', 'NO', 'G.E.'),
(767, 'G10210', 'INT. TIPO RIEL G100 2X10AMP 15KA-240VAC   ', '674893', '', 'UNI', '0', '70', '', 'MN', 'NO', 'G.E.'),
(768, 'G10216', 'INT. TIPO RIEL G100 2X16AMP 15KA-240VAC   ', '674895', '', 'UNI', '0', '70', '', 'MN', 'NO', 'G.E.'),
(769, 'G10220', 'INT. TIPO RIEL G100 2X20AMP 15KA-240VAC   ', '674896', '', 'UNI', '0', '70', '', 'MN', 'NO', 'G.E.'),
(770, 'G10225', 'INT. TIPO RIEL G100 2X25AMP 15KA-240VAC   ', '674897', '', 'UNI', '0', '70', '', 'MN', 'NO', 'G.E.'),
(771, 'G10232', 'INT. TIPO RIEL G100 2X32AMP 15KA-240VAC   ', '674898', '', 'UNI', '0', '70', '', 'MN', 'NO', 'G.E.'),
(772, 'G10240', 'INT. TIPO RIEL G100 2X40AMP 15KA-240VAC   ', '674899', '', 'UNI', '0', '91.5', '', 'MN', 'NO', 'G.E.'),
(773, 'G10250', 'INT. TIPO RIEL G100 2X50AMP 15KA-240VAC   ', '674900', '', 'UNI', '0', '94', '', 'MN', 'NO', 'G.E.'),
(774, 'G10263', 'INT. TIPO RIEL G100 2X63AMP 15KA-240VAC   ', '674901', '', 'UNI', '0', '94', '', 'MN', 'NO', 'G.E.'),
(775, 'G10306', 'INT. TIPO RIEL G100 3X6AMP 15KA-240VAC   ', '674907', '', 'UNI', '0', '143', '', 'MN', 'NO', 'G.E.'),
(776, 'G10310', 'INT. TIPO RIEL G100 3X10AMP 15KA-240VAC   ', '674909', '', 'UNI', '0', '134.5', '', 'MN', 'NO', 'G.E.'),
(777, 'G10316', 'INT. TIPO RIEL G100 3X16AMP 15KA-240VAC   ', '674911', '', 'UNI', '0', '134.5', '', 'MN', 'NO', 'G.E.'),
(778, 'G10320', 'INT. TIPO RIEL G100 3X20AMP 15KA-240VAC   ', '674912', '', 'UNI', '0', '134.5', '', 'MN', 'NO', 'G.E.'),
(779, 'G10325', 'INT. TIPO RIEL G100 3X25AMP 15KA-240VAC   ', '674913', '', 'UNI', '0', '134.5', '', 'MN', 'NO', 'G.E.'),
(780, 'G10332', 'INT. TIPO RIEL G100 3X32AMP 30KA-240VAC   ', '674914', '', 'UNI', '0', '134.5', '', 'MN', 'NO', 'G.E.'),
(781, 'G10340', 'INT. TIPO RIEL G100 3X40AMP 15KA-240VAC   ', '674915', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(782, 'G10363', 'INT. TIPO RIEL G100 3X63AMP 15KA-240VAC   ', '674917', '', 'UNI', '0', '167.5', '', 'MN', 'NO', 'G.E.'),
(783, 'G31020', 'INT. TIPO RIEL G60 3X10AMP 20KA/240VAC   ', '674651', '', 'UNI', '0', '112', '', 'MN', 'NO', 'G.E.'),
(784, 'G31620', 'INT. TIPO RIEL G60 3X16AMP 20KA/240VAC   ', '674653', '', 'UNI', '0', '112', '', 'MN', 'NO', 'G.E.'),
(785, 'G32020', 'INT. TIPO RIEL G60 3X20AMP 20KA/240VAC   ', '674654', '', 'UNI', '0', '112', '', 'MN', 'NO', 'G.E.'),
(786, 'G32520', 'INT. TIPO RIEL G60 3X25AMP 20KA/240VAC   ', '674655', '', 'UNI', '0', '112', '', 'MN', 'NO', 'G.E.'),
(787, 'G33220', 'INT. TIPO RIEL G60 3X32AMP 20KA/240VAC   ', '674656', '', 'UNI', '0', '112', '', 'MN', 'NO', 'G.E.'),
(788, 'G34020', 'INT. TIPO RIEL G60 3X40AMP 20KA/240VAC   ', '674657', '', 'UNI', '0', '126.5', '', 'MN', 'NO', 'G.E.'),
(789, 'G35020', 'INT. TIPO RIEL G60 3X50AMP 20KA/240VAC   ', '674658', '', 'UNI', '0', '126.5', '', 'MN', 'NO', 'G.E.'),
(790, 'G36320', 'INT. TIPO RIEL G60 3X63AMP 20KA/240VAC   ', '674659', '', 'UNI', '0', '126.5', '', 'MN', 'NO', 'G.E.'),
(791, 'G61010', 'INT. TIPO RIEL G60 1X10AMP 10KA-240VAC   ', '674603', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(792, 'G61020', 'INT. TIPO RIEL G60 2X10AMP 20KA/240VAC   ', '674635', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(793, 'G61210', 'INT. TIPO RIEL G60 1X2AMP 10KA-240VAC   ', '674598', '', 'UNI', '0', '43', '', 'MN', 'NO', 'G.E.'),
(794, 'G61410', 'INT. TIPO RIEL G60 1X4AMP 10KA-240VAC   ', '674600', '', 'UNI', '0', '43', '', 'MN', 'NO', 'G.E.'),
(795, 'G61610', 'INT. TIPO RIEL G60 1X6AMP 10KA-240VAC   ', '674601', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(796, 'G61620', 'INT. TIPO RIEL G60 2X16AMP 20KA/240VAC   ', '674637', '', 'UNI', '0', '48.5', '', 'MN', 'NO', 'G.E.'),
(797, 'G62010', 'INT. TIPO RIEL G60 1X20AMP 10KA-240VAC   ', '674606', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(798, 'G62020', 'INT. TIPO RIEL G60 2X20AMP 20KA/240VAC   ', '674638', '', 'UNI', '0', '48.5', '', 'MN', 'NO', 'G.E.'),
(799, 'G62510', 'INT. TIPO RIEL G60 1X25AMP 10KA-240VAC   ', '674607', '', 'UNI', '0', '34', '', 'MN', 'NO', 'G.E.'),
(800, 'G62520', 'INT. TIPO RIEL G60 2X25AMP 20KA/240VAC   ', '674639', '', 'UNI', '0', '48.5', '', 'MN', 'NO', 'G.E.'),
(801, 'G62620', 'INT. TIPO RIEL G60 2X6AMP 20KA/240VAC   ', '674633', '', 'UNI', '0', '62', '', 'MN', 'NO', 'G.E.'),
(802, 'G63220', 'INT. TIPO RIEL G60 2X32AMP 20KA/240VAC   ', '674640', '', 'UNI', '0', '48.5', '', 'MN', 'NO', 'G.E.'),
(803, 'G63620', 'INT. TIPO RIEL G60 3X6AMP 20KA/240VAC   ', '674649', '', 'UNI', '0', '119', '', 'MN', 'NO', 'G.E.'),
(804, 'G64010', 'INT. TIPO RIEL G60 1X40AMP 10KA-240VAC   ', '674609', '', 'UNI', '0', '53', '', 'MN', 'NO', 'G.E.'),
(805, 'G64020', 'INT. TIPO RIEL G60 2X40AMP 20KA/240VAC   ', '674641', '', 'UNI', '0', '65.5', '', 'MN', 'NO', 'G.E.'),
(806, 'G65010', 'INT. TIPO RIEL G60 1X50AMP 10KA-240VAC   ', '674610', '', 'UNI', '0', '53', '', 'MN', 'NO', 'G.E.'),
(807, 'G65020', 'INT. TIPO RIEL G60 2X50AMP 20KA/240VAC   ', '674642', '', 'UNI', '0', '65.5', '', 'MN', 'NO', 'G.E.'),
(808, 'G66310', 'INT. TIPO RIEL G60 1X63AMP 10KA-240VAC   ', '674611', '', 'UNI', '0', '53', '', 'MN', 'NO', 'G.E.'),
(809, 'G66320', 'INT. TIPO RIEL G60 2X63AMP 20KA/240VAC   ', '674643', '', 'UNI', '0', '65.5', '', 'MN', 'NO', 'G.E.'),
(810, 'H212', 'PEINE BIFASICO DE 12 POLOS    ', 'A9XPH212', '', 'UNI', '0', '24.4', '', 'MN', 'NO', 'SCHNEIDER'),
(811, 'H312', 'PEINE TRIFASICO DE 12 POLOS    ', 'A9XPH312', '', 'UNI', '0', '29.91', '', 'MN', 'NO', 'SCHNEIDER'),
(812, 'H324', 'PEINE TRIFASICO DE 24 POLOS    ', 'A9XPH324', '', 'UNI', '0', '62.82', '', 'MN', 'NO', 'SCHNEIDER'),
(813, 'H3M2', 'INT REG. 640-1600AMP 70KA/220V     ', 'ZP0NS16H3M20FIEM7', '', 'UNI', '0', '22433.33', '', 'MN', 'NO', 'SCHNEIDER'),
(814, 'K240', 'INT. TIPO RIEL IK60N 2X40AMP 10KA-230VAC   ', 'A9K24240', '', 'UNI', '0', '66.19', '', 'MN', 'NO', 'SCHNEIDER'),
(815, 'K242', 'INT. TIPO RIEL IK60N 2X20AMP 10KA-230VAC   ', 'A9K24220', '', 'UNI', '0', '48.93', '', 'MN', 'NO', 'SCHNEIDER'),
(816, 'K243', 'INT. TIPO RIEL IK60N 2X32AMP 10KA-230VAC   ', 'A9K24232', '', 'UNI', '0', '54.28', '', 'MN', 'NO', 'SCHNEIDER'),
(817, 'K245', 'INT. TIPO RIEL IK60N 2X25AMP 10KA-230VAC   ', 'A9K24225', '', 'UNI', '0', '48.93', '', 'MN', 'NO', 'SCHNEIDER'),
(818, 'K246', 'INT. TIPO RIEL IK60N 2X16AMP 10KA-230VAC   ', 'A9K24216', '', 'UNI', '0', '48.93', '', 'MN', 'NO', 'SCHNEIDER'),
(819, 'K263', 'INT. TIPO RIEL IK60N 2X63AMP 10KA-230VAC   ', 'A9K24263', '', 'UNI', '0', '89.57', '', 'MN', 'NO', 'SCHNEIDER'),
(820, 'KG', 'INT. TIPO RIEL KG62C63 2X63AMP 10KA-240VAC   ', '678944', '', 'UNI', '0', '54', '', 'MN', 'NO', 'G.E.'),
(821, 'KG63C40', 'INT. TIPO RIEL KG63C40 3X40AMP 10KA-240VAC   ', '678951', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(822, 'L40100', 'LIMITADORES SOBRETENC. 1P iPRD40 40kA    ', 'A9L40100', '', 'UNI', '0', '322.21', '', 'MN', 'NO', 'SCHNEIDER'),
(823, 'LSAU42', 'CONTACTO AUXILIAR FRONTAL 2NA+2NC     ', 'AU-4', '', 'UNI', '0', '54.23', '', 'MN', 'NO', 'LS'),
(824, 'LSMMS13', 'GUARDAMOMOTOR 100KA DE 41518 AMP.    ', 'MMS-32S-13', '', 'UNI', '0', '173.04', '', 'MN', 'NO', 'LS'),
(825, 'LV429772', 'INT REGULABLE 16-40 AMP 85KA/220V    ', 'LV429772', '', 'UNI', '0 UNI', '980.59', '', 'MN', 'NO', 'SCHNEIDER'),
(826, 'LV430770', 'INT REGULABLE 64-160 AMP 85KA/220V    ', 'LV430770', '', 'UNI', '0', '1267.03', '', 'MN', 'NO', 'SCHNEIDER'),
(827, 'LV431770', 'INT REGULABLE 100-250 AMP 85KA/220V    ', 'LV431770', '', 'UNI', '0 UNI', '1627.52', '', 'MN', 'NO', 'SCHNEIDER'),
(828, 'NS08', 'INT REG. 320-800AMP 50KA/220V     ', 'ZP0NS08N3M20FIEM7', '', 'UNI', '0', '11226.6', '', 'MN', 'NO', 'SCHNEIDER'),
(829, 'NS10', 'INT REG. 400-1000AMP 50KA/220V     ', 'ZP0NS10N3M20FIEM7', '', 'UNI', '0', '12578.29', '', 'MN', 'NO', 'SCHNEIDER'),
(830, 'NS12', 'INT REG.500-1250AMP 50KA/220V      ', 'ZP0NS12N3M20FIEM7', '', 'UNI', '0', '14897.99', '', 'MN', 'NO', 'SCHNEIDER'),
(831, 'R240', 'INTERRUPTOR DIFERENCIAL 2X40AMP 300mA     ', 'A9R74240', '', 'UNI', '0', '221.28', '', 'MN', 'NO', 'SCHNEIDER'),
(832, 'S20H', 'INT REG. 800-2000AMP 125KA/220V     ', 'ZP0NS20H320FIM', '', 'UNI', '0', '20350.75', '', 'MN', 'NO', 'SCHNEIDER'),
(833, 'S25H', 'INT REG. 1000-2500AMP 125KA/220V     ', 'ZP0NS25H320FIM', '', 'UNI', '0', '25409.76', '', 'MN', 'NO', 'SCHNEIDER'),
(834, 'S32H', 'INT REG. 1280-3200AMP 125KA/220V     ', 'ZP0NS32H320FIM', '', 'UNI', '0', '29080.7', '', 'MN', 'NO', 'SCHNEIDER'),
(835, 'T920', 'CUBRE DIENTES DE PEINE - 20PZAS   ', 'A9XPT920', '', 'UNI', '0', '41.38', '', 'MN', 'NO', 'SCHNEIDER'),
(836, 'THC215', 'INT. TIPO TOR. 2X15AMP 10KA-240VAC    ', 'THQC2115WL', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(837, 'THC220', 'INT. TIPO TOR. 2X20AMP 10KA-240VAC    ', 'THQC2120WL', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(838, 'THC230', 'INT. TIPO TOR. 2X30AMP 10KA-240VAC    ', 'THQC2130WL', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(839, 'THC240', 'INT. TIPO TOR. 2X40AMP 10KA-240VAC    ', 'THQC2140WL', '', 'UNI', '0', '77', '', 'MN', 'NO', 'G.E.');
INSERT INTO `productos` (`idproducto`, `codigo`, `nombre`, `descripcion`, `imagen`, `um`, `presentacion`, `precio`, `descuento`, `moneda`, `igv`, `marca`) VALUES
(840, 'THC250', 'INT. TIPO TOR. 2X50AMP 10KA-240VAC    ', 'THQC2150WL', '', 'UNI', '0', '77', '', 'MN', 'NO', 'G.E.'),
(841, 'THC260', 'INT. TIPO TOR. 2X60AMP 10KA-240VAC    ', 'THQC2160WL', '', 'UNI', '0', '77', '', 'MN', 'NO', 'G.E.'),
(842, 'THC270', 'INT. TIPO TOR. 2X70AMP 10KA-240VAC    ', 'THQC2170WL', '', 'UNI', '0', '139', '', 'MN', 'NO', 'G.E.'),
(843, 'THC315', 'INT. TIPO TOR. 3X15AMP 10KA-240VAC    ', 'THQC32015WL', '', 'UNI', '0', '199', '', 'MN', 'NO', 'G.E.'),
(844, 'THC320', 'INT. TIPO TOR. 3X20AMP 10KA-240VAC    ', 'THQC32020WL', '', 'UNI', '0', '199', '', 'MN', 'NO', 'G.E.'),
(845, 'THC330', 'INT. TIPO TOR. 3X30AMP 10KA-240VAC    ', 'THQC32030WL', '', 'UNI', '0', '184', '', 'MN', 'NO', 'G.E.'),
(846, 'THC340', 'INT. TIPO TOR. 3X40AMP 10KA-240VAC    ', 'THQC32040WL', '', 'UNI', '0', '184', '', 'MN', 'NO', 'G.E.'),
(847, 'THC350', 'INT. TIPO TOR. 3X50AMP 10KA-240VAC    ', 'THQC32050WL', '', 'UNI', '0', '184', '', 'MN', 'NO', 'G.E.'),
(848, 'THC360', 'INT. TIPO TOR. 3X60AMP 10KA-240VAC    ', 'THQC32060WL', '', 'UNI', '0', '184', '', 'MN', 'NO', 'G.E.'),
(849, 'THC370', 'INT. TIPO TOR. 3X70AMP 10KA-240VAC    ', 'THQC32070WL', '', 'UNI', '0', '200.5', '', 'MN', 'NO', 'G.E.'),
(850, 'THL215', 'INT. TIPO ENG. 2X15AMP 10KA-240VAC    ', 'THQL2115', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(851, 'THL220', 'INT. TIPO ENG. 2X20AMP 10KA-240VAC    ', 'THQL2120', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(852, 'THL230', 'INT. TIPO ENG. 2X30AMP 10KA-240VAC    ', 'THQL2130', '', 'UNI', '0', '56', '', 'MN', 'NO', 'G.E.'),
(853, 'THL240', 'INT. TIPO ENG. 2X40AMP 10KA-240VAC    ', 'THQL2140', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(854, 'THL250', 'INT. TIPO ENG. 2X50AMP 10KA-240VAC    ', 'THQL2150', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(855, 'THL260', 'INT. TIPO ENG. 2X60AMP 10KA-240VAC    ', 'THQL2160', '', 'UNI', '0', '73', '', 'MN', 'NO', 'G.E.'),
(856, 'THL270', 'INT. TIPO ENG. 2X70AMP 10KA-240VAC    ', 'THQL2170', '', 'UNI', '0', '121', '', 'MN', 'NO', 'G.E.'),
(857, 'THL280', 'INT. TIPO ENG. 2X100AMP 10KA-240VAC    ', 'THQL2100', '', 'UNI', '0', '165.5', '', 'MN', 'NO', 'G.E.'),
(858, 'THL315', 'INT. TIPO ENG. 3X15AMP 10KA-240VAC    ', 'THQL32015', '', 'UNI', '0', '162', '', 'MN', 'NO', 'G.E.'),
(859, 'THL320', 'INT. TIPO ENG. 3X20AMP 10KA-240VAC    ', 'THQL32020', '', 'UNI', '0', '162', '', 'MN', 'NO', 'G.E.'),
(860, 'THL330', 'INT. TIPO ENG. 3X30AMP 10KA-240VAC    ', 'THQL32030', '', 'UNI', '0', '149.5', '', 'MN', 'NO', 'G.E.'),
(861, 'THL340', 'INT. TIPO ENG. 3X40AMP 10KA-240VAC    ', 'THQL32040', '', 'UNI', '0', '149.5', '', 'MN', 'NO', 'G.E.'),
(862, 'THL350', 'INT. TIPO ENG. 3X50AMP 10KA-240VAC    ', 'THQL32050', '', 'UNI', '0', '149.5', '', 'MN', 'NO', 'G.E.'),
(863, 'THL360', 'INT. TIPO ENG. 3X60AMP 10KA-240VAC    ', 'THQL32060', '', 'UNI', '0', '149.5', '', 'MN', 'NO', 'G.E.'),
(864, 'THL370', 'INT. TIPO ENG. 3X70AMP 10KA-240VAC    ', 'THQL32070', '', 'UNI', '0', '175.5', '', 'MN', 'NO', 'G.E.'),
(865, 'THL380', 'INT. TIPO ENG. 3X100AMP 10KA-240VAC    ', 'THQL32100', '', 'BL', '0', '206.5', '', 'MN', 'NO', 'G.E.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `tipo` int(15) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` text NOT NULL,
  `documento` bigint(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `premium` varchar(10) DEFAULT NULL,
  `estado` int(2) DEFAULT NULL,
  `change_password` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombres`, `apellidos`, `tipo`, `correo`, `password`, `documento`, `telefono`, `premium`, `estado`, `change_password`) VALUES
(1, 'A & B BEST COMPANY S.A.C', '-', 1, 'frodriguez@bestcompanysac.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20492416747, '988 802 631', 'no', 1, 'no'),
(2, 'A.E.I. AUTOMATIZACION E.I.R.L.', '-', 1, 'administracion@arminasgroup.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20543525651, '0', 'no', 1, 'no'),
(3, 'ACM MANTENIMIENTO INDUSTRIAL S.A.C.', '-', 1, 'vcastro@acm-mi.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20451714857, '947021704', 'no', 1, 'no'),
(4, 'ADVANCE ASOCIADOS S.R.L.', '-', 1, 'elena.huaripaucar@advance-asoc.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20508302097, '017193720 ', 'no', 1, 'no'),
(5, 'AMAZING COMBUSTIBLES Y GAS S.A.C.', '-', 1, 'acyg.supervision@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20515610741, '933293845', 'no', 1, 'no'),
(6, 'AQ MULTISERVICIOS Y SOLUCIONES ELECTRICAS S.A.C.', '-', 1, 'cotizacion@aqmyse.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20602902383, '949190586', 'no', 1, 'no'),
(7, 'B Y F POWER S.A.', '-', 1, 'jlopez@byfpowersa.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20332273532, '0', 'no', 1, 'no'),
(8, 'BIG COM S.A.C.', '-', 1, 'wrodriguez@branchperu.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600944909, '0', 'no', 1, 'no'),
(9, 'BYS ENERGY E.I.R.L.', '-', 1, 'Ivan.bellido@bysenergy.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601362156, '0', 'no', 1, 'no'),
(10, 'C & C INSTALACIONES SOCIEDAD ANONIMA CERRADA', '-', 1, 'ecaillauxs@cycingenieros.net', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20549064559, '0', 'no', 1, 'no'),
(11, 'CAILLAUX Y CAILLAUX INGENIEROS SRL', '-', 1, 'administracion@cycingenieros.net', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20341778051, '0', 'no', 1, 'no'),
(12, 'CATRI PERU S.A.C.', '-', 1, 'compras@catriperu.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20556766151, '970 785 349', 'no', 1, 'no'),
(13, 'CIEZA TELLO MARIA JACKELY', '-', 1, 'jaciete12@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10704987418, '0', 'no', 1, 'no'),
(14, 'COINSA INGENIEROS S.A.C.', '-', 1, 'orlando.soto@coinsa-sac.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20478124296, '0', 'no', 1, 'no'),
(15, 'CORPORACION DE NEGOCIOS DAFESA S.A.C.', '-', 1, 'dafesasac@outlook.es', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20524427967, '0', 'no', 1, 'no'),
(16, 'COTABELEC S.A.C.', '-', 1, 'cotabelec@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20516390221, '0', 'no', 1, 'no'),
(17, 'CRISTHIAN MANUEL', 'DELGADO TIRADO ', 1, 'manuel_0519@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10451527563, '0', 'no', 1, 'no'),
(18, 'DIMTELEK S.A.C.', '-', 1, 'freygospel2@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20603772491, '997254554', 'no', 1, 'no'),
(19, 'DLC INGENIEROS PROYECTOS Y CONSTRUCCION S.A.C', '-', 1, 'miguel.delacruz@dlcsac.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601858399, '0', 'no', 1, 'no'),
(20, 'E & F TECNOLOGIA COMERCIAL S.A.C.', '-', 1, 'eyftecnologiacomercial@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20604046034, '945139625', 'no', 1, 'no'),
(21, 'EDCOM SOLUTIONS S.R.L.', '-', 1, 'proyectos@edcomsolutions.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20491978881, '956 732 580', 'no', 1, 'no'),
(22, 'ELECTRIC SISTEMAS S.A.C.', '-', 1, 'cpantoja01@yahoo.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20549335412, '981538500', 'no', 1, 'no'),
(23, 'ELECTRO COMERCIAL TORRES HNOS S.A.C.', '-', 1, 'Mauricio25_2017@outlook.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600347587, '0', 'no', 1, 'no'),
(24, 'ELECTROMETRIA E.I.R.L.', '-', 1, 'electrometria_peru@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20545461570, '991184300', 'no', 1, 'no'),
(25, 'ELENGY SAC', '-', 1, 'cristian.reategui@elengy.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601651255, '991296998', 'no', 1, 'no'),
(26, 'OSCAR JOEL', 'FARFAN SUAREZ ', 1, 'ofasu1@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 44842037, '994513958', 'no', 1, 'no'),
(27, 'GEDIZA E.I.R.L.', '-', 1, 'administracion@gediza.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20434094926, '0', 'no', 1, 'no'),
(28, 'GEMMSA E.I.R.L.', '-', 1, 'gemmsa.eirl@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20548983399, '0', 'no', 1, 'no'),
(29, 'GENTIXS S.A.C.', '-', 1, 'contabilidad2@gentixs.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20517620450, '998192049', 'no', 1, 'no'),
(30, 'GLOBALTEC S.A.C.', '-', 1, 'kmartinez@globaltec.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20341257167, '0', 'no', 1, 'no'),
(31, 'GRUCOIN S.A.C.', '-', 1, 'pcosta@gci.net.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20546349781, '0', 'no', 1, 'no'),
(32, 'H & M SIELEC S.A.C', '-', 1, 'hymsielec@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600545923, '966527222', 'no', 1, 'no'),
(33, 'H&L ASOCIADOS S.R.L.', '-', 1, 'ivanleon@hilasociadossrl.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600175263, '955640565', 'no', 1, 'no'),
(34, 'HECTANA MANUFACTURAS ELECTRICAS S.A.C.', '-', 1, 'hectanasac@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20549459227, '933906583', 'no', 1, 'no'),
(35, 'HLN DESARROLLO E INGENIERIA DE PROYECTOS S.A.C.', '-', 1, 'hlnproyectossac@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601235448, '986693665', 'no', 1, 'no'),
(36, 'HP & T ELECTRIC S.A.C.', '-', 1, 'logistica@hpytelectric.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20521974495, '936 805 838', 'no', 1, 'no'),
(37, 'ILUMINACIONES DEL CENTRO S.A.C.', '-', 1, 'iluminadelcentro@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20429978549, '0', 'no', 1, 'no'),
(38, 'IMD INDUSTRIAL SAC', '-', 1, 'gerencia@imdindustrial.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20543071103, '998272870', 'no', 1, 'no'),
(39, 'INELEK S.A.C', '-', 1, 'administracion@inelek.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20493071794, '927081972', 'no', 1, 'no'),
(40, 'INELEK S.A.C. TABLEROS ELECTRICOS', '-', 1, 'dcontreras@inelek.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20514908860, '927081972', 'no', 1, 'no'),
(41, 'INTELSA E.I.R.L.', '-', 1, 'intelsaeirl08@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20450157008, '0', 'no', 1, 'no'),
(42, 'INTSEN S.A.C.', '-', 1, 'ccorzo@intsensac.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20537451484, '949091021', 'no', 1, 'no'),
(43, 'INVERSIONES ARTIKA S.A.C.', '-', 1, 'tony_wisnar@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20544985788, '973288570', 'no', 1, 'no'),
(44, 'INVERSIONES VINEY S.A.C.', '-', 1, 'inv.vineyventas@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20603054645, '975009559', 'no', 1, 'no'),
(45, 'INVESUX SRL', '-', 1, 'cpe@invesux.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20502132343, '0', 'no', 1, 'no'),
(46, 'ITE INGENIERIA Y TECNOLOGIA S.A.C.', '-', 1, 'administracion@iteingenieria.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20511794391, '993742069', 'no', 1, 'no'),
(47, 'ITESA ELECTRIC PERU S.A.C.', '-', 1, 'contactenos.itesa@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601647461, '965220510', 'no', 1, 'no'),
(48, 'JVG ENERGIA ALTERNATIVA S.A.C.', '-', 1, 'rpalacios@jvg.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20602913571, '0', 'no', 1, 'no'),
(49, 'KAPEK INTERNACIONAL S.A.C', '-', 1, 'contabilidad@kapekinternacional.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20509654141, '0', 'no', 1, 'no'),
(50, 'KRAMHE .E.I.R.L', '-', 1, 'ccjuansc@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20523268695, '997035309', 'no', 1, 'no'),
(51, 'LISMER CORP S.R.L.', '-', 1, 'lismercorp1@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20515100891, '994063370', 'no', 1, 'no'),
(52, 'LUMAR INGENIERIA Y SOLUCIONES ELECTROMECANICAS S.A', '-', 1, 'jalarcon@lumar.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601140323, '971 883 969', 'no', 1, 'no'),
(53, 'M.V. CAL CONSTRUCCIONES S.A.C.', '-', 1, 'maximocal_7@yahoo.es', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20538258777, '981166063', 'no', 1, 'no'),
(54, 'MASHIGOTO CONTRATISTAS GENERALES S.R.L.', '-', 1, 'kvargas@mashigoto.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20509465763, '996599573', 'no', 1, 'no'),
(55, 'MECOMGAS INGENIEROS S.A.C.', '-', 1, 'hectorrodolfo1987@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20551050140, '987400422', 'no', 1, 'no'),
(56, 'MQLAY S.A.C.', '-', 1, 'proyectos1@grupolay.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20566381053, '0', 'no', 1, 'no'),
(57, 'MULTISERVICIOS BALDARRAGO S.A.C.', '-', 1, 'proyectos@mbsac.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20522116115, '993937014', 'no', 1, 'no'),
(58, 'OP SERVICE S.A.C.', '-', 1, 'contabilidad@opservicesac.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600666666, '0', 'no', 1, 'no'),
(59, 'PRE FABRICASAS PALOMINO S.A.C.', '-', 1, 'contabilidad@prefap.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20507667725, '0', 'no', 1, 'no'),
(60, 'PREMIER ELECTRIC SRL', '-', 1, 'ventas@premierelectric.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20516551764, '939509778', 'no', 1, 'no'),
(61, 'PROINDELEC S.A.C.', '-', 1, 'jmilla77@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600816790, '941459885', 'no', 1, 'no'),
(62, 'PROVEEDORES ELECTRICOS G & R S.A.C.', '-', 1, 'rocio.espinoza@provelec.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20600312830, '0', 'no', 1, 'no'),
(63, 'R & C SOLUTION ELECTRIC EIRL', '-', 1, 'ventas.solutionelectric@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20602849121, '980618801', 'no', 1, 'no'),
(64, 'R Y M ENERGIA & AUTOMATIZACION S.A.C.', '-', 1, 'rym.energia.automatizacion@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20602513310, '921936257', 'no', 1, 'no'),
(65, 'READY ENERGY DEL PERU S.A.C.', '-', 1, 'ventas@ready-energy.net', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20512464549, '987551810', 'no', 1, 'no'),
(66, 'EDWIN MICAEL', 'RUIZ HUAMAN', 1, 'fullventas_ruiz@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10802542149, '965891516', 'no', 1, 'no'),
(67, 'S Y Z COMINSA SRLTDA', '-', 1, 'compras@syzcominsa.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20141151968, '998182136', 'no', 1, 'no'),
(68, 'SERVICIOS GENERALES PROYECTOS Y CONSTRUCCION S.A.C', '-', 1, 'bazanvicente@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20539791908, '942878295', 'no', 1, 'no'),
(69, 'SODEXO PERU S.A.C.', '-', 1, 'Rmarcelo@ bcp.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20414766308, '966366995', 'no', 1, 'no'),
(70, 'SOLUCION ELECTRICA KAREN S.A.C.', '-', 1, 'solucionelectricakaren@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20547805918, '0', 'no', 1, 'no'),
(71, 'SONEPAR PERU S.A.C.', '-', 1, 'danny.amaya@dirome.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20111740438, '949700083', 'no', 1, 'no'),
(72, 'NILTON CESAR', 'SOTO CALQUISTO', 1, 'niltonsoto73@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10074902427, '976524501', 'no', 1, 'no'),
(73, 'NORMAN ALDO', 'SUAREZ LOZA ', 1, 'jacko2012@live.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 9293807, '997279743', 'no', 1, 'no'),
(74, 'SUJETAR DEL PERU SAC', '-', 1, 'kremigio@sujetar.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20543255841, '017173064 ', 'no', 1, 'no'),
(75, 'T.J. CASTRO S.A.C.', '-', 1, 'rosauribe@tjcastro.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20100292956, '994264071', 'no', 1, 'no'),
(76, 'TELECOMUNICACIONES ENERGIA Y CONSTRUCCION E.I.R.L.', '-', 1, 'william.otero@telenco.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20496074077, '976362951', 'no', 1, 'no'),
(77, 'TESLA AUTOMATION S.A.C', '-', 1, 'jgodoy@tesla-aut.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20601968542, '993962329', 'no', 1, 'no'),
(78, 'T-ILUMINA PERU S.A.C.', '-', 1, 'josmarymoreno18@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20563647737, '955373471', 'no', 1, 'no'),
(79, 'ALEXANDER ', 'TONDER CAHUAZA ', 1, 'tonderz33@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10416342585, '0', 'no', 1, 'no'),
(80, 'MARIA ANTONIETA', 'TORRES CANCHARI ', 1, 'inver-mafer2@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10454088561, '0', 'no', 1, 'no'),
(81, 'TRANSFORMACION DE METALES NO FERROSOS S.A.C', '-', 1, 'tramfersac@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20543474054, '998250859', 'no', 1, 'no'),
(82, 'TRITON TRADING S.A.', '-', 1, 'fact_electronica@triton.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20535936669, '0', 'no', 1, 'no'),
(83, ' ROGER EDWIN', 'VASQUEZ DAVILA', 1, 'roglizelctric@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10167951231, '987237373', 'no', 1, 'no'),
(84, ' VICTOR OSWALDO', 'VASQUEZ DAVILA', 1, 'invercotrina@hotmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10075096491, '993819602', 'no', 1, 'no'),
(85, 'VELTEK COMPANY S.A.C.', '-', 1, 'veltekcompany@yahoo.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20552055820, '993064795', 'no', 1, 'no'),
(86, 'VENTO NEYRA ALFREDO ', '-', 1, 'caventone@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 10091371494, '998172654', 'no', 1, 'no'),
(87, 'VMP INGENIEROS Y CONTRATISTAS GENERALES S.A.C.', '-', 1, 'vmp.ingenieria.servicios@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20520676857, '993742069', 'no', 1, 'no'),
(88, 'ZGS PERU S.A.C.', '-', 1, 'administracion1@zgsperu.com.pe', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 20602637779, '977726024', 'no', 1, 'no'),
(89, 'Jonathan Sergio', 'Narvaez Cuenca', 3, 'jonaser06@gmail.com', '0e7d3a58784df9345de1732976238d7ff60897d006ae29859486a8e8ed231af9', 47793117, '931018386', 'si', 1, 'si');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idventas` int(10) NOT NULL,
  `idusuarios` int(10) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `config_app`
--
ALTER TABLE `config_app`
  ADD PRIMARY KEY (`idconfig_app`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`iddetalles`),
  ADD KEY `idventas` (`idventas`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idestado_pedido` (`idestado_pedido`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`idestado_pedido`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`idprivilegios`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD KEY `tipo` (`tipo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventas`),
  ADD KEY `idusuarios` (`idusuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `config_app`
--
ALTER TABLE `config_app`
  MODIFY `idconfig_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `iddetalles` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `idestado_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `idprivilegios` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=866;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventas` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`idventas`) REFERENCES `ventas` (`idventas`),
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`idproducto`),
  ADD CONSTRAINT `detalles_ibfk_3` FOREIGN KEY (`idestado_pedido`) REFERENCES `estado_pedido` (`idestado_pedido`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `privilegios` (`idprivilegios`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`idusuarios`) REFERENCES `usuarios` (`idusuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
