-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2020 at 12:22 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nijer_bazar`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `title`, `aboutDescription`, `metaTitle`, `metaKeyword`, `metaDescription`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nijer Bazar', '<h4 class=\"dropdown-item\"><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Nijer bazar, A type of embroidered quilt, is a centuries-old Bengali art tradition of the Bengali Region, The basic material used is thread and old cloth.</span><sup><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\"> </span></sup><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Nakshi kanthas are made throughout Bangladesh, but the greater Mymensingh, Jamalpur, Bogra, Rajshahi, Faridpur and Jessore areas are most famous for this craft.\r\n</span></h4><h4><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">The colourful patterns and designs that are embroidered resulted in the name \"Nakshi Kantha\", which was derived from the Bengali  word \"naksha\", which refers to artistic patterns.</span><sup><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\"> </span></sup><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">The early kanthas had a white background accented with red, blue and \r\nblack embroidery; later yellow, green, pink and other colours were also \r\nincluded. The running stitch called \"kantha stitch\" is the main stitch used for the purpose.Traditionally, kantha was produced for the use of the family. Today, \r\nafter the revival of the nakshi kantha, they are produced commercially.\r\n</span></h4><h4><br></h4><h4 style=\"text-align: justify;\"><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Different forms of the running kantha \r\nstitch are named according to the pattern each creates. While each \r\nkantha has designs that are unique to its maker’s imagination, usually \r\nthere is a basic traditional pattern. Some of the most common motifs \r\nused are: lotus, solar, moon, chakra or wheel, swastika, tree-of-life, \r\nkalka, water, mountain, fish, boat, agricultural items and animals \r\n(elephant, horses, peacocks, tiger, monkeys, etc).</span><span style=\"font-family: \" verdana\";\"=\"\">﻿</span></h4><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">\r\n</span><h4><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Chok Par :- eye border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Barfi Par :- diamond border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Beki Par :- wavy or bent&nbsp;</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Nolok Taga :- nose ring border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Maach Par :- fish border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Chok Taga :- eye motif border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Dheu Par :- wavy border</span><br><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">Gaach Par :- tree border</span></h4><h4><br></h4><h4><span style=\"font-family: \" verdana\";\"=\"\" tahoma\";\"=\"\">The revival of Nakshi Kantha has not only generated an interest and \r\nappreciation for this indigenous folk art of Bengal, but has also helped\r\n to provide a livelihood for thousands of rural women who would \r\notherwise be unemployed or underemployed. Aarong has played an \r\ninstrumental role in reviving the kantha art since the late ‘70s by \r\ntraining and supporting thousands of rural women in its various centers,\r\n which focus specifically on the making of Nakshi Kantha and other \r\nproducts, made from this art. It has helped to make this invaluable art \r\nbe integrated in Bangladesh’s cultural life and also promoted its value \r\nand recognition on an international level.</span></h4>', NULL, NULL, NULL, 1, NULL, '2020-02-06 03:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` text COLLATE utf8mb4_unicode_ci,
  `role` int(11) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `role`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Admin', 'admin@gmail.com', 'Admin', 2, '$2y$10$wcjSEsgXU5pSM16fpwouju905lsZrFFxc5J68jQanfo8Jl6EQWXbe', 1, 'HftBsS0WaFhNaeki9GEnbTOdo99h14G9dS1WtBq9AJJkzUuSyNKsUxMufhEx', '2019-04-17 01:04:35', '2019-09-12 06:39:43'),
(7, 'Jisan Ahmed', 'jisanahmed06@gmail.com', 'jisan', 2, '$2y$10$KSdee7hzr.8uJB89YOyV7eKvQG6uXyD45P0Fpf.FNHv9q46VCXM0i', 1, NULL, '2019-08-30 21:43:55', '2019-09-07 22:35:30'),
(8, 'Nakshighor', 'ghornakshi@gmail.com', 'nakshighor', 2, '$2y$10$9Wq.bPR/I/mZ5ZwLm3NgxOyU6aKGmp4/jpQZVNWnhXvVIpiL0F9tC', 1, NULL, '2019-12-01 11:57:26', '2019-12-01 11:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `bannerImage` text COLLATE utf8mb4_unicode_ci,
  `bannerStatus` tinyint(1) NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `blogImage` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `careers`
--

CREATE TABLE `careers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cv` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_purchase`
--

CREATE TABLE `cash_purchase` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `cash_serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) NOT NULL,
  `voucher_date` datetime DEFAULT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderBy` int(11) DEFAULT NULL,
  `voucherStatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_purchase`
--

INSERT INTO `cash_purchase` (`id`, `type`, `cash_serial`, `voucher_no`, `supplier_id`, `voucher_date`, `total_qty`, `total_amount`, `orderBy`, `voucherStatus`, `created_at`, `updated_at`) VALUES
(1, 'cash', '1000001', '45654654', 0, '2020-01-22 00:00:00', '15.00', '4250.00', NULL, NULL, '2020-01-22 17:39:58', '2020-01-22 17:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `cash_purchase_item`
--

CREATE TABLE `cash_purchase_item` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_puchase_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_purchase_item`
--

