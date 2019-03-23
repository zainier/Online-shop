-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2019 at 10:05 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sklep`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `AdministratorID` int(11) NOT NULL,
  `PESELadministrator` varchar(11) NOT NULL,
  `AdministratorName` varchar(15) NOT NULL,
  `AdministratorSurname` varchar(15) NOT NULL,
  `AdministratorSex` varchar(1) NOT NULL,
  `AdministratorPhoneNumber` varchar(15) DEFAULT NULL,
  `AdministratorEmail` varchar(30) NOT NULL,
  `AdministratorPassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`AdministratorID`, `PESELadministrator`, `AdministratorName`, `AdministratorSurname`, `AdministratorSex`, `AdministratorPhoneNumber`, `AdministratorEmail`, `AdministratorPassword`) VALUES
(1, '9606101366', 'Tomasz', 'Kowalski', '', '530538339', 'tomasz.kowalski@gmail.com', 'damien47'),
(2, '97110710921', 'Denys', 'Khmelnytskyi ', '', '576884210', 'denys.khmelnytskyi @gmail.com', 'denysDenys'),
(3, '00000000001', 'Rostyslav', 'Tymkiv', 'M', '796241212', 'damien5830@gmail.com', 'r1s2i3');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_polish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `CategoryName`) VALUES
(1, 'Wypieki'),
(2, 'Swieze'),
(3, 'Mrozone'),
(4, 'Gotowe posilki'),
(5, 'Napoje'),
(6, 'Nabial'),
(7, 'Rozrywka'),
(8, 'Zdrowie i uroda'),
(9, 'Artykuly spozywcze'),
(10, 'Cater'),
(11, 'Catttt'),
(12, 'Catttt'),
(13, 'Catttt');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `CityID` int(11) NOT NULL,
  `CityName` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`CityID`, `CityName`) VALUES
