-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2026 a las 22:27:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fitcimm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `hora_ingreso` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id_ingreso`, `id_socio`, `fecha_ingreso`, `hora_ingreso`) VALUES
(1, 1, '2026-07-23', '17:08:03'),
(6, 2, '2026-07-23', '17:26:22'),
(7, 5, '2026-07-23', '17:27:14'),
(8, 6, '2026-07-23', '17:28:17'),
(9, 7, '2026-07-23', '17:28:34'),
(12, 1, '2026-07-24', '12:30:58'),
(13, 2, '2026-07-24', '12:31:10'),
(14, 5, '2026-07-24', '12:31:55'),
(15, 7, '2026-07-24', '12:34:15'),
(16, 8, '2026-07-24', '16:20:46'),
(17, 7, '2026-07-26', '21:06:57'),
(18, 8, '2026-07-26', '21:07:07'),
(19, 2, '2026-07-26', '21:19:53'),
(20, 12, '2026-07-27', '12:19:01'),
(21, 6, '2026-07-27', '12:21:33'),
(22, 11, '2026-07-27', '12:23:15'),
(23, 7, '2026-07-27', '12:33:46'),
(24, 8, '2026-07-27', '12:33:54'),
(25, 2, '2026-07-27', '15:24:42'),
(26, 5, '2026-07-27', '15:26:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresia`
--

CREATE TABLE `membresia` (
  `id_membresia` int(11) NOT NULL,
  `id_socio` int(11) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `valor_pagado` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresia`
--

INSERT INTO `membresia` (`id_membresia`, `id_socio`, `id_plan`, `fecha_inicio`, `fecha_fin`, `valor_pagado`) VALUES
(1, 1, 2, '2026-05-01', '2026-05-31', 75000.00),
(2, 2, 1, '2026-07-10', '2026-07-11', 8000.00),
(3, 3, 3, '2026-03-01', '2026-05-30', 195000.00),
(4, 4, 2, '2026-06-01', '2026-07-01', 75000.00),
(5, 1, 2, '2026-06-24', '2026-07-24', 75000.00),
(6, 5, 3, '2026-04-25', '2026-07-24', 195000.00),
(7, 6, 1, '2026-07-22', '2026-07-23', 8000.00),
(8, 7, 4, '2026-01-15', '2027-01-15', 650000.00),
(9, 8, 2, '2026-07-15', '2026-08-14', 75000.00),
(10, 2, 3, '2026-07-01', '2026-09-29', 195000.00),
(11, 12, 1, '2026-07-27', '2026-07-28', 8000.00),
(12, 6, 3, '2026-07-27', '2026-10-25', 195000.00),
(13, 11, 4, '2026-07-27', '2027-07-27', 650000.00),
(14, 11, 2, '2027-07-28', '2027-08-27', 75000.00),
(15, 5, 1, '2026-07-27', '2026-07-28', 8000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `duracion_dias` int(11) NOT NULL CHECK (`duracion_dias` > 0),
  `valor` decimal(10,2) NOT NULL CHECK (`valor` > 0),
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `nombre`, `duracion_dias`, `valor`, `activo`) VALUES
(1, 'Dia', 1, 8000.00, 1),
(2, 'Mensual', 30, 75000.00, 1),
(3, 'Trimestral', 90, 195000.00, 1),
(4, 'Anual', 365, 650000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socio`
--

CREATE TABLE `socio` (
  `id_socio` int(11) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socio`
--

INSERT INTO `socio` (`id_socio`, `documento`, `nombres`, `apellidos`, `telefono`, `correo`, `fecha_nacimiento`, `activo`) VALUES
(1, '1023456789', 'Juan', 'Castaño Ramírez', '3104567890', 'juan.castano@gmail.com', '1999-03-15', 1),
(2, '1034567890', 'María Yasmin', 'Gómez López', '3115678901', 'maria.gomez@hotmail.com', '2001-07-22', 1),
(3, '1045678901', 'Carlos', 'Rodríguez Pérez', '3126789012', 'carlos.rodriguez@yahoo.com', '1998-11-09', 1),
(4, '1056789012', 'Ana', 'Martínez Díaz', '3137890123', 'ana.martinez@gmail.com', '2002-01-30', 1),
(5, '1067890123', 'Luis', 'Fernández Torres', '3148901234', 'luis.fernandez@outlook.com', '1997-05-18', 1),
(6, '1078901234', 'Sofía', 'Herrera Vargas', '3159012345', 'sofia.herrera@gmail.com', '2000-09-12', 1),
(7, '1089012345', 'David Andres', 'Suárez Moreno', '3160123456', 'david.suarez@hotmail.com', '1996-12-05', 1),
(8, '1090123456', 'Laura Sofia', 'Castro Rojas', '3171234567', 'laura.castro@yahoo.com', '2003-04-17', 1),
(9, '1101234567', 'Andrés', 'Ramírez Sánchez', '3182345678', 'andres.ramirez@gmail.com', '1995-08-14', 1),
(10, '1112345678', 'Valentina', 'Muñoz Gil', '3193456789', 'valentina.munoz@outlook.com', '2001-10-03', 1),
(11, '1031541793', 'Julian Camilo', 'Lopez Morantes', '3209878967', 'julilo09123452@gmail.com', '2007-12-09', 1),
(12, '1052390117', 'Yuliana Katerin', 'Ramos Chia', '3204749451', 'yuliana@gmail.com', '2008-03-03', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `fK_ing_socio` (`id_socio`);

--
-- Indices de la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD PRIMARY KEY (`id_membresia`),
  ADD KEY `fk_mem_socio` (`id_socio`),
  ADD KEY `fk_mem_plan` (`id_plan`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `socio`
--
ALTER TABLE `socio`
  ADD PRIMARY KEY (`id_socio`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `membresia`
--
ALTER TABLE `membresia`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `socio`
--
ALTER TABLE `socio`
  MODIFY `id_socio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fK_ing_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);

--
-- Filtros para la tabla `membresia`
--
ALTER TABLE `membresia`
  ADD CONSTRAINT `fk_mem_plan` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`),
  ADD CONSTRAINT `fk_mem_socio` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