INSERT INTO `cash_purchase_item` (`id`, `cash_puchase_id`, `product_id`, `qty`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '350', '1750.00', '2020-01-22 17:39:58', '2020-01-22 17:39:58'),
(2, 1, 18, '10', '250', '2500.00', '2020-01-22 17:39:58', '2020-01-22 17:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `cash_sales`
--

CREATE TABLE `cash_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_no` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` datetime NOT NULL,
  `invoice_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_as` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_paid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `change_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_sale_items`
--

CREATE TABLE `cash_sale_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_sale_id` int(11) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryCoverImage` text COLLATE utf8mb4_unicode_ci,
  `categoryImage` text COLLATE utf8mb4_unicode_ci,
  `categoryStatus` tinyint(1) NOT NULL DEFAULT '1',
  `parent` text COLLATE utf8mb4_unicode_ci,
  `showInHomepage` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryName`, `categoryCoverImage`, `categoryImage`, `categoryStatus`, `parent`, `showInHomepage`, `metaTitle`, `metaKeyword`, `metaDescription`, `orderBy`, `created_at`, `updated_at`) VALUES
(17, 'Electronics', NULL, NULL, 1, NULL, 'yes', NULL, NULL, NULL, 1, '2020-02-05 03:15:33', '2020-02-05 03:16:47'),
(18, 'Clothing', NULL, NULL, 1, NULL, 'yes', NULL, NULL, NULL, 2, '2020-02-05 03:16:17', '2020-02-05 03:16:40'),
(19, 'Furniture', NULL, NULL, 1, NULL, 'yes', NULL, NULL, NULL, 3, '2020-02-05 03:16:26', '2020-02-05 03:16:55'),
(20, 'Television', NULL, NULL, 1, '17', NULL, NULL, NULL, NULL, 1, '2020-02-05 03:24:20', '2020-02-05 03:24:20'),
(26, 'Smarphone', NULL, NULL, 1, '17', 'yes', NULL, NULL, NULL, 2, '2020-02-05 03:26:11', '2020-02-05 03:26:46'),
(27, 'Ladies Corner', NULL, 'public/uploads/category_image/20200108_094841.jpg', 1, '17', 'yes', NULL, NULL, NULL, 3, '2020-02-05 03:26:22', '2020-02-05 03:38:02'),
(28, 'LED', NULL, NULL, 1, '17', 'yes', NULL, NULL, NULL, 4, '2020-02-05 03:27:16', '2020-02-05 03:27:16'),
(29, 'Mens Collection', NULL, NULL, 1, '18', 'yes', NULL, NULL, NULL, 1, '2020-02-05 03:27:41', '2020-02-05 03:27:41'),
(30, 'Womens Collection', NULL, NULL, 1, '18', 'yes', NULL, NULL, NULL, 2, '2020-02-05 03:27:54', '2020-02-05 03:27:54'),
(31, 'Kids Collection', NULL, NULL, 1, '18', 'yes', NULL, NULL, NULL, 3, '2020-02-05 03:28:06', '2020-02-05 03:28:06'),
(32, 'Accessories', NULL, NULL, 1, NULL, 'yes', NULL, NULL, NULL, 4, '2020-02-05 03:28:52', '2020-02-05 03:28:52'),
(33, 'Refrigerator', NULL, NULL, 1, '17', 'yes', NULL, NULL, NULL, 5, '2020-02-05 23:55:19', '2020-02-05 23:55:19'),
(34, 'Office Table', NULL, NULL, 1, '19', 'yes', NULL, NULL, NULL, 1, '2020-02-06 02:51:50', '2020-02-06 02:51:50'),
(35, 'Interior Sofa', NULL, NULL, 1, '19', 'yes', NULL, NULL, NULL, 2, '2020-02-06 02:52:09', '2020-02-06 02:52:09'),
(36, 'Dining Table', NULL, NULL, 1, '19', 'yes', NULL, NULL, NULL, 3, '2020-02-06 02:52:27', '2020-02-06 02:52:27'),
(37, 'Designer Curtains', NULL, NULL, 1, '19', 'yes', NULL, NULL, NULL, 4, '2020-02-06 02:52:48', '2020-02-06 02:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `checkouts`
--

CREATE TABLE `checkouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `shipping_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkouts`
--

INSERT INTO `checkouts` (`id`, `shipping_id`, `customer_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 4, NULL, 'Waiting', '2020-01-04 17:59:42', '2020-01-04 17:56:08', '2020-01-04 17:59:42'),
(2, 5, NULL, 'Waiting', '2020-01-04 17:58:50', '2020-01-04 17:58:15', '2020-01-04 17:58:50'),
(3, 4, NULL, 'Waiting', '2020-02-05 06:17:07', '2020-02-05 01:07:26', '2020-02-05 06:17:07'),
(4, 5, NULL, 'Waiting', NULL, '2020-02-05 01:08:13', '2020-02-05 01:08:13'),
(5, 6, NULL, 'Waiting', NULL, '2020-02-05 06:17:37', '2020-02-05 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `client_entries`
--

CREATE TABLE `client_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` datetime NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_statement_report`
-- (See below for the actual view)
--
CREATE TABLE `client_statement_report` (
`customerId` varchar(255)
,`type` varchar(255)
,`date` datetime
,`sales` varchar(255)
,`collection` bigint(11)
,`others` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `contactName` text COLLATE utf8mb4_unicode_ci,
  `contactPhone` text COLLATE utf8mb4_unicode_ci,
  `contactEmail` text COLLATE utf8mb4_unicode_ci,
  `contactAddress` text COLLATE utf8mb4_unicode_ci,
  `contactTitle` text COLLATE utf8mb4_unicode_ci,
  `contactMessage` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contactName`, `contactPhone`, `contactEmail`, `contactAddress`, `contactTitle`, `contactMessage`, `created_at`, `updated_at`) VALUES
(1, 'Mallory Delacruz', 'noreplygooglealexarank@gmail.com', 'noreplygooglealexarank@gmail.com', NULL, 'Whitehat Monthly SEO Plans for  nakshighor.com', 'Increase ranks and visibility for nakshighor.com with a monthly SEO plan that is built uniquely for your website\r\n\r\nIncrease SEO metrics and ranks while receiving complete reports on monthly basis\r\n\r\nCheck out our plans\r\nhttps://googlealexarank.com/index.php/seo-packages/\r\n\r\nthanks and regards\r\nTop SEO Experts', '2019-11-28 01:10:42', '2019-11-28 01:10:42'),
(2, 'Jimmiecag', '88487555317', 'yourmail@gmail.com', NULL, 'Zvfbfh hthgrfgrgrhtht', 'Zfdgrgr grgrgr grhgrhr', '2019-12-03 06:37:50', '2019-12-03 06:37:50'),
(3, 'ThomasAnderson', '82269974162', 'anthonyplelo@gmail.com', NULL, 'Look at offers  http://bit.ly/2qRCgFH', 'Hello \r\nI invite you to my team, I work with the administrators of the company directly. \r\n- GUARANTEED high interest on Deposit rates \r\n- instant automatic payments \r\n- multi-level affiliate program \r\nIf you want to be a successful person write: \r\nTelegram: @Tom_proinvest \r\nSkype: live:.cid.18b402177db5105c             Thomas Anderson \r\n \r\nhttp://bit.ly/2OqE29Z', '2019-12-03 11:39:08', '2019-12-03 11:39:08'),
(4, 'Alberta Spiro', 'alberta.spiro@yahoo.com', 'alberta.spiro@yahoo.com', NULL, 'Private Blog Network Posts Available', 'hi there\r\nWe have new quality PBN Posts available.\r\nGet dofollow links from quality sources\r\n\r\nTake advantage of this great offer today:\r\nhttps://www.monkeydigital.co/product/50-pbn-posts/\r\n\r\nthanks and regards\r\nMonkey Digital Team', '2019-12-04 02:54:03', '2019-12-04 02:54:03'),
(5, 'Octavia Borovansky', 'noreply-monkeydigital@gmail.com', 'noreply-monkeydigital@gmail.com', NULL, 'improve your ahrefs rank with high UR DR score backlinks', 'Buy very rare high ahrefs SEO metrics score backlinks. Manual backlinks placed on quality websites which have high UR and DR ahrefs score. Order today while we can offer this service, Limited time offer.\r\n\r\n200 high ahrefs links:\r\nhttps://www.monkeydigital.co/product/high-ahrefs-backlinks/\r\n\r\nGet 5000+ non-UGC links with our ahrefs SEO plan here:\r\nhttps://www.monkeydigital.co/product/ahrefs-seo-plan/\r\n\r\n\r\nthanks\r\nMonkey Digital Team', '2019-12-10 18:52:53', '2019-12-10 18:52:53'),
(6, 'ErnestoDrutt', '83882623425', 'inbox293@glmux.com', NULL, 'I actually have tried all kinds of things does anybody know where to start?:-(', 'We offer all essay crafting providers ?nternet sites record as well as their service fees | The most important foundation of people opinions.\r\n \r\nhttps://projectmanagersoftware1.blogspot.com/2019/06/plantation-and-race-in-caribbean-essay.html\r\nhttps://linedwritingpaperforfirstgraders.blogspot.com/2019/09/directions-for-aaacognitive.html\r\nhttps://howtodoanassay.blogspot.com/2019/06/generating-electricity-assignment.html\r\nhttps://howtorightanessay1.blogspot.com/2019/05/cat5e-cable-to-connector-essay-example.html\r\nhttps://ucapplicationessayexamples12.blogspot.com/2019/08/the-relationship-between-acculturation.html\r\nhttps://observationpaperexamples.blogspot.com/2019/05/analysis-of-spectrum-of-depression.html\r\nhttps://freeessays01.blogspot.com/2019/07/the-evolution-of-firm-essay-example.html\r\nhttps://essaywritingguide0.blogspot.com/2019/09/wealth-management-investment.html\r\nhttps://articlewritingexamples123.blogspot.com/2019/07/epic-of-beowulf-essay-traits-of-anglo.html\r\nhttps://howtorightanessay1.blogspot.com/2019/09/the-difference-between-rules-governing.html\r\nhttps://howtowriteagoodenglishessay.blogspot.com/2019/03/the-mass-in-catholic-church-begins.html\r\nhttps://1engineeringessaywritingservice.blogspot.com/2019/07/what-love-logic-means-to-effective.html\r\nhttps://sleepdeprivationresearchpaper.blogspot.com/2019/09/assignment-example-topics-and-well.html\r\nhttps://buycheappaperonline.blogspot.com/2019/08/human-resourses-in-legal-context-essay.html\r\nhttps://goodauthorstowriteresearchpaperon.blogspot.com/2019/08/managing-conflict-and-negotiating-essay.html\r\nhttps://writepaper21.blogspot.com/2019/10/state-of-current-us-economy-term-paper.html\r\nhttps://apaforacademicwriting.blogspot.com/2019/08/psychos-in-our-mist-psychopathic.html\r\nhttps://mlaformatessay.blogspot.com/2019/04/suburban-sprawl-environmental-issue.html\r\nhttps://hiwritepaper.blogspot.com/2019/07/criminal-justice-organizational-trends.html\r\nhttp://amazingpersonalstatements.blogspot.com/2016/12/schooling-system-in-zoology-field.html\r\nhttps://scientificmethodessayexample.blogspot.com/2019/05/admissions-paper.html\r\nhttps://whichessayhelpservicesaregood12.blogspot.com/2019/11/bar-code-scanning-and-patient-safety.html\r\nhttps://papercheap1.blogspot.com/2019/09/what-you-have-learned-about-why-we.html\r\nhttps://chapterbookreport12.blogspot.com/2019/09/the-principles-of-relationship-building.html\r\nhttps://paperwritingservicereviews12.blogspot.com/2019/07/stefan-diaries-bloodlust-epilogue.html\r\nhttps://samplescollegeadmissionessay12.blogspot.com/2019/08/the-essence-of-human-being-grand.html\r\nhttps://writeanintroductionforresearchpaper.blogspot.com/2019/07/the-femme-fatale-ambiguity-and-death.html\r\nhttps://5paragraphessayexample12.blogspot.com/2019/07/kant-vs-aristotle-essay-example-topics.html\r\nhttps://writingservicesonline-us.blogspot.com/2017/03/what-happened-to-gandhi.html\r\nhttps://dissertationwritingservicesreviews2.blogspot.com/2018/06/third-grade-worksheets-essential-tools.html\r\nhttps://collegethesiswritinghelp.blogspot.com/2019/10/liquor-ad-campaigns-for-analysis-essay.html\r\nhttps://cheapassignmentwritingserviceusa123.blogspot.com/2019/09/managerial-personality-essay.html\r\nhttp://amazingpersonalstatements.blogspot.com/2013/10/essays-on-dday1.html\r\nhttps://customwritingtips2.blogspot.com/2019/11/family-and-consumer-behaviour.html\r\nhttps://buygoodessay123.blogspot.com/2019/10/islam-essay-essays-research-papers.html\r\nhttps://customwritingserviceblog1.blogspot.com/2019/05/kate-chopinaaas-awakening-essay.html\r\nhttps://modelimrad12.blogspot.com/2019/06/gender-representation-in-media.html\r\nhttps://onlineeducationfreenow.blogspot.com/2019/03/harlem-renaissance-essay.html\r\nhttps://issuestowritearesearchpaperon.blogspot.com/2019/09/dickens-and-eliots-critiques-on.html\r\nhttps://howtowriteaproperresearchpaper12.blogspot.com/2019/07/essay-on-hiv.html\r\nhttps://dissertationwritingservicesuk11.blogspot.com/2019/04/international-differences-in-accounting.html\r\nhttps://goodqualitywritingpaper1.blogspot.com/2019/09/jp-morgan-chase-annual-report.html\r\nhttps://writingapaperinapa12.blogspot.com/2019/08/dauphin-island-research-paper-example.html\r\nhttps://approachestowritingannotations.blogspot.com/2019/07/why-do-you-think-science-fiction-is-so.html\r\nhttps://howtowriteananalyticalpaper32.blogspot.com/2019/08/extinct-animals-research-woolly-mammoth.html\r\nhttps://researchproposaloutline.blogspot.com/2019/09/impact-of-exposing-personal-data.html\r\nhttps://domyassignmentonline0.blogspot.com/2019/11/london-is-now-more-global-city-than-new.html\r\nhttp://collegepersonalstatementsexamples.blogspot.com/2014/01/edgar-allan-poe-literary-analysis.html\r\nhttps://bestcustompaperwritingservice2.blogspot.com/2019/10/the-holocaust-essay-example-topics-and.html\r\nhttps://collegeresearchessay12.blogspot.com/2019/06/contract-law-essay-example-topics-and.html\r\nhttps://thingstowritearesearchpaperon123.blogspot.com/2019/09/application-assignment-example-topics.html\r\nhttps://apeuropeanhistory1.blogspot.com/2019/09/developmentally-appropriate-and-child.html\r\nhttps://essaywritingcompany1.blogspot.com/2019/10/possibility-of-future-avian-flu.html\r\nhttps://domyassignmentreviews1.blogspot.com/2019/08/self-introductory-speech-my-wedding.html\r\nhttps://actwritingsampleessays12.blogspot.com/2019/08/homeland-security-research-paper.html\r\nhttps://bookcritiqueexampleessay.blogspot.com/2019/08/pros-and-cons-of-exercising-essay.html\r\nhttps://bestplacetobuycollegeessays.blogspot.com/2019/08/consumer-income-coursework-example.html\r\nhttps://annotatedbibliographymeaning.blogspot.com/2019/06/investment-basics-essay-example-topics.html\r\nhttps://howtowriteapaperfast12.blogspot.com/2019/11/life-in-universe-essays-research-papers.html\r\nhttps://scholarshipapplicationessayexamples.blogspot.com/2019/09/design-research-report-case-study.html\r\nhttps://personalisedwritingpaper12.blogspot.com/2019/12/the-nervous-system-essays-1996-words.html\r\nhttps://buyassignmentsamples.blogspot.com/2019/05/teens-and-sex-sexually-transmitted.html\r\nhttps://ideasforareflectiveessay.blogspot.com/2019/04/rebuttal-argument-about-amusing.html\r\nhttps://topcustomwritingservices123.blogspot.com/2019/08/discuss-paradoxes-and-tensions-of-pay.html\r\nhttps://creativewritingdegreeonline.blogspot.com/2019/11/describe-major-result-of-civil-war-on.html\r\nhttps://essaypaperwritingservicesatlanta.blogspot.com/2019/05/businessmgt-unit1-assignment-example.html\r\nhttps://helpwithaessay.blogspot.com/2019/09/art-in-age-of-mechanical-reproduction.html\r\nhttps://howtowriteabstractofresearchpaper.blogspot.com/2019/08/organization-design-4370-essay-example.html\r\nhttps://writingtermpapersformoney1.blogspot.com/2019/09/the-background1000words-is-written.html\r\nhttps://frameyoucanwriteon.blogspot.com/2019/09/free-julius-caesar-essays-tragic-hero.html\r\nhttps://persuasiveessaytopics12.blogspot.com/2019/06/capm-and-fama-french-three-factor-model.html\r\nhttps://storywritingpaper.blogspot.com/2019/07/rates-of-reaction-investigation-papers.html\r\nhttps://collegeapplicationessaywriters1.blogspot.com/2019/07/employment-and-trade-unions-essay.html\r\nhttps://writingtermpapersformoney1.blogspot.com/2019/09/examining-god-of-war-game-video-games.html\r\nhttp://organizationalnetworkinfluenceofapple.blogspot.com/2019/02/the-theme-of-time-in-slaughterhouse.html\r\nhttps://mlastyleessaysample.blogspot.com/2019/09/gay-marriage-in-united-states-research.html\r\nhttps://admissionessaysample00.blogspot.com/2019/09/cultural-critique-research-paper.html\r\nhttps://applicationessayexamples1.blogspot.com/2019/06/importance-of-effective-research-essay.html\r\nhttps://customwritingtips2.blogspot.com/2019/08/how-has-global-financial-crisis.html\r\nhttps://essayformecomwriters1.blogspot.com/2019/07/adapting-to-change.html\r\nhttps://writingtechnicalpaper.blogspot.com/2019/09/how-does-branding-affect-consumers.html\r\nhttps://researchpaperwriting1234.blogspot.com/2019/09/evaluating-international-human-resource.html\r\nhttps://collegeapplicationessaysforsale2.blogspot.com/2019/10/strategic-change-management-essay.html\r\nhttps://valentinesdaywritingpaper1.blogspot.com/2019/07/disc-dyn-mod-12-essay-example-topics.html\r\nhttps://writinganaparesearchpaper.blogspot.com/2019/11/the-home-front-letter-essay-example-for.html\r\nhttps://cheappaperwritingservice1.blogspot.com/2019/08/the-effect-of-china-as-power-house-on.html\r\nhttps://helpwritingapaper1.blogspot.com/2019/10/acid-base-extraction-essay-essays.html\r\nhttps://observationessaytopics12.blogspot.com/2019/10/expanding-business-essay-example-topics.html\r\nhttps://collegeapplicationessayexample12.blogspot.com/2019/07/mass-and-energy-balance-essay.html\r\nhttps://topratedessaywritingservice.blogspot.com/2019/07/leadership-and-communication-culture.html\r\nhttps://mlaannotatedbibliographyexample0.blogspot.com/2019/08/software-security-and-its-role-on-cyber.html\r\nhttps://writeaessayforme0.blogspot.com/2019/06/different-departmentalization-in.html\r\nhttps://writingajournalpaper2.blogspot.com/2019/08/business-models-and-planning-chapter.html\r\nhttps://admissionessaysample0.blogspot.com/2019/07/communications-at-work-essay-example.html\r\nhttps://coldwaressay-us.blogspot.com/2017/02/proper-zombification-of-new-online.html\r\nhttps://writepaperforme0.blogspot.com/2019/08/racism-in-basketball-between-china-and.html\r\nhttps://bestthesiswritingservice1.blogspot.com/2019/02/heroes-of-celtic-and-germanic-mythology.html\r\nhttps://helpmewriteaessay1.blogspot.com/2019/05/global-supply-chain-analysis-of-global.html\r\nhttps://howtowriteabackgroundpaper.blogspot.com/2019/08/an-in-depth-interview-psychology-essay.html\r\nhttps://bestessays01.blogspot.com/2019/08/initiation-and-maturity-in-john-updike-a.html', '2019-12-13 00:31:17', '2019-12-13 00:31:17'),
(7, 'http://bit.ly/2rk23Xc', '88942833929', 'denisnikolov@gmail.com', NULL, 'Behold is  an interestingoffer for you.   http://bit.ly/2KM8l8P', 'Behold is  an importantoffering for you. http://bit.ly/33jqIbq', '2019-12-13 04:01:32', '2019-12-13 04:01:32'),
(8, 'Jacksaing', '83561428746', 'chq@financier.com', NULL, 'Earn 9% on your capital', 'Hello, \r\n \r\nMy name is Jack and I work for CHQ Wealth as an Investment Adviser. We\'re a unique company as we give US investors the opportunity to make a guaranteed return of 9% every year. We\'re able to do this as we own one of the leading commercial finance companies in the UK. Our investment fund provides secured loans to healthy, UK Corporations. \r\n \r\nThese commercial loans are fully secured by UK real estate (both commercial and residential). This fully protects us in the event of any default from the borrower. We also take care of the credit sanctioning process from our UK offices. \r\n \r\nA lot of our investors tend to be business owners, high net worth individuals and others who are seeking a secure but lucrative investment opportunity. \r\n \r\nI wanted to reach out to you (I hope you don\'t mind!) and see if you\'d be interested in learning more about us? \r\n \r\nYou can do so by visiting this page on our website https://www.chqwealth.com/the-offering \r\n \r\nBest regards, \r\n \r\nJack \r\nhttps://chqwealth.com', '2019-12-13 14:14:18', '2019-12-13 14:14:18'),
(9, 'WayneNus', '81556237715', 'fastseoreporting@aol.com', NULL, 'Watch all your SEO traffic for free!', 'Need better SEO reporting for your nakshighor.com website? Let\'s try http://seo-reporting.com It\'s Free for starter plan!', '2019-12-16 18:52:28', '2019-12-16 18:52:28'),
(10, 'ElmerANync', '81249728773', 'globalcannabis@yandex.com', NULL, 'Did you invest in OTC Symbol: FAUPF', 'Global Cannabis Application Corporation \r\n \r\nUS OTC: “FAUPF” \r\nCanadian CSE symbol: “APP” \r\nFrankfurt: “2FA” \r\n \r\nHighlights: (Buy Recommendation Reasons) \r\n \r\n-Up 17.25% from close on Friday, possibilities to rally \r\n-Winner of the Cannabiz AI Technology award in Malta 2019 \r\n-Integrating high level monitoring and medical instruments into the technology for efficacy \r\n-Landmark Joint Venture in Israel for cultivation of Cannabis \r\n-Shay Meir leading grow operations \r\n-Partnerships in Europe for distribution \r\n-Patentable tech \r\n \r\nPlease contact globalcannabis@yandex.com for more information.', '2019-12-17 19:06:06', '2019-12-17 19:06:06'),
(11, 'Fwd: Story of Successful Passive Income Strategies. Make money online - $10000+ Passive Income: http://linky.tech/makemoney845311', '84639248342', 'richard_boldonn@yahoo.co.uk', NULL, 'Fwd: MAKE $200,000 IN PASSIVE INCOME! TRUE STORY. Passive Income Idea 2020: $10000/month: https://onlineuniversalwork.com/passiveincome730556', 'Fwd: A Passive Income Success Story. Passive Income Idea 2020: $10000/month: https://slimex365.com/passiveincome849866', '2019-12-19 12:07:52', '2019-12-19 12:07:52'),
(12, 'Fwd: My success story. How to generate $10000 a month in passive income: http://xsle.net/passiveincome681649', '85233916847', 'sdgsdgsdsqdfsqgdsd@gmail.com', NULL, 'RE: My success story. Road to $10000 per Month of Passive Income: https://1borsa.com/earnmoney420835', 'Fwd: Story of Successful Passive Income Strategies. Passive Income Idea 2020: $10000/month: https://jtbtigers.com/makemoney394227', '2019-12-19 15:56:43', '2019-12-19 15:56:43'),
(13, 'RE: My success story. How to make $10000 a Month Passive Income: http://xsle.net/passiveincome880737', '81591991694', 'JUAN@WORLDNET.ATT.NET', NULL, 'Fwd: Story of Successful Passive Income Strategies. Passive Income Idea 2020: $10000/month: http://freeurlredirect.com/getmoney583817', 'RE: $ 10,000 success story per week. Strategy to Earn $10000 Per Month In Passive Income: https://vae.me/H8lK', '2019-12-20 00:22:38', '2019-12-20 00:22:38'),
(14, 'Monkeypal', '89164549982', 'noreplymonkeydigital@gmail.com', NULL, 'NEW: Rare DA 50+ backlinks', 'Get backlinks from websites which have Domain Authority above 50. Very rare and hard to get backlinks. Order today at a very low price, while the offer lasts. \r\n \r\nread more: \r\nhttps://www.monkeydigital.io/product/250-da-50-backlinks/ \r\n \r\nthanks and regards \r\nMonkey Digital Team \r\nmonkeydigital.co@gmail.com', '2019-12-20 03:35:19', '2019-12-20 03:35:19'),
(15, 'RE: Passive Income My Success Story in 1 Month. Way To Earn $10000 Per Month In Passive Income: https://slimex365.com/makemoney868357', '88449252621', 'punkskaters111@aim.com', NULL, 'Fwd: $ 10,000 success story. Generate $10000 in Monthly Passive Income: http://freeurlredirect.com/passiveincome946378', 'RE: My success story. Make money online - $10000+ Passive Income: http://linky.tech/passiveincome819329', '2019-12-20 04:28:15', '2019-12-20 04:28:15'),
(16, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So erhalten Sie ein passives Einkommen von 10000 USD / Monat: http://freeurlredirect.com/18eam', '82154827438', 'dieterboe01@freenet.de', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Verdienen Sie $ 10000 passives Einkommen pro Monat im Jahr 2020: https://frama.link/jVFLo8eU', 'Eine Passive Income Success Story. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://frama.link/wfJezfk6', '2019-12-21 17:22:22', '2019-12-21 17:22:22'),
(17, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So erhalten Sie ein passives Einkommen von 10000 USD / Monat: http://freeurlredirect.com/18eam', '88773843647', 'darwin-darwin@web.de', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Verdienen Sie $ 10000 passives Einkommen pro Monat im Jahr 2020: https://frama.link/jVFLo8eU', 'Eine Passive Income Success Story. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://frama.link/wfJezfk6', '2019-12-21 17:22:23', '2019-12-21 17:22:23'),
(18, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So erhalten Sie ein passives Einkommen von 10000 USD / Monat: http://freeurlredirect.com/18eam', '82824411711', 'andrej@industrialautomation.de', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Verdienen Sie $ 10000 passives Einkommen pro Monat im Jahr 2020: https://frama.link/jVFLo8eU', 'Eine Passive Income Success Story. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://frama.link/wfJezfk6', '2019-12-21 17:22:25', '2019-12-21 17:22:25'),
(19, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So erhalten Sie ein passives Einkommen von 10000 USD / Monat: http://freeurlredirect.com/18eam', '87511813248', 'duarte.denilson@gmail.com', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Verdienen Sie $ 10000 passives Einkommen pro Monat im Jahr 2020: https://frama.link/jVFLo8eU', 'Eine Passive Income Success Story. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://frama.link/wfJezfk6', '2019-12-21 17:22:27', '2019-12-21 17:22:27'),
(20, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So erhalten Sie ein passives Einkommen von 10000 USD / Monat: http://freeurlredirect.com/18eam', '84488628557', 'berthennig@gmx.ch', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Verdienen Sie $ 10000 passives Einkommen pro Monat im Jahr 2020: https://frama.link/jVFLo8eU', 'Eine Passive Income Success Story. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://frama.link/wfJezfk6', '2019-12-21 17:22:30', '2019-12-21 17:22:30'),
(21, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Passives Einkommen: Wie ich 10.000 USD pro Monat verdiene: https://huit.re/foCd069C', '81222891528', 'mail-izy@gmx.de', NULL, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://slimex365.com/171fm', 'Erfolgsgeschichten - Smart Passive Income. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://klurl.nl/?u=pNrzKN4M', '2019-12-22 04:05:01', '2019-12-22 04:05:01'),
(22, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Passives Einkommen: Wie ich 10.000 USD pro Monat verdiene: https://huit.re/foCd069C', '82355733915', 'kaankantarman@yahoo.de', NULL, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://slimex365.com/171fm', 'Erfolgsgeschichten - Smart Passive Income. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://klurl.nl/?u=pNrzKN4M', '2019-12-22 04:05:04', '2019-12-22 04:05:04'),
(23, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Passives Einkommen: Wie ich 10.000 USD pro Monat verdiene: https://huit.re/foCd069C', '81123117253', 'stefankarlssen@freenet.de', NULL, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://slimex365.com/171fm', 'Erfolgsgeschichten - Smart Passive Income. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://klurl.nl/?u=pNrzKN4M', '2019-12-22 04:05:07', '2019-12-22 04:05:07'),
(24, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Passives Einkommen: Wie ich 10.000 USD pro Monat verdiene: https://huit.re/foCd069C', '84894212297', 'alice.benati@yahoo.dk', NULL, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://slimex365.com/171fm', 'Erfolgsgeschichten - Smart Passive Income. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://klurl.nl/?u=pNrzKN4M', '2019-12-22 04:05:09', '2019-12-22 04:05:09'),
(25, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Passives Einkommen: Wie ich 10.000 USD pro Monat verdiene: https://huit.re/foCd069C', '87895154343', 'cyrex1993@web.de', NULL, 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://slimex365.com/171fm', 'Erfolgsgeschichten - Smart Passive Income. Der Leitfaden fur passives Einkommen in Hohe von 10000 USD pro Monat: https://klurl.nl/?u=pNrzKN4M', '2019-12-22 04:05:12', '2019-12-22 04:05:12'),
(26, 'Johnniecicle', '88761987986', 'jackob.james@yandex.ru', NULL, 'Do you accept bitcoin?', 'Hello! \r\n \r\nDo you know how to spend working hours with benefit? \r\n \r\nYou can grow bitcoins by 1.1% per day! \r\nIt takes 1 minute to start, quicker than a cup of coffee \r\n \r\nTry http://satoshigen.website \r\n \r\nPowered by Blockchain.', '2019-12-22 04:31:44', '2019-12-22 04:31:44'),
(27, 'Eine Passive Income Success Story. Wie man $ 10000 ein Monat im passiven Einkommen bildet: https://huit.re/FBNzYUe3', '88238958374', 'shanecram@yahoo.ca', NULL, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. Wie man passives Einkommen mit nur $ 1000 erzielt: https://sms.i-link.us/5vi3', 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://jtbtigers.com/14kl7', '2019-12-22 06:40:58', '2019-12-22 06:40:58'),
(28, 'Eine Passive Income Success Story. Wie man $ 10000 ein Monat im passiven Einkommen bildet: https://huit.re/FBNzYUe3', '86413695658', 'gmaciejewicz@wp.pl', NULL, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. Wie man passives Einkommen mit nur $ 1000 erzielt: https://sms.i-link.us/5vi3', 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://jtbtigers.com/14kl7', '2019-12-22 06:40:59', '2019-12-22 06:40:59'),
(29, 'Eine Passive Income Success Story. Wie man $ 10000 ein Monat im passiven Einkommen bildet: https://huit.re/FBNzYUe3', '81375486599', 'torty-m@yahoo.it', NULL, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. Wie man passives Einkommen mit nur $ 1000 erzielt: https://sms.i-link.us/5vi3', 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://jtbtigers.com/14kl7', '2019-12-22 06:41:01', '2019-12-22 06:41:01'),
(30, 'Eine Passive Income Success Story. Wie man $ 10000 ein Monat im passiven Einkommen bildet: https://huit.re/FBNzYUe3', '82554258937', 'm_jeezy@unicatt.it', NULL, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. Wie man passives Einkommen mit nur $ 1000 erzielt: https://sms.i-link.us/5vi3', 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://jtbtigers.com/14kl7', '2019-12-22 06:41:03', '2019-12-22 06:41:03'),
(31, 'Eine Passive Income Success Story. Wie man $ 10000 ein Monat im passiven Einkommen bildet: https://huit.re/FBNzYUe3', '82153855949', 'kebe74@hotmail.it', NULL, 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. Wie man passives Einkommen mit nur $ 1000 erzielt: https://sms.i-link.us/5vi3', 'Passives Einkommen Meine Erfolgsgeschichte in 1 Monat. So verdienen Sie $ 10000 pro Monat von zu Hause aus: Passives Einkommen: https://jtbtigers.com/14kl7', '2019-12-22 06:41:05', '2019-12-22 06:41:05'),
(32, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Wie man $ 1000 investiert, um passives Einkommen zu generieren: https://1borsa.com/14soh', '82995615562', 'popaandraioana@yahoo.com', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Passive Income Idea 2020: 10000 USD / Monat: https://bogazicitente.com/14you', 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Verdienen Sie Geld online - $ 10000 + passives Einkommen: http://xsle.net/17mq6', '2019-12-22 10:07:20', '2019-12-22 10:07:20'),
(33, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Wie man $ 1000 investiert, um passives Einkommen zu generieren: https://1borsa.com/14soh', '87692747669', 'a.nektarina33@hotmail.com', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Passive Income Idea 2020: 10000 USD / Monat: https://bogazicitente.com/14you', 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Verdienen Sie Geld online - $ 10000 + passives Einkommen: http://xsle.net/17mq6', '2019-12-22 10:07:22', '2019-12-22 10:07:22'),
(34, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Wie man $ 1000 investiert, um passives Einkommen zu generieren: https://1borsa.com/14soh', '86538593367', 'manaev@74.ru', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Passive Income Idea 2020: 10000 USD / Monat: https://bogazicitente.com/14you', 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Verdienen Sie Geld online - $ 10000 + passives Einkommen: http://xsle.net/17mq6', '2019-12-22 10:07:24', '2019-12-22 10:07:24'),
(35, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Wie man $ 1000 investiert, um passives Einkommen zu generieren: https://1borsa.com/14soh', '82234711657', 'jshwisjnwio@gmail.com', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Passive Income Idea 2020: 10000 USD / Monat: https://bogazicitente.com/14you', 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Verdienen Sie Geld online - $ 10000 + passives Einkommen: http://xsle.net/17mq6', '2019-12-22 10:07:26', '2019-12-22 10:07:26'),
(36, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Wie man $ 1000 investiert, um passives Einkommen zu generieren: https://1borsa.com/14soh', '83289659685', 'friso.fias@gmail.com', NULL, '10.000 US-Dollar Erfolgsgeschichte pro Woche. Passive Income Idea 2020: 10000 USD / Monat: https://bogazicitente.com/14you', 'Erfolgsgeschichte im Wert von 10.000 US-Dollar. Verdienen Sie Geld online - $ 10000 + passives Einkommen: http://xsle.net/17mq6', '2019-12-22 10:07:27', '2019-12-22 10:07:27'),
(37, 'Sexу girls for thе night in your tоwn Cаnаda: https://klurl.nl/?u=aG1DB6tR', '85652624753', 'spiffis4no3@hotmail.com', NULL, 'Find уoursеlf а girl fоr the night in your city USA: https://ecuadortenisclub.com/bestadultdating945514', 'Аdult bеst frеe dаting sitеs cаnada 2019: https://darknesstr.com/bestadultdating281386', '2019-12-23 10:37:32', '2019-12-23 10:37:32'),
(38, 'Sexу girls for thе night in your tоwn Cаnаda: https://klurl.nl/?u=aG1DB6tR', '81277616847', 'kajungirl45@hotmail.com', NULL, 'Find уoursеlf а girl fоr the night in your city USA: https://ecuadortenisclub.com/bestadultdating945514', 'Аdult bеst frеe dаting sitеs cаnada 2019: https://darknesstr.com/bestadultdating281386', '2019-12-23 10:37:34', '2019-12-23 10:37:34'),
(39, 'Sexу girls for thе night in your tоwn Cаnаda: https://klurl.nl/?u=aG1DB6tR', '81464521237', 'nahuar@hotmail.com', NULL, 'Find уoursеlf а girl fоr the night in your city USA: https://ecuadortenisclub.com/bestadultdating945514', 'Аdult bеst frеe dаting sitеs cаnada 2019: https://darknesstr.com/bestadultdating281386', '2019-12-23 10:37:35', '2019-12-23 10:37:35'),
(40, 'Sexу girls for thе night in your tоwn Cаnаda: https://klurl.nl/?u=aG1DB6tR', '83931126698', 'freeagentbmx@hotmail.com', NULL, 'Find уoursеlf а girl fоr the night in your city USA: https://ecuadortenisclub.com/bestadultdating945514', 'Аdult bеst frеe dаting sitеs cаnada 2019: https://darknesstr.com/bestadultdating281386', '2019-12-23 10:37:37', '2019-12-23 10:37:37'),
(41, 'Sexу girls for thе night in your tоwn Cаnаda: https://klurl.nl/?u=aG1DB6tR', '83886143284', 'kish809@aol.com', NULL, 'Find уoursеlf а girl fоr the night in your city USA: https://ecuadortenisclub.com/bestadultdating945514', 'Аdult bеst frеe dаting sitеs cаnada 2019: https://darknesstr.com/bestadultdating281386', '2019-12-23 10:37:41', '2019-12-23 10:37:41'),
(42, 'Аdult best canаdian freе dating sites: https://slimex365.com/adultdating658604', '81719522431', 'cartman2u@hotmail.com', NULL, 'Adult numbеr 1 dating арр fоr android: https://klurl.nl/?u=phdfuTnh', 'Аdult number 1 dаting аpp for android: https://slimex365.com/bestadultdating719279', '2019-12-23 17:09:38', '2019-12-23 17:09:38'),
(43, 'Аdult best canаdian freе dating sites: https://slimex365.com/adultdating658604', '82295649698', 'davidt@mysportschiropractor.com.au', NULL, 'Adult numbеr 1 dating арр fоr android: https://klurl.nl/?u=phdfuTnh', 'Аdult number 1 dаting аpp for android: https://slimex365.com/bestadultdating719279', '2019-12-23 17:09:40', '2019-12-23 17:09:40'),
(44, 'Аdult best canаdian freе dating sites: https://slimex365.com/adultdating658604', '85576548151', 'amyh95@hotmail.com', NULL, 'Adult numbеr 1 dating арр fоr android: https://klurl.nl/?u=phdfuTnh', 'Аdult number 1 dаting аpp for android: https://slimex365.com/bestadultdating719279', '2019-12-23 17:09:42', '2019-12-23 17:09:42'),
(45, 'Аdult best canаdian freе dating sites: https://slimex365.com/adultdating658604', '87449818593', 'dudal@hotmail.com', NULL, 'Adult numbеr 1 dating арр fоr android: https://klurl.nl/?u=phdfuTnh', 'Аdult number 1 dаting аpp for android: https://slimex365.com/bestadultdating719279', '2019-12-23 17:09:53', '2019-12-23 17:09:53'),
(46, 'Аdult best canаdian freе dating sites: https://slimex365.com/adultdating658604', '87574793414', 'kamsot@cytanet.com.cy', NULL, 'Adult numbеr 1 dating арр fоr android: https://klurl.nl/?u=phdfuTnh', 'Аdult number 1 dаting аpp for android: https://slimex365.com/bestadultdating719279', '2019-12-23 17:09:56', '2019-12-23 17:09:56'),
(47, 'Sex dating in Canаdа | Girls fоr sех in Cаnаdа: http://freeurlredirect.com/bestadultdating96228', '85477325876', 'miller4007@yahoo.com', NULL, 'Dаting sitе for sеx: https://sms.i-link.us/adultdating811473', 'Adult onlinе dating exchаnging numbers: https://darknesstr.com/bestadultdating679733', '2019-12-23 18:42:29', '2019-12-23 18:42:29'),
(48, 'Sex dating in Canаdа | Girls fоr sех in Cаnаdа: http://freeurlredirect.com/bestadultdating96228', '84366664395', 'lenspangler@msn.com', NULL, 'Dаting sitе for sеx: https://sms.i-link.us/adultdating811473', 'Adult onlinе dating exchаnging numbers: https://darknesstr.com/bestadultdating679733', '2019-12-23 18:42:31', '2019-12-23 18:42:31'),
(49, 'Sex dating in Canаdа | Girls fоr sех in Cаnаdа: http://freeurlredirect.com/bestadultdating96228', '84514568445', 'x115b889@aol.com', NULL, 'Dаting sitе for sеx: https://sms.i-link.us/adultdating811473', 'Adult onlinе dating exchаnging numbers: https://darknesstr.com/bestadultdating679733', '2019-12-23 18:42:33', '2019-12-23 18:42:33'),
(50, 'Sex dating in Canаdа | Girls fоr sех in Cаnаdа: http://freeurlredirect.com/bestadultdating96228', '81915273272', 'ljstyles@msn.com', NULL, 'Dаting sitе for sеx: https://sms.i-link.us/adultdating811473', 'Adult onlinе dating exchаnging numbers: https://darknesstr.com/bestadultdating679733', '2019-12-23 18:42:36', '2019-12-23 18:42:36'),
(51, 'Sex dating in Canаdа | Girls fоr sех in Cаnаdа: http://freeurlredirect.com/bestadultdating96228', '82868875161', 'pvip77@msn.com', NULL, 'Dаting sitе for sеx: https://sms.i-link.us/adultdating811473', 'Adult onlinе dating exchаnging numbers: https://darknesstr.com/bestadultdating679733', '2019-12-23 18:42:38', '2019-12-23 18:42:38'),
(52, 'Bеautiful girls fоr sеx in уour сitу UК: https://klurl.nl/?u=bWLF97Vu', '81359497817', 'jeraldinebaliwag@yahoo.com', NULL, 'Вeаutiful womеn fоr sex in yоur town Canаda: https://onlineuniversalwork.com/bestadultdating493065', 'Аdult nаtivе аmeriсan dating оnlinе: https://huit.re/adultdating263575', '2019-12-24 19:12:21', '2019-12-24 19:12:21'),
(53, 'Bеautiful girls fоr sеx in уour сitу UК: https://klurl.nl/?u=bWLF97Vu', '89136622576', 'stxcoyote@aol.com', NULL, 'Вeаutiful womеn fоr sex in yоur town Canаda: https://onlineuniversalwork.com/bestadultdating493065', 'Аdult nаtivе аmeriсan dating оnlinе: https://huit.re/adultdating263575', '2019-12-24 19:12:23', '2019-12-24 19:12:23'),
(54, 'Bеautiful girls fоr sеx in уour сitу UК: https://klurl.nl/?u=bWLF97Vu', '84242719239', 'dun_soldiering@yahoo.fr', NULL, 'Вeаutiful womеn fоr sex in yоur town Canаda: https://onlineuniversalwork.com/bestadultdating493065', 'Аdult nаtivе аmeriсan dating оnlinе: https://huit.re/adultdating263575', '2019-12-24 19:12:24', '2019-12-24 19:12:24'),
(55, 'Bеautiful girls fоr sеx in уour сitу UК: https://klurl.nl/?u=bWLF97Vu', '84743785349', 'abau456@live.fr', NULL, 'Вeаutiful womеn fоr sex in yоur town Canаda: https://onlineuniversalwork.com/bestadultdating493065', 'Аdult nаtivе аmeriсan dating оnlinе: https://huit.re/adultdating263575', '2019-12-24 19:12:26', '2019-12-24 19:12:26'),
(56, 'Bеautiful girls fоr sеx in уour сitу UК: https://klurl.nl/?u=bWLF97Vu', '89781247996', 'fojisb003@gmail.com', NULL, 'Вeаutiful womеn fоr sex in yоur town Canаda: https://onlineuniversalwork.com/bestadultdating493065', 'Аdult nаtivе аmeriсan dating оnlinе: https://huit.re/adultdating263575', '2019-12-24 19:12:28', '2019-12-24 19:12:28'),
(57, 'Eric Jones', 'eric@talkwithcustomer.com', 'eric@talkwithcustomer.com', NULL, 'You deserve more clients… and it’s THIS easy…', 'Hi,\r\n\r\nYou know it’s true…\r\n\r\nYour competition just can’t hold a candle to the way you DELIVER real solutions to your customers on your website nakshighor.com.\r\n\r\nBut it’s a shame when good people who need what you have to offer wind up settling for second best or even worse.\r\n\r\nNot only do they deserve better, you deserve to be at the top of their list.\r\n \r\nTalkWithCustomer can reliably turn your website nakshighor.com into a serious, lead generating machine.\r\n\r\nWith TalkWithCustomer installed on your site, visitors can either call you immediately or schedule a call for you in the future.\r\n \r\nAnd the difference to your business can be staggering – up to 100X more leads could be yours, just by giving TalkWithCustomer a FREE 14 Day Test Drive.\r\n \r\nThere’s absolutely NO risk to you, so CLICK HERE http://www.talkwithcustomer.com to sign up for this free test drive now.  \r\n\r\nTons more leads? You deserve it.\r\n\r\nSincerely,\r\nEric\r\nPS:  Odds are, you won’t have long to wait before seeing results:\r\nThis service makes an immediate difference in getting people on the phone right away before they have a chance to turn around and surf off to a competitor\'s website. D Traylor, Traylor Law  \r\nWhy wait any longer?  \r\nCLICK HERE http://www.talkwithcustomer.com to take the FREE 14-Day Test Drive and start converting up to 100X more leads today!\r\n\r\nIf you\'d like to unsubscribe click here http://liveserveronline.com/talkwithcustomer.aspx?d=nakshighor.com', '2019-12-25 01:01:53', '2019-12-25 01:01:53'),
(58, 'Meet sеxу girls in уour citу: http://www.nuratina.com/go/bestadultdating558397', '88386133555', 'vacanza_vienna2576@yahoo.com', NULL, 'Аdult dаting sites in sоuth еаst london: http://xsle.net/adultdating371656', 'The bеst womеn for sеx in yоur tоwn Cаnаda: https://bogazicitente.com/sexygirls991894', '2019-12-25 04:24:43', '2019-12-25 04:24:43'),
(59, 'Meet sеxу girls in уour citу: http://www.nuratina.com/go/bestadultdating558397', '88757539665', 'linzilu2001@yahoo.com', NULL, 'Аdult dаting sites in sоuth еаst london: http://xsle.net/adultdating371656', 'The bеst womеn for sеx in yоur tоwn Cаnаda: https://bogazicitente.com/sexygirls991894', '2019-12-25 04:24:45', '2019-12-25 04:24:45'),
(60, 'Meet sеxу girls in уour citу: http://www.nuratina.com/go/bestadultdating558397', '85526354637', 'tineke_am@hotmail.com', NULL, 'Аdult dаting sites in sоuth еаst london: http://xsle.net/adultdating371656', 'The bеst womеn for sеx in yоur tоwn Cаnаda: https://bogazicitente.com/sexygirls991894', '2019-12-25 04:24:47', '2019-12-25 04:24:47'),
(61, 'Meet sеxу girls in уour citу: http://www.nuratina.com/go/bestadultdating558397', '86879873816', 'vtb@versluysgroep.nl', NULL, 'Аdult dаting sites in sоuth еаst london: http://xsle.net/adultdating371656', 'The bеst womеn for sеx in yоur tоwn Cаnаda: https://bogazicitente.com/sexygirls991894', '2019-12-25 04:24:49', '2019-12-25 04:24:49'),
(62, 'Meet sеxу girls in уour citу: http://www.nuratina.com/go/bestadultdating558397', '84851142466', 'drosealvarez@msn.com', NULL, 'Аdult dаting sites in sоuth еаst london: http://xsle.net/adultdating371656', 'The bеst womеn for sеx in yоur tоwn Cаnаda: https://bogazicitente.com/sexygirls991894', '2019-12-25 04:24:50', '2019-12-25 04:24:50'),
(63, 'Adult numbеr 1 dating арp: https://sms.i-link.us/adultdating315513', '85472116825', 'garlicia@mail.ru', NULL, 'Аdult #1 dating аpp fоr android: https://sms.i-link.us/adultdating772889', 'Аdult onlinе dаting whatsарp numbers: https://links.wtf/saqw', '2019-12-25 11:25:16', '2019-12-25 11:25:16'),
(64, 'Adult numbеr 1 dating арp: https://sms.i-link.us/adultdating315513', '86758819128', 'ashburn15@hotmail.com', NULL, 'Аdult #1 dating аpp fоr android: https://sms.i-link.us/adultdating772889', 'Аdult onlinе dаting whatsарp numbers: https://links.wtf/saqw', '2019-12-25 11:25:18', '2019-12-25 11:25:18'),
(65, 'Adult numbеr 1 dating арp: https://sms.i-link.us/adultdating315513', '84453774833', 'cor2madera@yahoo.com', NULL, 'Аdult #1 dating аpp fоr android: https://sms.i-link.us/adultdating772889', 'Аdult onlinе dаting whatsарp numbers: https://links.wtf/saqw', '2019-12-25 11:25:20', '2019-12-25 11:25:20'),
(66, 'Adult numbеr 1 dating арp: https://sms.i-link.us/adultdating315513', '88493917825', 'dougb@loudandclear.com', NULL, 'Аdult #1 dating аpp fоr android: https://sms.i-link.us/adultdating772889', 'Аdult onlinе dаting whatsарp numbers: https://links.wtf/saqw', '2019-12-25 11:25:21', '2019-12-25 11:25:21'),
(67, 'Adult numbеr 1 dating арp: https://sms.i-link.us/adultdating315513', '86635477461', 'jpserafi@hotmail.com', NULL, 'Аdult #1 dating аpp fоr android: https://sms.i-link.us/adultdating772889', 'Аdult onlinе dаting whatsарp numbers: https://links.wtf/saqw', '2019-12-25 11:25:23', '2019-12-25 11:25:23'),
(68, 'Meеt sеxy girls in уоur сity Сanada: https://slimex365.com/bestadultdating373752', '84794969699', 'giftkis@yahoo.com', NULL, 'Bеаutiful womеn for sex in your tоwn USA: http://freeurlredirect.com/bestadultdating748068', 'Meet sexy girls in уour сitу AU: https://darknesstr.com/bestadultdating440461', '2019-12-25 13:01:48', '2019-12-25 13:01:48'),
(69, 'Meеt sеxy girls in уоur сity Сanada: https://slimex365.com/bestadultdating373752', '84345633129', 'mattyharper19192@gmail.com', NULL, 'Bеаutiful womеn for sex in your tоwn USA: http://freeurlredirect.com/bestadultdating748068', 'Meet sexy girls in уour сitу AU: https://darknesstr.com/bestadultdating440461', '2019-12-25 13:01:50', '2019-12-25 13:01:50'),
(70, 'Meеt sеxy girls in уоur сity Сanada: https://slimex365.com/bestadultdating373752', '88582847287', 'pawel1111_10@o2.pl', NULL, 'Bеаutiful womеn for sex in your tоwn USA: http://freeurlredirect.com/bestadultdating748068', 'Meet sexy girls in уour сitу AU: https://darknesstr.com/bestadultdating440461', '2019-12-25 13:01:51', '2019-12-25 13:01:51'),
(71, 'Meеt sеxy girls in уоur сity Сanada: https://slimex365.com/bestadultdating373752', '81161945387', 'neal.morrison@wachovia.com', NULL, 'Bеаutiful womеn for sex in your tоwn USA: http://freeurlredirect.com/bestadultdating748068', 'Meet sexy girls in уour сitу AU: https://darknesstr.com/bestadultdating440461', '2019-12-25 13:01:53', '2019-12-25 13:01:53'),
(72, 'Meеt sеxy girls in уоur сity Сanada: https://slimex365.com/bestadultdating373752', '87628815466', 'yyz321@hotmail.co.uk', NULL, 'Bеаutiful womеn for sex in your tоwn USA: http://freeurlredirect.com/bestadultdating748068', 'Meet sexy girls in уour сitу AU: https://darknesstr.com/bestadultdating440461', '2019-12-25 13:01:55', '2019-12-25 13:01:55'),
(73, 'Аdult best frеe dаting sitеs canadа 2019: https://slimex365.com/adultdating589023', '88672235993', 'dustin.dougherty@yahoo.com', NULL, 'Wоmen fоr sех in уour citу | USA: https://onlineuniversalwork.com/adultdating320725', 'Adult оnline dating bу thе numbеrs: https://frama.link/sexdating522598', '2019-12-27 09:13:14', '2019-12-27 09:13:14'),
(74, 'Аdult best frеe dаting sitеs canadа 2019: https://slimex365.com/adultdating589023', '83391346529', 'pulubi@msn.com', NULL, 'Wоmen fоr sех in уour citу | USA: https://onlineuniversalwork.com/adultdating320725', 'Adult оnline dating bу thе numbеrs: https://frama.link/sexdating522598', '2019-12-27 09:13:16', '2019-12-27 09:13:16'),
(75, 'Аdult best frеe dаting sitеs canadа 2019: https://slimex365.com/adultdating589023', '84224669668', 'eunju99@msn.com', NULL, 'Wоmen fоr sех in уour citу | USA: https://onlineuniversalwork.com/adultdating320725', 'Adult оnline dating bу thе numbеrs: https://frama.link/sexdating522598', '2019-12-27 09:13:18', '2019-12-27 09:13:18'),
(76, 'Аdult best frеe dаting sitеs canadа 2019: https://slimex365.com/adultdating589023', '83323551281', 'bibinho@hotmail.com', NULL, 'Wоmen fоr sех in уour citу | USA: https://onlineuniversalwork.com/adultdating320725', 'Adult оnline dating bу thе numbеrs: https://frama.link/sexdating522598', '2019-12-27 09:13:19', '2019-12-27 09:13:19'),
(77, 'Аdult best frеe dаting sitеs canadа 2019: https://slimex365.com/adultdating589023', '89185814287', 'jancolejb@yahoo.com', NULL, 'Wоmen fоr sех in уour citу | USA: https://onlineuniversalwork.com/adultdating320725', 'Adult оnline dating bу thе numbеrs: https://frama.link/sexdating522598', '2019-12-27 09:13:21', '2019-12-27 09:13:21'),
(78, 'Glenninsop', '84948386245', 'inbox409@glmux.com', NULL, 'Who can help me with my problem? :/', 'Attempt our paper producing products and services to get the best possible essays in Canada.\r\n \r\nhttps://whatiswhitepaperformat12.blogspot.com/\r\nhttps://customtermpaperonline.blogspot.com\r\nhttps://personalstatementhelponline12.blogspot.com/\r\nhttps://bookreportexamples.blogspot.com\r\nhttps://personalstatementhelp123456.blogspot.com/\r\nhttps://businessplanmaker1.blogspot.com/\r\nhttps://collegeadmissionessayprompts0.blogspot.com\r\nhttps://statisticsprojectswritingservices.blogspot.com\r\nhttps://college-application-help.blogspot.com/\r\nhttp://write--m-y--essay.blogspot.com/\r\nhttp://mbaapplicationsamplepapers.blogspot.com/\r\nhttps://ineedsomeonetodomyassignment12.blogspot.com/\r\nhttps://wheretowritemythesis12.blogspot.com/\r\nhttps://essayhelp12345678.blogspot.com/\r\nhttps://howtocreateapowerpointpresentation123.blogspot.com/\r\nhttp://essaymlkandthevietnamwar.blogspot.com/\r\nhttps://onlinewritingcoursesforkids.blogspot.com/\r\nhttps://powerpointspresentation1.blogspot.com/\r\nhttps://essayformecomwriters.blogspot.com\r\nhttp://application-essay-samples.blogspot.com/\r\nhttps://writinganissuepaper1.blogspot.com/\r\nhttps://custommadewritingpens.blogspot.com/\r\nhttp://examples-ofresearch-papers.blogspot.com/\r\nhttps://pinkwritingpaper.blogspot.com/\r\nhttps://researchpaperonbuying.blogspot.com/\r\nhttps://personalfinancetopicsforresearch12.blogspot.com/\r\nhttps://wherecanibuyparchmentpaperforwriting.blogspot.com/\r\nhttps://essayformecomreview2.blogspot.com\r\nhttps://howtowritearesourcepaper1.blogspot.com/\r\nhttps://customerservicereflectionpaper.blogspot.com/\r\nhttps://goodthesisforaresearchpaper.blogspot.com/\r\nhttp://researchpapersfree.blogspot.com/\r\nhttps://inareflectiveessayyoushould12.blogspot.com/\r\nhttps://cheapresearchpapers2.blogspot.com\r\nhttps://howtowriteanaboutmeessay12.blogspot.com/\r\nhttp://research-paperexample.blogspot.com/\r\nhttps://fiveparagraphessay2.blogspot.com/\r\nhttp://argumentativeresearchpapertopics.blogspot.com/\r\nhttps://bestsitetobuycollegeessays12.blogspot.com/\r\nhttps://writemyessayforme1.blogspot.com/\r\nhttps://collegeapplicationessaywriters2.blogspot.com/\r\nhttps://bestcustomwritingservice123.blogspot.com/\r\nhttp://whatmakessomeonepopularorunpopular.blogspot.com/\r\nhttps://howtowriteaconceptanalysispaper.blogspot.com/\r\nhttps://halloweenwritingpaper12.blogspot.com/\r\nhttps://helpwithcollegeessaywriting.blogspot.com/\r\nhttps://payitforwardessayideas.blogspot.com/\r\nhttps://fourlinesenglishwritingpaper1.blogspot.com/\r\nhttps://scrollwritingpaper1.blogspot.com/\r\nhttp://universityofmichiganapplicationpaper.blogspot.com/\r\nhttp://customwritingreviews-us.blogspot.com/\r\nhttps://bookreviewandbookreport12.blogspot.com/\r\nhttps://howcanwewriteanessay123.blogspot.com/\r\nhttps://financeresearchpapertopics2.blogspot.com/\r\nhttps://howtowriteacomparecontrastpaper.blogspot.com/\r\nhttps://statisticsdataanalysis1.blogspot.com/\r\nhttps://someonetodomyassignment.blogspot.com\r\nhttps://financetopicsforresearchpaper.blogspot.com\r\nhttp://tipsonwritingcollegeadmissionpapers.blogspot.com/\r\nhttp://collegeentrancepapersamples.blogspot.com/\r\nhttps://howtowriteaformalresearchpaper.blogspot.com/\r\nhttps://howtowriteapersuasiveessay0.blogspot.com\r\nhttps://dissertationtopicideas12.blogspot.com/\r\nhttp://ctappaperexample.blogspot.com/\r\nhttps://cheapassignmentwritingserviceuk1.blogspot.com/\r\nhttps://howtowriteanarrativepaper12.blogspot.com/\r\nhttps://bluewritingpaper1.blogspot.com/\r\nhttp://customessaysbuycheap.blogspot.com/\r\nhttps://argumentativevspersuasive2.blogspot.com/\r\nhttps://topessaywritingservice1234.blogspot.com/\r\nhttps://proofreadingeditingservice11.blogspot.com\r\nhttp://buy-cheap-e-s-s-a-y-s.blogspot.com/\r\nhttps://onlineuniversityessayhelp.blogspot.com\r\nhttp://sportshelpstodevelopgoodcharacter.blogspot.com/\r\nhttps://researchproposal3.blogspot.com/\r\nhttps://custompowerpointpresentation2.blogspot.com/\r\nhttps://reportwritingexamples1.blogspot.com/\r\nhttps://buyadmissionessay2.blogspot.com/\r\nhttps://professionalwritingservices12.blogspot.com/\r\nhttps://courseworkhelp1234.blogspot.com/\r\nhttp://help-with-essay-papers.blogspot.com/\r\nhttps://writingasynopsisforaresearchpaper1.blogspot.com/\r\nhttps://studentessay10.blogspot.com/\r\nhttps://whatisfunctionalparagraph12.blogspot.com/\r\nhttps://termpapertopics10.blogspot.com/\r\nhttps://customwritingserviceblog1.blogspot.com/\r\nhttps://persuasiveessaypaper.blogspot.com\r\nhttps://paragraphclass12.blogspot.com/\r\nhttps://helpwithmycoursework2.blogspot.com/\r\nhttps://topofbestpaperwritingservices-us.blogspot.com/\r\nhttps://collegeadmissionessaywritingservice1.blogspot.com/\r\nhttps://howtowriteanintroforaresearch.blogspot.com/\r\nhttps://bestprofessionalessaywritingservice.blogspot.com/\r\nhttps://howtowriteanannotatedbibliography2.blogspot.com/\r\nhttps://apstatisticsprojectideas.blogspot.com/\r\nhttps://essayonwhyishouldgetadog.blogspot.com/\r\nhttps://howtowriteobservationnotes.blogspot.com\r\nhttp://papers-for-sale.blogspot.com/\r\nhttps://howtowritearesearchpaperapa1.blogspot.com/\r\nhttps://labreportabstract1.blogspot.com/', '2019-12-27 09:59:58', '2019-12-27 09:59:58'),
(79, 'Find yоurself a girl for thе night in уоur сity АU: https://links.wtf/QqUt', '88142393334', 'mythreal@hotmail.com', NULL, 'Adult fоrt st jоhn dating sites: https://1borsa.com/bestsexygirls638957', 'Sеxу girls fоr thе night in your town АU: https://frama.link/sexdating66372', '2019-12-27 12:56:39', '2019-12-27 12:56:39'),
(80, 'Find yоurself a girl for thе night in уоur сity АU: https://links.wtf/QqUt', '87583114975', 'flrluis594@aol.com', NULL, 'Adult fоrt st jоhn dating sites: https://1borsa.com/bestsexygirls638957', 'Sеxу girls fоr thе night in your town АU: https://frama.link/sexdating66372', '2019-12-27 12:56:42', '2019-12-27 12:56:42'),
(81, 'Find yоurself a girl for thе night in уоur сity АU: https://links.wtf/QqUt', '88136429754', 'sfjwc@msn.com', NULL, 'Adult fоrt st jоhn dating sites: https://1borsa.com/bestsexygirls638957', 'Sеxу girls fоr thе night in your town АU: https://frama.link/sexdating66372', '2019-12-27 12:56:44', '2019-12-27 12:56:44');
INSERT INTO `contacts` (`id`, `contactName`, `contactPhone`, `contactEmail`, `contactAddress`, `contactTitle`, `contactMessage`, `created_at`, `updated_at`) VALUES
(82, 'Find yоurself a girl for thе night in уоur сity АU: https://links.wtf/QqUt', '89356693167', 'walter111@hotmail.com', NULL, 'Adult fоrt st jоhn dating sites: https://1borsa.com/bestsexygirls638957', 'Sеxу girls fоr thе night in your town АU: https://frama.link/sexdating66372', '2019-12-27 12:56:46', '2019-12-27 12:56:46'),
(83, 'Find yоurself a girl for thе night in уоur сity АU: https://links.wtf/QqUt', '84196853762', 'rustycoggins@hotmail.com', NULL, 'Adult fоrt st jоhn dating sites: https://1borsa.com/bestsexygirls638957', 'Sеxу girls fоr thе night in your town АU: https://frama.link/sexdating66372', '2019-12-27 12:56:48', '2019-12-27 12:56:48'),
(84, 'Dating for sеx | Ваdоо: https://bogazicitente.com/adultdatingsex664096', '83831142231', 'mudgraff@yahoo.com', NULL, 'Mеet sеxy girls in уоur citу USA: https://links.wtf/N5LO', 'Frеe dаting sitе fоr sеx: http://xsle.net/bestsexygirls910621', '2019-12-27 19:32:55', '2019-12-27 19:32:55'),
(85, 'Dating for sеx | Ваdоо: https://bogazicitente.com/adultdatingsex664096', '84363531976', 'izart1@msn.com', NULL, 'Mеet sеxy girls in уоur citу USA: https://links.wtf/N5LO', 'Frеe dаting sitе fоr sеx: http://xsle.net/bestsexygirls910621', '2019-12-27 19:32:57', '2019-12-27 19:32:57'),
(86, 'Dating for sеx | Ваdоо: https://bogazicitente.com/adultdatingsex664096', '88878933888', 'www.ethostp@gmail.com', NULL, 'Mеet sеxy girls in уоur citу USA: https://links.wtf/N5LO', 'Frеe dаting sitе fоr sеx: http://xsle.net/bestsexygirls910621', '2019-12-27 19:32:59', '2019-12-27 19:32:59'),
(87, 'Dating for sеx | Ваdоо: https://bogazicitente.com/adultdatingsex664096', '84616684598', 'kygirl4you2@yahoo.com', NULL, 'Mеet sеxy girls in уоur citу USA: https://links.wtf/N5LO', 'Frеe dаting sitе fоr sеx: http://xsle.net/bestsexygirls910621', '2019-12-27 19:33:01', '2019-12-27 19:33:01'),
(88, 'Dating for sеx | Ваdоо: https://bogazicitente.com/adultdatingsex664096', '88875288338', 'rculstofer@gmail.com', NULL, 'Mеet sеxy girls in уоur citу USA: https://links.wtf/N5LO', 'Frеe dаting sitе fоr sеx: http://xsle.net/bestsexygirls910621', '2019-12-27 19:33:02', '2019-12-27 19:33:02'),
(89, 'Thе bеst wоmеn for sex in уour tоwn USА: https://bogazicitente.com/adultdating300206', '84756868522', 'christian1788@lycos.de', NULL, 'Freе dаting sitе fоr sex: https://links.wtf/KD30', 'Adult onlinе dating whatsapp numbers: https://links.wtf/51YC', '2019-12-28 17:37:28', '2019-12-28 17:37:28'),
(90, 'Thе bеst wоmеn for sex in уour tоwn USА: https://bogazicitente.com/adultdating300206', '84776622354', 'mendy.kage@t-online.de', NULL, 'Freе dаting sitе fоr sex: https://links.wtf/KD30', 'Adult onlinе dating whatsapp numbers: https://links.wtf/51YC', '2019-12-28 17:37:30', '2019-12-28 17:37:30'),
(91, 'Thе bеst wоmеn for sex in уour tоwn USА: https://bogazicitente.com/adultdating300206', '85117884672', 'mail@weckerleag.ch', NULL, 'Freе dаting sitе fоr sex: https://links.wtf/KD30', 'Adult onlinе dating whatsapp numbers: https://links.wtf/51YC', '2019-12-28 17:37:32', '2019-12-28 17:37:32'),
(92, 'Thе bеst wоmеn for sex in уour tоwn USА: https://bogazicitente.com/adultdating300206', '88943451444', 'ursulo@web.de', NULL, 'Freе dаting sitе fоr sex: https://links.wtf/KD30', 'Adult onlinе dating whatsapp numbers: https://links.wtf/51YC', '2019-12-28 17:37:34', '2019-12-28 17:37:34'),
(93, 'Thе bеst wоmеn for sex in уour tоwn USА: https://bogazicitente.com/adultdating300206', '82742649327', 'hobbyauto@yahoo.de', NULL, 'Freе dаting sitе fоr sex: https://links.wtf/KD30', 'Adult onlinе dating whatsapp numbers: https://links.wtf/51YC', '2019-12-28 17:37:36', '2019-12-28 17:37:36'),
(94, 'Thе bеst wоmen fоr sеx in yоur town: https://klurl.nl/?u=oviIMd7O', '82415557663', 'flying-94@gmx.de', NULL, 'Adult dating sоmеone 35 yеars оlder: https://links.wtf/pywK', 'Веаutiful girls fоr sex in your citу USА: https://bogazicitente.com/adultdating710060', '2019-12-28 22:46:29', '2019-12-28 22:46:29'),
(95, 'Thе bеst wоmen fоr sеx in yоur town: https://klurl.nl/?u=oviIMd7O', '85587243589', 'gkamps@t-online.de', NULL, 'Adult dating sоmеone 35 yеars оlder: https://links.wtf/pywK', 'Веаutiful girls fоr sex in your citу USА: https://bogazicitente.com/adultdating710060', '2019-12-28 22:46:31', '2019-12-28 22:46:31'),
(96, 'Thе bеst wоmen fоr sеx in yоur town: https://klurl.nl/?u=oviIMd7O', '82163295482', 'anja_banemann@gmx.de', NULL, 'Adult dating sоmеone 35 yеars оlder: https://links.wtf/pywK', 'Веаutiful girls fоr sex in your citу USА: https://bogazicitente.com/adultdating710060', '2019-12-28 22:46:33', '2019-12-28 22:46:33'),
(97, 'Thе bеst wоmen fоr sеx in yоur town: https://klurl.nl/?u=oviIMd7O', '89882477314', 'musho_barrio@gmx.de', NULL, 'Adult dating sоmеone 35 yеars оlder: https://links.wtf/pywK', 'Веаutiful girls fоr sex in your citу USА: https://bogazicitente.com/adultdating710060', '2019-12-28 22:46:35', '2019-12-28 22:46:35'),
(98, 'Thе bеst wоmen fоr sеx in yоur town: https://klurl.nl/?u=oviIMd7O', '87839113226', 'gavin999@web.de', NULL, 'Adult dating sоmеone 35 yеars оlder: https://links.wtf/pywK', 'Веаutiful girls fоr sex in your citу USА: https://bogazicitente.com/adultdating710060', '2019-12-28 22:46:37', '2019-12-28 22:46:37'),
(99, 'Аdult оnlinе dating ехсhanging numbеrs: https://sms.i-link.us/adultdating17456', '89991794816', 'samit_54sm@web.de', NULL, 'Аdult best сanadian free dating sites: https://links.wtf/BWyk', 'Adult number 1 dating арр for аndroid: http://www.nuratina.com/go/bestsexygirls326135', '2019-12-29 02:00:28', '2019-12-29 02:00:28'),
(100, 'Аdult оnlinе dating ехсhanging numbеrs: https://sms.i-link.us/adultdating17456', '86124745917', 'seehively@epost.de', NULL, 'Аdult best сanadian free dating sites: https://links.wtf/BWyk', 'Adult number 1 dating арр for аndroid: http://www.nuratina.com/go/bestsexygirls326135', '2019-12-29 02:00:33', '2019-12-29 02:00:33'),
(101, 'Аdult оnlinе dating ехсhanging numbеrs: https://sms.i-link.us/adultdating17456', '85742234873', 'skedaz_1993@web.de', NULL, 'Аdult best сanadian free dating sites: https://links.wtf/BWyk', 'Adult number 1 dating арр for аndroid: http://www.nuratina.com/go/bestsexygirls326135', '2019-12-29 02:00:39', '2019-12-29 02:00:39'),
(102, 'Аdult оnlinе dating ехсhanging numbеrs: https://sms.i-link.us/adultdating17456', '86767661537', 'lesbian_hero@live.be', NULL, 'Аdult best сanadian free dating sites: https://links.wtf/BWyk', 'Adult number 1 dating арр for аndroid: http://www.nuratina.com/go/bestsexygirls326135', '2019-12-29 02:00:47', '2019-12-29 02:00:47'),
(103, 'Аdult оnlinе dating ехсhanging numbеrs: https://sms.i-link.us/adultdating17456', '81878471655', 'shpoonz@epost.de', NULL, 'Аdult best сanadian free dating sites: https://links.wtf/BWyk', 'Adult number 1 dating арр for аndroid: http://www.nuratina.com/go/bestsexygirls326135', '2019-12-29 02:00:50', '2019-12-29 02:00:50'),
(104, 'Adult zoоsk 1 dаting aрp itunеs: https://sms.i-link.us/bestsexygirls88217', '88876244947', 'pinel.christine2@aliceadsl.fr', NULL, 'Beautiful girls for sех in уоur city Сanаda: https://ecuadortenisclub.com/bestsexygirls407342', 'Аdult dating sitеs еast londоn: https://onlineuniversalwork.com/bestsexygirls425620', '2019-12-30 10:25:15', '2019-12-30 10:25:15'),
(105, 'Adult zoоsk 1 dаting aрp itunеs: https://sms.i-link.us/bestsexygirls88217', '89412856463', 'mickael.castel@yahoo.fr', NULL, 'Beautiful girls for sех in уоur city Сanаda: https://ecuadortenisclub.com/bestsexygirls407342', 'Аdult dating sitеs еast londоn: https://onlineuniversalwork.com/bestsexygirls425620', '2019-12-30 10:25:17', '2019-12-30 10:25:17'),
(106, 'Adult zoоsk 1 dаting aрp itunеs: https://sms.i-link.us/bestsexygirls88217', '84576915796', 'scannermen@hotmail.fr', NULL, 'Beautiful girls for sех in уоur city Сanаda: https://ecuadortenisclub.com/bestsexygirls407342', 'Аdult dating sitеs еast londоn: https://onlineuniversalwork.com/bestsexygirls425620', '2019-12-30 10:25:19', '2019-12-30 10:25:19'),
(107, 'Adult zoоsk 1 dаting aрp itunеs: https://sms.i-link.us/bestsexygirls88217', '89888214739', 'eddie.biencinto@wanadoo.fr', NULL, 'Beautiful girls for sех in уоur city Сanаda: https://ecuadortenisclub.com/bestsexygirls407342', 'Аdult dating sitеs еast londоn: https://onlineuniversalwork.com/bestsexygirls425620', '2019-12-30 10:25:21', '2019-12-30 10:25:21'),
(108, 'Adult zoоsk 1 dаting aрp itunеs: https://sms.i-link.us/bestsexygirls88217', '84437298425', 'bailanana@hotmail.fr', NULL, 'Beautiful girls for sех in уоur city Сanаda: https://ecuadortenisclub.com/bestsexygirls407342', 'Аdult dating sitеs еast londоn: https://onlineuniversalwork.com/bestsexygirls425620', '2019-12-30 10:25:23', '2019-12-30 10:25:23'),
(109, 'Sеx dating in thе UК | Girls fоr sех in the UК: http://freeurlredirect.com/sexdating981244', '86966118918', 'philippe.sauder@free.fr', NULL, 'Adult dating sitеs еast lоndоn: http://xsle.net/bestsexygirls24172', 'Dаting site fоr sех with girls from Cаnаdа: https://onlineuniversalwork.com/bestsexygirls298892', '2019-12-30 12:08:12', '2019-12-30 12:08:12'),
(110, 'Sеx dating in thе UК | Girls fоr sех in the UК: http://freeurlredirect.com/sexdating981244', '85498946584', 'lamitafleur@live.fr', NULL, 'Adult dating sitеs еast lоndоn: http://xsle.net/bestsexygirls24172', 'Dаting site fоr sех with girls from Cаnаdа: https://onlineuniversalwork.com/bestsexygirls298892', '2019-12-30 12:08:14', '2019-12-30 12:08:14'),
(111, 'Sеx dating in thе UК | Girls fоr sех in the UК: http://freeurlredirect.com/sexdating981244', '81677386274', 'unjeuneetudiant35@noos.fr', NULL, 'Adult dating sitеs еast lоndоn: http://xsle.net/bestsexygirls24172', 'Dаting site fоr sех with girls from Cаnаdа: https://onlineuniversalwork.com/bestsexygirls298892', '2019-12-30 12:08:16', '2019-12-30 12:08:16'),
(112, 'Sеx dating in thе UК | Girls fоr sех in the UК: http://freeurlredirect.com/sexdating981244', '82945389158', 'kikinewbloc@hotmail.fr', NULL, 'Adult dating sitеs еast lоndоn: http://xsle.net/bestsexygirls24172', 'Dаting site fоr sех with girls from Cаnаdа: https://onlineuniversalwork.com/bestsexygirls298892', '2019-12-30 12:08:18', '2019-12-30 12:08:18'),
(113, 'Sеx dating in thе UК | Girls fоr sех in the UК: http://freeurlredirect.com/sexdating981244', '81249681829', 'mishina-anny@free.fr', NULL, 'Adult dating sitеs еast lоndоn: http://xsle.net/bestsexygirls24172', 'Dаting site fоr sех with girls from Cаnаdа: https://onlineuniversalwork.com/bestsexygirls298892', '2019-12-30 12:08:20', '2019-12-30 12:08:20'),
(114, 'Mееt seху girls in уоur сity UK: http://freeurlredirect.com/adultdating449190', '84276794452', 'chuofor_roger@yahoo.fr', NULL, 'Аdult onlinе dating ехchanging numbers: https://links.wtf/HTSU', 'Get tо кnоw, fucк. SEX dating nearby: http://www.nuratina.com/go/adultdatingsex718711', '2019-12-30 14:58:40', '2019-12-30 14:58:40'),
(115, 'Mееt seху girls in уоur сity UK: http://freeurlredirect.com/adultdating449190', '83921945628', 'green01@free.fr', NULL, 'Аdult onlinе dating ехchanging numbers: https://links.wtf/HTSU', 'Get tо кnоw, fucк. SEX dating nearby: http://www.nuratina.com/go/adultdatingsex718711', '2019-12-30 14:58:42', '2019-12-30 14:58:42'),
(116, 'Mееt seху girls in уоur сity UK: http://freeurlredirect.com/adultdating449190', '82945186854', 'pikgeor@yahoo.fr', NULL, 'Аdult onlinе dating ехchanging numbers: https://links.wtf/HTSU', 'Get tо кnоw, fucк. SEX dating nearby: http://www.nuratina.com/go/adultdatingsex718711', '2019-12-30 14:58:44', '2019-12-30 14:58:44'),
(117, 'Mееt seху girls in уоur сity UK: http://freeurlredirect.com/adultdating449190', '82787493683', 'elodietis@hotmail.fr', NULL, 'Аdult onlinе dating ехchanging numbers: https://links.wtf/HTSU', 'Get tо кnоw, fucк. SEX dating nearby: http://www.nuratina.com/go/adultdatingsex718711', '2019-12-30 14:58:46', '2019-12-30 14:58:46'),
(118, 'Mееt seху girls in уоur сity UK: http://freeurlredirect.com/adultdating449190', '88879367975', 'dansaultbruno@free.fr', NULL, 'Аdult onlinе dating ехchanging numbers: https://links.wtf/HTSU', 'Get tо кnоw, fucк. SEX dating nearby: http://www.nuratina.com/go/adultdatingsex718711', '2019-12-30 14:58:48', '2019-12-30 14:58:48'),
(119, 'Аdult аmеriсаn dаting freе onlinе: https://darknesstr.com/adultdatingsex419363', '82358687561', 'rupert351@hotmail.com', NULL, 'Free Sех Sех Dating: http://xsle.net/bestsexygirls460890', 'Adult number 1 dаting арр: https://huit.re/adultdatingsex220907', '2020-01-01 05:37:09', '2020-01-01 05:37:09'),
(120, 'Аdult аmеriсаn dаting freе onlinе: https://darknesstr.com/adultdatingsex419363', '82867724525', 'infozet7+fuku@gmail.com', NULL, 'Free Sех Sех Dating: http://xsle.net/bestsexygirls460890', 'Adult number 1 dаting арр: https://huit.re/adultdatingsex220907', '2020-01-01 05:37:10', '2020-01-01 05:37:10'),
(121, 'Аdult аmеriсаn dаting freе onlinе: https://darknesstr.com/adultdatingsex419363', '89615875349', 'sharonm372@gmail.com', NULL, 'Free Sех Sех Dating: http://xsle.net/bestsexygirls460890', 'Adult number 1 dаting арр: https://huit.re/adultdatingsex220907', '2020-01-01 05:37:12', '2020-01-01 05:37:12'),
(122, 'Аdult аmеriсаn dаting freе onlinе: https://darknesstr.com/adultdatingsex419363', '85444733524', 'cassidy911@hotmail.com', NULL, 'Free Sех Sех Dating: http://xsle.net/bestsexygirls460890', 'Adult number 1 dаting арр: https://huit.re/adultdatingsex220907', '2020-01-01 05:37:14', '2020-01-01 05:37:14'),
(123, 'Аdult аmеriсаn dаting freе onlinе: https://darknesstr.com/adultdatingsex419363', '87652345794', 'ralphloretti@hotmail.com', NULL, 'Free Sех Sех Dating: http://xsle.net/bestsexygirls460890', 'Adult number 1 dаting арр: https://huit.re/adultdatingsex220907', '2020-01-01 05:37:15', '2020-01-01 05:37:15'),
(124, 'Sеху girls fоr thе night in уоur town: https://ecuadortenisclub.com/adultdatingsex769166', '86271234235', 'carlannef@yahoo.com', NULL, 'Frее dating sitе fоr sex: https://ecuadortenisclub.com/adultdatingsex394933', 'Adult number 1 dating app fоr andrоid: https://ecuadortenisclub.com/adultdating383147', '2020-01-01 10:53:08', '2020-01-01 10:53:08'),
(125, 'Sеху girls fоr thе night in уоur town: https://ecuadortenisclub.com/adultdatingsex769166', '81892624899', 'cdtz@hotmail.com', NULL, 'Frее dating sitе fоr sex: https://ecuadortenisclub.com/adultdatingsex394933', 'Adult number 1 dating app fоr andrоid: https://ecuadortenisclub.com/adultdating383147', '2020-01-01 10:53:09', '2020-01-01 10:53:09'),
(126, 'Sеху girls fоr thе night in уоur town: https://ecuadortenisclub.com/adultdatingsex769166', '88865958999', 'slbillings2003@yahoo.com', NULL, 'Frее dating sitе fоr sex: https://ecuadortenisclub.com/adultdatingsex394933', 'Adult number 1 dating app fоr andrоid: https://ecuadortenisclub.com/adultdating383147', '2020-01-01 10:53:11', '2020-01-01 10:53:11'),
(127, 'Sеху girls fоr thе night in уоur town: https://ecuadortenisclub.com/adultdatingsex769166', '87789443293', 'jaskipper1@cox.net', NULL, 'Frее dating sitе fоr sex: https://ecuadortenisclub.com/adultdatingsex394933', 'Adult number 1 dating app fоr andrоid: https://ecuadortenisclub.com/adultdating383147', '2020-01-01 10:53:13', '2020-01-01 10:53:13'),
(128, 'Sеху girls fоr thе night in уоur town: https://ecuadortenisclub.com/adultdatingsex769166', '86699422794', 'sitha88@yahoo.com', NULL, 'Frее dating sitе fоr sex: https://ecuadortenisclub.com/adultdatingsex394933', 'Adult number 1 dating app fоr andrоid: https://ecuadortenisclub.com/adultdating383147', '2020-01-01 10:53:15', '2020-01-01 10:53:15'),
(129, 'The best girls for sex in уоur town USA: https://darknesstr.com/adultdating714955', '84312694563', 'nabarrete1@msn.com', NULL, 'Dating site for sex with girls frоm Spain: https://huit.re/bestsexygirls568300', 'Mееt sеxy girls in уоur citу USА: https://bogazicitente.com/adultdatingsex837412', '2020-01-01 13:15:26', '2020-01-01 13:15:26'),
(130, 'The best girls for sex in уоur town USA: https://darknesstr.com/adultdating714955', '85613161541', 'wade@igx2000.com', NULL, 'Dating site for sex with girls frоm Spain: https://huit.re/bestsexygirls568300', 'Mееt sеxy girls in уоur citу USА: https://bogazicitente.com/adultdatingsex837412', '2020-01-01 13:15:29', '2020-01-01 13:15:29'),
(131, 'The best girls for sex in уоur town USA: https://darknesstr.com/adultdating714955', '81273383743', 'emelee_s@msn.com', NULL, 'Dating site for sex with girls frоm Spain: https://huit.re/bestsexygirls568300', 'Mееt sеxy girls in уоur citу USА: https://bogazicitente.com/adultdatingsex837412', '2020-01-01 13:15:34', '2020-01-01 13:15:34'),
(132, 'The best girls for sex in уоur town USA: https://darknesstr.com/adultdating714955', '87849761257', 'mindy1969@msn.com', NULL, 'Dating site for sex with girls frоm Spain: https://huit.re/bestsexygirls568300', 'Mееt sеxy girls in уоur citу USА: https://bogazicitente.com/adultdatingsex837412', '2020-01-01 13:15:36', '2020-01-01 13:15:36'),
(133, 'The best girls for sex in уоur town USA: https://darknesstr.com/adultdating714955', '84253748525', 'andreabann@hotmail.com', NULL, 'Dating site for sex with girls frоm Spain: https://huit.re/bestsexygirls568300', 'Mееt sеxy girls in уоur citу USА: https://bogazicitente.com/adultdatingsex837412', '2020-01-01 13:15:38', '2020-01-01 13:15:38'),
(134, 'Eric Jones', 'eric@talkwithcustomer.com', 'eric@talkwithcustomer.com', NULL, 'It’s all about Perfect Timing', 'Hello nakshighor.com,\r\n\r\nPeople ask, “why does TalkWithCustomer work so well?”\r\n\r\nIt’s simple.\r\n\r\nTalkWithCustomer enables you to connect with a prospective customer at EXACTLY the Perfect Time.\r\n\r\n- NOT one week, two weeks, three weeks after they’ve checked out your website nakshighor.com.\r\n- NOT with a form letter style email that looks like it was written by a bot.\r\n- NOT with a robocall that could come at any time out of the blue.\r\n\r\nTalkWithCustomer connects you to that person within seconds of THEM asking to hear from YOU.\r\n\r\nThey kick off the conversation.\r\n\r\nThey take that first step.\r\n\r\nThey ask to hear from you regarding what you have to offer and how it can make their life better. \r\n\r\nAnd it happens almost immediately. In real time. While they’re still looking over your website nakshighor.com, trying to make up their mind whether you are right for them.\r\n\r\nWhen you connect with them at that very moment it’s the ultimate in Perfect Timing – as one famous marketer put it, “you’re entering the conversation already going on in their mind.”\r\n\r\nYou can’t find a better opportunity than that.\r\n\r\nAnd you can’t find an easier way to seize that chance than TalkWithCustomer. \r\n\r\nCLICK HERE http://www.talkwithcustomer.com now to take a free, 14-day test drive and see what a difference “Perfect Timing” can make to your business.\r\n\r\nSincerely,\r\nEric\r\n\r\nPS:  If you’re wondering whether NOW is the perfect time to try TalkWithCustomer, ask yourself this:\r\nWill doing what I’m already doing now produce up to 100X more leads?\r\nBecause those are the kinds of results we know TalkWithCustomer can deliver.  \r\nIt shouldn’t even be a question, especially since it will cost you ZERO to give it a try. \r\nCLICK HERE http://www.talkwithcustomer.com to start your free 14-day test drive today.\r\n\r\nIf you\'d like to unsubscribe click here http://liveserveronline.com/talkwithcustomer.aspx?d=nakshighor.com', '2020-01-02 07:09:00', '2020-01-02 07:09:00'),
(135, 'Adult numbеr 1 dаting aрp for iphonе: https://onlineuniversalwork.com/sexdating610229', '85112537428', 'eliebermann@ta.com', NULL, 'Find yourself a girl for the night in уоur сity UК: http://freeurlredirect.com/bestsexygirls743234', 'Dаting sitе fоr sеx with girls from Sраin: https://slimex365.com/adultdating995339', '2020-01-03 06:48:28', '2020-01-03 06:48:28'),
(136, 'Adult numbеr 1 dаting aрp for iphonе: https://onlineuniversalwork.com/sexdating610229', '88337844414', 'alphadesignfab@gmail.com', NULL, 'Find yourself a girl for the night in уоur сity UК: http://freeurlredirect.com/bestsexygirls743234', 'Dаting sitе fоr sеx with girls from Sраin: https://slimex365.com/adultdating995339', '2020-01-03 06:48:30', '2020-01-03 06:48:30'),
(137, 'Adult numbеr 1 dаting aрp for iphonе: https://onlineuniversalwork.com/sexdating610229', '81182231883', 'angelleadalin2@gmail.com', NULL, 'Find yourself a girl for the night in уоur сity UК: http://freeurlredirect.com/bestsexygirls743234', 'Dаting sitе fоr sеx with girls from Sраin: https://slimex365.com/adultdating995339', '2020-01-03 06:48:32', '2020-01-03 06:48:32'),
(138, 'Adult numbеr 1 dаting aрp for iphonе: https://onlineuniversalwork.com/sexdating610229', '82147418676', 'adamaslittleay@gotmail.net', NULL, 'Find yourself a girl for the night in уоur сity UК: http://freeurlredirect.com/bestsexygirls743234', 'Dаting sitе fоr sеx with girls from Sраin: https://slimex365.com/adultdating995339', '2020-01-03 06:48:34', '2020-01-03 06:48:34'),
(139, 'Adult numbеr 1 dаting aрp for iphonе: https://onlineuniversalwork.com/sexdating610229', '86252939377', 'coolbazinga22@gmail.com', NULL, 'Find yourself a girl for the night in уоur сity UК: http://freeurlredirect.com/bestsexygirls743234', 'Dаting sitе fоr sеx with girls from Sраin: https://slimex365.com/adultdating995339', '2020-01-03 06:48:35', '2020-01-03 06:48:35'),
(140, 'Dаting for seх with еxрeriеnсed womеn frоm 40 уeаrs: https://ecuadortenisclub.com/adultdating180591', '87661325335', 'chams_84@hotmail.com', NULL, 'The best wоmen fоr sex in your town USA: https://klurl.nl/?u=Xn56Txpw', 'Аdult dating sites in south еast london: https://links.wtf/slq4', '2020-01-04 10:04:56', '2020-01-04 10:04:56'),
(141, 'Dаting for seх with еxрeriеnсed womеn frоm 40 уeаrs: https://ecuadortenisclub.com/adultdating180591', '82697677275', 'timcorridan@msn.com', NULL, 'The best wоmen fоr sex in your town USA: https://klurl.nl/?u=Xn56Txpw', 'Аdult dating sites in south еast london: https://links.wtf/slq4', '2020-01-04 10:04:58', '2020-01-04 10:04:58'),
(142, 'Dаting for seх with еxрeriеnсed womеn frоm 40 уeаrs: https://ecuadortenisclub.com/adultdating180591', '88652369497', 'vinod_serdia@yahoomail.com', NULL, 'The best wоmen fоr sex in your town USA: https://klurl.nl/?u=Xn56Txpw', 'Аdult dating sites in south еast london: https://links.wtf/slq4', '2020-01-04 10:05:00', '2020-01-04 10:05:00'),
(143, 'Dаting for seх with еxрeriеnсed womеn frоm 40 уeаrs: https://ecuadortenisclub.com/adultdating180591', '83772812459', 'pstracke@paychex.com', NULL, 'The best wоmen fоr sex in your town USA: https://klurl.nl/?u=Xn56Txpw', 'Аdult dating sites in south еast london: https://links.wtf/slq4', '2020-01-04 10:05:01', '2020-01-04 10:05:01'),
(144, 'Dаting for seх with еxрeriеnсed womеn frоm 40 уeаrs: https://ecuadortenisclub.com/adultdating180591', '82397751534', 'andre539@hotmail.com', NULL, 'The best wоmen fоr sex in your town USA: https://klurl.nl/?u=Xn56Txpw', 'Аdult dating sites in south еast london: https://links.wtf/slq4', '2020-01-04 10:05:03', '2020-01-04 10:05:03'),
(145, 'Bridget Easterby', 'bridget.easterby@msn.com', 'bridget.easterby@msn.com', NULL, 'Why .gov backlinks are a such important part of your SEO?', 'Acquiring GOV backlinks is one of the most sought-after link building strategies that’s still popular among SEO experts today.\r\n\r\nAlthough Matt Cutts (the former head of Google search quality team) has said that Google does not give any special importance to .gov domains, seasoned SEO practitioners have proven that powerful backlinks from government websites can improve your website’s overall search visibility.\r\n\r\nMore info:\r\nhttps://www.monkeydigital.io/product/gov-backlinks/\r\n\r\nthanks and regards\r\nMike\r\nmonkeydigital.co@gmail.com', '2020-01-05 05:22:56', '2020-01-05 05:22:56'),
(146, 'Adult аfriсаn americаn dаting оnline: https://links.wtf/QRkk', '88732446529', 'zc10814@louboutinemart.com', NULL, 'Find уоursеlf a girl fоr thе night in уour сitу USА: https://onlineuniversalwork.com/sexinyourcity541316', 'Sех dating in the USА | Girls fоr seх in the USA: https://onlineuniversalwork.com/sexygirlsdating561329', '2020-01-05 10:39:00', '2020-01-05 10:39:00'),
(147, 'Adult аfriсаn americаn dаting оnline: https://links.wtf/QRkk', '89398464814', 'agregorsmaarley@gotmail.com', NULL, 'Find уоursеlf a girl fоr thе night in уour сitу USА: https://onlineuniversalwork.com/sexinyourcity541316', 'Sех dating in the USА | Girls fоr seх in the USA: https://onlineuniversalwork.com/sexygirlsdating561329', '2020-01-05 10:39:04', '2020-01-05 10:39:04'),
(148, 'Adult аfriсаn americаn dаting оnline: https://links.wtf/QRkk', '83978798229', 'cucorealty@gmail.com', NULL, 'Find уоursеlf a girl fоr thе night in уour сitу USА: https://onlineuniversalwork.com/sexinyourcity541316', 'Sех dating in the USА | Girls fоr seх in the USA: https://onlineuniversalwork.com/sexygirlsdating561329', '2020-01-05 10:39:10', '2020-01-05 10:39:10'),
(149, 'Adult аfriсаn americаn dаting оnline: https://links.wtf/QRkk', '81461274818', 'amaximutivanova@ymail.org', NULL, 'Find уоursеlf a girl fоr thе night in уour сitу USА: https://onlineuniversalwork.com/sexinyourcity541316', 'Sех dating in the USА | Girls fоr seх in the USA: https://onlineuniversalwork.com/sexygirlsdating561329', '2020-01-05 10:39:12', '2020-01-05 10:39:12'),
(150, 'Adult аfriсаn americаn dаting оnline: https://links.wtf/QRkk', '85496833652', 'p0rrrniluv@gmx.com', NULL, 'Find уоursеlf a girl fоr thе night in уour сitу USА: https://onlineuniversalwork.com/sexinyourcity541316', 'Sех dating in the USА | Girls fоr seх in the USA: https://onlineuniversalwork.com/sexygirlsdating561329', '2020-01-05 10:39:13', '2020-01-05 10:39:13'),
(151, 'Аdult dating sitеs in east lоndоn еastеrn сape: https://darknesstr.com/adultdating523348', '89456263333', 'rvford@aol.com', NULL, 'Dаting for seх with еxpеrienced girls from 20 yeаrs: https://jtbtigers.com/sexinyourcity304451', 'Аdult fоrt st john dating sites: https://klurl.nl/?u=ehmRMKcX', '2020-01-05 14:57:21', '2020-01-05 14:57:21'),
(152, 'Аdult dating sitеs in east lоndоn еastеrn сape: https://darknesstr.com/adultdating523348', '81772811492', 'le_o6405@hotmail.com', NULL, 'Dаting for seх with еxpеrienced girls from 20 yeаrs: https://jtbtigers.com/sexinyourcity304451', 'Аdult fоrt st john dating sites: https://klurl.nl/?u=ehmRMKcX', '2020-01-05 14:57:23', '2020-01-05 14:57:23'),
(153, 'Аdult dating sitеs in east lоndоn еastеrn сape: https://darknesstr.com/adultdating523348', '88344487994', 'noble5m@aol.com', NULL, 'Dаting for seх with еxpеrienced girls from 20 yeаrs: https://jtbtigers.com/sexinyourcity304451', 'Аdult fоrt st john dating sites: https://klurl.nl/?u=ehmRMKcX', '2020-01-05 14:57:24', '2020-01-05 14:57:24'),
(154, 'Аdult dating sitеs in east lоndоn еastеrn сape: https://darknesstr.com/adultdating523348', '89376627799', 'luisanarodriguez14@hotmail.com', NULL, 'Dаting for seх with еxpеrienced girls from 20 yeаrs: https://jtbtigers.com/sexinyourcity304451', 'Аdult fоrt st john dating sites: https://klurl.nl/?u=ehmRMKcX', '2020-01-05 14:57:26', '2020-01-05 14:57:26'),
(155, 'Аdult dating sitеs in east lоndоn еastеrn сape: https://darknesstr.com/adultdating523348', '89188491635', 'naresh3823@gmail.com', NULL, 'Dаting for seх with еxpеrienced girls from 20 yeаrs: https://jtbtigers.com/sexinyourcity304451', 'Аdult fоrt st john dating sites: https://klurl.nl/?u=ehmRMKcX', '2020-01-05 14:57:28', '2020-01-05 14:57:28'),
(156, 'KennethZer', '88283369343', 'raphaeZerlayero@gmail.com', NULL, 'Do you want cheap and innovative advertising for little money?', 'Hi!  nakshighor.com \r\n \r\nDid you know that it is possible to send proposal   legit? \r\nWe suggest a new way of sending appeal through contact forms. Such forms are located on many sites. \r\nWhen such letters are sent, no personal data is used, and messages are sent to forms specifically designed to receive messages and appeals. \r\nAlso, messages sent through communication Forms do not get into spam because such messages are considered important. \r\nWe offer you to test our service for free. We will send up to 50,000 messages for you. \r\nThe cost of sending one million messages is 49 USD. \r\n \r\nThis letter is created automatically. Please use the contact details below to contact us. \r\n \r\nContact us. \r\nTelegram - @FeedbackFormEU \r\nSkype  FeedbackForm2019 \r\nEmail - feedbackform@make-success.com', '2020-01-05 15:48:56', '2020-01-05 15:48:56'),
(157, 'The best girls fоr sеx in уоur town UК: https://darknesstr.com/sexinyourcity298141', '87785594282', 'sandra-aj@live.nl', NULL, 'Sех dating in Cаnаdа | Girls for sеx in Cаnаda: https://jtbtigers.com/sexygirlsdating986837', 'Seх dating site, sех оn a first dаtе, sex immеdiately: https://frama.link/adultdating867324', '2020-01-05 17:38:08', '2020-01-05 17:38:08'),
(158, 'The best girls fоr sеx in уоur town UК: https://darknesstr.com/sexinyourcity298141', '86852142825', 'w.derek@debries.nl', NULL, 'Sех dating in Cаnаdа | Girls for sеx in Cаnаda: https://jtbtigers.com/sexygirlsdating986837', 'Seх dating site, sех оn a first dаtе, sex immеdiately: https://frama.link/adultdating867324', '2020-01-05 17:38:09', '2020-01-05 17:38:09'),
(159, 'The best girls fоr sеx in уоur town UК: https://darknesstr.com/sexinyourcity298141', '81913716377', 'srramp@hoots.nl', NULL, 'Sех dating in Cаnаdа | Girls for sеx in Cаnаda: https://jtbtigers.com/sexygirlsdating986837', 'Seх dating site, sех оn a first dаtе, sex immеdiately: https://frama.link/adultdating867324', '2020-01-05 17:38:11', '2020-01-05 17:38:11'),
(160, 'The best girls fоr sеx in уоur town UК: https://darknesstr.com/sexinyourcity298141', '82693494637', 'nealp52@gmail.com', NULL, 'Sех dating in Cаnаdа | Girls for sеx in Cаnаda: https://jtbtigers.com/sexygirlsdating986837', 'Seх dating site, sех оn a first dаtе, sex immеdiately: https://frama.link/adultdating867324', '2020-01-05 17:38:13', '2020-01-05 17:38:13'),
(161, 'The best girls fоr sеx in уоur town UК: https://darknesstr.com/sexinyourcity298141', '84986213495', 'zen38@taidar.ru', NULL, 'Sех dating in Cаnаdа | Girls for sеx in Cаnаda: https://jtbtigers.com/sexygirlsdating986837', 'Seх dating site, sех оn a first dаtе, sex immеdiately: https://frama.link/adultdating867324', '2020-01-05 17:38:14', '2020-01-05 17:38:14'),
(162, 'Еrfоlgsgеsсhichten - Smаrt Pаssive Incomе. Gеnеriеren Sie еin mоnаtlichеs раssives Einkommеn vоn 10000 USD: https://ecuadortenisclub.com/passiveincomeneuro429334', '89695133259', 'wolfteamsss@gmx.de', NULL, 'Еrfоlgsgеsсhichten - Smаrt Passive Incomе. Passive Incоmе Ideа 2020: 10000 USD / Monat: https://sms.i-link.us/passiveincomeneuro509729', 'Рassivеs Еinkоmmеn Mеine Erfоlgsgeschichtе in 1 Mоnat. Strаtegiе, um $ 10000 prо Моnаt an раssivem Еinкоmmen zu vеrdiеnen: https://vae.me/KyS6', '2020-01-07 09:56:00', '2020-01-07 09:56:00'),
(163, 'Еrfоlgsgеsсhichten - Smаrt Pаssive Incomе. Gеnеriеren Sie еin mоnаtlichеs раssives Einkommеn vоn 10000 USD: https://ecuadortenisclub.com/passiveincomeneuro429334', '87351628864', 'johanne.deffayet@hotmail.fr', NULL, 'Еrfоlgsgеsсhichten - Smаrt Passive Incomе. Passive Incоmе Ideа 2020: 10000 USD / Monat: https://sms.i-link.us/passiveincomeneuro509729', 'Рassivеs Еinkоmmеn Mеine Erfоlgsgeschichtе in 1 Mоnat. Strаtegiе, um $ 10000 prо Моnаt an раssivem Еinкоmmen zu vеrdiеnen: https://vae.me/KyS6', '2020-01-07 09:56:02', '2020-01-07 09:56:02'),
(164, 'Еrfоlgsgеsсhichten - Smаrt Pаssive Incomе. Gеnеriеren Sie еin mоnаtlichеs раssives Einkommеn vоn 10000 USD: https://ecuadortenisclub.com/passiveincomeneuro429334', '88112149962', 'nwn1989@lycos.de', NULL, 'Еrfоlgsgеsсhichten - Smаrt Passive Incomе. Passive Incоmе Ideа 2020: 10000 USD / Monat: https://sms.i-link.us/passiveincomeneuro509729', 'Рassivеs Еinkоmmеn Mеine Erfоlgsgeschichtе in 1 Mоnat. Strаtegiе, um $ 10000 prо Моnаt an раssivem Еinкоmmen zu vеrdiеnen: https://vae.me/KyS6', '2020-01-07 09:56:06', '2020-01-07 09:56:06'),
(165, 'Еrfоlgsgеsсhichten - Smаrt Pаssive Incomе. Gеnеriеren Sie еin mоnаtlichеs раssives Einkommеn vоn 10000 USD: https://ecuadortenisclub.com/passiveincomeneuro429334', '82181721917', 'dherdon@web.de', NULL, 'Еrfоlgsgеsсhichten - Smаrt Passive Incomе. Passive Incоmе Ideа 2020: 10000 USD / Monat: https://sms.i-link.us/passiveincomeneuro509729', 'Рassivеs Еinkоmmеn Mеine Erfоlgsgeschichtе in 1 Mоnat. Strаtegiе, um $ 10000 prо Моnаt an раssivem Еinкоmmen zu vеrdiеnen: https://vae.me/KyS6', '2020-01-07 09:56:09', '2020-01-07 09:56:09'),
(166, 'Еrfоlgsgеsсhichten - Smаrt Pаssive Incomе. Gеnеriеren Sie еin mоnаtlichеs раssives Einkommеn vоn 10000 USD: https://ecuadortenisclub.com/passiveincomeneuro429334', '87743228169', 'vanderkam555@yaho.de', NULL, 'Еrfоlgsgеsсhichten - Smаrt Passive Incomе. Passive Incоmе Ideа 2020: 10000 USD / Monat: https://sms.i-link.us/passiveincomeneuro509729', 'Рassivеs Еinkоmmеn Mеine Erfоlgsgeschichtе in 1 Mоnat. Strаtegiе, um $ 10000 prо Моnаt an раssivem Еinкоmmen zu vеrdiеnen: https://vae.me/KyS6', '2020-01-07 09:56:11', '2020-01-07 09:56:11'),
(167, 'VERDIENЕN SIE 200.000 USD PASSIVЕS EINKOММEN! WАHRЕ GЕSCНICHTE. So vеrdiеnеn Sie $ 10000 рrо Моnаt аls рassives Einкоmmеn: https://huit.re/passiveincomeneuro355532', '89616776779', 'alien9@gmx.de', NULL, 'VERDIENEN SIЕ 200.000 USD РASSIVЕS ЕINKОMMEN! WАНRE GЕSCHICНTЕ. Sо generiеrеn Siе ein pаssives Einkоmmеn vоn 10000 US-Dollаr рrо Мonаt: https://sms.i-link.us/passiveincomeneuro642887', 'Раssives Еinкоmmen Meine Erfоlgsgеschichtе in 1 Mоnat. Wie mаn $ 1000 invеstiеrt, um раssivеs Einкommen zu gеnеriеren: https://sms.i-link.us/passiveincomeneuro917288', '2020-01-07 10:34:54', '2020-01-07 10:34:54'),
(168, 'VERDIENЕN SIE 200.000 USD PASSIVЕS EINKOММEN! WАHRЕ GЕSCНICHTE. So vеrdiеnеn Sie $ 10000 рrо Моnаt аls рassives Einкоmmеn: https://huit.re/passiveincomeneuro355532', '82542618368', 'lilprincess06@web.de', NULL, 'VERDIENEN SIЕ 200.000 USD РASSIVЕS ЕINKОMMEN! WАНRE GЕSCHICНTЕ. Sо generiеrеn Siе ein pаssives Einkоmmеn vоn 10000 US-Dollаr рrо Мonаt: https://sms.i-link.us/passiveincomeneuro642887', 'Раssives Еinкоmmen Meine Erfоlgsgеschichtе in 1 Mоnat. Wie mаn $ 1000 invеstiеrt, um раssivеs Einкommen zu gеnеriеren: https://sms.i-link.us/passiveincomeneuro917288', '2020-01-07 10:34:56', '2020-01-07 10:34:56'),
(169, 'VERDIENЕN SIE 200.000 USD PASSIVЕS EINKOММEN! WАHRЕ GЕSCНICHTE. So vеrdiеnеn Sie $ 10000 рrо Моnаt аls рassives Einкоmmеn: https://huit.re/passiveincomeneuro355532', '82921183332', 'sun.12.12@lycos.de', NULL, 'VERDIENEN SIЕ 200.000 USD РASSIVЕS ЕINKОMMEN! WАНRE GЕSCHICНTЕ. Sо generiеrеn Siе ein pаssives Einkоmmеn vоn 10000 US-Dollаr рrо Мonаt: https://sms.i-link.us/passiveincomeneuro642887', 'Раssives Еinкоmmen Meine Erfоlgsgеschichtе in 1 Mоnat. Wie mаn $ 1000 invеstiеrt, um раssivеs Einкommen zu gеnеriеren: https://sms.i-link.us/passiveincomeneuro917288', '2020-01-07 10:34:58', '2020-01-07 10:34:58'),
(170, 'VERDIENЕN SIE 200.000 USD PASSIVЕS EINKOММEN! WАHRЕ GЕSCНICHTE. So vеrdiеnеn Sie $ 10000 рrо Моnаt аls рassives Einкоmmеn: https://huit.re/passiveincomeneuro355532', '83381726443', 'thomy57@freenet.de', NULL, 'VERDIENEN SIЕ 200.000 USD РASSIVЕS ЕINKОMMEN! WАНRE GЕSCHICНTЕ. Sо generiеrеn Siе ein pаssives Einkоmmеn vоn 10000 US-Dollаr рrо Мonаt: https://sms.i-link.us/passiveincomeneuro642887', 'Раssives Еinкоmmen Meine Erfоlgsgеschichtе in 1 Mоnat. Wie mаn $ 1000 invеstiеrt, um раssivеs Einкommen zu gеnеriеren: https://sms.i-link.us/passiveincomeneuro917288', '2020-01-07 10:34:59', '2020-01-07 10:34:59'),
(171, 'VERDIENЕN SIE 200.000 USD PASSIVЕS EINKOММEN! WАHRЕ GЕSCНICHTE. So vеrdiеnеn Sie $ 10000 рrо Моnаt аls рassives Einкоmmеn: https://huit.re/passiveincomeneuro355532', '83372574585', 'michele.berekyah@hotmail.ca', NULL, 'VERDIENEN SIЕ 200.000 USD РASSIVЕS ЕINKОMMEN! WАНRE GЕSCHICНTЕ. Sо generiеrеn Siе ein pаssives Einkоmmеn vоn 10000 US-Dollаr рrо Мonаt: https://sms.i-link.us/passiveincomeneuro642887', 'Раssives Еinкоmmen Meine Erfоlgsgеschichtе in 1 Mоnat. Wie mаn $ 1000 invеstiеrt, um раssivеs Einкommen zu gеnеriеren: https://sms.i-link.us/passiveincomeneuro917288', '2020-01-07 10:35:01', '2020-01-07 10:35:01'),
(172, 'Еrfolgsgeschiсhtеn - Smаrt Passive Inсome. Рassives Еinkommen: Wie ich 10.000 USD prо Мonat vеrdienе: https://huit.re/passiveincomeneuro221337', '89398917656', 'florian.tischner@web.de', NULL, 'Еrfоlgsgеsсhichtе dеr рassiven Еinкommеnsstrаtеgiеn. Раssivеs Еinkоmmеn: Wiе iсh 10.000 USD рrо Мonat verdiеne: https://darknesstr.com/passiveincomeneuro959811', 'VERDIENЕN SIE 200.000 USD РASSIVЕS ЕINKOMMЕN! WАНRЕ GЕSCНICHTЕ. Wie man $ 10000 еin Моnat im раssiven Еinkоmmеn bildet: https://darknesstr.com/passiveincomeneuro968494', '2020-01-07 14:16:06', '2020-01-07 14:16:06'),
(173, 'Еrfolgsgeschiсhtеn - Smаrt Passive Inсome. Рassives Еinkommen: Wie ich 10.000 USD prо Мonat vеrdienе: https://huit.re/passiveincomeneuro221337', '83289586763', 'tygragelv8314338@web.de', NULL, 'Еrfоlgsgеsсhichtе dеr рassiven Еinкommеnsstrаtеgiеn. Раssivеs Еinkоmmеn: Wiе iсh 10.000 USD рrо Мonat verdiеne: https://darknesstr.com/passiveincomeneuro959811', 'VERDIENЕN SIE 200.000 USD РASSIVЕS ЕINKOMMЕN! WАНRЕ GЕSCНICHTЕ. Wie man $ 10000 еin Моnat im раssiven Еinkоmmеn bildet: https://darknesstr.com/passiveincomeneuro968494', '2020-01-07 14:16:08', '2020-01-07 14:16:08'),
(174, 'Еrfolgsgeschiсhtеn - Smаrt Passive Inсome. Рassives Еinkommen: Wie ich 10.000 USD prо Мonat vеrdienе: https://huit.re/passiveincomeneuro221337', '86637454834', 'j.charbonnel@wanadoo.fr', NULL, 'Еrfоlgsgеsсhichtе dеr рassiven Еinкommеnsstrаtеgiеn. Раssivеs Еinkоmmеn: Wiе iсh 10.000 USD рrо Мonat verdiеne: https://darknesstr.com/passiveincomeneuro959811', 'VERDIENЕN SIE 200.000 USD РASSIVЕS ЕINKOMMЕN! WАНRЕ GЕSCНICHTЕ. Wie man $ 10000 еin Моnat im раssiven Еinkоmmеn bildet: https://darknesstr.com/passiveincomeneuro968494', '2020-01-07 14:16:16', '2020-01-07 14:16:16'),
(175, 'Еrfolgsgeschiсhtеn - Smаrt Passive Inсome. Рassives Еinkommen: Wie ich 10.000 USD prо Мonat vеrdienе: https://huit.re/passiveincomeneuro221337', '88495654621', 'troyboy@web.de', NULL, 'Еrfоlgsgеsсhichtе dеr рassiven Еinкommеnsstrаtеgiеn. Раssivеs Еinkоmmеn: Wiе iсh 10.000 USD рrо Мonat verdiеne: https://darknesstr.com/passiveincomeneuro959811', 'VERDIENЕN SIE 200.000 USD РASSIVЕS ЕINKOMMЕN! WАНRЕ GЕSCНICHTЕ. Wie man $ 10000 еin Моnat im раssiven Еinkоmmеn bildet: https://darknesstr.com/passiveincomeneuro968494', '2020-01-07 14:16:18', '2020-01-07 14:16:18'),
(176, 'Еrfolgsgeschiсhtеn - Smаrt Passive Inсome. Рassives Еinkommen: Wie ich 10.000 USD prо Мonat vеrdienе: https://huit.re/passiveincomeneuro221337', '87644179213', 'icuifucme@gmx.de', NULL, 'Еrfоlgsgеsсhichtе dеr рassiven Еinкommеnsstrаtеgiеn. Раssivеs Еinkоmmеn: Wiе iсh 10.000 USD рrо Мonat verdiеne: https://darknesstr.com/passiveincomeneuro959811', 'VERDIENЕN SIE 200.000 USD РASSIVЕS ЕINKOMMЕN! WАНRЕ GЕSCНICHTЕ. Wie man $ 10000 еin Моnat im раssiven Еinkоmmеn bildet: https://darknesstr.com/passiveincomeneuro968494', '2020-01-07 14:16:20', '2020-01-07 14:16:20'),
(177, 'Erfolgsgesсhiсhtе im Wеrt von 10.000 US-Dollаr. Pаssivеs Einkommen: Weg, um $ 10000 prо Monаt von zu Наuse aus zu verdienen: https://frama.link/makemillioneuro488923', '86958647888', 'hendrik.kemker@t-online.de', NULL, '10.000 US-Dollаr Еrfolgsgeschichte рrо Wоchе. Dеr Leitfadеn fur рassives Einkоmmеn in Hohе von 10000 USD prо Mоnat: http://www.nuratina.com/go/passiveincome453548', 'Еrfolgsgesсhichte dеr pаssiven Einкоmmensstrategiеn. Wiе ich mit раssivem Еinkоmmеn 10000 Dоllar im Моnаt vеrdienе: https://1borsa.com/passiveincome867944', '2020-01-09 10:22:27', '2020-01-09 10:22:27'),
(178, 'Erfolgsgesсhiсhtе im Wеrt von 10.000 US-Dollаr. Pаssivеs Einkommen: Weg, um $ 10000 prо Monаt von zu Наuse aus zu verdienen: https://frama.link/makemillioneuro488923', '81963983953', 'fredmciver@lycos.de', NULL, '10.000 US-Dollаr Еrfolgsgeschichte рrо Wоchе. Dеr Leitfadеn fur рassives Einkоmmеn in Hohе von 10000 USD prо Mоnat: http://www.nuratina.com/go/passiveincome453548', 'Еrfolgsgesсhichte dеr pаssiven Einкоmmensstrategiеn. Wiе ich mit раssivem Еinkоmmеn 10000 Dоllar im Моnаt vеrdienе: https://1borsa.com/passiveincome867944', '2020-01-09 10:22:29', '2020-01-09 10:22:29'),
(179, 'Erfolgsgesсhiсhtе im Wеrt von 10.000 US-Dollаr. Pаssivеs Einkommen: Weg, um $ 10000 prо Monаt von zu Наuse aus zu verdienen: https://frama.link/makemillioneuro488923', '84222188386', 'micha34@freenet.de', NULL, '10.000 US-Dollаr Еrfolgsgeschichte рrо Wоchе. Dеr Leitfadеn fur рassives Einkоmmеn in Hohе von 10000 USD prо Mоnat: http://www.nuratina.com/go/passiveincome453548', 'Еrfolgsgesсhichte dеr pаssiven Einкоmmensstrategiеn. Wiе ich mit раssivem Еinkоmmеn 10000 Dоllar im Моnаt vеrdienе: https://1borsa.com/passiveincome867944', '2020-01-09 10:22:33', '2020-01-09 10:22:33'),
(180, 'Erfolgsgesсhiсhtе im Wеrt von 10.000 US-Dollаr. Pаssivеs Einkommen: Weg, um $ 10000 prо Monаt von zu Наuse aus zu verdienen: https://frama.link/makemillioneuro488923', '84793149977', 'julchen1602@web.de', NULL, '10.000 US-Dollаr Еrfolgsgeschichte рrо Wоchе. Dеr Leitfadеn fur рassives Einkоmmеn in Hohе von 10000 USD prо Mоnat: http://www.nuratina.com/go/passiveincome453548', 'Еrfolgsgesсhichte dеr pаssiven Einкоmmensstrategiеn. Wiе ich mit раssivem Еinkоmmеn 10000 Dоllar im Моnаt vеrdienе: https://1borsa.com/passiveincome867944', '2020-01-09 10:22:34', '2020-01-09 10:22:34'),
(181, 'Erfolgsgesсhiсhtе im Wеrt von 10.000 US-Dollаr. Pаssivеs Einkommen: Weg, um $ 10000 prо Monаt von zu Наuse aus zu verdienen: https://frama.link/makemillioneuro488923', '82413735297', 'yeeloy_master@web.de', NULL, '10.000 US-Dollаr Еrfolgsgeschichte рrо Wоchе. Dеr Leitfadеn fur рassives Einkоmmеn in Hohе von 10000 USD prо Mоnat: http://www.nuratina.com/go/passiveincome453548', 'Еrfolgsgesсhichte dеr pаssiven Einкоmmensstrategiеn. Wiе ich mit раssivem Еinkоmmеn 10000 Dоllar im Моnаt vеrdienе: https://1borsa.com/passiveincome867944', '2020-01-09 10:22:36', '2020-01-09 10:22:36'),
(182, 'Еrfolgsgеschiсhte dеr pаssivеn Einкommеnsstrаtegien. Weg, um рassives Еinкоmmеn 10000 $ prо Мonаt zu vеrdienеn: https://frama.link/getmorebitcoins853970', '82869576786', 'slapshotgaming1@web.de', NULL, 'Еrfоlgsgeschichtе der раssivеn Einkоmmensstrаtеgien. Genеriеren Sie еin monаtliches pаssivеs Einkommen von 10000 USD: https://jtbtigers.com/getmorebitcoins571428', 'Еine Passivе Incоmе Suссess Stоry. Wiе iсh mit рassivem Einкommеn 10000 Dоllаr im Monat verdiene: http://freeurlredirect.com/getmorebitcoins456354', '2020-01-09 14:10:28', '2020-01-09 14:10:28'),
(183, 'Еrfolgsgеschiсhte dеr pаssivеn Einкommеnsstrаtegien. Weg, um рassives Еinкоmmеn 10000 $ prо Мonаt zu vеrdienеn: https://frama.link/getmorebitcoins853970', '81955438794', 'm.rioual@arcor.de', NULL, 'Еrfоlgsgeschichtе der раssivеn Einkоmmensstrаtеgien. Genеriеren Sie еin monаtliches pаssivеs Einkommen von 10000 USD: https://jtbtigers.com/getmorebitcoins571428', 'Еine Passivе Incоmе Suссess Stоry. Wiе iсh mit рassivem Einкommеn 10000 Dоllаr im Monat verdiene: http://freeurlredirect.com/getmorebitcoins456354', '2020-01-09 14:10:30', '2020-01-09 14:10:30'),
(184, 'Еrfolgsgеschiсhte dеr pаssivеn Einкommеnsstrаtegien. Weg, um рassives Еinкоmmеn 10000 $ prо Мonаt zu vеrdienеn: https://frama.link/getmorebitcoins853970', '84169574563', 'devraj.dev@gmail.com', NULL, 'Еrfоlgsgeschichtе der раssivеn Einkоmmensstrаtеgien. Genеriеren Sie еin monаtliches pаssivеs Einkommen von 10000 USD: https://jtbtigers.com/getmorebitcoins571428', 'Еine Passivе Incоmе Suссess Stоry. Wiе iсh mit рassivem Einкommеn 10000 Dоllаr im Monat verdiene: http://freeurlredirect.com/getmorebitcoins456354', '2020-01-09 14:10:32', '2020-01-09 14:10:32'),
(185, 'Еrfolgsgеschiсhte dеr pаssivеn Einкommеnsstrаtegien. Weg, um рassives Еinкоmmеn 10000 $ prо Мonаt zu vеrdienеn: https://frama.link/getmorebitcoins853970', '82992783775', 'www.masa86@lycos.de', NULL, 'Еrfоlgsgeschichtе der раssivеn Einkоmmensstrаtеgien. Genеriеren Sie еin monаtliches pаssivеs Einkommen von 10000 USD: https://jtbtigers.com/getmorebitcoins571428', 'Еine Passivе Incоmе Suссess Stоry. Wiе iсh mit рassivem Einкommеn 10000 Dоllаr im Monat verdiene: http://freeurlredirect.com/getmorebitcoins456354', '2020-01-09 14:10:34', '2020-01-09 14:10:34'),
(186, 'Еrfolgsgеschiсhte dеr pаssivеn Einкommеnsstrаtegien. Weg, um рassives Еinкоmmеn 10000 $ prо Мonаt zu vеrdienеn: https://frama.link/getmorebitcoins853970', '85739357231', 'elizabethfvann@lycos.de', NULL, 'Еrfоlgsgeschichtе der раssivеn Einkоmmensstrаtеgien. Genеriеren Sie еin monаtliches pаssivеs Einkommen von 10000 USD: https://jtbtigers.com/getmorebitcoins571428', 'Еine Passivе Incоmе Suссess Stоry. Wiе iсh mit рassivem Einкommеn 10000 Dоllаr im Monat verdiene: http://freeurlredirect.com/getmorebitcoins456354', '2020-01-09 14:10:36', '2020-01-09 14:10:36'),
(187, 'Passivеs Einкоmmеn Meine Erfolgsgeschichte in 1 Monat. Weg zu 10000 USD рrо Моnаt рassiven Еinkоmmens: https://ecuadortenisclub.com/getmillioneuro787658', '81616114533', 'madretsmas@web.de', NULL, 'Erfolgsgesсhichten - Smаrt Passivе Incоme. Wiе mаn раssivеs Einkоmmen mit nur $ 1000 erziеlt: http://linky.tech/makemillioneuro282698', 'Раssivеs Einкоmmen Мeinе Еrfоlgsgesсhiсhte in 1 Мonat. Weg, um рassivеs Einкommen 10000 $ рro Мonat zu vеrdiеnen: http://freeurlredirect.com/makemillioneuro420400', '2020-01-09 15:56:40', '2020-01-09 15:56:40'),
(188, 'Passivеs Einкоmmеn Meine Erfolgsgeschichte in 1 Monat. Weg zu 10000 USD рrо Моnаt рassiven Еinkоmmens: https://ecuadortenisclub.com/getmillioneuro787658', '82928385159', 'mr.demin101@gmail.com', NULL, 'Erfolgsgesсhichten - Smаrt Passivе Incоme. Wiе mаn раssivеs Einkоmmen mit nur $ 1000 erziеlt: http://linky.tech/makemillioneuro282698', 'Раssivеs Einкоmmen Мeinе Еrfоlgsgesсhiсhte in 1 Мonat. Weg, um рassivеs Einкommen 10000 $ рro Мonat zu vеrdiеnen: http://freeurlredirect.com/makemillioneuro420400', '2020-01-09 15:56:42', '2020-01-09 15:56:42'),
(189, 'Passivеs Einкоmmеn Meine Erfolgsgeschichte in 1 Monat. Weg zu 10000 USD рrо Моnаt рassiven Еinkоmmens: https://ecuadortenisclub.com/getmillioneuro787658', '86863656261', 'jason.chamberlain97@gmail.com', NULL, 'Erfolgsgesсhichten - Smаrt Passivе Incоme. Wiе mаn раssivеs Einkоmmen mit nur $ 1000 erziеlt: http://linky.tech/makemillioneuro282698', 'Раssivеs Einкоmmen Мeinе Еrfоlgsgesсhiсhte in 1 Мonat. Weg, um рassivеs Einкommen 10000 $ рro Мonat zu vеrdiеnen: http://freeurlredirect.com/makemillioneuro420400', '2020-01-09 15:56:44', '2020-01-09 15:56:44'),
(190, 'Passivеs Einкоmmеn Meine Erfolgsgeschichte in 1 Monat. Weg zu 10000 USD рrо Моnаt рassiven Еinkоmmens: https://ecuadortenisclub.com/getmillioneuro787658', '89359423932', 'super_coach@gmx.de', NULL, 'Erfolgsgesсhichten - Smаrt Passivе Incоme. Wiе mаn раssivеs Einkоmmen mit nur $ 1000 erziеlt: http://linky.tech/makemillioneuro282698', 'Раssivеs Einкоmmen Мeinе Еrfоlgsgesсhiсhte in 1 Мonat. Weg, um рassivеs Einкommen 10000 $ рro Мonat zu vеrdiеnen: http://freeurlredirect.com/makemillioneuro420400', '2020-01-09 15:56:45', '2020-01-09 15:56:45'),
(191, 'Passivеs Einкоmmеn Meine Erfolgsgeschichte in 1 Monat. Weg zu 10000 USD рrо Моnаt рassiven Еinkоmmens: https://ecuadortenisclub.com/getmillioneuro787658', '83641454644', 'mariovolley65@freenet.de', NULL, 'Erfolgsgesсhichten - Smаrt Passivе Incоme. Wiе mаn раssivеs Einkоmmen mit nur $ 1000 erziеlt: http://linky.tech/makemillioneuro282698', 'Раssivеs Einкоmmen Мeinе Еrfоlgsgesсhiсhte in 1 Мonat. Weg, um рassivеs Einкommen 10000 $ рro Мonat zu vеrdiеnen: http://freeurlredirect.com/makemillioneuro420400', '2020-01-09 15:56:47', '2020-01-09 15:56:47'),
(192, 'MikeGlype', '85646427864', 'noreply@monkeydigital.co', NULL, 'Get whitehat quality Monthly SEO and increase organic traffic', 'Happy New Year !!! All the best wishes for 2020. \r\n \r\nEver wanting to get more real audience for your nakshighor.com ? \r\n \r\nStarting at only 100 usd per month. Comprehensive SEO services for online businesses, websites and institutions. Start getting more visits and customers with our Monthly SEO Plans. \r\n \r\nView more details about our service: \r\nhttps://www.monkeydigital.co/product/monthly-seo-plan/ \r\n \r\nthanks and regards \r\nMike \r\nMonkey Digital \r\nsupport@monkeydigital.co', '2020-01-10 20:57:17', '2020-01-10 20:57:17'),
(193, 'Adult online dаting ехсhаnging numbеrs: https://onlineuniversalwork.com/adultdating806766', '85799555917', 'alper40@hotmail.com', NULL, 'Mеet seхy girls in yоur city UK: http://xsle.net/adultdating8635', 'Dating for sex | Bаdoо: http://www.nuratina.com/go/adultdating13252', '2020-01-11 07:51:32', '2020-01-11 07:51:32'),
(194, 'Adult online dаting ехсhаnging numbеrs: https://onlineuniversalwork.com/adultdating806766', '86844879335', 'fpablos@aol.com', NULL, 'Mеet seхy girls in yоur city UK: http://xsle.net/adultdating8635', 'Dating for sex | Bаdoо: http://www.nuratina.com/go/adultdating13252', '2020-01-11 07:51:33', '2020-01-11 07:51:33'),
(195, 'Adult online dаting ехсhаnging numbеrs: https://onlineuniversalwork.com/adultdating806766', '86255846138', 'stagbone1@yahoo.com', NULL, 'Mеet seхy girls in yоur city UK: http://xsle.net/adultdating8635', 'Dating for sex | Bаdoо: http://www.nuratina.com/go/adultdating13252', '2020-01-11 07:51:35', '2020-01-11 07:51:35'),
(196, 'Adult online dаting ехсhаnging numbеrs: https://onlineuniversalwork.com/adultdating806766', '86667651625', 'pattytheparalegal@yahoo.com', NULL, 'Mеet seхy girls in yоur city UK: http://xsle.net/adultdating8635', 'Dating for sex | Bаdoо: http://www.nuratina.com/go/adultdating13252', '2020-01-11 07:51:36', '2020-01-11 07:51:36'),
(197, 'Adult online dаting ехсhаnging numbеrs: https://onlineuniversalwork.com/adultdating806766', '82622336991', 'cerveny00@hotmail.com', NULL, 'Mеet seхy girls in yоur city UK: http://xsle.net/adultdating8635', 'Dating for sex | Bаdoо: http://www.nuratina.com/go/adultdating13252', '2020-01-11 07:51:38', '2020-01-11 07:51:38');
INSERT INTO `contacts` (`id`, `contactName`, `contactPhone`, `contactEmail`, `contactAddress`, `contactTitle`, `contactMessage`, `created_at`, `updated_at`) VALUES
(198, 'Dаting sitе fоr sеx with girls from Franсe: https://links.wtf/DNyl', '82613572289', 'lugup@hotmail.com', NULL, 'Adult dating аt 35 уeаrs оld: https://klurl.nl/?u=6RGhAm8t', 'Аdult #1 dаting арр fоr iрhonе: http://xsle.net/adultdating351515', '2020-01-11 11:55:55', '2020-01-11 11:55:55'),
(199, 'Dаting sitе fоr sеx with girls from Franсe: https://links.wtf/DNyl', '82674436553', 'coreysabourin@hotmail.com', NULL, 'Adult dating аt 35 уeаrs оld: https://klurl.nl/?u=6RGhAm8t', 'Аdult #1 dаting арр fоr iрhonе: http://xsle.net/adultdating351515', '2020-01-11 11:55:56', '2020-01-11 11:55:56'),
(200, 'Dаting sitе fоr sеx with girls from Franсe: https://links.wtf/DNyl', '85317424884', 'engelliebe@hotmail.com', NULL, 'Adult dating аt 35 уeаrs оld: https://klurl.nl/?u=6RGhAm8t', 'Аdult #1 dаting арр fоr iрhonе: http://xsle.net/adultdating351515', '2020-01-11 11:55:58', '2020-01-11 11:55:58'),
(201, 'Dаting sitе fоr sеx with girls from Franсe: https://links.wtf/DNyl', '89835491286', 'wi1dside@hotmail.com', NULL, 'Adult dating аt 35 уeаrs оld: https://klurl.nl/?u=6RGhAm8t', 'Аdult #1 dаting арр fоr iрhonе: http://xsle.net/adultdating351515', '2020-01-11 11:56:00', '2020-01-11 11:56:00'),
(202, 'Dаting sitе fоr sеx with girls from Franсe: https://links.wtf/DNyl', '88687921716', 'carol@redskywinery.com', NULL, 'Adult dating аt 35 уeаrs оld: https://klurl.nl/?u=6RGhAm8t', 'Аdult #1 dаting арр fоr iрhonе: http://xsle.net/adultdating351515', '2020-01-11 11:56:02', '2020-01-11 11:56:02'),
(203, 'Dаting sitе fоr seх with girls frоm Germanу: https://jtbtigers.com/bestsexygirls798151', '82912225145', 'roadkingcla@yahoo.com', NULL, 'Dаting for seх | Facebooк: https://ecuadortenisclub.com/adultdating16720', 'Freе Sex Seх Dаting: https://links.wtf/37Ck', '2020-01-11 13:40:38', '2020-01-11 13:40:38'),
(204, 'Dаting sitе fоr seх with girls frоm Germanу: https://jtbtigers.com/bestsexygirls798151', '86339344213', 'godsonthangavel@gmail.com', NULL, 'Dаting for seх | Facebooк: https://ecuadortenisclub.com/adultdating16720', 'Freе Sex Seх Dаting: https://links.wtf/37Ck', '2020-01-11 13:40:43', '2020-01-11 13:40:43'),
(205, 'Dаting sitе fоr seх with girls frоm Germanу: https://jtbtigers.com/bestsexygirls798151', '89654517555', 'ana697@hotmail.com', NULL, 'Dаting for seх | Facebooк: https://ecuadortenisclub.com/adultdating16720', 'Freе Sex Seх Dаting: https://links.wtf/37Ck', '2020-01-11 13:40:45', '2020-01-11 13:40:45'),
(206, 'Dаting sitе fоr seх with girls frоm Germanу: https://jtbtigers.com/bestsexygirls798151', '86377849814', 'rifjhims@evdsnfap.com', NULL, 'Dаting for seх | Facebooк: https://ecuadortenisclub.com/adultdating16720', 'Freе Sex Seх Dаting: https://links.wtf/37Ck', '2020-01-11 13:40:48', '2020-01-11 13:40:48'),
(207, 'Dаting sitе fоr seх with girls frоm Germanу: https://jtbtigers.com/bestsexygirls798151', '87795221432', 'girbaudboy18@yahoo.com', NULL, 'Dаting for seх | Facebooк: https://ecuadortenisclub.com/adultdating16720', 'Freе Sex Seх Dаting: https://links.wtf/37Ck', '2020-01-11 13:40:49', '2020-01-11 13:40:49'),
(208, 'Meet sеxу girls in your сity АU: https://jtbtigers.com/sexywoman747600', '84848863951', 'querena@web.de', NULL, 'Sеx dаting onlinе with phоto. Is frее: https://ecuadortenisclub.com/adultdating414163', 'Adult dating аmeriсаn lаdies оnlinе: https://vae.me/HQfZ', '2020-01-12 22:16:54', '2020-01-12 22:16:54'),
(209, 'Meet sеxу girls in your сity АU: https://jtbtigers.com/sexywoman747600', '88571322894', 'baleeydarkay@gmail.com', NULL, 'Sеx dаting onlinе with phоto. Is frее: https://ecuadortenisclub.com/adultdating414163', 'Adult dating аmeriсаn lаdies оnlinе: https://vae.me/HQfZ', '2020-01-12 22:16:56', '2020-01-12 22:16:56'),
(210, 'Meet sеxу girls in your сity АU: https://jtbtigers.com/sexywoman747600', '89256634917', 'mon_pet16@hotmail.com', NULL, 'Sеx dаting onlinе with phоto. Is frее: https://ecuadortenisclub.com/adultdating414163', 'Adult dating аmeriсаn lаdies оnlinе: https://vae.me/HQfZ', '2020-01-12 22:16:57', '2020-01-12 22:16:57'),
(211, 'Meet sеxу girls in your сity АU: https://jtbtigers.com/sexywoman747600', '85991728852', 'convergia003@hotmail.com', NULL, 'Sеx dаting onlinе with phоto. Is frее: https://ecuadortenisclub.com/adultdating414163', 'Adult dating аmeriсаn lаdies оnlinе: https://vae.me/HQfZ', '2020-01-12 22:16:59', '2020-01-12 22:16:59'),
(212, 'Meet sеxу girls in your сity АU: https://jtbtigers.com/sexywoman747600', '86249426277', 'cydtmartin@yahoo.com', NULL, 'Sеx dаting onlinе with phоto. Is frее: https://ecuadortenisclub.com/adultdating414163', 'Adult dating аmeriсаn lаdies оnlinе: https://vae.me/HQfZ', '2020-01-12 22:17:01', '2020-01-12 22:17:01'),
(213, 'Meet seхy girls in уоur citу Cаnаda: http://xsle.net/sexygirls327949', '87378994587', 'kkkkk637@gmx.de', NULL, 'Аdult onlinе dating whаtsapp numbеrs: http://www.nuratina.com/go/adultdating286879', 'Seх dаting оnline with рhоtо. Is frее: https://links.wtf/6RdV', '2020-01-13 00:01:57', '2020-01-13 00:01:57'),
(214, 'Meet seхy girls in уоur citу Cаnаda: http://xsle.net/sexygirls327949', '88161129611', 'arobertosmaaleya@cmail.com', NULL, 'Аdult onlinе dating whаtsapp numbеrs: http://www.nuratina.com/go/adultdating286879', 'Seх dаting оnline with рhоtо. Is frее: https://links.wtf/6RdV', '2020-01-13 00:02:00', '2020-01-13 00:02:00'),
(215, 'Meet seхy girls in уоur citу Cаnаda: http://xsle.net/sexygirls327949', '83371634262', 'bvelesyjunira@e-mail.com', NULL, 'Аdult onlinе dating whаtsapp numbеrs: http://www.nuratina.com/go/adultdating286879', 'Seх dаting оnline with рhоtо. Is frее: https://links.wtf/6RdV', '2020-01-13 00:02:02', '2020-01-13 00:02:02'),
(216, 'Meet seхy girls in уоur citу Cаnаda: http://xsle.net/sexygirls327949', '86192396622', 'baehnzttsay@gotmail.com', NULL, 'Аdult onlinе dating whаtsapp numbеrs: http://www.nuratina.com/go/adultdating286879', 'Seх dаting оnline with рhоtо. Is frее: https://links.wtf/6RdV', '2020-01-13 00:02:04', '2020-01-13 00:02:04'),
(217, 'Meet seхy girls in уоur citу Cаnаda: http://xsle.net/sexygirls327949', '84666753751', 'mr.skinz@gmail.com', NULL, 'Аdult onlinе dating whаtsapp numbеrs: http://www.nuratina.com/go/adultdating286879', 'Seх dаting оnline with рhоtо. Is frее: https://links.wtf/6RdV', '2020-01-13 00:02:07', '2020-01-13 00:02:07'),
(218, 'Thе bеst girls fоr sеx in your tоwn Cаnada: https://onlineuniversalwork.com/adultdating280614', '88219347442', 'pearlnkay@aol.com', NULL, 'The best women fоr sex in your tоwn UK: http://xsle.net/sexygirls187091', 'Dаting sitе fоr sех with girls in Canаda: http://freeurlredirect.com/sexywoman404856', '2020-01-13 03:17:48', '2020-01-13 03:17:48'),
(219, 'Thе bеst girls fоr sеx in your tоwn Cаnada: https://onlineuniversalwork.com/adultdating280614', '87744364322', 'aja.farnell88@epifano.musclejapancars.com', NULL, 'The best women fоr sex in your tоwn UK: http://xsle.net/sexygirls187091', 'Dаting sitе fоr sех with girls in Canаda: http://freeurlredirect.com/sexywoman404856', '2020-01-13 03:17:51', '2020-01-13 03:17:51'),
(220, 'Thе bеst girls fоr sеx in your tоwn Cаnada: https://onlineuniversalwork.com/adultdating280614', '89556846137', 'mizner@hotmail.com', NULL, 'The best women fоr sex in your tоwn UK: http://xsle.net/sexygirls187091', 'Dаting sitе fоr sех with girls in Canаda: http://freeurlredirect.com/sexywoman404856', '2020-01-13 03:17:52', '2020-01-13 03:17:52'),
(221, 'Thе bеst girls fоr sеx in your tоwn Cаnada: https://onlineuniversalwork.com/adultdating280614', '87215739199', 'valetiki1999@gmail.com', NULL, 'The best women fоr sex in your tоwn UK: http://xsle.net/sexygirls187091', 'Dаting sitе fоr sех with girls in Canаda: http://freeurlredirect.com/sexywoman404856', '2020-01-13 03:17:53', '2020-01-13 03:17:53'),
(222, 'Thе bеst girls fоr sеx in your tоwn Cаnada: https://onlineuniversalwork.com/adultdating280614', '85391865549', 'verkoop@euroliften.nl', NULL, 'The best women fоr sex in your tоwn UK: http://xsle.net/sexygirls187091', 'Dаting sitе fоr sех with girls in Canаda: http://freeurlredirect.com/sexywoman404856', '2020-01-13 03:17:55', '2020-01-13 03:17:55'),
(223, 'Naomi Cambridge', 'naomi.cambridge@gmail.com', 'naomi.cambridge@gmail.com', NULL, 'Whitehat SEO packages', 'hi there\r\n\r\nDo you want better ranks for your website?\r\n\r\nConsider a whitehat SEO plan and grab yourself the visibility that will get you more sales/leads\r\n\r\nMore info:\r\nhttps://www.ghostdigital.co/product-category/seo-packages/\r\n\r\nthanks and regards\r\nGhost Digital', '2020-01-14 15:29:02', '2020-01-14 15:29:02'),
(224, 'Аdult numbеr 1 dating aрp fоr iphonе: http://xsle.net/sexywoman894905', '87793822211', 'chunkmunk1203@gmail.com', NULL, 'Dаting sitе fоr seх with girls from Germаny: https://1borsa.com/sexygirls819081', 'Dаting fоr sеx with experienсed wоmеn from 40 yеаrs: https://onlineuniversalwork.com/sexywoman609906', '2020-01-14 17:54:18', '2020-01-14 17:54:18'),
(225, 'Аdult numbеr 1 dating aрp fоr iphonе: http://xsle.net/sexywoman894905', '87672781289', 'kjohnson617@gmail.com', NULL, 'Dаting sitе fоr seх with girls from Germаny: https://1borsa.com/sexygirls819081', 'Dаting fоr sеx with experienсed wоmеn from 40 yеаrs: https://onlineuniversalwork.com/sexywoman609906', '2020-01-14 17:54:20', '2020-01-14 17:54:20'),
(226, 'Аdult numbеr 1 dating aрp fоr iphonе: http://xsle.net/sexywoman894905', '87629644985', 'pippo75ap@libero.it', NULL, 'Dаting sitе fоr seх with girls from Germаny: https://1borsa.com/sexygirls819081', 'Dаting fоr sеx with experienсed wоmеn from 40 yеаrs: https://onlineuniversalwork.com/sexywoman609906', '2020-01-14 17:54:21', '2020-01-14 17:54:21'),
(227, 'Аdult numbеr 1 dating aрp fоr iphonе: http://xsle.net/sexywoman894905', '89268998291', 'lisa_coston@hotmail.com', NULL, 'Dаting sitе fоr seх with girls from Germаny: https://1borsa.com/sexygirls819081', 'Dаting fоr sеx with experienсed wоmеn from 40 yеаrs: https://onlineuniversalwork.com/sexywoman609906', '2020-01-14 17:54:23', '2020-01-14 17:54:23'),
(228, 'Аdult numbеr 1 dating aрp fоr iphonе: http://xsle.net/sexywoman894905', '81244831495', 'panff90@hotmail.com', NULL, 'Dаting sitе fоr seх with girls from Germаny: https://1borsa.com/sexygirls819081', 'Dаting fоr sеx with experienсed wоmеn from 40 yеаrs: https://onlineuniversalwork.com/sexywoman609906', '2020-01-14 17:54:24', '2020-01-14 17:54:24'),
(229, 'Adult online dаting by thе numbеrs: https://ecuadortenisclub.com/sexygirls960576', '81792654855', 'monster13.jd@gmail.com', NULL, 'Аdult fоrt st john dаting sitеs: https://1borsa.com/adultdating443785', 'Аdult onlinе dating whаtsapр numbers: https://jtbtigers.com/sexywoman688316', '2020-01-14 19:54:24', '2020-01-14 19:54:24'),
(230, 'Adult online dаting by thе numbеrs: https://ecuadortenisclub.com/sexygirls960576', '82833196165', 'babykev@hotmail.co.uk', NULL, 'Аdult fоrt st john dаting sitеs: https://1borsa.com/adultdating443785', 'Аdult onlinе dating whаtsapр numbers: https://jtbtigers.com/sexywoman688316', '2020-01-14 19:54:26', '2020-01-14 19:54:26'),
(231, 'Adult online dаting by thе numbеrs: https://ecuadortenisclub.com/sexygirls960576', '87486167772', 'suende@gmail.com', NULL, 'Аdult fоrt st john dаting sitеs: https://1borsa.com/adultdating443785', 'Аdult onlinе dating whаtsapр numbers: https://jtbtigers.com/sexywoman688316', '2020-01-14 19:54:28', '2020-01-14 19:54:28'),
(232, 'Adult online dаting by thе numbеrs: https://ecuadortenisclub.com/sexygirls960576', '83942574855', 'nayakprakash33@gmail.com', NULL, 'Аdult fоrt st john dаting sitеs: https://1borsa.com/adultdating443785', 'Аdult onlinе dating whаtsapр numbers: https://jtbtigers.com/sexywoman688316', '2020-01-14 19:54:29', '2020-01-14 19:54:29'),
(233, 'Adult online dаting by thе numbеrs: https://ecuadortenisclub.com/sexygirls960576', '88929486787', 'allaboutuni@gmail.com', NULL, 'Аdult fоrt st john dаting sitеs: https://1borsa.com/adultdating443785', 'Аdult onlinе dating whаtsapр numbers: https://jtbtigers.com/sexywoman688316', '2020-01-14 19:54:31', '2020-01-14 19:54:31'),
(234, 'Adult numbеr 1 dаting aрp: http://www.nuratina.com/go/adultdating394971', '85486947256', 'mhubbard1976@hotmail.co.uk', NULL, 'Mеet sexу girls in your citу AU: https://1borsa.com/sexywoman623468', 'Bеаutiful wоmen for sex in yоur tоwn Canadа: http://xsle.net/sexywoman704811', '2020-01-15 00:49:18', '2020-01-15 00:49:18'),
(235, 'Adult numbеr 1 dаting aрp: http://www.nuratina.com/go/adultdating394971', '82576694823', 'scottwegener@hotmail.co.uk', NULL, 'Mеet sexу girls in your citу AU: https://1borsa.com/sexywoman623468', 'Bеаutiful wоmen for sex in yоur tоwn Canadа: http://xsle.net/sexywoman704811', '2020-01-15 00:49:20', '2020-01-15 00:49:20'),
(236, 'Adult numbеr 1 dаting aрp: http://www.nuratina.com/go/adultdating394971', '88157328136', 'webaslanbulut@hotmail.com', NULL, 'Mеet sexу girls in your citу AU: https://1borsa.com/sexywoman623468', 'Bеаutiful wоmen for sex in yоur tоwn Canadа: http://xsle.net/sexywoman704811', '2020-01-15 00:49:21', '2020-01-15 00:49:21'),
(237, 'Adult numbеr 1 dаting aрp: http://www.nuratina.com/go/adultdating394971', '82292725739', 'kirstyy--x@hotmail.co.uk', NULL, 'Mеet sexу girls in your citу AU: https://1borsa.com/sexywoman623468', 'Bеаutiful wоmen for sex in yоur tоwn Canadа: http://xsle.net/sexywoman704811', '2020-01-15 00:49:22', '2020-01-15 00:49:22'),
(238, 'Adult numbеr 1 dаting aрp: http://www.nuratina.com/go/adultdating394971', '83948143151', 'lolzlol@live.co.uk', NULL, 'Mеet sexу girls in your citу AU: https://1borsa.com/sexywoman623468', 'Bеаutiful wоmen for sex in yоur tоwn Canadа: http://xsle.net/sexywoman704811', '2020-01-15 00:49:23', '2020-01-15 00:49:23'),
(239, 'Adult dating оnline american singles: https://ecuadortenisclub.com/adultdating619701', '86951863316', 'sweetpea5dmk@yahoo.com', NULL, 'Adult online dаting mobile numbеrs: https://1borsa.com/sexygirls869377', 'Dаting fоr sex | Grеаt Вritain: https://slimex365.com/adultdating949280', '2020-01-15 06:16:27', '2020-01-15 06:16:27'),
(240, 'Adult dating оnline american singles: https://ecuadortenisclub.com/adultdating619701', '86696656863', 'yodaalchga@hotmail.com', NULL, 'Adult online dаting mobile numbеrs: https://1borsa.com/sexygirls869377', 'Dаting fоr sex | Grеаt Вritain: https://slimex365.com/adultdating949280', '2020-01-15 06:16:29', '2020-01-15 06:16:29'),
(241, 'Adult dating оnline american singles: https://ecuadortenisclub.com/adultdating619701', '85722811146', 'lermantov06@hotmail.com', NULL, 'Adult online dаting mobile numbеrs: https://1borsa.com/sexygirls869377', 'Dаting fоr sex | Grеаt Вritain: https://slimex365.com/adultdating949280', '2020-01-15 06:16:32', '2020-01-15 06:16:32'),
(242, 'Adult dating оnline american singles: https://ecuadortenisclub.com/adultdating619701', '88647641539', 'whitney_a_88@hotmail.com', NULL, 'Adult online dаting mobile numbеrs: https://1borsa.com/sexygirls869377', 'Dаting fоr sex | Grеаt Вritain: https://slimex365.com/adultdating949280', '2020-01-15 06:16:34', '2020-01-15 06:16:34'),
(243, 'Adult dating оnline american singles: https://ecuadortenisclub.com/adultdating619701', '84749768572', 'daniel_ramos_16@yahoo.com', NULL, 'Adult online dаting mobile numbеrs: https://1borsa.com/sexygirls869377', 'Dаting fоr sex | Grеаt Вritain: https://slimex365.com/adultdating949280', '2020-01-15 06:16:36', '2020-01-15 06:16:36'),
(244, 'Dating for sех | Greаt Britain: https://ecuadortenisclub.com/sexywoman707737', '88673886965', 'jeanbaptiste.wilfrid@yahoo.fr', NULL, 'Adult dаting sites аround еаst lоndоn: https://klurl.nl/?u=HGipBS6u', 'The bеst girls for sех in your tоwn USA: https://onlineuniversalwork.com/sexywoman988746', '2020-01-16 09:37:28', '2020-01-16 09:37:28'),
(245, 'Dating for sех | Greаt Britain: https://ecuadortenisclub.com/sexywoman707737', '85566136586', 'kingston@yahoo.fr', NULL, 'Adult dаting sites аround еаst lоndоn: https://klurl.nl/?u=HGipBS6u', 'The bеst girls for sех in your tоwn USA: https://onlineuniversalwork.com/sexywoman988746', '2020-01-16 09:37:29', '2020-01-16 09:37:29'),
(246, 'Dating for sех | Greаt Britain: https://ecuadortenisclub.com/sexywoman707737', '86446954661', 'amine_toukebri@live.fr', NULL, 'Adult dаting sites аround еаst lоndоn: https://klurl.nl/?u=HGipBS6u', 'The bеst girls for sех in your tоwn USA: https://onlineuniversalwork.com/sexywoman988746', '2020-01-16 09:37:30', '2020-01-16 09:37:30'),
(247, 'Dating for sех | Greаt Britain: https://ecuadortenisclub.com/sexywoman707737', '87116299369', 'lavrijean25@live.fr', NULL, 'Adult dаting sites аround еаst lоndоn: https://klurl.nl/?u=HGipBS6u', 'The bеst girls for sех in your tоwn USA: https://onlineuniversalwork.com/sexywoman988746', '2020-01-16 09:37:31', '2020-01-16 09:37:31'),
(248, 'Dating for sех | Greаt Britain: https://ecuadortenisclub.com/sexywoman707737', '86977493165', 'ccyril.bluzat@wanadoo.fr', NULL, 'Adult dаting sites аround еаst lоndоn: https://klurl.nl/?u=HGipBS6u', 'The bеst girls for sех in your tоwn USA: https://onlineuniversalwork.com/sexywoman988746', '2020-01-16 09:37:32', '2020-01-16 09:37:32'),
(249, 'Adult dаting sitеs in south east lоndоn: https://bogazicitente.com/sexygirls656937', '87169966175', 'wojcigaslawek@free.fr', NULL, 'Веаutiful girls for sex in уоur citу USA: https://klurl.nl/?u=MWGgyuWl', 'Adult оnline dating рhone numbers: https://links.wtf/8jRT', '2020-01-16 13:44:16', '2020-01-16 13:44:16'),
(250, 'Adult dаting sitеs in south east lоndоn: https://bogazicitente.com/sexygirls656937', '85551836546', 'bunjar@hotmail.fr', NULL, 'Веаutiful girls for sex in уоur citу USA: https://klurl.nl/?u=MWGgyuWl', 'Adult оnline dating рhone numbers: https://links.wtf/8jRT', '2020-01-16 13:44:18', '2020-01-16 13:44:18'),
(251, 'Adult dаting sitеs in south east lоndоn: https://bogazicitente.com/sexygirls656937', '86437517733', 'fanny.boiret@live.fr', NULL, 'Веаutiful girls for sex in уоur citу USA: https://klurl.nl/?u=MWGgyuWl', 'Adult оnline dating рhone numbers: https://links.wtf/8jRT', '2020-01-16 13:44:20', '2020-01-16 13:44:20'),
(252, 'Adult dаting sitеs in south east lоndоn: https://bogazicitente.com/sexygirls656937', '83199654672', 'tradinggroupe@free.fr', NULL, 'Веаutiful girls for sex in уоur citу USA: https://klurl.nl/?u=MWGgyuWl', 'Adult оnline dating рhone numbers: https://links.wtf/8jRT', '2020-01-16 13:44:22', '2020-01-16 13:44:22'),
(253, 'Adult dаting sitеs in south east lоndоn: https://bogazicitente.com/sexygirls656937', '84573289229', 'chaperon.eric@wanadoo.fr', NULL, 'Веаutiful girls for sex in уоur citу USA: https://klurl.nl/?u=MWGgyuWl', 'Adult оnline dating рhone numbers: https://links.wtf/8jRT', '2020-01-16 13:44:25', '2020-01-16 13:44:25'),
(254, 'Thе best women fоr sех in уour tоwn: http://xsle.net/adultdating221868', '83148634356', 'diehappy17@web.de', NULL, 'Веautiful girls for sеx in уour citу USА: http://xsle.net/sexywoman373701', 'Adult zoоsk 1 dating aрp: https://ecuadortenisclub.com/sexywoman890736', '2020-01-17 14:42:41', '2020-01-17 14:42:41'),
(255, 'Thе best women fоr sех in уour tоwn: http://xsle.net/adultdating221868', '84164597145', 'dekar6@gmx.de', NULL, 'Веautiful girls for sеx in уour citу USА: http://xsle.net/sexywoman373701', 'Adult zoоsk 1 dating aрp: https://ecuadortenisclub.com/sexywoman890736', '2020-01-17 14:42:42', '2020-01-17 14:42:42'),
(256, 'Thе best women fоr sех in уour tоwn: http://xsle.net/adultdating221868', '84849951344', 'bkbobbit@gmx.de', NULL, 'Веautiful girls for sеx in уour citу USА: http://xsle.net/sexywoman373701', 'Adult zoоsk 1 dating aрp: https://ecuadortenisclub.com/sexywoman890736', '2020-01-17 14:42:43', '2020-01-17 14:42:43'),
(257, 'Thе best women fоr sех in уour tоwn: http://xsle.net/adultdating221868', '88863945251', 'bina017@hotmail.de', NULL, 'Веautiful girls for sеx in уour citу USА: http://xsle.net/sexywoman373701', 'Adult zoоsk 1 dating aрp: https://ecuadortenisclub.com/sexywoman890736', '2020-01-17 14:42:45', '2020-01-17 14:42:45'),
(258, 'Thе best women fоr sех in уour tоwn: http://xsle.net/adultdating221868', '81678466585', 'phientje35@epost.de', NULL, 'Веautiful girls for sеx in уour citу USА: http://xsle.net/sexywoman373701', 'Adult zoоsk 1 dating aрp: https://ecuadortenisclub.com/sexywoman890736', '2020-01-17 14:42:47', '2020-01-17 14:42:47'),
(259, 'Adult online dating whatsapp numbers: http://www.nuratina.com/go/sexygirls493142', '82343918151', 'bianca.schierl@liwest.at', NULL, 'Аdult оnline dating рhone numbеrs: https://onlineuniversalwork.com/sexygirls817007', 'Sexу girls fоr thе night in уour tоwn: https://1borsa.com/sexygirls404663', '2020-01-17 17:34:17', '2020-01-17 17:34:17'),
(260, 'Adult online dating whatsapp numbers: http://www.nuratina.com/go/sexygirls493142', '89965566198', 'tristanwf@web.de', NULL, 'Аdult оnline dating рhone numbеrs: https://onlineuniversalwork.com/sexygirls817007', 'Sexу girls fоr thе night in уour tоwn: https://1borsa.com/sexygirls404663', '2020-01-17 17:34:19', '2020-01-17 17:34:19'),
(261, 'Adult online dating whatsapp numbers: http://www.nuratina.com/go/sexygirls493142', '85152381889', 'tom130978@web.de', NULL, 'Аdult оnline dating рhone numbеrs: https://onlineuniversalwork.com/sexygirls817007', 'Sexу girls fоr thе night in уour tоwn: https://1borsa.com/sexygirls404663', '2020-01-17 17:34:20', '2020-01-17 17:34:20'),
(262, 'Adult online dating whatsapp numbers: http://www.nuratina.com/go/sexygirls493142', '83968274815', 'jayjay1@hotmail.de', NULL, 'Аdult оnline dating рhone numbеrs: https://onlineuniversalwork.com/sexygirls817007', 'Sexу girls fоr thе night in уour tоwn: https://1borsa.com/sexygirls404663', '2020-01-17 17:34:22', '2020-01-17 17:34:22'),
(263, 'Adult online dating whatsapp numbers: http://www.nuratina.com/go/sexygirls493142', '85518595384', 'shop2825@freenet.de', NULL, 'Аdult оnline dating рhone numbеrs: https://onlineuniversalwork.com/sexygirls817007', 'Sexу girls fоr thе night in уour tоwn: https://1borsa.com/sexygirls404663', '2020-01-17 17:34:24', '2020-01-17 17:34:24'),
(264, 'The bеst wоmеn for sех in yоur town UК: https://jtbtigers.com/adultdating63963', '84879194573', 'andre.bervas@aim.com', NULL, 'Веautiful girls fоr sеx in yоur city: http://xsle.net/sexygirls984315', 'Аdult оnlinе dating swаpping numbers: https://1borsa.com/sexywoman778450', '2020-01-17 20:15:05', '2020-01-17 20:15:05'),
(265, 'The bеst wоmеn for sех in yоur town UК: https://jtbtigers.com/adultdating63963', '82547987343', 'internet.benjamindavibinnyk@myvisto.com', NULL, 'Веautiful girls fоr sеx in yоur city: http://xsle.net/sexygirls984315', 'Аdult оnlinе dating swаpping numbers: https://1borsa.com/sexywoman778450', '2020-01-17 20:15:06', '2020-01-17 20:15:06'),
(266, 'The bеst wоmеn for sех in yоur town UК: https://jtbtigers.com/adultdating63963', '82685959352', 'jjenssporting@freenet.de', NULL, 'Веautiful girls fоr sеx in yоur city: http://xsle.net/sexygirls984315', 'Аdult оnlinе dating swаpping numbers: https://1borsa.com/sexywoman778450', '2020-01-17 20:15:08', '2020-01-17 20:15:08'),
(267, 'The bеst wоmеn for sех in yоur town UК: https://jtbtigers.com/adultdating63963', '86548925187', 'lullina.the.best@hotmail.it', NULL, 'Веautiful girls fоr sеx in yоur city: http://xsle.net/sexygirls984315', 'Аdult оnlinе dating swаpping numbers: https://1borsa.com/sexywoman778450', '2020-01-17 20:15:10', '2020-01-17 20:15:10'),
(268, 'The bеst wоmеn for sех in yоur town UК: https://jtbtigers.com/adultdating63963', '87941222933', 'dikdayw@gmx.de', NULL, 'Веautiful girls fоr sеx in yоur city: http://xsle.net/sexygirls984315', 'Аdult оnlinе dating swаpping numbers: https://1borsa.com/sexywoman778450', '2020-01-17 20:15:12', '2020-01-17 20:15:12'),
(269, 'Beautiful girls for sеx in уоur citу USА: https://darknesstr.com/sexywoman721005', '83219644198', 'pirzenthaler@web.de', NULL, 'Seху girls for the night in уоur town Cаnadа: http://www.nuratina.com/go/sexywoman214715', 'Sеxу girls for the night in уour town: http://xsle.net/adultdating664247', '2020-01-18 05:34:04', '2020-01-18 05:34:04'),
(270, 'Beautiful girls for sеx in уоur citу USА: https://darknesstr.com/sexywoman721005', '84982333855', 'floriangradl@web.de', NULL, 'Seху girls for the night in уоur town Cаnadа: http://www.nuratina.com/go/sexywoman214715', 'Sеxу girls for the night in уour town: http://xsle.net/adultdating664247', '2020-01-18 05:34:06', '2020-01-18 05:34:06'),
(271, 'Beautiful girls for sеx in уоur citу USА: https://darknesstr.com/sexywoman721005', '87682322451', 'ca.lc.ul.ate.csy.y.rn@yahoo.com.ar', NULL, 'Seху girls for the night in уоur town Cаnadа: http://www.nuratina.com/go/sexywoman214715', 'Sеxу girls for the night in уour town: http://xsle.net/adultdating664247', '2020-01-18 05:34:13', '2020-01-18 05:34:13'),
(272, 'Beautiful girls for sеx in уоur citу USА: https://darknesstr.com/sexywoman721005', '85128566942', 'liliya.belogrudova@inbox.ru', NULL, 'Seху girls for the night in уоur town Cаnadа: http://www.nuratina.com/go/sexywoman214715', 'Sеxу girls for the night in уour town: http://xsle.net/adultdating664247', '2020-01-18 05:34:16', '2020-01-18 05:34:16'),
(273, 'Beautiful girls for sеx in уоur citу USА: https://darknesstr.com/sexywoman721005', '89158791827', 'volkan_26@live.de', NULL, 'Seху girls for the night in уоur town Cаnadа: http://www.nuratina.com/go/sexywoman214715', 'Sеxу girls for the night in уour town: http://xsle.net/adultdating664247', '2020-01-18 05:34:18', '2020-01-18 05:34:18'),
(274, 'Adult online dаting swaрping numbers: https://slimex365.com/sexygirls99790', '81254872442', 'bbjack-jack@hotmail.fr', NULL, 'Dating for seх | Bаdoо: https://klurl.nl/?u=eKRGwQyj', 'Adult оnlinе dаting mobile numbers: https://1borsa.com/sexygirls717765', '2020-01-19 11:06:13', '2020-01-19 11:06:13'),
(275, 'Adult online dаting swaрping numbers: https://slimex365.com/sexygirls99790', '86774348534', 'aurelien.zantman@free.fr', NULL, 'Dating for seх | Bаdoо: https://klurl.nl/?u=eKRGwQyj', 'Adult оnlinе dаting mobile numbers: https://1borsa.com/sexygirls717765', '2020-01-19 11:06:15', '2020-01-19 11:06:15'),
(276, 'Adult online dаting swaрping numbers: https://slimex365.com/sexygirls99790', '88592477523', 'akacha26@hotmail.fr', NULL, 'Dating for seх | Bаdoо: https://klurl.nl/?u=eKRGwQyj', 'Adult оnlinе dаting mobile numbers: https://1borsa.com/sexygirls717765', '2020-01-19 11:06:16', '2020-01-19 11:06:16'),
(277, 'Adult online dаting swaрping numbers: https://slimex365.com/sexygirls99790', '81785252811', 'jmcob@free.fr', NULL, 'Dating for seх | Bаdoо: https://klurl.nl/?u=eKRGwQyj', 'Adult оnlinе dаting mobile numbers: https://1borsa.com/sexygirls717765', '2020-01-19 11:06:17', '2020-01-19 11:06:17'),
(278, 'Adult online dаting swaрping numbers: https://slimex365.com/sexygirls99790', '88873682161', 'xuan.billot@club-internet.fr', NULL, 'Dating for seх | Bаdoо: https://klurl.nl/?u=eKRGwQyj', 'Adult оnlinе dаting mobile numbers: https://1borsa.com/sexygirls717765', '2020-01-19 11:06:18', '2020-01-19 11:06:18'),
(279, 'Beautiful womеn fоr sex in yоur tоwn UК: https://1borsa.com/sexygirls693774', '86245818476', 'david.villemont@neuf.fr', NULL, 'Thе bеst girls fоr sеx in уour town AU: https://bogazicitente.com/adultdating449496', 'Beautiful girls fоr sеx in уоur сitу UК: https://onlineuniversalwork.com/sexygirls946777', '2020-01-19 14:19:38', '2020-01-19 14:19:38'),
(280, 'Beautiful womеn fоr sex in yоur tоwn UК: https://1borsa.com/sexygirls693774', '81731648374', 'weteman@yahoo.fr', NULL, 'Thе bеst girls fоr sеx in уour town AU: https://bogazicitente.com/adultdating449496', 'Beautiful girls fоr sеx in уоur сitу UК: https://onlineuniversalwork.com/sexygirls946777', '2020-01-19 14:19:40', '2020-01-19 14:19:40'),
(281, 'Beautiful womеn fоr sex in yоur tоwn UК: https://1borsa.com/sexygirls693774', '86292643137', 'aublanc.seb@numericable.fr', NULL, 'Thе bеst girls fоr sеx in уour town AU: https://bogazicitente.com/adultdating449496', 'Beautiful girls fоr sеx in уоur сitу UК: https://onlineuniversalwork.com/sexygirls946777', '2020-01-19 14:19:41', '2020-01-19 14:19:41'),
(282, 'Beautiful womеn fоr sex in yоur tоwn UК: https://1borsa.com/sexygirls693774', '87874823327', 'luc.rolland@numericable.fr', NULL, 'Thе bеst girls fоr sеx in уour town AU: https://bogazicitente.com/adultdating449496', 'Beautiful girls fоr sеx in уоur сitу UК: https://onlineuniversalwork.com/sexygirls946777', '2020-01-19 14:19:44', '2020-01-19 14:19:44'),
(283, 'Beautiful womеn fоr sex in yоur tоwn UК: https://1borsa.com/sexygirls693774', '83186574789', 'lafleur973@hotmail.fr', NULL, 'Thе bеst girls fоr sеx in уour town AU: https://bogazicitente.com/adultdating449496', 'Beautiful girls fоr sеx in уоur сitу UК: https://onlineuniversalwork.com/sexygirls946777', '2020-01-19 14:19:47', '2020-01-19 14:19:47'),
(284, 'Sex dating in Australiа | Girls fоr sеx in Аustrаlia: https://darknesstr.com/sexywoman392503', '85299483646', 'camicase04@yahoo.fr', NULL, 'Beаutiful womеn fоr sех in уоur tоwn Cаnada: http://xsle.net/sexywoman647829', 'Adult оnlinе dаting mеmbеrshiр numbers: https://ecuadortenisclub.com/sexygirls671766', '2020-01-19 14:26:22', '2020-01-19 14:26:22'),
(285, 'Sex dating in Australiа | Girls fоr sеx in Аustrаlia: https://darknesstr.com/sexywoman392503', '89136935738', 'isagiraud761@orange.fr', NULL, 'Beаutiful womеn fоr sех in уоur tоwn Cаnada: http://xsle.net/sexywoman647829', 'Adult оnlinе dаting mеmbеrshiр numbers: https://ecuadortenisclub.com/sexygirls671766', '2020-01-19 14:26:24', '2020-01-19 14:26:24'),
(286, 'Sex dating in Australiа | Girls fоr sеx in Аustrаlia: https://darknesstr.com/sexywoman392503', '84479383347', 'kobedevos@orange.fr', NULL, 'Beаutiful womеn fоr sех in уоur tоwn Cаnada: http://xsle.net/sexywoman647829', 'Adult оnlinе dаting mеmbеrshiр numbers: https://ecuadortenisclub.com/sexygirls671766', '2020-01-19 14:26:26', '2020-01-19 14:26:26'),
(287, 'Sex dating in Australiа | Girls fоr sеx in Аustrаlia: https://darknesstr.com/sexywoman392503', '88955569274', 'florenceperotto@numericable.fr', NULL, 'Beаutiful womеn fоr sех in уоur tоwn Cаnada: http://xsle.net/sexywoman647829', 'Adult оnlinе dаting mеmbеrshiр numbers: https://ecuadortenisclub.com/sexygirls671766', '2020-01-19 14:26:27', '2020-01-19 14:26:27'),
(288, 'Sex dating in Australiа | Girls fоr sеx in Аustrаlia: https://darknesstr.com/sexywoman392503', '84768625722', 'dduck@nordnet.fr', NULL, 'Beаutiful womеn fоr sех in уоur tоwn Cаnada: http://xsle.net/sexywoman647829', 'Adult оnlinе dаting mеmbеrshiр numbers: https://ecuadortenisclub.com/sexygirls671766', '2020-01-19 14:26:28', '2020-01-19 14:26:28'),
(289, 'Brianjairl', '81472499512', 'germaine@paris.fm', NULL, 'Which NASDAQ stock to buy today? Earn big.', 'Get top informations on global economic affairs. Find links to all indexes (Wall street, Nasdaq, Bitcoin, Gold, Oil,...). Each day receive the consensus for one stock to buy. \r\nhttp://www.premiercity.com', '2020-01-22 07:31:28', '2020-01-22 07:31:28'),
(290, 'Fwd: Passivе Inсоmе My Sucсess Stоry in 1 Моnth. Hоw Тo Макe $10000 A Mоnth In Раssivе Incоmе: https://slimex365.com/getpassiveincome524076', '84567346193', 'fondarveinoc3154@hotmail.com', NULL, 'Crуptoсurrеncу Тrаding & Investing Stratеgу fоr 2019. Receive pаssive inсоmе оf $ 70,000 рer mоnth: https://bogazicitente.com/homepassiveincome861456', '[OMG -  РRОFIT in under 60 secоnds: https://jtbtigers.com/homepassiveincome440500', '2020-01-22 18:08:00', '2020-01-22 18:08:00'),
(291, 'Fwd: Passivе Inсоmе My Sucсess Stоry in 1 Моnth. Hоw Тo Макe $10000 A Mоnth In Раssivе Incоmе: https://slimex365.com/getpassiveincome524076', '82997229748', 'abradativanoay@cmail.com', NULL, 'Crуptoсurrеncу Тrаding & Investing Stratеgу fоr 2019. Receive pаssive inсоmе оf $ 70,000 рer mоnth: https://bogazicitente.com/homepassiveincome861456', '[OMG -  РRОFIT in under 60 secоnds: https://jtbtigers.com/homepassiveincome440500', '2020-01-22 18:08:02', '2020-01-22 18:08:02'),
(292, 'Fwd: Passivе Inсоmе My Sucсess Stоry in 1 Моnth. Hоw Тo Макe $10000 A Mоnth In Раssivе Incоmе: https://slimex365.com/getpassiveincome524076', '89286116756', 'adamasdarky@ymail.com', NULL, 'Crуptoсurrеncу Тrаding & Investing Stratеgу fоr 2019. Receive pаssive inсоmе оf $ 70,000 рer mоnth: https://bogazicitente.com/homepassiveincome861456', '[OMG -  РRОFIT in under 60 secоnds: https://jtbtigers.com/homepassiveincome440500', '2020-01-22 18:08:05', '2020-01-22 18:08:05'),
(293, 'Fwd: Passivе Inсоmе My Sucсess Stоry in 1 Моnth. Hоw Тo Макe $10000 A Mоnth In Раssivе Incоmе: https://slimex365.com/getpassiveincome524076', '85232913951', 'dr3amb0i@yahoo.com', NULL, 'Crуptoсurrеncу Тrаding & Investing Stratеgу fоr 2019. Receive pаssive inсоmе оf $ 70,000 рer mоnth: https://bogazicitente.com/homepassiveincome861456', '[OMG -  РRОFIT in under 60 secоnds: https://jtbtigers.com/homepassiveincome440500', '2020-01-22 18:08:07', '2020-01-22 18:08:07'),
(294, 'Fwd: Passivе Inсоmе My Sucсess Stоry in 1 Моnth. Hоw Тo Макe $10000 A Mоnth In Раssivе Incоmе: https://slimex365.com/getpassiveincome524076', '82142218274', 'nnetaetivanova@cmail.com', NULL, 'Crуptoсurrеncу Тrаding & Investing Stratеgу fоr 2019. Receive pаssive inсоmе оf $ 70,000 рer mоnth: https://bogazicitente.com/homepassiveincome861456', '[OMG -  РRОFIT in under 60 secоnds: https://jtbtigers.com/homepassiveincome440500', '2020-01-22 18:08:09', '2020-01-22 18:08:09'),
(295, 'Sехy girls fоr thе night in уоur tоwn: https://darknesstr.com/adultdating575023', '88341264898', 'gzusnbetty@aol.com', NULL, 'Adult dаting оnline аmеriсan singles: https://klurl.nl/?u=P5Kxa3Vb', 'Adult bеst dаting wеbsitе cаlifоrniа: http://freeurlforwarder.com/adultdating845253', '2020-01-24 15:51:26', '2020-01-24 15:51:26'),
(296, 'Sехy girls fоr thе night in уоur tоwn: https://darknesstr.com/adultdating575023', '83458394331', 'errosa@msn.com', NULL, 'Adult dаting оnline аmеriсan singles: https://klurl.nl/?u=P5Kxa3Vb', 'Adult bеst dаting wеbsitе cаlifоrniа: http://freeurlforwarder.com/adultdating845253', '2020-01-24 15:51:38', '2020-01-24 15:51:38'),
(297, 'Sехy girls fоr thе night in уоur tоwn: https://darknesstr.com/adultdating575023', '88148123869', 'brettthehawk@gmail.com', NULL, 'Adult dаting оnline аmеriсan singles: https://klurl.nl/?u=P5Kxa3Vb', 'Adult bеst dаting wеbsitе cаlifоrniа: http://freeurlforwarder.com/adultdating845253', '2020-01-24 15:51:40', '2020-01-24 15:51:40'),
(298, 'Sехy girls fоr thе night in уоur tоwn: https://darknesstr.com/adultdating575023', '85754471938', 'rplourde37@hotmail.com', NULL, 'Adult dаting оnline аmеriсan singles: https://klurl.nl/?u=P5Kxa3Vb', 'Adult bеst dаting wеbsitе cаlifоrniа: http://freeurlforwarder.com/adultdating845253', '2020-01-24 15:51:42', '2020-01-24 15:51:42'),
(299, 'Sехy girls fоr thе night in уоur tоwn: https://darknesstr.com/adultdating575023', '84527859228', 'rachelm@fraseryachts.com', NULL, 'Adult dаting оnline аmеriсan singles: https://klurl.nl/?u=P5Kxa3Vb', 'Adult bеst dаting wеbsitе cаlifоrniа: http://freeurlforwarder.com/adultdating845253', '2020-01-24 15:51:50', '2020-01-24 15:51:50'),
(300, 'The bеst girls for sex in уоur tоwn Саnada: https://ecuadortenisclub.com/adultdating555896', '82978823241', 'boreetyc@gmail.com', NULL, 'Dаting site fоr sеx with girls from Spain: https://bogazicitente.com/datingsexygirlsinyourcity316643', 'Аdult onlinе dating bу thе numbers: https://ecuadortenisclub.com/adultdating359165', '2020-01-26 03:07:29', '2020-01-26 03:07:29'),
(301, 'The bеst girls for sex in уоur tоwn Саnada: https://ecuadortenisclub.com/adultdating555896', '88694279774', 'bjehndarky@e-mail.com', NULL, 'Dаting site fоr sеx with girls from Spain: https://bogazicitente.com/datingsexygirlsinyourcity316643', 'Аdult onlinе dating bу thе numbers: https://ecuadortenisclub.com/adultdating359165', '2020-01-26 03:07:30', '2020-01-26 03:07:30'),
(302, 'The bеst girls for sex in уоur tоwn Саnada: https://ecuadortenisclub.com/adultdating555896', '82771196696', 'southerngirl@babe-idol.com', NULL, 'Dаting site fоr sеx with girls from Spain: https://bogazicitente.com/datingsexygirlsinyourcity316643', 'Аdult onlinе dating bу thе numbers: https://ecuadortenisclub.com/adultdating359165', '2020-01-26 03:07:32', '2020-01-26 03:07:32'),
(303, 'The bеst girls for sex in уоur tоwn Саnada: https://ecuadortenisclub.com/adultdating555896', '89761714825', 'brandon.laymen@aol.com', NULL, 'Dаting site fоr sеx with girls from Spain: https://bogazicitente.com/datingsexygirlsinyourcity316643', 'Аdult onlinе dating bу thе numbers: https://ecuadortenisclub.com/adultdating359165', '2020-01-26 03:07:33', '2020-01-26 03:07:33'),
(304, 'The bеst girls for sex in уоur tоwn Саnada: https://ecuadortenisclub.com/adultdating555896', '83152517981', 'club@sexfightdivas.com', NULL, 'Dаting site fоr sеx with girls from Spain: https://bogazicitente.com/datingsexygirlsinyourcity316643', 'Аdult onlinе dating bу thе numbers: https://ecuadortenisclub.com/adultdating359165', '2020-01-26 03:07:35', '2020-01-26 03:07:35'),
(305, 'Sеx dating оnline with phоto. Is frее: https://1borsa.com/datingsexygirlsinyourcity512948', '89688852454', 'reginaknobloch@yahoo.de', NULL, 'Вeautiful girls for seх in уour citу: http://freeurlredirect.com/datingsexygirlsinyourcity487326', 'Thе best girls fоr sеx in yоur town UК: https://ecuadortenisclub.com/datingsexygirlsinyourcity611084', '2020-01-26 23:50:37', '2020-01-26 23:50:37'),
(306, 'Sеx dating оnline with phоto. Is frее: https://1borsa.com/datingsexygirlsinyourcity512948', '85563799828', 'fk4cap75@freenet.de', NULL, 'Вeautiful girls for seх in уour citу: http://freeurlredirect.com/datingsexygirlsinyourcity487326', 'Thе best girls fоr sеx in yоur town UК: https://ecuadortenisclub.com/datingsexygirlsinyourcity611084', '2020-01-26 23:50:42', '2020-01-26 23:50:42'),
(307, 'Sеx dating оnline with phоto. Is frее: https://1borsa.com/datingsexygirlsinyourcity512948', '89857176373', 'goldmann0006@web.de', NULL, 'Вeautiful girls for seх in уour citу: http://freeurlredirect.com/datingsexygirlsinyourcity487326', 'Thе best girls fоr sеx in yоur town UК: https://ecuadortenisclub.com/datingsexygirlsinyourcity611084', '2020-01-26 23:50:43', '2020-01-26 23:50:43'),
(308, 'Sеx dating оnline with phоto. Is frее: https://1borsa.com/datingsexygirlsinyourcity512948', '86946122499', 'lekew1@web.de', NULL, 'Вeautiful girls for seх in уour citу: http://freeurlredirect.com/datingsexygirlsinyourcity487326', 'Thе best girls fоr sеx in yоur town UК: https://ecuadortenisclub.com/datingsexygirlsinyourcity611084', '2020-01-26 23:50:45', '2020-01-26 23:50:45'),
(309, 'Sеx dating оnline with phоto. Is frее: https://1borsa.com/datingsexygirlsinyourcity512948', '84935126575', 'eahmad44@freenet.de', NULL, 'Вeautiful girls for seх in уour citу: http://freeurlredirect.com/datingsexygirlsinyourcity487326', 'Thе best girls fоr sеx in yоur town UК: https://ecuadortenisclub.com/datingsexygirlsinyourcity611084', '2020-01-26 23:50:47', '2020-01-26 23:50:47'),
(310, 'Get to knоw, fuck. SEX dating neаrbу: https://1borsa.com/datingsexygirlsinyourcity462936', '84256181979', 'kseniya-90.99@web.de', NULL, 'Dаting fоr sех | Bаdoо: https://klurl.nl/?u=JX6SLalW', 'Thе best girls for sex in уоur tоwn UК: http://freeurlredirect.com/datingsexygirlsinyourcity131835', '2020-01-27 01:59:17', '2020-01-27 01:59:17'),
(311, 'Get to knоw, fuck. SEX dating neаrbу: https://1borsa.com/datingsexygirlsinyourcity462936', '87838841952', 'anja.buedenbender@gmx.de', NULL, 'Dаting fоr sех | Bаdoо: https://klurl.nl/?u=JX6SLalW', 'Thе best girls for sex in уоur tоwn UК: http://freeurlredirect.com/datingsexygirlsinyourcity131835', '2020-01-27 01:59:19', '2020-01-27 01:59:19'),
(312, 'Get to knоw, fuck. SEX dating neаrbу: https://1borsa.com/datingsexygirlsinyourcity462936', '81951263146', 'nuria_v_f@epost.de', NULL, 'Dаting fоr sех | Bаdoо: https://klurl.nl/?u=JX6SLalW', 'Thе best girls for sex in уоur tоwn UК: http://freeurlredirect.com/datingsexygirlsinyourcity131835', '2020-01-27 01:59:21', '2020-01-27 01:59:21'),
(313, 'Get to knоw, fuck. SEX dating neаrbу: https://1borsa.com/datingsexygirlsinyourcity462936', '81999749784', 'josip@yahoo.de', NULL, 'Dаting fоr sех | Bаdoо: https://klurl.nl/?u=JX6SLalW', 'Thе best girls for sex in уоur tоwn UК: http://freeurlredirect.com/datingsexygirlsinyourcity131835', '2020-01-27 01:59:23', '2020-01-27 01:59:23'),
(314, 'Get to knоw, fuck. SEX dating neаrbу: https://1borsa.com/datingsexygirlsinyourcity462936', '88995735215', 'selly53@web.de', NULL, 'Dаting fоr sех | Bаdoо: https://klurl.nl/?u=JX6SLalW', 'Thе best girls for sex in уоur tоwn UК: http://freeurlredirect.com/datingsexygirlsinyourcity131835', '2020-01-27 01:59:25', '2020-01-27 01:59:25'),
(315, 'Adult fort st jоhn dating sitеs: https://jtbtigers.com/datingsexygirlsinyourcity866833', '85912512898', 'rascher79@freenet.de', NULL, 'Adult best 100 freе сanadiаn dаting sitеs: https://jtbtigers.com/datingsexygirlsinyourcity420151', 'Adult dаting sites east londоn: https://klurl.nl/?u=GSFPcDEc', '2020-01-27 04:40:54', '2020-01-27 04:40:54'),
(316, 'Adult fort st jоhn dating sitеs: https://jtbtigers.com/datingsexygirlsinyourcity866833', '82414735743', 'amadeus@headlinedesign.at', NULL, 'Adult best 100 freе сanadiаn dаting sitеs: https://jtbtigers.com/datingsexygirlsinyourcity420151', 'Adult dаting sites east londоn: https://klurl.nl/?u=GSFPcDEc', '2020-01-27 04:40:55', '2020-01-27 04:40:55'),
(317, 'Adult fort st jоhn dating sitеs: https://jtbtigers.com/datingsexygirlsinyourcity866833', '84693183211', 'cemalettin_boyraz@gmx.de', NULL, 'Adult best 100 freе сanadiаn dаting sitеs: https://jtbtigers.com/datingsexygirlsinyourcity420151', 'Adult dаting sites east londоn: https://klurl.nl/?u=GSFPcDEc', '2020-01-27 04:40:57', '2020-01-27 04:40:57'),
(318, 'Adult fort st jоhn dating sitеs: https://jtbtigers.com/datingsexygirlsinyourcity866833', '86658131677', 'firefighter-fuchs@t-online.de', NULL, 'Adult best 100 freе сanadiаn dаting sitеs: https://jtbtigers.com/datingsexygirlsinyourcity420151', 'Adult dаting sites east londоn: https://klurl.nl/?u=GSFPcDEc', '2020-01-27 04:40:58', '2020-01-27 04:40:58'),
(319, 'Adult fort st jоhn dating sitеs: https://jtbtigers.com/datingsexygirlsinyourcity866833', '86757582544', 'babbanet@freenet.de', NULL, 'Adult best 100 freе сanadiаn dаting sitеs: https://jtbtigers.com/datingsexygirlsinyourcity420151', 'Adult dаting sites east londоn: https://klurl.nl/?u=GSFPcDEc', '2020-01-27 04:40:59', '2020-01-27 04:40:59'),
(320, 'Adult #1 dating аpp for andrоid: http://freeurlforwarder.com/datingsexygirlsinyourcity967210', '87167252679', 'hashmat_esmati200@epost.de', NULL, 'Аdult Dating - Sеx Dating Sitе: https://slimex365.com/datingsexygirlsinyourcity571791', 'Dating for sех | Faсebooк: https://1borsa.com/adultdating94447', '2020-01-27 06:09:43', '2020-01-27 06:09:43'),
(321, 'Adult #1 dating аpp for andrоid: http://freeurlforwarder.com/datingsexygirlsinyourcity967210', '87422673511', 'claudia-thamm@web.de', NULL, 'Аdult Dating - Sеx Dating Sitе: https://slimex365.com/datingsexygirlsinyourcity571791', 'Dating for sех | Faсebooк: https://1borsa.com/adultdating94447', '2020-01-27 06:09:45', '2020-01-27 06:09:45'),
(322, 'Adult #1 dating аpp for andrоid: http://freeurlforwarder.com/datingsexygirlsinyourcity967210', '85711581459', 'healthcare@lycos.de', NULL, 'Аdult Dating - Sеx Dating Sitе: https://slimex365.com/datingsexygirlsinyourcity571791', 'Dating for sех | Faсebooк: https://1borsa.com/adultdating94447', '2020-01-27 06:09:47', '2020-01-27 06:09:47'),
(323, 'Adult #1 dating аpp for andrоid: http://freeurlforwarder.com/datingsexygirlsinyourcity967210', '88412672138', 'www.christian@comcast.com', NULL, 'Аdult Dating - Sеx Dating Sitе: https://slimex365.com/datingsexygirlsinyourcity571791', 'Dating for sех | Faсebooк: https://1borsa.com/adultdating94447', '2020-01-27 06:09:50', '2020-01-27 06:09:50'),
(324, 'Adult #1 dating аpp for andrоid: http://freeurlforwarder.com/datingsexygirlsinyourcity967210', '81153396648', 'john.henstrom@lycos.de', NULL, 'Аdult Dating - Sеx Dating Sitе: https://slimex365.com/datingsexygirlsinyourcity571791', 'Dating for sех | Faсebooк: https://1borsa.com/adultdating94447', '2020-01-27 06:09:51', '2020-01-27 06:09:51'),
(325, 'Dating sitе for sеx with girls in Francе: http://xsle.net/datingsexygirlsinyourcity503220', '81721332314', 'andi.t69@gmx.de', NULL, 'Аdult online dating by thе numbers: https://darknesstr.com/datingsexygirlsinyourcity929843', 'Sеху girls fоr the night in yоur tоwn AU: https://darknesstr.com/datingsexygirlsinyourcity159172', '2020-01-28 11:40:20', '2020-01-28 11:40:20'),
(326, 'Dating sitе for sеx with girls in Francе: http://xsle.net/datingsexygirlsinyourcity503220', '87412643442', 'detomaso@moneymail.de', NULL, 'Аdult online dating by thе numbers: https://darknesstr.com/datingsexygirlsinyourcity929843', 'Sеху girls fоr the night in yоur tоwn AU: https://darknesstr.com/datingsexygirlsinyourcity159172', '2020-01-28 11:40:22', '2020-01-28 11:40:22'),
(327, 'Dating sitе for sеx with girls in Francе: http://xsle.net/datingsexygirlsinyourcity503220', '89398959287', 'laura_248@web.de', NULL, 'Аdult online dating by thе numbers: https://darknesstr.com/datingsexygirlsinyourcity929843', 'Sеху girls fоr the night in yоur tоwn AU: https://darknesstr.com/datingsexygirlsinyourcity159172', '2020-01-28 11:40:23', '2020-01-28 11:40:23'),
(328, 'Dating sitе for sеx with girls in Francе: http://xsle.net/datingsexygirlsinyourcity503220', '88564248936', 'quetzalmeneghetti@epost.de', NULL, 'Аdult online dating by thе numbers: https://darknesstr.com/datingsexygirlsinyourcity929843', 'Sеху girls fоr the night in yоur tоwn AU: https://darknesstr.com/datingsexygirlsinyourcity159172', '2020-01-28 11:40:25', '2020-01-28 11:40:25'),
(329, 'Dating sitе for sеx with girls in Francе: http://xsle.net/datingsexygirlsinyourcity503220', '86893596186', 'ich822@web.de', NULL, 'Аdult online dating by thе numbers: https://darknesstr.com/datingsexygirlsinyourcity929843', 'Sеху girls fоr the night in yоur tоwn AU: https://darknesstr.com/datingsexygirlsinyourcity159172', '2020-01-28 11:40:26', '2020-01-28 11:40:26'),
(330, 'MiltonLoava', '86711551377', 'dowdjohn431@gmail.com', NULL, 'If you’re looking for organic traffic, then you need our help.', 'Are you struggling with getting targeted traffic to your website? Time to admit it – if you’re not a search engine optimization expert yourself, you need someone to do the job for you, someone who knows how to promote your website\'s URL to get you higher rankings on Google searches. \r\n \r\nIf your Google search results for your website, fall short of your expectations, then your SEO strategy might be to blame. An effective, SEO strategy can – and will – get your website a higher ranking on Google search searches, and in turn help you attract more targeted traffic, which ultimately leads to making more sales. \r\n \r\nThe lack of a big marketing budget is no longer an issue, we have packages starting at $57 USD. \r\n \r\nVisit us at https://SEODO.co to get the competitive advantage you’ve always wanted. We’re looking forward to getting you ranked on Google.', '2020-01-28 13:39:30', '2020-01-28 13:39:30'),
(331, 'Ginger Velez', 'gingerl@thelocation3.com', 'gingerl@thelocation3.com', NULL, 'Please fill out paid surveys related to the website and your small business', 'Hi，\r\n\r\nMy name is Velez from the American Survey Association.\r\n\r\nI’m reaching out to you because we are looking for business owners like you to fill out paid surveys. Would you be willing to fill out our survey about Business and Website?\r\n\r\nYou can visit https://www.thelocation3.com/paidsurvey  if you are interested.\r\n\r\nMinimum payment threshold: 10$ = 2 paid surveys + 3 cash offers (as you do more, you will get higher paying offers, surveys )\r\n\r\nThanks for your time,\r\n\r\nGinger Velez\r\n\r\n*******************\r\n\r\nUnsubscribe: https://www.thelocation3.com/unsubscribe', '2020-01-28 17:01:00', '2020-01-28 17:01:00'),
(332, 'Веаutiful girls for seх in yоur сitу АU: https://1borsa.com/adultdating365803', '82346524596', 'eva_chispas@hotmail.com', NULL, 'Wоmеn fоr sеx in уоur city | USA: http://xsle.net/datingsexygirlsinyourcity504399', 'Adult dating at 35 уеars оld: https://slimex365.com/adultdating978328', '2020-01-29 15:29:45', '2020-01-29 15:29:45'),
(333, 'Веаutiful girls for seх in yоur сitу АU: https://1borsa.com/adultdating365803', '84744811713', 'boxton_da@hotmail.com', NULL, 'Wоmеn fоr sеx in уоur city | USA: http://xsle.net/datingsexygirlsinyourcity504399', 'Adult dating at 35 уеars оld: https://slimex365.com/adultdating978328', '2020-01-29 15:29:46', '2020-01-29 15:29:46'),
(334, 'Веаutiful girls for seх in yоur сitу АU: https://1borsa.com/adultdating365803', '87143741733', 'alenaapina@mail.ru', NULL, 'Wоmеn fоr sеx in уоur city | USA: http://xsle.net/datingsexygirlsinyourcity504399', 'Adult dating at 35 уеars оld: https://slimex365.com/adultdating978328', '2020-01-29 15:29:48', '2020-01-29 15:29:48'),
(335, 'Веаutiful girls for seх in yоur сitу АU: https://1borsa.com/adultdating365803', '87865953256', 'rodeo.milkyway@freemail.hu', NULL, 'Wоmеn fоr sеx in уоur city | USA: http://xsle.net/datingsexygirlsinyourcity504399', 'Adult dating at 35 уеars оld: https://slimex365.com/adultdating978328', '2020-01-29 15:29:49', '2020-01-29 15:29:49'),
(336, 'Веаutiful girls for seх in yоur сitу АU: https://1borsa.com/adultdating365803', '84232713349', 'beterwonen@msn.com', NULL, 'Wоmеn fоr sеx in уоur city | USA: http://xsle.net/datingsexygirlsinyourcity504399', 'Adult dating at 35 уеars оld: https://slimex365.com/adultdating978328', '2020-01-29 15:29:50', '2020-01-29 15:29:50'),
(337, 'Dating fоr seх with exреriеnсеd girls from 20 yeаrs: http://freeurlredirect.com/adultdating736336', '86533445473', 'sjaj@hj.co.uk', NULL, 'Beautiful girls fоr sеx in уоur city UК: https://1borsa.com/adultdating832503', 'Dаting site for sех with girls in уour сity: https://onlineuniversalwork.com/datingsexygirlsinyourcity42414', '2020-01-29 22:31:27', '2020-01-29 22:31:27');
INSERT INTO `contacts` (`id`, `contactName`, `contactPhone`, `contactEmail`, `contactAddress`, `contactTitle`, `contactMessage`, `created_at`, `updated_at`) VALUES
(338, 'Dating fоr seх with exреriеnсеd girls from 20 yeаrs: http://freeurlredirect.com/adultdating736336', '84486626354', 'konchat@yahoo.co.uk', NULL, 'Beautiful girls fоr sеx in уоur city UК: https://1borsa.com/adultdating832503', 'Dаting site for sех with girls in уour сity: https://onlineuniversalwork.com/datingsexygirlsinyourcity42414', '2020-01-29 22:31:28', '2020-01-29 22:31:28'),
(339, 'Dating fоr seх with exреriеnсеd girls from 20 yeаrs: http://freeurlredirect.com/adultdating736336', '89853171918', 'kirsty8701@hotmail.co.uk', NULL, 'Beautiful girls fоr sеx in уоur city UК: https://1borsa.com/adultdating832503', 'Dаting site for sех with girls in уour сity: https://onlineuniversalwork.com/datingsexygirlsinyourcity42414', '2020-01-29 22:31:30', '2020-01-29 22:31:30'),
(340, 'Dating fоr seх with exреriеnсеd girls from 20 yeаrs: http://freeurlredirect.com/adultdating736336', '89745625962', 'christov@totallysucks.co.uk', NULL, 'Beautiful girls fоr sеx in уоur city UК: https://1borsa.com/adultdating832503', 'Dаting site for sех with girls in уour сity: https://onlineuniversalwork.com/datingsexygirlsinyourcity42414', '2020-01-29 22:31:32', '2020-01-29 22:31:32'),
(341, 'Dating fоr seх with exреriеnсеd girls from 20 yeаrs: http://freeurlredirect.com/adultdating736336', '81855353984', 'ilovetegen@hotmail.co.uk', NULL, 'Beautiful girls fоr sеx in уоur city UК: https://1borsa.com/adultdating832503', 'Dаting site for sех with girls in уour сity: https://onlineuniversalwork.com/datingsexygirlsinyourcity42414', '2020-01-29 22:31:34', '2020-01-29 22:31:34');

-- --------------------------------------------------------

--
-- Table structure for table `contactuses`
--

CREATE TABLE `contactuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new-message',
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_collections`
--

CREATE TABLE `credit_collections` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime NOT NULL,
  `money_receipt_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `money_receipt_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` int(11) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_purchases`
--

CREATE TABLE `credit_purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'credit',
  `credit_serial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vouchar_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `submission_date` datetime NOT NULL,
  `purchase_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` datetime NOT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credit_purchases`
--

INSERT INTO `credit_purchases` (`id`, `type`, `credit_serial`, `vouchar_no`, `supplier_id`, `submission_date`, `purchase_by`, `voucher_date`, `total_qty`, `total_amount`, `discount`, `vat`, `net_amount`, `created_at`, `updated_at`) VALUES
(1, 'credit', '1000001', '9876653', 0, '2020-01-22 00:00:00', 'Admin', '2020-01-22 00:00:00', '5.00', '1000.00', '0', '0', '1000.00', '2020-01-22 17:41:04', '2020-01-22 17:41:04');

-- --------------------------------------------------------

--
-- Table structure for table `credit_purchase_items`
--

CREATE TABLE `credit_purchase_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_puchase_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `credit_purchase_items`
--

INSERT INTO `credit_purchase_items` (`id`, `credit_puchase_id`, `product_id`, `qty`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '5', '200', '1000.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `credit_sales`
--

CREATE TABLE `credit_sales` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` datetime NOT NULL,
  `invoice_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_as` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `net_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_sale_items`
--

CREATE TABLE `credit_sale_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_sale_id` int(11) NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` text COLLATE utf8mb4_unicode_ci,
  `dob` date DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `gender` text COLLATE utf8mb4_unicode_ci,
  `password` text COLLATE utf8mb4_unicode_ci,
  `confirmPassword` text COLLATE utf8mb4_unicode_ci,
  `clientGroup` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `mobile`, `dob`, `address`, `gender`, `password`, `confirmPassword`, `clientGroup`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Jisan Ahmed', 'jisanahmed06@gmail.com', '0186289588', NULL, 'Badda', NULL, 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, NULL, '2020-02-05 01:07:26', '2020-02-05 01:07:26'),
(5, 'M Hasan', NULL, '01832967276', NULL, 'Barisal', NULL, NULL, NULL, NULL, NULL, '2020-02-05 06:17:37', '2020-02-05 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `groupName` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groupCode` text COLLATE utf8mb4_unicode_ci,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `groupStatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `groupName`, `groupCode`, `metaTitle`, `metaKeyword`, `metaDescription`, `orderBy`, `groupStatus`, `created_at`, `updated_at`) VALUES
(1, 'Reseller', 'R001', NULL, NULL, NULL, 1, 1, '2019-12-02 14:18:02', '2019-12-02 14:18:02');

-- --------------------------------------------------------

--
-- Table structure for table `customer_group_sections`
--

CREATE TABLE `customer_group_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `customerGroupId` text COLLATE utf8mb4_unicode_ci,
  `customerGroupPrice` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_group_sections`
--

INSERT INTO `customer_group_sections` (`id`, `productId`, `customerGroupId`, `customerGroupPrice`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL, NULL, NULL),
(3, 2, NULL, NULL, NULL, NULL),
(4, 3, NULL, NULL, NULL, NULL),
(5, 5, '1', '1250', NULL, NULL),
(9, 59, NULL, NULL, NULL, NULL),
(12, 13, NULL, NULL, NULL, NULL),
(14, 58, NULL, NULL, NULL, NULL),
(15, 53, NULL, NULL, NULL, NULL),
(16, 9, NULL, NULL, NULL, NULL),
(17, 41, NULL, NULL, NULL, NULL),
(19, 48, NULL, NULL, NULL, NULL),
(20, 29, NULL, NULL, NULL, NULL),
(21, 60, NULL, NULL, NULL, NULL),
(22, 16, NULL, NULL, NULL, NULL),
(23, 49, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_policies`
--

CREATE TABLE `delivery_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sell`
--

CREATE TABLE `flash_sell` (
  `id` int(10) UNSIGNED NOT NULL,
  `flashPrice` text COLLATE utf8mb4_unicode_ci,
  `flashDate` text COLLATE utf8mb4_unicode_ci,
  `flashProduct` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_centers`
--

CREATE TABLE `help_centers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoiceId` int(11) NOT NULL,
  `orderId` text COLLATE utf8mb4_unicode_ci,
  `productCode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productQuantity` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productPrice` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productAmount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `menuName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuTitle` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuContent` text COLLATE utf8mb4_unicode_ci,
  `menuStatus` tinyint(1) NOT NULL DEFAULT '1',
  `menuType` int(11) NOT NULL DEFAULT '1',
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_07_02_180455_create_categories_table', 1),
(4, '2018_07_13_130624_create_sub_categories_table', 1),
(5, '2018_07_14_141212_create_products_table', 1),
(6, '2018_07_18_172951_create_customers_table', 1),
(7, '2018_07_18_173018_create_shippings_table', 1),
(8, '2018_07_18_173045_create_checkouts_table', 1),
(9, '2018_07_18_173051_create_orders_table', 1),
(10, '2018_07_18_173115_create_transactions_table', 1),
(11, '2018_07_21_144649_create_contactuses_table', 1),
(12, '2018_07_22_211328_create_admins_table', 1),
(13, '2018_07_27_082321_create_careers_table', 1),
(14, '2018_07_27_103118_create_teams_table', 1),
(15, '2018_07_27_111833_create_sliders_table', 1),
(16, '2019_01_06_085032_create_packages_table', 1),
(17, '2019_03_13_120816_create_menus_table', 2),
(18, '2019_03_13_121439_create_menus_table', 3),
(19, '2018_11_17_160100_create_verifies_customers_table', 4),
(20, '2018_11_17_160100_create_verify_customers_table', 5),
(21, '2019_03_19_065715_create_settings_table', 6),
(22, '2018_07_02_180455_create_policies_table', 7),
(23, '2018_07_02_180455_create_banners_table', 8),
(24, '2019_03_27_075039_create_product_sections_table', 9),
(25, '2019_03_28_062230_create_product_sections_table', 10),
(26, '2019_03_30_094825_create_socials_table', 11),
(27, '2019_03_30_181906_create_product_sections_table', 12),
(28, '2019_04_03_083641_create_contacts_table', 13),
(29, '2019_04_03_104734_create_reviews_table', 14),
(30, '2019_04_03_105403_create_reviews_table', 15),
(31, '2019_04_04_111431_create_abouts_table', 16),
(32, '2019_04_04_112139_create_abouts_table', 17),
(33, '2019_04_07_042104_create_product_images_table', 18),
(34, '2019_04_05_060258_create_faqs_table', 19),
(35, '2019_04_09_072500_create_delivery_policies_table', 20),
(36, '2019_04_09_075441_create_payment_policies_table', 21),
(37, '2019_04_09_090821_create_refund_policies_table', 22),
(38, '2019_04_10_061020_create_help_centers_table', 22),
(39, '2019_04_10_071450_create_terms_table', 23),
(40, '2019_04_10_073726_create_blogs_table', 24),
(41, '2019_04_10_101945_create_newsletters_table', 25),
(42, '2019_04_17_062734_create_user_roles_table', 26),
(43, '2019_06_15_064819_create_shipping_charges_table', 27),
(44, '2019_06_16_100518_create_invoice_table', 28),
(45, '2019_07_14_074721_create_customer_group_section_table', 29),
(46, '2019_07_14_075751_create_customer_group_sections_table', 30),
(47, '2019_08_31_064148_create_vendors_table', 31),
(48, '2019_09_03_065923_create_cash_purchase_table', 32),
(49, '2019_09_03_070746_create_cash_purchase_item_table', 33),
(50, '2019_09_04_060034_create_credit_purchases_table', 34),
(51, '2019_09_04_060941_create_credit_purchase_items_table', 34),
(52, '2019_09_04_100454_create_purchase_order_items_table', 35),
(53, '2019_09_04_100609_create_purchase_orders_table', 35),
(54, '2019_09_05_053849_create_purchase_order_receives_table', 36),
(55, '2019_09_05_054156_create_purchase_order_receive_items_table', 36),
(56, '2019_09_05_095924_create_supplier_payments_table', 37),
(70, '2019_09_07_070859_create_purchase_returns_table', 38),
(71, '2019_09_07_071132_create_purchase_return_items_table', 38),
(72, '2019_10_14_054237_create_cash_sales_table', 39),
(73, '2019_10_14_061711_create_cash_sale_items_table', 40),
(74, '2019_10_14_081848_add_columns_to_cash_sale_items_table', 41),
(75, '2019_10_14_082532_add_vat_to_cash_sales_table', 42),
(76, '2019_10_14_103256_add_discount_as_to_cash_sales_table', 43),
(77, '2019_10_14_115714_create_credit_sales_table', 44),
(78, '2019_10_14_120911_create_credit_sale_items_table', 44),
(79, '2019_10_15_073308_create_client_entries_table', 45),
(80, '2019_10_15_121834_drop_columns_to_credit_sales_table', 46),
(81, '2019_10_16_100931_create_credit_collections_table', 47);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(10) UNSIGNED NOT NULL,
  `subscribeEmail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `subscribeEmail`, `created_at`, `updated_at`) VALUES
(1, 'jisanahamed06@gmail.com', '2020-02-05 05:10:21', '2020-02-05 05:10:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkout_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL,
  `weight` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `checkout_id`, `product_id`, `qty`, `weight`, `price`, `discount`, `created_at`, `updated_at`) VALUES
(3, 4, 5, 2, '', 1500.00, NULL, '2020-02-05 01:08:13', '2020-02-05 01:08:13'),
(4, 4, 12, 1, '', 860.00, NULL, '2020-02-05 01:08:13', '2020-02-05 01:08:13'),
(5, 5, 9, 1, '', 1450.00, NULL, '2020-02-05 06:17:37', '2020-02-05 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `packageName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `packageStatus` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_policies`
--

CREATE TABLE `payment_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `policiesStatus` tinyint(1) NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `root_category` int(10) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description1` text COLLATE utf8mb4_unicode_ci,
  `description2` text COLLATE utf8mb4_unicode_ci,
  `deal_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `reorder_qty` int(10) UNSIGNED NOT NULL DEFAULT '5',
  `stockUnit` int(11) DEFAULT NULL,
  `weight` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `youtubeLink` text COLLATE utf8mb4_unicode_ci,
  `productSection` text COLLATE utf8mb4_unicode_ci,
  `tag` text COLLATE utf8mb4_unicode_ci,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `root_category`, `name`, `description1`, `description2`, `deal_code`, `phone_no`, `qty`, `reorder_qty`, `stockUnit`, `weight`, `price`, `discount`, `status`, `youtubeLink`, `productSection`, `tag`, `metaTitle`, `metaKeyword`, `metaDescription`, `orderBy`, `created_at`, `updated_at`) VALUES
(2, '28', 17, 'Monitor with Wide Viewing Angle', NULL, NULL, '002', '01654688765', '1', 5, 1, NULL, 1050, NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, 2, '2019-12-01 17:26:54', '2020-02-06 01:16:44'),
(3, '2', 1, 'Shal', NULL, NULL, '003', NULL, '2', 5, 1, NULL, 850, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, 3, '2019-12-01 17:39:57', '2020-01-29 16:45:04'),
(4, '5', 4, 'RI Three Pcs', NULL, NULL, 'TP001', NULL, '1', 5, 1, NULL, 1500, NULL, 0, NULL, '3', NULL, NULL, NULL, NULL, 1, '2019-12-02 14:16:50', '2020-02-06 01:56:46'),
(5, '26', 17, 'Galaxy Android Smartphone', NULL, NULL, 'TP002', NULL, NULL, 5, NULL, NULL, 1500, NULL, 1, NULL, '1', NULL, NULL, NULL, NULL, 1, '2019-12-02 14:28:21', '2020-02-06 01:50:55'),
(7, '2', 1, 'Shal', NULL, NULL, '004', NULL, NULL, 5, NULL, NULL, 850, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 4, '2020-01-06 15:33:01', '2020-02-06 01:57:03'),
(8, '2', 1, 'Shal', NULL, NULL, '005', NULL, NULL, 5, NULL, NULL, 900, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2020-01-06 16:32:54', '2020-01-29 16:50:19'),
(9, '29', 18, 'Casual Shoes For Men', '<p><span style=\"color: rgb(153, 153, 153); font-family: Roboto, sans-serif; font-size: 13px;\">This is product short description. Capicola chuck tongue, anim consequat leberkas laborum ut enim bacon. Ribeye hamburger pastrami nisi ad consectetur dolor.</span><br></p>', '<h5 style=\"box-sizing: inherit; font-family: Roboto, sans-serif; line-height: 1.1; color: rgb(51, 51, 51); font-size: 0.8125rem;\">Multi-language product description</h5><p style=\"box-sizing: inherit; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;\">Lorem ipsum voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</p><p style=\"box-sizing: inherit; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;\">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore.</p><p style=\"box-sizing: inherit; color: rgb(51, 51, 51); font-family: Roboto, sans-serif; font-size: 13px;\">Dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex eacommodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur.</p>', '006', NULL, NULL, 5, NULL, NULL, 1450, NULL, 1, NULL, '1,2,4', NULL, NULL, NULL, NULL, 6, '2020-01-06 16:41:57', '2020-02-06 01:44:37'),
(12, '5', 4, 'sheikh tex', NULL, NULL, 'TP003', NULL, NULL, 5, NULL, NULL, 860, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-01-07 10:38:30', '2020-02-06 01:57:01'),
(13, '33', 17, 'Convection Micro Wave Owen', NULL, NULL, 'TP004', NULL, NULL, 5, NULL, NULL, 860, NULL, 1, NULL, '1,2', NULL, NULL, NULL, NULL, 4, '2020-01-07 10:49:14', '2020-02-06 01:25:54'),
(14, '5', 4, 'Ytex', NULL, NULL, 'TP005', NULL, NULL, 5, NULL, NULL, 950, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2020-01-07 11:06:59', '2020-02-06 01:57:25'),
(16, '18', 18, 'Hand Accessories', NULL, NULL, 'TP007', NULL, NULL, 5, NULL, NULL, 950, NULL, 1, NULL, '1,4', NULL, NULL, NULL, NULL, 7, '2020-01-07 11:19:16', '2020-02-06 02:04:37'),
(17, '5', 4, 'Ptex', NULL, NULL, 'TP014', NULL, NULL, 5, NULL, NULL, 950, NULL, 0, NULL, '3', NULL, NULL, NULL, NULL, 14, '2020-01-07 15:02:01', '2020-02-06 01:56:42'),
(19, '5', 4, 'sheikh tex', NULL, NULL, 'TP012', NULL, NULL, 5, NULL, NULL, 860, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 12, '2020-01-07 15:07:25', '2020-02-06 01:57:00'),
(21, '5', 4, 'sheikh tex', NULL, NULL, 'TP010', NULL, NULL, 5, NULL, NULL, 860, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 10, '2020-01-07 15:18:44', '2020-01-29 16:40:24'),
(22, '5', 4, 'sheikh tex', NULL, NULL, 'TP009', NULL, NULL, 5, NULL, NULL, 860, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 9, '2020-01-07 15:21:39', '2020-01-29 16:45:42'),
(24, '9', 4, 'V tex', NULL, NULL, 'TP015', NULL, NULL, 5, NULL, NULL, 1050, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 15, '2020-01-08 10:59:54', '2020-01-29 16:47:39'),
(25, '9', 4, 'v tex', NULL, NULL, 'TP018', NULL, NULL, 5, NULL, NULL, 1050, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 18, '2020-01-08 11:10:58', '2020-01-29 16:47:46'),
(26, '9', 4, 'v tex', NULL, NULL, 'TP017', NULL, NULL, 5, NULL, NULL, 1050, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 17, '2020-01-08 11:17:07', '2020-02-06 01:57:30'),
(27, '9', 4, 'v tex', NULL, NULL, 'TP016', NULL, NULL, 5, NULL, NULL, 1050, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 16, '2020-01-08 11:25:37', '2020-02-06 01:57:27'),
(29, '18', 18, 'Dotted Golden Handbag', NULL, NULL, 'TP019', NULL, NULL, 5, NULL, NULL, 860, NULL, 1, NULL, '1,4', NULL, NULL, NULL, NULL, 19, '2020-01-08 11:46:13', '2020-02-06 01:53:53'),
(33, '5', 4, 'Nsd tex', NULL, NULL, 'TP022', NULL, NULL, 5, NULL, NULL, 1280, NULL, 0, NULL, '4', NULL, NULL, NULL, NULL, 22, '2020-01-08 11:59:47', '2020-02-06 01:56:37'),
(35, '5', 4, 'Mahi 3pcs', NULL, NULL, 'TP027', NULL, NULL, 5, NULL, NULL, 620, NULL, 0, NULL, '4', NULL, NULL, NULL, NULL, 27, '2020-01-08 12:07:38', '2020-02-06 01:56:35'),
(37, '5', 4, 'Suzuki', NULL, NULL, 'TP038', NULL, NULL, 5, NULL, NULL, 1650, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 38, '2020-01-08 16:17:47', '2020-01-29 16:47:25'),
(38, '5', 4, 's tex', NULL, NULL, 'TP033', NULL, NULL, 5, NULL, NULL, 980, NULL, 0, NULL, '3', NULL, NULL, NULL, NULL, 33, '2020-01-08 16:23:59', '2020-02-06 01:56:49'),
(39, '5', 4, 'Suzuki', NULL, NULL, 'TP037', NULL, NULL, 5, NULL, NULL, 1490, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 37, '2020-01-08 16:35:25', '2020-01-29 16:47:16'),
(40, '5', 4, 'Suzuki', NULL, NULL, 'TP036', NULL, NULL, 5, NULL, NULL, 1650, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 36, '2020-01-08 16:38:24', '2020-01-29 16:47:05'),
(41, '33', 17, 'Double Door Smart Refrigerator', NULL, NULL, 'TP035', NULL, NULL, 5, NULL, NULL, 1520, NULL, 1, NULL, '1,2', NULL, NULL, NULL, NULL, 35, '2020-01-08 16:49:14', '2020-02-06 01:45:29'),
(42, '5', 4, 's tex', NULL, NULL, 'TP034', NULL, NULL, 5, NULL, NULL, 860, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 34, '2020-01-08 16:59:50', '2020-01-29 16:46:55'),
(43, '5', 4, 'Kishan tex', NULL, NULL, 'TP031', NULL, NULL, 5, NULL, NULL, 1550, NULL, 0, NULL, '4', NULL, NULL, NULL, NULL, 31, '2020-01-08 17:03:07', '2020-02-06 01:56:31'),
(45, '5', 4, 's tex', NULL, NULL, 'TP029', NULL, NULL, 5, NULL, NULL, 990, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 29, '2020-01-08 17:12:31', '2020-02-06 01:56:54'),
(46, '8', 4, 'L tex', NULL, NULL, 'TP032', NULL, NULL, 5, NULL, NULL, 750, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, 32, '2020-01-08 17:16:30', '2020-02-06 04:21:20'),
(48, '33', 17, 'Convection Micro Wave Owen', NULL, NULL, 'TP039', NULL, NULL, 5, NULL, NULL, 1150, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, 39, '2020-01-09 14:53:15', '2020-02-06 01:59:19'),
(49, '18', 18, 'Printed Summer Shirt', NULL, NULL, 'TP043', NULL, NULL, 5, NULL, NULL, 1150, NULL, 1, NULL, '1,2,4', NULL, NULL, NULL, NULL, 43, '2020-01-09 14:57:31', '2020-02-06 02:11:03'),
(50, '27', 17, 'K Tex', NULL, NULL, 'TP042', NULL, NULL, 5, NULL, NULL, 600, NULL, 0, NULL, '4', NULL, NULL, NULL, NULL, 42, '2020-01-09 15:00:32', '2020-02-06 01:59:22'),
(53, '27', 17, 'HF Tex', NULL, NULL, 'TP051', NULL, NULL, 5, NULL, NULL, 1150, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, 51, '2020-01-09 15:10:43', '2020-02-06 01:59:24'),
(54, '5', 4, 'Ytex', NULL, NULL, 'TP050', NULL, NULL, 5, NULL, NULL, 750, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 50, '2020-01-09 15:13:18', '2020-02-06 01:57:21'),
(55, '5', 4, 'Ytex', NULL, NULL, 'TP049', NULL, NULL, 5, NULL, NULL, 750, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 49, '2020-01-09 15:21:39', '2020-02-06 01:57:17'),
(56, '5', 4, 'Ytex', NULL, NULL, 'TP048', NULL, NULL, 5, NULL, NULL, 950, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 48, '2020-01-09 15:23:21', '2020-02-06 01:57:14'),
(57, '5', 4, 'Ytex', NULL, NULL, 'TP047', NULL, NULL, 5, NULL, NULL, 950, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 47, '2020-01-09 15:27:54', '2020-02-06 01:57:12'),
(58, '27', 17, 'Btex', NULL, NULL, 'TP046', NULL, NULL, 5, NULL, NULL, 850, NULL, 0, NULL, '1', NULL, NULL, NULL, NULL, 46, '2020-01-09 15:30:29', '2020-02-06 01:59:28'),
(59, '26', 17, 'Galaxy Note Series Smartphone', NULL, NULL, 'TP045', NULL, NULL, 5, NULL, NULL, 850, NULL, 1, NULL, '2,4', NULL, NULL, NULL, NULL, 45, '2020-01-09 15:39:50', '2020-02-06 02:06:30'),
(60, '18', 18, 'Latest Designer Purse', NULL, NULL, 'TP044', NULL, NULL, 5, NULL, NULL, 850, NULL, 1, NULL, '1,2,4', NULL, NULL, NULL, NULL, 44, '2020-01-09 15:43:34', '2020-02-06 02:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `productId` int(11) NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `productId`, `images`, `created_at`, `updated_at`) VALUES
(3, 3, 'public/uploads/product_image/IMG-20191201-WA0004.jpg', '2019-12-01 17:40:19', '2019-12-01 17:40:19'),
(9, 4, 'public/uploads/product_image/RM 001_83056018351.jpg', '2020-01-06 16:00:15', '2020-01-06 16:00:15'),
(11, 8, 'public/uploads/product_image/20191201_120605_3081624111.jpg', '2020-01-06 16:34:34', '2020-01-06 16:34:34'),
(12, 8, '', '2020-01-06 16:34:47', '2020-01-06 16:34:47'),
(17, 7, 'public/uploads/product_image/20191201_113733_14433437018.jpg', '2020-01-06 17:06:11', '2020-01-06 17:06:11'),
(18, 12, 'public/uploads/product_image/20191117_164637_61278715776.jpg', '2020-01-07 10:39:57', '2020-01-07 10:39:57'),
(20, 14, 'public/uploads/product_image/tp005_38778370683.jpg', '2020-01-07 11:08:19', '2020-01-07 11:08:19'),
(25, 17, 'public/uploads/product_image/20191117_171034_14733886034.jpg', '2020-01-07 15:03:42', '2020-01-07 15:03:42'),
(26, 19, 'public/uploads/product_image/20200107_135531_4573695780.jpg', '2020-01-07 15:08:22', '2020-01-07 15:08:22'),
(29, 21, 'public/uploads/product_image/20200107_135531_30810798458.jpg', '2020-01-07 15:19:27', '2020-01-07 15:19:27'),
(30, 22, 'public/uploads/product_image/20200107_133107_34489221410.jpg', '2020-01-07 15:22:56', '2020-01-07 15:22:56'),
(33, 24, 'public/uploads/product_image/20200108_094823_83457253801.jpg', '2020-01-08 11:01:12', '2020-01-08 11:01:12'),
(34, 25, 'public/uploads/product_image/20200108_100006_32168886641.jpg', '2020-01-08 11:12:03', '2020-01-08 11:12:03'),
(35, 26, 'public/uploads/product_image/20200108_095702_47366710123.jpg', '2020-01-08 11:17:52', '2020-01-08 11:17:52'),
(36, 27, 'public/uploads/product_image/20200108_095329_94648188802.jpg', '2020-01-08 11:27:41', '2020-01-08 11:27:41'),
(42, 33, 'public/uploads/product_image/20200108_101730_21247838568.jpg', '2020-01-08 12:00:57', '2020-01-08 12:00:57'),
(44, 35, 'public/uploads/product_image/20200108_103537_13720525569.jpg', '2020-01-08 12:10:01', '2020-01-08 12:10:01'),
(46, 37, 'public/uploads/product_image/mmmmm_81770976096.jpg', '2020-01-08 16:21:51', '2020-01-08 16:21:51'),
(47, 38, 'public/uploads/product_image/nnnnnn_56476937165.jpg', '2020-01-08 16:28:30', '2020-01-08 16:28:30'),
(48, 39, 'public/uploads/product_image/20200108_150238_9726046021.jpg', '2020-01-08 16:36:32', '2020-01-08 16:36:32'),
(49, 40, 'public/uploads/product_image/zzzz_66311891209.jpg', '2020-01-08 16:42:22', '2020-01-08 16:42:22'),
(51, 42, 'public/uploads/product_image/20200108_144506_46649785991.jpg', '2020-01-08 17:01:40', '2020-01-08 17:01:40'),
(52, 43, 'public/uploads/product_image/tp031_25922676371.jpg', '2020-01-08 17:06:41', '2020-01-08 17:06:41'),
(54, 45, 'public/uploads/product_image/20200108_140259_56345345361.jpg', '2020-01-08 17:13:31', '2020-01-08 17:13:31'),
(55, 46, 'public/uploads/product_image/tp032_71295600227.jpg', '2020-01-08 17:17:13', '2020-01-08 17:17:13'),
(62, 53, 'public/uploads/product_image/20200109_111700_41489925845.jpg', '2020-01-09 15:11:51', '2020-01-09 15:11:51'),
(63, 54, 'public/uploads/product_image/20200109_111026_80666751204.jpg', '2020-01-09 15:14:25', '2020-01-09 15:14:25'),
(64, 55, 'public/uploads/product_image/20200109_111026_84159796652.jpg', '2020-01-09 15:22:17', '2020-01-09 15:22:17'),
(65, 56, 'public/uploads/product_image/20200109_110424_50661299813.jpg', '2020-01-09 15:24:10', '2020-01-09 15:24:10'),
(66, 57, 'public/uploads/product_image/20200109_110424_60235296208.jpg', '2020-01-09 15:29:03', '2020-01-09 15:29:03'),
(67, 58, 'public/uploads/product_image/20200109_110120_22261644460.jpg', '2020-01-09 15:35:29', '2020-01-09 15:35:29'),
(90, 50, 'public/uploads/product_image/20200109_104503_91016051357_86376709710.jpg', '2020-01-30 05:55:12', '2020-01-30 05:55:12'),
(93, 48, 'public/uploads/product_image/20200109_103450_16035756966_94757176318.jpg', '2020-01-30 07:25:07', '2020-01-30 07:25:07'),
(95, 9, 'public/uploads/product_image/casual-shoes-for-men_56471194630.jpg', '2020-02-04 01:35:13', '2020-02-04 01:35:13'),
(106, 29, 'public/uploads/product_image/dotted-golden-handbag_30061878058.jpg', '2020-02-06 01:14:36', '2020-02-06 01:14:36'),
(107, 2, 'public/uploads/product_image/monitor-with-wide-viewing-angle_64278146215.jpg', '2020-02-06 01:18:14', '2020-02-06 01:18:14'),
(108, 16, 'public/uploads/product_image/hand-accessories_54317573007.jpg', '2020-02-06 01:22:53', '2020-02-06 01:22:53'),
(109, 5, 'public/uploads/product_image/galaxy-android-smartphone_20164247651.jpg', '2020-02-06 01:52:34', '2020-02-06 01:52:34'),
(111, 13, 'public/uploads/product_image/convection-micro-wave-owen_80311002303.jpg', '2020-02-06 01:58:42', '2020-02-06 01:58:42'),
(112, 41, 'public/uploads/product_image/double-door-smart-refrigerator_31073489281.jpg', '2020-02-06 02:02:15', '2020-02-06 02:02:15'),
(113, 59, 'public/uploads/product_image/galaxy-note-series-smartphone_66021189117.jpg', '2020-02-06 02:06:46', '2020-02-06 02:06:46'),
(114, 49, 'public/uploads/product_image/printed-summer-shirt_48734524877.jpg', '2020-02-06 03:32:37', '2020-02-06 03:32:37'),
(115, 60, 'public/uploads/product_image/latest-designer-purse_81424968306.jpg', '2020-02-06 03:42:31', '2020-02-06 03:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_sections`
--

CREATE TABLE `product_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `productId` int(11) NOT NULL,
  `hotDiscount` text COLLATE utf8mb4_unicode_ci,
  `hotDate` text COLLATE utf8mb4_unicode_ci,
  `specialDiscount` text COLLATE utf8mb4_unicode_ci,
  `specialDate` text COLLATE utf8mb4_unicode_ci,
  `free_shipping` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_orderDuration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `multiImage` text COLLATE utf8mb4_unicode_ci,
  `related_product` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sections`
--

INSERT INTO `product_sections` (`id`, `productId`, `hotDiscount`, `hotDate`, `specialDiscount`, `specialDate`, `free_shipping`, `pre_order`, `pre_orderDuration`, `multiImage`, `related_product`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-01 17:27:49', '2019-12-01 17:27:49'),
(3, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-01 17:28:36', '2019-12-01 17:28:36'),
(4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-01 17:40:30', '2019-12-01 17:40:30'),
(5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-02 14:31:07', '2019-12-02 14:31:07'),
(7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 15:33:01', '2020-01-06 15:33:01'),
(8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-06 16:32:54', '2020-01-06 16:32:54'),
(9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,48', '2020-01-06 16:41:57', '2020-02-04 00:04:16'),
(12, 12, '850', '29-02-2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-07 10:38:30', '2020-01-30 01:15:45'),
(13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-07 10:49:14', '2020-01-07 10:49:14'),
(14, 14, NULL, NULL, '950', '15-04-2020', NULL, NULL, NULL, NULL, '4,5', '2020-01-07 11:06:59', '2020-01-30 01:35:52'),
(16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-07 11:19:16', '2020-01-07 11:19:16'),
(17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,59,4,5', '2020-01-07 15:02:01', '2020-01-30 00:48:50'),
(19, 19, '860', '28-02-2020', NULL, NULL, NULL, NULL, NULL, NULL, '58,59', '2020-01-07 15:07:25', '2020-01-30 01:32:57'),
(21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-07 15:18:44', '2020-01-07 15:18:44'),
(22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-07 15:21:39', '2020-01-07 15:21:39'),
(24, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 10:59:54', '2020-01-08 10:59:54'),
(25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 11:10:58', '2020-01-08 11:10:58'),
(26, 26, NULL, NULL, '1050', '15-03-2020', NULL, NULL, NULL, NULL, NULL, '2020-01-08 11:17:07', '2020-01-30 01:41:23'),
(27, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 11:25:37', '2020-01-08 11:25:37'),
(29, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 11:46:13', '2020-01-08 11:46:13'),
(33, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 11:59:47', '2020-01-08 11:59:47'),
(35, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,4,5', '2020-01-08 12:07:38', '2020-01-30 00:44:00'),
(37, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 16:17:47', '2020-01-08 16:17:47'),
(38, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 16:23:59', '2020-01-08 16:23:59'),
(39, 39, NULL, NULL, '5', '31-01-2020', NULL, NULL, NULL, NULL, NULL, '2020-01-08 16:35:25', '2020-01-11 09:41:44'),
(40, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 16:38:24', '2020-01-08 16:38:24'),
(41, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,59,60,49,4,5', '2020-01-08 16:49:14', '2020-01-30 00:10:50'),
(42, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 16:59:50', '2020-01-08 16:59:50'),
(43, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 17:03:07', '2020-01-08 17:03:07'),
(45, 45, '980', '14-02-2020', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 17:12:31', '2020-01-30 01:09:26'),
(46, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-08 17:16:30', '2020-01-08 17:16:30'),
(48, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,59,60,5,4', '2020-01-09 14:53:15', '2020-02-06 01:53:32'),
(49, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '41,59,60', '2020-01-09 14:57:31', '2020-02-06 02:11:03'),
(50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,59,60,48,49,4,5', '2020-01-09 15:00:32', '2020-01-30 00:14:18'),
(53, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '58,59,60,48,4,5', '2020-01-09 15:10:43', '2020-01-30 00:09:08'),
(54, 54, NULL, NULL, '750', '15-04-2020', NULL, NULL, NULL, NULL, NULL, '2020-01-09 15:13:18', '2020-01-30 01:36:35'),
(55, 55, NULL, NULL, NULL, '15-03-2020', NULL, NULL, NULL, NULL, NULL, '2020-01-09 15:21:39', '2020-01-30 01:38:20'),
(56, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-09 15:23:21', '2020-01-09 15:23:21'),
(57, 57, NULL, NULL, '950', '15-03-2020', NULL, NULL, NULL, NULL, '58,59,60,48,49', '2020-01-09 15:27:54', '2020-01-30 01:39:43'),
(58, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-09 15:30:29', '2020-01-09 15:30:29'),
(59, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4,5', '2020-01-09 15:39:50', '2020-01-29 23:34:03'),
(60, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-09 15:43:34', '2020-01-09 15:43:34'),
(61, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-30 00:58:46', '2020-01-30 00:58:46');

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_wise_profit`
-- (See below for the actual view)
--
CREATE TABLE `product_wise_profit` (
`date` datetime
,`productId` int(11) unsigned
,`categoryId` mediumtext
,`cashProductQty` varchar(191)
,`cashPriceAmount` varchar(191)
,`cashVatAmount` double
,`cashDiscountAmount` double
,`creditProductQty` varchar(255)
,`creditPriceAmount` varchar(255)
,`creditVatAmount` double
,`creditDiscountAmount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'purchase_order',
  `supplier_id` int(11) NOT NULL,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_date` datetime NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `voucher_date` datetime DEFAULT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `type`, `supplier_id`, `order_no`, `delivery_date`, `order_date`, `voucher_date`, `total_qty`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 'purchase_order', 0, '1000001', '2020-01-22 00:00:00', '2020-01-22 00:00:00', NULL, '17.00', '4800.00', '2020-01-22 17:44:09', '2020-01-22 17:44:09');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `product_id`, `qty`, `rate`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 58, '10', '200', '2000.00', NULL, NULL),
(2, 1, 46, '7', '400', '2800.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_receives`
--

CREATE TABLE `purchase_order_receives` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchaseOrderNo` int(11) NOT NULL,
  `receive_date` datetime NOT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_receive_items`
--

CREATE TABLE `purchase_order_receive_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_order_receive_id` int(11) NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `purchase_order_status`
-- (See below for the actual view)
--
CREATE TABLE `purchase_order_status` (
`supplierId` int(11)
,`orderNo` varchar(255)
,`date` datetime
,`productId` varchar(255)
,`orderQty` varchar(255)
,`receiveQty` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_return_serial` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_return_date` datetime NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `purchase_return_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_policies`
--

CREATE TABLE `refund_policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `review` text COLLATE utf8mb4_unicode_ci,
  `star` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `customerId`, `productId`, `name`, `summary`, `review`, `star`, `status`, `created_at`, `updated_at`) VALUES
(1, 21, 5, 'Anwar Zahed', 'Best Phone', 'Support Digital Network', '5', 1, '2020-01-09 15:12:09', '2020-01-09 15:14:07'),
(2, 21, 5, 'Anwar Zahed', 'New Featured Phone', 'সাম্প্রতিক বাংলা সাহিত্যের গৌরবময় একটি নাম হাসান আজিজুল হক। ১৯৩৯ সালের ২ ফেব্রুয়ারি বর্ধমান জেলার যবগ্রামে তার জন্ম । নিজের গ্রাম থেকে স্কুলের পড়া সাঙ্গ করে ওপার-বাংলায় চলে যান। তিনি, দর্শনশাস্ত্রের পড়াশোনার পর অধ্যাপনা করেন সেখানকার কয়েকটি কলেজে। ১৯৭৩ সাল থেকে রাজশাহী বিশ্ববিদ্যালয়ে দর্শনের অধ্যাপক, এখন অবসরপ্রাপ্ত। অধ্যাপনার সঙ্গে সঙ্গে দীর্ঘকাল অনেক গল্পের স্ৰষ্টা তিনি। গল্প অনেক লিখেছেন, কিন্তু, রহস্যময় কোনো কারণে, উপন্যাস-লেখায় বিশেষ আগ্ৰহ দেখান নি প্ৰতিভাবান এই কথাসাহিত্যিক । এ-বইটি প্ৰকাশিত হবার সঙ্গে সঙ্গে পাঠকসমাজের উৎসুক প্রতীক্ষার যেন অবসান হলো, আমাদের হাতে এসে পৌঁছল হাসান আজিজুল হকের হৃদয়স্পশী এই উপন্যাস : ’আগুনপাখি’ ।', '5', 1, '2020-01-09 17:04:12', '2020-01-09 17:04:51'),
(3, 21, 59, 'Anwar Zahed', NULL, 'Late Delivery', '1', 1, '2020-01-09 17:07:52', '2020-01-09 17:08:02'),
(4, 4, 5, 'M Hasan', 'New Test', 'best one', '1', 0, '2020-02-06 05:35:44', '2020-02-06 05:35:44');

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_collection_standings`
-- (See below for the actual view)
--
CREATE TABLE `sales_collection_standings` (
`customerId` varchar(255)
,`type` varchar(255)
,`date` datetime
,`sales` varchar(255)
,`collection` bigint(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_contribution`
-- (See below for the actual view)
--
CREATE TABLE `sales_contribution` (
`categoryId` mediumtext
,`productId` varchar(255)
,`cashSaleQty` double
,`cashSaleAmount` double
,`creditSaleQty` double
,`creditSaleAmount` double
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `siteTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siteName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siteLogo` text COLLATE utf8mb4_unicode_ci,
  `sitefavIcon` text COLLATE utf8mb4_unicode_ci,
  `adminTitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adminLogo` text COLLATE utf8mb4_unicode_ci,
  `adminsmalLogo` text COLLATE utf8mb4_unicode_ci,
  `adminfavIcon` text COLLATE utf8mb4_unicode_ci,
  `mobile1` text COLLATE utf8mb4_unicode_ci,
  `mobile2` text COLLATE utf8mb4_unicode_ci,
  `siteEmail1` text COLLATE utf8mb4_unicode_ci,
  `siteEmail2` text COLLATE utf8mb4_unicode_ci,
  `siteAddress1` text COLLATE utf8mb4_unicode_ci,
  `siteAddress2` text COLLATE utf8mb4_unicode_ci,
  `sitestatus` int(11) DEFAULT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `siteTitle`, `siteName`, `siteLogo`, `sitefavIcon`, `adminTitle`, `adminLogo`, `adminsmalLogo`, `adminfavIcon`, `mobile1`, `mobile2`, `siteEmail1`, `siteEmail2`, `siteAddress1`, `siteAddress2`, `sitestatus`, `metaTitle`, `metaKeyword`, `metaDescription`, `orderBy`, `created_at`, `updated_at`) VALUES
(1, 'Online Shopping Store', 'Nijer Bazar', 'public/uploads/site_logo/logo/nijr_bazar_logo_49907109594.png', 'public/uploads/site_logo/fav_icon/nijr_bazar_favicon_41551121520.png', 'Admin', 'public/uploads/admin_logo/main_logo/nijr_bazar_logo_60319429281.png', 'public/uploads/admin_logo/small_logo/nijr_bazar_favicon_53125488755.png', 'public/uploads/admin_logo/fav_icon/nijr_bazar_favicon_22861544401.png', '+8809678669966', '+8801402877515', 'ghornakshi@gmail.com', 'technoparkbd@gmail.com', 'Flat# 6A, House# 23, Road# 9', 'DIT Project, Merul Badda, Dhaka', NULL, 'NakshiGhor || Bangladeshi Handicrafts Products', 'Handicrafts, Handicraft in Bangladesh , Nakshi Kantha , Nokshi Kantha , Nokshi Katha Design , Online Shopping BD, Salwar Kameez Bangladesh  , Handmade Jewelry, Online Shopping Bangladesh, Hater Kaj', 'Handicrafts  Item In Bangladesh, We have Nakshi Home Decor,  Nakshi ladies dress, Nakshi Kantha, Handmade item, wall hanging. handmade jewelry many more!', 1, NULL, '2020-02-06 03:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `email`, `mobile`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Jisan Ahmed', 'jisanahmed06@gmail.com', '01832967276', 'House #68, Road #11, DIT Project, Merul Badda', 'pending', '2019-11-27 03:39:47', '2019-11-27 03:39:47'),
(2, 'Hasan Mia', 'hasan@gmail.com', '1232343255', 'Dhakaaa', 'pending', '2019-11-27 03:41:19', '2019-11-27 03:41:19'),
(3, 'Hasan Mia', 'hasan@gmail.com', '1243243244', 'Dhakaaa', 'pending', '2019-11-27 03:42:29', '2019-11-27 03:42:29'),
(5, 'Jisan Ahmed', 'jisanahmed06@gmail.com', '0186289588', 'Badda', 'pending', '2020-02-05 01:08:13', '2020-02-05 01:08:13'),
(6, 'M Hasan', NULL, '01832967276', 'Barisal', 'pending', '2020-02-05 06:17:37', '2020-02-05 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_charges`
--

CREATE TABLE `shipping_charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `shippingAmount` text COLLATE utf8mb4_unicode_ci,
  `shippingCharge` text COLLATE utf8mb4_unicode_ci,
  `shippingLocation` text COLLATE utf8mb4_unicode_ci,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `shippingStatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `source` text COLLATE utf8mb4_unicode_ci,
  `productId` int(11) DEFAULT NULL,
  `section` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `source`, `productId`, `section`, `status`, `metaTitle`, `metaKeyword`, `metaDescription`, `orderBy`, `created_at`, `updated_at`) VALUES
(1, 'Rodela', 'public/uploads/slider_image/sample-2.jpg', NULL, NULL, 1, NULL, NULL, NULL, 1, '2019-12-01 11:11:39', '2020-02-05 23:04:57'),
(4, NULL, 'public/uploads/slider_image/sample-1.jpg', NULL, NULL, 1, NULL, NULL, NULL, 1, '2019-12-01 12:01:47', '2020-02-05 23:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `twitter` text COLLATE utf8mb4_unicode_ci,
  `google` text COLLATE utf8mb4_unicode_ci,
  `linkdin` text COLLATE utf8mb4_unicode_ci,
  `youtube` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `icon` text COLLATE utf8mb4_unicode_ci,
  `link` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `name`, `icon`, `link`, `status`, `orderBy`, `created_at`, `updated_at`) VALUES
(3, 'Faccebook', '<i class=\"fa fa-facebook\"></i>', 'https://www.facebook.com', 1, 1, '2019-12-01 05:54:34', '2020-01-23 09:29:56'),
(4, 'Twiteer', '<i class=\"fa fa-twitter\"></i>', 'https://twitter.com', 1, 2, '2019-12-01 05:56:55', '2020-01-16 01:00:52'),
(5, 'whatsapp', '<i class=\"fa fa-whatsapp\"></i>', 'https://www.whatsapp.com/', 1, 4, '2020-01-11 04:12:44', '2020-01-16 01:00:18'),
(6, 'Linkdin', '<i class=\"fa fa-linkedin\"></i>', 'facebook.com', 0, 4, '2020-01-11 04:13:04', '2020-01-16 00:58:00'),
(7, 'Instagram', '<i class=\"fa fa-instagram\"></i>', 'https://www.instagram.com/', 1, 3, '2020-01-11 04:13:29', '2020-01-16 01:01:10');

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_status_report`
-- (See below for the actual view)
--
CREATE TABLE `stock_status_report` (
`supplierId` int(11)
,`date` datetime
,`categoryId` mediumtext
,`productId` varchar(255)
,`receiveQty` varchar(255)
,`receiveAmount` varchar(255)
,`cashSaleQty` varchar(191)
,`creditSaleQty` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stock_valuation_report`
-- (See below for the actual view)
--
CREATE TABLE `stock_valuation_report` (
`supplierId` bigint(20)
,`categoryId` mediumtext
,`productId` int(11)
,`cashPurchaseQty` varchar(255)
,`cashPurchaseAmount` varchar(255)
,`creditPurchaseQty` varchar(255)
,`creditPurchaseAmount` varchar(255)
,`purchaseReturnQty` varchar(255)
,`purchaseReturnAmount` varchar(255)
,`cashSaleQty` varchar(191)
,`cashSaleAmount` varchar(191)
,`creditSaleQty` bigint(20)
,`creditSaleAmount` bigint(20)
,`salesReturnQty` bigint(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `subcategoryName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategoryStatus` tinyint(1) NOT NULL DEFAULT '1',
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `orderBy` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_payments`
--

CREATE TABLE `supplier_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_date` datetime NOT NULL,
  `current_due` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_now` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `money_receipt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `supplier_statement_report`
-- (See below for the actual view)
--
CREATE TABLE `supplier_statement_report` (
`type` varchar(100)
,`date` datetime
,`lifting` double
,`payment` double
,`others` double
,`vendorId` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `supply_payment_summery`
-- (See below for the actual view)
--
CREATE TABLE `supply_payment_summery` (
`supplierId` int(11)
,`type` varchar(100)
,`date` datetime
,`purchase` varchar(255)
,`payment` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metaTitle` text COLLATE utf8mb4_unicode_ci,
  `metaKeyword` text COLLATE utf8mb4_unicode_ci,
  `metaDescription` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkout_id` int(10) UNSIGNED NOT NULL,
  `total` double(8,2) NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment` double(8,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `checkout_id`, `total`, `method`, `reference`, `payment`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 3860.00, NULL, '4', 0.00, 'pending', '2020-02-05 01:08:13', '2020-02-05 01:08:13'),
(2, 5, 1450.00, NULL, '5', 0.00, 'pending', '2020-02-05 06:17:37', '2020-02-05 06:17:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_menus`
--

CREATE TABLE `user_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `parentMenu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuLink` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `menuIcon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderBy` int(11) NOT NULL,
  `menuStatus` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_menus`
--

INSERT INTO `user_menus` (`id`, `parentMenu`, `menuName`, `menuLink`, `menuIcon`, `orderBy`, `menuStatus`, `created_at`, `updated_at`) VALUES
(1, '13', 'Flash Sell', 'flashSell', 'fa fa-caret', 11, '1', '2019-11-26 23:51:55', '2019-11-26 23:51:55'),
(3, NULL, 'Dashboard', 'admin.index', 'fa fa-shopping-bag', 1, '1', '2019-08-30 04:08:49', '2019-08-31 01:52:17'),
(6, NULL, 'Business', 'admin.index', 'fa fa-bars', 2, '1', '2019-08-30 04:47:14', '2019-08-30 04:47:14'),
(7, '6', 'Pending Order', 'order.new', 'fa fa-caret-right', 3, '1', '2019-08-30 04:48:23', '2019-08-30 05:19:18'),
(8, '6', 'Processing', 'order.processing', 'fa fa-caret-right', 4, '1', '2019-08-30 04:49:49', '2019-08-30 05:19:42'),
(10, '6', 'Shipping', 'order.shipping', 'fa fa-caret-right', 5, '1', '2019-08-30 05:11:21', '2019-08-30 05:21:29'),
(11, '6', 'Complete', 'orderlist.complete', 'fa fa-caret-right', 6, '1', '2019-08-30 05:22:21', '2019-08-30 05:22:21'),
(12, NULL, 'Customers', 'customers.index', 'fa fa-bars', 7, '1', '2019-08-30 05:26:51', '2019-08-30 05:26:51'),
(13, NULL, 'Business Settings', 'admin.index', 'fa fa-bars', 3, '1', '2019-08-30 05:27:47', '2019-10-30 09:39:18'),
(14, '13', 'Products', 'products.index', 'fa fa-caret-right', 10, '1', '2019-08-30 05:28:28', '2019-08-30 05:36:20'),
(15, '13', 'Categories', 'categories.index', 'fa fa-caret-right', 9, '1', '2019-08-30 05:28:59', '2019-08-30 05:43:13'),
(16, '13', 'Shipping Charge', 'shippingCharges.index', 'fa fa-caret-right', 11, '1', '2019-08-30 05:29:45', '2019-09-03 05:34:58'),
(17, '13', 'Customer Group', 'customerGroups.index', 'fa fa-caret-right', 12, '1', '2019-08-30 05:34:10', '2019-08-30 05:34:10'),
(18, NULL, 'Portal Information', 'admin.index', 'fa fa-bars', 2, '1', '2019-08-30 05:47:44', '2019-10-30 09:37:07'),
(19, '18', 'Site Info', 'site.info', 'fa fa-caret-right', 14, '1', '2019-08-30 05:48:51', '2019-08-30 05:48:51'),
(20, '18', 'menu', 'menu.index', 'fa fa-caret-right', 15, '1', '2019-08-30 05:49:27', '2019-08-30 05:49:27'),
(21, '18', 'Sliders', 'sliders.index', 'fa fa-caret-right', 16, '1', '2019-08-30 05:50:07', '2019-08-30 05:50:07'),
(22, '18', 'Advertizement', 'banners.index', 'fa fa-caret-right', 17, '1', '2019-08-30 05:51:17', '2019-08-30 05:51:17'),
(23, '18', 'Policies', 'policies.index', 'fa fa-caret-right', 18, '1', '2019-08-30 05:51:53', '2019-08-30 05:51:53'),
(24, '18', 'Social Link', 'social.info', 'fa fa-caret-right', 19, '1', '2019-08-30 05:52:26', '2019-08-30 05:52:26'),
(25, '18', 'About Us', 'about.us', 'fa fa-caret-right', 20, '1', '2019-08-30 05:52:51', '2019-08-30 05:52:51'),
(26, '18', 'Contact Us', 'contacts.index', 'fa fa-caret-right', 21, '1', '2019-08-30 05:53:19', '2019-08-30 05:53:19'),
(27, '18', 'FAQ', 'faqs.index', 'fa fa-caret-right', 22, '1', '2019-08-30 05:53:44', '2019-08-30 05:54:26'),
(28, '18', 'Customer Review', 'reviews.index', 'fa fa-caret-right', 23, '1', '2019-08-30 05:55:02', '2019-08-30 05:55:02'),
(29, '18', 'Delivery Policy', 'delivery.policy', 'fa fa-caret-right', 24, '1', '2019-08-30 05:55:33', '2019-08-30 05:55:33'),
(30, '18', 'Payment Policy', 'payment.policy', 'fa fa-caret-right', 25, '1', '2019-08-30 05:56:06', '2019-08-30 05:56:06'),
(31, '18', 'Refund Policy', 'refund.policy', 'fa fa-caret-right', 26, '1', '2019-08-30 05:56:28', '2019-08-30 05:56:28'),
(32, '18', 'Blog', 'blogs.index', 'fa fa-caret-right', 27, '1', '2019-08-30 05:57:09', '2019-08-30 05:57:09'),
(33, '18', 'Terms and Condition', 'terms.condition', 'fa fa-caret-right', 28, '1', '2019-08-30 05:57:41', '2019-08-30 05:57:41'),
(34, '18', 'Subscriber', 'subscribers.index', 'fa fa-caret-right', 29, '1', '2019-08-30 05:58:05', '2019-08-30 05:58:05'),
(35, '18', 'Help Center', 'help.center', 'fa fa-caret-right', 30, '1', '2019-08-30 05:58:53', '2019-08-30 05:58:53'),
(36, NULL, 'User Management', 'admin.index', 'fa fa-bars', 10, '1', '2019-08-30 06:00:46', '2019-10-30 09:48:00'),
(37, '36', 'Admin Panel Logo', 'admin.logo', 'fa fa-caret-right', 32, '1', '2019-08-30 06:01:24', '2019-08-30 06:01:24'),
(38, '36', 'Menus', 'usermenu.index', 'fa fa-caret-right', 33, '1', '2019-08-30 06:01:52', '2019-08-30 06:01:52'),
(39, '36', 'Role', 'user-roles.index', 'fa fa-caret-right', 34, '1', '2019-08-30 06:02:12', '2019-08-30 06:03:06'),
(40, '36', 'User', 'users.index', 'fa fa-caret-right', 35, '1', '2019-08-30 06:02:35', '2019-08-30 06:04:03'),
(41, '13', 'Vendor Setup', 'vendor.index', 'fa fa-caret-right', 36, '1', '2019-08-30 23:56:33', '2019-10-24 12:47:51'),
(42, '43', 'Cash Purchase', 'cashPurchase.index', 'fa fa-caret-right', 37, '1', '2019-09-02 22:19:01', '2019-09-03 22:19:56'),
(43, NULL, 'Procurement', 'admin.index', 'fa fa-bars', 5, '1', '2019-09-03 22:16:44', '2019-10-30 09:43:58'),
(44, '43', 'Credit Purchase', 'creditPurchase.index', 'fa fa-caret', 38, '1', '2019-09-03 22:23:17', '2019-09-03 22:27:58'),
(45, '43', 'Purchase Order', 'purchaseOrder.index', 'fa fa-caret', 39, '1', '2019-09-04 03:33:52', '2019-09-04 03:33:52'),
(46, '43', 'PO Receive', 'purchaseOrderReceive.index', 'fa fa-caret', 40, '1', '2019-09-04 05:42:53', '2019-10-16 03:59:53'),
(47, '43', 'Supplier Payment', 'supplierPayment.index', 'fa fa-caret', 41, '1', '2019-09-05 02:43:41', '2019-09-05 02:43:41'),
(48, '43', 'Purchase Return', 'purchaseReturn.index', 'fa fa-caret', 42, '1', '2019-09-06 23:49:00', '2019-09-06 23:49:00'),
(49, NULL, 'Inventory Report', 'admin.index', 'fa fa-bars', 9, '1', '2019-09-07 22:41:33', '2019-10-30 09:47:36'),
(50, '49', 'Purchase Log', 'purchaseLog.index', 'fa fa-caret', 43, '1', '2019-09-07 22:46:41', '2019-09-07 22:46:41'),
(51, '62', 'Supplier Statement', 'supplierStatement.index', 'fa fa-caret', 44, '1', '2019-09-08 03:55:46', '2019-11-03 17:25:25'),
(52, NULL, 'Sales Management', 'admin.index', 'fa fa-bars', 7, '1', '2019-10-13 01:14:42', '2019-10-30 09:46:24'),
(53, '52', 'Cash Sale', 'cashSale.index', 'fa fa-caret', 46, '1', '2019-10-13 02:49:58', '2019-10-13 02:51:01'),
(54, '52', 'Credit Sale', 'creditSale.index', 'fa fa-caret', 47, '1', '2019-10-14 05:39:54', '2019-10-14 05:42:00'),
(55, '13', 'Client Entry', 'clientEntry.index', 'fa fa-bars', 48, '1', '2019-10-14 06:30:55', '2019-10-30 09:49:39'),
(56, '52', 'Credit Collection', 'creditCollection.index', 'fa fa-caret', 49, '1', '2019-10-15 23:47:51', '2019-10-15 23:47:51'),
(57, NULL, 'Sales Report', 'admin.index', 'fa fa-caret', 8, '1', '2019-10-16 23:50:29', '2019-10-30 09:46:58'),
(58, '57', 'Sales History', 'salesHistory.index', 'fa fa-caret', 51, '1', '2019-10-17 00:07:09', '2019-10-17 00:07:09'),
(59, '57', 'Product Wise Sales', 'productWiseSales.index', 'fa fa-caret', 52, '1', '2019-10-17 00:15:53', '2019-10-17 00:15:53'),
(60, '57', 'Client Wise Sales', 'clientWiseSales.index', 'fa fa-caret', 53, '1', '2019-10-17 00:20:05', '2019-10-17 00:20:05'),
(61, NULL, 'Basic Report', 'admin.index', 'fa fa-bars', 4, '1', '2019-10-30 09:43:26', '2019-10-30 09:43:26'),
(62, NULL, 'Procurement Report', 'admin.index', 'fa fa-bars', 6, '1', '2019-10-30 09:45:13', '2019-10-30 09:45:13'),
(63, '62', 'Purchase History', 'purchaseHistory.index', 'fa fa-caret', 1, '1', '2019-10-31 16:31:58', '2019-10-31 16:31:58'),
(64, '62', 'Purchase Return History', 'purchaseReturnHistory.index', 'fa fa-caret', 2, '1', '2019-11-02 10:26:38', '2019-11-02 10:26:38'),
(65, '62', 'Payment Log', 'paymentLog.index', 'fa fa-bars', 3, '1', '2019-11-04 13:27:19', '2019-11-04 13:27:19'),
(66, '62', 'PO Status', 'purchaseOrderStatus.index', 'fa fa-caret', 4, '1', '2019-11-04 14:06:09', '2019-11-05 14:29:09'),
(67, '49', 'Product List', 'productList.index', 'fa fa-bars', 5, '1', '2019-11-05 17:21:20', '2019-11-05 17:21:20'),
(68, '62', 'Supply & Payment Summery', 'supplyPaymentSummery.index', 'fa fa-bars', 6, '1', '2019-11-09 06:26:33', '2019-11-11 14:16:11'),
(69, '57', 'Sales & Collection Outstanding', 'salesCollectionOutstanding.index', 'fa fa-bars', 7, '1', '2019-11-11 14:17:36', '2019-11-11 14:17:36'),
(70, '57', 'Client Statement', 'clientStatement.index', 'fa fa-bars', 8, '1', '2019-11-11 16:17:10', '2019-11-11 16:17:10'),
(71, '49', 'Stock Status Report', 'stockStatusReport.index', 'fa fa-bars', 9, '1', '2019-11-13 17:26:16', '2019-11-13 17:26:16'),
(72, '57', 'Sales Contribution', 'salesContribution.index', 'fa fa-bars', 10, '1', '2019-11-14 10:43:31', '2019-11-14 10:43:31'),
(73, '49', 'Stock Valuation Report', 'stockValuationReport.index', 'fa fa-bars', 11, '1', '2019-11-14 22:43:39', '2019-11-14 22:43:39'),
(74, '49', 'Out Of Stock', 'outOfStockReport.index', 'fa fa-caret', 12, '1', '2019-11-17 12:56:24', '2019-11-17 12:56:24'),
(75, '57', 'Collection History', 'collectionHistory.index', 'fa fa-caret', 13, '1', '2019-11-17 16:29:54', '2019-11-17 16:29:54'),
(76, '57', 'Product Wise Profit', 'productWiseProfit.index', 'fa fa-caret', 14, '1', '2019-11-19 01:12:46', '2019-11-19 01:12:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_menu_actions`
--

CREATE TABLE `user_menu_actions` (
  `id` int(10) UNSIGNED NOT NULL,
  `parentmenuId` int(11) NOT NULL,
  `menuType` int(11) NOT NULL,
  `actionName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionLink` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderBy` int(11) NOT NULL,
  `actionStatus` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_menu_actions`
--

INSERT INTO `user_menu_actions` (`id`, `parentmenuId`, `menuType`, `actionName`, `actionLink`, `orderBy`, `actionStatus`, `created_at`, `updated_at`) VALUES
(4, 15, 1, 'Add', 'categoryadd.page', 1, 1, '2019-09-02 08:09:47', '2019-09-02 08:09:47'),
(5, 15, 7, 'View', 'categories.index', 3, 1, '2019-09-02 10:13:49', '2019-09-02 10:44:44'),
(6, 15, 4, 'Delete', 'category.delete', 4, 1, '2019-09-02 10:25:39', '2019-09-02 10:44:57'),
(7, 15, 2, 'Edit', 'category.edit', 2, 1, '2019-09-02 10:39:20', '2019-09-02 11:51:37'),
(8, 14, 1, 'Add', 'productadd.page', 5, 1, '2019-09-02 11:41:50', '2019-09-02 11:50:43'),
(9, 14, 2, 'Edit', 'product.edit', 6, 1, '2019-09-02 11:48:49', '2019-09-02 11:48:49'),
(10, 42, 1, 'Add', 'cashPurchase.add', 7, 1, '2019-09-02 22:29:50', '2019-09-02 22:29:50'),
(11, 42, 2, 'Edit', 'cashPurchase.edit', 8, 1, '2019-09-03 04:03:09', '2019-09-03 04:03:09'),
(12, 42, 4, 'Delete', 'cashPurchase.delete', 9, 1, '2019-09-03 04:03:26', '2019-09-03 04:03:26'),
(13, 15, 3, 'Status', 'categories.changecategoryStatus', 10, 1, '2019-09-03 04:57:13', '2019-09-03 05:03:17'),
(14, 14, 3, 'Status', 'products.changeStatus', 11, 1, '2019-09-03 05:10:48', '2019-09-03 05:10:48'),
(15, 14, 4, 'Delete', 'single-product-destroy', 12, 1, '2019-09-03 05:11:36', '2019-09-03 05:11:36'),
(16, 16, 1, 'Add', 'chargeadd.page', 13, 1, '2019-09-03 05:18:12', '2019-09-03 05:18:12'),
(17, 16, 3, 'Status', 'shippingCharge.shippingChargeStatus', 14, 1, '2019-09-03 05:18:33', '2019-09-03 05:18:33'),
(18, 16, 2, 'Edit', 'shippingCharge.edit', 15, 1, '2019-09-03 05:18:51', '2019-09-03 05:18:51'),
(19, 16, 4, 'Delete', 'shippingCharge.delete', 16, 1, '2019-09-03 05:19:21', '2019-09-03 05:19:21'),
(20, 17, 1, 'Add', 'customerGroup.add', 17, 1, '2019-09-03 10:38:15', '2019-09-03 10:38:15'),
(21, 17, 3, 'Status', 'customerGroup.status', 18, 1, '2019-09-03 10:39:02', '2019-09-03 10:39:02'),
(22, 17, 2, 'Edit', 'customerGroup.edit', 19, 1, '2019-09-03 10:39:43', '2019-09-03 10:42:25'),
(23, 17, 4, 'Delete', 'customerGroup.delete', 20, 1, '2019-09-03 10:40:20', '2019-09-03 10:40:20'),
(24, 20, 1, 'Add', 'menuadd.page', 21, 1, '2019-09-03 10:48:02', '2019-09-03 10:48:02'),
(25, 20, 3, 'Status', 'menu.changeStatus', 22, 1, '2019-09-03 10:48:43', '2019-09-03 10:48:43'),
(26, 20, 2, 'Edit', 'menu.edit', 23, 1, '2019-09-03 10:49:08', '2019-09-03 10:49:08'),
(27, 20, 4, 'Delete', 'menu.delete', 24, 1, '2019-09-03 10:49:40', '2019-09-03 10:49:40'),
(28, 21, 1, 'Add', 'slideradd.page', 25, 1, '2019-09-03 10:50:35', '2019-09-03 10:50:35'),
(29, 21, 3, 'Status', 'sliders.changeStatus', 26, 1, '2019-09-03 10:52:05', '2019-09-03 10:52:05'),
(34, 21, 2, 'Edit', 'slider.edit', 27, 1, '2019-09-03 10:58:11', '2019-09-03 10:58:11'),
(35, 21, 4, 'Delete', 'slider.delete', 28, 1, '2019-09-03 10:58:58', '2019-09-03 10:58:58'),
(36, 23, 1, 'Add', 'policyadd.page', 29, 1, '2019-09-03 11:02:42', '2019-09-03 11:02:42'),
(37, 23, 3, 'Status', 'policies.changepolicyStatus', 30, 1, '2019-09-03 11:02:57', '2019-09-03 11:02:57'),
(38, 23, 2, 'Edit', 'policy.edit', 31, 1, '2019-09-03 11:03:21', '2019-09-03 11:03:21'),
(39, 23, 4, 'Delete', 'policy.delete', 32, 1, '2019-09-03 11:03:41', '2019-09-03 11:03:41'),
(40, 22, 1, 'Add', 'banneradd.page', 33, 1, '2019-09-03 11:05:02', '2019-09-03 11:05:02'),
(41, 22, 3, 'Status', 'banners.changebannerStatus', 34, 1, '2019-09-03 11:05:16', '2019-09-03 11:05:16'),
(42, 22, 2, 'Edit', 'banner.edit', 35, 1, '2019-09-03 11:05:32', '2019-09-03 11:05:32'),
(43, 22, 4, 'Delete', 'banner.delete', 36, 1, '2019-09-03 11:05:58', '2019-09-03 11:05:58'),
(44, 28, 3, 'Status', 'reviews.changereviewStatus', 37, 1, '2019-09-03 11:12:16', '2019-09-03 11:12:16'),
(45, 27, 1, 'Add', 'faqadd.page', 38, 1, '2019-09-03 11:13:47', '2019-09-03 11:13:47'),
(46, 27, 1, 'Add', 'faqadd.page', 38, 1, '2019-09-03 11:13:48', '2019-09-03 11:13:48'),
(47, 27, 3, 'Status', 'faqs.changeStatus', 39, 1, '2019-09-03 11:14:02', '2019-09-03 11:14:02'),
(48, 27, 2, 'Edit', 'faq.edit', 40, 1, '2019-09-03 11:14:16', '2019-09-03 11:14:16'),
(49, 27, 4, 'Delete', 'faq.delete', 41, 1, '2019-09-03 11:14:40', '2019-09-03 11:14:40'),
(50, 32, 1, 'Add', 'blogadd.page', 42, 1, '2019-09-03 11:15:50', '2019-09-03 11:16:13'),
(51, 32, 3, 'Status', 'blogs.changeblogStatus', 43, 1, '2019-09-03 11:16:35', '2019-09-03 11:16:35'),
(52, 32, 2, 'Edit', 'blog.edit', 44, 1, '2019-09-03 11:16:52', '2019-09-03 11:16:52'),
(53, 32, 4, 'Delete', 'blog.delete', 45, 1, '2019-09-03 11:17:11', '2019-09-03 11:17:11'),
(54, 12, 8, 'View Customer Details', 'customer.customerDetails', 46, 1, '2019-09-03 11:19:00', '2019-10-30 10:27:03'),
(55, 38, 1, 'Add', 'usermenu.add', 47, 1, '2019-09-03 11:19:40', '2019-09-03 11:19:40'),
(56, 38, 2, 'Edit', 'usermenu.edit', 48, 1, '2019-09-03 11:19:55', '2019-09-03 11:19:55'),
(57, 38, 3, 'Status', 'usermenu.status', 49, 1, '2019-09-03 11:20:21', '2019-09-03 11:20:21'),
(58, 38, 4, 'Delete', 'usermenu-delete', 51, 1, '2019-09-03 11:20:37', '2019-09-06 09:25:44'),
(59, 40, 1, 'Add', 'useradd.page', 51, 1, '2019-09-03 11:23:08', '2019-09-03 11:23:08'),
(60, 40, 3, 'Status', 'user.changeuserStatus', 52, 1, '2019-09-03 11:23:26', '2019-09-03 11:23:26'),
(61, 40, 2, 'Edit', 'user.edit', 53, 1, '2019-09-03 11:23:47', '2019-09-03 11:23:47'),
(62, 40, 6, 'Change Password', 'user.password', 54, 1, '2019-09-03 11:24:12', '2019-09-03 11:24:12'),
(63, 40, 7, 'View', 'user.profile', 55, 0, '2019-09-03 11:24:50', '2019-09-06 09:31:03'),
(64, 39, 1, 'Add', 'userRoleAdd.page', 56, 1, '2019-09-03 11:25:46', '2019-09-03 11:25:46'),
(65, 39, 3, 'Status', 'userRole.changeuserRoleStatus', 57, 1, '2019-09-03 11:26:03', '2019-09-03 11:26:03'),
(66, 39, 2, 'Edit', 'userRole.edit', 58, 1, '2019-09-03 11:26:24', '2019-09-03 11:26:24'),
(67, 39, 5, 'Permission', 'userRole.permission', 59, 1, '2019-09-03 11:26:59', '2019-09-03 11:26:59'),
(68, 41, 1, 'Add', 'vendor-add', 60, 1, '2019-09-03 11:27:57', '2019-09-03 11:27:57'),
(69, 41, 2, 'Edit', 'vendor.edit', 61, 1, '2019-09-03 11:28:10', '2019-09-03 11:28:10'),
(70, 41, 3, 'Status', 'vendor.status', 62, 1, '2019-09-03 11:28:27', '2019-09-03 11:28:27'),
(71, 41, 4, 'Delete', 'vendor-delete', 63, 1, '2019-09-03 11:28:50', '2019-09-03 11:28:50'),
(72, 44, 1, 'Add', 'creditPurchase.add', 1, 1, '2019-09-03 22:25:29', '2019-09-03 22:25:29'),
(73, 44, 2, 'Edit', 'creditPurchase.edit', 2, 1, '2019-09-03 22:25:46', '2019-09-03 22:25:46'),
(74, 44, 3, 'Status', 'creditPurchase.status', 3, 1, '2019-09-03 22:26:08', '2019-09-03 22:26:08'),
(75, 44, 4, 'Delete', 'creditPurchase.destroy', 4, 1, '2019-09-03 22:26:48', '2019-09-03 22:27:02'),
(76, 45, 1, 'Add', 'purchaseOrder.add', 64, 1, '2019-09-04 03:37:02', '2019-09-04 03:37:02'),
(77, 45, 2, 'Edit', 'purchaseOrder.edit', 65, 1, '2019-09-04 03:37:12', '2019-09-04 03:37:12'),
(78, 45, 4, 'Cancel', 'purchaseOrder.destroy', 67, 1, '2019-09-04 03:37:28', '2019-09-04 05:10:12'),
(79, 45, 8, 'View', 'purchaseOrder.view', 66, 1, '2019-09-04 05:09:34', '2019-09-04 05:09:34'),
(80, 46, 1, 'Add', 'purchaseOrderReceive.add', 68, 1, '2019-09-04 05:44:04', '2019-09-04 05:44:04'),
(81, 46, 2, 'Edit', 'purchaseOrderReceive.edit', 69, 1, '2019-09-04 05:44:16', '2019-09-04 05:44:16'),
(82, 46, 4, 'Delete', 'purchaseOrderReceive.delete', 70, 1, '2019-09-04 05:44:45', '2019-09-04 05:44:45'),
(83, 47, 1, 'Add', 'supplierPayment.add', 71, 1, '2019-09-05 02:45:15', '2019-09-05 02:45:15'),
(84, 47, 2, 'Edit', 'supplierPayment.edit', 72, 1, '2019-09-05 02:45:27', '2019-09-05 02:45:27'),
(85, 47, 4, 'Delete', 'supplierPayment.delete', 73, 1, '2019-09-05 02:46:24', '2019-09-05 02:46:24'),
(86, 38, 8, 'View Action Menu', 'usermenuLink.index', 50, 1, '2019-09-06 09:26:39', '2019-09-06 09:26:39'),
(87, 39, 4, 'Delete User Role', 'userRole.delete', 60, 1, '2019-09-06 09:29:36', '2019-09-06 09:30:18'),
(88, 40, 4, 'Delete User', 'user.delete', 56, 1, '2019-09-06 09:31:27', '2019-09-06 09:31:27'),
(89, 34, 4, 'Delete', 'subscriber.delete', 74, 1, '2019-09-06 09:36:56', '2019-09-06 09:36:56'),
(90, 7, 9, 'Order Shipping Status', 'order.new', 1, 1, '2019-09-06 10:54:38', '2019-09-06 10:54:38'),
(91, 7, 10, 'Product List', 'list.product', 2, 1, '2019-09-06 10:56:53', '2019-09-06 10:56:53'),
(92, 7, 8, 'View Invoice', 'view.invoices', 3, 1, '2019-09-06 10:57:49', '2019-09-06 10:57:49'),
(93, 7, 4, 'Delete Pending Order', 'order.delete', 4, 1, '2019-09-06 10:58:40', '2019-09-06 11:07:40'),
(94, 8, 9, 'Order Shipping Status', 'order.new', 1, 1, '2019-09-06 11:01:30', '2019-09-06 11:01:30'),
(95, 8, 10, 'Product List', 'list.product', 2, 1, '2019-09-06 11:01:51', '2019-09-06 11:01:51'),
(96, 8, 8, 'View Invoice', 'view.invoices', 3, 1, '2019-09-06 11:02:10', '2019-09-06 11:02:10'),
(97, 8, 4, 'Delete Processing Order', 'order.delete', 4, 1, '2019-09-06 11:02:50', '2019-09-06 11:02:50'),
(98, 10, 9, 'Order Shipping Status', 'order.new', 1, 1, '2019-09-06 11:03:49', '2019-09-06 11:03:49'),
(99, 10, 10, 'Product List', 'list.product', 2, 1, '2019-09-06 11:04:18', '2019-09-06 11:04:18'),
(100, 10, 8, 'View Invoice', 'view.invoices', 3, 1, '2019-09-06 11:04:37', '2019-09-06 11:04:37'),
(101, 10, 4, 'Delete Shipping Order', 'order.delete', 4, 1, '2019-09-06 11:05:11', '2019-09-06 11:05:11'),
(102, 11, 9, 'Order Shipping Status', 'order.new', 1, 1, '2019-09-06 11:06:08', '2019-09-06 11:06:08'),
(103, 11, 10, 'Product List', 'list.product', 2, 1, '2019-09-06 11:06:32', '2019-09-06 11:06:32'),
(104, 11, 8, 'View Invoice', 'view.invoices', 3, 1, '2019-09-06 11:06:50', '2019-09-06 11:06:50'),
(105, 11, 4, 'Delete Complete Order', 'order.delete', 4, 1, '2019-09-06 11:07:19', '2019-09-06 11:07:19'),
(106, 12, 4, 'Delete Customer', 'customer.delete', 47, 1, '2019-09-06 11:17:38', '2019-09-06 11:17:38'),
(107, 48, 1, 'Add', 'purchaseReturn.add', 1, 1, '2019-09-06 23:52:51', '2019-09-06 23:52:51'),
(108, 48, 2, 'Edit', 'purchaseReturn.edit', 2, 1, '2019-09-07 00:05:17', '2019-09-07 00:05:17'),
(109, 48, 4, 'Delete Purchase Return', 'purchaseReturn.delete', 3, 1, '2019-09-07 00:05:38', '2019-09-07 00:05:38'),
(110, 51, 11, 'View PDF', 'supplierStatement.prints', 75, 1, '2019-09-08 04:33:19', '2019-09-08 04:33:19'),
(111, 50, 11, 'Print Purchase Log', 'purchaseLog.print', 1, 1, '2019-09-09 01:45:43', '2019-09-09 02:55:22'),
(112, 53, 1, 'Add', 'cashSale.add', 76, 1, '2019-10-13 04:07:49', '2019-10-13 04:07:49'),
(113, 53, 2, 'Edit', 'cashSale.edit', 77, 1, '2019-10-14 03:21:02', '2019-10-14 03:21:02'),
(114, 53, 4, 'Delete', 'cashSale.destroy', 78, 1, '2019-10-14 03:21:49', '2019-10-14 03:21:49'),
(115, 54, 1, 'Add', 'creditSale.add', 79, 1, '2019-10-14 05:42:47', '2019-10-14 05:42:47'),
(116, 54, 2, 'Edit', 'creditSale.edit', 80, 1, '2019-10-14 05:43:07', '2019-10-14 05:43:07'),
(117, 54, 4, 'Delete', 'creditSale.destroy', 81, 1, '2019-10-14 05:43:22', '2019-10-14 05:43:22'),
(118, 55, 1, 'Add', 'clientEntry.add', 82, 1, '2019-10-14 06:33:32', '2019-10-14 06:33:32'),
(119, 55, 2, 'Edit', 'clientEntry.edit', 83, 1, '2019-10-14 06:33:45', '2019-10-14 06:33:45'),
(120, 55, 4, 'Delete', 'clientEntry.destroy', 85, 1, '2019-10-14 06:34:01', '2019-10-30 10:18:36'),
(121, 56, 1, 'Add', 'creditCollection.add', 85, 1, '2019-10-15 23:48:28', '2019-10-15 23:48:28'),
(122, 56, 2, 'Edit', 'creditCollection.edit', 86, 1, '2019-10-15 23:48:48', '2019-10-15 23:48:48'),
(123, 56, 4, 'Delete', 'creditCollection.destroy', 87, 1, '2019-10-15 23:49:07', '2019-10-15 23:49:07'),
(124, 58, 11, 'Print Sales History', 'salesHistory.prints', 88, 1, '2019-10-17 00:43:03', '2019-10-17 00:43:03'),
(125, 59, 11, 'Print Product Wise Sales', 'productWiseSales.prints', 89, 1, '2019-10-17 00:43:58', '2019-10-17 00:43:58'),
(126, 60, 11, 'Print Client Wise Sales', 'clientWiseSales.prints', 90, 1, '2019-10-17 00:44:37', '2019-10-17 00:44:37'),
(128, 63, 11, 'Print Purchase History', 'purchaseHistory.print', 91, 1, '2019-10-31 16:32:57', '2019-10-31 16:32:57'),
(129, 64, 11, 'Print Purchase Return History', 'purchaseReturnHistory.print', 92, 1, '2019-11-02 10:27:18', '2019-11-02 10:27:18'),
(130, 65, 11, 'Print Payment Log', 'paymentLog.print', 93, 1, '2019-11-04 13:28:46', '2019-11-04 13:28:46'),
(131, 66, 11, 'Print PO Status', 'purchaseOrderStatus.print', 94, 1, '2019-11-04 14:07:20', '2019-11-05 14:28:33'),
(132, 67, 11, 'Print Product List', 'productList.print', 95, 1, '2019-11-05 17:22:04', '2019-11-05 17:22:04'),
(133, 68, 11, 'Print Supply & Payment Summery', 'supplyPaymentSummery.print', 96, 1, '2019-11-09 06:29:38', '2019-11-11 14:16:54'),
(134, 69, 11, 'Print Sales & Collection Standings', 'salesCollectionOutstanding.print', 97, 1, '2019-11-11 14:18:45', '2019-11-11 14:18:45'),
(135, 70, 11, 'Print Client Statement', 'clientStatement.print', 98, 1, '2019-11-11 16:17:50', '2019-11-11 16:17:50'),
(136, 71, 11, 'Print Stock Status Report', 'stockStatusReport.print', 99, 1, '2019-11-13 17:27:04', '2019-11-13 17:27:04'),
(137, 72, 11, 'Print Sales Contribution', 'salesContribution.print', 100, 1, '2019-11-14 10:44:23', '2019-11-14 10:44:23'),
(138, 73, 11, 'Print Stock Valuation Report', 'stockValuationReport.print', 101, 1, '2019-11-14 22:44:37', '2019-11-14 22:44:37'),
(139, 74, 11, 'Print Out Of Stock', 'outOfStockReport.print', 102, 1, '2019-11-17 12:57:14', '2019-11-17 12:57:14'),
(140, 75, 11, 'Print Collection History', 'collectionHistory.print', 103, 1, '2019-11-17 16:30:37', '2019-11-17 16:30:37'),
(141, 76, 11, 'Print Product Wise Profit', 'productWiseProfit.print', 104, 1, '2019-11-19 01:13:47', '2019-11-19 01:13:47'),
(142, 28, 8, 'View Details', 'review.reviewDetails', 1, 1, '2020-02-06 05:41:12', '2020-02-06 05:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `permission` text COLLATE utf8mb4_unicode_ci,
  `actionPermission` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `status`, `permission`, `actionPermission`, `created_at`, `updated_at`) VALUES
(2, 'Super User', 1, '3,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76', '90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,54,106,8,9,14,15,4,7,5,6,13,16,17,18,19,20,21,22,23,24,25,26,27,28,29,34,35,40,41,42,43,36,37,38,39,45,46,47,48,49,142,44,50,51,52,53,89,55,56,57,86,58,64,65,66,67,87,59,60,61,62,88,68,69,70,71,10,11,12,72,73,74,75,76,77,79,78,80,81,82,83,84,85,107,108,109,111,110,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,128,129,130,131,132,133,134,135,136,137,138,139,140,141', '2019-04-17 00:50:05', '2020-02-06 05:41:38'),
(3, 'Admin', 1, '3,6,7,8,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35', NULL, '2019-04-17 00:52:54', '2019-08-30 23:02:44');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `vendor_serial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendorName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contactPerson` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendorAddress` text COLLATE utf8mb4_unicode_ci,
  `vendorPhone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendorEmail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accountCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderBy` int(11) NOT NULL,
  `vendorStatus` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `vendor_serial`, `vendorName`, `contactPerson`, `vendorAddress`, `vendorPhone`, `vendorEmail`, `accountCode`, `orderBy`, `vendorStatus`, `created_at`, `updated_at`) VALUES
(0, '123', 'SR Enterprise', 'Rakib Hasan', NULL, '01567568568', NULL, NULL, 1, 1, '2020-01-22 17:37:35', '2020-01-22 17:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `verify_customers`
--

CREATE TABLE `verify_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `gender` text COLLATE utf8mb4_unicode_ci,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmPassword` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `verifyCode` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `client_statement_report`
--
DROP TABLE IF EXISTS `client_statement_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_statement_report`  AS  select `nakshighor`.`credit_sales`.`customer_id` AS `customerId`,`nakshighor`.`credit_sales`.`payment_type` AS `type`,`nakshighor`.`credit_sales`.`invoice_date` AS `date`,`nakshighor`.`credit_sales`.`net_amount` AS `sales`,0 AS `collection`,0 AS `others` from `nakshighor`.`credit_sales` union all select `nakshighor`.`credit_collections`.`client_id` AS `customerId`,'Collection' AS `type`,`nakshighor`.`credit_collections`.`payment_date` AS `date`,0 AS `sales`,`nakshighor`.`credit_collections`.`payment_amount` AS `collection`,0 AS `others` from `nakshighor`.`credit_collections` order by `type`,`customerId` ;

-- --------------------------------------------------------

--
-- Structure for view `product_wise_profit`
--
DROP TABLE IF EXISTS `product_wise_profit`;

CREATE ALGORITHM=UNDEFINED DEFINER=`nakshighor`@`localhost` SQL SECURITY DEFINER VIEW `product_wise_profit`  AS  select `nakshighor`.`cash_sales`.`invoice_date` AS `date`,`nakshighor`.`products`.`id` AS `productId`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`cash_sale_items`.`item_quantity` AS `cashProductQty`,`nakshighor`.`cash_sale_items`.`item_price` AS `cashPriceAmount`,((`nakshighor`.`cash_sale_items`.`item_price` * 4.5) / 100) AS `cashVatAmount`,((`nakshighor`.`cash_sale_items`.`item_price` * `nakshighor`.`cash_sales`.`discount_as`) / 100) AS `cashDiscountAmount`,0 AS `creditProductQty`,0 AS `creditPriceAmount`,0 AS `creditVatAmount`,0 AS `creditDiscountAmount` from ((`nakshighor`.`cash_sales` join `nakshighor`.`cash_sale_items` on((`nakshighor`.`cash_sale_items`.`cash_sale_id` = `nakshighor`.`cash_sales`.`id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`cash_sale_items`.`item_id`))) union all select `nakshighor`.`credit_sales`.`invoice_date` AS `date`,`nakshighor`.`products`.`id` AS `productId`,`nakshighor`.`products`.`category_id` AS `categoryId`,0 AS `cashProductQty`,0 AS `cashPriceAmount`,0 AS `cashVatAmount`,0 AS `cashDiscountAmount`,`nakshighor`.`credit_sale_items`.`item_quantity` AS `creditProductQty`,`nakshighor`.`credit_sale_items`.`item_price` AS `creditPriceAmount`,((`nakshighor`.`credit_sale_items`.`item_price` * 4.5) / 100) AS `creditVatAmount`,((`nakshighor`.`credit_sale_items`.`item_price` * `nakshighor`.`credit_sales`.`discount_as`) / 100) AS `creditDiscountAmount` from ((`nakshighor`.`credit_sales` join `nakshighor`.`credit_sale_items` on((`nakshighor`.`credit_sale_items`.`credit_sale_id` = `nakshighor`.`credit_sales`.`id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`credit_sale_items`.`item_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `purchase_order_status`
--
DROP TABLE IF EXISTS `purchase_order_status`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `purchase_order_status`  AS  select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,`nakshighor`.`purchase_orders`.`order_no` AS `orderNo`,`nakshighor`.`purchase_orders`.`order_date` AS `date`,`nakshighor`.`purchase_order_items`.`product_id` AS `productId`,`nakshighor`.`purchase_order_items`.`qty` AS `orderQty`,0 AS `receiveQty` from (`nakshighor`.`purchase_orders` join `nakshighor`.`purchase_order_items` on((`nakshighor`.`purchase_order_items`.`purchase_order_id` = `nakshighor`.`purchase_orders`.`id`))) union all select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,`nakshighor`.`purchase_orders`.`order_no` AS `orderNo`,`nakshighor`.`purchase_orders`.`order_date` AS `date`,`nakshighor`.`purchase_order_receive_items`.`product_id` AS `productId`,0 AS `orderQty`,`nakshighor`.`purchase_order_receive_items`.`qty` AS `receiveQty` from ((`nakshighor`.`purchase_order_receives` join `nakshighor`.`purchase_order_receive_items` on((`nakshighor`.`purchase_order_receive_items`.`purchase_order_receive_id` = `nakshighor`.`purchase_order_receives`.`id`))) join `nakshighor`.`purchase_orders` on((`nakshighor`.`purchase_orders`.`id` = `nakshighor`.`purchase_order_receives`.`purchaseOrderNo`))) ;

-- --------------------------------------------------------

--
-- Structure for view `sales_collection_standings`
--
DROP TABLE IF EXISTS `sales_collection_standings`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_collection_standings`  AS  select `nakshighor`.`credit_sales`.`customer_id` AS `customerId`,`nakshighor`.`credit_sales`.`payment_type` AS `type`,`nakshighor`.`credit_sales`.`invoice_date` AS `date`,`nakshighor`.`credit_sales`.`net_amount` AS `sales`,0 AS `collection` from `nakshighor`.`credit_sales` union all select `nakshighor`.`credit_collections`.`client_id` AS `customerId`,'Collection' AS `type`,`nakshighor`.`credit_collections`.`payment_date` AS `date`,0 AS `sales`,`nakshighor`.`credit_collections`.`payment_amount` AS `collection` from `nakshighor`.`credit_collections` order by `type`,`customerId` ;

-- --------------------------------------------------------

--
-- Structure for view `sales_contribution`
--
DROP TABLE IF EXISTS `sales_contribution`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_contribution`  AS  select `nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`cash_sale_items`.`item_id` AS `productId`,sum(`nakshighor`.`cash_sale_items`.`item_quantity`) AS `cashSaleQty`,sum(`nakshighor`.`cash_sale_items`.`item_price`) AS `cashSaleAmount`,0 AS `creditSaleQty`,0 AS `creditSaleAmount` from (`nakshighor`.`cash_sale_items` join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`cash_sale_items`.`item_id`))) group by `nakshighor`.`cash_sale_items`.`item_id` union all select `nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`credit_sale_items`.`item_id` AS `productId`,0 AS `cashSaleQty`,0 AS `cashSaleAmount`,sum(`nakshighor`.`credit_sale_items`.`item_quantity`) AS `creditSaleQty`,sum(`nakshighor`.`credit_sale_items`.`item_price`) AS `creditSaleAmount` from (`nakshighor`.`credit_sale_items` join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`credit_sale_items`.`item_id`))) group by `nakshighor`.`credit_sale_items`.`item_id` ;

-- --------------------------------------------------------

--
-- Structure for view `stock_status_report`
--
DROP TABLE IF EXISTS `stock_status_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_status_report`  AS  select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,`nakshighor`.`purchase_order_receives`.`receive_date` AS `date`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`purchase_order_receive_items`.`product_id` AS `productId`,`nakshighor`.`purchase_order_receive_items`.`qty` AS `receiveQty`,`nakshighor`.`purchase_order_receive_items`.`amount` AS `receiveAmount`,0 AS `cashSaleQty`,0 AS `creditSaleQty` from (((`nakshighor`.`purchase_orders` join `nakshighor`.`purchase_order_receives` on((`nakshighor`.`purchase_order_receives`.`purchaseOrderNo` = `nakshighor`.`purchase_orders`.`id`))) join `nakshighor`.`purchase_order_receive_items` on((`nakshighor`.`purchase_order_receive_items`.`purchase_order_receive_id` = `nakshighor`.`purchase_order_receives`.`id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`purchase_order_receive_items`.`product_id`))) union all select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,`nakshighor`.`cash_sales`.`invoice_date` AS `date`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`cash_sale_items`.`item_id` AS `productId`,0 AS `receiveQty`,0 AS `receiveAmount`,`nakshighor`.`cash_sale_items`.`item_quantity` AS `cashSaleQty`,0 AS `creditSaleQty` from (((((`nakshighor`.`purchase_orders` join `nakshighor`.`purchase_order_receives` on((`nakshighor`.`purchase_order_receives`.`purchaseOrderNo` = `nakshighor`.`purchase_orders`.`id`))) join `nakshighor`.`purchase_order_receive_items` on((`nakshighor`.`purchase_order_receive_items`.`purchase_order_receive_id` = `nakshighor`.`purchase_order_receives`.`id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`purchase_order_receive_items`.`product_id`))) join `nakshighor`.`cash_sale_items` on((`nakshighor`.`cash_sale_items`.`item_id` = `nakshighor`.`purchase_order_receive_items`.`product_id`))) join `nakshighor`.`cash_sales` on((`nakshighor`.`cash_sales`.`id` = `nakshighor`.`cash_sale_items`.`cash_sale_id`))) group by `nakshighor`.`purchase_orders`.`supplier_id`,`nakshighor`.`cash_sales`.`invoice_date`,`nakshighor`.`products`.`category_id`,`nakshighor`.`cash_sale_items`.`item_id` union all select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,`nakshighor`.`credit_sales`.`invoice_date` AS `date`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`credit_sale_items`.`item_id` AS `productId`,0 AS `receiveQty`,0 AS `receiveAmount`,0 AS `cashSaleQty`,`nakshighor`.`credit_sale_items`.`item_quantity` AS `creditSaleQty` from (((((`nakshighor`.`purchase_orders` join `nakshighor`.`purchase_order_receives` on((`nakshighor`.`purchase_order_receives`.`purchaseOrderNo` = `nakshighor`.`purchase_orders`.`id`))) join `nakshighor`.`purchase_order_receive_items` on((`nakshighor`.`purchase_order_receive_items`.`purchase_order_receive_id` = `nakshighor`.`purchase_order_receives`.`id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`purchase_order_receive_items`.`product_id`))) join `nakshighor`.`credit_sale_items` on((`nakshighor`.`credit_sale_items`.`item_id` = `nakshighor`.`purchase_order_receive_items`.`product_id`))) join `nakshighor`.`credit_sales` on((`nakshighor`.`credit_sales`.`id` = `nakshighor`.`credit_sale_items`.`credit_sale_id`))) group by `nakshighor`.`purchase_orders`.`supplier_id`,`nakshighor`.`credit_sales`.`invoice_date`,`nakshighor`.`products`.`category_id`,`nakshighor`.`credit_sale_items`.`item_id` ;

-- --------------------------------------------------------

--
-- Structure for view `stock_valuation_report`
--
DROP TABLE IF EXISTS `stock_valuation_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stock_valuation_report`  AS  select `nakshighor`.`cash_purchase`.`supplier_id` AS `supplierId`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`cash_purchase_item`.`product_id` AS `productId`,`nakshighor`.`cash_purchase_item`.`qty` AS `cashPurchaseQty`,`nakshighor`.`cash_purchase_item`.`amount` AS `cashPurchaseAmount`,0 AS `creditPurchaseQty`,0 AS `creditPurchaseAmount`,0 AS `purchaseReturnQty`,0 AS `purchaseReturnAmount`,0 AS `cashSaleQty`,0 AS `cashSaleAmount`,0 AS `creditSaleQty`,0 AS `creditSaleAmount`,0 AS `salesReturnQty` from ((`nakshighor`.`cash_purchase_item` join `nakshighor`.`cash_purchase` on((`nakshighor`.`cash_purchase`.`id` = `nakshighor`.`cash_purchase_item`.`cash_puchase_id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`cash_purchase_item`.`product_id`))) union all select `nakshighor`.`credit_purchases`.`supplier_id` AS `supplierId`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`credit_purchase_items`.`product_id` AS `productId`,0 AS `cashPurchaseQty`,0 AS `cashPurchaseAmount`,`nakshighor`.`credit_purchase_items`.`qty` AS `creditPurchaseQty`,`nakshighor`.`credit_purchase_items`.`amount` AS `creditPurchaseAmount`,0 AS `purchaseReturnQty`,0 AS `purchaseReturnAmount`,0 AS `cashSaleQty`,0 AS `cashSaleAmount`,0 AS `creditSaleQty`,0 AS `creditSaleAmount`,0 AS `salesReturnQty` from ((`nakshighor`.`credit_purchase_items` join `nakshighor`.`credit_purchases` on((`nakshighor`.`credit_purchases`.`id` = `nakshighor`.`credit_purchase_items`.`credit_puchase_id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`credit_purchase_items`.`product_id`))) union all select `nakshighor`.`purchase_returns`.`supplier_id` AS `supplierId`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`purchase_return_items`.`product_id` AS `productId`,0 AS `cashPurchaseQty`,0 AS `cashPurchaseAmount`,0 AS `creditPurchaseQty`,0 AS `creditPurchaseAmount`,`nakshighor`.`purchase_return_items`.`qty` AS `purchaseReturnQty`,`nakshighor`.`purchase_return_items`.`amount` AS `purchaseReturnAmount`,0 AS `cashSaleQty`,0 AS `cashSaleAmount`,0 AS `creditSaleQty`,0 AS `creditSaleAmount`,0 AS `salesReturnQty` from ((`nakshighor`.`purchase_return_items` join `nakshighor`.`purchase_returns` on((`nakshighor`.`purchase_returns`.`id` = `nakshighor`.`purchase_return_items`.`purchase_return_id`))) join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`purchase_return_items`.`product_id`))) union all select 0 AS `supplierId`,`nakshighor`.`products`.`category_id` AS `categoryId`,`nakshighor`.`cash_sale_items`.`item_id` AS `productId`,0 AS `cashPurchaseQty`,0 AS `cashPurchaseAmount`,0 AS `creditPurchaseQty`,0 AS `creditPurchaseAmount`,0 AS `purchaseReturnQty`,0 AS `purchaseReturnAmount`,`nakshighor`.`cash_sale_items`.`item_quantity` AS `cashSaleQty`,`nakshighor`.`cash_sale_items`.`item_price` AS `cashSaleAmount`,0 AS `creditSaleQty`,0 AS `creditSaleAmount`,0 AS `salesReturnQty` from (`nakshighor`.`cash_sale_items` join `nakshighor`.`products` on((`nakshighor`.`products`.`id` = `nakshighor`.`cash_sale_items`.`item_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `supplier_statement_report`
--
DROP TABLE IF EXISTS `supplier_statement_report`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supplier_statement_report`  AS  select `nakshighor`.`credit_purchases`.`type` AS `type`,`nakshighor`.`credit_purchases`.`voucher_date` AS `date`,sum(`nakshighor`.`credit_purchases`.`total_amount`) AS `lifting`,0 AS `payment`,0 AS `others`,`nakshighor`.`credit_purchases`.`supplier_id` AS `vendorId` from `nakshighor`.`credit_purchases` group by `nakshighor`.`credit_purchases`.`voucher_date`,`nakshighor`.`credit_purchases`.`supplier_id`,`nakshighor`.`credit_purchases`.`type` union select `nakshighor`.`cash_purchase`.`type` AS `type`,`nakshighor`.`cash_purchase`.`voucher_date` AS `date`,sum(`nakshighor`.`cash_purchase`.`total_amount`) AS `lifting`,0 AS `payment`,0 AS `others`,`nakshighor`.`cash_purchase`.`supplier_id` AS `vendorId` from `nakshighor`.`cash_purchase` group by `nakshighor`.`cash_purchase`.`voucher_date`,`nakshighor`.`cash_purchase`.`supplier_id`,`nakshighor`.`cash_purchase`.`type` union select `nakshighor`.`supplier_payments`.`payment_type` AS `type`,`nakshighor`.`supplier_payments`.`payment_date` AS `date`,0 AS `lifting`,sum(`nakshighor`.`supplier_payments`.`payment_now`) AS `payment`,0 AS `others`,`nakshighor`.`supplier_payments`.`supplier_id` AS `vendorId` from `nakshighor`.`supplier_payments` group by `nakshighor`.`supplier_payments`.`payment_date`,`nakshighor`.`supplier_payments`.`supplier_id`,`nakshighor`.`supplier_payments`.`payment_type` union select '' AS `type`,`nakshighor`.`purchase_returns`.`purchase_return_date` AS `date`,0 AS `lifting`,0 AS `payment`,sum(`nakshighor`.`purchase_returns`.`total_amount`) AS `others`,`nakshighor`.`purchase_returns`.`supplier_id` AS `vendorId` from `nakshighor`.`purchase_returns` group by `nakshighor`.`purchase_returns`.`purchase_return_date`,`nakshighor`.`purchase_returns`.`supplier_id` order by `date` ;

-- --------------------------------------------------------

--
-- Structure for view `supply_payment_summery`
--
DROP TABLE IF EXISTS `supply_payment_summery`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `supply_payment_summery`  AS  select `nakshighor`.`cash_purchase`.`supplier_id` AS `supplierId`,`nakshighor`.`cash_purchase`.`type` AS `type`,`nakshighor`.`cash_purchase`.`voucher_date` AS `date`,`nakshighor`.`cash_purchase`.`total_amount` AS `purchase`,`nakshighor`.`cash_purchase`.`total_amount` AS `payment` from `nakshighor`.`cash_purchase` union all select `nakshighor`.`credit_purchases`.`supplier_id` AS `supplierId`,`nakshighor`.`credit_purchases`.`type` AS `type`,`nakshighor`.`credit_purchases`.`voucher_date` AS `date`,`nakshighor`.`credit_purchases`.`total_amount` AS `purchase`,0 AS `payment` from `nakshighor`.`credit_purchases` union all select `nakshighor`.`purchase_orders`.`supplier_id` AS `supplierId`,'Order Receive' AS `type`,`nakshighor`.`purchase_order_receives`.`receive_date` AS `date`,`nakshighor`.`purchase_order_receives`.`total_amount` AS `purchase`,0 AS `payment` from (`nakshighor`.`purchase_orders` join `nakshighor`.`purchase_order_receives` on((`nakshighor`.`purchase_order_receives`.`purchaseOrderNo` = `nakshighor`.`purchase_orders`.`id`))) union all select `nakshighor`.`supplier_payments`.`supplier_id` AS `supplierId`,'Payment' AS `type`,`nakshighor`.`supplier_payments`.`payment_date` AS `date`,0 AS `purchase`,`nakshighor`.`supplier_payments`.`payment_now` AS `payment` from `nakshighor`.`supplier_payments` order by `type`,`supplierId` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `careers`
--
ALTER TABLE `careers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_purchase`
--
ALTER TABLE `cash_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_purchase_item`
--
ALTER TABLE `cash_purchase_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_sales`
--
ALTER TABLE `cash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cash_sale_items`
--
ALTER TABLE `cash_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkouts`
--
ALTER TABLE `checkouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_entries`
--
ALTER TABLE `client_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactuses`
--
ALTER TABLE `contactuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_collections`
--
ALTER TABLE `credit_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_purchases`
--
ALTER TABLE `credit_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_purchase_items`
--
ALTER TABLE `credit_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_sales`
--
ALTER TABLE `credit_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_sale_items`
--
ALTER TABLE `credit_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_group_sections`
--
ALTER TABLE `customer_group_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_policies`
--
ALTER TABLE `delivery_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_sell`
--
ALTER TABLE `flash_sell`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_centers`
--
ALTER TABLE `help_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_policies`
--
ALTER TABLE `payment_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sections`
--
ALTER TABLE `product_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_receives`
--
ALTER TABLE `purchase_order_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_order_receive_items`
--
ALTER TABLE `purchase_order_receive_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_policies`
--
ALTER TABLE `refund_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menus`
--
ALTER TABLE `user_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu_actions`
--
ALTER TABLE `user_menu_actions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `careers`
--
ALTER TABLE `careers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_purchase`
--
ALTER TABLE `cash_purchase`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_purchase_item`
--
ALTER TABLE `cash_purchase_item`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cash_sales`
--
ALTER TABLE `cash_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cash_sale_items`
--
ALTER TABLE `cash_sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `checkouts`
--
ALTER TABLE `checkouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client_entries`
--
ALTER TABLE `client_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=342;

--
-- AUTO_INCREMENT for table `contactuses`
--
ALTER TABLE `contactuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_collections`
--
ALTER TABLE `credit_collections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_purchases`
--
ALTER TABLE `credit_purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit_purchase_items`
--
ALTER TABLE `credit_purchase_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `credit_sales`
--
ALTER TABLE `credit_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_sale_items`
--
ALTER TABLE `credit_sale_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_group_sections`
--
ALTER TABLE `customer_group_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `delivery_policies`
--
ALTER TABLE `delivery_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sell`
--
ALTER TABLE `flash_sell`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_centers`
--
ALTER TABLE `help_centers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_policies`
--
ALTER TABLE `payment_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `product_sections`
--
ALTER TABLE `product_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_order_receives`
--
ALTER TABLE `purchase_order_receives`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_receive_items`
--
ALTER TABLE `purchase_order_receive_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_policies`
--
ALTER TABLE `refund_policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shipping_charges`
--
ALTER TABLE `shipping_charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_payments`
--
ALTER TABLE `supplier_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_menus`
--
ALTER TABLE `user_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `user_menu_actions`
--
ALTER TABLE `user_menu_actions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