(1, 'Bielawa'),
(2, 'Bierutów'),
(3, 'Bogatynia'),
(4, 'Boguszów-Gorce'),
(5, 'Boleslawiec'),
(6, 'Bolków'),
(7, 'Brzeg Dolny'),
(8, 'Bystrzyca'),
(9, 'Klodzka'),
(10, 'Chocianów'),
(11, 'Chojnów'),
(12, 'Dlugoleka'),
(13, 'Duszniki-Zdrój'),
(14, 'Dzierzoniów'),
(15, 'Glogów'),
(16, 'Gluszyca'),
(17, 'Goerlitz'),
(18, 'Góra'),
(19, 'Gryfów Slaski'),
(20, 'Jawor'),
(21, 'Jelcz-Laskowice'),
(22, 'Jelenia Góra'),
(23, 'Kamienna Góra'),
(24, 'Karpacz'),
(25, 'Katy Wroclawskie'),
(26, 'Klodzko'),
(27, 'Kowary'),
(28, 'Kudowa-Zdrój'),
(29, 'Ladek-Zdrój'),
(30, 'Legnica'),
(31, 'Luban'),
(32, 'Lubawka'),
(33, 'Lubin'),
(34, 'Lwówek Slaski'),
(35, 'Milicz'),
(36, 'Nowa Ruda'),
(37, 'Oborniki Slaskie'),
(38, 'Olesnica '),
(39, 'Piechowice'),
(40, 'Piensk'),
(41, 'Pieszyce'),
(42, 'Pilawa Górna'),
(43, 'Polanica-Zdrój'),
(44, 'Polkowice'),
(45, 'Przemków'),
(46, 'Siechnice'),
(47, 'Sobótka'),
(48, 'Stronie Slaskie'),
(49, 'Strzegom'),
(50, 'Strzelin'),
(51, 'Syców'),
(52, 'Szczawno-Zdrój'),
(53, 'Szklarska Poreba'),
(54, 'Sroda Slaska'),
(55, 'Swidnica'),
(56, 'Swiebodzice'),
(57, 'Swieradów-Zdrój'),
(58, 'Trzebnica'),
(59, 'Twardogóra'),
(60, 'Walbrzych'),
(61, 'Wolów'),
(62, 'Wroclaw'),
(63, 'Zabkowice'),
(64, 'Slaskie'),
(65, 'Zgorzelec'),
(66, 'Ziebice'),
(67, 'Zlotoryja'),
(68, 'Zarów'),
(69, 'Zmigród'),
(70, 'Olawa');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `ClientName` varchar(30) CHARACTER SET latin1 NOT NULL,
  `ClientSurname` varchar(30) CHARACTER SET latin1 NOT NULL,
  `ClientSex` varchar(1) CHARACTER SET latin1 DEFAULT NULL,
  `ClientAddress` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `ClientPostalCode` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `ClientCityID` int(11) DEFAULT NULL,
  `ClientPhoneNumber` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Password` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_polish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`ClientID`, `ClientName`, `ClientSurname`, `ClientSex`, `ClientAddress`, `ClientPostalCode`, `ClientCityID`, `ClientPhoneNumber`, `Email`, `Password`) VALUES
(1, 'Client', 'Example', 'M', 'ul. Wittiga 5', '51-628', 62, '796241212', 'client@gmail.com', 'qwerty'),
(3, 'Zuzanna', 'Gliwa', 'K', 'ul. Brzoskwiniowa 23', '59-850', 20, '881768753', 'eqynnosiss8323@yopmail.com', '7jscVKRHtU\r'),
(4, 'Stanislaw', 'Klopotowski', 'M', 'ul. Zelazna 83', '51-628', 49, '790043596', 'ayoubmagicien@tryprice.co', 'X2EgqhGcRw\r'),
(5, 'Tadeusz', 'Napieralski', 'M', 'ul. Slaska 114', '58-170', 4, '699243378', 'marm1939@rhyta.com', 'G7xSzCK2cw\r'),
(6, 'Kazimierz', 'Francuz', 'M', 'ul. Dywizjonu 3', '55-130', 35, '699047660', 'oppennollutt8336@yopmail.com', 'tJekmzuCHo\r'),
(7, 'Paulina', 'Szafran', 'K', 'ul. Robotnicza 121', '54-512', 14, '782971701', 'erreffeffac0656@yopmail.com', 'W7P2MDHTgZ\r'),
(8, 'Teresa', 'Brozyna', 'K', 'ul. Poprzeczna 144', '54-517', 69, '722956621', 'ennekige4043@yopmail.com', 'QoxMEwQQWt\r'),
(9, 'Ewelina', 'Konieczka', 'K', 'ul. Robotnicza 35', '54-067', 32, '789866014', 'dapamela1221@yopmail.com', 'LPBqzoqtqx\r'),
(10, 'Daniel', 'Pacan', 'M', 'ul. Bernardynska 136', '54-049', 16, '733577828', 'ehessony-3265@yopmail.com', 'fL4ucfymze\r'),
(11, 'Maria', 'Motyka', 'K', 'ul. Polna 145', '58-330', 38, '729400267', 'effopijele-5307@yopmail.com', 'bygdofZc9P\r'),
(12, 'Andrzej', 'Plawecki', 'M', 'ul. Lapanowska 83', '58-550', 1, '787677202', 'deffecajab-8023@yopmail.com', 'LP3H38Djo2\r'),
(13, 'Jerzy', 'Luty', 'M', 'ul. Michlewskiej Stefanii 61', '58-520', 62, '727713742', 'erroxipiss-2399@yopmail.com', 'aPZCHCjGpj\r'),
(14, 'Ryszard', 'Beben', 'M', 'ul. Malinowa 133', '59-930', 3, '884042936', 'onnefufedo-2186@yopmail.com', 'mzxMGZkLH7\r'),
(15, 'Janina', 'Sabat', 'K', 'ul. Pocztowa 15', '59-123', 43, '604637297', 'typiqurrec-3991@yopmail.com', 'ck5TXSyov7\r'),
(16, 'Ewa', 'Kamionka', 'K', 'ul. Klaudyny 137', '52-328', 53, '889191525', 'kugussexille-3528@yopmail.com', 'B5m38u6QAT\r'),
(17, 'Helena', 'Okrasa', 'K', 'ul. Bratków 56', '58-613', 38, '722818297', 'uddulottettu-1901@yopmail.com', 'ynTwy2Wjc6\r'),
(18, 'Adam', 'Fialkowski', 'M', 'ul. Lutycka 48', '57-352', 44, '798209462', 'acuzippin-3264@yopmail.com', 'PPPk9dC7Zx\r'),
(19, 'Zdzislaw', 'Makowiecki', 'M', 'ul. Szpitalna 133', '54-958', 67, '699031488', 'jaddettuho-0821@yopmail.com', 'D32qvykZPk\r'),
(20, 'Miroslaw', 'Jaszczyk', 'M', 'ul. Ludwika 69', '53-823', 66, '795211764', 'ymillulla-5074@yopmail.com', 'kN7DJ557MG\r'),
(21, 'Piotr', 'Baranski', 'M', 'ul. Gliwicka 73', '51-628', 68, '783760384', 'esulyddiff-8220@yopmail.com', 'B3WRMvuP2T\r'),
(22, 'Jadwiga', 'Goluch', 'K', 'ul. Siedleckiego Waclawa 18', '58-190', 54, '883488499', 'kolarippe-4249@yopmail.com', 'L6ndUgbDGq\r'),
(23, 'Zbigniew', 'Dobrosielski', 'M', 'ul. Wyrobka Zygmunta 100', '57-834', 33, '722153589', 'ivovekemm-7070@yopmail.com', 'psDUvMqZjB\r'),
(24, 'Kazimierz', 'Trojan', 'M', 'ul. Malopolska 76', '50-112', 41, '883466451', 'kuwomotyg-0493@yopmail.com', '7m5tBgowvP\r'),
(25, 'Aleksandra', 'Lukaszek', 'K', 'ul. Wojciechowskiego Stanislawa 132', '53-234', 5, '600635271', 'qassuzifefu-6796@yopmail.com', 'QGkBkDjVHq\r'),
(26, 'Rostyslav', 'Tymkiv', 'M', 'Wittiga 4', '51-628', 3, '721955543', 'damien5830@gmai.com', '123123'),
(27, 'Rostyslav', 'TYMKIV', 'M', 'wittigaa', '51-628', 32, '721955543', 'damien49@sdfsf.com', '456456'),
(33, 'Kamil', 'Nowak', 'M', 'asdasd', '55-009', 6, '4334534', 'kamil@gmai.com', '$2y$10$.doAfHHQxDY4uTY.Eb677.FQ8ezyQBuJuaEGpDHdeljr9Me455NiC'),
(34, 'Artem', 'Zainier', 'M', 'Strutynska 31/61', '33-003', 28, '793228425', 'artemzainer@gmail.com', '$2y$10$.w6aJywF.P6FIabHarMqy..uNKAKQsYn8MALdcRJB9NlqfjJdYNVi'),
(35, 'asdasd', 'asdasd', 'M', 'asdasd', '44-999', 6, 'asdasdad', 'alina.kowalska@gmail.com', '$2y$10$S.LQopjFTnlAAP.fpOBEJulQTsyzEVnbdf8OLv5GtTW2lhxYwHg8O'),
(36, 'asdasd', 'asdasd', 'M', 'asdasd', '44-000', 5, 'asdasd', 'q@gmail.com', '$2y$10$PzctTpd/otu.0S.TF4ip4OBFU8jyWRQ/dUlXA6tifP9meDKUIgz36');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ProdID` int(11) DEFAULT NULL,
  `ProductCount` smallint(6) DEFAULT NULL,
  `DateTime` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`OrderItemID`, `OrderID`, `ProdID`, `ProductCount`, `DateTime`) VALUES
