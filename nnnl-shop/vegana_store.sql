-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2022 at 07:02 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vegana_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `name`) VALUES
(1, 'Áo thun nam'),
(2, 'Áo khoác nam'),
(3, 'Áo sơ mi'),
(4, 'Quần jeans dài'),
(5, 'Quần tây'),
(8, 'Quần Kaki'),
(9, 'Quần thể thao');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerId` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerId`, `email`, `enabled`, `fullname`, `password`, `photo`, `roleId`) VALUES
('admin', 'shopnhhl@gmail.com', b'1', 'Tôi là admin', '$2a$10$1iPiIh9Mw/8jFkmrTzVhs.CrY8rBMn1hWHVSw2NPn92hRTK4kYwHu', '', '1'),
('chinhhi102', 'chinhhi102@gmail.com', b'1', 'Chinh', '$2a$10$2kGDEikv.yU0LyQQOjTog.xyYH2uAkVUJgwta2XlT8A77Bbb2Gmmi', '', '0'),
('thienne', 'thienvan2464@gmail.com', b'1', 'vanthien', '$2a$10$8MSYG/2/AUKlCokacpnk0uP0Ua5dEdM1Lj11Is3Xcn3dlgNKoMwh.', '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderDetailId` int(11) NOT NULL,
  `discount` double DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderDetailId`, `discount`, `price`, `quantity`, `status`, `total_price`, `orderId`, `productId`) VALUES
(42, NULL, 10, 1, 'Đã Thanh Toán', 9.5, 35, 1),
(43, NULL, 10, 1, 'Đang Chờ Xử Lý', 9.5, 36, 1),
(44, NULL, 30, 1, 'Đang Chờ Xử Lý', 28.5, 36, 65),
(45, NULL, 20, 1, 'Đang Chờ Xử Lý', 19, 36, 60);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `requireDate` date DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL,
  `orderDetailId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `address`, `amount`, `description`, `orderDate`, `phone`, `receiver`, `requireDate`, `total_price`, `customerId`, `orderDetailId`) VALUES
