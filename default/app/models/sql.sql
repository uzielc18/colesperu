-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 20-12-2018 a las 00:42:45
-- Versión del servidor: 5.6.34-log
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `u590019162_exp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclauditorias`
--

CREATE TABLE `aclauditorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `accion_realizada` text,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `created` int(11) UNSIGNED DEFAULT NULL,
  `users_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclcargos`
--

CREATE TABLE `aclcargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `abr` varchar(45) DEFAULT NULL,
  `aclempresas_id` int(10) UNSIGNED NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclconfiguraciones`
--

CREATE TABLE `aclconfiguraciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable` varchar(50) NOT NULL,
  `valor` varchar(250) NOT NULL,
  `estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acldatos`
--

CREATE TABLE `acldatos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `appaterno` varchar(250) DEFAULT NULL,
  `apmaterno` varchar(250) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `telefono` varchar(18) DEFAULT NULL,
  `celular` varchar(18) DEFAULT NULL,
  `correo` varchar(250) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `fnacimiento` date DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL,
  `aclempresas_id` int(10) UNSIGNED NOT NULL,
  `aclcargos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclempresas`
--

CREATE TABLE `aclempresas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `abr` varchar(25) DEFAULT NULL,
  `razonsocial` varchar(250) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `detalle` text,
  `telefonos` varchar(50) DEFAULT NULL,
  `telefonos1` varchar(50) DEFAULT NULL,
  `telefonos2` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclmenus`
--

CREATE TABLE `aclmenus` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `posicion` int(11) DEFAULT NULL,
  `clases` varchar(50) DEFAULT NULL,
  `class_new` varchar(100) DEFAULT NULL,
  `visible_en` int(1) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `ubicacion` tinyint(1) DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `userid` int(10) DEFAULT NULL,
  `aclrecursos_id` int(10) UNSIGNED NOT NULL,
  `aclmenus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclmenus`
--

