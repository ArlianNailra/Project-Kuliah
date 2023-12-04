-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2021 at 03:05 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insan`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'Rizal', 'rizalramadhan087@gmail.com', '$2y$10$NrY3l057zUgIg6xjO3TA3ef0Uw.nYPfQIBqX/SoIoRYDQHIARGBwq', '0'),
(2, 'Bima', 'bimawh@yahoo.com', '$2y$10$p4IO92UrqVyYA.p0m8TqzexX9F9Jzjd7gea5VTBLs8iDO4GWxw0GC', '0'),
(3, 'Rizky', 'rizkyprasetyanto@gmail.com', '$2y$10$4tx7rORH7WgCA15dpJfb9O35RHEvE8b/k8FL3OyUgFtdRgu520zQK', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Dulux Catylac'),
(2, 'Nippon Paint'),
(3, 'Avitex'),
(4, 'No Drop'),
(5, 'Aquaproof'),
(6, 'Jotun'),
(7, 'Decolith'),
(8, 'Puffin'),
(9, 'Aries'),
(10, 'TOA'),
(11, 'Envi');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(9, 1, '::1', 3, 1),
(10, 2, '::1', 4, 1),
(11, 1, '::1', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(12, 'Cat');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 12, 1, 'Dulux Catylac 5kg', 132000, 50, 'Dulux Catylac Glow dengan formula Chroma Brite Glow Technology untuk warna dinding cerah menakjubkan dan hasil akhir mengkilap.', 'Dulux_Catylac_Interior_5kg.jpg', 'cat, dulux, 5kg'),
(2, 12, 2, 'Nippon Paint 5kg', 100000, 5000, 'Cat interior emulsi ekonomis yang terbuat dari bahan dasar vinyl akrilik. Hadir dengan tampilan matt yang mempunyai lapisan film yang rata dan halus, warna yang awet dan tahan lama, anti-jamur, cepat kering serta daya tutup yang baik.', 'Nippon_Paint_5kg.JPG', 'cat, nippon, 5kg'),
(3, 12, 3, 'Avitex Cat Tembok 1 Kg', 35000, 100, 'AVITEX INTERIOR adalah cat tembok berbahan dasar resin terbaik (styrene acrylic emulsion) yang membuat cat menempel sempurna pada tembok. Diproduksi menggunakan pigmen pilihan yang menghasilkan tampilan akhir “matt” dengan sentuhan warna-warna bercita rasa tinggi.', 'Avitex_Cat Tembok_1Kg.jpg', 'cat, avitex, 1 kg'),
(4, 12, 4, 'No Drop 1 Kg', 50000, 5000, 'No Drop adalah cat pelapis anti bocor No. 1 di Indonesia yang memiliki sifat elastis, kedap air, dan tahan cuaca sehingga dapat melindungi Anda dari bahaya kebocoran di dalam rumah.', 'NoDrop_AntiBocor_1Kg.JPG', 'cat, drop, 1 kg'),
(5, 12, 2, 'Nippon Paint Q-Luc 5 Kg', 30000, 50, 'Q-LUC adalah cat interior emulsi ekonomis yang terbuat dari bahan dasar vinyl akrilik. Q-LUC hadir dengan tampilan matt yang mempunyai lapisan film yang rata dan halus, warna yang awet dan tahan lama, anti-jamur, cepat kering serta daya tutup yang baik. Q-LUC dapat digunakan untuk dinding serta langit-langit berbahan dasar asbes, batako, beton, papan, mortar baik yang baru atau yang sudah pernah dicat.', 'Nippon_Paint_5kg_q-luc.jpg', 'cat, nippon, 5kg'),
(6, 12, 1, 'Dulux Catylac Interior 25kg ', 650000, 50, 'Dulux Catylac Glow dengan formula Chroma Brite Glow Technology untuk warna dinding cerah menakjubkan dan hasil akhir mengkilap.', 'Dulux_Catylac_Interior_25kg.JPG', 'cat, dulux, 25kg'),
(7, 12, 4, 'No Drop Bitumen 20 Kg', 950000, 50, 'No Drop Bitumen Black adalah pelapis bitumen non fiber berbasis air, bersifat elastis dan bermutu tinggi Memberikan perlindungan pada permukaan sebagai pelapis anti bocor, mencegah rembesan air serta anti karat.', 'Bitumen_20Kg.JPG', 'cat, drop, 20kg'),
(8, 12, 5, 'Aquaproof Cat 20kg', 950000, 50, 'Kualitas Aquaproof telah terjamin, diproduksi oleh perusuhaan yang telah terstandarisasi ISO 9001 dan ISO 14001. Aquaproof sangat memahami kondisi Indonesia yang memiliki curah hujan tinggi dan diwujudkan dalam berbagai produk-produk kimiawi bangunan yang sesuai.', 'Aquaproof_Cat 20kg.JPG', 'cat, aqua, 20kg'),
(9, 12, 6, 'Jotun True Beauty Matt 4 kg', 175000, 50, 'Hasil akhir yang indah dari Majestic True Beauty Matt mengubah rumah Anda menjadi ruang yang diinginkan, rumah yang akan menjadi impian banyak orang.', 'Jotun_True_Beauty_Matt_4kg.JPG', 'cat, jotun, 4kg'),
(10, 12, 7, 'Decolith Sws 5kg', 125000, 50, 'DECOLITH hadir dengan pilihan warna-warna yang cemerlang, membuat hunian Anda tampil lebih segar dan ceria. DECOLITH merupakan 100% produk dalam negeri yang telah menjadi pilihan konsumen di Indonesia.', 'Decolith_Sws_5kg.JPG', 'cat, decolith, 5kg'),
(11, 12, 7, 'Decolith Cat Tembok 1 Kg', 30000, 50, 'DECOLITH hadir dengan pilihan warna-warna yang cemerlang, membuat hunian Anda tampil lebih segar dan ceria. DECOLITH merupakan 100% produk dalam negeri yang telah menjadi pilihan konsumen di Indonesia.', 'Decolith_Cat_Tembok_1Kg.JPG', 'cat, decolith, 1kg'),
(12, 12, 9, 'Cat Tembok Aries 20kg', 155000, 50, 'Aries Cat Tembok adalah cat tembok yang bermutu untuk segala macam ruangan dalam rumah Anda. Aries Cat Tembok dapat digunakan pada segala jenis permukaan seperti tembok, beton, panel GRC, eternit dan lain-lain.', 'Cat_Tembok_Aries_20kg.JPG', 'cat, aries, 20kg'),
(13, 12, 9, 'Cat Tembok Aries Gold 18kg', 280000, 50, '\'Aries Cat Tembok adalah cat tembok yang bermutu untuk segala macam ruangan dalam rumah Anda. Aries Cat Tembok dapat digunakan pada segala jenis permukaan seperti tembok, beton, panel GRC, eternit dan lain-lain.', 'Cat_Tembok_Aries_Gold_18kg.JPG', 'cat, aries, 18kg'),
(14, 12, 10, 'Cat Toa 4season', 300000, 50, 'Cat tembok TOA 4 seasons adalah cat tembok emulsi dengan berbagai keunggulan seperti: daya tahan warna yang lebih lama, tahan sampai 4tahun, dapat dicuci, daya tutup dan sebat yang sangat baik.', 'Cat_Toa_4season_Interior.JPG', 'cat, toa, season'),
(15, 12, 11, 'Cat Tembok Envi 5 Kg', 145000, 50, 'Cat tembok Interior Envi adalah Cat tembok sehat dengan bahan yang ramah lingkungan. Sangat cocok untuk orang yang tidak suka bau cat yang menyengat. ', 'Cat_Tembok_Envi_5Kg.JPG', 'car, envi, 5kg'),
(16, 12, 8, 'Cat Puffin Plus 5kg', 120000, 50, 'Cat tembok Exterior dan Interior yang memiliki daya tahan cuaca minimal 4 tahun.', 'Cat_Puffin_Plus_5kg.JPG', 'cat, puffin, 5kg');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Rizal', 'R', 'rizalramadhan087@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'jln jeruk', 'jln pinus'),
(2, 'Bima', 'WH', 'bimawh@yahoo.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'jalan kerang', 'kebayoran b'),
(3, 'Rizky', 'P', 'rizkyprasetyanto@gmail.com', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'kebon jeruk', 'rawa belong');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
