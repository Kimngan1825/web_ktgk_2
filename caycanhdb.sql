-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 15, 2026 at 02:31 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `caycanhdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
CREATE TABLE IF NOT EXISTS `chi_tiet_don_hang` (
  `ma_don_hang` int NOT NULL,
  `id_san_pham` int NOT NULL,
  `so_luong` int NOT NULL,
  `don_gia` int NOT NULL,
  PRIMARY KEY (`ma_don_hang`,`id_san_pham`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
CREATE TABLE IF NOT EXISTS `danh_muc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_danh_muc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten_danh_muc`) VALUES
(1, 'Cây cảnh để bàn'),
(2, 'Cây cảnh mini'),
(3, 'Cây trồng ban công'),
(4, 'Cây hàng rào');

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
CREATE TABLE IF NOT EXISTS `don_hang` (
  `ma_don_hang` int NOT NULL AUTO_INCREMENT,
  `ngay_dat_hang` datetime NOT NULL,
  `tinh_trang` smallint NOT NULL,
  `hinh_thuc_thanh_toan` smallint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`ma_don_hang`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham_danhmuc`
--

DROP TABLE IF EXISTS `sanpham_danhmuc`;
CREATE TABLE IF NOT EXISTS `sanpham_danhmuc` (
  `id_san_pham` int NOT NULL,
  `id_danh_muc` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham_danhmuc`
--

INSERT INTO `sanpham_danhmuc` (`id_san_pham`, `id_danh_muc`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(15, 3),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 2),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 2),
(51, 1),
(52, 1),
(52, 2),
(53, 2),
(53, 1),
(54, 2),
(54, 1),
(55, 2),
(55, 1),
(56, 1),
(56, 2),
(57, 2),
(57, 1),
(58, 2),
(58, 1),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 2),
(61, 1),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 2),
(67, 1),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 2),
(81, 1),
(82, 2),
(82, 1),
(83, 2),
(83, 1),
(84, 2),
(84, 1),
(85, 2),
(85, 1),
(86, 2),
(86, 1),
(87, 2),
(87, 1),
(88, 2),
(88, 1),
(89, 2),
(90, 2),
(90, 1),
(90, 3),
(91, 2),
(91, 1),
(92, 2),
(92, 1),
(93, 1),
(93, 2),
(94, 2),
(94, 1),
(95, 2),
(95, 1),
(97, 1),
(98, 3),
(100, 1),
(104, 1),
(116, 3),
(120, 3),
(123, 1),
(128, 1),
(129, 1),
(144, 3),
(145, 1),
(145, 3),
(146, 3),
(147, 3),
(148, 3),
(149, 3),
(150, 3),
(151, 3),
(151, 4),
(152, 3),
(153, 3),
(154, 3),
(155, 3),
(156, 1),
(156, 3),
(157, 3),
(158, 3),
(159, 3),
(160, 3),
(161, 3),
(162, 3),
(163, 3),
(164, 3),
(165, 3),
(166, 3),
(167, 3),
(168, 3),
(169, 3),
(170, 3),
(171, 3),
(172, 3),
(173, 3),
(174, 3),
(175, 3),
(176, 3),
(177, 3),
(178, 3),
(179, 3),
(180, 3),
(181, 3),
(182, 3),
(183, 3),
(184, 3),
(185, 3),
(186, 3),
(187, 2),
(187, 1),
(187, 3),
(188, 1),
(188, 3),
(189, 1),
(189, 3),
(190, 3),
(191, 3),
(192, 4),
(193, 4),
(194, 4),
(195, 4),
(196, 4),
(197, 4),
(198, 4),
(199, 4),
(200, 4),
(201, 4),
(202, 4),
(203, 4),
(204, 4),
(205, 4),
(206, 4),
(207, 4),
(208, 4),
(209, 4),
(210, 4),
(211, 3),
(211, 4),
(212, 4),
(213, 4),
(214, 4),
(215, 4),
(216, 4),
(217, 4),
(218, 4),
(96, 3),
(99, 3),
(101, 3),
(102, 3),
(103, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(117, 3),
(119, 3),
(121, 3),
(122, 3),
(126, 3),
(134, 3),
(135, 3),
(136, 3),
(137, 3),
(139, 3),
(140, 3),
(141, 3),
(142, 3),
(143, 3);

-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
CREATE TABLE IF NOT EXISTS `san_pham` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_ban` decimal(10,2) DEFAULT '0.00',
  `hinh_anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `ten_khoa_hoc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ten_thong_thuong` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quy_cach_san_pham` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_kho` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yeu_cau_anh_sang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhu_cau_nuoc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `san_pham`
--

INSERT INTO `san_pham` (`id`, `code`, `ten_san_pham`, `gia_ban`, `hinh_anh`, `mo_ta`, `ten_khoa_hoc`, `ten_thong_thuong`, `quy_cach_san_pham`, `do_kho`, `yeu_cau_anh_sang`, `nhu_cau_nuoc`) VALUES
(1, 'CHAM006', 'Cây cau tiểu trâm mini mèo đi học chậu đất nung', 250000.00, 'cay-cau-tieu-cham-de-ban-chau-dat-nung-1-800x960.jpg', 'Công việc đòi hỏi bạn phải tiếp xúc hằng ngày với các thiết bị hiện đại có nhiều bức xạ điện tử như máy tính, máy in, điện thoại khiến cho tình trạng sức khỏe bị ảnh hưởng, dẫn đến giảm chất lượng công việc. Hãy thử trồng một cây Cau Tiểu Trâm để bàn với tác dụng tuyệt vời đã được minh chứng.', 'Chamaedorea elegans', 'Cau tiểu trâm', '• Kích thước chậu:  (DxC)\r\n• Chiều cao tổng:', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần)'),
(2, 'LIVI003', 'Cây cọ lá lẻ mini ‘Livistona’ chậu sứ', 180000.00, 'cay-co-la-xe-mini-de-ban-1-800x960.jpg', '', 'Livistona chinensis', 'Cọ lá xẻ / Kè ta', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao:', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần)'),
(3, 'PHXA004', 'Cây trầu bà thiên nga để bàn chậu sứ', 420000.00, 'cay-trau-ba-thien-nga-chau-su-1-800x960.jpg', 'Trầu Bà Chân Vịt có thể còn lạ lẫm với nhiều người, không biết hình dạng của loài cây đó ra sao. Đó là một loài cây có đặc tính sinh trưởng mạnh mẽ, thường được mọi người dùng để tô điểm cho không gian sinh sống, trang trí nội thất.', '', 'Cây Trầu Bà Chân Vịt', '', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(4, 'STGH003', 'Cây lưỡi hổ vàng mini Golden Hahnii chậu sứ', 220000.00, 'cay-luoi-ho-vang-mini-chau-su-trang-1-1-800x960.jpg', 'Lưỡi hổ Thái vàng “Golden Hahnii” là dòng cây cảnh mini với những chiếc lá nhỏ nhắn có màu vàng sáng sọc xanh đẹp mắt, rất phù hợp để trồng trên bàn làm việc, kệ sách hoặc trang trí tiểu cảnh. Cây lưỡi hổ cũng được trồng với tác dụng phong thủy như là sự may mắn cho gia chủ.', 'Sansevieria trifasciata Golden Hahnii', 'Cây lưỡi hổ Thái vàng mini', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao: 10 cm – Tán 15 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ / Chịu được bóng râm', 'Tưới nước 1 – 2 lần/tuần)'),
(5, 'ANTH009', 'Cây hồng môn cỡ nhỏ chậu đất nung', 250000.00, 'cay-hong-mon-chau-dat-nung-1-800x960.jpg', 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình yên hơn.', 'Anthurium andreanum', 'Cây hồng môn', '• Kích thước chậu: 12×12 cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/lần'),
(6, 'LONI030', 'Cây kim ngân để bàn một thân chậu sứ', 360000.00, 'cay-kim-ngan-mot-than-chau-su-trang-1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 18x18cm (DxC)\r\n• Chiều cao tổng: 30cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(7, 'PERE004', 'Cây trường sinh viền đỏ chậu sứ hoa văn', 240000.00, 'cay-truong-sinh-la-tim-chau-su-1-800x960.jpg', 'Cây trường sinh lá đỏ là một loại cây cảnh trong nhà đẹp mắt, với bộ lá luôn xanh mát, sức sống mãnh liệt, dễ chăm sóc. Đây cũng là loại cây phong thủy với tác dụng mang đến sức khỏe, may mắn và tiền tài tới cho gia chủ. Người ta thường hay tặng cây trường sinh vào những dịp đặc biệt như là một lời chúc phúc tới người nhận.', 'Peperomia obtusifolia var', 'Cây trường sinh cẩm thạch', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(8, 'LONI029', 'Cây kim ngân để bàn một thân chậu sứ', 300000.00, 'cay-kim-ngan-chau-men-su-1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 18x18cm (DxC)\r\n•Chiều cao tổng: 30cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(9, 'PHBR007', 'Cây trầu bà đế vương kim cương Birkin chậu sứ', 180000.00, 'cay-trau-ba-de-vuong-kim-cuong-chau-su-trang-1-800x960.jpg', 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', 'Philodendron Birkin', 'Trầu bà đế vương kim cương', '• Kích thước chậu: 12x12cm (DxC)\r\n• Chiều cao tổng: 25 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(10, 'AGLE004', 'Cây cung điện vàng Pink Legacy chậu sứ', 280000.00, 'cay-thinh-vuong-chau-su-de-ban-1-800x960.jpg', 'Cây cung điện sở hữu bộ lá nhiều màu sắc rực rỡ như chốn “hoàng cung”, cùng với đó là những đường viền hoa văn độc đáo như tranh vẽ. Loại cây này rất dễ chăm sóc, thích hợp để trang trí không gian phòng khách, quầy tiếp tân, sảnh ra vào hoặc để bàn làm việc.', 'Aglaonema ‘Pink Legacy’', 'Cây cung điện vàng', '• Kích thước chậu:  18×14 cm (DxC)\r\n• Chiều cao tổng: 35 cm', 'Dê chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Thay nước 2 – 3 lần/tháng'),
(11, 'SHBG004', 'Cây lưỡi hổ xanh mini Black Gold chậu sứ', 150000.00, 'cay-luoi-ho-thai-xanh-mini-1-800x960.jpg', 'Lưỡi hổ Thái xanh mini là dòng lưỡi hổ nhỏ để bàn, có chiều cao tối đa khoảng 20cm, không có nhiều vằn như những loại lưỡi hổ khác, nhưng nó lại sở hữu bộ lá màu xanh đậm ấn tượng, mang lại nét ‘cứng cáp’ tự nhiên cho không gian. Chúng rất thích hợp để trên bàn làm việc, kệ trang trí hoặc làm quà tặng.', 'Sansevieria ‘hahnii’ Black Gold', 'Cây lưỡi hổ Thái xanh', '• Kích thược 12×11 cm (DxC)\r\n• Chiều cao: 10 – 15 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ / Chịu bóng râm tốt', 'Thay nước 2 – 3 lần/tháng'),
(12, 'BDCT005', 'Cây đa búp đỏ cẩm thạch 3 thân chậu sứ', 340000.00, 'cay-da-bup-do-cam-thach-chau-su-trang-1-1-800x960.jpg', 'Từ lâu cây Đa luôn là biểu tượng của sự trường tồn, sức sống dẻo dai, nơi chứa đựng thần quyền và tâm linh của con người. Chính lẽ đó mà trong phong thủy, Đa Búp Đỏ cũng mang ý nghĩa của sự may mắn, an lành.', 'Ficus Elastica Tineke', 'Đa búp đỏ cẩm thạch', '• Kích thước chậu: 12x12cm (DxC)\r\n• Chiều cao 10 – 15cm', 'Rất dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(13, 'SAFS004', 'Cây lưỡi hổ Thái để bàn Futura superba chậu đất nung', 330000.00, 'cay-luo-ho-thai-de-ban-2-800x960.jpg', 'Lưỡi hổ là loại cây cảnh nội thất kinh điển nhất, bởi sức sống bền bỉ không cần tốn công chăm sóc, lại còn được NASA đánh giá là có khả năng thanh lọc không khí rất hiệu quả bằng một cơ chế hấp thu các loại chất khí độc hại trên bộ lá.', 'Sansevieria futura Superba', 'Cây lưỡi hổ thái', '• Kích thước chậu: 20×18 cm (DxC)\r\n• Chiều cao tổng: 30 – 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(14, 'PHBR006', 'Cây trầu bà đế vương kim cương Birkin chậu đất nung', 250000.00, 'cay-trau-ba-de-vuong-kim-cuong-1-800x960.jpg', 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', 'Philodendron Birkin', 'Trầu bà đế vương kim cương', '• Kích thước chậu: 18x18cm (DxC)\r\n• Chiều cao tổng: 35 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(15, 'FITR006', 'Cây đa tam phúc Triangularis chậu đất nung', 300000.00, 'cay-da-tam-phuc-nho-de-ban-chau-gom-1-800x960.jpg', 'Đây sẽ là một dạng năng lượng tích cực, bạn sẽ cảm nhận được nhiều giá trị như sức khỏe, sự giàu có hay mối quan hệ tốt đẹp đến với cuộc sống của mình.', 'Ficus Triangularis Variegata', 'Đa tam phúc', '• Kích thước chậu: 18x18cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(16, 'SHBG003', 'Cây lưỡi hổ xanh mini Black Gold chậu sứ', 180000.00, 'cay-luoi-ho-xanh-mini-de-ban-1-800x960.jpg', 'Lưỡi hổ Thái xanh mini là dòng lưỡi hổ nhỏ để bàn, có chiều cao tối đa khoảng 20cm, không có nhiều vằn như những loại lưỡi hổ khác, nhưng nó lại sở hữu bộ lá màu xanh đậm ấn tượng, mang lại nét ‘cứng cáp’ tự nhiên cho không gian. Chúng rất thích hợp để trên bàn làm việc, kệ trang trí hoặc làm quà tặng.', 'Sansevieria ‘hahnii’ Black Gold', 'Cây lưỡi hổ Thái xanh', 'Chiều cao: 10 – 15 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ / Chịu được thiếu sáng', 'Thay nước 2 – 3 lần/tháng'),
(17, 'RADE034', 'Cây hạnh phúc 1 thân để bàn trang trí tiểu cảnh', 350000.00, 'hanhphucmowgarden1-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(18, 'LONI027', 'Cây kim ngân 1 thân củ nhỏ chậu sứ trắng', 230000.00, 'cay-kim-ngan-mot-than-chau-su-de-ban-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao tổng: 15 – 20 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(19, 'LONI026', 'Cây kim ngân 1 thân trụ to chậu sứ trắng họa tiết', 320000.00, 'kimngan1than-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao tổng: 35 – 45cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(20, 'PEOB003', 'Cây trường sinh cẩm thạch chậu đất nung hoa cúc', 280000.00, 'truongsinhcamthach-800x960.jpg', 'Cây trường sinh cẩm thạch là một loại cây cảnh trong nhà đẹp mắt, với bộ lá luôn xanh mát, sức sống mãnh liệt, dễ chăm sóc. Đây cũng là loại cây phong thủy với tác dụng mang đến sức khỏe, may mắn và tiền tài tới cho gia chủ. Người ta thường hay tặng cây trường sinh vào những dịp đặc biệt như là một lời chúc phúc tới người nhận.', 'Peperomia obtusifolia var', 'Cây trường sinh cẩm thạch', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(21, 'STGF004', 'Cây lưỡi hổ Hoàng Kim Gold Flame chậu đất nung', 280000.00, 'cay-luoi-ho-hoang-kim-chau-dat-nung-1-800x960.jpg', 'Lưỡi hổ Gold Flame là dòng “cây cảnh quốc dân” được nhiều người lựa chọn để trồng trang trí trong nhà. Nó không những dễ sống đến mức “gần như bất tử” mà còn giúp mang lại vẻ đẹp tự nhiên, trên lá có những sọc vằn ấn tượng, lá cứng cáp và hình tượng rõ ràng, phù hợp để trồng trong mọi không gian nội thất.', 'Sansevieria trifasciata Gold Flame', 'Cây lưỡi hổ hoàng kim', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao: 40 – 50 cm\r\n• Số lượng thân: 3 thân', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Bóng râm; Chịu được bóng râm', 'Tưới nước 1 lần/tuần'),
(22, 'CANE004', 'Cây đuôi công Network chậu sứ trắng', 270000.00, 'cay-duoi-cong-mang-nhen-xanh-network-1-1-800x960.jpg', 'Với những vân lá tạo nên hoạ tiết ô lưới ngẫu nhiên độc đáo như một bức tranh mosaic kì công. Calathea Network tạo nên sự khác biệt không thể tìm thấy với bất kỳ loại cây nào.', '', 'Cây đuôi công ‘Network’', '• Kích thước chậu: 15x15cm (DxC)\r\n• Chiều cao tổng 25 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(23, 'CASA003', 'Cây đuôi công sọc Calathea Sanderiana chậu gốm sứ', 230000.00, 'cay-duoi-cong-soc-de-ban-800x960.jpg', 'Calathea ornata Sanderiana là loài thực vật thân thảo, có lá hình thuôn tròn, sọc trắng xanh. Loài này rất dễ sống, thường được trồng để trang trí trong nhà, thanh lọc không khí và mang ý nghĩa đem lại may mắn, thành công và thịnh vượng.', 'Cây đuôi công sọc', 'Calathea ornata Sanderiana', '', 'Dễ chăm sóc', 'Nhiều ánh sáng / tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(24, 'AGPL003', 'Cây hồng phát lộc Pink Lady chậu sứ trắng', 220000.00, 'cay-hong-phat-loc-chau-su-trang-1-800x960.jpg', 'Cây hồng phát lộc là loại cây nhỏ để bàn, có màu hồng phớt tươi mới và bắt mắt, giúp tạo điểm nhấn cho góc làm việc thêm sinh động. Chúng còn là dòng cây phong thủy, được cho rằng giúp mang lại những điều may mắn và thịnh vượng tới cho gia chủ. Hồng phát lộc cũng là một món quà rất ý nghĩa vào những dịp khai trương, sinh nhật hoặc dịp lễ.', 'Aglaonema ‘Pink Lady’', 'Cây hồng phát lộc', '• Kích thước chậu: 11×12 cm (DxC)\r\n• Chiều cao tổng: 25 – 30cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(25, 'ABSD004', 'Cây rồng bạc Silver Dragon chậu sứ trắng', 340000.00, 'cay-mon-rong-bac-chau-su-trang-800x960.jpg', 'Bạn không cần dành quá nhiều thời gian cho Rồng Bạc nhưng vẫn ngắm nhìn được vẻ đẹp của nó mỗi ngày.', 'Alocasia Silver Dragon', 'Rồng bạc', '• Kích thước chậu: 15x15cm (DxC)\r\n• Chiều cao tổng: 30 – 32 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(26, 'LONI022', 'Cây kim ngân một thân để bàn chậu sứ', 350000.00, 'cay-kim-ngan-de-ban-chau-su-tieu-canh-1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 20x18cm (DxC)\r\n• Chiều cao tổng: 30 – 35cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(27, 'PHBR005', 'Cây trầu bà đế vương kim cương Birkin chậu đất nung', 420000.00, 'cay-trau-ba-de-vuong-kim-cuong-chau-dat-nung-1-800x960.jpg', 'Đế vương kim cương sở hữu bộ lá xanh khoẻ khoắn, xen kẽ vân sọc trắng hài hoà và đầy cuốn hút. Chắc chắn nó sẽ là điểm nhấm tuyệt vời cho không gian nội thất, bớt đi sự nhàm chán và giúp cải thiện chất lượng không khí hiệu quả.', 'Philodendron Birkin', 'Trầu bà đế vương kim cương', '• Kích thước chậu: 18x30cm (DxC)\r\n• Chiều cao tổng: 60 – 70cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(28, 'BDCT004', 'Cây đa búp đỏ cẩm thạch một thân chậu sứ', 300000.00, 'cay-da-bup-do-cam-thach-chau-uom-800x960.jpg', 'Từ lâu cây Đa luôn là biểu tượng của sự trường tồn, sức sống dẻo dai, nơi chứa đựng thần quyền và tâm linh của con người. Chính lẽ đó mà trong phong thủy, Đa Búp Đỏ cũng mang ý nghĩa của sự may mắn, an lành.', 'Ficus Elastica Tineke', 'Đa búp đỏ cẩm thạch', 'Chiều cao 30 – 40cm', 'Rất dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(29, 'AGRA003', 'Cây vạn lộc son Red Anjamani để bàn chậu sứ', 320000.00, 'cay-van-loc-son-chau-su-trang-1-800x960.jpg', 'Cô tòng đuôi lươn sở hữu bộ lá nhiều màu sắc rực rỡ, cùng những đường viền hoa văn độc đáo, chúngthường được trồng trang trí cho bồn hoa, ban công hoặc trước hiên nhà. Loại cây này đôi lúc được trồng trong nhà, nhưng đòi hỏi phải trồng nơi có nhiều ánh sáng, gần cửa sổ.', 'Aglaonema ‘Red Anjamani’', 'Cây hồng phát lộc', '• Kích thước tán: 35 – 40cm\r\n• Chiều cao: 35 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(30, 'TUBO003', 'Cây tùng bồng lai cặp đôi tình yêu chậu sứ', 320000.00, 'cay-tung-bong-lai-tieu-canh-de-ban-1-800x960.jpg', 'Cây Tùng Bông Lai là một loài cây mang vẻ đẹp trang nhã, với tán lá dầy xanh mướt trông giống như những đám mây và có kích thước nhỏ gọn nên rất thích hợp để bàn làm việc. Chúng là loài cây dễ trồng nên không cần phải tốn công chăm sóc, tuy nhiên cần đặt tại nơi có nhiều ánh sáng.', 'Podocarpus macrophyllus', 'Cây tùng bồng lai', 'Chiều cao 20 – 25 cm', 'Trung bình', 'Nắng trực tiếp / nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(31, 'TUBO002', 'Cây Tùng bồng lai chậu đất nung wax hoa cúc', 320000.00, 'tungbonglaimowgarden-800x960.jpg', 'Cây Tùng Bông Lai là một loài cây mang vẻ đẹp trang nhã, với tán lá dầy xanh mướt trông giống như những đám mây và có kích thước nhỏ gọn nên rất thích hợp để bàn làm việc. Chúng là loài cây dễ trồng nên không cần phải tốn công chăm sóc, tuy nhiên cần đặt tại nơi có nhiều ánh sáng.', 'Podocarpus macrophyllus', 'Cây tùng bồng lai', 'Chiều cao 20 – 25 cm', 'Trung bình', 'Nắng trực tiếp / nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(32, 'SPI003', 'Cây cỏ lan chi để bàn chậu men bóng họa tiết', 180000.00, 'colanchimowgarden-800x960.jpg', 'Cỏ Lan Chi (hay còn gọi là Cỏ Nhện) là loại cây rất dễ sống với điều kiện khí hậu nóng tại Việt Nam. Đặc biệt, nó nằm trong top các loại cây lọc không khí rất hiệu quả, có thể đặt trong phòng ngủ giúp bạn có giấc ngủ trong lành hơn.', 'Chlorophytum laxum', 'Cây cỏ lan chi / cây dây nhện', '', 'Rất dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(33, 'ZAMI031', 'Cây kim tiền trưng tết chậu đất nung hoa cúc', 420000.00, 'cay-kim-tien-trung-tet-1-800x960.jpg', 'Cây kim tiền có lá hình xương cá màu xanh mướt. Loài này rất dễ sống phát triển mạnh ở những nơi có độ ẩm cao, thường được trồng để trang trí trong phòng khách, làm quà tặng tân gia, khai trương cửa hàng.', 'Zamioculcas Zamiifolia', 'Cây kim tiền / Kim phát tài', '• Kích thước chậu: 25×25 cm (DxC)\r\n• Chiều cao tổng: 50 – 60 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(34, 'AGSN009', 'Cây ngọc ngân Thái chậu gốm họa tiết cầu vồng', 250000.00, 'ngocnganmowgarden-800x960.jpg', 'Cây ngọc ngân là là cây trong nhà được đánh giá cao về phong thuỷ, người ta quan niệm rằng cây Ngọc ngân mang đến tài lộc, may mắn khi đặt trên bàn làm việc hay trang trí trong văn phòng. Về mặt tinh thần cây Ngọc ngân rất thích hợp làm quà tặng tình yêu.', 'Aglaonema Snow White', 'Cây ngọc ngân', '• Kích thước chậu: 17x17cm (DxC)\r\n• Chiều cao: 20 – 30cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Tránh ánh nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(35, 'LONI021', 'Cây kim ngân bính để bàn chậu sứ có hình', 250000.00, 'kimnganbinhmowgarden-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', 'Chiều cao 35cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Vừa phải (2 lần/tuần)'),
(36, 'RADE026', 'Cây hạnh phúc bonsai để bàn chậu sứ', 350000.00, 'cay-hanh-phuc-de-ban-bonsai-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao tổng: 30 – 32cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(37, 'ANTH008', 'Cây hồng môn tiểu cảnh thỏ trắng ôm túi may mắn', 420000.00, 'cay-hong-mon-trung-tet-tho-may-man-800x960.jpg', 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình yên hơn.', 'Anthurium andreanum', 'Cây hồng môn', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/lần'),
(38, 'ANTH007', 'Cây hồng môn cỡ lớn chậu gốm sứ', 480000.00, 'cay-hong-mon-lon-chau-gom-su-800x960.jpg', 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình yên hơn.', 'Anthurium andreanum', 'Cây hồng môn', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/lần'),
(39, 'LONI019', 'Cây kim ngân 3 thân để bàn chậu đất nung', 230000.00, 'cay-kim-ngan-3-than-de-ban-chau-dat-nung-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 20 – 25 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước 2 lần/tuần'),
(40, 'MOAD003', 'Cây trầu bà lỗ Monstera Adansonii chậu gốm sứ', 220000.00, 'cay-trau-ba-la-lo-chau-gom-su-1-800x960.jpg', 'Trầu bà lỗ có tên khoa học là, Monstera adansonii, hay còn được gọi là Swiss Cheese Vine, với bộ lá xanh mát hình chóp và dễ sống trong nhà nên loại cây này rất được ưu chuộng. Mỗi chiếc lá có đầy những lỗ hình bầu dục tự nhiên trông rất lạ mắt giúp nó khó nhầm lẫn với các loại cây khác.', 'Monstera adansonii', 'Cây trầu bà lỗ', '', 'Vừa phải', 'Nắng tán xạ / Bóng râm', 'Tưới nước 4 – 5 lần/tuần'),
(41, 'AGSN008', 'Cây ngọc ngân Snow White chậu đất nung', 175000.00, 'cay-ngoc-ngan-de-ban-chau-hoa-van-800x960.jpg', 'Cây ngọc ngân là là cây trong nhà được đánh giá cao về phong thuỷ, người ta quan niệm rằng cây Ngọc ngân mang đến tài lộc, may mắn khi đặt trên bàn làm việc hay trang trí trong văn phòng. Về mặt tinh thần cây Ngọc ngân rất thích hợp làm quà tặng tình yêu.', 'Aglaonema Snow White', 'Cây ngọc ngân', '• Kích thước chậu: 20x20cm (DxC)\r\n• Chiều cao: 20 – 30cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Tránh ánh nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(42, 'LONI018', 'Cây kim ngân 3 thân để bàn chậu đỏ phát tài', 280000.00, 'cay-kim-ngan-de-ban-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 20 – 25 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước 2 lần/tuần'),
(43, 'EAMQ001', 'Cây trầu bà lá sữa Marble Queen', 120000.00, 'cay-trau-ba-la-sua-marble-queen-800x960.jpg', 'Nhiều bạn nhầm lẫn loại này với trầu bà sữa nhưng Epipremnum Marble Queen là loại trầu bà đặc biệt với form lá ú tròn hơn gần giống như hình trái tim nhìn rất lạ mắt.', 'Epipremnum Marble Queen', 'Trầu bà lá sữa', '• Chiều cao 10 – 20 cm\r\n• Đường kính tán: 25 – 30 cm', 'Rất dễ chăm sóc', 'Ánh nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(44, 'LIVI004', 'Cây cọ lá xẻ mini để bàn chậu đất nung', 85000.00, 'cay-co-nhat-nho-de-ban-800x960.jpg', 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', 'Livistona chinensis', 'Cọ lá xẻ', '• Kích thước chậu: 14x14cm (DxC)\r\n• Chiều cao chậu + cây: 25cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(45, 'AGIG002', 'Cây tiểu bạch mã hoàng tử Ivy Green chậu ươm', 160000.00, 'cay-bach-ma-hoang-tu-mini-800x960.jpg', 'Cô tòng đuôi lươn sở hữu bộ lá nhiều màu sắc rực rỡ, cùng những đường viền hoa văn độc đáo, chúngthường được trồng trang trí cho bồn hoa, ban công hoặc trước hiên nhà. Loại cây này đôi lúc được trồng trong nhà, nhưng đòi hỏi phải trồng nơi có nhiều ánh sáng, gần cửa sổ.', 'Aglaonema ‘Ivy Green’', 'Cây tiểu bạch mã hoàng tử', '• Kích thước tán: 20 – 25cm\r\n• Chiều cao: 30 – 35 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(46, 'AGWL001', 'Cây giữ tiền White Lance chậu ươm', 120000.00, 'cay-giu-tien-nho-chau-uom-800x960.jpg', 'Cây giữ tiền là một trong các loại cây dễ chăm sóc mà vẫn luôn xanh tươi quanh năm, nhờ đó mà gia chủ không mất nhiều thời gian chăm sóc. Trong phong thủy, khi đặt Cây Giữ Tiền trong nhà sẽ mang lại ý nghĩa giúp tăng tài lộc, giữ gìn của cải trong nhà.', 'Aglaonema ‘White Lance’', 'Cây giữ tiền', 'Chiều cao: 30 – 40 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ / Bóng râm', 'Tưới nước 3 – 4 lần/tuần'),
(47, 'RADE019', 'Cây hạnh phúc một thân nhỏ chậu ươm', 320000.00, 'cay-hanh-phuc-mot-than-nho-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', 'Kích thước cây: 70 – 80 (cm)', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(48, 'RADE018', 'Cây hạnh phúc để bàn một thân chậu sứ', 250000.00, 'cay-hanh-phuc-de-ban-chau-su-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', '• Kích thước chậu: 12x12cm (DxC)\r\n• Chiều cao tổng: 30 – 35 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(49, 'LUCK002', 'Cây may mắn hình trái tim chậu sứ', 240000.00, 'cay-co-may-man-chau-su-1-800x960.jpg', 'Cây cỏ may mắn là một loại cây đặc biệt, được ươm từ những hạt thanh long và tạo hình bởi bàn tay khéo léo của người nghệ nhân. Trên những quả cầu màu xanh xanh là hàng vạn cây non được ươm trổ trông rất bắt mắt và độc đáo. Chúng được xem là biểu tượng cho tình yêu, hy vọng và sự may mắn nên thường được lựa chọn để làm quà tặng vào dịp đặc biệt.', '', '', '• Kích thước chậu: 11x11cm (DxC)\r\n• Chiều cao tổng: 40cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(50, 'CHAM006', 'Cây cau tiểu trâm mini mèo đi học chậu đất nung', 250000.00, 'cay-cau-tieu-cham-de-ban-chau-dat-nung-1-800x960.jpg', 'Công việc đòi hỏi bạn phải tiếp xúc hằng ngày với các thiết bị hiện đại có nhiều bức xạ điện tử như máy tính, máy in, điện thoại khiến cho tình trạng sức khỏe bị ảnh hưởng, dẫn đến giảm chất lượng công việc. Hãy thử trồng một cây Cau Tiểu Trâm để bàn với tác dụng tuyệt vời đã được minh chứng.', 'Chamaedorea elegans', 'Cau tiểu trâm', '• Kích thước chậu:  (DxC)\r\n• Chiều cao tổng:', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần)'),
(51, 'LONI021', 'Cây kim ngân bính để bàn chậu sứ có hình', 250000.00, 'kimnganbinhmowgarden-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', 'Chiều cao 35cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Vừa phải (2 lần/tuần)'),
(52, 'PEWA003', 'Cây dưa hấu Watermelon để bàn chậu cú mèo', 180000.00, 'cay-dua-hau-chau-dat-nung-hinh-cu-1-800x960.jpg', 'Cây dưa hấu có kích thước nhỏ gọn, là hình bầu dục, tán lá sọc xanh sẫm và thân màu đỏ. Chính là kiểu lá sọc xanh tựa như cây dưa hấu nên chúng được đặt tên là cây dưa hấu ‘ Watermelon’. Tuy những chiếc lá khá mỏng manh, nhưng nó lại có sức sống rất khỏe, dễ chăm sóc.', 'Peperomia ‘Watermelon’', 'Cây dưa hấu', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/tháng'),
(53, 'KIGI001', 'Cây kim giao để bàn tiểu cảnh mèo chiêu tài', 360000.00, 'cay-kim-giao-tieu-canh-de-ban-1-800x960.jpg', 'Kim giao là một cây thân gỗ có giá trị kinh tế lớn. Nhờ có sức sống mạnh mẽ, kiểu dáng đẹp, lá xum xuê và xanh mướt nên chúng cũng được nhân giống để làm cây cảnh để bàn, giúp tạo không gian xanh mát và thư giãn. Đồng thời đây cũng là một loại cây mang ý nghĩa phong thủy rất tốt. Rất thích hợp làm quà tặng.', 'Nageia fleuryi', 'Cây kim giao', 'Chiều cao 40 – 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/ngày'),
(54, 'SCMI002', 'Cây sen đá mix chậu lu bể đất nung', 280000.00, 'sen-da-mix-chau-lu-dat-nung-nho-1-800x960.jpg', 'Cô tòng đuôi lươn sở hữu bộ lá nhiều màu sắc rực rỡ, cùng những đường viền hoa văn độc đáo, chúngthường được trồng trang trí cho bồn hoa, ban công hoặc trước hiên nhà. Loại cây này đôi lúc được trồng trong nhà, nhưng đòi hỏi phải trồng nơi có nhiều ánh sáng, gần cửa sổ.', 'Aglaonema ‘Pink Lady’', 'Cây hồng phát lộc', '• Kích thước tán: 35 – 40cm\r\n• Chiều cao: 35 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(55, 'SCMI001', 'Cây sen đá mix chậu lu bể đất nung', 320000.00, 'sen-da-mix-chau-lu-dat-nung-800x960.jpg', 'Cô tòng đuôi lươn sở hữu bộ lá nhiều màu sắc rực rỡ, cùng những đường viền hoa văn độc đáo, chúngthường được trồng trang trí cho bồn hoa, ban công hoặc trước hiên nhà. Loại cây này đôi lúc được trồng trong nhà, nhưng đòi hỏi phải trồng nơi có nhiều ánh sáng, gần cửa sổ.', 'Aglaonema ‘Pink Lady’', 'Cây hồng phát lộc', '• Kích thước tán: 35 – 40cm\r\n• Chiều cao: 35 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nơi râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(56, 'LYRA035', 'Cây bàng Singapore mini để bàn tiểu cảnh Uyên Ương', 250000.00, 'cay-bang-singapore-mini-uyen-uong-800x960.jpg', 'Cây bàng Singapore đang loại cây trong nhà được nhiều người ưu chuộng với bộ lá màu xanh lá mượt mà, dáng thẳng đứng thanh lịch và sang trọng giúp cho không gian nhà bạn thêm phần sinh động. B', 'Ficus lyrata', 'Cây bàng Singapore', 'Chiều cao 20 ~ 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(57, 'PHIL152', 'Cây hồng hạc thân cam Philodendron billietiae chậu đất nung', 1550000.00, 'cay-hong-hac-mini-Philodendron-Billietiae-chau-uom-2-1-800x960.jpg', 'Cây Hạc Cam đặc trưng bởi những chiếc lá thuôn dài, hình dây đeo có xẻ trái tim sâu, phần cuống cũng được tô điểm bởi màu da cam rất bắt mắt. Khi trưởng thành cây hạc Philodendron billietiae có kích thước rất khủng nên được nhiều người săn đón sưu tầm.', 'Philodendron billietiae', 'Cây hồng hạc chân cam', 'Kích thước chậu: 32×25 cm (DxC)\r\nKích thước lá: 45 ~ 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(58, 'PHIL151', 'Cây hồng hạc thân cam Philodendron billietiae chậu ươm', 1200000.00, 'cay-hong-hac-mini-Philodendron-Billietiae-chau-uom-1-800x960.jpg', 'Cây Hạc Cam đặc trưng bởi những chiếc lá thuôn dài, hình dây đeo có xẻ trái tim sâu, phần cuống cũng được tô điểm bởi màu da cam rất bắt mắt. Khi trưởng thành cây hạc Philodendron billietiae có kích thước rất khủng nên được nhiều người săn đón sưu tầm.', 'Philodendron billietiae', 'Cây hồng hạc chân cam', 'Chiều cao 40 ~ 50 cm\r\nKích thước lá: 45 ~ 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(59, 'ANTH003', 'Cây hồng môn nhỏ để bàn chậu sứ', 240000.00, 'cay-hong-mon-mini-de-ban-chau-su-800x960.jpg', 'Cây hồng môn được biết tới là một loại cây cảnh mang lại điều tốt lành, có thể giúp điều hòa khí phong thủy trong nhà, có khả năng thu hút những dòng khí tích cực và làm tiêu bớt dòng khí tiêu cực cho môi trường xung quanh, trồng cây hồng môn trong nhà sẽ giúp không gian sống trở nên hài hòa và bình yên hơn.', 'Anthurium andreanum', 'Cây hồng môn', 'Chiều cao 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/lần'),
(60, 'CTBT001', 'Cây tùng bách tán tiểu cảnh để bàn chậu sứ', 420000.00, 'cay-tung-bach-tan-de-ban-800x960.jpg', 'Cây tùng bách tán sở hữu kiểu dáng vô cùng độc đáo với những chiếc lá thuôn nhọn, bóng mượt và có màu xanh đậm, chúng mọc dọc theo cành đều đặn đúng theo hình xương cá.', 'Araucaria angustifolia', 'Cây tùng bách tán', 'Chiều cao 30 ~ 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(61, 'PHIL150', 'Cây hồng hạc thân cam Philodendron billietiae chậu ươm', 250000.00, 'cay-hong-hac-mini-Philodendron-Billietiae-chau-uom-800x960.jpg', 'Cây Hạc Cam đặc trưng bởi những chiếc lá thuôn dài, hình dây đeo có xẻ trái tim sâu, phần cuống cũng được tô điểm bởi màu da cam rất bắt mắt. Khi trưởng thành cây hạc Philodendron billietiae có kích thước rất khủng nên được nhiều người săn đón sưu tầm.', 'Philodendron billietiae', 'Cây hồng hạc chân cam', 'Chiều cao 30 ~ 40 cm\r\nKích thước lá: 20 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(62, 'SCHE007', 'Cây ngũ gia bì bonsai để bàn chậu sứ', 320000.00, 'cay-ngu-gia-bi-bonsai-de-ban-chau-su-1-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', 'Chiều cao 30 ~ 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(63, 'SCHE006', 'Cây ngũ gia bì bonsai chậu sứ', 280000.00, 'cay-ngu-gia-bi-bonsai-chau-su-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', 'Chiều cao 30 ~ 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(64, 'SCHE004', 'Cây ngũ gia bì xanh mini chậu sứ', 160000.00, 'cay-ngu-gia-bi-xanh-de-ban-chau-men-su-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', 'Chiều cao 30 ~ 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(65, 'LONI016', 'Cây kim ngân thắt nơ chậu sứ', 320000.00, 'cay-kim-ngan-that-no-tieu-canh-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 40cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước (2 lần/tuần)'),
(66, 'LONI015', 'Cây kim ngân tiểu cảnh để bàn', 380000.00, 'cay-kim-ngan-chau-su-tieu-canh-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 40cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước (2 lần/tuần)'),
(67, 'LONI014', 'Cây kim ngân thủy sinh một thân cổ thụ để bàn', 250000.00, 'cay-kim-ngan-thuy-sinh-mot-than-tru-lon-800x960.jpg', 'Cây Kim Ngân (Pachira aquatica) là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', 'Pachira aquatica', 'Cây kim ngân', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Thay nước 2 – 3 lần/tháng'),
(68, 'LYRA016', 'Cây bàng Singapore để bàn chậu men sứ', 220000.00, 'cay-bang-singapore-mini-de-ban-1-800x960.jpg', 'Bàng Singapore là loại cây nội thất đang được ưa chuộng nhất hiện nay bởi cây có khả năng cải thiện chất lượng không khí mang lại sự xanh mát và sang trọng cho không gian.', 'Ficus lyrata', 'Cây bàng Singapore', 'Kích thước chậu: 15×15 cm\r\nChiều cao tổng: ~40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(69, 'LYRA014', 'Cây bàng Singapore mini chậu men sứ', 180000.00, 'cay-bang-singapore-mini-de-ban-2-800x960.jpg', 'Cây bàng Singapore đang loại cây trong nhà được nhiều người ưu chuộng. Với bộ lá màu xanh lá mượt mà, dáng thẳng đứng thanh lịch và sang trọng giúp cho không gian nhà bạn thêm phần sinh động. Cây cũng có khả năng thanh lọc không khí giúp không gian thêm trong lanh.', 'Ficus lyrata', 'Bàng singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(70, 'LYRA013', 'Cây bàng Singapore mini chậu men sứ', 180000.00, 'cay-bang-singapore-mini-800x960.jpg', 'Cây bàng Singapore đang loại cây trong nhà được nhiều người ưu chuộng. Với bộ lá màu xanh lá mượt mà, dáng thẳng đứng thanh lịch và sang trọng giúp cho không gian nhà bạn thêm phần sinh động. Cây cũng có khả năng thanh lọc không khí giúp không gian thêm trong lanh.', 'Ficus lyrata', 'Bàng singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(71, 'LYRA012', 'Cây bàng Singapore mini chậu men sứ', 160000.00, 'cay-bang-singapore-mini-de-ban-800x960.jpg', 'Cây bàng Singapore đang loại cây trong nhà được nhiều người ưu chuộng. Với bộ lá màu xanh lá mượt mà, dáng thẳng đứng thanh lịch và sang trọng giúp cho không gian nhà bạn thêm phần sinh động.', 'Ficus lyrata', 'Bàng singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(72, 'ZAMI008', 'Cây kim tiền nhỏ để bàn chậu sứ', 285000.00, 'cay-kim-tien-nho-de-ban-800x960.jpg', 'Cây kim tiền được đánh giá rất cao là loại cây phong thủy đem đến tài lộc, thịnh vượng, giàu sang, sức khỏe cho gia chủ.Đặc biệt khi kim tiền nở hoa gia chủ càng đắc lộc.', 'Zamioculcas zamiifolia', '', 'Chiều cao 20 – 30cm', 'Dễ chăm sóc', 'Nắng tán xạ hoặc trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(73, 'ZAMI007', 'Cây kim tiền nhỏ để bàn chậu sứ', 200000.00, 'cay-kim-tien-chau-su-de-ban-800x960.jpg', 'Cây kim tiền được đánh giá rất cao là loại cây phong thủy đem đến tài lộc, thịnh vượng, giàu sang, sức khỏe cho gia chủ.Đặc biệt khi kim tiền nở hoa gia chủ càng đắc lộc.', 'Zamioculcas zamiifolia', '', 'Chiều cao 20 – 30cm', 'Dễ chăm sóc', 'Nắng tán xạ hoặc trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(74, 'LONI009', 'Cây kim ngân bính để bàn chậu sứ', 160000.00, 'cay-kim-ngan-that-binh-nho-chau-su-1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', '• Kích thước chậu: 12×11 cm (DxC)\r\n• Chiều cao tổng: 30cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(75, 'LONI007', 'Cây kim ngân một thân trụ nhỏ chậu sứ', 180000.00, 'cay-kim-ngan-mot-than-chau-su-1-800x960.jpg', 'Cây Kim Ngân là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', 'Pachira aquatica', 'Cây kim ngân', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(76, 'LONI006', 'Cây kim ngân một thân trụ to chậu sứ', 320000.00, 'cay-kim-ngan-mot-than-tru-to-chau-su-de-ban-1a-800x960.jpg', 'Cây Kim Ngân (Pachira aquatica) là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', 'Pachira aquatica', 'Cây kim ngân', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Thay nước 2 – 3 lần/tháng'),
(77, 'LONI003', 'Cây kim ngân thân trụ to để bàn chậu ươm', 240000.00, 'cay-kim-ngan-mot-than-tru-to-800x960.jpg', 'Cây kim ngân thân xoắn với dáng cao độc đáo rất phù hợp để trang trí trong nhà, như là trong phòng khách, kệ trang trí hoặc bàn làm việc. Nà là giống cây cảnh nội thất có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 50cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Vừa phải (2 lần/tuần)'),
(78, 'LONI001', 'Cây kim ngân một thân mini chậu ươm', 120000.00, 'cay-kim-ngan-mot-than-mini-de-ban-chau-uom-800x960.jpg', 'Kim ngân là loại cây mang ý nghĩa may mắn, tài lộc và thường được làm quà biếu trong các dịp khai trương, tân gia, lên chức… như lời cầu chúc vạn sự may mắn, tấn tài tấn lộc đến người nhận.', 'Lonicera periclymenum', 'Cây kim ngân', 'Cao 30 – 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(79, 'CHAM005', 'Cây cau tiểu trâm mini cặp đôi công viên chậu sứ', 250000.00, 'cay-cau-tieu-tram-mini-de-ban-800x960.jpg', 'Công việc đòi hỏi bạn phải tiếp xúc hằng ngày với các thiết bị hiện đại có nhiều bức xạ điện tử như máy tính, máy in, điện thoại khiến cho tình trạng sức khỏe bị ảnh hưởng, dẫn đến giảm chất lượng công việc. Hãy thử trồng một cây Cau Tiểu Trâm để bàn với tác dụng tuyệt vời đã được minh chứng.', 'Chamaedorea elegans', 'Cau tiểu trâm', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao tổng: 30 – 35 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần)'),
(80, 'PODO001', 'Cây tùng la hán mini để bàn chậu sứ', 180000.00, 'cautieutramdebanmowgarden2-800x960.jpg', 'Cây tùng trong phong thủy được coi là loài cây quý có linh khí rất tốt bởi chúng có thể sống hàng trăm năm, giúp cản gió độc, xua đuổi tà khí, tránh những điều xui xẻo và đem lại sự trường thọ gia chủ.', 'Podocarpus brevifolius', 'Tùng la hán', 'Chiều cao: 15 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ', 'Tưới nước 1 – 2 lần/tuần'),
(81, 'PINA003', 'Cây tuyết tùng chậu sứ trắng để bàn', 180000.00, 'tuyettungdebanmowgarden-800x960.jpg', 'Tuyết tùng là một trong những loại cây phong thủy để bàn được nhiều người yêu thích bởi vẻ đẹp mộc mạc, cùng những ý nghĩa tốt đẹp mà nó mang lại. Lá tuyết tùng thon gọn, ôm lấy nhau và rủ xuống tựa như những bông tuyết đang đọng lại trên lá', 'Cedrus', 'Cây tuyết tùng', 'Cao 15 – 20cm gồm chậu', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(82, 'PEPE001', 'Cây Hạnh tiên thảo đỏ chậu gốm để bàn Peperomia Caperata', 250000.00, 'hanh-tien-thao-do-mowgarden-800x960.jpg', 'Không đòi hỏi gắt gao trong việc chăm sóc nên rất thích hợp trồng chậu trang trí nội lẫn ngoại thất.', 'Peperomia Caperata', 'Hạnh tiên thảo đỏ', 'Cao 15 – 25 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(83, 'ALOCA007', 'Cây Rồng Bạc để bàn – Alocasia Baginda Silver Dragon –', 280000.00, 'cay-rong-bac-de-ban-mowgarden-800x960.jpg', 'Bạn không cần dành quá nhiều thời gian cho Rồng Bạc nhưng vẫn ngắm nhìn được vẻ đẹp của nó mỗi ngày.', 'Alocasia Silver Dragon', 'Rồng bạc', 'Cao 15 – 20 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(84, 'RHAP002', 'Cây Monstera form Thái mini chậu gốm Rhaphidophora Tetrasperma', 350000.00, 'cay-mons-mini-800x960.jpg', 'Thường bị nhầm lẫn với Monstera deliciosa phiên bản mini vì hình dáng lá trông khá tương đồng.', 'Rhaphidophora tetrasperma', 'Trầu bà lá xẻ mini form Thái', 'Cao 60 – 70 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(85, 'SCIN001', 'Cây Trầu bà lụa chậu gốm để bàn Scindapsus pictus Exotica', 250000.00, 'trau-ba-lua-Scindapsus-pictus-Exotica-mowgarden-800x960.jpg', 'Dễ dàng được lòng những người thích cây treo, cây leo hoặc các giống cây quý hiếm vì nó có hoa văn và màu sắc đẹp.', 'Scindapsus pictus Exotica', 'Trầu bà lụa', 'Cao 10 – 20 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(86, 'DRAC001', 'Cây phát lộc chậu sứ để bàn', 135000.00, 'cay-phat-loc-de-ban-1-800x960.jpg', 'Cây phát lộc là loại cây phong thủy để bàn có khả năng đem lại vận khí tốt cho sức khỏe, tình yêu và sự thịnh vượng. Loại cây này rất thích hợp dùng để làm quà tặng, bởi nó mang ý nghĩa như lời chúc phát triển sự nghiệp dành cho người được tặng.', 'Dracaena sanderiana', 'Cây phát lộc', 'Cao 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được thiếu nắng', 'Ít nước, 2 – 3 lần/tuần'),
(87, 'PHIL008', 'Cây Trầu bà cánh én để bàn chậu mini Philodendron Squamiferum', 250000.00, 'trau-ba-canh-en-mowgarden-800x960.jpg', 'Ngoài vẻ đẹp và làm cảnh, trong một số nền văn hóa, cây Philodendron tượng trưng cho sức khỏe và sự dồi dào. Nó được biết đến là một dấu hiệu của sự may mắn.', 'Philodendron Squamiferum', 'Trầu bà cánh én', 'Cao 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(88, 'RHAP001', 'Cây lá xẻ form Thái mini chậu gốm Rhaphidophora Tetrasperma', 500000.00, 'mons-mini-Thai-rhaphidophora-tetrasperma-mowgarden-800x960.jpg', 'Thường bị nhầm lẫn với Monstera deliciosa phiên bản mini vì hình dáng lá trông khá tương đồng.', 'Rhaphidophora tetrasperma', 'Trầu bà lá xẻ mini form Thái', 'Cao 60 – 70 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(89, 'MONS008', 'Cây Trầu Bà Lỗ để bàn Monstera adansonii Monkey Mask –', 350000.00, 'cay-trau-ba-lo-mowgarden-800x960.jpg', 'Monstera adansonii là cây thân thảo, thích nghi với bóng râm hoàn toàn, vì vậy chúng thường được trồng trong nhà, sức sống mạnh mẽ, dễ dàng chăm sóc và có thể tồn tại trong nhiều môi trường khác nhau, gốc nhiều nhánh và đốt.\r\nVới những chiếc lá xanh tươi, thân hình nhỏ nhắn trông rất dễ thương có thể sẽ rất phù hợp với các bạn nữ, nhân viên văn phòng trong lúc mệt mỏi có thể ngắm nhìn để giải tỏa phần nào áp lực công việc, cuộc sống.', '', 'Cây Trầu Bà Lỗ', '', 'Vừa phải', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(90, 'DVX002', 'Cây Trầu Bà Đế Vương Xanh Để Bàn', 350000.00, 'trau-ba-de-vuong-xanh-de-ban-mowgarden-800x960.jpg', 'Trầu Bà Đế Vương có tên tiếng Anh là Philodendron Imperial thuộc họ Araceae (Ráy). Nguồn gốc của cây từ đảo Solomon, nguyên sinh ở Indonesia, là dòng cây thân thảo, trong tự nhiên dòng cây này có thể cao hơn 1.5m, nhưng với mục đích trang trí thì MOW sẽ gửi đến các bạn cây với kích cỡ nhỏ để tiện đặt ở bất cứ đâu mình thích.', '', 'Cây Trầu Bà Đế Vương Xanh', '', 'Vừa phải', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(91, 'SANS002', 'Cây Lưỡi hổ kim cương đen để bàn Sansevieria Trifasciata Black Diamond', 300000.00, 'luoi-ho-thai-Sansevieria-Black-Diamond-800x960.jpg', 'Lưỡi hổ “Black Diamond” không có nhiều vằn như những loại lưỡi hổ khác, nhưng nó lại sở hữu bộ lá màu xanh lá bóng mượt ấn tượng, mang lại nét cứng cáp tự nhiên cho không gian nội thất.', 'Sansevieria trifasciata Black Diamond', 'Lưỡi hổ Thái kim cương đen', 'Cao 20 – 25 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(92, 'SANS001', 'Cây Ngà voi chậu gốm để bàn Sansevireria Cylindrica', 300000.00, '92-cay-nga-voi-800x960.jpg', 'Hình dáng bên ngoài độc đáo như chính tên gọi, bởi giống như những chiếc ngà voi vươn thẳng lên cao.', 'Sansevireria Cylindrica', 'Ngà voi', 'Cao 20 – 25 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(93, 'LONI010', 'Cây kim ngân để bàn chậu sứ tuổi Tuất', 250000.00, 'cay-kim-ngan-de-ban-chau-gom-mowgarden-800x960.jpg', 'Kim ngân là loại cây mang ý nghĩa may mắn, tài lộc và thường được làm quà biếu trong các dịp khai trương, tân gia, lên chức… như lời cầu chúc vạn sự may mắn, tấn tài tấn lộc đến người nhận.Chọn vị trí đặt cây cũng khá quan trọng để thu hút sự thịnh vượng và may mắn cho gia chủ.', 'Lonicera periclymenum', 'Cây kim ngân', 'Cao 30 – 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(94, 'STM001', 'Cây lưỡi hổ bạc chậu gốm mini để bàn', 300000.00, 'luoihobac-800x960.jpg', 'Đây sẽ là món quà ý nghĩa để tặng đối tác, bạn bè, người thân vào những dịp đặc biệt như mừng sinh nhật, tân gia, mừng năm mới.', 'Sansevieria trifasciata Moonshine', 'Lưỡi hổ bạc', 'Cao 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(95, 'LONI005', 'Cây kim ngân thủy sinh để bàn', 150000.00, 'cay-kim-ngan-mot-than-thuy-sinh-1-800x960.jpg', 'Cây Kim Ngân (Pachira aquatica) là dòng cây nội thất được ưu chuộng và phổ biến nhất trên thế giới, nó được biết đến là loại cây phong thủy giúp mang lại những điều tốt lành, vận may và tiền tài tới cho gia chủ.', 'Pachira aquatica', 'Cây kim ngân', '', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu râm mát', 'Thay nước 2 – 3 lần/tháng'),
(96, 'CTBC007', 'Cây trầu bà cột chậu xi măng trụ vuông', 1100000.00, 'cay-trau-ba-cot-chau-xi-mang-van-soc-ngang-1-800x960.jpg', 'Có tác dụng thanh lọc không khí trong nhà mà còn chứa đựng ý nghĩa phong thủy rất tốt, mang dáng vẻ thanh lịch và sang trọng.', 'Epipremnum aureum', 'Trầu bà xanh', '• Chiều cao 130 – 140 cm\r\n• Kích thước chậu: 30x58cm (DxC)', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 3 – 4 lần/tuần'),
(97, 'SCHE020', 'Cây ngũ gia bì cẩm thạch nhỏ chậu ươm', 100000.00, 'cay-ngu-gia-bi-cam-thach-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì cẩm thạch', 'Chiều cao tổng: 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(98, 'BUBU007', 'Cây bàng Đài Loan cẩm thạch chậu sứ', 1200000.00, '11-cay-bang-dai-loan-cam-thach-chau-su-trang-1-800x960.jpg', 'Cây Bàng Đài Loan Cẩm Thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida Buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 42×47 cm (DxC)\r\n• Chiều cao tổng: 130–140 cm', 'Dễ chăm sóc', 'Nắng trực tiếp / Nắng tán xạ', 'Tưới nước 4 – 5 lần/tuần');
INSERT INTO `san_pham` (`id`, `code`, `ten_san_pham`, `gia_ban`, `hinh_anh`, `mo_ta`, `ten_khoa_hoc`, `ten_thong_thuong`, `quy_cach_san_pham`, `do_kho`, `yeu_cau_anh_sang`, `nhu_cau_nuoc`) VALUES
(99, 'LYRA048', 'Cây bàng Singapore mini để bàn chậu sứ', 180000.00, '7-cay-bang-singapore-nho-de-ban-chau-su-1-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(100, 'SCHE019', 'Cây ngũ gia bì để bàn chậu sứ thổ cẩm', 220000.00, 'cay-ngu-gia-bi-chau-su-hoa-tiet-trang-tri-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', '• Kích thước chậu: 20×18 cm (DxC)\r\n• Chiều cao tổng: 40-50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(101, 'CPTN014', 'Cây phát tài núi 2 tầng dáng thấp chậu đá mài', 1650000.00, 'cay-phat-tai-nui-chau-da-mai-wax-1-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', '• Kích thước chậu: 38.5x30cm (DxC)\r\n• Chiều cao tổng: 120 – 130 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(102, 'LYRA047', 'Cây bàng Singapore 2 thân chậu đá mài', 680000.00, 'cay-bang-singapore-chau-da-mai-tru-tron-1a-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(103, 'LYRA046', 'Cây bàng Singapore nhiều thân chậu sứ trắng', 2250000.00, 'cay-bang-singapore-co-lon-chau-su-trang-1-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(104, 'SCHE018', 'Cây ngũ gia bì để bàn chậu đất nung', 150000.00, 'cay-ngu-gia-bi-de-ban-chau-dat-nung-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', '• Kích thước chậu: 12x11cm (DxC)\r\n• Chiều cao tổng: 20 – 24cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(105, 'CPTN013', 'Cây phát tài núi 2 tầng chậu đá mài', 1750000.00, 'cay-phat-tai-nui-chau-da-mai-den-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', '• Kích thước chậu: 36x36cm (DxC)\r\n• Chiều cao tổng: 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(106, 'CVNB001', 'Cây cau vàng Nhật Bản chậu ươm', 400000.00, 'cau-vang-nhat-ban-chau-uom-1-800x960.jpg', 'Cau vàng Nhật Bản là dòng cau cảnh chịu bóng râm rất tốt, có chiều cao chỉ từ 80~100cm, tán lá gọn gàng nên rất thích hợp để trưng bày trong không gian nội thất. Là một trong những loại cau kiểng được ưu chuộng bởi khả năng mang lại không gian xanh mát, lọc không khí và ý nghĩa tốt trong phong thủy.', 'Chrysalidocarpus lutescens', 'Cau vàng Nhật Bản', 'Chiều cao 80 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ, bóng râm', 'Tưới nước 2 – 3 lần/tuần'),
(107, 'CTBC006', 'Cây trầu bà cột chậu đá mài trụ vuông', 1250000.00, 'traubacotmowgarden-800x960.jpg', 'Có tác dụng thanh lọc không khí trong nhà mà còn chứa đựng ý nghĩa phong thủy rất tốt, mang dáng vẻ thanh lịch và sang trọng.', 'Epipremnum aureum', 'Trầu bà xanh', '•Cao 160 – 170 cm\r\n•Kích thước chậu: 40x60cm (DxC)', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(108, 'CPTN012', 'Cây phát tài núi 2 tầng chậu sứ', 1750000.00, 'phattaituimowgarden3-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', 'Chiều cao 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước, 2 – 3 lần/tuần'),
(109, 'CPTN011', 'Cây phát tài núi 2 tầng chậu xi măng đá mài', 1750000.00, 'phattainuimowgarden1-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', 'Chiều cao 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước, 2 – 3 lần/tuần'),
(110, 'LONI028', 'Cây kim ngân thắt bính cao chậu đất nung giả đá', 980000.00, 'kimnganbinhmowgarden2-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 40x30cm (DxC)\r\n•Chiều cao tổng: 150 – 160cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(111, 'LYRA045', 'Cây bàng Singapore 2 nhánh chậu xi măng để sàn', 480000.00, 'bangsingmowgarden1-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(112, 'LONI025', 'Cây kim ngân thắt bính cao chậu đất nung vintage', 950000.00, 'kimnganbinhmowgarden1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 40x30cm (DxC)\r\n• Chiều cao tổng: 150 – 160cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(113, 'LONI024', 'Cây kim ngân thắt bính cao chậu đất nung vintage', 950000.00, 'cay-kim-ngan-that-binh-chau-xi-mang-da-mai-1-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 30x30cm (DxC)\r\n• Chiều cao tổng: 150 – 160cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ / Nắng trực tiếp / Chịu râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(114, 'RADE024', 'Cây hạnh phúc một thân cao 1m6 chậu đất nung', 900000.00, 'cay-hanh-phuc-mot-than-chau-dat-nung-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', '• Kích thước chậu: 30x30cm (DxC)\r\n• Chiều cao tổng: 150 – 160cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(115, 'LONI023', 'Cây kim ngân thắt bính cao 1m8 chậu sứ trắng', 1150000.00, 'cay-kim-ngan-binh-co-lon-cao-1m8-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân bính', '• Kích thước chậu: 40x30cm (DxC)\r\n•Chiều cao tổng: 170 – 180cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(116, 'LYRA043', 'Cây bàng Singapore dáng tree gốc to chậu xi măng', 1500000.00, 'cay-bang-singapore-dang-tree-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(117, 'SCHE017', 'Cây ngũ gia bì để sàn chậu trụ tròn đá mài', 750000.00, 'cay-ngu-gia-bi-chau-da-mai-1-800x960.jpg', 'Ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì', '• Kích thước chậu: 30x50cm (DxC)\r\n• Chiều cao tổng: 130 – 140cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(119, 'CPTN010', 'Cây phát tài núi 2 tầng chậu xi măng họa siết sọc', 1700000.00, 'phattainuimowgarden-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', 'Chiều cao 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước, 2 – 3 lần/tuần'),
(120, 'BUBU005', 'Cây bàng Đài Loan cẩm thạch chậu xi măng trụ tròn cao', 750000.00, 'bangdailoancamthachmowgarden-800x960.jpg', 'Cây Bàng Đài Loan Cẩm Thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida Buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 30×60 cm (DxC)\r\n• Chiều cao tổng: 120–130 cm', 'Dễ chăm sóc', 'Nắng trực tiếp / Nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(121, 'CTBH008', 'Cây trúc bách hợp một thân chậu xi măng', 950000.00, 'cay-truc-bach-hop-chau-da-mai-giot-nuoc-800x960.jpg', 'Còn được gọi là trúc phất dụ, mọc thành bụi sum sê, ở chính giữa tạo thành hình hoa thị và tua tủa ra xung quanh. Cây có thân cứng, lá thuôn nhọn ở đầu, mép nguyên, màu xanh bóng xen lần dải màu vàng tươi từ gốc tới ngọn', 'Dracaena reflexa', 'Trúc bách hợp', '• Kích thước chậu: 33×52 cm\r\n• Chiều cao tổng: 120 – 130 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(122, 'LONI020', 'Cây kim ngân thắt bính chậu đất nung', 990000.00, 'cay-kim-tien-chau-da-nung-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 120 – 140 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới nước 2 lần/tuần'),
(123, 'LONI019', 'Cây kim ngân 3 thân để bàn chậu đất nung', 230000.00, 'cay-kim-ngan-3-than-de-ban-chau-dat-nung-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 20 – 25 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước 2 lần/tuần'),
(126, 'RADE025', 'Cây hạnh phúc một thân cao 150cm chậu đá mài', 990000.00, 'cay-hanh-phuc-mot-than-chau-da-mai-800x960.jpg', 'Cây hạnh phúc là dòng cây cảnh đẹp, sức sống khỏe mạnh, dễ chăm sóc. Trên cây có những tán lá xanh tươi, mượt mà thể hiện cho sự hi vọng và niềm tin mạnh mẽ. Với ý nghĩa mang lại may mắn và hạnh phúc nên cây thường được chọn để làm cây trưng trong nhà hoặc làm quà tặng.', 'Radermachera Sinica', 'Cây hạnh phúc', '• Kích thước chậu: 30x30cm (DxC)\r\n• Chiều cao tổng: 150 – 160cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(128, 'LONI018', 'Cây kim ngân 3 thân để bàn chậu đỏ phát tài', 280000.00, 'cay-kim-ngan-de-ban-800x960.jpg', 'Cây Kim Ngân là loại cây cảnh trong nhà được trồng phổ biến trên khắp thế giới, nó có sức ảnh hưởng tới mức mà hầu như ai cũng tin rằng khi trồng có thể mang lại nhiều may mắn trong cuộc sống, công việc hoặc làm ăn.', 'Pachira aquatica', 'Cây kim ngân', 'Chiều cao 20 – 25 cm', 'Dễ chăm sóc', 'Ánh sáng tán xạ; Nắng trực tiếp', 'Tưới ít nước 2 lần/tuần'),
(129, 'EAMQ001', 'Cây trầu bà lá sữa Marble Queen', 120000.00, 'cay-trau-ba-la-sua-marble-queen-800x960.jpg', 'Nhiều bạn nhầm lẫn loại này với trầu bà sữa nhưng Epipremnum Marble Queen là loại trầu bà đặc biệt với form lá ú tròn hơn gần giống như hình trái tim nhìn rất lạ mắt.', 'Epipremnum Marble Queen', 'Trầu bà lá sữa', '• Chiều cao 10 – 20 cm\r\n• Đường kính tán: 25 – 30 cm', 'Rất dễ chăm sóc', 'Ánh nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(134, 'SAZE002', 'Cây lưỡi hổ xanh Zeylanica chậu xi măng đá mài', 350000.00, 'cay-luoi-ho-xanh-chau-xi-mang-800x960.jpg', 'Lưỡi hổ có lẽ là loại cây nội thất quen thuộc nhất đối với những người yêu cây cảnh. Loài cây này có khả năng chịu nóng, chịu hạn tốt, sống được trong bóng râm và đặc biệt nó có khả năng lọc không khí rất tuyệt vời.', 'Sansevieria zeylanica', 'Lưỡi hổ xanh', '• Kích thước chậu: 30×30 cm\r\n• Chiều cao tổng: 80 – 90 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ, chịu được thiếu nắng', 'Tưới nước 2 – 3 lần/tuần'),
(135, 'PNIX010', 'Cây cau nga mi cao 150-160cm chậu xi măng trắng', 1850000.00, 'cau-nga-mi-chau-da-mai-800x960.jpg', 'Cau Nga Mi là một loại cây cảnh nội thất có kích thước tương đối lớn, nhưng không quá chiếm diện tích, mang một vẻ đẹp tự nhiên giúp tạo cảm giác thư thái và thoải mái. Với bộ lá xum xuê, xanh mát và dạng rũ giúp tạo cho không gian nội thất thêm phần sang trọng, duyên dáng và vô cùng ấn tượng.', 'Phoenix roebelenii', 'Cây cau nga mi / Chà là cảnh', '• Kích thước cây: 150 – 160 cm\r\n• Kích thước chậu: 40×40 cm (DxC)\r\n• Chiều cao tổng: 180 ~ 190 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(136, 'CHRY009', 'Cây cau vàng Nhật Bản cỡ trung chậu đá mài', 740000.00, 'cay-cau-vang-nhat-ban-chau-da-mai-800x960.jpg', 'Cây cau Nhật có tác dụng hút khí độc, làm sạch không khí trong nhà và môi trường xung quanh. Cây hấp thu chất ô nhiễm vào lá và chuyển các độc tố xuống rễ.', 'Chrysalidocarpus lutescens Wendl', 'Cau vàng Nhật Bản', 'Chiều cao ~160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(137, 'CTBC005', 'Cây trầu bà leo cột chậu sứ trắng', 1250000.00, 'cay-trau-ba-leo-cot-chau-su-1-800x960.jpg', 'Cây trầu bà cột chứa đựng ý nghĩa phong thủy rất tốt, mang dáng vẻ thanh lịch và sang trọng. Đồng thời nó còn có tác dụng thanh lọc không khí trong nhà rất tốt, giúp không gian xanh mát và trong lành hơn.', 'Epipremnum aureum', 'Trầu bà xanh', 'Kích thước chậu: 30×50 cm (DxC)\r\nChiều cao tổng: 160 – 170 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(139, 'CFML001', 'Cây huyết dụ Mocha Latte chậu ươm', 120000.00, 'cay-phat-du-mocha-latte-1-800x960.jpg', 'Cây phất dụ ‘Mocha Latte’ là loại cây có bộ lá sặc sỡ như một tách ‘Mocha Latte’, rất thích để trồng trang trí nội thất. Với sức sống cực kỳ mãnh liệt, loại cây sẽ là một sự lựa chọn tuyệt vời dành cho những “người lưới”. Vẻ đẹp độc đáo của cây phất dụ ‘bảy sắc’ chắc chắn sẽ rất hút mắt những vị khách tới thăm nhà bạn.', 'Cordyline fruticosa Mocha Latte', 'Huyết huyết dụ ‘Mocha Latte’', 'Chiều cao: 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(140, 'CFWR002', 'Cây huyết dụ bảy sắc cầu vòng chậu đất nung', 220000.00, 'cay-phat-du-bay-sac-cau-vong-chau-dat-nung-800x960.jpg', 'Cây phất dụ ‘bảy sắc’ là loại cây có bộ lá sặc sỡ như ‘bảy sắc cầu vòng’, rất thích để trồng trang trí nội thất. Với sức sống cực kỳ mãnh liệt, loại cây sẽ là một sự lựa chọn tuyệt vời dành cho những “người lưới”. Vẻ đẹp độc đáo của cây phất dụ ‘bảy sắc’ chắc chắn sẽ rất hút mắt những vị khách tới thăm nhà bạn.', 'Cordyline fruticosa ‘Waihee Rainbow’', 'Huyết phất dụ 7 sắc', '• Kích thước chậu: 17×17  cm (DxC)\r\n• Chiều cao tổng: 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(141, 'LICU008', 'Cây cọ nhật để sàn chậu đá mài', 650000.00, 'cay-co-nhat-de-van-phong-chau-xi-mang-800x960.jpg', 'Cây cọ nhật là loại cây trong nhà có kiểu lá xòe rộng như những cánh quạt, giúp trang trí không gian thêm xanh mát. Nó còn là loại cây phong thủy tượng trưng cho sự giàu sang và tiền tài nên rất đáng trồng trên bàn làm việc.', 'Licuala grandis', 'Cọ Nhật', 'Chiều cao cây: 90cm\r\nChiều cao chậu + cây: 130cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước: 2 – 3 lần/tuần'),
(142, 'CPTN009', 'Cây phát tài núi 2 tầng chậu ươm', 1200000.00, 'cay-phat-tai-nui-chau-uom-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', 'Chiều cao 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước, 2 – 3 lần/tuần'),
(143, 'CFWR001', 'Cây huyết dụ bảy sắc cầu vòng chậu ươm', 120000.00, 'cay-phat-du-bay-sac-cau-vong-1-800x960.jpg', 'Cây phất dụ ‘bảy sắc’ là loại cây có bộ lá sặc sỡ như ‘bảy sắc cầu vòng’, rất thích để trồng trang trí nội thất. Với sức sống cực kỳ mãnh liệt, loại cây sẽ là một sự lựa chọn tuyệt vời dành cho những “người lưới”. Vẻ đẹp độc đáo của cây phất dụ ‘bảy sắc’ chắc chắn sẽ rất hút mắt những vị khách tới thăm nhà bạn.', 'Cordyline fruticosa ‘Waihee Rainbow’', 'Huyết phất dụ 7 sắc', 'Chiều cao 30 – 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(144, 'BUBU007', 'Cây bàng Đài Loan cẩm thạch chậu sứ', 1200000.00, '11-cay-bang-dai-loan-cam-thach-chau-su-trang-1-800x960.jpg', 'Cây Bàng Đài Loan Cẩm Thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida Buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 42×47 cm (DxC)\r\n• Chiều cao tổng: 130–140 cm', 'Dễ chăm sóc', 'Nắng trực tiếp / Nắng tán xạ', 'Tưới nước 4 – 5 lần/tuần'),
(145, 'FITR006', 'Cây đa tam phúc Triangularis chậu đất nung', 300000.00, 'cay-da-tam-phuc-nho-de-ban-chau-gom-1-800x960.jpg', 'Đây sẽ là một dạng năng lượng tích cực, bạn sẽ cảm nhận được nhiều giá trị như sức khỏe, sự giàu có hay mối quan hệ tốt đẹp đến với cuộc sống của mình.', 'Ficus Triangularis Variegata', 'Đa tam phúc', '• Kích thước chậu: 18x18cm (DxC)\r\n• Chiều cao tổng: 30 – 40cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(146, 'LYRA043', 'Cây bàng Singapore dáng tree gốc to chậu xi măng', 1500000.00, 'cay-bang-singapore-dang-tree-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(147, 'LYRA042', 'Cây bàng Singapore 2 nhánh chậu xi măng để sàn', 450000.00, 'bangsingmowgarden-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(148, 'BUBU005', 'Cây bàng Đài Loan cẩm thạch chậu xi măng trụ tròn cao', 750000.00, 'bangdailoancamthachmowgarden-800x960.jpg', 'Cây Bàng Đài Loan Cẩm Thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida Buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 30×60 cm (DxC)\r\n• Chiều cao tổng: 120–130 cm', 'Dễ chăm sóc', 'Nắng trực tiếp / Nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(149, 'LYRA041', 'Cây bàng Singapore một thân chậu đất nung', 340000.00, 'cay-bang-singapore-chau-dat-nung-1-800x960.jpg', 'Cây Bàng Singapore là loại cây nội thất đang được ưa chuộng nhất hiện nay. Cây có khả năng cải thiện chất lượng không khí. Mang lại sự xanh mát và sang trọng cho không gian của bạn, trang trí phòng khách, văn phòng, quán cafe hay shop.Hoặc làm quà tặng dịp khai trương, tân gia…', 'Ficus lyrata', 'Cây bàng Singapore', '• Kích thước chậu: 30×25 cm (DxC)\r\n• Chiều cao tổng: 100 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(150, 'ELAS005', 'Cây đa búp đỏ chậu đất nung', 440000.00, 'cay-da-bup-do-chau-dat-nung-800x960.jpg', 'Đa Búp Đỏ là loại cây có sức sống mãnh liệt, nó tượng trưng sự vươn lên mạnh mẽ, trường tồn và hạnh phúc. Không chỉ mang lại điểm nhấn xanh cho không gian sống, Đa Búp Đỏ còn còn mang lại ý nghĩa rất tốt trong phong thủy, giúp gia đình hòa thuận, mọi việc thuận lợi.', 'Ficus elastica', 'Đa búp đỏ', 'Chiều cao: 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(151, 'HELI001', 'Cây chuối mỏ két cẩm thạch chậu ươm', 110000.00, 'cay-thien-dieu-chau-uom-800x960.jpg', 'Chuối mỏ két cẩm thạch là loài cây nhiệt đới có hoa và bộ lá tươi sáng, thích hợp trồng trang trí sân vườn, ban công hoặc sân thượng. Loài cây này có đặc điểm sống trong râm mát nên cũng có thể đặt trang trí trong nhà rất đẹp mắt.', 'Heliconia Psittacorum Variegated ‘Lady Di’', 'Cây chuối mỏ két đỏ / Thiên điểu cẩm thạch', 'Chiều cao: 50 – 70 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(152, 'LYRA040', 'Cây bàng Singapore chậu xi măng đá mài', 370000.00, 'cay-bang-singapore-chau-xi-mang-800x960.jpg', 'Cây Bàng Singapore là loại cây nội thất đang được ưa chuộng nhất hiện nay. Cây có khả năng cải thiện chất lượng không khí. Mang lại sự xanh mát và sang trọng cho không gian của bạn, trang trí phòng khách, văn phòng, quán cafe hay shop.Hoặc làm quà tặng dịp khai trương, tân gia…', 'Ficus lyrata', 'Cây bàng Singapore', '• Kích thước chậu: 20×20 cm (DxC)\r\n• Chiều cao tổng: 40 – 50 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(153, 'BUBU006', 'Cây bàng đài loan cẩm thạch chậu đất nung', 750000.00, 'cay-bang-dai-loan-cam-thach-chau-dat-nung-1-800x960.jpg', 'Bàng Đài Loan cẩm thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 30x32cm (DxC)\r\n• Chiều cao tổng: 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(154, 'BUBU001', 'Cây bàng đài loan cẩm thạch chậu ươm', 340000.00, 'cay-bang-dai-loan-cam-thach-chau-uom-1-800x960.jpg', 'Bàng Đài Loan cẩm thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida buceras Variegated', 'Bàng Đài Loan cẩm thạch', 'Chiều cao 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(155, 'ROSM002', 'Cây hương thảo cỡ trung chậu ươm', 90000.00, 'cay-huong-thao-co-trung-rosemary-1-800x960.jpg', 'Không chỉ có tác dụng trang trí cho góc ban công mà cây hương thảo còn là một loại cây thảo mộc giúp gia tăng hương vị cho món ăn. Cây hương thảo cũng có nhiều tác dụng đối với sức khỏe con người như giải nhiệt, lợi tiểu, giảm sưng viêm, hỗ trợ tiêu hóa, có hương thơm giúp tinh thần thoải mái.', 'Rosmarinus officinalis', 'Cây hương thảo', 'Chiều cao 40 – 45 cm', 'Trung bình', 'Nắng trực tiếp', 'Tưới nước hằng ngày'),
(156, 'SCHE011', 'Cây ngũ gia bì cẩm thạch cỡ nhỏ chậu ươm', 60000.00, 'cay-ngu-gia-bi-cam-thach-nho-chau-uom-800x960.jpg', 'Cây ngũ gia bì là loại cây mang lại tài vận, thịnh vượng và may mắn, trồng trong nhà sẽ mang đến một không gian thư thái, trong lành cho gia đình.', 'Scheffera Octophylla', 'Ngũ gia bì cẩm thạch', 'Chiều cao 20 – 30 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(157, 'CHRY004', 'Cây cau vàng Nhật Bản cỡ trung chậu đá mài', 700000.00, 'cay-cau-vang-nhat-ban-chau-xi-mang-da-mai-1-800x960.jpg', 'Cây cau Nhật có tác dụng hút khí độc, làm sạch không khí trong nhà và môi trường xung quanh. Cây hấp thu chất ô nhiễm vào lá và chuyển các độc tố xuống rễ.', 'Chrysalidocarpus lutescens Wendl', 'Cau vàng Nhật Bản', 'Chiều cao ~160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(158, 'CHRY002', 'Cây cau vàng Nhật Bản cỡ trung chậu ươm', 400000.00, 'cay-cau-vang-nhat-ban-co-trung-800x960.jpg', 'Cây cau Nhật có tác dụng hút khí độc, làm sạch không khí trong nhà và môi trường xung quanh. Cây hấp thu chất ô nhiễm vào lá và chuyển các độc tố xuống rễ.', 'Chrysalidocarpus lutescens Wendl', 'Cau lụa vàng Nhật Bản', 'Chiều cao ~120 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(159, 'CHRY003', 'Cây cau vàng Nhật Bản chậu đá mài', 750000.00, 'cay-cau-vang-nhat-ban-chau-xi-mang-da-mai-800x960.jpg', 'Cây cau Nhật có tác dụng hút khí độc, làm sạch không khí trong nhà và môi trường xung quanh. Cây hấp thu chất ô nhiễm vào lá và chuyển các độc tố xuống rễ.', 'Chrysalidocarpus lutescens Wendl', 'Cau lụa vàng Nhật Bản', 'Chiều cao ~160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(160, 'CHRY001', 'Cây cau vàng Nhật Bản cỡ lớn chậu ươm', 450000.00, 'cay-cau-vang-nhat-ban-chau-uom-800x960.jpg', 'Cây cau Nhật có tác dụng hút khí độc, làm sạch không khí trong nhà và môi trường xung quanh. Cây hấp thu chất ô nhiễm vào lá và chuyển các độc tố xuống rễ.', 'Chrysalidocarpus lutescens Wendl', 'Cau lụa vàng Nhật Bản', 'Chiều cao ~160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(161, 'LYRA032', 'Cây bàng Singapore 2 nhánh chậu xi măng để sàn', 550000.00, 'cay-bang-singapore-chau-xi-mang-tru-tron-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(162, 'LYRA030', 'Cây bàng Singapore dáng tree thân to chậu gốm sứ', 700000.00, 'cay-bang-singapore-dang-tree-1-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(163, 'LYRA029', 'Cây bàng Singapore chậu gốm sứ để sàn', 700000.00, 'cay-bang-singapore-chau-gom-su-den-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(164, 'LYRA028', 'Cây bàng Singapore lớn 3 nhánh chậu gốm sứ', 850000.00, 'cay-bang-singapore-chau-gom-su-lon-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(165, 'LYRA027', 'Cây bàng Singapore lớn 2 thân chậu xi măng', 650000.00, 'cay-bang-singapore-2-nhanh-lon-chau-xi-mang-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(166, 'LYRA026', 'Cây bàng Singapore lớn 2 thân chậu xi măng', 700000.00, 'cay-bang-singapore-chau-da-mai-hinh-tru-1-800x960.jpg', 'Cây Bàng Singapore Lớn có thể dễ dàng nhận ra ở những góc quán cafe, bàn làm việc công. Với những chiếc lá căng bóng hình đàn vĩ cầm rất lớn, nhiều gân là hình chân chim nổi bật và sức sống rất mạnh mẽ và chắc chắn sẽ là một sự bổ sung tuyệt đẹp cho những góc trang trí cho góc làm việc, căn phòng, ngôi nhà của bạn.', 'Ficus lyrata', 'Bàng Singapore / Sung tỳ bà', '', 'Dễ chăm sóc', 'Nắng trực tiếp / Ánh sáng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(167, 'LYRA020', 'Cây bàng Singapore chậu men sứ', 750000.00, 'cay-bang-singapore-lon-chau-men-ly-1-800x960.jpg', 'Bàng Singapore là loại cây nội thất đang được ưa chuộng nhất hiện nay bởi cây có khả năng cải thiện chất lượng không khí mang lại sự xanh mát và sang trọng cho không gian. Cây rất được yêu chuộng sử dụng trang trí phòng khách, văn phòng, quán cafe hay shop hoặc làm quà tặng dịp khai trương, tân gia.', 'Ficus lyrata', 'Cây bàng Singapore', 'Kích thước: 34×45 cm (DxH)\r\nChiều cao tổng: 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(168, 'ZAMI020', 'Cây kim tiền cỡ lớn chậu men ly trắng', 850000.00, 'cay-kim-tien-chau-ly-men-su-800x960.jpg', 'Các nhánh thân mọc thành từng bụi với chiều dài trung bình từ 18 đến 45 cm phù hợp để trồng chậu đặt trong phòng hoặc ở những nơi sang trọng.', 'Zamioculcas Zamiifolia', 'Cây kim tiền', 'Kích thước chậu: 40×50\r\nChiều cao tổng: 110 ~ 120 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(169, 'DRAC402', 'Cây huyết dụ kiếm chậu bầu ươm', 180000.00, 'cay-huyet-du-kiem-chau-uom-800x960.jpg', 'Cây huyết Dụ là một loại cây phong thủy có tác dụng mang lại may mắn, giữ tiền của và tài lộc cho gia chủ. Bên cạnh đó, cây huyết dụ được trồng hòng để ngăn chặn, xua đuổi tà ma tấn công vào nhà.', 'Dracaena marginata Tricolor', 'Cây huyết dụ kiếm', 'Chiều cao 80 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(170, 'BUBU004', 'Cây bàng Đài Loan cẩm thạch chậu gốm sứ', 700000.00, 'cay-bang-dai-loan-cam-thach-chau-gom-su-800x960.jpg', 'Cây Bàng Đài Loan Cẩm Thạch có lá nhỏ xinh và sắc xanh, viền trắng hồng rất khác biệt và nổi bật, giúp không gian trở nên độc đáo và sang trọng', 'Bucida Buceras Variegated', 'Bàng Đài Loan cẩm thạch', '• Kích thước chậu: 30×30 cm (DxC)\r\n• Chiều cao tổng: 80 – 100 cm', 'Dễ chăm sóc', 'Nắng trực tiếp / Nắng tán xạ', 'Tưới nước 2 – 3 lần/tuần'),
(171, 'CRQ001', 'Cây chuối rẻ quạt chậu gốm họa tiết', 750000.00, 'chuoirequatmowgarden-800x960.jpg', 'Tuy cây chuối rẻ quạt thuộc giống cây ngoại nhập, nhưng cây vẫn sống tốt trong điều kiện khí hậu tại nước ta.', 'Ravenala madagascariensis', 'Chuối rẻ quạt', 'Cao 120 – 150 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(172, 'CPTN006', 'Cây phát tài núi để sàn chậu sứ họa tiết', 650000.00, 'cay-phat-tai-nui-3-than-chau-su-1-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', '• Kích thước chậu: 25x25cm (DxC)\r\n• Chiều cao tổng: 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(173, 'CDBD003', 'Cây đa búp đỏ một thân chậu xi măng', 350000.00, '63-cay-da-bup-de-chau-xi-mang-800x960.jpg', 'Từ lâu cây Đa luôn là biểu tượng của sự trường tồn, sức sống dẻo dai, nơi chứa đựng thần quyền và tâm linh của con người. Chính lẽ đó mà trong phong thủy, Đa Búp Đỏ cũng mang ý nghĩa của sự may mắn, an lành.', 'Ficus elastica', 'Đa búp đỏ', 'Chiều cao 60 – 80cm', 'Rất dễ chăm sóc', 'Ánh sáng tán xạ; Bóng râm', 'Vừa phải, 2 – 3 lần/tuần'),
(174, 'MONS012', 'Cây Trầu bà Nam Mỹ – Monstera Borsigiana –', 3500000.00, '48-cay-monstera-borsi-leo-cot-3000k-800x960.jpg', 'Là loài cây sở hữu cho mình những chiếc lá được tạo nét như trái tim, càng lớn lá bắt đầu xuất hiện các đường xẻ một cách ngẫu nhiên.', 'Monstera Deliciosa', 'Trầu bà lá xẻ', 'Cao 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ.', 'Ít nước, 2 – 3 lần/tuần'),
(175, 'MONS011', 'Cây Trầu bà Nam Mỹ – Monstera Borsigiana –', 5000000.00, '48-cay-monstera-borsi-5000k-800x960.jpg', 'Là loài cây sở hữu cho mình những chiếc lá được tạo nét như trái tim, càng lớn lá bắt đầu xuất hiện các đường xẻ một cách ngẫu nhiên.', 'Monstera Deliciosa', 'Trầu bà lá xẻ', 'Cao 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ.', 'Ít nước, 2 – 3 lần/tuần'),
(176, 'CPTN005', 'Cây phát tài núi 2 tầng chậu đá mài', 1200000.00, 'cay-phat-tai-nui-2-tang-chau-da-mai-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', '• Kích thước chậu: 36×30 cm (DxC)\r\n• Chiều cao: 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(177, 'MONS010', 'Cây Trầu bà Nam Mỹ – Monstera Borsigiana –', 7500000.00, '43-cay-monstera-borsi-leo-cot-800x960.jpg', 'Là loài cây sở hữu cho mình những chiếc lá được tạo nét như trái tim, càng lớn lá bắt đầu xuất hiện các đường xẻ một cách ngẫu nhiên.', 'Monstera Borsigiana', 'Trầu bà lá xẻ', 'Cao 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ.', 'Ít nước, 2 – 3 lần/tuần'),
(178, 'CPTN004', 'Cây phát tài núi 2 tầng chậu gốm sứ', 1450000.00, 'cay-phat-tai-nui-2-tang-800x960.jpg', 'Cây phát tài núi rất thường được lựa chọn để làm quà tặng vào những dịp khai trương, lên nhà mới, văn phòng mới… với mong muốn đem lại nhiều tài lộc và may mắn cho người được tặng.', 'Dracaena draco L', 'Phát tài núi', '• Kích thước chậu: 32x52cm (DxC)\r\n• Chiều cao tổng: 150 – 160 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(179, 'DRAC401', 'Cây huyết dụ kiếm chậu xi măng đá mài', 420000.00, 'cay-huyet-du-kiem-chau-xi-mang-800x960.jpg', 'Cây huyết Dụ là một loại cây phong thủy có tác dụng mang lại may mắn, giữ tiền của và tài lộc cho gia chủ. Bên cạnh đó, cây huyết dụ được trồng hòng để ngăn chặn, xua đuổi tà ma tấn công vào nhà.', 'Dracaena marginata Tricolor', 'Cây huyết dụ kiếm', 'Chiều cao 120 cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(180, 'CHRY007', 'Cây cau vàng Nhật Bản cỡ trung chậu xi măng xi măng', 1200000.00, 'cay-cau-vang-nhat-ban-chau-xi-mang-vang-800x960.jpg', 'Cây Cau Nhật là loại cây cảnh đẹp ngoài việc dùng làm trang trí nội thất, ngoại thất làm tô điểm cho không gian sống thì cây còn có khả năng hấp thụ các độc tố hóa học và có một ý nghĩa vô cùng đặc biệt trong việc lọc khí độc, trừ tà.', 'Chrysalidocarpus lutescens Wendl', 'Cau vàng Nhật Bản', 'Chiều cao cây: 80 – 100cm\r\nChiều cao chậu cây: 160 –180cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(181, 'LYRA023', 'Cây bàng Singapore cao 2m dáng tree chậu sứ', 2200000.00, 'cay-bang-singapore-co-lon-dang-tree-chau-su-1-800x960.jpg', 'Bàng Singapore là loại cây nội thất đang được ưa chuộng nhất hiện nay bởi cây có khả năng cải thiện chất lượng không khí mang lại sự xanh mát và sang trọng cho không gian.', 'Ficus lyrata', 'Cây bàng Singapore', '• Kích thước chậu: 42×60 cm (DxC)\r\n• Chiều cao cây + chậu: 190 – 200cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Tưới nước 2 – 3 lần/tuần'),
(182, 'AREC005', 'Cây trúc mây chậu đất nung Rhapis excelsa', 240000.00, 'woocommerce-placeholder.png', 'Cây trúc mây không chỉ mang lại ý nghĩa phong thủy tốt đẹp mà còn nó đánh giá là có khả năng giúp hấp thụ các loại chất khí độc hại có trong hông giúp, nhờ đó mang đến không gian trong lành, thư giãn và thoải mái.', 'Rhapis excelsa', 'Cây mật cật/trúc mây', 'Chiều cao: 60 – 70cm\r\nChiều cao cây + chậu: 70 – 80cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được thiếu nắng', 'Ít nước, 2 – 3 lần/tuần'),
(183, 'LYRA031', 'Cây bàng Singapore 2 thân chậu đá mài', 800000.00, 'cay-bang-singapore-2-than-mowgarden-800x960.jpg', 'Là loại cây nội thất đang được ưa chuộng nhất hiện nay bởi cây có khả năng cải thiện chất lượng không khí mang lại sự xanh mát và sang trọng cho không gian.', 'Ficus lyrata', 'Cây bàng Singapore', 'Kích thước chậu: 30×50 (DxC)\r\nChiều cao tổng: 120 – 140cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(184, 'AREC004', 'Cây trúc mây chậu sứ Rhapis excelsa', 750000.00, 'woocommerce-placeholder.png', 'Cây trúc mây không chỉ mang lại ý nghĩa phong thủy tốt đẹp mà còn nó đánh giá là có khả năng giúp hấp thụ các loại chất khí độc hại có trong hông giúp, nhờ đó mang đến không gian trong lành, thư giãn và thoải mái.', 'Rhapis excelsa', 'Cây mật cật/trúc mây', 'Chiều cao: 100 – 110cm\r\nChiều cao cây + chậu: 120 – 130cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được thiếu nắng', 'Ít nước, 2 – 3 lần/tuần'),
(185, 'MONS009', 'Cây Trầu bà Nam Mỹ Monstera nhiều thân chậu xi măng đen', 1200000.00, '71-cay-monstera-nam-my-800x960.jpg', 'Là loài cây sở hữu cho mình những chiếc lá được tạo nét như trái tim, càng lớn lá bắt đầu xuất hiện các đường xẻ một cách ngẫu nhiên.', 'Monstera Deliciosa', 'Trầu bà lá xẻ', 'Cao 80 – 100 cm', 'Dễ chăm sóc', 'Nắng tán xạ.', 'Ít nước, 2 – 3 lần/tuần'),
(186, 'ALOCA004', 'Cây ráy voi lớn chậu xi măng đá mài Alocasia Macrorrhizos', 500000.00, '154-cay-ray-voi-800x960.jpg', 'Cây nội thất xu hướng mới của lĩnh vực decor hiện nay, được nhiều các bạn trẻ chưng diện trong các shop, quán cà phê', 'Alocasia Macrorrhizos', 'Ráy voi', 'Cao 120 – 140 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(187, 'DVX002', 'Cây Trầu Bà Đế Vương Xanh Để Bàn', 350000.00, 'trau-ba-de-vuong-xanh-de-ban-mowgarden-800x960.jpg', 'Trầu Bà Đế Vương có tên tiếng Anh là Philodendron Imperial thuộc họ Araceae (Ráy). Nguồn gốc của cây từ đảo Solomon, nguyên sinh ở Indonesia, là dòng cây thân thảo, trong tự nhiên dòng cây này có thể cao hơn 1.5m, nhưng với mục đích trang trí thì MOW sẽ gửi đến các bạn cây với kích cỡ nhỏ để tiện đặt ở bất cứ đâu mình thích.', '', 'Cây Trầu Bà Đế Vương Xanh', '', 'Vừa phải', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(188, 'CDBD002', 'Cây đa búp đỏ để bàn 3 thân chậu sứ', 550000.00, 'cay-da-bup-do-de-ban-mowgarden-800x960.jpg', 'Từ lâu cây Đa luôn là biểu tượng của sự trường tồn, sức sống dẻo dai, nơi chứa đựng thần quyền và tâm linh của con người. Chính lẽ đó mà trong phong thủy, Đa Búp Đỏ cũng mang ý nghĩa của sự may mắn, an lành.', 'Ficus elastica', 'Đa búp đỏ', 'Chiều cao 40 – 50cm', 'Rất dễ chăm sóc', 'Ánh sáng tán xạ; Bóng râm', 'Vừa phải, 2 – 3 lần/tuần'),
(189, 'TBTX003', 'Cây trầu bà thanh xuân chậu gốm', 500000.00, 'cay-tra-ba-thanh-xuan-chau-gom-den-mowgarden-800x960.jpg', 'Trầu bà thanh xuân là loại cây trong nhà độc đáo được mọi người ưa thích và trưng bày trang trí. Trầu Bà Thanh Xuân có ý nghĩa về mặt phong thủy nó còn có ý nghĩa may mắn, đem lại tài lộc, gia tăng vận khí, thể hiện ý chí vươn lên của gia chủ.', 'Thaumatophyllum bipinnatifidum', 'Cây trầu bà thanh xuân / Cây trầu bà tay Phật', 'Chiều cao tổng 50 – 60cm', 'Dễ chăm sóc', 'Nắng tán xạ / Bóng râm', 'Ít tưới nước, 2 – 3 lần/tuần'),
(190, 'CTN001', 'Cây thanh ngân – hoàng hậu để bàn', 250000.00, 'cay-hoang-hau-chau-su-trang-de-ban-mowgarden-800x960.jpg', 'Cây Thanh Lam thường mọc thành bụi lớn và có tán lá rộng. Thân và lá của cây mọc vươn thẳng. Phần thân của cây có màu trắng, phần lá có có màu xanh trắng. Phần rìa lá có màu xanh đậm, phần chính giữa lá có màu trắng. Lá cây có hình bầu dục với các gân và sống lá rõ.', 'Aglaonema Diamond Bay', 'Cây hoàng hậu, cây thanh ngân', 'Chiều cao: 30-40cm', 'Dễ chăm sóc', 'Nắng tán xạ, chịu được nắng trực tiếp', 'Ít nước, 2 – 3 lần/tuần'),
(191, 'AGLA005', 'Cây Ngân hậu chậu men sứ Aglaonema Marantifolium', 350000.00, '168-cay-ngan-hau-chau-men-su-800x960.jpg', 'Cây ngân hậu đại diện cho sự sang chảnh, quyền cao quý tộc giống như cái tên hoàng gia của nó vậy.', 'Aglaonema Marantifolium', 'Ngân hậu; Minh Ty Rằn', 'Cao 30 – 40 cm', 'Dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(192, 'ROSE012', 'Hoa hồng ngoại Carey màu hồng size nhỏ', 150000.00, 'hoa-hong-ngoai-carey-rose-1-800x960.jpg', '', '', '', '', '', '', ''),
(193, 'ROSE011', 'Hoa hồng leo Herzogin màu trắng phớt size nhỏ', 150000.00, 'hoa-hong-leo-herzogin-1-800x960.jpg', '', '', '', '', '', '', ''),
(194, 'ROSE010', 'Hoa hồng leo Crown Princess Margareta size nhỏ', 150000.00, 'hoa-hong-leo-CPM-mau-vang-cam-1-800x960.jpg', '', '', '', '', '', '', ''),
(195, 'ROSE009', 'Hoa hồng leo Lady of Shalott form cúp size nhỏ', 150000.00, 'hoa-hong-leo-mau-cam-lady-of-shalott-1-800x960.jpg', '', '', '', '', '', '', ''),
(196, 'ROSE008', 'Cây hoa hồng leo Red Eden form cúp size nhỏ', 150000.00, 'hoa-hong-leo-red-eden-1-800x960.jpg', '', '', '', '', '', '', ''),
(197, 'ROSE007', 'Cây hoa hồng ngoài Double Delight rất thơm size nhỏ', 150000.00, 'hoa-hong-ngoai-double-delight-1-800x960.jpg', '', '', '', '', '', '', ''),
(198, 'ROSE006', 'Cây hoa hồng leo Golden Celebration size nhỏ', 150000.00, 'cay-hoa-hong-leo-golden-celebration-david-austin-1-800x960.jpg', '', '', '', '', '', '', ''),
(199, 'BGNB001', 'Cây bông giấy Sakura nguyên bản chậu ươm', 320000.00, 'cay-bong-giay-sakura-800x960.jpg', 'Cây hoa giấy loài cây này có sức rống rất tốt, phù hợp với khí hậu của Việt nam, chịu hạn rất tốt, sức sống bền bỉ và dễ chăm sóc. Bông giấy Thái bonsai có dáng gọn gàng phù hợp đặt trên ban công, sân thượng hoặc trưng ngoài vườn giúp không gian trở nên sinh động hơn.', '', 'Cây bông giấy Sakura Nhật', '', 'Dễ chăm sóc', 'Nắng trực tiếp', 'Tưới nước 1 lần/ngày'),
(200, 'BGTL003', 'Cây bông giấy Thái dáng bonsai màu đỏ chậu ươm', 320000.00, 'cay-bong-giay-bonsai-mau-do-chau-uom-1-800x960.jpg', 'Cây hoa giấy Thái bonsai được nghệ tạo dáng thân uốn lượn độc đáo và đẹp mắt. Loài cây này có sức rống rất tốt, phù hợp với khí hậu của Việt nam, chịu hạn rất tốt, sức sống bền bỉ và dễ chăm sóc. Bông giấy Thái bonsai có dáng gọn gàng phù hợp đặt trên ban công, sân thượng hoặc trưng ngoài vườn giúp không gian trở nên sinh động hơn.', '', 'Cây bông giấy Thái', '', 'Dễ chăm sóc', 'Nắng trực tiếp', 'Tưới nước 1 lần/ngày'),
(201, 'LORO001', 'Cây hoa hồng phụng chậu ươm', 180000.00, 'cay-hoa-hong-phung-chau-uom-1-800x960.jpg', 'Cây hồng phụng (Loropetalum chinense) là một loài thực vật có hoa trong họ Hamamelidaceae. Loài cây này có những bông hoa màu hồng nổi bật, mỗi khi nở rộ rất rực rỡ. Những bông hoa này tồn tại trong một vài tuần. Chúng thích hợp trồng bồn hoa, ban công, trang trí sân vườn, lối đi sân vườn,…', 'Loropetalum chinense', 'Cây hồng phụng', 'Chiều cao tổng: 90 – 120 cm', 'Dễ chăm sóc', 'Nắng trực tiếp 6 – 8h/ngày', 'Tưới nước mỗi ngày'),
(202, 'MURA002', 'Cây hoa nguyệt quế dáng tree chậu ươm', 650000.00, 'cay-nguyet-que-dang-tree-tan-tron-1-800x960.jpg', 'Cây hoa nguyệt quế loại cây trồng hàng rào rất phổ biến bởi nó có sức sống rất mãnh liệt, không cần tốn nhiều công chăm sóc mà vẫn xanh tốt. Cây ắc ó thuộc loại thân gỗ lớn, sống lâu năm, có hoa rất thơm.', 'Murraya paniculata', 'Cây nguyệt quế', 'Chiều cao 120 – 140 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(203, 'BGTL002', 'Cây bông giấy Thái Lan màu trắng chậu ươm', 280000.00, 'cay-bong-giay-thai-lan-mau-trang-1-800x960.jpg', 'Cây hoa giấy Thái rất thích hợp với khí hậu tại VN, nó là loại cây ưa nắng ấm, cần nhiều ánh sáng.', '', 'Cây bông giấy Thái', '', 'Dễ chăm sóc', 'Nắng trực tiếp', 'Tưới nước 1 lần/ngày'),
(204, 'vulgaris', 'Cây tre vàng Bambusa', 120000.00, 'cay-tre-vang-trong-hang-rao-san-vuon-1-800x960.jpg', 'Tre Vàng là một loại cây ngoại cảnh được trồng thành khóm để trang trí sân vườn, hàng rào, sát tường hoặc dọc lối đi vào nhà giúp tạo không gian xanh mát, tô điểm thêm cho ngôi nhà và mang những ý nghĩa tốt đẹp trong phong thủy.', 'Bambusa vulgaris', 'Tre vàng', '• Số lượng: 1 thân/bụi\r\n• Chiều cao: 180 – 220 cm', '', 'Nắng trực tiếp hoặc gián tiếp', 'Tưới nước mỗi ngày'),
(205, 'aurea', 'Cây trúc cần câu Phyllostachys', 150000.00, 'cay-truc-can-cau-trang-tri-san-vuon-1-800x960.jpg', 'Trúc Cần Câu là một loại cây ngoại cảnh được trồng thành khóm để trang trí sân vườn, hàng rào, sát tường hoặc dọc lối đi vào nhà giúp tạo không gian xanh mát, tô điểm thêm cho ngôi nhà và mang những ý nghĩa tốt đẹp trong phong thủy.', 'Phyllostachys aurea', 'Trúc cần câu', '• Số lượng: 5 8 thân/bụi\r\n• Chiều cao: 180 – 220 cm', '', 'Nắng trực tiếp hoặc gián tiếp', 'Tưới nước mỗi ngày'),
(206, 'ROSE005', 'Cây hoa hồng cổ Sapa dáng treerose nguyên bản chậu nhựa', 750000.00, 'cay-hoa-hong-co-sapa-dang-treerose-800x960.jpg', '', '', '', '', '', '', ''),
(207, 'ROSE004', 'Cây hoa hồng Molinuex dáng treerose chậu nhựa', 850000.00, 'hoa-hong-molinuex-dang-treerose-chau-nhua-800x960.jpg', '', '', '', '', '', '', ''),
(208, 'ROSE003', 'Cây hoa hồng leo Soeur Emmanuelle chậu đá mài', 800000.00, 'cay-hoa-hong-leo-chau-da-mai-800x960.jpg', '', '', '', '', '', '', ''),
(209, 'ROSE002', 'Cây hoa hồng leo Soeur Emmanuelle chậu nhựa tứ quý', 480000.00, 'hoa-hong-leo-mau-hong-souer-emmanuelle-800x960.jpg', '', '', '', '', '', '', ''),
(210, 'ROSE002', 'Cây hoa hồng leo Soeur Emmanuelle chậu nhựa tứ quý', 480000.00, 'cay-hoa-hong-leo-souer-emmanuelle-1-800x960.jpg', '', '', '', '', '', '', ''),
(211, 'HELI001', 'Cây chuối mỏ két cẩm thạch chậu ươm', 110000.00, 'cay-thien-dieu-chau-uom-800x960.jpg', 'Chuối mỏ két cẩm thạch là loài cây nhiệt đới có hoa và bộ lá tươi sáng, thích hợp trồng trang trí sân vườn, ban công hoặc sân thượng. Loài cây này có đặc điểm sống trong râm mát nên cũng có thể đặt trang trí trong nhà rất đẹp mắt.', 'Heliconia Psittacorum Variegated ‘Lady Di’', 'Cây chuối mỏ két đỏ / Thiên điểu cẩm thạch', 'Chiều cao: 50 – 70 cm', 'Dễ chăm sóc', 'Nắng tán xạ / Râm mát', 'Tưới nước 2 – 3 lần/tuần'),
(212, 'BGTL001', 'Cây bông giấy thái ghép mix màu chậu ươm', 480000.00, 'cay-bong-giay-thai-lan-ghep-mix-mau-800x960.jpg', 'Cây hoa giấy Thái rất thích hợp với khí hậu tại VN, nó là loại cây ưa nắng ấm, cần nhiều ánh sáng.', '', 'Cây bông giấy Thái', '', 'Dễ chăm sóc', 'Nắng trực tiếp', 'Tưới nước 1 lần/ngày'),
(213, 'HIBI001', 'Cây hoa dâm bụt Thái chậu ươm', 100000.00, 'cay-hoa-dam-but-thai-1-800x960.jpg', 'Đế', 'Hibiscus rosa-senensis', 'Hoa dâm bụt Thái', 'Chiều cao: 30 – 40cm', 'Dễ chăm sóc', 'Nắng trực tiếp (thời lượng 6–8h/ngày)', 'Tưới nước hằng ngày'),
(214, 'MURA001', 'Cây hoa nguyệt quế chậu ươm', 250000.00, 'cay-nguyet-que-chau-uom-800x960.jpg', 'Cây hoa nguyệt quế loại cây trồng hàng rào rất phổ biến bởi nó có sức sống rất mãnh liệt, không cần tốn nhiều công chăm sóc mà vẫn xanh tốt. Cây ắc ó thuộc loại thân gỗ lớn, sống lâu năm, có hoa rất thơm.', 'Murraya paniculata', 'Cây nguyệt quế', 'Chiều cao 80 – 100 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(215, 'WRIG001', 'Cây mai chỉ thiên nhỏ chậu ươm', 40000.00, 'cay-mai-chi-thien-chau-nho-800x960.jpg', 'Cây thường xuân có bộ lá xanh tươi tốt, hình dáng ấn tượng giúp mang lại không gian xanh mát. Đây là dòng cây dễ chăm đang là “trend” được nhiều người lựa chọn trồng trang trí vườn rất đẹp.', '', 'Cây mai chỉ thiên', '', 'Dễ chăm sóc', 'Nhiều ánh sáng / Nắng trực tiếp', 'Nhiều nước, 1 lần/ngày'),
(216, 'multiplex', 'Cây Trúc Quân Tử Bambusa', 160000.00, 'ban-cay-truc-quan-tu-1-1-800x960.jpg', 'Trúc Quân Tử là một loại cây ngoại cảnh được trồng thành khóm để trang trí sân vườn, hàng rào, sát tường hoặc dọc lối đi vào nhà giúp tạo không gian xanh mát, tô điểm thêm cho ngôi nhà và mang những ý nghĩa tốt đẹp trong phong thủy.', 'Bambusa multiplex', 'Trúc quân tử', '', '', 'Nắng trực tiếp', 'Tưới nước mỗi ngày'),
(217, 'ACAN001', 'Cây ắc ó trồng hàng rào chậu ươm nhỏ', 5000.00, 'cay-ac-o-chau-uom-800x960.jpg', 'Cây ắc ó là loại cây trồng hàng rào rất phổ biến bởi nó có sức sống rất mãnh liệt, không cần tốn nhiều công chăm sóc mà vẫn xanh tốt. Cây ắc ó thuộc loại thân gỗ nhỏ, có chiều cao trung bình từ 1 – 2m, là màu xanh bóng rất đẹp mắt.', 'Acanthus integrifolius', 'Cây ắc ó', 'Chiều cao 20 – 30 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần'),
(218, 'JASM001', 'Cây hoa lài ta chậu ươm nhỏ', 50000.00, 'cay-hoa-lai-ta-3-800x960.jpg', 'Cây lài ta loại cây trồng hàng rào rất phổ biến bởi nó có sức sống rất mãnh liệt, không cần tốn nhiều công chăm sóc mà vẫn xanh tốt. Cây ắc ó thuộc loại thân gỗ nhỏ, có chiều cao trung bình từ 1 – 2m, là màu xanh bóng rất đẹp mắt.', 'Jasminum sambac Ait', 'Cây hoa lài ta / hoa nhài ta', 'Chiều cao 35 – 40 cm', 'Rất dễ chăm sóc', 'Nắng tán xạ', 'Ít nước, 2 – 3 lần/tuần');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('N8G6h1mvtv8qfAYvwPeyinrSG1m9UWu84uk0BmAG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:149.0) Gecko/20100101 Firefox/149.0', 'eyJfdG9rZW4iOiJNVmpJWEQ4WjlsU0lLN1R3NXdmWVVuaXZWYzA5bk8wNFRCWkt1cXh3IiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDAiLCJyb3V0ZSI6bnVsbH19', 1776181576);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kiên', 'kien997@gmail.com', NULL, '$2y$12$PhspbBUMskdlgSjk9MFWye7jjZ2ts7fBbhNSxAlNbnRPKXXYKz1/y', NULL, '2026-04-14 07:50:22', '2026-04-14 07:50:22');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
