-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2024 a las 09:00:38
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
-- Base de datos: `isaacle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargas_activa`
--

CREATE TABLE `cargas_activa` (
  `id_carga` int(11) NOT NULL,
  `id_object` int(11) NOT NULL,
  `cargas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_detallada_objeto`
--

CREATE TABLE `descripcion_detallada_objeto` (
  `id_descripcion` int(11) NOT NULL,
  `descripcion_detallada` text NOT NULL,
  `id_objeto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descripcion_detallada_objeto`
--

INSERT INTO `descripcion_detallada_objeto` (`id_descripcion`, `descripcion_detallada`, `id_objeto`) VALUES
(1, 'Increases tears by 0.7.', 1),
(2, 'Grants triple shot but decreases tears.', 2),
(3, 'Grants Isaac homing tears.', 3),
(4, 'Increases Damage by 0.5, and increases damage multiplier by x1.5.', 4),
(5, 'Gives Isaac\'s tears a boomerang effect. (except in Repentance) +1.5 range, +1 tear falling speed, x1.6 shot speed multiplier. (in Repentance) 2x + 1.5 range, +1.5 damage, -1 luck, 1.6x shot speed multiplier.', 5),
(6, 'Grants +1.5 tears, but severely reduces range.', 6),
(7, '+1 damage. Isaac shoots blood tears.', 7),
(8, 'Spawns a familiar that follows Isaac around shooting tears that deal 3.5 damage. (in Repentance) He shoots more frequently than most familiars.', 8),
(9, 'Flies become harmless or less dangerous depending on the type.', 9),
(10, 'Spawns two Pretty Flies that block enemy shots and deal contact damage to flies.', 10),
(11, 'Gives Isaac an extra life. Upon death, he will respawn in the previous room with full health, after which 1up! will disappear.', 11),
(12, '(except in Repentance) Makes Isaac bigger. Adds one Red Heart Container, +0.3 Damage, x1.5 damage multiplier, +5.25 Range, +0.3 Speed, and restores all Health.\r\n(in Repentance) Makes Isaac bigger. Adds one Red Heart Container, +0.3 Damage, x1.5 damage multiplier, +2.5 Range, +0.3 Speed, and restores all Health.', 12),
(13, 'Isaac poisons enemies on contact. (except in Repentance) -0.1 speed. (in Repentance) +0.2 speed. (in Afterbirth and Afterbirth †) Poisoned enemies have a chance to drop a black heart when killed.', 13),
(14, '(except in Repentance) +0.6 speed, +5.25 range, +0.5 tear falling speed.\r\n(in Repentance) +0.3 speed, +2.5 range', 14),
(15, 'Grants Isaac one Red Heart container and fully restores Isaac\'s health.', 15),
(16, 'Grants 2 Red Heart containers and completely restores health.', 16),
(17, 'Gives Isaac 99 Keys.', 17),
(18, 'Gives Isaac 100 Pennies.', 18),
(19, 'Grants 10 Bombs.', 19),
(20, 'Grants flight.', 20),
(21, 'Reveals the locations and types of all special rooms on the map, except Secret Rooms and Super Secret Rooms.', 21),
(22, 'Grants one full Red Heart container. (in Repentance) Heals 1 additional Red Heart.', 22),
(23, 'Grants one full Red Heart container. (in Repentance) Heals 1 additional Red Heart.', 23),
(24, 'Grants one full Red Heart container. (in Repentance) Heals 1 additional Red Heart.', 24),
(25, 'Grants one full Red Heart container. (in Repentance) Heals 1 additional Red Heart.', 25),
(26, 'Grants one full Red Heart container. (in Repentance) Heals 1 additional Red Heart.', 26),
(27, 'Increases speed by 0.3.', 27),
(28, 'Increases speed by 0.3.', 28),
(29, '(except in Repentance) +5.25 range, +0.5 tear falling speed.\r\n(in Repentance) +2.5 range. Spawns 3-6 Blue Flies on pickup.', 29),
(30, '(except in Repentance) +5.25 range, +0.5 tear falling speed.\r\n(in Repentance) +2.5 range, enemies that touch Isaac take 12 damage.', 30),
(31, '(except in Repentance)+5.25 range, +0.5 tear falling speed.\r\n(in Repentance) +3.75 range. Spawns a Heart on pickup.', 31),
(32, 'Increases tears by 0.7.', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objects`
--

CREATE TABLE `objects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quality` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 = PASSIVE; 1 = ACTIVE',
  `item_pool` text NOT NULL,
  `description` text NOT NULL,
  `colors` text NOT NULL,
  `unlock` varchar(255) NOT NULL,
  `release` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `objects`
--

INSERT INTO `objects` (`id`, `name`, `quality`, `type`, `item_pool`, `description`, `colors`, `unlock`, `release`) VALUES
(1, 'THE SAD ONION', 3, 0, 'ITEM ROOM', 'TEARS', 'GREEN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(2, 'THE INNER EYE', 2, 0, 'ITEM ROOM', 'TEAR MODIFIER', 'WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(3, 'SPOON BENDER', 3, 0, 'ITEM ROOM', 'TEARS', 'GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(4, 'CRICKET\'S HEAD', 4, 0, 'ITEM ROOM', 'MANY STATS', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(5, 'MY REFLECTION', 2, 0, 'ITEM ROOM', 'TEAR MODIFIER,DAMAGE,LUCK', 'WHITE,GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(6, 'NUMBER ONE', 2, 0, 'ITEM ROOM', 'TEARS,RANGE', 'YELLOW', 'ALWAYS UNLOCKED', 'REBIRTH'),
(7, 'BLOOD OF THE MARTYR', 3, 0, 'ITEM ROOM,ANGEL ROOM', 'DAMAGE', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(8, 'BROTHER BOBBY', 1, 0, 'ITEM ROOM,DEVIL ROOM', 'FAMILIAR', 'BLUE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(9, 'SKATOLE', 0, 0, 'ARCADE SHELL GAME ONLY', 'FLYS', 'BLACK,RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(10, 'HALO OF FLIES', 2, 0, 'ITEM ROOM,KEY BEGGAR', 'FLY ORBITAL', 'BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(11, '1UP', 2, 0, 'SECRET ROOM', 'EXTRA LIFE', 'GREEN,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(12, 'MAGIC MUSHROOM', 4, 0, 'ITEM ROOM, MUSHROOMS', 'HP,DAMAGE,RANGE,SPEED,SIZE', 'RED,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(13, 'THE VIRUS', 2, 0, 'ITEM ROOM,DEMON BEGGAR,LUST MINIBOSS', 'SPEED,POISON TOUCH', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(14, 'ROID RAGE', 2, 0, 'ITEM ROOM,BOSS ROOM,DEMON BEGGAR', 'SPEED,RANGE,SHOT SPEED', 'GREEN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(15, '<3', 2, 0, 'ITEM ROOM,GLUTTONY MINIBOSS', 'HP', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(16, 'RAW LIVER', 2, 0, 'SECRET ROOM', 'HP', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(17, 'SKELETON KEY', 3, 0, 'ITEM ROOM,SECRET ROOM', 'KEYS', 'GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(18, 'A DOLLAR', 3, 0, 'UNIQUE', 'MONEY', 'GREEN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(19, 'BOOM!', 0, 0, 'ITEM ROOM', 'BOMBS', 'GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(20, 'TRANSCENDENCE', 3, 0, 'SECRET ROOM', 'FLY', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(21, 'THE COMPASS', 2, 0, 'SHOP,BEGGAR', 'MAP', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(22, 'LUNCH', 1, 0, 'BOSS ROOM,CHALLENGE ROOM,BEGGAR', 'HP', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(23, 'DINNER', 1, 0, 'BOSS ROOM,BEGGAR,CHALLENGE ROOM', 'HP', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(24, 'DESSERT', 1, 0, 'BOSS ROOM,BEGGAR,CHALLENGE ROOM', 'HP', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(25, 'BREAKFAST', 1, 0, 'BOSS ROOM,BEGGAR,CHALLENGE ROOM', 'HP', 'WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(26, 'ROTTEN MEAT', 1, 0, 'BOSS ROOM,BEGGAR,CHALLENGE ROOM', 'HP', 'GREEN,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(27, 'WOODEN SPOON', 1, 0, 'BOOS ROOM', 'SPEED', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(28, 'THE BELT', 1, 0, 'BOSS ROOM,GOLD/STONE CHEST', 'SPEED', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(29, 'MOM\'S UNDERWEAR', 1, 0, 'BOSS ROOM,CHALLENGE ROOM,GOLD/STONE CHEST,MOM\'S CHEST', 'RANGE,FLIES', 'PINK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(30, 'MOM\'S HEELS', 1, 0, 'BOSS ROOM,CHALLENGE ROOM, MOM\'S CHEST', 'RANGE,CONTACT DAMAGE', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(31, 'MOM\'S LIPSTICK', 1, 0, 'BOSS ROOM,CHALLENGE ROOM,MOM\'S CHEST', 'RANGE,HEARTS', 'RED,GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(32, 'WIRE COAT HANGER', 3, 0, 'BOSS ROOM,GOLD/STONE CHEST', 'TEARS', 'BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(33, 'THE BIBLE', 1, 1, 'SHOP,LIBRARY,ANGEL ROOM', 'FLY', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(34, 'THE BOOK OF BELIAL', 2, 1, 'LIBRARY,DEVIL ROOM', 'DAMAGE', 'BLACK,GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(35, 'THE NECRONOMICON', 1, 1, 'LIBRARY,SECRET ROOM,DEVIL ROOM', 'DAMAGE', 'BROWN', 'GAME PROGRESS', 'REBIRTH'),
(36, 'THE POOP', 0, 1, 'ITEM ROOM', 'POOP', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(37, 'MR. BOOM', 1, 1, 'ITEM ROOM,WRATH MINIBOSS,BOMB BEGGAR', 'BOOM', 'GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(38, 'TAMMY\'S HEAD', 2, 1, 'ITEM ROOM,GOLD CHEST', 'TEARS', 'WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(39, 'MOM\'S BRA', 1, 1, 'ITEM ROOM,CHALLENGE ROOM,MOM\'S CHEST', 'FREEZES', 'WHITE,BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(40, 'KAMIKAZE!', 0, 1, 'ITEM ROOM', 'BOOM', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(41, 'MOM\'S PAD', 0, 1, 'ITEM ROOM,CHALLENGE ROOM,MOM\'S CHEST', 'FEAR,FLIES', 'WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(42, 'BOB\'S ROTTEN HEAD', 1, 1, 'ITEM ROOM,SLOTH MINIBOSS', 'BOOMB,POISON', 'GREEN,BLACK,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(44, 'TELEPORT', 0, 1, 'ITEM ROOM', 'TELEPORT', 'BLUE,BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(45, 'YUM HEART', 1, 1, 'ITEM ROOM,SUPER LUST MINIBOSS,ULTRA SECRET ROOM', 'HEAL', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(46, 'LUCKY FOOT', 2, 0, 'ITEM ROOM,BEGGAR', 'LUCK,POSITIVE PILLS', 'WHITE,YELLOW', 'ALWAYS UNLOCKED', 'REBIRTH'),
(47, 'DOCTOR\'S REMOTE', 1, 1, 'ITEM ROOM', 'BOOMB', 'BLACK,GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(48, 'CUPID\'S ARROW', 3, 0, 'ITEM ROOM,CRANE GAME', 'PIERCING', 'GREY,RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(49, 'SHOOP DA WHOOP!', 2, 1, 'ITEM ROOM,ENVY MINIBOSS,SUPER ENVY MINIBOSS,CRANE GAME,ULTRA SECRET ROOM', 'DAMAGE,TEAR', 'RED,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(50, 'STEVEN', 3, 0, 'STEVEN BOSS', 'DAMAGE', 'BLACK', 'GAME PROGRESS', 'REBIRTH'),
(51, 'PENTAGRAM', 3, 0, 'BOSS ROOM,CURSE ROOM,DEVIL ROOM,DEMON BEGGAR,CRANE GAME,ULTRA SECRET ROOM', 'DAMAGE,CHANCE ANGEL/DEVIL', 'RED,BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(52, 'DR. FETUS', 4, 0, 'ITEM ROOM', 'TEAR,BOOMB', 'WHITE,BLACK', 'GAME PROGRESS', 'REBIRTH'),
(53, 'MAGNETO', 1, 0, 'ITEM ROOM,ULTRA SECRET ROOM', 'PICKUPS', 'RED,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(54, 'TREASURE MAP', 2, 0, 'SHOP,BEGGAR', 'MAPING', 'BROWN,BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(55, 'MOM\'S EYE', 1, 0, 'ITEM ROOM,CHALLENGE ROOM,MOM\'S CHEST,OLD CHEST', 'TEAR', 'WHITE,RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(56, 'LEMON MISHAP', 0, 1, 'ITEM ROOM', 'CREEP', 'YELLOW', 'ALWAYS UNLOCKED', 'REBIRTH'),
(57, 'DISTANT ADMIRATION', 2, 0, 'ITEM ROOM,KEY BEGGAR', 'FLIE', 'BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(58, 'BOOK OF SHADOWS', 3, 1, 'ITEM ROOM,LIBRARY', 'INVULNERABILITY', 'WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(60, 'THE LADDER', 1, 0, 'SHOP', 'WALK', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(62, 'CHARM OF THE VAMPIRE', 1, 0, 'ITEM ROOM', 'DAMAGE,HEAL', 'BLACK', 'ALWAYS UNLOCKED', 'REBIRTH'),
(63, 'THE BATTERY', 2, 0, 'SHOP', 'BATTERY', 'GREY,BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(64, 'STEAM SALE', 2, 0, 'SHOP,GREED MINIBOSS,SHOPKEEPER', 'DISCOUNT', 'PINK,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(65, 'ANARCHIST COOKBOOK', 1, 1, 'ITEM ROOM,LIBRARY,PRIDE MINIBOSS', 'TROLL BOOMBS', 'WHITE,RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(66, 'THE HOURGLASS', 1, 1, 'ITEM ROOM', 'SLOW', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(67, 'SISTER MAGGY', 1, 0, 'ITEM ROOM,DEVIL ROOM,ULTRA SECRET ROOM', 'FAMILIAR', 'RED', 'ALWAYS UNLOCKED', 'REBIRTH'),
(68, 'TECHNOLOGY', 3, 0, 'ITEM ROOM,CRANE GAME', 'TEAR,LASER', 'RED,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH'),
(69, 'CHOCOLATE MILK', 3, 0, 'ITEM ROOM', 'CHARGE,TEAR', 'BROWN', 'ALWAYS UNLOCKED', 'REBIRTH'),
(70, 'GROWTH HORMONES', 3, 0, 'BOSS ROOM,DEMON BEGGAR', 'DAMAGE,SPEED', 'PURPLE,GREY', 'ALWAYS UNLOCKED', 'REBIRTH'),
(71, 'MINI MUSH', 2, 0, 'ITEM ROOM,MUSH', 'SPEED,RANGE', 'BLUE,WHITE', 'ALWAYS UNLOCKED', 'REBIRTH');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargas_activa`
--
ALTER TABLE `cargas_activa`
  ADD PRIMARY KEY (`id_carga`),
  ADD KEY `id_object` (`id_object`);

--
-- Indices de la tabla `descripcion_detallada_objeto`
--
ALTER TABLE `descripcion_detallada_objeto`
  ADD PRIMARY KEY (`id_descripcion`),
  ADD KEY `id_objeto` (`id_objeto`);

--
-- Indices de la tabla `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargas_activa`
--
ALTER TABLE `cargas_activa`
  MODIFY `id_carga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descripcion_detallada_objeto`
--
ALTER TABLE `descripcion_detallada_objeto`
  MODIFY `id_descripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cargas_activa`
--
ALTER TABLE `cargas_activa`
  ADD CONSTRAINT `cargas_activa_ibfk_1` FOREIGN KEY (`id_object`) REFERENCES `objects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descripcion_detallada_objeto`
--
ALTER TABLE `descripcion_detallada_objeto`
  ADD CONSTRAINT `descripcion_detallada_objeto_ibfk_1` FOREIGN KEY (`id_objeto`) REFERENCES `objects` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
