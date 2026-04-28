-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2026 at 10:01 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voltix`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `category` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `specs` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `price`, `brand`, `category`, `image`, `specs`) VALUES
(1, 'Intel Core i9-13900K', 3500, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/9/pr_2022_9_27_12_7_43_224_02.jpg', '{\"cores\":24,\"threads\":32,\"base_clock\":\"3.0 GHz\",\"boost_clock\":\"5.8 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"36 MB\"}'),
(2, 'AMD Ryzen 9 7950X', 3200, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_25_12_54_39_334_03.jpg', '{\"cores\":16,\"threads\":32,\"base_clock\":\"4.5 GHz\",\"boost_clock\":\"5.7 GHz\",\"tdp\":\"170 W\",\"socket\":\"AM5\",\"cache\":\"80 MB\"}'),
(3, 'NVIDIA RTX 4090', 8000, 'NVIDIA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/4/pr_2024_4_4_9_40_44_408_00.jpg', '{\"vram\":\"24 GB GDDR6X\",\"base_clock\":\"2235 MHz\",\"boost_clock\":\"2520 MHz\",\"tdp\":\"450 W\",\"cuda_cores\":16384,\"memory_bus\":\"384-bit\"}'),
(4, 'Samsung 32GB DDR5 RAM', 400, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_22_9_24_53_830_00.jpg', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"5600 MHz\",\"latency\":\"CL36\",\"voltage\":\"1.1 V\"}'),
(5, 'ASUS ROG Strix Z690-E', 1500, 'ASUS', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_29_15_4_12_850_04.jpg', '{\"socket\":\"LGA 1700\",\"chipset\":\"Intel Z690\",\"ram_slots\":4,\"max_ram\":\"128 GB\",\"wifi\":\"Wi-Fi 6E\",\"bluetooth\":\"5.2\"}'),
(6, 'Samsung Odyssey G9 Monitor', 2500, 'Samsung', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2025/2/pr_2025_2_13_14_7_27_467_00.jpg', '{\"size\":\"49\"\",\"resolution\":\"5120x1440\",\"refresh_rate\":\"240 Hz\",\"panel_type\":\"VA\",\"hdr\":\"HDR1000\",\"curvature\":\"1000R\"}'),
(7, 'Logitech MX Master 3S', 300, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/6/pr_2022_6_15_10_51_26_297_00.jpg', '{\"dpi\":\"8000\",\"buttons\":7,\"battery_life\":\"70 days\",\"connectivity\":\"Bluetooth, USB\",\"weight\":\"141 g\"}'),
(8, 'Razer BlackWidow V3', 250, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2020/10/pr_2020_10_15_14_39_37_615_00.jpg', '{\"switch_type\":\"Mechanical (Green)\",\"backlight\":\"RGB\",\"connectivity\":\"USB\",\"keycaps\":\"PBT\",\"cable_length\":\"1.8 m\"}'),
(9, 'Apple iPhone 15 Pro', 4500, 'Apple', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_12_22_21_55_906_00.jpg', '{\"display\":\"6.1\" Super Retina XDR\",\"processor\":\"A17 Pro\",\"storage\":\"128 GB\",\"camera\":\"48 MP\",\"battery\":\"3274 mAh\",\"os\":\"iOS 17\"}'),
(10, 'Sony PlayStation 5', 2500, 'Sony', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/11/pr_2023_11_23_11_12_58_599_00.jpg', '{\"cpu\":\"AMD Zen 2 (8 cores)\",\"gpu\":\"AMD RDNA 2\",\"ram\":\"16 GB GDDR6\",\"storage\":\"825 GB SSD\",\"resolution\":\"4K UHD\",\"hdr\":\"Yes\"}'),
(11, 'Intel Core i5-13600K', 1500, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/10/pr_2022_10_20_10_0_0_001.jpg', '{\"cores\":14,\"threads\":20,\"base_clock\":\"3.5 GHz\",\"boost_clock\":\"5.1 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"24 MB\"}'),
(12, 'Intel Core i7-13700K', 2200, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/10/pr_2022_10_20_10_0_0_002.jpg', '{\"cores\":16,\"threads\":24,\"base_clock\":\"3.4 GHz\",\"boost_clock\":\"5.4 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"30 MB\"}'),
(13, 'AMD Ryzen 5 7600X', 1200, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/9/pr_2022_9_27_10_0_0_003.jpg', '{\"cores\":6,\"threads\":12,\"base_clock\":\"4.7 GHz\",\"boost_clock\":\"5.3 GHz\",\"tdp\":\"105 W\",\"socket\":\"AM5\",\"cache\":\"38 MB\"}'),
(14, 'AMD Ryzen 7 7700X', 1800, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/9/pr_2022_9_27_10_0_0_004.jpg', '{\"cores\":8,\"threads\":16,\"base_clock\":\"4.5 GHz\",\"boost_clock\":\"5.4 GHz\",\"tdp\":\"105 W\",\"socket\":\"AM5\",\"cache\":\"40 MB\"}'),
(15, 'NVIDIA RTX 4080 Super', 6500, 'NVIDIA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/1/pr_2024_1_10_10_0_0_005.jpg', '{\"vram\":\"16 GB GDDR6X\",\"boost_clock\":\"2550 MHz\",\"tdp\":\"320 W\",\"cuda_cores\":10240}'),
(16, 'NVIDIA RTX 4070 Super', 4200, 'NVIDIA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/1/pr_2024_1_10_10_0_0_006.jpg', '{\"vram\":\"12 GB GDDR6X\",\"boost_clock\":\"2475 MHz\",\"tdp\":\"220 W\",\"cuda_cores\":7168}'),
(17, 'AMD Radeon RX 7900 XT', 4800, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_15_10_0_0_007.jpg', '{\"vram\":\"20 GB GDDR6\",\"boost_clock\":\"2400 MHz\",\"tdp\":\"300 W\"}'),
(18, 'AMD Radeon RX 7800 XT', 3200, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_10_10_0_0_008.jpg', '{\"vram\":\"16 GB GDDR6\",\"boost_clock\":\"2430 MHz\",\"tdp\":\"263 W\"}'),
(19, 'Kingston Fury Beast 32GB DDR5', 450, 'Kingston', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_009.jpg', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"6000 MHz\",\"latency\":\"CL36\"}'),
(20, 'Corsair Vengeance 32GB DDR5', 500, 'Corsair', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_10_10_0_0_010.jpg', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"6200 MHz\",\"latency\":\"CL34\"}'),
(21, 'Samsung 990 Pro 1TB', 600, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_011.jpg', '{\"type\":\"NVMe\",\"read\":\"7450 MB/s\",\"write\":\"6900 MB/s\"}'),
(22, 'WD Black SN850X 2TB', 900, 'WD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_012.jpg', '{\"type\":\"NVMe\",\"read\":\"7300 MB/s\"}'),
(23, 'Crucial P3 1TB', 350, 'Crucial', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_013.jpg', '{\"type\":\"NVMe\"}'),
(24, 'Seagate FireCuda 2TB', 700, 'Seagate', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_014.jpg', '{\"type\":\"SSD\"}'),
(25, 'ASUS TUF Gaming B650-PLUS', 950, 'ASUS', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_10_10_0_0_015.jpg', '{\"socket\":\"AM5\",\"ram_slots\":4,\"wifi\":\"Yes\"}'),
(26, 'MSI MAG Z790 TOMAHAWK', 1400, 'MSI', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_10_10_0_0_016.jpg', '{\"socket\":\"LGA1700\",\"ram_slots\":4,\"wifi\":\"Yes\"}'),
(27, 'Samsung Odyssey G7 27\"', 2200, 'Samsung', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_15_10_0_0_017.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"240 Hz\"}'),
(28, 'LG UltraGear 27GP850', 1600, 'LG', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_20_10_0_0_018.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"165 Hz\"}'),
(29, 'Logitech G Pro X Superlight', 500, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/11/pr_2022_11_10_10_0_0_019.jpg', '{\"dpi\":\"25600\",\"weight\":\"63 g\"}'),
(30, 'Razer DeathAdder V3', 350, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_020.jpg', '{\"dpi\":\"30000\"}'),
(31, 'SteelSeries Apex Pro', 900, 'SteelSeries', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_10_10_0_0_021.jpg', '{\"switch\":\"OmniPoint\"}'),
(32, 'Razer Huntsman V2', 700, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/12/pr_2022_12_10_10_0_0_022.jpg', '{\"switch\":\"Optical\"}'),
(33, 'HyperX Cloud III', 400, 'HyperX', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_10_10_0_0_023.jpg', '{\"type\":\"7.1\"}'),
(34, 'SteelSeries Arctis Nova 7', 800, 'SteelSeries', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_10_10_0_0_024.jpg', '{\"wireless\":true}'),
(35, 'Apple iPhone 15', 4000, 'Apple', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_12_22_21_55_900_00.jpg', '{\"display\":\"6.1\"\",\"processor\":\"A16\",\"camera\":\"48 MP\"}'),
(36, 'Samsung Galaxy S24', 4200, 'Samsung', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/1/pr_2024_1_20_10_0_0_025.jpg', '{\"display\":\"6.2\"\",\"camera\":\"50 MP\"}'),
(37, 'Google Pixel 8 Pro', 4500, 'Google', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/10/pr_2023_10_10_10_0_0_026.jpg', '{\"camera\":\"50 MP\",\"ai\":\"Yes\"}'),
(38, 'Sony PlayStation 5 Slim Digital', 2300, 'Sony', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/2/pr_2024_2_10_10_0_0_027.jpg', '{\"storage\":\"1TB\",\"resolution\":\"4K\"}'),
(39, 'Xbox Series X 1TB', 2500, 'Microsoft', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/11/pr_2023_11_10_10_0_0_028.jpg', '{\"resolution\":\"4K\",\"storage\":\"1TB\"}'),
(40, 'NZXT H7 Flow', 600, 'NZXT', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_029.jpg', '{\"type\":\"ATX\"}'),
(41, 'Corsair 5000D Airflow', 700, 'Corsair', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_030.jpg', '{\"type\":\"ATX\"}'),
(42, 'Seasonic Focus GX-850', 650, 'Seasonic', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_031.jpg', '{\"power\":\"850W\",\"cert\":\"80+ Gold\"}'),
(43, 'Corsair RM750x', 600, 'Corsair', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_10_10_0_0_032.jpg', '{\"power\":\"750W\",\"cert\":\"80+ Gold\"}'),
(44, 'Noctua NH-D15 chromax.black', 500, 'Noctua', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_10_10_0_0_033.jpg', '{\"type\":\"air\",\"fans\":2}'),
(45, 'Corsair iCUE H150i Elite', 1000, 'Corsair', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_10_10_0_0_034.jpg', '{\"type\":\"AIO\",\"size\":\"360mm\"}'),
(46, 'TP-Link Archer AX73', 450, 'TP-Link', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_10_10_0_0_035.jpg', '{\"wifi\":\"Wi-Fi 6\"}'),
(47, 'Logitech C922 Pro', 350, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/10/pr_2022_10_10_10_0_0_036.jpg', '{\"resolution\":\"1080p\"}'),
(48, 'Elgato Stream Deck MK.2', 800, 'Elgato', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_10_10_0_0_037.jpg', '{\"keys\":15}'),
(49, 'Samsung T7 Shield 1TB', 500, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_038.jpg', '{\"type\":\"external SSD\"}'),
(50, 'SanDisk Extreme Portable 1TB', 450, 'SanDisk', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_039.jpg', '{\"type\":\"external SSD\"}'),
(51, 'Intel Core i3-13100F', 600, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_15_10_0_0_040.jpg', '{\"cores\":4,\"threads\":8,\"base_clock\":\"3.4 GHz\",\"boost_clock\":\"4.5 GHz\",\"tdp\":\"58 W\",\"socket\":\"LGA 1700\"}'),
(52, 'AMD Ryzen 5 7500F', 900, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_10_10_0_0_041.jpg', '{\"cores\":6,\"threads\":12,\"boost_clock\":\"5.0 GHz\",\"socket\":\"AM5\"}'),
(53, 'Intel Core i9-14900K', 3800, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/1/pr_2024_1_20_10_0_0_042.jpg', '{\"cores\":24,\"threads\":32,\"boost_clock\":\"6.0 GHz\",\"socket\":\"LGA 1700\"}'),
(54, 'AMD Ryzen 9 7900', 2500, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_043.jpg', '{\"cores\":12,\"threads\":24,\"boost_clock\":\"5.4 GHz\"}'),
(55, 'NVIDIA RTX 4060 Ti', 2200, 'NVIDIA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_15_10_0_0_044.jpg', '{\"vram\":\"8 GB GDDR6\",\"tdp\":\"160 W\"}'),
(56, 'NVIDIA RTX 4060', 1800, 'NVIDIA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_15_10_0_0_045.jpg', '{\"vram\":\"8 GB GDDR6\"}'),
(57, 'AMD Radeon RX 7700 XT', 2800, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_15_10_0_0_046.jpg', '{\"vram\":\"12 GB\"}'),
(58, 'AMD Radeon RX 7600', 1600, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_20_10_0_0_047.jpg', '{\"vram\":\"8 GB\"}'),
(59, 'G.Skill Trident Z5 32GB DDR5', 550, 'G.Skill', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_15_10_0_0_048.jpg', '{\"speed\":\"6400 MHz\",\"latency\":\"CL32\"}'),
(60, 'Patriot Viper 16GB DDR4', 200, 'Patriot', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/11/pr_2022_11_10_10_0_0_049.jpg', '{\"speed\":\"3200 MHz\"}'),
(61, 'Samsung 970 EVO Plus 1TB', 450, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/10/pr_2022_10_10_10_0_0_050.jpg', '{\"type\":\"NVMe\",\"read\":\"3500 MB/s\"}'),
(62, 'Kingston NV2 2TB', 500, 'Kingston', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_051.jpg', '{\"type\":\"NVMe\"}'),
(63, 'Gigabyte B650 AORUS Elite', 1000, 'Gigabyte', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_15_10_0_0_052.jpg', '{\"socket\":\"AM5\",\"wifi\":\"Yes\"}'),
(64, 'ASRock Z790 Steel Legend', 1300, 'ASRock', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_15_10_0_0_053.jpg', '{\"socket\":\"LGA1700\"}'),
(65, 'Acer Nitro XV272U', 1400, 'Acer', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_10_10_0_0_054.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"170 Hz\"}'),
(66, 'Gigabyte M32U', 2500, 'Gigabyte', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_055.jpg', '{\"resolution\":\"4K\",\"refresh_rate\":\"144 Hz\"}'),
(67, 'Logitech G502 X', 350, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_15_10_0_0_056.jpg', '{\"dpi\":\"25600\"}'),
(68, 'Razer Basilisk V3', 300, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_15_10_0_0_057.jpg', '{\"dpi\":\"26000\"}'),
(69, 'Corsair K70 RGB Pro', 700, 'Corsair', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_058.jpg', '{\"switch\":\"Cherry MX\"}'),
(70, 'Logitech G915 TKL', 900, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_059.jpg', '{\"wireless\":true}'),
(71, 'HyperX Alloy Origins', 400, 'HyperX', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/12/pr_2022_12_10_10_0_0_060.jpg', '{\"switch\":\"Red\"}'),
(72, 'SteelSeries Apex 7', 600, 'SteelSeries', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_10_10_0_0_061.jpg', '{\"switch\":\"Red\"}'),
(73, 'Beyerdynamic DT 770 Pro', 700, 'Beyerdynamic', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_062.jpg', '{\"type\":\"studio\"}'),
(74, 'Logitech G733', 500, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_063.jpg', '{\"wireless\":true}'),
(75, 'Apple iPhone 14 Pro', 5000, 'Apple', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/9/pr_2022_9_12_22_21_55_901_00.jpg', '{\"display\":\"6.1\"\",\"camera\":\"48 MP\"}'),
(76, 'Samsung Galaxy S23 Ultra', 5500, 'Samsung', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_064.jpg', '{\"display\":\"6.8\"\",\"camera\":\"200 MP\"}'),
(77, 'Xiaomi 13 Pro', 4200, 'Xiaomi', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_065.jpg', '{\"camera\":\"50 MP\"}'),
(78, 'OnePlus 11', 3800, 'OnePlus', 'Smartfony', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_10_10_0_0_066.jpg', '{\"display\":\"6.7\"\"}'),
(79, 'Nintendo Switch OLED', 1500, 'Nintendo', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2022/10/pr_2022_10_10_10_0_0_067.jpg', '{\"display\":\"OLED\",\"storage\":\"64GB\"}'),
(80, 'Xbox Series S', 1300, 'Microsoft', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/1/pr_2023_1_10_10_0_0_068.jpg', '{\"resolution\":\"1440p\"}'),
(81, 'Fractal Design Meshify C', 500, 'Fractal', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_069.jpg', '{\"type\":\"ATX\"}'),
(82, 'Lian Li O11 Dynamic', 700, 'Lian Li', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_070.jpg', '{\"type\":\"ATX\"}'),
(83, 'be quiet! Pure Power 12M 750W', 600, 'be quiet!', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_10_10_0_0_071.jpg', '{\"cert\":\"80+ Gold\"}'),
(84, 'EVGA SuperNOVA 850 G6', 700, 'EVGA', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_10_10_0_0_072.jpg', '{\"cert\":\"80+ Gold\"}'),
(85, 'Arctic Freezer 34', 200, 'Arctic', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_073.jpg', '{\"type\":\"air\"}'),
(86, 'NZXT Kraken X73', 900, 'NZXT', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_074.jpg', '{\"type\":\"AIO\"}'),
(87, 'TP-Link Deco X50', 600, 'TP-Link', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_10_10_0_0_075.jpg', '{\"wifi\":\"Mesh\"}'),
(88, 'ASUS RT-AX58U', 500, 'ASUS', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_10_10_0_0_076.jpg', '{\"wifi\":\"Wi-Fi 6\"}'),
(89, 'Logitech Brio 4K', 700, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/2/pr_2023_2_10_10_0_0_077.jpg', '{\"resolution\":\"4K\"}'),
(90, 'Razer Kiyo Pro', 600, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/3/pr_2023_3_10_10_0_0_078.jpg', '{\"resolution\":\"1080p\"}'),
(91, 'Elgato Facecam', 800, 'Elgato', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/4/pr_2023_4_10_10_0_0_079.jpg', '{\"resolution\":\"1080p\"}'),
(92, 'Blue Yeti USB Microphone', 600, 'Blue', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/5/pr_2023_5_10_10_0_0_080.jpg', '{\"type\":\"USB\"}'),
(93, 'Samsung T5 EVO 2TB', 700, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/6/pr_2023_6_10_10_0_0_081.jpg', '{\"type\":\"external SSD\"}'),
(94, 'WD My Passport 2TB', 400, 'WD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/7/pr_2023_7_10_10_0_0_082.jpg', '{\"type\":\"external HDD\"}'),
(95, 'SanDisk Ultra 512GB USB', 150, 'SanDisk', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/8/pr_2023_8_10_10_0_0_083.jpg', '{\"type\":\"USB 3.0\"}'),
(96, 'Kingston DataTraveler 256GB', 120, 'Kingston', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/9/pr_2023_9_10_10_0_0_084.jpg', '{\"type\":\"USB 3.2\"}'),
(97, 'Apple AirPods Pro 2', 1200, 'Apple', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/10/pr_2023_10_10_10_0_0_085.jpg', '{\"anc\":true}'),
(98, 'Sony WH-1000XM5', 1800, 'Sony', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/11/pr_2023_11_10_10_0_0_086.jpg', '{\"anc\":true}'),
(99, 'Meta Quest 2', 1800, 'Meta', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2023/12/pr_2023_12_10_10_0_0_087.jpg', '{\"type\":\"VR\"}'),
(100, 'Valve Index VR Kit', 5000, 'Valve', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-new-big,,2024/1/pr_2024_1_10_10_0_0_088.jpg', '{\"type\":\"VR\"}');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
