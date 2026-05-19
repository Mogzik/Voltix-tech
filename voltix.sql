-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Maj 19, 2026 at 09:14 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

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
(1, 'Intel Core i9-13900K', 3500, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2022/9/pr_2022_9_27_11_45_48_428_02.jpg', '{\"cores\":24,\"threads\":32,\"base_clock\":\"3.0 GHz\",\"boost_clock\":\"5.8 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"36 MB\"}'),
(2, 'AMD Ryzen 9 7950X', 3200, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/1/pr_2023_1_25_12_54_39_334_03.jpg', '{\"cores\":16,\"threads\":32,\"base_clock\":\"4.5 GHz\",\"boost_clock\":\"5.7 GHz\",\"tdp\":\"170 W\",\"socket\":\"AM5\",\"cache\":\"80 MB\"}'),
(3, 'NVIDIA RTX 4090', 8000, 'NVIDIA', 'Podzespoły', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6521/6521430cv12d.jpg', '{\"vram\":\"24 GB GDDR6X\",\"base_clock\":\"2235 MHz\",\"boost_clock\":\"2520 MHz\",\"tdp\":\"450 W\",\"cuda_cores\":16384,\"memory_bus\":\"384-bit\"}'),
(4, 'Samsung 32GB DDR5 RAM', 400, 'Samsung', 'Podzespoły', 'https://m.media-amazon.com/images/I/71TvUKXQMaL.jpg', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"5600 MHz\",\"latency\":\"CL36\",\"voltage\":\"1.1 V\"}'),
(5, 'ASUS ROG Strix Z690-E', 1500, 'ASUS', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/3/pr_2023_3_29_15_4_12_850_04.jpg', '{\"socket\":\"LGA 1700\",\"chipset\":\"Intel Z690\",\"ram_slots\":4,\"max_ram\":\"128 GB\",\"wifi\":\"Wi-Fi 6E\",\"bluetooth\":\"5.2\"}'),
(6, 'Samsung Odyssey G9 Monitor', 2500, 'Samsung', 'Monitory', 'https://image-us.samsung.com/SamsungUS/home/computing/monitors/gaming-monitors/pdp/lc49g95tssnxza/Asset1.jpg?$product-details-jpg$', '{\"size\":\"49\"\",\"resolution\":\"5120x1440\",\"refresh_rate\":\"240 Hz\",\"panel_type\":\"VA\",\"hdr\":\"HDR1000\",\"curvature\":\"1000R\"}'),
(7, 'Logitech MX Master 3S', 300, 'Logitech', 'Akcesoria', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6502/6502577_sd.jpg', '{\"dpi\":\"8000\",\"buttons\":7,\"battery_life\":\"70 days\",\"connectivity\":\"Bluetooth, USB\",\"weight\":\"141 g\"}'),
(8, 'Razer BlackWidow V3', 250, 'Razer', 'Akcesoria', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6425/6425357_sd.jpg', '{\"switch_type\":\"Mechanical (Green)\",\"backlight\":\"RGB\",\"connectivity\":\"USB\",\"keycaps\":\"PBT\",\"cable_length\":\"1.8 m\"}'),
(9, 'Apple iPhone 15 Pro', 4500, 'Apple', 'Smartfony', 'https://mcprod.jumbo.ae/media/catalog/product/i/p/iphone_15_pro_max_natural_titanium_pdp_image_position-1__en-me.jpg', '{\"display\":\"6.1\" Super Retina XDR\",\"processor\":\"A17 Pro\",\"storage\":\"128 GB\",\"camera\":\"48 MP\",\"battery\":\"3274 mAh\",\"os\":\"iOS 17\"}'),
(10, 'Sony PlayStation 5', 2500, 'Sony', 'Konsolki', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/11/pr_2023_11_23_11_12_58_599_00.jpg', '{\"cpu\":\"AMD Zen 2 (8 cores)\",\"gpu\":\"AMD RDNA 2\",\"ram\":\"16 GB GDDR6\",\"storage\":\"825 GB SSD\",\"resolution\":\"4K UHD\",\"hdr\":\"Yes\"}'),
(11, 'Intel Core i5-13600K', 1500, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2022/9/pr_2022_9_27_12_11_1_522_02.jpg', '{\"cores\":14,\"threads\":20,\"base_clock\":\"3.5 GHz\",\"boost_clock\":\"5.1 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"24 MB\"}'),
(12, 'Intel Core i7-13700K', 2200, 'Intel', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2020/5/pr_2020_5_6_15_10_34_543_00.jpg', '{\"cores\":16,\"threads\":24,\"base_clock\":\"3.4 GHz\",\"boost_clock\":\"5.4 GHz\",\"tdp\":\"125 W\",\"socket\":\"LGA 1700\",\"cache\":\"30 MB\"}'),
(13, 'AMD Ryzen 5 7600X', 1200, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/1/pr_2023_1_25_12_49_50_693_03.jpg', '{\"cores\":6,\"threads\":12,\"base_clock\":\"4.7 GHz\",\"boost_clock\":\"5.3 GHz\",\"tdp\":\"105 W\",\"socket\":\"AM5\",\"cache\":\"38 MB\"}'),
(14, 'AMD Ryzen 7 7700X', 1800, 'AMD', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/1/pr_2023_1_25_12_59_59_528_00.jpg', '{\"cores\":8,\"threads\":16,\"base_clock\":\"4.5 GHz\",\"boost_clock\":\"5.4 GHz\",\"tdp\":\"105 W\",\"socket\":\"AM5\",\"cache\":\"40 MB\"}'),
(15, 'NVIDIA RTX 4080 Super', 6500, 'NVIDIA', 'Podzespoły', 'https://tse4.mm.bing.net/th/id/OIP.Z2FulcR5hHKE2I11-QTAigHaGl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"vram\":\"16 GB GDDR6X\",\"boost_clock\":\"2550 MHz\",\"tdp\":\"320 W\",\"cuda_cores\":10240}'),
(16, 'NVIDIA RTX 4070 Super', 4200, 'NVIDIA', 'Podzespoły', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2023/06/asus-tuf-gaming-rtx-4070-oc.jpg', '{\"vram\":\"12 GB GDDR6X\",\"boost_clock\":\"2475 MHz\",\"tdp\":\"220 W\",\"cuda_cores\":7168}'),
(17, 'AMD Radeon RX 7900 XT', 4800, 'AMD', 'Podzespoły', 'https://th.bing.com/th/id/R.eba28eaffd055952e548808aa602a8ac?rik=zYdIyyE9mz6svQ&pid=ImgRaw&r=0', '{\"vram\":\"20 GB GDDR6\",\"boost_clock\":\"2400 MHz\",\"tdp\":\"300 W\"}'),
(18, 'AMD Radeon RX 7800 XT', 3200, 'AMD', 'Podzespoły', 'https://media.ldlc.com/r1600/ld/products/00/06/06/16/LD0006061660.jpg', '{\"vram\":\"16 GB GDDR6\",\"boost_clock\":\"2430 MHz\",\"tdp\":\"263 W\"}'),
(19, 'Kingston Fury Beast 32GB DDR5', 450, 'Kingston', 'Podzespoły', 'https://nomadaware.com.ec/wp-content/uploads/NomadaWare_32gb_ram_ddr5_kingston_fury_beast_5600mhz.webp', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"6000 MHz\",\"latency\":\"CL36\"}'),
(20, 'Corsair Vengeance 32GB DDR5', 500, 'Corsair', 'Podzespoły', 'https://media.ldlc.com/r1600/ld/products/00/05/96/95/LD0005969567_0005995858.jpg', '{\"capacity\":\"32 GB\",\"type\":\"DDR5\",\"speed\":\"6200 MHz\",\"latency\":\"CL34\"}'),
(21, 'Samsung 990 Pro 1TB', 600, 'Samsung', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/4/pr_2023_4_13_11_15_31_458_05.jpg', '{\"type\":\"NVMe\",\"read\":\"7450 MB/s\",\"write\":\"6900 MB/s\"}'),
(22, 'WD Black SN850X 2TB', 900, 'WD', 'Podzespoły', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6512/6512128cv12d.jpg', '{\"type\":\"NVMe\",\"read\":\"7300 MB/s\"}'),
(23, 'Crucial P3 1TB', 350, 'Crucial', 'Podzespoły', 'https://tse3.mm.bing.net/th/id/OIP.7N8xIbeGkvxvMOEbd_msWwHaEs?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"type\":\"NVMe\"}'),
(24, 'Seagate FireCuda 2TB', 700, 'Seagate', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2021/7/pr_2021_7_5_7_30_45_541_03.jpg', '{\"type\":\"SSD\"}'),
(25, 'ASUS TUF Gaming B650-PLUS', 950, 'ASUS', 'Podzespoły', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2022/12/pr_2022_12_5_16_13_10_829_03.jpg', '{\"socket\":\"AM5\",\"ram_slots\":4,\"wifi\":\"Yes\"}'),
(26, 'MSI MAG Z790 TOMAHAWK', 1400, 'MSI', 'Podzespoły', 'https://c1.neweggimages.com/ProductImageCompressAll1280/13-144-567-11.jpg', '{\"socket\":\"LGA1700\",\"ram_slots\":4,\"wifi\":\"Yes\"}'),
(27, 'Samsung Odyssey G7 27\"', 2200, 'Samsung', 'Monitory', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2025/2/pr_2025_2_13_13_27_59_711_00.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"240 Hz\"}'),
(28, 'LG UltraGear 27GP850', 1600, 'LG', 'Monitory', 'https://m.media-amazon.com/images/I/71g9q4saOcL._AC_.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"165 Hz\"}'),
(29, 'Logitech G Pro X Superlight', 500, 'Logitech', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2025/3/pr_2025_3_18_13_1_26_826_00.jpg', '{\"dpi\":\"25600\",\"weight\":\"63 g\"}'),
(30, 'Razer DeathAdder V3', 350, 'Razer', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/2/pr_2023_2_24_7_53_55_434_00.jpg', '{\"dpi\":\"30000\"}'),
(31, 'SteelSeries Apex Pro', 900, 'SteelSeries', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2024/9/pr_2024_9_17_14_10_2_123_00.jpg', '{\"switch\":\"OmniPoint\"}'),
(32, 'Razer Huntsman V2', 700, 'Razer', 'Akcesoria', 'https://images-na.ssl-images-amazon.com/images/I/81DltM4sMlL._AC_SL1500_.jpg', '{\"switch\":\"Optical\"}'),
(33, 'HyperX Cloud III', 400, 'HyperX', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2023/7/pr_2023_7_3_8_4_16_529_00.jpg', '{\"type\":\"7.1\"}'),
(34, 'SteelSeries Arctis Nova 7', 800, 'SteelSeries', 'Akcesoria', 'https://cdn.x-kom.pl/i/setup/images/prod/big/product-medium,,2025/10/pr_2025_10_13_9_14_36_155_00.jpg', '{\"wireless\":true}'),
(35, 'Apple iPhone 15', 4000, 'Apple', 'Smartfony', 'https://tse3.mm.bing.net/th/id/OIP.74mjW752pzqkNoJTk3-OWgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"display\":\"6.1\"\",\"processor\":\"A16\",\"camera\":\"48 MP\"}'),
(36, 'Samsung Galaxy S24', 4200, 'Samsung', 'Smartfony', 'https://image-us.samsung.com/us/smartphones/galaxy-s24/all-gallery/01_E3_OnlineExclusive_TitaniumBlue_Lockup_1600x1200.jpg?$product-details-jpg$?$product-details-thumbnail-jpg$', '{\"display\":\"6.2\"\",\"camera\":\"50 MP\"}'),
(37, 'Google Pixel 8 Pro', 4500, 'Google', 'Smartfony', 'https://image.ceneostatic.pl/data/products/158138955/f-google-pixel-8-pro-12-128gb-czarny.jpg', '{\"camera\":\"50 MP\",\"ai\":\"Yes\"}'),
(38, 'Sony PlayStation 5 Slim Digital', 2300, 'Sony', 'Konsolki', 'https://m.media-amazon.com/images/I/51fM0CKG+HL.jpg', '{\"storage\":\"1TB\",\"resolution\":\"4K\"}'),
(39, 'Xbox Series X 1TB', 2500, 'Microsoft', 'Konsolki', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6428/6428324_sd.jpg', '{\"resolution\":\"4K\",\"storage\":\"1TB\"}'),
(40, 'NZXT H7 Flow', 600, 'NZXT', 'Podzespoły', 'https://tse2.mm.bing.net/th/id/OIP.5IpzsrWD_MjZdmNu4whVoAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"type\":\"ATX\"}'),
(41, 'Corsair 5000D Airflow', 700, 'Corsair', 'Podzespoły', 'https://m.media-amazon.com/images/I/81hL4tPkXZL._AC_SL1500_.jpg', '{\"type\":\"ATX\"}'),
(42, 'Seasonic Focus GX-850', 650, 'Seasonic', 'Podzespoły', 'https://tse2.mm.bing.net/th/id/OIP.ASC7eawaIiePOpd8SSfK5AHaFe?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"power\":\"850W\",\"cert\":\"80+ Gold\"}'),
(43, 'Corsair RM750x', 600, 'Corsair', 'Podzespoły', 'https://files.pccasegear.com/images/1630376331-CP-9020199-AU-thb.jpg', '{\"power\":\"750W\",\"cert\":\"80+ Gold\"}'),
(44, 'Noctua NH-D15 chromax.black', 500, 'Noctua', 'Podzespoły', 'https://m.media-amazon.com/images/I/81w3r3ePupL._SL1500_.jpg', '{\"type\":\"air\",\"fans\":2}'),
(45, 'Corsair iCUE H150i Elite', 1000, 'Corsair', 'Podzespoły', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6534/6534177cv22d.jpg', '{\"type\":\"AIO\",\"size\":\"360mm\"}'),
(46, 'TP-Link Archer AX73', 450, 'TP-Link', 'Akcesoria', 'https://tse1.mm.bing.net/th/id/OIP.mdD3KtM6tgtld0XhUGXhDgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"wifi\":\"Wi-Fi 6\"}'),
(47, 'Logitech C922 Pro', 350, 'Logitech', 'Akcesoria', 'https://tse1.mm.bing.net/th/id/OIP.uggZiVpnYmqG1yuq4V1k3AHaGX?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"resolution\":\"1080p\"}'),
(48, 'Elgato Stream Deck MK.2', 800, 'Elgato', 'Akcesoria', 'https://m.media-amazon.com/images/I/61gtdFnK+UL._AC_SL1500_.jpg', '{\"keys\":15}'),
(49, 'Samsung T7 Shield 1TB', 500, 'Samsung', 'Podzespoły', 'https://cdn.freewebstore.com/origin/225369/samsung1tbportablessdt7shieldblackfromlegendthailand_1677570222373.jpg', '{\"type\":\"external SSD\"}'),
(50, 'SanDisk Extreme Portable 1TB', 450, 'SanDisk', 'Podzespoły', 'https://media.bechtle.com/is/180712/1c4b3d4ee288fc9434f5175bf56070570/c3/gallery/433f2abbb00f43e9bf6f6f4a8dfa4711?version=0&x=3840&quality=75', '{\"type\":\"external SSD\"}'),
(51, 'Intel Core i3-13100F', 600, 'Intel', 'Podzespoły', 'https://c1.neweggimages.com/ProductImageCompressAll1280/19-118-433-02.png', '{\"cores\":4,\"threads\":8,\"base_clock\":\"3.4 GHz\",\"boost_clock\":\"4.5 GHz\",\"tdp\":\"58 W\",\"socket\":\"LGA 1700\"}'),
(52, 'AMD Ryzen 5 7500F', 900, 'AMD', 'Podzespoły', 'https://www.syntech.co.za/wp-content/uploads/2023/08/100-100000597MPK_wr_01.jpg', '{\"cores\":6,\"threads\":12,\"boost_clock\":\"5.0 GHz\",\"socket\":\"AM5\"}'),
(53, 'Intel Core i9-14900K', 3800, 'Intel', 'Podzespoły', 'https://computercity.com/wp-content/uploads/51ZKpp9PV0L1.jpg', '{\"cores\":24,\"threads\":32,\"boost_clock\":\"6.0 GHz\",\"socket\":\"LGA 1700\"}'),
(54, 'AMD Ryzen 9 7900', 2500, 'AMD', 'Podzespoły', 'https://image.ceneostatic.pl/data/products/146873512/f-amd-ryzen-9-7900-3-7ghz-box-100100000590box.jpg', '{\"cores\":12,\"threads\":24,\"boost_clock\":\"5.4 GHz\"}'),
(55, 'NVIDIA RTX 4060 Ti', 2200, 'NVIDIA', 'Podzespoły', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6545/6545279cv12d.jpg', '{\"vram\":\"8 GB GDDR6\",\"tdp\":\"160 W\"}'),
(56, 'NVIDIA RTX 4060', 1800, 'NVIDIA', 'Podzespoły', 'https://m.media-amazon.com/images/I/712xE975t1L._AC_.jpg', '{\"vram\":\"8 GB GDDR6\"}'),
(57, 'AMD Radeon RX 7700 XT', 2800, 'AMD', 'Podzespoły', 'https://media.ldlc.com/r1600/ld/products/00/06/06/18/LD0006061889.jpg', '{\"vram\":\"12 GB\"}'),
(58, 'AMD Radeon RX 7600', 1600, 'AMD', 'Podzespoły', 'https://tse1.mm.bing.net/th/id/OIP.wBoIiXDbGZP310CEbe_PTwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"vram\":\"8 GB\"}'),
(59, 'G.Skill Trident Z5 32GB DDR5', 550, 'G.Skill', 'Podzespoły', 'https://tse2.mm.bing.net/th/id/OIP.GMbkr8h4bkcG66cz8t4XdAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"speed\":\"6400 MHz\",\"latency\":\"CL32\"}'),
(60, 'Patriot Viper 16GB DDR4', 200, 'Patriot', 'Podzespoły', 'https://d30u9wim1barf6.cloudfront.net/Custom/Content/Products/99/09/990966_memoria-patriot-viper-elite-16gb-2400mhz-ddr4-cl16-pve416g240c6gy_z1_637436234507577732.jpg', '{\"speed\":\"3200 MHz\"}'),
(61, 'Samsung 970 EVO Plus 1TB', 450, 'Samsung', 'Podzespoły', 'https://media.gamestop.com/i/gamestop/11165893_ALT03/Samsung-970-EVO-Plus-1TB-PCIe-3.0-NVMe-M.2-Internal-V-NAND-Solid-State-Drive?fmt=auto', '{\"type\":\"NVMe\",\"read\":\"3500 MB/s\"}'),
(62, 'Kingston NV2 2TB', 500, 'Kingston', 'Podzespoły', 'https://tse4.mm.bing.net/th/id/OIP.qY62lUj4v7laP3P8JQwv4wHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"type\":\"NVMe\"}'),
(63, 'Gigabyte B650 AORUS Elite', 1000, 'Gigabyte', 'Podzespoły', 'https://static.gigabyte.com/StaticFile/Image/Global/a14fc0c31eb5a18102751a742088e69d/Product/34840/Png', '{\"socket\":\"AM5\",\"wifi\":\"Yes\"}'),
(64, 'ASRock Z790 Steel Legend', 1300, 'ASRock', 'Podzespoły', 'https://gnd-tech.com/content/2019/04/asrock-z390-steel-legend-motherboard3.jpg', '{\"socket\":\"LGA1700\"}'),
(65, 'Acer Nitro XV272U', 1400, 'Acer', 'Monitory', 'https://m.media-amazon.com/images/I/71XNJ9z6miL._AC_SL1500_.jpg', '{\"resolution\":\"2560x1440\",\"refresh_rate\":\"170 Hz\"}'),
(66, 'Gigabyte M32U', 2500, 'Gigabyte', 'Monitory', 'https://i5.walmartimages.com/seo/GIGABYTE-M32U-32-IPS-Gaming-Monitor-UHD-3840x2160-144Hz-1ms-MPRT-AMD-FreeSync-Premium-Pro-Type-C-KVM-HDMI-DP-Type-C-Height-Adjustable-Black_4def3bf3-2ff5-4cde-8265-cb87ad669ed6.00375f7d326a78c799f7c82fd618d7cc.jpeg', '{\"resolution\":\"4K\",\"refresh_rate\":\"144 Hz\"}'),
(67, 'Logitech G502 X', 350, 'Logitech', 'Akcesoria', 'https://resource.logitechg.com/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png', '{\"dpi\":\"25600\"}'),
(68, 'Razer Basilisk V3', 300, 'Razer', 'Akcesoria', 'https://m.media-amazon.com/images/I/71L-flqtTwL.jpg', '{\"dpi\":\"26000\"}'),
(69, 'Corsair K70 RGB Pro', 700, 'Corsair', 'Akcesoria', 'https://res.cloudinary.com/corsair-pwa/image/upload/f_auto,q_auto/akamai/pdp/keyboards/k70-rgb-pro/assets/images/k70-legend.png', '{\"switch\":\"Cherry MX\"}'),
(70, 'Logitech G915 TKL', 900, 'Logitech', 'Akcesoria', 'https://th.bing.com/th/id/R.10107dd6d6d41e027f2709c466ff7fb0?rik=o2l6sAYAR4oSvg&pid=ImgRaw&r=0', '{\"wireless\":true}'),
(71, 'HyperX Alloy Origins', 400, 'HyperX', 'Akcesoria', 'https://www.megabites.com.ph/wp-content/uploads/2020/02/HyperX-Alloy-Origins-Core_Top-Right1.jpg', '{\"switch\":\"Red\"}'),
(72, 'SteelSeries Apex 7', 600, 'SteelSeries', 'Akcesoria', 'https://www.mechanical-keyboard.org/wp-content/uploads/2019/08/SteelSeries-Apex-7.jpg', '{\"switch\":\"Red\"}'),
(73, 'Beyerdynamic DT 770 Pro', 700, 'Beyerdynamic', 'Akcesoria', 'https://th.bing.com/th/id/R.ad00e4f00d356e13141f831174201050?rik=I7kDpobxz0i6rA&pid=ImgRaw&r=0', '{\"type\":\"studio\"}'),
(74, 'Logitech G733', 500, 'Logitech', 'Akcesoria', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6420/6420856_sd.jpg', '{\"wireless\":true}'),
(75, 'Apple iPhone 14 Pro', 5000, 'Apple', 'Smartfony', 'https://www.apple.com/newsroom/images/product/iphone/geo/Apple-iPhone-14-Pro-iPhone-14-Pro-Max-deep-purple-220907-geo_inline.jpg.large.jpg', '{\"display\":\"6.1\"\",\"camera\":\"48 MP\"}'),
(76, 'Samsung Galaxy S23 Ultra', 5500, 'Samsung', 'Smartfony', 'https://static1.pocketnowimages.com/wordpress/wp-content/uploads/2023/02/pbi-samsung-galaxy-s23-ultra.png', '{\"display\":\"6.8\"\",\"camera\":\"200 MP\"}'),
(77, 'Xiaomi 13 Pro', 4200, 'Xiaomi', 'Smartfony', 'https://images.fonearena.com/blog/wp-content/uploads/2022/12/Xiaomi-13-Pro-.jpg', '{\"camera\":\"50 MP\"}'),
(78, 'OnePlus 11', 3800, 'OnePlus', 'Smartfony', 'https://oasis.opstatics.com/content/dam/oasis/page/2023/na/oneplus-11/specs/black-img.png', '{\"display\":\"6.7\"\"}'),
(79, 'Nintendo Switch OLED', 1500, 'Nintendo', 'Konsolki', 'https://m.media-amazon.com/images/I/71Q54HnKxwS._AC_SL1500_.jpg', '{\"display\":\"OLED\",\"storage\":\"64GB\"}'),
(80, 'Xbox Series S', 1300, 'Microsoft', 'Konsolki', 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/10/xbox-series-s-console-game-platform.jpg', '{\"resolution\":\"1440p\"}'),
(81, 'Fractal Design Meshify C', 500, 'Fractal', 'Podzespoły', 'https://www.fractal-design.com/app/uploads/2019/06/Meshify-C_1.jpg', '{\"type\":\"ATX\"}'),
(82, 'Lian Li O11 Dynamic', 700, 'Lian Li', 'Podzespoły', 'https://www.profesionalreview.com/wp-content/uploads/2018/04/Lian-Li-PC-O11-Dynamic-un-chasis-con-mucho-cristal-1.jpg', '{\"type\":\"ATX\"}'),
(83, 'be quiet! Pure Power 12M 750W', 600, 'be quiet!', 'Podzespoły', 'https://media.ldlc.com/r1600/ld/products/00/06/00/94/LD0006009436.jpg', '{\"cert\":\"80+ Gold\"}'),
(84, 'EVGA SuperNOVA 850 G6', 700, 'EVGA', 'Podzespoły', 'https://th.bing.com/th/id/R.7ce6070055b89349eaeac8b431c50cd6?rik=d99U9jzjE9ArjA&riu=http%3a%2f%2fimg.pccomponentes.com%2farticles%2f83%2f837681%2f1147-evga-supernova-850-g6-850w-80-plus-gold-full-modular.jpg&ehk=8JtjZ5Hgcj5YrRfxxdkHldn%2fx7G7PDa3bDfY7TgID9o%3d&risl=&pid=ImgRaw&r=0', '{\"cert\":\"80+ Gold\"}'),
(85, 'Arctic Freezer 34', 200, 'Arctic', 'Podzespoły', 'https://www.arctic.de/media/42/55/22/1583240954/Freezer_34_eSports_DUO_White_G00_transparent.png', '{\"type\":\"air\"}'),
(86, 'NZXT Kraken X73', 900, 'NZXT', 'Podzespoły', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6408/6408511cv14d.jpg', '{\"type\":\"AIO\"}'),
(87, 'TP-Link Deco X50', 600, 'TP-Link', 'Akcesoria', 'https://tse1.mm.bing.net/th/id/OIP._1sCQm9SGz94GNQFYE70FwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', '{\"wifi\":\"Mesh\"}'),
(88, 'ASUS RT-AX58U', 500, 'ASUS', 'Akcesoria', 'https://www.asus.com/media/global/gallery/vcay5imooivmhdkf_setting_xxx_0_90_end_800.png', '{\"wifi\":\"Wi-Fi 6\"}'),
(89, 'Logitech Brio 4K', 700, 'Logitech', 'Akcesoria', 'https://cdn-reichelt.de/bilder/web/xxl_ws/EB00/LOGITECH_BRIO_02.png', '{\"resolution\":\"4K\"}'),
(90, 'Razer Kiyo Pro', 600, 'Razer', 'Akcesoria', 'https://m.media-amazon.com/images/I/71fDBObaOxL._AC_.jpg', '{\"resolution\":\"1080p\"}'),
(91, 'Elgato Facecam', 800, 'Elgato', 'Akcesoria', 'https://m.media-amazon.com/images/I/61eXN9erjAL._AC_SL1500_.jpg', '{\"resolution\":\"1080p\"}'),
(92, 'Blue Yeti USB Microphone', 600, 'Blue', 'Akcesoria', 'https://www.bhphotovideo.com/images/images2000x2000/blue_836213002070_yeti_usb_microphone_black_1103930.jpg', '{\"type\":\"USB\"}'),
(93, 'Samsung T5 EVO 2TB', 700, 'Samsung', 'Podzespoły', 'https://media.hifi.lu/sys-master/products/9333720547358/1440x1440.41009320_04.webp', '{\"type\":\"external SSD\"}'),
(94, 'WD My Passport 2TB', 400, 'WD', 'Podzespoły', 'https://www.dpreview.com/files/p/articles/9614419636/Western_Digital_My_Passport_Group.jpeg', '{\"type\":\"external HDD\"}'),
(95, 'SanDisk Ultra 512GB USB', 150, 'SanDisk', 'Akcesoria', 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6522/6522096cv11d.jpg', '{\"type\":\"USB 3.0\"}'),
(96, 'Kingston DataTraveler 256GB', 120, 'Kingston', 'Akcesoria', 'https://www.bhphotovideo.com/images/images2000x2000/kingston_dtxm_256gb_256gb_datatraveler_exodia_m_1703234.jpg', '{\"type\":\"USB 3.2\"}'),
(97, 'Apple AirPods Pro 2', 1200, 'Apple', 'Akcesoria', 'https://cdsassets.apple.com/live/SZLF0YNV/images/sp/111851_sp880-airpods-Pro-2nd-gen.png', '{\"anc\":true}'),
(98, 'Sony WH-1000XM5', 1800, 'Sony', 'Akcesoria', 'https://eezepc.com/wp-content/uploads/2022/07/Sony-WH-1000XM5-9.jpg', '{\"anc\":true}'),
(99, 'Meta Quest 2', 1800, 'Meta', 'Akcesoria', 'https://comprarmag.com/wp-content/uploads/2022/08/meta-quest-ap-por-mayor.jpeg', '{\"type\":\"VR\"}'),
(100, 'Valve Index VR Kit', 5000, 'Valve', 'Akcesoria', 'https://shared.cloudflare.steamstatic.com/store_item_assets/steam/apps/1059530/ss_c63555869a58a5105c8996d8480af5d345ce39cd.1920x1080.jpg?t=1645043152', '{\"type\":\"VR\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'completed',
  `card_last_four` varchar(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `name`, `created_at`) VALUES
(1, 'admin@voltix.com', '$2a$10$z8Y5i8pPlER3rxZFnnGxFu512VeWrJawj8kuZFxl8RiHp/luJj4pO', 'Administrator', '2026-05-12 07:00:13');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