INSERT INTO `aclmenus` (`id`, `nombre`, `url`, `posicion`, `clases`, `class_new`, `visible_en`, `activo`, `ubicacion`, `fecha_at`, `fecha_in`, `userid`, `aclrecursos_id`, `aclmenus_id`) VALUES
(1, 'Usuarios', 'admin/usuarios', 2, 'user', 'user', 2, 1, 3, NULL, '2018-06-10 16:27:08', NULL, 1, 18),
(3, 'Roles', 'admin/roles', 3, 'users', 'users', 2, 1, 3, NULL, '2012-04-19 10:42:04', NULL, 2, 18),
(4, 'Recursos', 'admin/recursos', 4, 'user', 'cubes', 2, 1, 3, NULL, '2018-06-10 17:14:16', NULL, 3, 18),
(5, 'Menu', 'admin/menu', 5, 'user', 'bars', 2, 1, 3, NULL, '2018-06-10 17:14:38', NULL, 4, 18),
(7, 'Privilegios', 'admin/privilegios', 6, NULL, 'key', 2, 1, 3, NULL, '2018-06-10 17:15:15', NULL, 5, 18),
(18, 'Administracion', 'admin/usuarios/index', 2, 'administrar', 'cogs', 2, 1, 3, NULL, '2018-01-12 01:15:53', NULL, 9, 0),
(19, 'Mi Perfil', 'admin/usuarios/perfil', 1, 'usuario', 'user', 2, 1, 3, NULL, '2018-06-12 21:07:26', NULL, 7, NULL),
(21, 'Config. Aplicacion', 'admin/index', 7, NULL, 'code', 2, 1, 3, NULL, '2018-06-10 17:16:08', NULL, 8, 18),
(22, 'Auditorias', 'admin/auditorias', 8, NULL, 'binoculars', 2, 1, 3, NULL, '2018-06-10 17:16:31', NULL, 10, 18),
(23, 'Empresas', 'admin/aclempresas', 1, 'empresas', 'industry', 2, 1, 3, '2012-04-19 10:41:40', '2018-01-15 23:15:33', NULL, 12, 0),
(28, 'Admin', 'admin/index/bienvenido', 3, NULL, NULL, 1, 1, 1, '2012-04-19 13:37:17', '2018-07-29 09:09:27', 3, 8, NULL),
(53, 'Cargos', 'admin/aclcargos', 4, NULL, 'male', 2, 1, 3, '2012-06-04 11:44:06', '2018-06-10 17:13:27', 3, 18, 180),
(58, 'Variables', 'admin/configuraciones', 8, NULL, NULL, 2, 1, 1, '2012-07-30 12:41:57', NULL, 3, 16, 32),
(180, 'Configuraciones', 'admin/configuraciones', 3, NULL, 'opera', 3, 1, 3, '2015-04-07 10:32:57', '2018-07-28 23:27:38', 3, 16, NULL),
(182, 'Aplicacion', 'apps/index', 1, NULL, NULL, 2, 1, 1, '2018-01-11 22:34:58', '2018-01-11 22:52:06', 3, 17, 0),
(185, 'Pagina de inicio', '', 1, NULL, 'globe', 3, 1, 1, '2018-01-28 23:25:03', '2018-06-10 16:13:33', 3, 6, NULL),
(186, 'Variables del sistema', 'admin/configuraciones', 1, NULL, 'map-signs', 2, 1, 3, '2018-06-10 16:48:52', '2018-06-10 17:13:38', 1, 16, 180),
(187, 'Detalle Analisis', 'admin/detalleanalisis', 2, NULL, 'fonticons', 2, 1, 3, '2018-06-10 17:04:17', NULL, 1, 20, 180),
(188, 'Datos', 'admin/acldatos', 5, NULL, 'hand-stop-o', 2, 1, 3, '2018-06-10 17:18:10', NULL, 1, 19, 180),
(189, 'Detalle Metrados', 'admin/detallemetrados', 6, NULL, 'road', 2, 1, 3, '2018-06-11 21:58:19', NULL, 1, 21, 180),
(190, 'Detalle Tecnicos', 'admin/detallestecnicos', 7, NULL, 'houzz', 2, 1, 3, '2018-06-11 21:59:15', NULL, 1, 23, 180),
(191, 'Expedientes', 'admin/expedientes', 8, NULL, 'book', 2, 1, 3, '2018-06-11 22:00:19', '2018-07-20 06:11:46', 1, 22, NULL),
(192, 'Materiales', 'admin/materiales', 9, NULL, 'flag-checkered', 2, 1, 3, '2018-06-11 22:01:21', NULL, 1, 27, NULL),
(193, 'Medidas', 'admin/medidas', 10, NULL, 'balance-scale', 2, 1, 3, '2018-06-11 22:02:28', NULL, 1, 26, NULL),
(194, 'Modulos', 'admin/modulos', 11, NULL, 'adjust', 2, 1, 3, '2018-06-11 22:16:29', '2018-06-11 22:17:56', 1, 25, NULL),
(195, 'Partidas', 'admin/partidas', 11, NULL, 'pencil-square-o', 2, 1, 3, '2018-06-11 22:19:14', NULL, 1, 24, NULL),
(196, 'Precios Empresas', 'admin/preciosempresas', 11, NULL, 'area-chart', 2, 1, 3, '2018-06-11 22:32:04', NULL, 1, 28, 180),
(197, 'Presupuesto', 'admin/presupuestos', 12, NULL, 'expeditedssl', 2, 1, 3, '2018-06-11 22:35:54', NULL, 1, 29, NULL),
(198, 'Proformas', 'admin/proformas', 14, NULL, 'gg', 2, 1, 3, '2018-06-11 22:37:54', NULL, 1, 30, NULL),
(199, 'Tipo expedientes', 'admin/tipoexpedientes', 11, NULL, 'get-pocket', 2, 1, 3, '2018-06-11 22:42:49', NULL, 1, 32, 180),
(200, 'Tipo Materiales', 'admin/tipomateriales', 12, NULL, 'certificate', 2, 1, 3, '2018-06-11 22:44:51', NULL, 1, 33, 180),
(201, 'Titulo Partidas', 'admin/titulopartidas', 13, NULL, 'underline', 2, 1, 3, '2018-06-11 22:47:02', NULL, 1, 34, 180),
(202, 'Perfil', 'apps/usuarios/perfil', 1, NULL, 'child', 1, 1, 3, '2018-06-21 22:19:52', '2018-07-26 06:19:59', 3, 36, NULL),
(203, 'Mis expedientes', 'apps/expediente', 2, NULL, 'reorder', 1, 1, 3, '2018-06-23 20:28:14', '2018-07-26 06:20:09', 3, 37, NULL),
(204, 'Indices unificados', 'apps/tipomateriales', 1, NULL, 'list-alt', 1, 1, 3, '2018-07-28 23:58:37', '2018-08-12 00:11:02', 3, 42, 180),
(205, 'Adm materiales  ', 'apps/materiales', 2, NULL, 'leaf', 1, 1, 3, '2018-08-07 05:45:17', NULL, 3, 46, 180),
(206, 'Especifica de gastos', 'admin/especificadegastos', 11, NULL, 'credit-card', 2, 1, 3, '2018-08-09 23:57:05', NULL, 3, 47, NULL),
(207, 'Mi tienda', 'tiendas/miempresa/ver', 1, NULL, 'cart-plus', 1, 1, 3, '2018-09-19 09:37:17', '2018-09-19 10:37:10', 3, 49, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclpermisos`
--

CREATE TABLE `aclpermisos` (
  `id` int(10) UNSIGNED NOT NULL,
  `aclroles_id` int(10) UNSIGNED NOT NULL,
  `aclrecursos_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclpermisos`
--

INSERT INTO `aclpermisos` (`id`, `aclroles_id`, `aclrecursos_id`) VALUES
(648, 2, 18),
(649, 4, 18),
(650, 2, 19),
(651, 4, 19),
(652, 2, 12),
(653, 4, 12),
(654, 5, 12),
(655, 2, 10),
(656, 4, 10),
(657, 2, 16),
(658, 4, 16),
(659, 5, 16),
(660, 2, 20),
(661, 4, 20),
(662, 5, 20),
(663, 2, 21),
(664, 4, 21),
(665, 5, 21),
(666, 2, 23),
(667, 4, 23),
(668, 5, 23),
(669, 2, 47),
(670, 4, 47),
(671, 5, 47),
(672, 2, 22),
(673, 4, 22),
(674, 5, 22),
(675, 2, 8),
(676, 4, 8),
(677, 5, 8),
(678, 2, 27),
(679, 4, 27),
(680, 5, 27),
(681, 2, 26),
(682, 4, 26),
(683, 5, 26),
(684, 2, 4),
(685, 4, 4),
(686, 2, 25),
(687, 4, 25),
(688, 5, 25),
(689, 2, 24),
(690, 4, 24),
(691, 5, 24),
(692, 2, 28),
(693, 4, 28),
(694, 5, 28),
(695, 2, 29),
(696, 4, 29),
(697, 5, 29),
(698, 2, 5),
(699, 4, 5),
(700, 2, 30),
(701, 4, 30),
(702, 5, 30),
(703, 2, 31),
(704, 4, 31),
(705, 5, 31),
(706, 2, 3),
(707, 4, 3),
(708, 5, 3),
(709, 2, 2),
(710, 4, 2),
(711, 5, 2),
(712, 2, 32),
(713, 4, 32),
(714, 5, 32),
(715, 2, 33),
(716, 4, 33),
(717, 5, 33),
(718, 2, 34),
(719, 4, 34),
(720, 5, 34),
(721, 2, 1),
(722, 4, 1),
(723, 2, 9),
(724, 4, 9),
(725, 2, 7),
(726, 4, 7),
(727, 5, 7),
(728, 2, 38),
(729, 4, 38),
(730, 5, 38),
(781, 2, 40),
(782, 4, 40),
(783, 5, 40),
(784, 2, 37),
(785, 4, 37),
(786, 5, 37),
(787, 2, 17),
(788, 4, 17),
(789, 5, 17),
(790, 2, 46),
(791, 4, 46),
(792, 5, 46),
(793, 2, 41),
(794, 4, 41),
(795, 5, 41),
(796, 2, 45),
(797, 4, 45),
(798, 5, 45),
(799, 2, 44),
(800, 4, 44),
(801, 5, 44),
(802, 2, 42),
(803, 4, 42),
(804, 5, 42),
(805, 2, 39),
(806, 4, 39),
(807, 5, 39),
(808, 2, 43),
(809, 4, 43),
(810, 5, 43),
(811, 2, 35),
(812, 4, 35),
(813, 5, 35),
(814, 2, 36),
(815, 4, 36),
(816, 5, 36),
(817, 2, 6),
(818, 4, 6),
(819, 5, 6),
(820, 6, 6),
(821, 2, 11),
(822, 4, 11),
(823, 5, 11),
(824, 6, 11),
(825, 2, 14),
(826, 4, 14),
(827, 5, 14),
(828, 6, 14),
(829, 2, 48),
(830, 4, 48),
(831, 6, 48),
(832, 2, 49),
(833, 4, 49),
(834, 6, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclrecursos`
--

CREATE TABLE `aclrecursos` (
  `id` int(10) UNSIGNED NOT NULL,
  `modulo` varchar(100) DEFAULT NULL,
  `controlador` varchar(100) DEFAULT NULL,
  `accion` varchar(100) DEFAULT NULL,
  `recurso` varchar(200) DEFAULT NULL,
  `descripcion` text,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclrecursos`
--

INSERT INTO `aclrecursos` (`id`, `modulo`, `controlador`, `accion`, `recurso`, `descripcion`, `activo`, `fecha_at`, `fecha_in`, `estado`, `userid`) VALUES
(1, 'admin', 'usuarios', NULL, 'admin/usuarios/*', 'modulo para la administracion de los usuarios del sistema', 1, NULL, '2012-04-24 13:11:06', NULL, NULL),
(2, 'admin', 'roles', NULL, 'admin/roles/*', 'modulo para la gestion de los roles de la aplicacion\r\n', 1, NULL, NULL, NULL, NULL),
(3, 'admin', 'recursos', NULL, 'admin/recursos/*', 'modulo para la gestion de los recursos de la aplicacion', 1, NULL, NULL, NULL, NULL),
(4, 'admin', 'menu', NULL, 'admin/menu/*', 'modulo para la administracion del menu en la app', 1, NULL, NULL, NULL, NULL),
(5, 'admin', 'privilegios', NULL, 'admin/privilegios/*', 'modulo para la administracion de los privilegios que tendra cada rol', 1, NULL, NULL, NULL, NULL),
(6, NULL, 'index', NULL, 'index/*', 'modulo inicial del sistema, donde se loguean los usuarios y donde se desloguean', 1, NULL, NULL, NULL, NULL),
(7, 'admin', 'usuarios', 'perfil', 'admin/usuarios/perfil', 'modulo para la configuracion del perfil del usuario', 1, NULL, NULL, NULL, NULL),
(8, 'admin', 'index', NULL, 'admin/index/*', 'modulo para la configuraciÃ³n del sistema', 1, NULL, NULL, NULL, NULL),
(9, 'admin', 'usuarios', 'index', 'admin/usuarios/index', 'modulo para listar los usuarios del sistema, lo usarÃƒÂ¡ el menu administracion', 1, NULL, NULL, NULL, NULL),
(10, 'admin', 'auditorias', NULL, 'admin/auditorias/*', 'Modulo para revisar las acciones que los usuarios han realizado en el sistema', 1, NULL, NULL, NULL, NULL),
(11, NULL, 'index', 'index', 'index/index', 'recurso que no necesita permisos, es solo de prueba :-)', 1, NULL, NULL, NULL, NULL),
(12, 'admin', 'aclempresas', NULL, 'admin/aclempresas/*', 'para la creaciÃ³n de empresas', 1, '2012-04-19 10:12:50', NULL, NULL, NULL),
(14, NULL, 'logout', NULL, 'logout/*', 'PARA SALIR DEL SISTEMA', 1, '2012-04-24 13:27:39', NULL, NULL, NULL),
(16, 'admin', 'configuraciones', NULL, 'admin/configuraciones/*', 'ConfiguraciÃ³n de las variables', 1, '2012-07-30 12:38:55', NULL, NULL, NULL),
(17, 'apps', 'index', NULL, 'apps/index/*', 'index de bienvenida', 1, '2018-01-11 22:30:45', NULL, NULL, NULL),
(18, 'admin', 'aclcargos', NULL, 'admin/aclcargos/*', 'Admin Cargos', 1, '2018-06-04 20:24:49', NULL, NULL, NULL),
(19, 'admin', 'acldatos', NULL, 'admin/acldatos/*', 'ADMIN DATOS', 1, '2018-06-04 20:25:27', NULL, NULL, NULL),
(20, 'admin', 'detalleanalisis', NULL, 'admin/detalleanalisis/*', 'Admin detalle de analisis unico de costos', 1, '2018-06-04 20:26:03', NULL, NULL, NULL),
(21, 'admin', 'detallemetrados', NULL, 'admin/detallemetrados/*', 'Admin Detalle de metrados', 1, '2018-06-04 20:26:36', NULL, NULL, NULL),
(22, 'admin', 'expedientes', NULL, 'admin/expedientes/*', 'Admin Expedientes', 1, '2018-06-04 20:27:28', '2018-06-04 20:27:28', NULL, NULL),
(23, 'admin', 'detallestecnicos', NULL, 'admin/detallestecnicos/*', 'Admin Detalles TÃ©cnicos', 1, '2018-06-04 20:28:19', NULL, NULL, NULL),
(24, 'admin', 'partidas', NULL, 'admin/partidas/*', 'Admin Partidas', 1, '2018-06-04 20:28:34', NULL, NULL, NULL),
(25, 'admin', 'modulos', NULL, 'admin/modulos/*', 'admin MÃ³dulos', 1, '2018-06-04 20:28:55', NULL, NULL, NULL),
(26, 'admin', 'medidas', NULL, 'admin/medidas/*', 'Admin Medidas', 1, '2018-06-04 20:29:15', NULL, NULL, NULL),
(27, 'admin', 'materiales', NULL, 'admin/materiales/*', 'Admin MAteriales', 1, '2018-06-04 20:29:33', NULL, NULL, NULL),
(28, 'admin', 'preciosempresas', NULL, 'admin/preciosempresas/*', 'Admin Lista de precios por empresas', 1, '2018-06-04 20:30:06', NULL, NULL, NULL),
(29, 'admin', 'presupuestos', NULL, 'admin/presupuestos/*', 'Admin Presupuestos', 1, '2018-06-04 20:30:30', NULL, NULL, NULL),
(30, 'admin', 'proformas', NULL, 'admin/proformas/*', 'Admin Proformas', 1, '2018-06-04 20:31:05', NULL, NULL, NULL),
(31, 'admin', 'proformasdetalles', NULL, 'admin/proformasdetalles/*', 'Admin Proformas detalles', 1, '2018-06-04 20:31:22', NULL, NULL, NULL),
(32, 'admin', 'tipoexpedientes', NULL, 'admin/tipoexpedientes/*', 'Admin Tipo expedientes', 1, '2018-06-04 20:31:50', NULL, NULL, NULL),
(33, 'admin', 'tipomateriales', NULL, 'admin/tipomateriales/*', 'Admin Tipo Materiales', 1, '2018-06-04 20:32:09', NULL, NULL, NULL),
(34, 'admin', 'titulopartidas', NULL, 'admin/titulopartidas/*', 'Titulo Partidas', 1, '2018-06-04 20:32:30', NULL, NULL, NULL),
(35, 'apps', 'usuarios', NULL, 'apps/usuarios/*', 'dddddd\r\n', 1, '2018-06-12 21:38:04', NULL, NULL, NULL),
(36, 'apps', 'usuarios', 'perfil', 'apps/usuarios/perfil', 'dddddd\r\n', 1, '2018-06-12 21:38:47', NULL, NULL, NULL),
(37, 'apps', 'expediente', NULL, 'apps/expediente/*', 'Expedientes', 1, '2018-06-23 20:26:45', NULL, NULL, NULL),
(38, 'apps', 'analisis', NULL, 'apps/analisis/*', 'Analisis', 1, '2018-07-28 23:51:44', NULL, NULL, NULL),
(39, 'apps', 'titulopartidas', NULL, 'apps/titulopartidas/*', 'titulo partidas\r\n', 1, '2018-07-28 23:52:36', NULL, NULL, NULL),
(40, 'apps', 'empresas', NULL, 'apps/empresas/*', 'Empresas', 1, '2018-07-28 23:53:26', NULL, NULL, NULL),
(41, 'apps', 'metrados', NULL, 'apps/metrados/*', 'metrados', 1, '2018-07-28 23:54:08', NULL, NULL, NULL),
(42, 'apps', 'tipomateriales', NULL, 'apps/tipomateriales/*', 'Lista de UI', 1, '2018-07-28 23:54:34', NULL, NULL, NULL),
(43, 'apps', 'ubigeo', NULL, 'apps/ubigeo/*', 'ubigeos', 1, '2018-07-28 23:54:50', NULL, NULL, NULL),
(44, 'apps', 'presupuesto', NULL, 'apps/presupuesto/*', 'presupuesto', 1, '2018-07-28 23:55:09', NULL, NULL, NULL),
(45, 'apps', 'partidas', NULL, 'apps/partidas/*', 'partidas', 1, '2018-07-28 23:55:27', NULL, NULL, NULL),
(46, 'apps', 'materiales', NULL, 'apps/materiales/*', 'Control de materiales', 1, '2018-08-07 05:42:07', NULL, NULL, NULL),
(47, 'admin', 'especificadegastos', NULL, 'admin/especificadegastos/*', 'especifica de gastos', 1, '2018-08-09 23:51:52', NULL, NULL, NULL),
(48, 'tiendas', 'index', NULL, 'tiendas/index/*', 'inicio de tiendas', 1, '2018-09-19 09:32:16', NULL, NULL, NULL),
(49, 'tiendas', 'miempresa', NULL, 'tiendas/miempresa/*', 'ver mi tienda', 1, '2018-09-19 09:32:32', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aclroles`
--

CREATE TABLE `aclroles` (
  `id` int(10) UNSIGNED NOT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `padres` varchar(200) DEFAULT NULL,
  `plantilla` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) UNSIGNED DEFAULT NULL,
  `fecha_at` datetime DEFAULT NULL,
  `fecha_in` datetime DEFAULT NULL,
  `userid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aclroles`
--

INSERT INTO `aclroles` (`id`, `rol`, `padres`, `plantilla`, `activo`, `fecha_at`, `fecha_in`, `userid`) VALUES
(2, 'usuario administrador', NULL, NULL, 1, NULL, '2018-06-24 23:03:13', NULL),
(4, 'administrador del sistema', NULL, NULL, 1, NULL, '2018-06-02 20:48:26', NULL),
(5, 'arquitectos', NULL, NULL, 1, '2018-06-24 22:59:34', '2018-08-26 22:09:09', NULL),
(6, 'tiendas', NULL, NULL, 1, '2018-09-19 09:31:30', '2018-09-19 09:31:32', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aclauditorias`
--
ALTER TABLE `aclauditorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aclauditorias_users_idx` (`users_id`);

--
-- Indices de la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aclcargos_aclempresas_idx` (`aclempresas_id`);

--
-- Indices de la tabla `aclconfiguraciones`
--
ALTER TABLE `aclconfiguraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `acldatos`
--
ALTER TABLE `acldatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acldatos_aclempresas_idx` (`aclempresas_id`),
  ADD KEY `fk_acldatos_aclcargos_idx` (`aclcargos_id`);

--
-- Indices de la tabla `aclempresas`
--
ALTER TABLE `aclempresas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclmenus`
--
ALTER TABLE `aclmenus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aclmenus_aclrecursos_idx` (`aclrecursos_id`);

--
-- Indices de la tabla `aclpermisos`
--
ALTER TABLE `aclpermisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aclpermisos_aclroles_idx` (`aclroles_id`),
  ADD KEY `fk_aclpermisos_aclrecursos_idx` (`aclrecursos_id`);

--
-- Indices de la tabla `aclrecursos`
--
ALTER TABLE `aclrecursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `aclroles`
--
ALTER TABLE `aclroles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aclauditorias`
--
ALTER TABLE `aclauditorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `aclconfiguraciones`
--
ALTER TABLE `aclconfiguraciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `acldatos`
--
ALTER TABLE `acldatos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aclempresas`
--
ALTER TABLE `aclempresas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `aclmenus`
--
ALTER TABLE `aclmenus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT de la tabla `aclpermisos`
--
ALTER TABLE `aclpermisos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;
--
-- AUTO_INCREMENT de la tabla `aclrecursos`
--
ALTER TABLE `aclrecursos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT de la tabla `aclroles`
--
ALTER TABLE `aclroles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aclauditorias`
--
ALTER TABLE `aclauditorias`
  ADD CONSTRAINT `fk_aclauditorias_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aclcargos`
--
ALTER TABLE `aclcargos`
  ADD CONSTRAINT `fk_aclcargos_aclempresas` FOREIGN KEY (`aclempresas_id`) REFERENCES `aclempresas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `aclmenus`
--
ALTER TABLE `aclmenus`
  ADD CONSTRAINT `fk_aclmenus_aclrecursos` FOREIGN KEY (`aclrecursos_id`) REFERENCES `aclrecursos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