(35, 'Hutech E', 0, 'mua áo mới', '2022-04-17', '0123123123', 'van thien', NULL, 9.5, 'thienne', NULL),
(36, 'Hutech E', 0, 'mua áo mới', '2022-04-18', '1231231231', 'van thien', NULL, 57, 'thienne', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `enteredDate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `description`, `discount`, `enteredDate`, `image`, `name`, `price`, `quantity`, `categoryId`, `supplierId`) VALUES
(1, 'Áo thun nam cổ bẻ có viền màu xanh da trời', 5, '2022-03-29', 'ao-thun.jpg', 'Áo thun 1', 10, 10, 1, 1),
(2, 'Áo thun nam cổ bẻ kẻ sọc trắng sang trọng thanh lịch\r\nHàng chuẩn VNXK, năng động, mát mẻ, thoải mái khi sử dụng\r\n Chất liệu vải cotton phù hợp với khí hậu Việt Nam.', 10, '2022-04-07', 'ao-thun1.jpg', 'Áo thun nam cổ bẻ kẻ sọc trắng', 15, 10, 1, 1),
(3, 'Áo thun basic unisex cotton 100% - màu xám- chodole , Áo thun unisex cao cấp của Chodole. Chodole là hương hiệu quần áo nam, thời trang trẻ trung', 5, '2022-04-08', 'ao-thun3.jpg', 'Áo thun Basic\r\n', 8, 20, 1, 1),
(60, 'Mẫu áo khoác Jean nam được nhiều bạn trẻ yêu thích với hơn 10.000 nhìn nhận năm sao. Nó là một trong những áo khoác nam đẹp cháy khách nhất 2021. Chất liệu kaki bền chắc, bạn sẽ có nó trong sáu màu lựa chọn cùng ba size.', 5, '2022-04-14', 'ao-khoac.jpg', 'Áo khoác nam Kaki Jean', 20, 5, 2, 2),
(61, '', 5, '2022-04-12', 'ao-khoac1.jpg', 'Áo Blazer Nam', 15, 8, 2, 2),
(62, 'Với hơn 8.000 nhìn nhận năm sao, mẫu áo rất được yêu thích Freestyle của của giới trẻ lúc bấy giờ. Bomber Jacket Unisex tương thích cả nam và nữ biểu lộ đậm cá tính, năng động. Áo có hai màu cùng ba size tương thích nhiều kích cỡ khung hình.', 5, '2022-04-16', 'ao-khoac2.jpg', 'Áo khoác Jacket nam nữ', 30, 10, 2, 5),
(63, 'hàng tốt :v', 7, '2022-04-15', 'so-mi.jpg', 'Áo sơ mi nam JEEP', 20, 12, 3, 3),
(65, 'Quần jean nam Slim straight', 5, '2022-04-07', 'Quần-jean-nam-Slim-Straight-555x740.jpg', 'Quần jean nam Slim straight', 30, 13, 4, 4),
(66, 'aaaaaaaaaaaaaaaa', 3, '2022-04-10', '1-2-500x500.jpg', 'Quần tây nam cao cấp', 25, 12, 5, 2),
(67, 'quần kaki vjpro:v', 5, '2022-04-13', 'Ảnh-chụp-Màn-hình-2019-08-22-lúc-10.40.53-554x800.jpg', 'Quần KaKi Nam Vàng', 20, 15, 8, 5),
(68, 'Áo thun nam cổ tròn xẻ v phối nút với chất liệu thun Cotton, thấm hút mồ hôi tốt. Với gam màu sắc tươi mới, chất liệu co giãn 4 chiều mang đến sự mát mẻ khi mặc, từng mối đường kim mũi chỉ được gia công kỹ lưỡng chắc chắn.', 5, '2022-04-11', 'aothun01.jpg', 'Áo Thun Nam Cổ Tròn Xẻ V Phối Nút', 15, 20, 1, 2),
(69, 'Áo thun nam sọc tommy bông lúa với chất liệu thun Cotton, thấm hút mồ hôi tốt. Với gam màu sắc tươi mới, chất liệu co giãn 4 chiều mang đến sự mát mẻ khi mặc, từng mối đường kim mũi chỉ được gia công kỹ lưỡng chắc chắn.', 0, '2022-04-14', 'aothun02.jpg', 'Áo Thun Nam Viền Cổ Cao Cấp', 20, 14, 1, 4),
(70, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 5, '2022-04-15', '1.jpg', 'Quần Thể Thao Nam 3 Sọc Quần Nam Thu Đông Co Giãn', 25, 18, 9, 6),
(72, 'zzzzzzzzzzzzzzzzzzzzzzzzzzzz\r\n', 5, '2022-04-09', 'ao-thun-nam-co-vien-co-co-tui-den.jpg', 'áo name 2', 28, 15, 1, 3),
(73, 'aaaaaaaaaaaaaaaaaaaaaaaqqqqqqqqqq', 10, '2022-04-13', 'ao-thun-co-vien-do-co-tui-cho-nam-mau-xanh-da-troi.jpg', 'áo name 3', 26, 23, 1, 1),
(74, 'ádasdasd', 15, '2022-04-14', 'ao-thun5.jpg', 'ao name 4', 15, 22, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `customerId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `roleName`, `customerId`) VALUES
(1, 'ROLE_ADMIN', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `email`, `name`, `phone`) VALUES
(1, 'shopquanao@gmail.com', 'Shopquanao', '09123123123'),
(2, 'shopquanao2@gmail.com', 'Shopquanao2', '09222222222'),
(3, 'shopquanao3@gmail.com', 'Shopquanao3', '0915999966'),
(4, 'shopquanao4@gmail.com', 'Shopquanao4', '0915999666'),
(5, 'shopquanao5@gmail.com', 'Shopquanao5', '0925252525'),
(6, 'shopquanao6@gmail.com', 'Shopquanao6', '09123333333');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderDetailId`),
  ADD KEY `FK3ohml2o6a85wh1nn65snnaind` (`orderId`),
  ADD KEY `FK5pie1uapfd704usnm2loi3tex` (`productId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `FK1bpj2iini89gbon333nm7tvht` (`customerId`),
  ADD KEY `FK1gy3b3hqr3p2p1y5i8xuj6l5h` (`orderDetailId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `FKej2ob3ifydf846t2a2tntna4e` (`categoryId`),
  ADD KEY `FKs2xbxi7wmu948op6qiho9yr8d` (`supplierId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcotftqap7by5m4ibph3ss3xvo` (`customerId`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderDetailId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK3ohml2o6a85wh1nn65snnaind` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `FK5pie1uapfd704usnm2loi3tex` FOREIGN KEY (`productId`) REFERENCES `products` (`productId`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK1bpj2iini89gbon333nm7tvht` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`),
  ADD CONSTRAINT `FK1gy3b3hqr3p2p1y5i8xuj6l5h` FOREIGN KEY (`orderDetailId`) REFERENCES `orderdetails` (`orderDetailId`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKej2ob3ifydf846t2a2tntna4e` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`),
  ADD CONSTRAINT `FKs2xbxi7wmu948op6qiho9yr8d` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `FKcotftqap7by5m4ibph3ss3xvo` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
