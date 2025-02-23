-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2025 at 08:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(50) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `size` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `user_name`, `product_name`, `created_at`, `price`, `size`) VALUES
(75, 1, 'Kabin ', 'Nike Air Zoom Infinity Tour NRG', '2025-01-18 12:09:00', 180.00, ''),
(76, 1, 'Kabin ', 'Nike Air Zoom Flight 95', '2025-01-18 12:09:03', 160.00, ''),
(78, 1, 'Kabin ', 'Air Jordan 1 Mid', '2025-01-18 12:50:41', 125.00, ''),
(79, 1, 'Kabin ', 'Tatum 1', '2025-01-18 12:50:47', 110.00, ''),
(80, 1, 'Kabin ', 'Kobe 9 Elite BHM Mens Basketball Shoe', '2025-01-18 12:56:12', 1200.00, ''),
(85, 3, 'admin', 'Tatum 1', '2025-01-19 07:30:25', 110.00, ''),
(90, 12, 'Ranbir', 'Nike Lunar Force 1', '2025-01-19 07:37:33', 185.00, ''),
(113, 13, 'joseph', 'Air Jordan 1 Low OG', '2025-01-24 21:47:37', 140.00, ''),
(114, 15, 'sankalpa', 'NIKE AIR FORCE 1', '2025-01-24 21:54:49', 99.00, ''),
(115, 15, 'sankalpa', 'Air Jordan 1 Low OG', '2025-01-25 00:34:34', 140.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` text NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `notes` text DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address`, `payment_method`, `notes`, `total_amount`, `created_at`, `status`) VALUES
(40, 15, 'lalitpur, patan temple', 'cash_on_delivery', 'Thankyou', 390.00, '2025-01-21 05:37:24', 'completed'),
(42, 13, 'kirtipur', 'paypal', '', 2120.00, '2025-01-25 02:15:40', 'completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_name`, `price`, `quantity`) VALUES
(58, 40, 'nike max', 140.00, 1),
(59, 40, 'Air Jordan 1 Low OG', 140.00, 1),
(60, 40, 'Tatum 1', 110.00, 1),
(63, 42, 'Tatum 1', 110.00, 1),
(64, 42, 'Jumpman MVP', 165.00, 1),
(65, 42, 'Nike Free Metcon 5 Premium', 130.00, 1),
(66, 42, 'Nike Air Max 97', 175.00, 1),
(67, 42, 'Nike Air Zoom Flight 95', 160.00, 1),
(68, 42, 'Nike Air Zoom Infinity Tour NRG', 180.00, 1),
(69, 42, 'Kobe 9 Elite BHM Mens Basketball Shoe', 1200.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `price`, `image_url`, `description`) VALUES
(1, 'Tatum 1', 'Basketball Shoes', 110.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/98711f3d-7313-4bbc-ac91-6814407afb6a/tatum-1-basketball-shoes-98vPwk.png', 'The Tatum 1 is a high-performance basketball shoe designed for maximum agility and comfort on the court. The shoe offers exceptional grip, cushioning, and support for explosive movements.'),
(2, 'Air Jordan 1 Low OG', 'Men\'s Shoes', 140.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/367b8bf4-5f4b-4914-941e-aae922ce6d8c/air-jordan-1-low-og-white-red-mens-shoes-v0FbJt.png', 'The Air Jordan 1 Low OG is a stylish and functional men\'s sneaker, combining classic Jordan design with modern technology for superior support and comfort during sports and casual wear.'),
(3, 'Air Jordan 1 Mid', 'Men\'s Shoes', 125.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/288a2235-54ce-4f8e-a133-0117cbc381b4/air-jordan-1-mid-mens-shoes-X5pM09.png', 'The Air Jordan 1 Mid is a classic men\'s sneaker that blends timeless style with modern comfort, offering a great fit and premium leather construction that works on and off the court.'),
(4, 'Jumpman MVP', 'Men\'s Shoes', 165.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6ede48e2-7cfa-4a17-8ccf-f0ae3f851a46/jumpman-mvp-mens-shoes-gzmjDz.png', 'The Jumpman MVP combines high-performance design with iconic Jordan branding. Featuring durable materials and support for demanding athletic activity, it\'s built for both basketball and street style.'),
(5, 'Nike Air Force 1 Shadow', 'Women\'s Shoes', 130.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e7f621f8-d62e-481c-9ca5-66c961d055df/air-force-1-shadow-womens-shoes-kTgn9J.png', 'The Nike Air Force 1 Shadow is a trendy and comfortable women\'s sneaker with a modern twist on the classic Air Force 1 silhouette, perfect for casual wear and daily fashion.'),
(6, 'Nike Air Force 1 \'07', 'Men\'s Shoes', 125.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4579d014-3547-4364-a2c8-77253a6063fb/air-force-1-07-mens-shoes-HqN8PG.png', 'The Nike Air Force 1 \'07 is a legendary men\'s sneaker known for its durable build and timeless design, offering incredible all-day comfort with classic styling.'),
(7, 'Nike Court Legacy Next Nature', 'Women\'s Shoes', 70.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f1f272c7-7c79-4fab-9d11-cdf96b67e0cf/court-legacy-next-nature-womens-shoes-8r07x0.png', 'The Nike Court Legacy Next Nature blends classic court-inspired design with eco-friendly materials, making it the go-to choice for women looking for style and sustainability.'),
(8, 'Nike Free Metcon 5 Premium', 'Women\'s Shoes', 130.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/806ccf97-9c17-43c3-9faa-f2eed708cbf3/free-metcon-5-premium-womens-workout-shoes-h4Zl5h.png', 'The Nike Free Metcon 5 Premium combines flexibility, comfort, and stability, making it perfect for athletes who engage in high-intensity training and need versatile footwear.'),
(9, 'Nike Air Max 97', 'Men\'s Shoes', 175.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/14de6943-8c87-4b9b-9585-80dea96a70d3/air-max-97-mens-shoes-LJmK45.png', 'The Nike Air Max 97 is a stylish, performance-focused sneaker for men. Featuring the iconic Air cushioning system for all-day comfort and a sleek, fast-paced design.'),
(10, 'Nike Lunar Force 1', 'Men\'s Shoes', 185.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/935473f8-7721-47ab-9fee-592231870b45/lunar-force-1-mens-duckboot-PXSmlg.png', 'The Nike Lunar Force 1 is a stylish and supportive men\'s sneaker designed for both urban style and comfort, making it the ideal shoe for everyday wear and casual outings.'),
(11, 'NikeCourt Air Zoom Vapor 11 Premium', 'Women\'s Shoes', 180.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/900033c1-92b7-4d0e-84f6-133ed52200d6/nikecourt-air-zoom-vapor-11-premium-womens-hard-court-tennis-shoes-5lVbnb.png', 'The NikeCourt Air Zoom Vapor 11 Premium is a lightweight women\'s tennis shoe offering a responsive feel and excellent support for speed and endurance on the court.'),
(12, 'Nike Air Zoom Generation', 'Men\'s Shoes', 190.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/854577d8-58b3-48c0-b360-54e6a858911e/air-zoom-generation-mens-shoes-gkwN12.png', 'The Nike Air Zoom Generation is a high-performance men\'s basketball shoe, designed for speed and responsiveness with a snug, supportive fit for a quick, powerful game.'),
(13, 'Nike Air Zoom Flight 95', 'Men\'s Shoes', 160.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/27043200-1653-43c6-83d1-3c5893eb0894/air-zoom-flight-95-mens-shoes-zc42bP.png', 'The Nike Air Zoom Flight 95 is a men\'s retro-inspired basketball shoe, combining dynamic cushioning and support for exceptional on-court performance and legendary style.'),
(14, 'Nike Air Zoom Infinity Tour NRG', 'Men\'s Golf Shoes', 180.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e6c1cd02-e938-44f4-8550-8c44cf1cffc9/air-zoom-infinity-tour-nrg-mens-golf-shoes-ZGRpRp.png', 'The Nike Air Zoom Infinity Tour NRG offers enhanced comfort and grip for men who enjoy playing golf, featuring Zoom Air technology for superior cushioning on the greens.'),
(15, 'NikeCourt Air Zoom GP Turbo Osaka', 'Women\'s Hard Court Tennis Shoes', 160.00, 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2f3ddd69-54d5-4cd4-87cd-132bb84acbf9/nikecourt-air-zoom-gp-turbo-osaka-womens-hard-court-tennis-shoes-ZdfLR2.png', 'The NikeCourt Air Zoom GP Turbo Osaka features advanced performance technology for women tennis players. Designed with superb cushioning and stability for hard court surfaces.'),
(16, 'Kobe 9 Elite BHM Mens Basketball Shoe', 'Basketball Shoe', 1200.00, 'https://i.pinimg.com/originals/12/b5/0b/12b50bac0f2df224b81d22ad4a9bd291.jpg', 'Kobe 9 Elite BHM Mens Basketball Shoe'),
(17, 'NIKE BLAZZER', 'SNEAKERS', 150.00, 'https://th.bing.com/th/id/OIP.y8cf08k-BpiwK2HM0g6uKgAAAA?rs=1&pid=ImgDetMain', 'XYZ'),
(18, 'NIKE AIR FORCE', 'DAILY USE', 88.00, 'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/05021bfa-ea0a-4456-b0fa-e68b76307673/air-force-1-07-shoes-rrWMDC.png', 'NICE SHOES'),
(19, 'nike max', 'SNEAKERS', 140.00, 'https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_1.3/h_467,c_limit/dec8e0ff-35a4-4f83-92b3-1b40f5fc15b8/air-force-1-low-retro-shoes-7BgFCL.png', 'this is iss'),
(20, 'adidas samba', 'SNEAKERS', 111.00, 'https://assets.adidas.com/images/w_600,f_auto,q_auto/cd425e0df2e94d2693f0c52fd33f412f_9366/Handball_Spezial_Shoes_Beige_JS0241_01_00_standard.jpg', 'easy and comfort'),
(22, 'NIKE AIR FORCE 1', 'SNEAKERS', 99.00, 'https://libur.com.co/cdn/shop/files/IMG_4007_fc8778e3-443a-4991-a54e-adac055a068d.jpg?v=1708709140&width=600', 'easy and comfort');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `user_id`, `rating`) VALUES
(1, 2, 1, 5),
(2, 1, 1, 3),
(3, 1, 9, 5),
(4, 8, 9, 4),
(5, 13, 1, 3),
(6, 16, 1, 5),
(7, 16, 9, 3),
(8, 10, 12, 3),
(9, 11, 13, 3),
(10, 2, 14, 5),
(11, 2, 13, 3),
(12, 4, 15, 3),
(13, 1, 15, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `product_id`, `user_id`, `review`, `created_at`) VALUES
(1, 8, 9, 'The product is amazing', '2025-01-15 04:15:39'),
(2, 8, 9, 'Not realyy', '2025-01-15 04:15:46'),
(3, 16, 1, 'I love Kobe', '2025-01-18 17:41:06'),
(4, 16, 9, 'Lebron is much better', '2025-01-18 17:42:06'),
(5, 10, 12, 'nicee', '2025-01-19 12:22:23'),
(6, 11, 13, 'hi hello\r\n', '2025-01-21 03:38:30'),
(7, 1, 15, 'Good product ', '2025-01-21 04:45:01'),
(8, 2, 15, 'good poduct', '2025-01-25 05:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'Kabin ', 'Kabin@gmail.com', 'fa798acf3cd432db2ba93719be264404750b26a17375e9614c244caf9aeaaa35', '2024-12-03 12:16:20', 'user'),
(2, 'Ishan', 'Ishan@gmail.com', 'c2ff1aa3306c73bd4547b2fd52df09f16e32c01138a697a8987b7c44985edc42', '2024-12-04 12:44:38', 'user'),
(3, 'admin', 'admin@gmail.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2024-12-04 13:32:54', 'admin'),
(5, 'IMAN MAHARJAN', 'iman@gmail.com', '8ef33a849ccba88d08d567b07d7096af67633b0e43ad1bfb2d6adc94156b587e', '2024-12-08 10:48:06', 'user'),
(6, 'Zen Dahal', 'zen@gmail.com', 'a30198efb03ef0200bb7966f79aba7695560e91cb96435a23eef8d24ecf58d6d', '2024-12-14 10:50:52', 'user'),
(9, 'ayuash', 'ayuash@gmail.com', 'e2d4aaa366dc7cd6b21ccc556f2194400e9dae3e858cd2becf248bf1fa29095e', '2024-12-21 02:48:00', 'user'),
(10, 'Poker', 'poker@gmail.com', 'ea8711b12e651b203fa6a19ee596c388bdd2b2166413f87240c8c3ddcfe7db65', '2025-01-18 17:36:42', 'user'),
(11, 'sasas', 'asas@mail', '632a97bfec9964778df6f10b5357fbc6a6d008b6fa61675bf13e08acbbefa09b', '2025-01-18 17:39:18', 'user'),
(12, 'Ranbir', 'Ranbir@gmail.com', '82ff1842a52ecfcc5a54834637b469eb45501c955c985cb235a349f298126d6f', '2025-01-19 12:16:28', 'user'),
(13, 'joseph', 'joseph@gmail.com', '7ec8c6dc2a42e8b23ced92fcfce9e1f1c699bd000f8fdaddc99ffd864e117406', '2025-01-21 03:37:05', 'user'),
(14, 'asmita', 'asmita@gmal.com', '8eb8c54ff8fce521d810b5ea65d875e9330ff632a6f452253ba3051aae9f4da3', '2025-01-21 03:40:56', 'user'),
(15, 'sankalpa', 'phuyalsankalpa@gmail.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2025-01-21 04:25:12', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
