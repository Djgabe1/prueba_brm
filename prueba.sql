-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-04-2021 a las 10:06:05
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `productos` varchar(70) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `cantidad` int(20) NOT NULL,
  `idProveedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `productos`, `nombre`, `apellido`, `cantidad`, `idProveedores`) VALUES
(987, 'Coffee Delight', 'ww', 'garcia', 12, 0),
(1234, 'Supercoco', 'caro', 'prueba', 8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idProveedores` int(11) NOT NULL,
  `productos` varchar(60) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `lote` varchar(100) NOT NULL,
  `fechaVencimiento` date NOT NULL,
  `precio` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idProveedores`, `productos`, `cantidad`, `lote`, `fechaVencimiento`, `precio`) VALUES
(1, '2', 12, 'Nl24', '2021-05-01', 1345),
(4, 'Supercoco', 90, 'Nl4567', '2021-04-30', 234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `nombre`) VALUES
(1, 'Choco Break'),
(2, 'Bom bom bum'),
(3, 'Frunas'),
(4, 'Coffee Delight'),
(5, 'Choco Melos'),
(6, 'Masmelos Millos'),
(7, 'Gomitas Grisly Splash'),
(8, 'Supercoco'),
(9, 'Halls'),
(10, 'Almendras sin azucar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedores` int(11) NOT NULL,
  `productos` varchar(70) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `lote` varchar(50) NOT NULL,
  `fechaVencimiento` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedores`, `productos`, `cantidad`, `lote`, `fechaVencimiento`, `precio`) VALUES
(2, 'Coffee Delight', 4, 'Nl567', '2021-05-02 05:00:00', 234),
(3, 'Choco Break', 12, 'Nl567', '2021-04-03 05:00:00', 234);

--
-- Disparadores `proveedores`
--
DELIMITER $$
CREATE TRIGGER `ELIMINACION_PROVEEDORES` AFTER DELETE ON `proveedores` FOR EACH ROW INSERT INTO factura(idProveedores,productos,cantidad,lote,fechaVencimiento,precio) VALUES (OLD.idProveedores, OLD.productos, OLD.cantidad, OLD.lote, OLD.fechaVencimiento, OLD.PRECIO)
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idProveedores`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedores`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