(5, '2018-01-22 11:12:46_1334681703', 41, 7, '2018-01-23 02:33:59'),
(6, '2018-01-22 11:12:46_1334681703', 12, 1, '2018-01-23 02:44:20'),
(7, '2018-01-23 03:12:12_677366733', 1, 7, '2018-01-23 03:14:24'),
(8, '2018-01-23 03:12:12_677366733', 32, 10, '2018-01-23 03:14:30'),
(9, '2018-01-23 03:14:41_1996178870', 31, 1, '2018-01-23 03:15:36'),
(10, '2018-01-23 03:14:41_1996178870', 2, 1, '2018-01-23 03:20:26'),
(11, '2018-01-23 03:20:30_1896079156', 1, 1, '2018-01-23 03:21:04'),
(12, '2018-01-23 03:21:07_902500692', 1, 1, '2018-01-23 03:23:02'),
(13, '2018-01-23 03:23:17_540175329', 2, 1, '2018-01-23 03:23:35'),
(14, '2018-01-23 03:23:36_1181566230', 39, 7, '2018-01-23 04:40:12'),
(15, '2018-01-23 03:23:36_1181566230', 11, 1, '2018-01-23 04:40:15'),
(17, '2018-01-23 04:40:21_846013929', 64, 3, '2018-01-23 05:36:16'),
(18, '2018-11-02 06:27:33_582840568', 20, 0, '2018-11-02 06:27:33'),
(19, '2018-11-02 06:27:33_582840568', 40, 1, '2018-11-02 06:28:06'),
(22, '2018-11-02 06:56:47_683371446', 74, 1, '2018-11-02 07:12:15'),
(23, '2018-11-02 06:56:47_683371446', 89, 1, '2018-11-02 07:12:23'),
(24, '2018-11-03 06:29:47_480053685', 9, 4, '2018-11-03 06:29:47'),
(25, '2018-11-03 06:29:47_480053685', 33, 2, '2018-11-03 06:29:58'),
(27, '2018-11-09 01:22:08_876663934', 81, 1, '2018-11-09 01:23:31'),
(28, '2018-11-09 01:22:08_876663934', 82, 1, '2018-11-09 01:23:33'),
(29, '2018-11-09 01:22:08_876663934', 42, 1, '2018-11-09 01:23:35'),
(30, '2018-11-13 07:32:33_1675776982', 1, 1, '2018-11-13 07:34:16'),
(31, '2018-11-13 07:32:33_1675776982', 2, 1, '2018-11-13 07:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `ClientIDf` int(11) DEFAULT NULL,
  `WorkerIDf` int(11) DEFAULT NULL,
  `TotalValue` double DEFAULT NULL,
  `OrderDateTime` varchar(20) DEFAULT NULL,
  `Confirmed` int(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `ClientIDf`, `WorkerIDf`, `TotalValue`, `OrderDateTime`, `Confirmed`) VALUES
('2018-01-22 11:12:46_1334681703', 18, 1, 19.83, '2018-01-23 03:12:12', 1),
('2018-01-23 03:12:12_677366733', NULL, 1, 57.1, '2018-01-23 03:14:41', 1),
('2018-01-23 03:14:41_1996178870', NULL, 1, 5.83, '2018-01-23 03:20:30', 2),
('2018-01-23 03:20:30_1896079156', NULL, 1, 2, '2018-01-23 03:21:07', 1),
('2018-01-23 03:21:07_902500692', NULL, 1, 2, '2018-01-23 03:23:04', 2),
('2018-01-23 03:23:17_540175329', NULL, 1, 1.99, '2018-01-23 03:23:36', 2),
('2018-01-23 03:23:36_1181566230', NULL, 1, 86.43, '2018-01-23 04:40:21', 2),
('2018-01-23 04:40:21_846013929', NULL, 1, 8.97, '2018-01-23 05:36:26', 2),
('2018-11-02 06:27:33_582840568', NULL, 1, 4.79, '2018-11-02 06:28:13', 1),
('2018-11-02 06:56:47_683371446', NULL, 1, 5.04, '2018-11-02 07:12:26', 2),
('2018-11-03 06:29:47_480053685', 17, NULL, 27.52, '2018-11-03 06:30:07', 0),
('2018-11-09 01:10:28_1132133439', NULL, 1, 0, '2018-11-09 01:22:08', 2),
('2018-11-09 01:22:08_876663934', 9, 1, 10.04, '2018-11-09 01:23:41', 1),
('2018-11-13 07:32:33_1675776982', 20, 1, 3.99, '2018-11-13 07:35:02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `WarehouseDeliveryID` int(11) DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `ProductName` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `NajlepszaOferta` char(1) COLLATE utf8_polish_ci DEFAULT NULL,
  `UnitOfMeasurement` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `Manufacturer` varchar(50) COLLATE utf8_polish_ci DEFAULT NULL,
  `ProductValue` double DEFAULT NULL,
  `AmountAvailable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `WarehouseDeliveryID`, `CategoryID`, `ProductName`, `NajlepszaOferta`, `UnitOfMeasurement`, `Manufacturer`, `ProductValue`, `AmountAvailable`) VALUES
(1, 1, 1, 'Donat', NULL, 'szt', 'Mocna Piekarnia', 2, 101),
(2, 1, 1, 'Bagietka czosnkowa', NULL, 'szt', 'Mocna Piekarnia', 1.99, 102),
(3, 1, 1, 'Bułka poranna', NULL, 'szt', 'Dobry Chleb', 0.2, 1000),
(4, 1, 1, 'Pączek', NULL, 'szt', 'Mocna Piekarnia', 3, 300),
(5, 1, 1, 'Mini pizza', NULL, 'szt', 'Mocna Piekarnia', 4, 300),
(6, 1, 1, 'Chleb żytni', NULL, 'szt', 'Dobry Chleb', 2.5, 500),
(7, 1, 1, 'Chleb biały', NULL, 'szt', 'Dobry Chleb', 1.99, 1000),
(8, 1, 1, 'Ciastko z owocami', NULL, 'szt', 'Piekarnia Magdy', 2.3, 300),
(9, 1, 1, 'Parówka w cieście', '1', 'szt', 'Piekarnia Magdy', 4.5, 300),
(10, 1, 1, 'Chleb słowiański', NULL, 'szt', 'Piekarnia Magdy', 3.2, 100),
(11, 1, 2, 'Kapusta pekińska', NULL, 'kg', 'Polskie Warzywka', 2.5, 31),
(12, 1, 2, 'Ogórki gruntowe', NULL, 'kg', 'Polskie Warzywka', 8, 20),
(13, 1, 2, 'Pomidory malinowe', '1', 'kg', 'Polskie Warzywka', 1.7, 32),
(14, 1, 2, 'Jabłka', NULL, 'kg', 'Polskie Warzywka', 1.8, 40),
(15, 1, 2, 'Grusze', NULL, 'kg', 'Polskie Warzywka', 2.7, 20),
(16, 1, 2, 'Cebula', NULL, 'kg', 'Polskie Warzywka', 0.7, 10),
(17, 1, 2, 'Banany', NULL, 'kg', 'Sloneczny Ogród', 4, 40),
(18, 1, 2, 'Ziemniaki', NULL, 'kg', 'Polskie Warzywka', 0.5, 100),
(19, 1, 2, 'Buraki', NULL, 'kg', 'Polskie Warzywka', 0.8, 30),
(20, 1, 2, 'Pomarańcze', '1', 'kg', 'Sloneczny Ogród', 4, 30),
(21, 1, 3, 'Groszek zielony', NULL, 'szt', 'Hortex', 3.29, 100),
(22, 1, 3, 'Pierś gęsia', NULL, 'kg', 'Indykpol', 23.98, 20),
(23, 1, 3, 'Pierogi ruskie', NULL, 'szt', 'Nordis', 5.6, 50),
(24, 1, 3, 'Filet z mintaja', '1', 'kg', 'Frosta', 17.22, 15),
(25, 1, 3, 'Paluszki rybne', NULL, 'szt', 'Nordis', 8.8, 80),
(26, 1, 3, 'Frytki Original', NULL, 'szt', 'Aviko', 3.69, 40),
(27, 1, 3, 'Owoce morza', '1', 'kg', 'Abramczyk', 14, 5),
(28, 1, 3, 'Uszka z kapustą i grzybami', '4', 'szt', 'Anita', 7.38, 20),
(29, 1, 3, 'Lody waniliowe z wiśniami', NULL, 'szt', 'Nordis', 5.99, 100),
(30, 1, 3, 'Lody rożek truskawkowy', NULL, 'szt', 'Coral', 1.64, 200),
(31, 1, 4, 'Zupa gulaszowa', NULL, 'szt', 'Profi', 3.84, 101),
(32, 1, 4, 'Leczo pieczarkowe', '1', 'szt', 'Lubnica', 4.31, 150),
(33, 1, 4, 'Goląbki w sosie pomidorowym', NULL, 'szt', 'Pudliszki', 4.76, 150),
(34, 1, 4, 'Koncentrat barszczu czerwonego', NULL, 'szt', 'Krakus', 3.28, 150),
(35, 1, 4, 'Sos spaghetti', NULL, 'szt', 'Lowicz', 5.99, 150),
(36, 1, 4, 'Pieczeń rzymska', NULL, 'szt', 'Sokolow', 4.88, 100),
(37, 1, 4, 'Flaki po zamojsku', '1', 'szt', 'Zagloba', 5.61, 100),
(38, 1, 4, 'Gotowe danie z kurczakiem', NULL, 'szt', 'U Jedrusia', 5.99, 100),
(39, 1, 4, 'Kapusta postna z grzybami', NULL, 'szt', 'Senior Smaccini', 11.99, 47),
(40, 1, 4, 'Sos boloński z mięsem', NULL, 'szt', 'Senior Smaccini', 4.79, 100),
(41, 1, 5, 'Woda Niegazowana', '1', 'szt', 'Zywiec Zdrój', 1.69, 400),
(42, 1, 5, 'Woda Gazowana', NULL, 'szt', 'Zywiec Zdrój', 1.69, 400),
(43, 1, 5, 'Sok pomarańczowy', '1', 'szt', 'Tymbark', 2.99, 300),
(44, 1, 5, 'Coca-Cola', NULL, 'szt', 'Coca-Cola', 4.49, 300),
(45, 1, 5, 'Syrop Malinowy', NULL, 'szt', 'Herbapol', 3.59, 100),
(46, 1, 5, 'Sok Multiwitamina', NULL, 'szt', 'Tymbark', 2.99, 200),
(47, 1, 5, 'Sok Banan Marchew Jabłko', NULL, 'szt', 'Kubus', 2.49, 500),
(48, 1, 5, 'Sok pomidorowy', NULL, 'szt', 'Dawtona', 1.49, 300),
(49, 1, 5, 'Sprite', NULL, 'szt', 'Sprite', 4.49, 300),
(50, 1, 5, 'Pepsi', NULL, 'szt', 'Pepsi', 4.69, 200),
(51, 1, 6, 'Mleko UHT', NULL, 'szt', 'Mlekovita', 2.49, 300),
(52, 1, 6, 'Masło Extra', NULL, 'szt', 'Mlekovita', 6.99, 300),
(53, 1, 6, 'Jogurt Naturalny', '1', 'szt', 'Zott', 1.29, 500),
(54, 1, 6, 'Serek wiejski', NULL, 'szt', 'Piatnica', 2.19, 500),
(55, 1, 6, 'Śmietana do zup 18%', NULL, 'szt', 'Piatnica', 1.59, 500),
(56, 1, 6, 'Ser Królewski', NULL, 'szt', 'Sierpc', 3.99, 300),
(57, 1, 6, 'Ser żółty Gauda', NULL, 'szt', 'Hochland', 3.79, 300),
(58, 1, 6, 'Twaróg Półtłusty', '1', 'szt', 'Mlekpol', 3.69, 200),
(59, 1, 6, 'Ser Mozzarella', NULL, 'szt', 'Galbani', 3.99, 100),
(60, 1, 6, 'Jogurt Jagoda', NULL, 'szt', 'Jogobella', 1.39, 500),
(61, 1, 7, 'Czasopismo Inspiracje', NULL, 'szt', 'Inspiracje', 5, 200),
(62, 1, 7, 'Gazeta Wyborcza', NULL, 'szt', 'Wyborcza', 3.99, 200),
(63, 1, 7, 'Czytanka dla dzieci', '1', 'szt', 'Centrum edukacji', 6.99, 200),
(64, 1, 7, 'Zabawka piłka', '1', 'szt', 'Białe słońce', 2.99, 303),
(65, 1, 7, 'Kupon Lotto', NULL, 'szt', 'Awantura', 5, 500),
(66, 1, 7, 'Książka Przepisy', NULL, 'szt', 'Centrum edukacji', 7, 300),
(67, 1, 7, 'Krzyżówki łamigłówki', NULL, 'szt', 'Blok 1 Juniora', 3.99, 300),
(68, 1, 7, 'Gra planszowa Monopoly', NULL, 'szt', 'Hasbro', 50, 10),
(69, 1, 7, 'Zawieszka na torebkę', NULL, 'szt', 'Maly krasnal', 1.5, 500),
(70, 1, 7, 'Smycz na klucze', NULL, 'szt', 'Maly krasnal', 1.99, 300),
(71, 1, 8, 'Chusteczki kosmetyczne', '1', 'szt', 'Regina', 3.89, 200),
(72, 1, 8, 'Mydło w płynie', NULL, 'szt', 'Palmolive', 6, 100),
(73, 1, 8, 'Pasta do zębów', NULL, 'szt', 'Elmex', 11.99, 200),
(74, 1, 8, 'Gąbka do kąpieli', NULL, 'szt', 'For your Beauty', 2.19, 201),
(75, 1, 8, 'Żel pod prysznic', NULL, 'szt', 'Fresh juice', 12.99, 50),
(76, 1, 8, 'Szampon', '1', 'szt', 'Timotei', 9.49, 50),
(77, 1, 8, 'De-makijaż', NULL, 'szt', 'Ziaja', 5.99, 100),
(78, 1, 8, 'Maszynka do golenia', NULL, 'szt', 'Gillette', 3.19, 100),
(79, 1, 8, 'Krem Uniwersalny', NULL, 'szt', 'Nevea', 4.29, 100),
(80, 1, 8, 'Mydło kosmetyczne', '1', 'szt', 'Palmolive', 1.59, 100),
(81, 1, 9, 'Olej słonecznikowy', NULL, 'szt', 'Bartek', 4.99, 200),
(82, 1, 9, 'Kasza gryczana', NULL, 'szt', 'Risana', 3.36, 500),
(83, 1, 9, 'Makaron muszle', '1', 'szt', 'PastaZara', 5, 500),
(84, 1, 9, 'Kukurudza w puszce', NULL, 'szt', 'Bonduelle', 3.2, 200),
(85, 1, 9, 'Ryż długoziarnisty', NULL, 'szt', 'Risana', 2.99, 300),
(86, 1, 9, 'Ketczup pikantny', NULL, 'szt', 'Wroclawek', 3.88, 100),
(87, 1, 9, 'Majonez', NULL, 'szt', 'Winiary', 7.99, 150),
(88, 1, 9, 'Ciastka', NULL, 'szt', 'HIT', 4.79, 500),
(89, 1, 9, 'Cukierki', '1', 'szt', 'Toffino', 2.85, 401),
(90, 1, 9, 'Szprot w sosie pomidorowym', NULL, 'szt', 'King Oscar', 3.98, 200),
(104, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12),
(105, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12),
(106, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12),
(107, NULL, 8, 'Banany', NULL, NULL, NULL, 1, 12),
(108, NULL, 3, 'bbbb', NULL, NULL, NULL, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `warehousedeliverers`
--

CREATE TABLE `warehousedeliverers` (
  `REGON` varchar(9) CHARACTER SET latin1 NOT NULL,
  `NIP` varchar(10) CHARACTER SET latin1 NOT NULL,
  `DelivererName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `DelivererAddress` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `DelivererCityID` int(2) DEFAULT NULL,
  `DelivererPostalCode` varchar(10) CHARACTER SET latin1 NOT NULL,
  `DelivererPhoneNumber` varchar(15) CHARACTER SET latin1 NOT NULL,
  `DelivererEmail` varchar(30) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `warehousedeliverers`
--

INSERT INTO `warehousedeliverers` (`REGON`, `NIP`, `DelivererName`, `DelivererAddress`, `DelivererCityID`, `DelivererPostalCode`, `DelivererPhoneNumber`, `DelivererEmail`) VALUES
('026776766', '2510892872', 'Sp.zoo \"Super Owca\"', 'Pl. Staszica St', 62, '50-223', '78 677 38 59', 'superowca@gmail.com\r'),
('341779261', '4388717383', 'Sp.zoo \"Wazna szyszka\"', 'ul. Monte Cassi', 62, '53-644', '69 888 11 78', 'waznaszyszka@gmail.com\r'),
('488739738', '5965127103', 'Sp.zoo \"Czarny pien\"', 'Pl. Marszalka P', 62, '51-152', '69 216 53 40', 'czarnypien@gmail.com\r'),
('541397056', '7661061893', 'Sp.zoo \"Wasia Pupkin\"', 'ul. Najswietsze', 62, '50-266', '69 737 54 25', 'wasiapupkin@gmail.com\r'),
('570834092', '8658325526', 'Sp.zoo \"Wnucza dziada i babci\"', 'ul. Psie Budy 9', 62, '50-080', '60 481 31 47', 'wnuczadziadaibabci@gmail.com\r'),
('843947899', '2325696813', 'Sp.zoo \"Morze po kolana\"', 'ul. Slowianska ', 62, '50-235', '72 118 69 04', 'morzepokolano@gmail.com\r'),
('853135426', '0220257706', 'Sp.zoo \"Pijany Jelen\"', 'ul. Szronowa 96', 62, '53-023', '72 831 02 41', 'pijanyjelen@gmail.com\r'),
('867764000', '5782211089', 'Sp.zoo \"Roga i Kopyta\"', 'ul. Kukulcza 12', 62, '51-418', '67 297 98 51', 'rogaikopyta@gmail.com\r'),
('917609398', '2720852979', 'Sp.zoo \"Blue water\"', 'ul. Drobuta Jan', 62, '51-507', '60 709 27 85', 'blue_water@gmail.com\r'),
('923993481', '2602280409', 'Sp.zoo \"Wiadro na glowie\"', 'ul. Tarnogórska', 62, '52-021', '88 788 35 94', 'wiadronaglowie@gmail.com\r');

-- --------------------------------------------------------

--
-- Table structure for table `warehousedeliveries`
--

CREATE TABLE `warehousedeliveries` (
  `WarehouseDeliveryID` int(11) NOT NULL,
  `DelivererRegon` varchar(50) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ProductsCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehousedeliveries`
--

INSERT INTO `warehousedeliveries` (`WarehouseDeliveryID`, `DelivererRegon`, `ProductID`, `ProductsCount`) VALUES
(1, '853135426', 2, 400);

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

CREATE TABLE `workers` (
  `WorkerID` int(11) NOT NULL,
  `PESELworker` varchar(15) DEFAULT NULL,
  `WorkerName` varchar(30) NOT NULL,
  `WorkerSurname` varchar(30) NOT NULL,
  `WorkerSex` char(1) NOT NULL,
  `WorkerAddress` varchar(30) DEFAULT NULL,
  `WorkerCityID` int(11) DEFAULT NULL,
  `WorkerPhoneNumber` varchar(15) DEFAULT NULL,
  `WorkerEmail` varchar(30) NOT NULL,
  `WorkerPassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`WorkerID`, `PESELworker`, `WorkerName`, `WorkerSurname`, `WorkerSex`, `WorkerAddress`, `WorkerCityID`, `WorkerPhoneNumber`, `WorkerEmail`, `WorkerPassword`) VALUES
(1, '12345678910', 'Worker', 'Example', 'M', 'ul.Wittiga 5', 62, '88 934 12 83', 'worker@gmail.com', 'Damien47R1s2i3'),
(2, '90021811118', 'Jan', 'Nowak', 'M', 'ul. Sloneczna 119', 1, '69 321 17 67', 'maught73@gmail.us', 'qCah0K'),
(3, '56121347377', 'Andrzej', 'Kowalski', 'M', 'ul. Kosciuszki 57', 6, '88 277 38 59', 'otedyfot1357@gmail.com', '1atkHb'),
(4, '59052063194', 'Piotr', 'Wisniewski', 'M', 'Al. Pokoju 58', 31, '88 570 90 52', 'thertions1955@gmail.com', 'TLMJuw'),
(5, '77011739696', 'Krzysztof', 'Dabrowski', 'M', 'ul. Podbialowa 65', 18, '88 456 33 47', 'xanotulli6815@gmail.com', '2hWTLl'),
(6, '67030171371', 'Stanislaw', 'Lewandowski', 'M', 'ul. Cypryjska 69', 14, '79 297 78 43', 'jilerrafe8365@gmail.com', 'eq0QcE'),
(7, '47080136135', 'Tomasz', 'Wójcik', 'M', 'ul. Letnia 37', 55, '88 467 93 45', 'orodeko6399@gmail.com', 'GwTwm7'),
(8, '61071582138', 'Pawel', 'Kaminski', 'M', 'ul. Dabrowszczaków 145', 32, '79 264 54 58', 'bunoboky@gmail.com', 'sdeck'),
(9, '62010639375', 'Józef', 'Kowalczyk', 'M', 'ul. Zeromskiego 93', 7, '51 755 41 82', 'elerson3@gmail.com', 'dtu1NV'),
(10, '73020634599', 'Marcin', 'Zielinski', 'M', 'ul. Cieszynska 144', 34, '79 130 20 20', 'gsmn@gmail.com', 'tQrWBh'),
(11, '81020241299', 'Marek', 'Szymanski', 'M', 'ul. Swietej Barbary 52', 63, '88 995 05 05', 'chyuf@gmail.pl', '6QjGAS'),
(12, '60041912487', 'Anna', 'Zalewska', 'K', 'ul. Malczycka 116', 37, '78 809 77 60', 'quierjiriu@gmail.com', 'm7RRRZ'),
(13, '57031858661', 'Maria', 'Jakubowska', 'K', 'ul. Krzyzowa 125', 32, '78 252 07 61', 'thyiz_1993@gmail.com', '8FNanZ'),
(14, '48012313848', 'Katarzyna', 'Jasinska', 'K', 'ul. Wislisko 28', 13, '72 250 81 14', 'sekoukyag@mail.ru', 'D12FoG'),
(15, '50080238745', 'Malgorzata', 'Zawadzka', 'K', 'ul. Wrzesniowa 77', 43, '66 222 04 79', 'miol@gmail.com', 'IcTIXV'),
(16, '53050825626', 'Agnieszka', 'Sadowska', 'K', 'ul. Ludna 28', 20, '51 184 21 09', 'cyxaeke@gmail.pl', 'HNavXj'),
(17, '70092489827', 'Krystyna', 'Bak', 'K', 'ul. Bukowska 119', 2, '72 215 89 38', 'quucor@gmail.com', 'UsYhE3'),
(19, '81102812421', 'Ewa', 'Wlodarczyk', 'K', 'ul. Chorzowska 46', 40, '67 410 43 53', 'raetuz@gmail.pl', 'MFpL0i'),
(20, '71020995168', 'Elzbieta', 'Borkowska', 'K', 'ul. Belgijska 93', 53, '60 300 04 99', 'chiekooty@gmail.com', 'wRHJn9'),
(21, '48092471863', 'Zofia', 'Czarnecka', 'K', 'ul. Jagielly Wladyslawa 7', 11, '67 442 69 41', 'biazjigju@gmail.com', '4EDevB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`AdministratorID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`CityID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `ClientEmail` (`Email`),
  ADD KEY `CLientCityFK` (`ClientCityID`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `ProdIDFK` (`ProdID`),
  ADD KEY `OrderIDFk` (`OrderID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ClientIDfFK` (`ClientIDf`),
  ADD KEY `WorkerIDfFK` (`WorkerIDf`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `CategoryIDFK` (`CategoryID`),
  ADD KEY `WarehouseDeliveryIDFK` (`WarehouseDeliveryID`);

--
-- Indexes for table `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD PRIMARY KEY (`REGON`),
  ADD KEY `DelivererCityIDFK` (`DelivererCityID`);

--
-- Indexes for table `warehousedeliveries`
--
ALTER TABLE `warehousedeliveries`
  ADD PRIMARY KEY (`WarehouseDeliveryID`),
  ADD KEY `ProductIDFK` (`ProductID`),
  ADD KEY `WarehouseDelivererRegonFK` (`DelivererRegon`);

--
-- Indexes for table `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`WorkerID`),
  ADD KEY `WorkerCityIDFK` (`WorkerCityID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrators`
--
ALTER TABLE `administrators`
  MODIFY `AdministratorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `CityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `workers`
--
ALTER TABLE `workers`
  MODIFY `WorkerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `CLientCityFK` FOREIGN KEY (`ClientCityID`) REFERENCES `cities` (`CityID`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `OrderIDFk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `ProdIDFK` FOREIGN KEY (`ProdID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `ClientIDfFK` FOREIGN KEY (`ClientIDf`) REFERENCES `clients` (`ClientID`),
  ADD CONSTRAINT `WorkerIDfFK` FOREIGN KEY (`WorkerIDf`) REFERENCES `workers` (`WorkerID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `CategoryIDFK` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`),
  ADD CONSTRAINT `WarehouseDeliveryIDFK` FOREIGN KEY (`WarehouseDeliveryID`) REFERENCES `warehousedeliveries` (`WarehouseDeliveryID`);

--
-- Constraints for table `warehousedeliverers`
--
ALTER TABLE `warehousedeliverers`
  ADD CONSTRAINT `DelivererCityIDFK` FOREIGN KEY (`DelivererCityID`) REFERENCES `cities` (`CityID`);

--
-- Constraints for table `warehousedeliveries`
--
ALTER TABLE `warehousedeliveries`
  ADD CONSTRAINT `ProductIDFK` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `WarehouseDelivererRegonFK` FOREIGN KEY (`DelivererRegon`) REFERENCES `warehousedeliverers` (`REGON`);

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `WorkerCityIDFK` FOREIGN KEY (`WorkerCityID`) REFERENCES `cities` (`CityID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
