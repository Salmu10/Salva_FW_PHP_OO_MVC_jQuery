create database cars;
use cars;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2022 a las 14:43:45
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cars`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `cod_brand` varchar(100) NOT NULL,
  `brand_name` varchar(1000) NOT NULL,
  `brand_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`cod_brand`, `brand_name`, `brand_img`) VALUES
('AUD', 'Audi', 'view/images/img_brand/audi.png'),
('BMW', 'BMW', 'view/images/img_brand/bmw.png'),
('CP', 'Cupra', 'view/images/img_brand/cupra.png'),
('FRD', 'Ford', 'view/images/img_brand/ford.png'),
('MCD', 'Mercedes', 'view/images/img_brand/mercedes.png'),
('TS', 'Tesla', 'view/images/img_brand/tesla.png'),
('TY', 'Toyota', 'view/images/img_brand/volkswagen.png'),
('VW', 'Volkswagen', 'view/images/img_brand/volkswagen.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cars`
--

CREATE TABLE `cars` (
  `id` int(20) UNSIGNED NOT NULL,
  `license_number` varchar(17) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `car_plate` varchar(7) NOT NULL,
  `km` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `comments` varchar(1000) NOT NULL,
  `discharge_date` varchar(10) NOT NULL,
  `color` varchar(1000) NOT NULL,
  `extras` varchar(1000) NOT NULL,
  `car_image` varchar(1000) NOT NULL,
  `price` int(11) NOT NULL,
  `doors` int(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `lat` varchar(1000) NOT NULL,
  `lng` varchar(1000) NOT NULL,
  `visits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cars`
--

INSERT INTO `cars` (`id`, `license_number`, `brand`, `model`, `car_plate`, `km`, `category`, `type`, `comments`, `discharge_date`, `color`, `extras`, `car_image`, `price`, `doors`, `city`, `lat`, `lng`, `visits`) VALUES
(1, '1W2D50JIL04J3L5K1', 'BMW', 'I4', '4567DAB', 0, 'KM0', 'ET', 'Coche nuevo y automático', '15/04/2019', 'White', 'Navegador', 'bmw_i4.jpg', 50000, 4, 'Ontinyent', '38.8232769', '-0.600155', 0),
(2, '2OUD50JIL04J3L5G6', 'CP', 'Formentor', '7645JDH', 10000, 'RT', 'GS', 'Coche nuevo y automático', '26/07/2019', 'Mate_Blue', 'Navegador', 'cupra_formentor.jpg', 32000, 5, 'Barcelona', '41.378517020872096', '2.12054921251206', 0),
(3, '8P9D50JIL04J3L1H7', 'FRD', 'Mustang', '6547LGM', 2000, 'SM', 'ET', 'Coche nuevo y automático', '30/03/2019', 'Blue', 'Navegador', 'ford_mustang.jpg', 39000, 5, 'Valencia', '39.4697065', '-0.3763353', 0),
(4, '44GD50JIL04J3LH58', 'MCD', 'GLC Coupé', '9745DFM', 25000, 'SM', 'OT', 'Coche nuevo y automático', '26/07/2019', 'Mate_Grey', 'Navegador', 'mercedes_glc_coupe.jpg', 60000, 5, 'Tarragona', '41.116501', '1.2547559036906364', 0),
(5, '3J4750JIL04J3LKP4', 'AUD', 'A6', '2641FKL', 50000, 'RT', 'HB', 'Coche nuevo y automático', '20/06/2017', 'White', 'Navegador', 'audi_q5_hibrido.jpg', 28000, 4, 'Toledo', '39.859272168634305', '-4.026596093654632', 0),
(6, '6k41L9JIL04J3LKP4', 'TS', 'Roadster', '4621LPL', 0, 'KM0', 'ET', 'Coche nuevo y automático', '22/02/2022', 'Red', 'Navegador', 'tesla_roadster.jpg', 100000, 4, 'Zaragoza', '41.6521342', '-0.8809428', 0),
(7, '2G4D50JIL04J3L5HJ', 'TS', 'Cybertruck', '9524LHG', 0, 'KM0', 'ET', 'Coche nuevo y automático', '15/04/2019', 'White', 'Navegador', 'tesla_cybertruck.jpg', 50000, 4, 'Alicante', '38.3436365', '-0.4881708', 0),
(8, '0O6D50JIL04J3L45H', 'VW', 'T-Cross', '9486JGF', 20000, 'RT', 'GS', 'Coche nuevo y automático', '26/07/2019', 'Turquoise', 'Navegador', 'volkswagen_t-cross.jpg', 32000, 5, 'Sevilla', '37.38780795368304', '-5.995093536775556', 0),
(9, '9G6D50JIL04J3L234', 'AUD', 'E-tron', '3214TLE', 0, 'KM0', 'ET', 'Coche nuevo y automático', '30/03/2019', 'Blue', 'Navegador', 'audi_etron_gt.jpg', 39000, 5, 'Albacete', '38.9950921', '-1.8559154', 0),
(10, '5FGD50JIL04J3LGJ6', 'TY', 'C-HR', '1659KRW', 64000, 'SM', 'HB', 'Coche nuevo y automático', '26/07/2019', 'Orange', 'Navegador', 'toyota_C-HR.jpg', 60000, 5, 'Barcelona', '41.37422519654638', '2.175717061578382', 0),
(11, '1F4750JIL04J3LK81', 'MCD', 'EQE', '4561HGH', 5500, 'SM', 'ET', 'Coche nuevo y automático', '20/06/2017', 'Red', 'Navegador', 'mercedes_eqe.jpg', 28000, 4, 'Madrid', '40.4167047', '-3.7035825', 0),
(12, '78L1L9JIL04J3L4J9', 'TS', 'Model X', '9414LHP', 0, 'KM0', 'ET', 'Coche nuevo y automático', '22/02/2022', 'Red', 'Navegador', 'tesla_model_x.jpg', 100000, 4, 'Granada', '37.1734995', '-3.5995337', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `car_images`
--

CREATE TABLE `car_images` (
  `id_image` int(10) UNSIGNED NOT NULL,
  `id_car` int(20) UNSIGNED NOT NULL,
  `image_name` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `car_images`
--

INSERT INTO `car_images` (`id_image`, `id_car`, `image_name`) VALUES
(1, 1, 'view/images/img_cars/bmw/bmw_i4.jpg'),
(2, 1, 'view/images/img_cars/bmw/bmw_i4_2.jpg'),
(3, 1, 'view/images/img_cars/bmw/bmw_i4_3.jpg'),
(4, 1, 'view/images/img_cars/bmw/bmw_i4_4.jpg'),
(5, 1, 'view/images/img_cars/bmw/bmw_i4_5.jpg'),
(6, 2, 'view/images/img_cars/cupra/cupra_frmt.jpg'),
(7, 2, 'view/images/img_cars/cupra/cupra_frmt_2.jpg'),
(8, 2, 'view/images/img_cars/cupra/cupra_frmt_3.jpg'),
(9, 2, 'view/images/img_cars/cupra/cupra_frmt_4.jpg'),
(10, 3, 'view/images/img_cars/ford/ford_mustang.jpg'),
(11, 3, 'view/images/img_cars/ford/ford_mustang_2.jpg'),
(12, 3, 'view/images/img_cars/ford/ford_mustang_3.jpg'),
(13, 3, 'view/images/img_cars/ford/ford_mustang_4.jpg'),
(14, 3, 'view/images/img_cars/ford/ford_mustang_5.jpg'),
(15, 4, 'view/images/img_cars/mercedes/mercedes_glc.jpg'),
(16, 4, 'view/images/img_cars/mercedes/mercedes_glc_2.jpg'),
(17, 4, 'view/images/img_cars/mercedes/mercedes_glc_3.jpg'),
(18, 5, 'view/images/img_cars/audi/audi_q5_hibrido.jpeg'),
(19, 5, 'view/images/img_cars/audi/audi_q5_hibrido_2.jpeg'),
(20, 5, 'view/images/img_cars/audi/audi_q5_hibrido_3.jpeg'),
(21, 6, 'view/images/img_cars/tesla/tesla_roadster.jpg'),
(22, 6, 'view/images/img_cars/tesla/tesla_roadster_2.jpg'),
(23, 6, 'view/images/img_cars/tesla/tesla_roadster_3.jpg'),
(24, 7, 'view/images/img_cars/tesla/tesla_cybertruck.jpg'),
(25, 7, 'view/images/img_cars/tesla/tesla_cybertruck_2.jpg'),
(26, 7, 'view/images/img_cars/tesla/tesla_cybertruck_3.jpg'),
(27, 8, 'view/images/img_cars/volkswagen/volkswagen_T-Cross.jpg'),
(28, 8, 'view/images/img_cars/volkswagen/volkswagen_T-Cross_2.jpg'),
(29, 8, 'view/images/img_cars/volkswagen/volkswagen_T-Cross_3.jpg'),
(30, 9, 'view/images/img_cars/audi/audi_etron_gt.jpg'),
(31, 9, 'view/images/img_cars/audi/audi_etron_gt_2.jpg'),
(32, 9, 'view/images/img_cars/audi/audi_etron_gt_3.jpg'),
(33, 9, 'view/images/img_cars/audi/audi_etron_gt_4.jpg'),
(34, 10, 'view/images/img_cars/toyota/toyota_C-HR.jpg'),
(35, 10, 'view/images/img_cars/toyota/toyota_C-HR_2.jpg'),
(36, 10, 'view/images/img_cars/toyota/toyota_C-HR_3.jpg'),
(37, 11, 'view/images/img_cars/mercedes/mercedes_eqe.jpg'),
(38, 11, 'view/images/img_cars/mercedes/mercedes_eqe_2.jpg'),
(39, 11, 'view/images/img_cars/mercedes/mercedes_eqe_3.jpg'),
(40, 12, 'view/images/img_cars/tesla/tesla_model_x.jpg'),
(41, 12, 'view/images/img_cars/tesla/tesla_model_x_2.jpg'),
(42, 12, 'view/images/img_cars/tesla/tesla_model_x_3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `cod_category` varchar(100) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`cod_category`, `category_name`, `category_img`) VALUES
('KM0', 'Kilometro_0', 'view/images/img_category/km0.jpg'),
('RT', 'Renting', 'view/images/img_category/renting.jpg'),
('SM', 'Segunda_mano', 'view/images/img_category/segunda_mano.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `errors`
--

CREATE TABLE `errors` (
  `id_errors` int(100) UNSIGNED NOT NULL,
  `type` varchar(50) NOT NULL,
  `date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `errors`
--

INSERT INTO `errors` (`id_errors`, `type`, `date`) VALUES
(1537, 'Load like error', '2022-04-04'),
(1538, 'Load like error', '2022-04-04'),
(1539, 'Load like error', '2022-04-04'),
(1540, 'Load like error', '2022-04-04'),
(1541, 'Number of cars error', '2022-04-04'),
(1542, 'Details error', '2022-04-04'),
(1543, 'Details error', '2022-04-04'),
(1544, 'Load like error', '2022-04-04'),
(1545, 'Load like error', '2022-04-04'),
(1546, 'Load like error', '2022-04-04'),
(1547, 'Load like error', '2022-04-04'),
(1548, 'Load like error', '2022-04-04'),
(1549, 'Load like error', '2022-04-05'),
(1550, 'Load like error', '2022-04-05'),
(1551, 'Load like error', '2022-04-08'),
(1552, 'Load like error', '2022-04-08'),
(1553, 'Login error', '2022-04-26'),
(1554, 'Login error', '2022-04-26'),
(1555, 'Login error', '2022-05-03'),
(1556, 'Login error', '2022-05-04'),
(1557, 'Login error', '2022-05-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `cod_like` int(250) NOT NULL,
  `username` varchar(1000) NOT NULL,
  `id_car` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`cod_like`, `username`, `id_car`) VALUES
(1, 'salva10', 76),
(2, 'salmu10', 76),
(3, 'salmu10', 1),
(4, 'salmu10', 80),
(5, 'salmu10', 77),
(6, 'salmu10', 2),
(10, 'salmu10', 12),
(12, 'salmu10', 7),
(17, 'salmu', 5),
(22, 'salmu', 9),
(23, 'salmu', 1),
(24, 'ubedasalmu', 4),
(25, 'ubedasalmu', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type`
--

CREATE TABLE `type` (
  `cod_type` varchar(100) NOT NULL,
  `type_name` varchar(1000) NOT NULL,
  `type_img` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `type`
--

INSERT INTO `type` (`cod_type`, `type_name`, `type_img`) VALUES
('ET', 'Electric', 'view/images/img_type/electric.jpg'),
('GS', 'Gasoline', 'view/images/img_type/gasolina.jpg'),
('HB', 'Hybrid', 'view/images/img_type/hibrido.jpg'),
('OT', 'Others', 'view/images/img_type/diesel.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` varchar(250) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_type` varchar(20) NOT NULL,
  `avatar` varchar(1000) NOT NULL,
  `token_email` varchar(250) NOT NULL,
  `activate` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `user_type`, `avatar`, `token_email`, `activate`) VALUES
('256142', 'salmu', '$2y$12$Q3fPhRuzsa3SsIzlHBqg6e2YTV91LQfLC2zahMDc6/QuB2/GT3Vm.', 'sqas@gmail.com', 'client', 'https://robohash.org/4d6c7b594132a737a7eaa31810c2f1a4', '', 1),
('32c450', 'salmu70', '$2y$10$x2rjeCY8A4OomqhpIx987uJ3k0RKG3URQnMB7qo2mg354jheVs6OO', 'wefwes@gmail.com', 'client', 'https://robohash.org/17f4401e301b5ce07f5a514c2cdce6fe', '7bea93a22795eba84f35', 0),
('b4ac02', 'salmu60', '$2y$12$Q3fPhRuzsa3SsIzlHBqg6e2YTV91LQfLC2zahMDc6/QuB2/GT3Vm.', 'edwerwer@gmail.com', 'client', 'https://robohash.org/d70cc9c7102c6167470c0b400623c631', '', 1),
('voNu1FaH0HOAljo5qpz5B3oisTz1', 'ubedasalmu', '$2y$12$Q3fPhRuzsa3SsIzlHBqg6e2YTV91LQfLC2zahMDc6/QuB2/GT3Vm.', 'ubedasalmu@gmail.com', 'client', 'https://lh3.googleusercontent.com/a-/AOh14Ghd_-Zk2kohzswGIFstxDP2zsp1Jm7tKaLO7Q3Q=s96-c', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`cod_brand`),
  ADD UNIQUE KEY `cod_brand` (`cod_brand`);

--
-- Indices de la tabla `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `num_bastidor` (`license_number`),
  ADD KEY `FK_brand` (`brand`),
  ADD KEY `FK_type` (`type`),
  ADD KEY `FK_category` (`category`);

--
-- Indices de la tabla `car_images`
--
ALTER TABLE `car_images`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `FK_image` (`id_car`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cod_category`),
  ADD UNIQUE KEY `cod_category` (`cod_category`);

--
-- Indices de la tabla `errors`
--
ALTER TABLE `errors`
  ADD PRIMARY KEY (`id_errors`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`cod_like`);

--
-- Indices de la tabla `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`cod_type`),
  ADD UNIQUE KEY `cod_type` (`cod_type`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `car_images`
--
ALTER TABLE `car_images`
  MODIFY `id_image` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `errors`
--
ALTER TABLE `errors`
  MODIFY `id_errors` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1558;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `cod_like` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `FK_brand` FOREIGN KEY (`brand`) REFERENCES `brand` (`cod_brand`),
  ADD CONSTRAINT `FK_category` FOREIGN KEY (`category`) REFERENCES `category` (`cod_category`),
  ADD CONSTRAINT `FK_type` FOREIGN KEY (`type`) REFERENCES `type` (`cod_type`);

--
-- Filtros para la tabla `car_images`
--
ALTER TABLE `car_images`
  ADD CONSTRAINT `FK_image` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
