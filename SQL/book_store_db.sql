-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2024 at 03:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL,
  `image_path` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `category_ids`, `title`, `author`, `description`, `qty`, `price`, `image_path`, `date_created`) VALUES
(1, '4,1', 'Read Book', ' Author', 'An author is a person who writes books or articles, usually for money. It can also refer to the person responsible for something, like the author of a plan to overthrow the student government. Author comes from the Latin word auctorem, meaning \"founder, master, leader.\" Bow down to the author!\r\n', 0, 2500, '1604631420_books-1419613.jpg', '2020-11-06 10:57:51'),
(2, '1,2', 'Python Programming', 'Anthony Brun', 'A Step by Step Guide from Beginner to  Expert', 0, 1800, '1604631960_python_book.jpg', '2020-11-06 11:06:58'),
(3, '3', 'Zarb e Qaleem', 'Allama Iqbal', 'Allama Iqbal Wrote the books of poetry in Urdu. Iqbal Wrote seven books of Persian poetry.\r\n', 0, 3000, '1707946320_Allama Muhammad Iqbal Urdu Poetry Books Free Download.jfif', '2024-02-15 02:32:05');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Educational', 'Educational'),
(2, 'Programming', 'Programming'),
(3, 'Fantasy', 'Fantasy'),
(4, 'Business', 'Business'),
(5, 'General Knowledge', 'All General knowledge');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `contact`, `email`, `password`, `date_created`) VALUES
(1, 'admin', 'Sample address', '02136707423', 'sana@sample.com', 'd41d8cd98f00b204e9800998ecf8427e', '2020-11-06 12:59:12'),
(2, 'sana', 'dhdghh', '02136707423', 'sana@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', '2024-02-13 02:37:51'),
(3, 'misbah', 'ffdddf', '0333 2222243', 'm@gmail.com', '1e2a796539042ca860c3091662aa4346', '2024-02-21 21:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `address` text NOT NULL,
  `total_amount` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `total_amount`, `status`, `date_created`) VALUES
(2, 2, 'Nazimabad # 01, karachi', 0, 1, '2024-02-15 01:33:40'),
(3, 1, 'Gulshan e Iqbal', 0, 0, '2024-02-15 01:37:29'),
(4, 1, 'ffdddf', 0, 0, '2024-02-22 00:59:23'),
(5, 3, 'ffdddf', 0, 1, '2024-02-22 08:27:18'),
(6, 3, 'ffdddf', 0, 1, '2024-02-22 19:17:45'),
(7, 1, '<br />\r\n<b>Warning</b>:  Undefined array key \"login_address\" in <b>C:xampphtdocsebookmanage_order.php</b> on line <b>8</b><br />\r\n', 0, 0, '2024-02-22 19:40:39');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `book_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `book_id`, `qty`, `price`) VALUES
(3, 2, 2, 1, 1800),
(4, 3, 2, 3, 1800),
(5, 3, 1, 2, 2500),
(6, 4, 2, 1, 1800),
(7, 5, 1, 2, 2500),
(8, 6, 3, 1, 3000),
(9, 7, 2, 3, 1800),
(10, 7, 1, 1, 2500);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'E-Book Management System', 'sanakiran425@gmail.com', '+92 344 3679010', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;strong&gt;&lt;span style=&quot;font-size: 30px;&quot;&gt;&lt;u&gt;Description About E-Book Store&lt;/u&gt;&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;Inventory Management:&lt;/span&gt;&lt;/u&gt;&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The system allows booksellers to efficiently manage their inventory by tracking stock levels, organizing books by category or genre, and monitoring sales trends. It enables easy addition, deletion, and updating of book records, including details such as title, author, ISBN, price, and quantity available.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;Point of Sale (POS):&lt;/span&gt;&lt;/u&gt;&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The POS component of the system facilitates transactions between the bookstore and customers. Booksellers can use the POS interface to scan barcodes, process payments, apply discounts or promotions, and generate receipts or invoices. Integration with payment gateways and hardware such as barcode scanners and card readers ensures smooth and secure transactions.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;Customer Management:&lt;/span&gt;&lt;/u&gt;&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The system maintains a database of customer information, including contact details, purchase history, and preferences. This enables personalized customer service, targeted marketing campaigns, and loyalty programs to enhance customer satisfaction and retention.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;u&gt;&lt;strong&gt;Online Sales and E-Commerce Integration:&lt;/strong&gt;&lt;/u&gt;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Many bookstore systems offer e-commerce capabilities, allowing customers to browse, search, and purchase books online through a website or mobile app. Integration with e-commerce platforms enables seamless synchronization of inventory, orders, and customer data between the online and offline channels.&lt;/p&gt;&lt;p&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;strong&gt;Reporting and Analytics:&lt;/strong&gt;&lt;/span&gt;&lt;/u&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The system generates reports and analytics to provide insights into sales performance, inventory turnover, popular genres or authors, and customer behavior. This data helps booksellers make informed decisions regarding purchasing, pricing, and marketing strategies to optimize profitability and efficiency.&lt;/p&gt;&lt;p&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;&lt;strong&gt;Supplier Management:&lt;/strong&gt;&lt;/span&gt;&lt;/u&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Booksellers can manage relationships with book distributors and suppliers, track orders, and streamline the procurement process through the system. Automated reordering based on predefined thresholds helps ensure optimal stock levels and minimize out-of-stock situations.&lt;/p&gt;&lt;p&gt;&lt;u&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;Security and Permissions:&lt;/span&gt;&lt;/strong&gt;&lt;/u&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;The system implements security measures to protect sensitive data, such as customer information and payment details, from unauthorized accessor breaches. Role-based access control ensures that only authorized personnel have access to specific functionalities or data within the system.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;&lt;u&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;Integration with Accounting and Back-office Systems:&lt;/span&gt;&lt;/u&gt;&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Integration with accounting software enables seamless synchronization of sales data, invoices, and financial transactions, simplifying bookkeeping and financial reporting processes. Integration with back-office systems streamlines administrative tasks such as payroll, inventory reconciliation, and tax compliance.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Misbah', 'Misbah_baqir', '1e2a796539042ca860c3091662aa4346', 1),
(3, 'Sana Kiran', 'Sana_Kiran', '7812e8b74f6837fba66f86fe86688a2b', 1),
(4, 'Dua', 'Dua_Uddin', '7097c422d46bb61fc4c169dbbae1c1e6', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
