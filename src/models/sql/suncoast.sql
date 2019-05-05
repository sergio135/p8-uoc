-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 25-04-2019 a las 19:00:20
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `suncoast_p8`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcos`
--

CREATE TABLE IF NOT EXISTS `barcos` (
  `barco_id` int(50) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(50) NOT NULL,
  `puerto_id` int(50) NOT NULL,
  `descripcion_barco` varchar(50) NOT NULL,
  `max_pasajeros` int(50) NOT NULL,
  `barco_imagen` varchar(100) NOT NULL,
  `precio_pack` int(50) NOT NULL,
  PRIMARY KEY (`barco_id`),
  KEY `categoria_id` (`categoria_id`,`puerto_id`),
  KEY `puerto_id` (`puerto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_id` int(50) NOT NULL AUTO_INCREMENT,
  `categoria_barco` varchar(50) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `compra_id` int(50) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(50) NOT NULL,
  `barco_id` int(50) NOT NULL,
  `fecha_compra` date NOT NULL,
  `cantidad` int(50) NOT NULL,
  `precio_total` int(50) NOT NULL,
  PRIMARY KEY (`compra_id`),
  KEY `barco_id` (`barco_id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puertos`
--

CREATE TABLE IF NOT EXISTS `puertos` (
  `puerto_id` int(50) NOT NULL AUTO_INCREMENT,
  `puerto_descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`puerto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(50) NOT NULL AUTO_INCREMENT,
  `roles_descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` int(50) NOT NULL AUTO_INCREMENT,
  `roles_id` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `roles_id` (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barcos`
--
ALTER TABLE `barcos`
  ADD CONSTRAINT `barcos_ibfk_2` FOREIGN KEY (`puerto_id`) REFERENCES `puertos` (`puerto_id`),
  ADD CONSTRAINT `barcos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`barco_id`) REFERENCES `barcos` (`barco_id`),
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id_rol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
