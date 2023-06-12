-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Cze 2023, 19:53
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `lang`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `nazwa`, `createdAt`, `updatedAt`) VALUES
(1, 'zwierzęta', '2023-06-12 19:33:09', '2023-06-12 19:33:09'),
(2, 'jedzenie', '2023-06-12 19:33:17', '2023-06-12 19:33:17'),
(3, 'kolory', '2023-06-12 19:34:51', '2023-06-12 19:34:51'),
(22, 'przymiotniki', '2023-06-12 17:46:26', '2023-06-12 17:46:26');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `jezyk` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `languages`
--

INSERT INTO `languages` (`id`, `jezyk`, `createdAt`, `updatedAt`) VALUES
(1, 'hiszpański', '2023-06-10 22:09:44', '2023-06-10 22:09:44'),
(2, 'angielski', '2023-06-10 20:33:08', '2023-06-10 20:33:08'),
(3, 'koreański', '2023-06-10 20:33:13', '2023-06-10 20:33:13'),
(4, 'niemiecki', '2023-06-10 20:33:21', '2023-06-10 20:33:21');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sets`
--

CREATE TABLE `sets` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(255) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `jezyk` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `sets`
--

INSERT INTO `sets` (`id`, `nazwa`, `owner`, `jezyk`, `createdAt`, `updatedAt`) VALUES
(1, 'zestaw I', '1', 2, '2023-06-12 19:32:34', '2023-06-12 19:32:34'),
(2, 'zestaw II', '2', 1, '2023-06-12 19:32:51', '2023-06-12 19:32:51'),
(3, 'zestaw III', '1', 1, '2023-06-12 17:46:39', '2023-06-12 17:46:39');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `words`
--

CREATE TABLE `words` (
  `id` int(11) NOT NULL,
  `slowko` varchar(255) NOT NULL,
  `tlumaczenie` varchar(255) NOT NULL,
  `jezyk` int(11) NOT NULL,
  `zestaw` int(11) NOT NULL,
  `kategoria` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `words`
--

INSERT INTO `words` (`id`, `slowko`, `tlumaczenie`, `jezyk`, `zestaw`, `kategoria`, `createdAt`, `updatedAt`) VALUES
(1, 'la primavera', 'wiosna', 1, 1, 1, NULL, '2023-05-15 21:49:58'),
(2, 'el verano', 'lato', 1, 1, 1, NULL, NULL),
(3, 'el otoño', 'jesień', 1, 1, 1, NULL, NULL),
(4, 'el invierno', 'zima', 1, 1, 1, NULL, NULL),
(5, 'enero', 'styczeń', 1, 1, 1, NULL, NULL),
(6, 'febrero', 'luty', 1, 1, 1, NULL, NULL),
(7, 'marzo', 'marzec', 1, 1, 1, NULL, NULL),
(8, 'abril', 'kwiecień', 1, 1, 1, NULL, NULL),
(9, 'mayo', 'maj', 1, 1, 1, NULL, NULL),
(10, 'junio', 'czerwiec', 1, 1, 1, NULL, NULL),
(11, 'julio', 'lipiec', 1, 1, 1, NULL, NULL),
(12, 'agosto', 'sierpień', 1, 1, 1, NULL, NULL),
(13, 'septiembre', 'wrzesień', 1, 1, 1, NULL, NULL),
(14, 'octubre', 'październik', 1, 1, 1, NULL, NULL),
(15, 'noviembre', 'listopad', 1, 1, 1, NULL, NULL),
(16, 'diciembre', 'grudzień', 1, 1, 1, NULL, NULL),
(17, 'en primavera', 'na wiosnę/wiosną', 1, 1, 1, NULL, NULL),
(18, 'en verano', 'w lecie/latem', 1, 1, 1, NULL, NULL),
(19, 'en otoño', 'na jesień/jesienią', 1, 1, 1, NULL, NULL),
(20, 'en invierno', 'w zimie/zimą', 1, 1, 1, NULL, NULL),
(21, 'rojo', 'czerwony', 1, 1, 2, NULL, NULL),
(22, 'azul', 'niebieski', 1, 1, 2, NULL, NULL),
(23, 'verde', 'zielony', 1, 1, 2, NULL, NULL),
(24, 'amarillo', 'żółty', 1, 1, 2, NULL, NULL),
(25, 'rosa, rosado', 'różowy', 1, 1, 2, NULL, NULL),
(26, 'violeta, morado', 'fioletowy', 1, 1, 2, NULL, NULL),
(27, 'blanco', 'biały', 1, 1, 2, NULL, NULL),
(28, 'negro', 'czarny', 1, 1, 2, NULL, NULL),
(29, 'gris', 'szary', 1, 1, 2, NULL, NULL),
(30, 'naranja', 'pomarańczowy', 1, 1, 2, NULL, NULL),
(31, 'dorado', 'złoty', 1, 1, 2, NULL, NULL),
(32, 'plateado', 'srebrny', 1, 1, 2, NULL, NULL),
(33, 'marrón', 'brązowy', 1, 1, 2, NULL, NULL),
(34, 'claro', 'jasny', 1, 1, 2, NULL, NULL),
(35, 'oscuro', 'ciemny', 1, 1, 2, NULL, NULL),
(36, 'el gato', 'kot', 1, 1, 3, NULL, NULL),
(37, 'el perro', 'pies', 1, 1, 3, NULL, NULL),
(38, 'la rata', 'szczur', 1, 1, 3, NULL, NULL),
(39, 'el ratón', 'mysz', 1, 1, 3, NULL, NULL),
(40, 'el toro', 'byk', 1, 1, 3, NULL, NULL),
(41, 'la vaca', 'krowa', 1, 1, 3, NULL, NULL),
(42, 'la cabra', 'koza', 1, 1, 3, NULL, NULL),
(43, 'el caballo', 'koń', 1, 1, 3, NULL, NULL),
(44, 'el zorro', 'lis', 1, 1, 3, NULL, NULL),
(45, 'la araña', 'pająk', 1, 1, 3, NULL, NULL),
(46, 'la avispa', 'osa', 1, 1, 3, NULL, NULL),
(47, 'la abeja', 'pszczoła', 1, 1, 3, NULL, NULL),
(48, 'la cucaracha', 'karaluch', 1, 1, 3, NULL, NULL),
(49, 'la mariposa', 'motyl', 1, 1, 3, NULL, NULL),
(50, 'el conejo', 'królik', 1, 1, 3, NULL, NULL),
(51, 'el atún', 'tuńczyk', 1, 1, 3, NULL, NULL),
(52, 'la sardina', 'sardynka', 1, 1, 3, NULL, NULL),
(53, 'el tigre', 'tygrys', 1, 1, 3, NULL, NULL),
(54, 'la jirafa', 'żyrafa', 1, 1, 3, NULL, NULL),
(55, 'el gallo', 'kogut', 1, 1, 3, NULL, NULL),
(56, 'el pollo', 'kurczak', 1, 1, 3, NULL, NULL),
(57, 'el oso', 'niedźwiedź', 1, 1, 3, NULL, NULL),
(58, 'la rana', 'żaba', 1, 1, 3, NULL, NULL),
(59, 'la serpiente', 'wąż', 1, 1, 3, NULL, NULL),
(60, 'el león', 'lew', 1, 1, 3, NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`),
  ADD KEY `words_ibfk_1` (`jezyk`),
  ADD KEY `zestaw` (`zestaw`),
  ADD KEY `kategoria` (`kategoria`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT dla tabeli `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `sets`
--
ALTER TABLE `sets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `words`
--
ALTER TABLE `words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `words`
--
ALTER TABLE `words`
  ADD CONSTRAINT `words_ibfk_1` FOREIGN KEY (`jezyk`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `words_ibfk_2` FOREIGN KEY (`zestaw`) REFERENCES `sets` (`id`),
  ADD CONSTRAINT `words_ibfk_3` FOREIGN KEY (`kategoria`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
