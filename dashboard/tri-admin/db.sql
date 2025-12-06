-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2025 lúc 03:18 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12


-- 1. LÀM SẠCH DATABASE


-- DROP TABLE IF EXISTS reviews;

-- DROP TABLE IF EXISTS order_items;
-- DROP TABLE IF EXISTS orders;

-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS categories;
-- DROP TABLE IF EXISTS users;



-- DROP TABLE IF EXISTS cart_items;
-- DROP TABLE IF EXISTS carts;

-- DROP TABLE IF EXISTS news_comments;

-- DROP TABLE IF EXISTS news;


-- DROP TABLE IF EXISTS `faq`;
-- DROP TABLE IF EXISTS `settings`;




SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `techstore_db`
--

CREATE DATABASE techstore_db;

USE techstore_db;







CREATE TABLE `settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`setting_key`, `setting_value`) VALUES
('address', '939 Kha Vạn Cân, Phường Linh Trung, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam'),
('email', 'support@techshop.vn'),
('footer_col1', '{\"call_buy\":\"1900 1009\",\"call_complain\":\"1800 1062\",\"call_warranty\":\"1900 232 464\"}'),
('footer_col2', '[{\"text\":\"Giới thiệu công ty\",\"url\":\"\\/gioi-thieu\"},{\"text\":\"Tuyển dụng\",\"url\":\"\\/tuyen-dung\"}]'),
('footer_socials', '{\"facebook\":\"https:\\/\\/www.youtube.com\\/watch?v=xvFZjo5PgG0\",\"youtube\":\"https:\\/\\/www.youtube.com\\/watch?v=xvFZjo5PgG0\",\"zalo\":\"Zalo OA\"}'),
('google_map', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d571.3593343612715!2d106.76016961475348!3d10.860629186827136!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175277068982597%3A0xaa699df27cfcdee4!2sThegioiic!5e0!3m2!1svi!2s!4v1764737040480!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
('hotline', '1900 1000'),
('partner_logos', '[\"uploads\\/1764692096_692f10809b928_download.png\"]'),
('site_banner', '[\"uploads\\/1764734647_692fb6b7331b5_download.jpg\",\"uploads\\/1764737627_692fc25bc3713_download.jpg\",\"uploads\\/1764737632_692fc26088b92_download.png\"]'),
('site_logo', 'uploads/1764690284_692f096c2ee39_download.png'),
('site_title', '2246'),
('slogan', 'Chuyên cung cấp laptop, điện thoại, phụ kiện chất lượng cao.');

ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_key`);

-- --------------------------------------------------------
-- Bảng faq
-- --------------------------------------------------------
CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1: Hiển thị, 0: Ẩn',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `faq` (`id`, `question`, `answer`, `status`, `created_at`) VALUES
(1, 'Shop có ship COD toàn quốc không?', 'Có, chúng tôi hỗ trợ ship COD toàn quốc cho mọi đơn hàng.', 1, '2025-12-02 16:55:50'),
(2, 'Bảo hành sản phẩm bao lâu?', 'Tùy theo sản phẩm, thường là 12 tháng chính hãng.', 1, '2025-12-02 16:55:50'),
(3, 'Có hỗ trợ trả góp không?', 'Có hỗ trợ trả góp 0% qua thẻ tín dụng.', 1, '2025-12-02 16:55:50'),
(6, 'Admin đẹp trai', 'Admin đẹp trai', 0, '2025-12-03 10:37:03');

ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

SET FOREIGN_KEY_CHECKS=1;

-- Hoàn tất
SELECT 'Cài đặt bảng settings và faq thành công trong database techstore_db!' AS message;

-- --------------------------------------------------------


-- anh hiếu

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `news` (`id`, `title`, `content`, `image`, `created_at`) VALUES
(1, 'iPhone 15 128GB | Chính hãng VN/A', '<div class=\"pagebody-copy\" style=\"text-align: justify;\">iPhone 15 v&agrave; iPhone 15 Plus sẽ c&oacute; năm m&agrave;u mới tuyệt đẹp:</div>\n<ul style=\"text-align: justify;\">\n<li class=\"pagebody-copy\" style=\"text-align: justify;\">hồng</li>\n<li class=\"pagebody-copy\" style=\"text-align: justify;\">v&agrave;ng</li>\n<li class=\"pagebody-copy\" style=\"text-align: justify;\">xanh l&aacute;</li>\n<li class=\"pagebody-copy\" style=\"text-align: justify;\">xanh dương</li>\n<li class=\"pagebody-copy\" style=\"text-align: justify;\">đen</li>\n</ul>\n<div class=\"pagebody-copy\" style=\"text-align: justify;\">iPhone 15 v&agrave; iPhone 15 Plus thể hiện một bước nhảy vọt lớn với những cải tiến tuyệt vời về camera mang đến cảm hứng s&aacute;ng tạo, Dynamic Island trực quan c&ugrave;ng c&aacute;c t&iacute;nh năng như Roadside Assistance th&ocirc;ng qua vệ tinh tạo ra sự kh&aacute;c biệt lớn trong cuộc sống của người d&ugrave;ng,&rdquo; Kaiann Drance, Ph&oacute; Chủ tịch bộ phận Tiếp thị Sản phẩm iPhone To&agrave;n cầu của Apple chia sẻ:</div>\n<div class=\"pagebody-copy\" style=\"text-align: justify;\">&nbsp;</div>\n<div class=\"pagebody-copy\" style=\"text-align: justify;\"><em>&ldquo;Trong năm nay, ch&uacute;ng t&ocirc;i cũng đưa sức mạnh của c&ocirc;ng nghệ nhiếp ảnh điện to&aacute;n l&ecirc;n một tầm cao mới với camera Ch&iacute;nh 48MP c&oacute; chế độ mặc định 24MP mới cho ra những tấm ảnh với độ ph&acirc;n giải cực kỳ cao, một tuỳ chọn Telephoto 2x mới, v&agrave; những chế độ chụp ảnh ch&acirc;n dung thế hệ mới.\"</em></div>\n<div class=\"pagebody-copy\">\n<h4 class=\"pagebody-header\" style=\"text-align: justify;\"><span style=\"color: #2dc26b;\"><strong>Một Thiết Kế Đẹp v&agrave; Bền Bỉ với M&agrave;n H&igrave;nh Được N&acirc;ng Cấp</strong></span></h4>\n<div class=\"pagebody-copy\" style=\"text-align: justify;\">Sở hữu k&iacute;ch thước m&agrave;n h&igrave;nh 6.1-inch v&agrave; 6.7-inch,<sup>1</sup>&nbsp;iPhone 15 v&agrave; iPhone 15 Plus được trang bị Dynamic Island, một c&aacute;ch thức s&aacute;ng tạo nhằm tương t&aacute;c với c&aacute;c cảnh b&aacute;o quan trọng v&agrave; Hoạt Động Trực Tiếp. Trải nghiệm tinh tế sẽ mở rộng v&agrave; th&iacute;ch ứng một c&aacute;ch linh hoạt để người d&ugrave;ng c&oacute; thể xem hướng đi tiếp theo trong Bản Đồ, dễ d&agrave;ng điều khiển &acirc;m nhạc, v&agrave; khi t&iacute;ch hợp với ứng dụng của b&ecirc;n thứ ba, người d&ugrave;ng sẽ nhận được th&ocirc;ng tin cập nhật theo thời gian thực về hoạt động giao đồ ăn, chia sẻ chuyến đi, tỷ số thể thao, kế hoạch du lịch, v&agrave; hơn thế nữa. M&agrave;n h&igrave;nh Super Retina XDR rất l&yacute; tưởng để xem nội dung, v&agrave; chơi game. Giờ đ&acirc;y độ s&aacute;ng HDR cao nhất đ&atilde; đạt đến 1600 nit, nhờ đ&oacute; ảnh v&agrave; video HDR sẽ r&otilde; n&eacute;t hơn bao giờ hết. V&agrave; khi trời nhiều nắng, độ s&aacute;ng cao nhất<strong>&nbsp;</strong>ngo&agrave;i trời sẽ đạt đến 2000 nit &mdash; s&aacute;ng gấp đ&ocirc;i so với thế hệ trước.</div>\n</div>', '1764775127_693054d768781.jpg', '2025-12-04 10:31:30'),
(2, 'MacBook Air M4 13 inch 2025 10CPU 8GPU 16GB 256GB | Chính hãng Apple Việt Nam', '<h4 style=\"text-align: justify;\">Chiếc MacBook tốt nhất d&agrave;nh cho hầu hết người d&ugrave;ng, nay lại c&agrave;ng trở n&ecirc;n ho&agrave;n hảo v&agrave; tốt hơn</h4>\r\n<p style=\"text-align: justify;\">MacBook Air 13-inch M3 vẫn giữ được hầu hết c&aacute;c t&iacute;nh năng tuyệt vời đ&atilde; l&agrave;m n&ecirc;n th&agrave;nh c&ocirc;ng của phi&ecirc;n bản trước. M&agrave;n h&igrave;nh sống động 13,6 inch, thiết kế mỏng nhẹ hiện đại v&agrave; bốn t&ugrave;y chọn m&agrave;u sắc. Kết hợp với chip M3 mạnh mẽ mang lại hiệu năng ấn tượng cho c&ocirc;ng việc, chơi game v&agrave; c&aacute;c t&aacute;c vụ AI, chiếc notebook n&agrave;y thực sự l&agrave; một lựa chọn ho&agrave;n hảo.</p>\r\n<p style=\"text-align: justify;\"><strong>Ưu điểm</strong></p>\r\n<ul style=\"text-align: justify;\">\r\n<li>Hiệu năng M3 mạnh mẽ</li>\r\n<li>M&agrave;n h&igrave;nh s&aacute;ng v&agrave; rực rỡ</li>\r\n<li>Thiết kế si&ecirc;u di động</li>\r\n<li>Thời lượng pin ấn tượng</li>\r\n<li>Hỗ trợ m&agrave;n h&igrave;nh k&eacute;p</li>\r\n</ul>\r\n<p style=\"text-align: justify;\"><strong>Nhược điểm</strong></p>\r\n<ul style=\"text-align: justify;\">\r\n<li>Hiệu năng cải thiện kh&ocirc;ng qu&aacute; nhiều so với M2</li>\r\n</ul>\r\n<p style=\"text-align: justify;\">Chiếc MacBook Air 13-inch M3 mới kh&ocirc;ng phải l&agrave; một cuộc c&aacute;ch mạng, nhưng n&oacute; mang lại nhiều n&acirc;ng cấp đ&aacute;ng gi&aacute; hơn so với phi&ecirc;n bản MacBook Air 13-inch M2. Điểm nổi bật ch&iacute;nh l&agrave; sự t&iacute;ch hợp chip Apple M3, đưa n&oacute; ngang tầm với d&ograve;ng MacBook Pro mới nhất. Bộ vi xử l&yacute; n&agrave;y kh&ocirc;ng chỉ mang lại hiệu năng CPU vượt trội m&agrave; c&ograve;n được n&acirc;ng cấp về đồ họa v&agrave; tr&iacute; tuệ nh&acirc;n tạo. Hơn nữa, thời lượng pin vốn đ&atilde; ấn tượng nay lại được cải thiện th&ecirc;m so với phi&ecirc;n bản trước.</p>\r\n<p style=\"text-align: justify;\">Giống như Air M2, chiếc notebook được cập nhật n&agrave;y vẫn sở hữu m&agrave;n h&igrave;nh Retina s&aacute;ng v&agrave; sống động 13,6 inch ho&agrave;n hảo để xem video, chơi game v&agrave; xử l&yacute; c&ocirc;ng việc. N&oacute; c&oacute; c&ugrave;ng thiết kế phẳng, thực dụng như những chiếc MacBook Pro gần đ&acirc;y nhất, c&ugrave;ng với b&agrave;n ph&iacute;m thoải m&aacute;i, touchpad nhạy b&eacute;n v&agrave; sạc MagSafe. Đ&uacute;ng với t&ecirc;n gọi &ldquo;Air&rdquo;, chiếc notebook chỉ nặng 2,7 pound n&agrave;y rất dễ d&agrave;ng mang theo bất cứ đ&acirc;u.</p>\r\n<p style=\"text-align: justify;\">Với gi&aacute; khởi điểm từ 1.099 USD, MacBook Air M3 13-inch kh&ocirc;ng hẳn l&agrave; rẻ, nhưng n&oacute; vẫn hợp t&uacute;i tiền hơn so với MacBook Pro 14-inch gi&aacute; 1.999 USD hay MacBook Pro 16-inch gi&aacute; 2.499 USD. Ngay cả khi MacBook Air M2 giờ c&oacute; gi&aacute; khởi điểm 999 USD, bạn vẫn c&oacute; được gi&aacute; trị tuyệt vời với những g&igrave; m&agrave; Air M3 mới mang lại. Hiện tại, đ&acirc;y l&agrave; chiếc MacBook sử dụng chip M3 c&oacute; gi&aacute; cả phải chăng nhất m&agrave; bạn c&oacute; thể mua.</p>\r\n<p style=\"text-align: justify;\">Với hiệu năng xuất sắc, thời lượng pin đ&aacute;ng kinh ngạc v&agrave; thiết kế si&ecirc;u di động, MacBook Air 13-inch M3 l&agrave; một trong những chiếc MacBook v&agrave; laptop tốt nhất hiện nay. H&atilde;y c&ugrave;ng nhau tham khảo qua b&agrave;i đ&aacute;nh gi&aacute; chi tiết b&ecirc;n dưới.</p>\r\n<h3>Đ&aacute;nh gi&aacute; MacBook Air 13 inch M3: Bảng t&oacute;m tắt</h3>\r\n<table style=\"border-collapse: collapse; width: 100%;\" border=\"1\"><colgroup><col style=\"width: 28.9978%;\"><col style=\"width: 71.0022%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td><strong>Thiết kế d&agrave;nh cho?</strong></td>\r\n<td>D&agrave;nh cho những người đang sở hữu MacBook M1 hoặc Intel đời cũ v&agrave; muốn c&oacute; một chiếc MacBook với bộ xử l&yacute; M3 mới nhất.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Mức gi&aacute; l&agrave; bao nhi&ecirc;u?</strong></td>\r\n<td>MacBook Air M3 13-inch c&oacute; gi&aacute; khởi điểm từ 1.099 USD tr&ecirc;n trang web của Apple.</td>\r\n</tr>\r\n<tr>\r\n<td><strong>Những điểm y&ecirc;u th&iacute;ch?</strong></td>\r\n<td>Thiết kế si&ecirc;u di động, bắt mắt, m&agrave;n h&igrave;nh sống động, c&oacute; nhiều sự lựa chọn về m&agrave;u sắc v&agrave; hiệu năng mạnh mẽ từ chip M3</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>&nbsp;</p>', '1764775457_69305621edf6c.jpeg', '2025-12-04 10:31:30'),
(3, 'Tỷ phú trẻ nhất thế giới \'không nghỉ ngày nào\' suốt ba năm', '<p class=\"description\" style=\"text-align: justify;\">Tỷ ph&uacute; Brendan Foody, CEO c&ocirc;ng ty AI Mercor, cho biết anh l&agrave;m việc li&ecirc;n tục nhưng kh&ocirc;ng thấy kiệt sức nhờ đam m&ecirc; v&agrave; nh&igrave;n ra gi&aacute; trị trong c&ocirc;ng việc,</p>\r\n<article class=\"fck_detail\">\r\n<p class=\"Normal\" style=\"text-align: justify;\">Foody cho biết, một trong những th&oacute;i quen gi&uacute;p anh trở th&agrave;nh tỷ ph&uacute; l&agrave; kh&ocirc;ng nghỉ ng&agrave;y n&agrave;o. \"T&ocirc;i l&agrave;m việc mỗi ng&agrave;y trong ba năm qua\", anh n&oacute;i với&nbsp;<em>Fortune</em>.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Anh cho rằng mọi người kiệt sức kh&ocirc;ng phải do qu&aacute; chăm chỉ, m&agrave; v&igrave; kh&ocirc;ng cảm thấy thỏa m&atilde;n, &yacute; nghĩa v&agrave; hiệu quả. Anh cũng từng nghĩ c&ocirc;ng việc l&agrave; điều m&igrave;nh phải l&agrave;m. \"Thường đ&oacute; l&agrave; việc t&ocirc;i kh&ocirc;ng th&iacute;ch\", anh chia sẻ. \"Nhưng khi bắt đầu ph&aacute;t triển Mercor, t&ocirc;i bị cuốn h&uacute;t v&agrave; kh&ocirc;ng thể ngừng nghĩ đến, cả khi ăn tối với cha mẹ hay l&agrave;m bất cứ điều g&igrave; kh&aacute;c, n&oacute; vẫn lởn vởn trong đầu\".</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Theo Foody, cần đảm bảo thấy được t&aacute;c động của những g&igrave; đ&atilde; l&agrave;m v&agrave; lợi &iacute;ch khi đầu tư nhiều thời gian. Anh n&oacute;i: \"T&ocirc;i kh&ocirc;ng thể thực sự nghỉ ng&agrave;y n&agrave;o v&igrave; bị th&ocirc;i th&uacute;c phải quay lại với c&ocirc;ng việc. V&igrave; vậy, t&ocirc;i nghĩ một trong những điều quan trọng nhất l&agrave; mọi người t&igrave;m thấy thứ họ thực sự đam m&ecirc; v&agrave; c&oacute; thể d&agrave;nh hết t&acirc;m huyết v&agrave;o đ&oacute;\".</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Sau khi rời Đại học Georgetown để dồn to&agrave;n lực cho Mercor, anh gần như kh&ocirc;ng c&ograve;n những buổi c&agrave; ph&ecirc; t&aacute;n gẫu hay những giờ ph&uacute;t thư gi&atilde;n xa xỉ. Anh kh&ocirc;ng th&iacute;ch họp nhiều v&agrave; một ng&agrave;y tốt đẹp đơn giản l&agrave; được viết t&agrave;i liệu hoặc ph&aacute;t triển &yacute; tưởng. Nhưng anh cho biết, ngay cả với lịch họp d&agrave;y đặc, t&igrave;nh y&ecirc;u d&agrave;nh cho c&ocirc;ng việc vẫn gi&uacute;p anh trụ vững.</p>\r\n</article>', '1764905640_693252a8ae6f8.webp', '2025-12-05 03:34:00'),
(4, 'Phone 17 Pro bị cắt tính năng chụp đêm ở chế độ chân dung', '<p>iPhone 17 Pro v&agrave; 17 Pro Max kh&ocirc;ng thể k&iacute;ch hoạt chế độ chụp đ&ecirc;m khi đang ở chế độ ch&acirc;n dung, t&iacute;nh năng vốn c&oacute; mặt tr&ecirc;n d&ograve;ng Pro từ năm 2020.</p>\r\n<p class=\"Normal\">Một số người d&ugrave;ng iPhone 17 Pro v&agrave; 17 Pro Max b&agrave;y tỏ sự thất vọng tr&ecirc;n c&aacute;c diễn đ&agrave;n khi ph&aacute;t hiện m&aacute;y thiếu hỗ trợ quan trọng. Hai mẫu Pro mới nhất kh&ocirc;ng cho ph&eacute;p k&iacute;ch hoạt đồng thời chế độ chụp đ&ecirc;m (Night mode) khi đang chụp ảnh ở chế độ ch&acirc;n dung (Portrait mode), trong khi những thế hệ Pro trước đ&oacute; vẫn sử dụng được. T&iacute;nh năng n&agrave;y ra mắt năm 2020 tr&ecirc;n iPhone 12 Pro, cho ph&eacute;p tạo ra những bức ảnh x&oacute;a ph&ocirc;ng chất lượng cao, ngay cả trong điều kiện &aacute;nh s&aacute;ng yếu.</p>\r\n<p class=\"Normal\">Người d&ugrave;ng c&oacute; thể tự kiểm tra bằng c&aacute;ch mở ứng dụng Camera, chọn chế độ Ảnh, sau đ&oacute; che ống k&iacute;nh sau để m&ocirc; phỏng m&ocirc;i trường thiếu s&aacute;ng. Biểu tượng trăng khuyết của Night mode sẽ xuất hiện. Tuy nhi&ecirc;n, khi chuyển sang chế độ Portrait mode v&agrave; lặp lại thao t&aacute;c tr&ecirc;n, biểu tượng n&agrave;y c&ugrave;ng t&ugrave;y chọn Night mode trong bảng c&agrave;i đặt biến mất ho&agrave;n to&agrave;n.</p>\r\n<p class=\"Normal\">\"Ảnh ch&acirc;n dung ban đ&ecirc;m kh&ocirc;ng đẹp như mong đợi, đ&oacute; l&agrave; bước l&ugrave;i so với chất lượng c&aacute;c iPhone trước đ&acirc;y c&oacute; thể đạt được\", t&agrave;i khoản&nbsp;<em>catalyticclover&nbsp;</em>cho biết tr&ecirc;n Reddit.</p>\r\n<p class=\"Normal\">Động th&aacute;i của Apple khiến nhiều người thấy kh&oacute; hiểu v&igrave; phần cứng của d&ograve;ng Pro ho&agrave;n to&agrave;n c&oacute; khả năng xử l&yacute; tốt khi kết hợp hai chế độ. Theo&nbsp;<em>Macworld</em>, trong hướng dẫn sử dụng iOS 26, Apple x&aacute;c nhận cắt giảm t&iacute;nh năng. Trang c&ocirc;ng nghệ n&agrave;y dự đo&aacute;n nguy&ecirc;n nh&acirc;n c&oacute; thể li&ecirc;n quan đến th&ocirc;ng tin độ s&acirc;u trường ảnh. Ảnh Night mode tr&ecirc;n iPhone 17 Pro c&oacute; thể thiếu dữ liệu độ s&acirc;u cần thiết để tạo hiệu ứng x&oacute;a ph&ocirc;ng cho ch&acirc;n dung, khiến hai t&iacute;nh năng kh&ocirc;ng hoạt động c&ugrave;ng nhau.</p>\r\n<p class=\"Normal\">Một nguy&ecirc;n nh&acirc;n kh&aacute;c được cho l&agrave; giới hạn về độ ph&acirc;n giải ảnh. Ảnh ở chế độ Night mode thường giới hạn ở 12 megapixel, c&ograve;n ảnh ch&acirc;n dung tr&ecirc;n iPhone 17 Pro c&oacute; thể chụp ở độ ph&acirc;n giải 24 megapixel.</p>\r\n<p class=\"Normal\">Apple chưa đưa ra lời giải th&iacute;ch về quyết định tr&ecirc;n, hay c&oacute; kế hoạch bổ sung qua c&aacute;c bản cập nhật phần mềm trong tương lai hay kh&ocirc;ng.</p>', '1764905866_6932538a96bdd.webp', '2025-12-05 03:37:46'),
(5, 'Video đội quân robot hình người Trung Quốc gây tranh cãi', '<p class=\"description\" style=\"text-align: justify;\">Video h&agrave;ng trăm robot h&igrave;nh người di chuyển đồng bộ, thể hiện tr&igrave;nh độ ph&aacute;t triển v&agrave; năng lực sản xuất ti&ecirc;n tiến, bị nghi ngờ về t&iacute;nh x&aacute;c thực.</p>\r\n<article class=\"fck_detail\">\r\n<p class=\"Normal\" style=\"text-align: justify;\">C&ocirc;ng ty robot Trung Quốc UBTech Robotics thu h&uacute;t sự ch&uacute; &yacute; to&agrave;n cầu khi c&ocirc;ng bố thước phim cho thấy robot h&igrave;nh người Walker S2 di chuyển theo đội h&igrave;nh lớn v&agrave;o th&aacute;ng 11. Trong video, đội qu&acirc;n robot h&igrave;nh người quay đầu, vẫy tay, đi bộ v&agrave; tự bước v&agrave;o c&aacute;c container, gợi nhắc đến bộ phim khoa học viễn tưởng&nbsp;<em>I, Robot</em>.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">UBTech Robotics tuy&ecirc;n bố đ&atilde; giao h&agrave;ng trăm robot h&igrave;nh người Walker S2 đến c&aacute;c cơ sở c&ocirc;ng nghiệp. C&ocirc;ng ty coi đ&acirc;y l&agrave; cột mốc quan trọng chứng minh robot h&igrave;nh người đang bước ra khỏi giai đoạn nguy&ecirc;n mẫu, chuyển sang triển khai thực tế.</p>\r\n</article>', '1764905931_693253cb973be.webp', '2025-12-05 03:38:51'),
(6, 'Hoạt động trí tuệ nhân tạo sẽ hưởng ưu đãi và hỗ trợ cao nhất', '<p class=\"description\" style=\"text-align: justify;\">Ch&iacute;nh phủ cho biết dự Luật Tr&iacute; tuệ nh&acirc;n tạo sẽ đưa hoạt động ph&aacute;t triển AI v&agrave;o nh&oacute;m hưởng ưu đ&atilde;i cao nhất nhằm khuyến kh&iacute;ch đổi mới s&aacute;ng tạo v&agrave; ph&aacute;t triển thị trường.</p>\r\n<article class=\"fck_detail\">\r\n<p class=\"Normal\" style=\"text-align: justify;\">Chiều 4/12, Ủy ban Thường vụ Quốc hội cho &yacute; kiến dự &aacute;n Luật Tr&iacute; tuệ nh&acirc;n tạo. B&aacute;o c&aacute;o giải tr&igrave;nh n&ecirc;u dự thảo Luật được thiết kế theo hướng h&agrave;i h&ograve;a giữa kiểm so&aacute;t rủi ro v&agrave; th&uacute;c đẩy ph&aacute;t triển, tiếp thu kinh nghiệm từ EU v&agrave; H&agrave;n Quốc. Ch&iacute;nh phủ đặt mục ti&ecirc;u bảo đảm an to&agrave;n ở mức cao đối với c&aacute;c hệ thống rủi ro trọng yếu nhưng vẫn tạo kh&ocirc;ng gian đủ rộng để th&uacute;c đẩy đổi mới s&aacute;ng tạo, kh&ocirc;ng k&igrave;m h&atilde;m sự ph&aacute;t triển của c&ocirc;ng nghệ mới.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Cơ quan soạn thảo cho biết đ&atilde; chỉnh l&yacute; dự thảo để bảo đảm sự c&acirc;n bằng thực chất giữa quản l&yacute; v&agrave; th&uacute;c đẩy. Luật khẳng định hoạt động về tr&iacute; tuệ nh&acirc;n tạo sẽ được hưởng mức ưu đ&atilde;i v&agrave; hỗ trợ cao nhất, qua đ&oacute; th&uacute;c đẩy h&igrave;nh th&agrave;nh thị trường AI, mở rộng hệ sinh th&aacute;i c&ocirc;ng nghệ v&agrave; thu h&uacute;t nguồn lực v&agrave;o những lĩnh vực chiến lược.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Dự luật được ho&agrave;n thiện theo hướng thuận lợi hơn cho doanh nghiệp trong cơ chế thử nghiệm, gồm cho ph&eacute;p miễn, giảm một số nghĩa vụ tu&acirc;n thủ trong phạm vi thử nghiệm; &aacute;p dụng quy tr&igrave;nh thẩm định v&agrave; phản hồi nhanh theo quy định của Ch&iacute;nh phủ. C&aacute;ch tiếp cận n&agrave;y nhằm gi&uacute;p doanh nghiệp nhanh ch&oacute;ng triển khai sản phẩm mới, thử nghiệm c&ocirc;ng nghệ m&agrave; vẫn bảo đảm an to&agrave;n.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Quỹ Ph&aacute;t triển tr&iacute; tuệ nh&acirc;n tạo Quốc gia được định hướng tập trung hỗ trợ x&acirc;y dựng hạ tầng chiến lược, đầu tư c&ocirc;ng nghệ l&otilde;i v&agrave; nền tảng điện to&aacute;n, với cơ chế t&agrave;i ch&iacute;nh đặc th&ugrave;. Đ&aacute;ng ch&uacute; &yacute;, dự thảo bổ sung cơ chế phiếu hỗ trợ để doanh nghiệp khởi nghiệp, doanh nghiệp nhỏ v&agrave; vừa c&oacute; thể tiếp cận thuận lợi hạ tầng t&iacute;nh to&aacute;n v&agrave; nền tảng huấn luyện, gi&uacute;p n&acirc;ng cao năng lực cạnh tranh quốc gia.</p>\r\n</article>', '1764906015_6932541f43eeb.webp', '2025-12-05 03:40:15'),
(7, 'Đại học Bách khoa Hà Nội và Huawei bắt tay phát triển nhân tài AI, 5G', '<p class=\"description\" style=\"text-align: justify;\">Đại học B&aacute;ch khoa H&agrave; Nội v&agrave; Huawei k&yacute; ghi nhớ hợp t&aacute;c th&uacute;c đẩy ph&aacute;t triển nh&acirc;n t&agrave;i c&ocirc;ng nghệ, mục ti&ecirc;u đ&agrave;o tạo 300 người mỗi năm.</p>\r\n<article class=\"fck_detail\">\r\n<p class=\"Normal\" style=\"text-align: justify;\">Được k&yacute; kết ng&agrave;y 4/12, bản ghi nhớ hợp t&aacute;c (MOU) tập trung đ&agrave;o tạo nh&acirc;n t&agrave;i cho c&aacute;c lĩnh vực AI, 5G, điện to&aacute;n đ&aacute;m m&acirc;y (cloud) hay năng lượng xanh (green energy), với mục ti&ecirc;u th&uacute;c đẩy chuyển đổi số trong ng&agrave;nh gi&aacute;o dục, ph&aacute;t triển nh&acirc;n t&agrave;i c&ocirc;ng nghệ, tăng cường li&ecirc;n kết giữa đại học v&agrave; doanh nghiệp.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">&nbsp;</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">Theo bi&ecirc;n bản thỏa thuận, hai b&ecirc;n sẽ hợp t&aacute;c tr&ecirc;n ba lĩnh vực ch&iacute;nh, gồm chuyển đổi số trong gi&aacute;o dục đại học, với trọng t&acirc;m x&acirc;y dựng m&ocirc; h&igrave;nh đại học số v&agrave; ứng dụng AI v&agrave;o giảng dạy - nghi&ecirc;n cứu - quản trị; ph&aacute;t triển nguồn nh&acirc;n lực ICT, triển khai chương tr&igrave;nh Huawei ICT Academy với mục ti&ecirc;u đ&agrave;o tạo 300 sinh vi&ecirc;n mỗi năm, n&acirc;ng cao năng lực giảng vi&ecirc;n th&ocirc;ng qua chương tr&igrave;nh đ&agrave;o tạo v&agrave; cung cấp học liệu miễn ph&iacute;; kết nối đại học - doanh nghiệp, gồm tổ chức Office Tour, Job Fair, hội thảo kỹ thuật v&agrave; c&aacute;c chương tr&igrave;nh thực tập - tuyển dụng d&agrave;nh cho sinh vi&ecirc;n năm cuối nhằm tăng cường trải nghiệm thực tế v&agrave; n&acirc;ng cao năng lực nghề nghiệp.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">PGS.TS Nguyễn Phong Điền, Ph&oacute; gi&aacute;m đốc Đại học B&aacute;ch khoa H&agrave; Nội, đ&aacute;nh gi&aacute; lễ k&yacute; kết đ&aacute;nh dấu cột mốc quan trọng gi&uacute;p th&uacute;c đẩy c&ocirc;ng nghệ, gi&aacute;o dục v&agrave; ph&aacute;t triển bền vững tại Việt Nam. Việc n&agrave;y cũng gi&uacute;p sinh vi&ecirc;n tiếp cận chương tr&igrave;nh đ&agrave;o tạo ti&ecirc;n tiến, lấy chứng chỉ nghề nghiệp quốc tế v&agrave; cơ hội tham gia c&aacute;c chương tr&igrave;nh to&agrave;n cầu. Đ&acirc;y cũng l&agrave; cơ hội để sinh vi&ecirc;n thực tập, tiếp x&uacute;c hội chợ việc l&agrave;m, hội thảo kỹ thuật v&agrave; hoạt động kết nối với chuy&ecirc;n gia h&agrave;ng đầu trong ng&agrave;nh.</p>\r\n<div id=\"sis_outstream_container\" style=\"text-align: justify;\" data-set=\"dfp\"></div>\r\n<p class=\"Normal\" style=\"text-align: justify;\">&Ocirc;ng Ivan Liu, Tổng gi&aacute;m đốc Huawei Việt Nam, cho biết c&ocirc;ng ty sẽ cung cấp nguồn lực học thuật ti&ecirc;n tiến của Huawei ICT Academy, gi&uacute;p sinh vi&ecirc;n v&agrave; giảng vi&ecirc;n tiếp cận kiến thức mới về AI, điện to&aacute;n đ&aacute;m m&acirc;y, viễn th&ocirc;ng v&agrave; c&ocirc;ng nghệ th&ocirc;ng tin, đồng thời mở rộng cơ hội thực tập v&agrave; ph&aacute;t triển nghề nghiệp cho sinh vi&ecirc;n.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\">B&agrave; Purvis Cui, Gi&aacute;m đốc nh&acirc;n sự Huawei Việt Nam, cũng khẳng định sẽ tạo mọi điều kiện để sinh vi&ecirc;n Việt Nam c&oacute; cơ hội tham gia v&agrave;o c&aacute;c dự &aacute;n thực tế. Ngo&agrave;i Đại học B&aacute;ch khoa H&agrave; Nội, Huawei sẽ phối hợp với c&aacute;c trường trong cả nước để tổ chức c&aacute;c cuộc hội thảo để cập nhật về xu hướng c&ocirc;ng nghệ, xu hướng tuyển dụng nhằm gi&uacute;p sinh vi&ecirc;n c&oacute; sự chuẩn bị tốt hơn để tăng khả năng cạnh tranh khi tham gia v&agrave;o thị trường lao động.</p>\r\n<p class=\"Normal\" style=\"text-align: justify;\"><em>Huawei hiện l&agrave; đối t&aacute;c gi&aacute;o dục l&acirc;u năm của nhiều trường đại học Việt Nam. Th&ocirc;ng qua chương tr&igrave;nh Huawei ICT Academy, Huawei ICT Competition, Seeds for the Future cũng như c&aacute;c chương tr&igrave;nh thực tập, c&ocirc;ng ty hiện tuyển dụng t&agrave;i năng trẻ, g&oacute;p phần hỗ trợ qu&aacute; tr&igrave;nh chuyển đổi số quốc gia v&agrave; ph&aacute;t triển nguồn nh&acirc;n lực số chất lượng.</em></p>\r\n</article>', '1764910478_6932658ed6d55.webp', '2025-12-05 04:54:38'),
(8, 'Top 30 Thảo luận về vai trò của công nghệ đối với đời sống con người', '<p style=\"text-align: justify;\">Con người đang từng ng&agrave;y thay đổi c&ocirc;ng nghệ, nhưng c&ocirc;ng nghệ cũng đang thay đổi cuộc sống của con người, tuy nhi&ecirc;n kh&ocirc;ng phải v&igrave; thế m&agrave; con người ng&agrave;y c&agrave;ng lệ thuộc v&agrave;o n&oacute;. Sự thay đổi n&agrave;y bao gồm cả những mặt t&iacute;ch cực v&agrave; ti&ecirc;u cực. oke</p>', '1764927918_6932a9aeb7bcf.jpg', '2025-12-05 09:45:18');

CREATE TABLE `news_comments` (
  `id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `author` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `news_comments` (`id`, `news_id`, `author`, `content`, `status`, `created_at`) VALUES
(7, 1, 'Vũ Minh Tuấn', 'Cảm ơn tác giả đã chia sẻ', 0, '2025-12-04 10:31:30'),
(14, 2, 'Phạm Thị Lan', 'Rất chi tiết và rõ ràng', 1, '2025-12-04 10:31:30'),
(15, 2, 'Hoàng Văn Hùng', 'Tôi đã học được nhiều điều mới', 1, '2025-12-04 10:31:30'),
(17, 2, 'Đỗ Văn Tuấn', 'Cảm ơn tác giả đã chia sẻ', 1, '2025-12-04 10:31:30'),
(18, 2, 'Lê Thị Trang', 'Nội dung khá tốt', 1, '2025-12-04 10:31:30'),
(28, 7, 'nguyen duc hieu', 'good', 1, '2025-12-05 11:45:32'),
(29, 7, 'nguyen duc hieu', 'xin chào', 1, '2025-12-05 11:45:53'),
(30, 7, 'nguyen duc hieu', 'happy', 1, '2025-12-05 11:45:59'),
(31, 7, 'nguyen duc hieu', 'hello', 1, '2025-12-05 11:46:02'),
(32, 7, 'nguyen duc hieu', 'test', 1, '2025-12-05 11:46:07'),
(33, 7, 'nguyen duc hieu', 'debug', 1, '2025-12-05 11:46:11'),
(34, 7, 'nguyen duc hieu', 'test pagination', 1, '2025-12-05 11:46:32');


--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Laptop', NULL),
(2, 'Điện thoại', NULL),
(3, 'Tai nghe', NULL),
(4, 'Đồng hồ', NULL),
(5, 'Tablet', NULL),
(6, 'Camera', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_number` varchar(50) NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('pending','shipping','completed','cancelled') DEFAULT 'completed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total_amount`, `status`, `created_at`) VALUES
(1, 3, 'ORD1764370636430', 55980000.00, 'completed', '2025-11-28 22:57:16'),
(2, 3, 'ORD1764370663539', 28990000.00, 'completed', '2025-11-28 22:57:43'),
(3, 3, 'ORD1764370999907', 26990000.00, 'completed', '2025-11-28 23:03:19'),
(4, 3, 'ORD1764511520923', 28990000.00, 'completed', '2025-11-30 14:05:20'),
(5, 3, 'ORD1764511684752', 53980000.00, 'shipping', '2025-11-30 14:08:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`, `image`) VALUES
(1, 1, 2, 'Samsung Galaxy S24 Ultra', 28990000.00, 1, 'pic/product/2020.webp'),
(2, 1, 3, 'Xiaomi 14 Ultra 5G', 26990000.00, 1, 'pic/product/2030.webp'),
(3, 2, 2, 'Samsung Galaxy S24 Ultra', 28990000.00, 1, 'pic/product/2020.webp'),
(4, 3, 3, 'Xiaomi 14 Ultra 5G', 26990000.00, 1, 'pic/product/2030.webp'),
(5, 4, 2, 'Samsung Galaxy S24 Ultra', 28990000.00, 1, 'pic/product/2020.webp'),
(6, 5, 3, 'Xiaomi 14 Ultra 5G', 26990000.00, 2, 'pic/product/2030.webp');
-- --------------------------------------------------------
-- 
-- Bảng quản lý giỏ hàng (carts) và chi tiết các mặt hàng (cart_items)
-- Hỗ trợ cả guest (session_id) và user đã đăng nhập (user_id)
-- 

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(128) DEFAULT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'pending',
  `total_amount` decimal(15,2) DEFAULT 0.00,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(50) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT 0.00,
  `quantity` int(11) DEFAULT 1,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Set primary keys and auto-increment for carts and cart_items
ALTER TABLE `carts` ADD PRIMARY KEY (`id`);
ALTER TABLE `carts` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cart_items` ADD PRIMARY KEY (`id`);
ALTER TABLE `cart_items` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

-- Optional foreign key (commented out by default, enable if needed and if referential integrity desired):
-- ALTER TABLE `cart_items` ADD CONSTRAINT `fk_cart_items_cart` FOREIGN KEY (`cart_id`) REFERENCES `carts`(`id`) ON DELETE CASCADE;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `old_price` decimal(15,2) DEFAULT NULL,
  `amount` int(11) DEFAULT 100,
  `image` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `chip` varchar(100) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `screen` varchar(150) DEFAULT NULL,
  `battery` varchar(100) DEFAULT NULL,
  `guarantee` varchar(100) DEFAULT '12 Tháng',
  `outstanding` text DEFAULT NULL,
  `rating` float DEFAULT 5,
  `is_featured` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`, `old_price`, `amount`, `image`, `image1`, `image2`, `image3`, `chip`, `ram`, `screen`, `battery`, `guarantee`, `outstanding`, `rating`, `is_featured`, `created_at`) VALUES
(1, 2, 'iPhone 15 Pro Max 256GB', 29990000.00, 34990000.00, 100, 'pic/product/2010.webp', 'pic/product/2011.webp', 'pic/product/2012.webp', 'pic/product/2013.webp', 'Apple A17 Pro', '8GB', '6.7 inch OLED 120Hz', '4422 mAh', '12 Tháng', 'Khung viền Titan bền bỉ, nút Action Button mới, cổng Type-C tốc độ cao.', 5, 1, '2025-11-28 22:17:49'),
(2, 2, 'Samsung Galaxy S24 Ultra', 28990000.00, 33990000.00, 100, 'pic/product/2020.webp', 'pic/product/2021.webp', 'pic/product/2022.webp', 'pic/product/2023.webp', 'Snapdragon 8 Gen 3', '12GB', '6.8 inch QHD+ 120Hz', '5000 mAh', '12 Tháng', 'Tích hợp Galaxy AI, khung Titan, camera 200MP zoom 100x.', 4.9, 1, '2025-11-28 22:17:49'),
(3, 2, 'Xiaomi 14 Ultra 5G', 26990000.00, 29990000.00, 100, 'pic/product/2030.webp', 'pic/product/2031.webp', 'pic/product/2032.webp', 'pic/product/2033.webp', 'Snapdragon 8 Gen 3', '16GB', '6.73 inch AMOLED 120Hz', '5000 mAh', '12 Tháng', 'Camera Leica cảm biến 1 inch, sạc nhanh 90W.', 4.8, 1, '2025-11-28 22:17:49'),
(4, 2, 'iPhone 13 128GB', 13990000.00, 16990000.00, 100, 'pic/product/2040.webp', '', '', '', 'Apple A15 Bionic', '4GB', '6.1 inch OLED', '3240 mAh', '12 Tháng', 'Thiết kế camera chéo, hiệu năng vẫn rất mạnh mẽ trong tầm giá.', 4.7, 1, '2025-11-28 22:17:49'),
(5, 2, 'Samsung Galaxy A55 5G', 9990000.00, 11990000.00, 100, 'pic/product/2050.webp', '', '', '', 'Exynos 1480', '8GB', '6.6 inch Super AMOLED', '5000 mAh', '12 Tháng', 'Thiết kế khung kim loại, chống nước IP67.', 4.5, 1, '2025-11-28 22:17:49'),
(6, 2, 'OPPO Reno11 F 5G', 8490000.00, 8990000.00, 100, 'pic/product/2060.webp', '', '', '', 'Dimensity 7050', '8GB', '6.7 inch AMOLED', '5000 mAh', '12 Tháng', 'Camera chuyên gia chân dung, sạc nhanh 67W.', 4.6, 1, '2025-11-28 22:17:49'),
(7, 2, 'Xiaomi Redmi Note 13 Pro', 6490000.00, 7290000.00, 100, 'pic/product/2070.webp', '', '', '', 'Helio G99 Ultra', '8GB', '6.67 inch AMOLED', '5000 mAh', '12 Tháng', 'Camera 200MP, màn hình viền siêu mỏng.', 4.4, 0, '2025-11-28 22:17:49'),
(8, 2, 'iPhone 11 64GB', 8990000.00, 11990000.00, 100, 'pic/product/2080.webp', '', '', '', 'Apple A13 Bionic', '4GB', '6.1 inch IPS', '3110 mAh', '12 Tháng', 'Huyền thoại iPhone giá rẻ, pin trâu.', 4.3, 0, '2025-11-28 22:17:49'),
(9, 2, 'Samsung Galaxy Z Flip5', 16990000.00, 25990000.00, 100, 'pic/product/2090.webp', '', '', '', 'Snapdragon 8 Gen 2', '8GB', '6.7 inch Foldable', '3700 mAh', '12 Tháng', 'Màn hình phụ Flex Window lớn, gập không kẽ hở.', 4.8, 1, '2025-11-28 22:17:49'),
(10, 2, 'ASUS ROG Phone 8', 29990000.00, 31990000.00, 100, 'pic/product/2100.webp', '', '', '', 'Snapdragon 8 Gen 3', '12GB', '6.78 inch 165Hz', '5500 mAh', '12 Tháng', 'Gaming Phone tối thượng, thiết kế mới thanh lịch hơn.', 5, 1, '2025-11-28 22:17:49'),
(11, 2, 'Vivo V30e 5G', 9490000.00, 10490000.00, 100, 'pic/product/2110.webp', '', '', '', 'Snapdragon 6 Gen 1', '8GB', '6.78 inch AMOLED', '5500 mAh', '12 Tháng', 'Vòng sáng Aura, thiết kế mỏng nhẹ.', 4.5, 0, '2025-11-28 22:17:49'),
(12, 2, 'Realme C65', 3690000.00, 3990000.00, 100, 'pic/product/2120.webp', '', '', '', 'Helio G85', '6GB', '6.67 inch IPS', '5000 mAh', '12 Tháng', 'Sạc nhanh 45W trong phân khúc giá rẻ.', 4.2, 0, '2025-11-28 22:17:49'),
(13, 2, 'iPhone 15 Plus 128GB', 22990000.00, 25990000.00, 100, 'pic/product/2130.webp', '', '', '', 'Apple A16 Bionic', '6GB', '6.7 inch OLED', '4383 mAh', '12 Tháng', 'Dynamic Island, pin trâu nhất dòng iPhone 15.', 4.7, 1, '2025-11-28 22:17:49'),
(14, 2, 'Samsung Galaxy S23 FE', 11990000.00, 14890000.00, 100, 'pic/product/2140.webp', '', '', '', 'Exynos 2200', '8GB', '6.4 inch AMOLED', '4500 mAh', '12 Tháng', 'Phiên bản Fan Edition, hiệu năng flagship giá tốt.', 4.6, 0, '2025-11-28 22:17:49'),
(15, 2, 'Xiaomi 13T 5G', 10990000.00, 12990000.00, 100, 'pic/product/2150.webp', '', '', '', 'Dimensity 8200 Ultra', '12GB', '6.67 inch 144Hz', '5000 mAh', '12 Tháng', 'Camera Leica, màn hình 144Hz siêu mượt.', 4.5, 0, '2025-11-28 22:17:49'),
(16, 2, 'Nubia Neo 2 5G', 4690000.00, 4990000.00, 100, 'pic/product/2160.webp', '', '', '', 'Unisoc T820', '8GB', '6.72 inch 120Hz', '6000 mAh', '12 Tháng', 'Gaming phone giá rẻ, thiết kế hầm hố, pin khủng.', 4.3, 0, '2025-11-28 22:17:49'),
(17, 5, 'iPad Pro M4 11 inch', 28990000.00, 30990000.00, 100, 'pic/product/5010.webp', '', '', '', 'Apple M4', '8GB', '11 inch OLED', 'N/A', '12 Tháng', 'Siêu mỏng nhẹ, màn hình OLED Tandem đỉnh cao.', 5, 1, '2025-11-28 22:17:49'),
(18, 5, 'Samsung Galaxy Tab S9 Ultra', 24990000.00, 32990000.00, 100, 'pic/product/5020.webp', '', '', '', 'Snapdragon 8 Gen 2', '12GB', '14.6 inch AMOLED', '11200 mAh', '12 Tháng', 'Màn hình khổng lồ, chống nước IP68.', 4.9, 1, '2025-11-28 22:17:49'),
(19, 5, 'iPad Air 6 M2 11 inch', 16990000.00, 18990000.00, 100, 'pic/product/5030.webp', '', '', '', 'Apple M2', '8GB', '11 inch IPS', 'N/A', '12 Tháng', 'Hiệu năng mạnh mẽ với chip M2, nhiều màu sắc.', 4.8, 1, '2025-11-28 22:17:49'),
(20, 5, 'Xiaomi Pad 6', 8490000.00, 9990000.00, 100, 'pic/product/5040.webp', '', '', '', 'Snapdragon 870', '8GB', '11 inch 144Hz', '8840 mAh', '12 Tháng', 'Màn hình 144Hz, hiệu năng ổn định.', 4.7, 0, '2025-11-28 22:17:49'),
(21, 5, 'iPad Gen 10 64GB WiFi', 8990000.00, 10990000.00, 100, 'pic/product/5050.webp', '', '', '', 'Apple A14 Bionic', '4GB', '10.9 inch IPS', 'N/A', '12 Tháng', 'Thiết kế mới viền mỏng, cổng USB-C.', 4.6, 1, '2025-11-28 22:17:49'),
(22, 5, 'Samsung Galaxy Tab S9 FE', 7990000.00, 9990000.00, 100, 'pic/product/5060.webp', '', '', '', 'Exynos 1380', '6GB', '10.9 inch 90Hz', '8000 mAh', '12 Tháng', 'Kèm bút S-Pen, chống nước.', 4.5, 0, '2025-11-28 22:17:49'),
(23, 5, 'Lenovo Tab M11', 5490000.00, 6490000.00, 100, 'pic/product/5070.webp', '', '', '', 'Helio G88', '4GB', '11 inch IPS', '7040 mAh', '12 Tháng', 'Giá rẻ, màn hình lớn cho học tập.', 4.3, 0, '2025-11-28 22:17:49'),
(24, 5, 'iPad Mini 6 WiFi 64GB', 11990000.00, 13990000.00, 100, 'pic/product/5080.webp', '', '', '', 'Apple A15 Bionic', '4GB', '8.3 inch IPS', 'N/A', '12 Tháng', 'Nhỏ gọn, mạnh mẽ, dễ mang theo.', 4.8, 1, '2025-11-28 22:17:49'),
(25, 5, 'Samsung Galaxy Tab A9+', 4990000.00, 5990000.00, 100, 'pic/product/5090.webp', '', '', '', 'Snapdragon 695', '4GB', '11 inch 90Hz', '7040 mAh', '12 Tháng', 'Tablet giải trí giá bình dân tốt nhất.', 4.2, 0, '2025-11-28 22:17:49'),
(26, 5, 'OPPO Pad Neo', 6490000.00, 6990000.00, 100, 'pic/product/5100.webp', '', '', '', 'Helio G99', '6GB', '11.4 inch 2.4K', '8000 mAh', '12 Tháng', 'Màn hình đẹp tỉ lệ 7:5 độc đáo.', 4.4, 0, '2025-11-28 22:17:49'),
(27, 5, 'Huawei MatePad 11.5', 6990000.00, 7490000.00, 100, 'pic/product/5110.webp', '', '', '', 'Snapdragon 7 Gen 1', '6GB', '11.5 inch 120Hz', '7700 mAh', '12 Tháng', 'Hỗ trợ Google qua Gbox, màn hình 120Hz.', 4.5, 0, '2025-11-28 22:17:49'),
(28, 5, 'iPad Pro 12.9 M2', 34990000.00, 37990000.00, 100, 'pic/product/5120.webp', '', '', '', 'Apple M2', '8GB', '12.9 inch Mini-LED', 'N/A', '12 Tháng', 'Màn hình Mini-LED xuất sắc cho đồ họa.', 5, 1, '2025-11-28 22:17:49'),
(29, 5, 'Xiaomi Redmi Pad SE', 4490000.00, 4990000.00, 100, 'pic/product/5130.webp', '', '', '', 'Snapdragon 680', '4GB', '11 inch 90Hz', '8000 mAh', '12 Tháng', 'Thiết kế nhôm nguyên khối, 4 loa Dolby Atmos.', 4.1, 0, '2025-11-28 22:17:49'),
(30, 5, 'Samsung Galaxy Tab S6 Lite 2024', 8490000.00, 9990000.00, 100, 'pic/product/5140.webp', '', '', '', 'Exynos 1280', '4GB', '10.4 inch TFT', '7040 mAh', '12 Tháng', 'Bản nâng cấp 2024, kèm bút S-Pen.', 4.3, 0, '2025-11-28 22:17:49'),
(31, 5, 'Masstel Tab 10S', 2990000.00, 3490000.00, 100, 'pic/product/5150.webp', '', '', '', 'Unisoc T310', '3GB', '10.1 inch IPS', '6000 mAh', '12 Tháng', 'Tablet giá rẻ thương hiệu Việt.', 3.8, 0, '2025-11-28 22:17:49'),
(32, 5, 'Coolpad Tab Tasker 10', 1990000.00, 2490000.00, 100, 'pic/product/5160.webp', '', '', '', 'Entry Level', '2GB', '10 inch', '5000 mAh', '12 Tháng', 'Tablet cơ bản nhất.', 3.5, 0, '2025-11-28 22:17:49'),
(33, 1, 'MacBook Pro 14 M3', 49990000.00, 52990000.00, 100, 'pic/product/1010.webp', '', '', '', 'Apple M3 Pro', '18GB', '14 inch Liquid Retina XDR', '72.4 Wh', '12 Tháng', 'Mạnh mẽ, màn hình đẹp nhất thế giới laptop.', 5, 1, '2025-11-28 22:17:49'),
(34, 1, 'MacBook Air M2 13 inch', 24990000.00, 28990000.00, 100, 'pic/product/1020.webp', '', '', '', 'Apple M2', '8GB', '13.6 inch IPS', '52.6 Wh', '12 Tháng', 'Mỏng nhẹ, thiết kế tai thỏ thời thượng.', 4.8, 1, '2025-11-28 22:17:49'),
(35, 1, 'ASUS ROG Strix G16', 32990000.00, 35990000.00, 100, 'pic/product/1030.webp', '', '', '', 'i7-13650HX', '16GB', '16 inch FHD+ 165Hz', '90 Wh', '12 Tháng', 'Cấu hình khủng, LED RGB đẹp mắt.', 4.9, 1, '2025-11-28 22:17:49'),
(36, 1, 'Dell XPS 13 Plus', 45990000.00, 51990000.00, 100, 'pic/product/1040.webp', '', '', '', 'i7-1360P', '16GB', '13.4 inch OLED 3.5K', '55 Wh', '12 Tháng', 'Thiết kế tương lai, bàn phím vô cực.', 4.7, 1, '2025-11-28 22:17:49'),
(37, 1, 'MSI Gaming Cyborg 15', 18490000.00, 21990000.00, 100, 'pic/product/1050.webp', '', '', '', 'i7-12650H', '8GB', '15.6 inch 144Hz', '53.5 Wh', '12 Tháng', 'Thiết kế trong suốt, giá tốt.', 4.5, 0, '2025-11-28 22:17:49'),
(38, 1, 'Acer Nitro 5 Tiger', 19990000.00, 23990000.00, 100, 'pic/product/1060.webp', '', '', '', 'i5-12500H', '8GB', '15.6 inch 144Hz', '57 Wh', '12 Tháng', 'Quốc dân gaming, tản nhiệt tốt.', 4.6, 1, '2025-11-28 22:17:49'),
(39, 1, 'HP Pavilion 15', 16990000.00, 18990000.00, 100, 'pic/product/1070.webp', '', '', '', 'i5-1335U', '16GB', '15.6 inch IPS', '41 Wh', '12 Tháng', 'Văn phòng sang trọng, vỏ kim loại.', 4.4, 0, '2025-11-28 22:17:49'),
(40, 1, 'Lenovo ThinkPad X1 Carbon', 42990000.00, 48990000.00, 100, 'pic/product/1080.webp', '', '', '', 'i7-1260P', '16GB', '14 inch WUXGA', '57 Wh', '12 Tháng', 'Siêu bền, bàn phím gõ sướng nhất.', 4.9, 1, '2025-11-28 22:17:49'),
(41, 1, 'Asus Zenbook 14 OLED', 24990000.00, 27990000.00, 100, 'pic/product/1090.webp', '', '', '', 'Ultra 7 155H', '16GB', '14 inch OLED 3K', '75 Wh', '12 Tháng', 'Chip AI mới nhất, màn hình OLED rực rỡ.', 4.7, 1, '2025-11-28 22:17:49'),
(42, 1, 'LG Gram 2023 14 inch', 28990000.00, 32990000.00, 100, 'pic/product/1100.webp', '', '', '', 'i7-1340P', '16GB', '14 inch IPS', '72 Wh', '12 Tháng', 'Siêu nhẹ chỉ 999g, pin trâu.', 4.6, 0, '2025-11-28 22:17:49'),
(43, 1, 'Surface Pro 9', 26990000.00, 29990000.00, 100, 'pic/product/1110.webp', '', '', '', 'i5-1235U', '8GB', '13 inch PixelSense', '47.7 Wh', '12 Tháng', 'Laptop lai máy tính bảng đẳng cấp.', 4.8, 1, '2025-11-28 22:17:49'),
(44, 1, 'Dell Inspiron 15 3520', 12990000.00, 14990000.00, 100, 'pic/product/1120.webp', '', '', '', 'i5-1235U', '8GB', '15.6 inch 120Hz', '41 Wh', '12 Tháng', 'Giá tốt cho sinh viên.', 4.3, 0, '2025-11-28 22:17:49'),
(45, 1, 'Asus Vivobook 15', 11490000.00, 13490000.00, 100, 'pic/product/1130.webp', '', '', '', 'i3-1215U', '8GB', '15.6 inch FHD', '42 Wh', '12 Tháng', 'Bền bỉ, bản lề mở 180 độ.', 4.4, 0, '2025-11-28 22:17:49'),
(46, 1, 'MacBook Air M1', 18490000.00, 22990000.00, 100, 'pic/product/1140.webp', '', '', '', 'Apple M1', '8GB', '13.3 inch Retina', '49.9 Wh', '12 Tháng', 'Vẫn rất ngon trong tầm giá.', 4.9, 0, '2025-11-28 22:17:49'),
(47, 1, 'Lenovo Legion 5', 29990000.00, 33990000.00, 100, 'pic/product/1150.webp', '', '', '', 'Ryzen 7 6800H', '16GB', '15.6 inch 165Hz', '80 Wh', '12 Tháng', 'Thiết kế tối giản, hiệu năng cao.', 4.8, 0, '2025-11-28 22:17:49'),
(48, 1, 'Gigabyte G5 MF', 20990000.00, 24990000.00, 100, 'pic/product/1160.webp', '', '', '', 'i5-12450H', '8GB', '15.6 inch 144Hz', '54 Wh', '12 Tháng', 'Card rời RTX 4050 giá rẻ.', 4.5, 0, '2025-11-28 22:17:49'),
(49, 3, 'Sony INZONE Buds', 4990000.00, 5490000.00, 100, 'pic/product/3010.webp', '', '', '', 'Sony V1', 'N/A', 'N/A', '12 giờ', '12 Tháng', 'Tai nghe Gaming True Wireless, độ trễ cực thấp.', 4.8, 1, '2025-11-28 22:17:49'),
(50, 3, 'ASUS ROG Cetra True Wireless', 1990000.00, 2290000.00, 100, 'pic/product/3020.webp', '', '', '', 'N/A', 'N/A', 'LED RGB', '27 giờ', '12 Tháng', 'Chế độ Gaming Mode, chống ồn ANC, đèn LED RGB.', 4.7, 1, '2025-11-28 22:17:49'),
(51, 3, 'Marshall Motif II A.N.C', 4990000.00, 5990000.00, 100, 'pic/product/3030.webp', '', '', '', 'N/A', 'N/A', 'N/A', '30 giờ', '12 Tháng', 'Thiết kế đậm chất Rock, chống ồn chủ động cải tiến.', 4.6, 0, '2025-11-28 22:17:49'),
(52, 3, 'JBL Quantum TWS', 2490000.00, 3990000.00, 100, 'pic/product/3040.webp', '', '', '', 'N/A', 'N/A', 'N/A', '24 giờ', '12 Tháng', 'Kết nối Dongle Type-C 2.4GHz không độ trễ.', 4.5, 0, '2025-11-28 22:17:49'),
(53, 3, 'Sony WH-CH720N', 2990000.00, 3490000.00, 100, 'pic/product/3050.webp', '', '', '', 'V1 Processor', 'N/A', 'N/A', '35 giờ', '12 Tháng', 'Tai nghe chụp tai chống ồn nhẹ nhất của Sony.', 4.7, 0, '2025-11-28 22:17:49'),
(54, 3, 'Bose QuietComfort 45', 6490000.00, 8490000.00, 100, 'pic/product/3060.webp', '', '', '', 'N/A', 'N/A', 'N/A', '24 giờ', '12 Tháng', 'Huyền thoại chống ồn, cảm giác đeo thoải mái.', 4.8, 1, '2025-11-28 22:17:49'),
(55, 3, 'Sennheiser Accentum Plus', 4990000.00, 5990000.00, 100, 'pic/product/3070.webp', '', '', '', 'N/A', 'N/A', 'N/A', '50 giờ', '12 Tháng', 'Pin cực khủng 50 giờ, âm thanh chi tiết.', 4.6, 0, '2025-11-28 22:17:49'),
(56, 3, 'SoundPEATS Air4 Pro', 1690000.00, 1990000.00, 100, 'pic/product/3080.webp', '', '', '', 'Qualcomm QCC3071', 'N/A', 'N/A', '26 giờ', '12 Tháng', 'Hỗ trợ AptX Lossless, giá rẻ cấu hình cao.', 4.5, 0, '2025-11-28 22:17:49'),
(57, 3, 'Huawei FreeClip', 3990000.00, 4990000.00, 100, 'pic/product/3090.webp', '', '', '', 'N/A', 'N/A', 'N/A', '36 giờ', '12 Tháng', 'Thiết kế C-bridge độc đáo, không đau tai.', 4.4, 1, '2025-11-28 22:17:49'),
(58, 3, 'Shokz OpenRun Pro', 4290000.00, 4990000.00, 100, 'pic/product/3100.webp', '', '', '', 'N/A', 'N/A', 'N/A', '10 giờ', '12 Tháng', 'Tai nghe dẫn truyền xương tốt nhất cho chạy bộ.', 4.9, 0, '2025-11-28 22:17:49'),
(59, 3, 'Jabra Elite 10', 5990000.00, 6990000.00, 100, 'pic/product/3110.webp', '', '', '', 'N/A', 'N/A', 'N/A', '27 giờ', '12 Tháng', 'Công nghệ Dolby Atmos Head Tracking.', 4.7, 0, '2025-11-28 22:17:49'),
(60, 3, 'Monster XKT10', 450000.00, 990000.00, 100, 'pic/product/3120.webp', '', '', '', 'N/A', 'N/A', 'N/A', '20 giờ', '12 Tháng', 'Tai nghe Gaming giá rẻ thiết kế Spinner.', 4.2, 0, '2025-11-28 22:17:49'),
(61, 4, 'Garmin Fenix 7 Pro Solar', 23990000.00, 25990000.00, 100, 'pic/product/4010.webp', '', '', '', 'N/A', 'N/A', '1.3 inch MIP', '22 ngày', '12 Tháng', 'Sạc năng lượng mặt trời, đèn pin tích hợp.', 5, 1, '2025-11-28 22:17:49'),
(62, 4, 'Samsung Galaxy Watch6', 5990000.00, 6990000.00, 100, 'pic/product/4020.webp', '', '', '', 'Exynos W930', '2GB', '1.5 inch Super AMOLED', '40 giờ', '12 Tháng', 'Viền màn hình mỏng hơn, theo dõi giấc ngủ chuyên sâu.', 4.8, 1, '2025-11-28 22:17:49'),
(63, 4, 'Amazfit Balance', 5990000.00, 6590000.00, 100, 'pic/product/4030.webp', '', '', '', 'N/A', 'N/A', '1.5 inch AMOLED', '14 ngày', '12 Tháng', 'Cân bằng cuộc sống, đo thành phần cơ thể.', 4.7, 0, '2025-11-28 22:17:49'),
(64, 4, 'Xiaomi Redmi Watch 4', 2390000.00, 2690000.00, 100, 'pic/product/4040.webp', '', '', '', 'N/A', 'N/A', '1.97 inch AMOLED', '20 ngày', '12 Tháng', 'Màn hình lớn nhất dòng Redmi Watch, khung nhôm.', 4.6, 1, '2025-11-28 22:17:49'),
(65, 4, 'Garmin Epix Gen 2', 20990000.00, 22490000.00, 100, 'pic/product/4050.webp', '', '', '', 'N/A', '32GB', '1.3 inch AMOLED', '16 ngày', '12 Tháng', 'Màn hình AMOLED rực rỡ trên dòng thể thao cao cấp.', 4.9, 0, '2025-11-28 22:17:49'),
(66, 4, 'Huawei Watch GT Cyber', 4490000.00, 5490000.00, 100, 'pic/product/4060.webp', '', '', '', 'N/A', 'N/A', '1.32 inch AMOLED', '7 ngày', '12 Tháng', 'Thiết kế tháo rời khung vỏ độc đáo.', 4.5, 0, '2025-11-28 22:17:49'),
(67, 4, 'Suunto Race', 11990000.00, 13990000.00, 100, 'pic/product/4070.webp', '', '', '', 'N/A', 'N/A', '1.43 inch AMOLED', '26 ngày', '12 Tháng', 'Núm xoay Digital Crown, bản đồ offline miễn phí.', 4.7, 0, '2025-11-28 22:17:49'),
(68, 4, 'Garmin Lily 2', 6490000.00, 6990000.00, 100, 'pic/product/4080.webp', '', '', '', 'N/A', 'N/A', 'LCD ẩn', '5 ngày', '12 Tháng', 'Thiết kế trang sức nhỏ gọn dành cho nữ.', 4.4, 0, '2025-11-28 22:17:49'),
(69, 4, 'Kieslect Ks Pro', 1690000.00, 2190000.00, 100, 'pic/product/4090.webp', '', '', '', 'N/A', 'N/A', '2.01 inch AMOLED', '6 ngày', '12 Tháng', 'Màn hình siêu lớn, gọi điện Bluetooth ổn định.', 4.3, 0, '2025-11-28 22:17:49'),
(70, 4, 'Apple Watch Series 8 Thép', 16990000.00, 19990000.00, 100, 'pic/product/4100.webp', '', '', '', 'Apple S8', 'N/A', '1.9 inch OLED', '18 giờ', '12 Tháng', 'Vỏ thép sang trọng, mặt kính Sapphire.', 4.9, 0, '2025-11-28 22:17:49'),
(71, 4, 'SoundPEATS Watch 4', 890000.00, 1290000.00, 100, 'pic/product/4110.webp', '', '', '', 'N/A', 'N/A', '1.85 inch HD', '7 ngày', '12 Tháng', 'Giá rẻ, đầy đủ tính năng cơ bản.', 4.1, 0, '2025-11-28 22:17:49'),
(72, 4, 'Masstel Smart Hero 4G', 1990000.00, 2490000.00, 100, 'pic/product/4120.webp', '', '', '', 'N/A', 'N/A', '1.4 inch', '2 ngày', '12 Tháng', 'Đồng hồ định vị trẻ em, hỗ trợ sim 4G.', 4, 0, '2025-11-28 22:17:49'),
(73, 6, 'Sony ZV-1 II', 18990000.00, 20990000.00, 100, 'pic/product/6010.webp', '', '', '', 'BIONZ X', 'N/A', '3 inch Touch', '45 phút quay', '12 Tháng', 'Ống kính góc rộng 18-50mm, chuyên Vlog.', 4.7, 1, '2025-11-28 22:17:49'),
(74, 6, 'Canon EOS R10 Kit 18-45mm', 23990000.00, 26990000.00, 100, 'pic/product/6020.webp', '', '', '', 'DIGIC X', 'N/A', '3 inch Vari-angle', 'N/A', '12 Tháng', 'Máy ảnh Mirrorless Crop mạnh mẽ, lấy nét nhanh.', 4.8, 1, '2025-11-28 22:17:49'),
(75, 6, 'Nikon Z30 Kit 16-50mm', 18490000.00, 20490000.00, 100, 'pic/product/6030.webp', '', '', '', 'EXPEED 6', 'N/A', '3 inch Flip', 'N/A', '12 Tháng', 'Thiết kế cho Content Creator, quay 4K không crop.', 4.6, 0, '2025-11-28 22:17:49'),
(76, 6, 'Fujifilm X-S20 Body', 31990000.00, 33990000.00, 100, 'pic/product/6040.webp', '', '', '', 'X-Processor 5', 'N/A', '3 inch Vari-angle', '750 shots', '12 Tháng', 'Pin trâu, chế độ Vlog mới, quay 6.2K.', 4.9, 1, '2025-11-28 22:17:49'),
(77, 6, 'DJI Osmo Pocket 3', 12990000.00, 14990000.00, 100, 'pic/product/6050.webp', '', '', '', 'N/A', 'N/A', '2 inch Rotatable', '166 phút', '12 Tháng', 'Cảm biến 1 inch, màn hình xoay dọc ngang.', 5, 1, '2025-11-28 22:17:49'),
(78, 6, 'Insta360 GO 3 64GB', 9990000.00, 10990000.00, 100, 'pic/product/6060.webp', '', '', '', 'N/A', 'N/A', '2.2 inch Flip', '170 phút', '12 Tháng', 'Camera hành trình nhỏ nhất thế giới.', 4.7, 0, '2025-11-28 22:17:49'),
(79, 6, 'Sony A6400 Kit 16-50mm', 22990000.00, 24990000.00, 100, 'pic/product/6070.webp', '', '', '', 'BIONZ X', 'N/A', '3 inch Tilt', '360 shots', '12 Tháng', 'Lấy nét mắt thời gian thực, best seller tầm trung.', 4.8, 0, '2025-11-28 22:17:49'),
(80, 6, 'Sony Alpha ILCE-7CM2', 41990000.00, 46990000.00, 100, 'pic/product/6080.webp', '', '', '', 'Venus Engine', 'N/A', '3 inch Vari-angle', 'N/A', '12 Tháng', 'Quái vật quay phim chuẩn điện ảnh.', 4.7, 0, '2025-11-28 22:17:49'),
(81, 6, 'Canon EOS R8 Body', 36990000.00, 3990000.00, 100, 'pic/product/6090.webp', '', '', '', 'DIGIC X', 'N/A', '3 inch', 'N/A', '12 Tháng', 'Full-frame nhẹ nhất của Canon.', 4.7, 0, '2025-11-28 22:17:49'),
(82, 6, 'DJI Mini 4 Pro', 21490000.00, 23490000.00, 100, 'pic/product/6100.webp', '', '', '', 'N/A', 'N/A', 'N/A', '34 phút', '12 Tháng', 'Flycam mini an toàn nhất với cảm biến đa hướng.', 4.9, 1, '2025-11-28 22:17:49'),
(83, 6, 'GoPro Hero 11 Black Mini', 6990000.00, 8490000.00, 100, 'pic/product/6110.webp', '', '', '', 'GP2', 'N/A', 'Không màn hình', 'Enduro', '12 Tháng', 'Nhỏ gọn, gắn mũ bảo hiểm cực tiện.', 4.5, 0, '2025-11-28 22:17:49'),
(84, 6, 'Insta360 X3', 10490000.00, 11490000.00, 100, 'pic/product/6120.webp', '', '', '', 'N/A', 'N/A', '2.29 inch', '81 phút', '12 Tháng', 'Quay 360 độ sáng tạo, chống rung FlowState.', 4.8, 0, '2025-11-28 22:17:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT 5,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `user_name`, `rating`, `comment`, `created_at`) VALUES
(1, 1, 'Nguyễn Văn A', 5, 'Máy quá đẹp, pin trâu, chụp hình nét căng!', '2025-11-28 22:17:49'),
(2, 1, 'Trần Thị B', 4, 'Hơi nóng khi chơi game nặng, còn lại ok.', '2025-11-28 22:17:49'),
(3, 1, 'Lê Văn C', 5, 'Giao hàng nhanh, đóng gói kỹ.', '2025-11-28 22:17:49'),
(4, 1, 'Phan Thu B', 2, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(5, 1, 'Trần Thị A', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(6, 1, 'Huỳnh Quốc B', 1, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(7, 1, 'Đặng Thu E', 4, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(8, 1, 'Nguyễn Hoài I', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(9, 1, 'Trần Ngọc M', 3, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(10, 1, 'Đặng Văn L', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(11, 1, 'Huỳnh Thanh F', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(12, 1, 'Bùi Thu L', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(13, 1, 'Bùi Quốc L', 1, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(14, 1, 'Nguyễn Văn L', 1, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(15, 1, 'Lê Thanh B', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(16, 2, 'Phan Kim N', 1, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(17, 2, 'Phan Thu C', 4, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(18, 2, 'Phan Ngọc L', 5, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(19, 2, 'Phạm Hữu F', 4, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(20, 2, 'Phan Minh B', 3, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(21, 2, 'Đặng Kim L', 1, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(22, 2, 'Vũ Minh F', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(23, 2, 'Huỳnh Hữu D', 4, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(24, 2, 'Hoàng Hữu N', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(25, 2, 'Đặng Thanh M', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(26, 2, 'Hoàng Ngọc D', 4, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(27, 3, 'Phạm Hữu C', 5, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(28, 3, 'Huỳnh Ngọc H', 5, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(29, 3, 'Phan Thị D', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(30, 3, 'Bùi Thị H', 4, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(31, 3, 'Phạm Minh I', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(32, 3, 'Phan Minh H', 2, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(33, 3, 'Đặng Thị F', 2, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(34, 3, 'Lê Hữu F', 1, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(35, 3, 'Nguyễn Thu G', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(36, 3, 'Trần Kim L', 1, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(37, 4, 'Đặng Thanh L', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(38, 4, 'Trần Văn N', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(39, 4, 'Vũ Quốc F', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(40, 4, 'Đặng Minh B', 5, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(41, 4, 'Bùi Văn M', 3, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(42, 4, 'Trần Văn H', 3, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(43, 4, 'Nguyễn Hoài B', 4, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(44, 4, 'Bùi Văn D', 3, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(45, 4, 'Vũ Thanh A', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(46, 4, 'Phan Văn G', 3, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(47, 4, 'Phạm Minh I', 1, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(48, 4, 'Đặng Kim H', 2, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(49, 4, 'Phạm Thu F', 4, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(50, 4, 'Đặng Minh E', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(51, 4, 'Phan Thị D', 3, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(52, 5, 'Phan Văn I', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(53, 5, 'Vũ Văn G', 4, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(54, 5, 'Hoàng Hoài K', 4, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(55, 5, 'Phạm Thu N', 1, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(56, 5, 'Lê Thu D', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(57, 5, 'Trần Thị L', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(58, 5, 'Bùi Hữu B', 1, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(59, 5, 'Vũ Thị N', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(60, 5, 'Phạm Minh N', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(61, 5, 'Trần Ngọc D', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(62, 5, 'Trần Kim M', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(63, 5, 'Phạm Hữu G', 1, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(64, 5, 'Nguyễn Quốc J', 4, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(65, 5, 'Trần Thu G', 1, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(66, 5, 'Phạm Hữu N', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(67, 5, 'Huỳnh Minh J', 3, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(68, 5, 'Huỳnh Hoài G', 4, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(69, 6, 'Phạm Ngọc L', 3, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(70, 6, 'Hoàng Kim N', 4, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(71, 6, 'Vũ Hoài F', 1, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(72, 6, 'Nguyễn Kim H', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(73, 6, 'Đặng Hữu G', 5, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(74, 6, 'Hoàng Minh E', 2, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(75, 6, 'Nguyễn Hoài J', 1, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(76, 6, 'Hoàng Hoài J', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(77, 6, 'Hoàng Ngọc F', 3, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(78, 6, 'Vũ Hữu F', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(79, 6, 'Phạm Thị B', 5, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(80, 6, 'Vũ Hữu N', 4, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(81, 7, 'Nguyễn Hoài B', 1, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(82, 7, 'Lê Văn H', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(83, 7, 'Vũ Quốc C', 1, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(84, 7, 'Phan Thanh L', 2, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(85, 7, 'Huỳnh Quốc F', 3, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(86, 7, 'Lê Minh C', 4, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(87, 7, 'Nguyễn Thanh K', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(88, 8, 'Phan Ngọc L', 4, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(89, 8, 'Đặng Kim F', 2, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(90, 8, 'Huỳnh Hoài L', 1, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(91, 8, 'Phạm Minh D', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(92, 8, 'Hoàng Thị B', 1, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(93, 8, 'Phạm Thị J', 4, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(94, 8, 'Hoàng Hoài I', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(95, 8, 'Nguyễn Văn F', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(96, 8, 'Hoàng Thanh I', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(97, 9, 'Phan Thanh J', 4, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(98, 9, 'Đặng Hữu H', 1, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(99, 9, 'Hoàng Minh B', 5, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(100, 9, 'Trần Kim K', 1, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(101, 9, 'Nguyễn Văn M', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(102, 10, 'Đặng Ngọc N', 4, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(103, 10, 'Hoàng Văn C', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(104, 10, 'Trần Ngọc N', 5, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(105, 10, 'Trần Thanh G', 4, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(106, 10, 'Phan Văn G', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(107, 10, 'Hoàng Hữu C', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(108, 10, 'Đặng Hoài H', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(109, 10, 'Huỳnh Thị C', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(110, 10, 'Đặng Văn M', 1, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(111, 10, 'Lê Hữu K', 2, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(112, 10, 'Huỳnh Văn N', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(113, 10, 'Phan Hữu G', 5, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(114, 10, 'Hoàng Ngọc B', 5, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(115, 10, 'Nguyễn Hữu A', 5, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(116, 10, 'Bùi Hữu B', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(117, 10, 'Phạm Thanh L', 5, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(118, 10, 'Đặng Kim N', 4, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(119, 11, 'Huỳnh Quốc H', 5, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(120, 11, 'Lê Minh M', 5, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(121, 11, 'Bùi Hoài M', 5, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(122, 11, 'Huỳnh Kim F', 2, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(123, 11, 'Vũ Thu A', 1, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(124, 12, 'Vũ Kim A', 3, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(125, 12, 'Phạm Hoài N', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(126, 12, 'Trần Quốc I', 1, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(127, 12, 'Trần Thu M', 5, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(128, 12, 'Trần Thu A', 1, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(129, 12, 'Đặng Thị L', 1, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(130, 12, 'Lê Ngọc A', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(131, 12, 'Huỳnh Thu M', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(132, 12, 'Đặng Thanh M', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(133, 13, 'Lê Thanh B', 5, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(134, 13, 'Đặng Hữu M', 4, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(135, 13, 'Huỳnh Ngọc C', 2, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(136, 13, 'Trần Hữu E', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(137, 13, 'Đặng Thị J', 3, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(138, 13, 'Nguyễn Ngọc K', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(139, 13, 'Phạm Minh D', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(140, 13, 'Phạm Quốc G', 4, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(141, 13, 'Phạm Kim A', 4, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(142, 13, 'Phạm Thu K', 3, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(143, 14, 'Lê Quốc N', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(144, 14, 'Vũ Kim G', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(145, 14, 'Đặng Minh M', 4, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(146, 14, 'Bùi Thu M', 4, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(147, 14, 'Hoàng Thu J', 4, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(148, 14, 'Đặng Ngọc A', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(149, 14, 'Trần Thanh E', 3, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(150, 14, 'Bùi Văn C', 5, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(151, 14, 'Lê Văn L', 3, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(152, 14, 'Bùi Hoài A', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(153, 15, 'Bùi Hoài I', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(154, 15, 'Bùi Thị I', 4, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(155, 15, 'Bùi Thanh L', 2, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(156, 15, 'Đặng Hữu E', 2, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(157, 15, 'Bùi Hữu J', 5, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(158, 15, 'Trần Quốc E', 2, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(159, 15, 'Lê Minh H', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(160, 16, 'Bùi Minh L', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(161, 16, 'Vũ Minh L', 4, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(162, 16, 'Nguyễn Hoài A', 5, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(163, 16, 'Huỳnh Hoài H', 1, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(164, 16, 'Nguyễn Thị A', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(165, 16, 'Phan Hữu D', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(166, 17, 'Hoàng Quốc K', 4, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(167, 17, 'Đặng Ngọc I', 2, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(168, 17, 'Vũ Quốc J', 2, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(169, 17, 'Bùi Minh J', 1, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(170, 18, 'Huỳnh Kim M', 3, 'Pin trâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(171, 18, 'Vũ Thị B', 2, 'Bàn phím êm, gõ thoải mái.', '2025-11-28 22:17:49'),
(172, 18, 'Bùi Thị K', 2, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(173, 19, 'Phạm Thanh M', 1, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(174, 19, 'Nguyễn Thu D', 3, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(175, 19, 'Vũ Thanh M', 3, 'Giá cả hợp lý so với chất lượng.', '2025-11-28 22:17:49'),
(176, 19, 'Lê Thu F', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(177, 19, 'Vũ Kim K', 1, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(178, 19, 'Vũ Thanh D', 1, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(179, 19, 'Bùi Minh M', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(180, 19, 'Hoàng Kim M', 2, 'Màn hình đẹp, màu sắc sống động.', '2025-11-28 22:17:49'),
(181, 20, 'Đặng Hữu L', 4, 'Loa nghe hay, âm thanh tốt.', '2025-11-28 22:17:49'),
(182, 20, 'Nguyễn Hoài L', 2, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(183, 20, 'Phan Quốc J', 5, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(184, 20, 'Phan Hữu H', 1, 'Máy chạy mượt, hiệu năng cao.', '2025-11-28 22:17:49'),
(185, 20, 'Trần Hữu J', 4, 'Nóng khi chạy phần mềm nặng.', '2025-11-28 22:17:49'),
(186, 20, 'Lê Hữu L', 5, 'Cập nhật phần mềm nhanh chóng.', '2025-11-28 22:17:49'),
(187, 20, 'Hoàng Hữu G', 3, 'Hơi nặng, khó mang theo.', '2025-11-28 22:17:49'),
(188, 21, 'Huỳnh Hoài N', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(189, 21, 'Huỳnh Minh F', 3, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(190, 21, 'Vũ Thanh C', 3, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(191, 22, 'Nguyễn Thu I', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(192, 22, 'Trần Văn G', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(193, 23, 'Phạm Kim C', 4, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(194, 23, 'Đặng Ngọc E', 2, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(195, 23, 'Lê Kim N', 1, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(196, 23, 'Vũ Ngọc E', 3, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(197, 23, 'Bùi Kim G', 4, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(198, 23, 'Vũ Hoài D', 2, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(199, 23, 'Bùi Minh K', 5, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(200, 23, 'Phạm Thu C', 5, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(201, 23, 'Lê Văn L', 2, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(202, 23, 'Huỳnh Hữu A', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(203, 23, 'Phạm Thị H', 3, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(204, 23, 'Đặng Văn A', 2, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(205, 23, 'Đặng Kim M', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(206, 23, 'Phạm Văn M', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(207, 23, 'Phan Thanh H', 3, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(208, 24, 'Trần Văn G', 3, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(209, 24, 'Lê Thanh K', 1, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(210, 24, 'Đặng Thu G', 1, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(211, 24, 'Phạm Thu F', 2, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(212, 24, 'Nguyễn Kim H', 5, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(213, 24, 'Huỳnh Ngọc E', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(214, 25, 'Nguyễn Hoài L', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(215, 25, 'Lê Thu I', 2, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(216, 25, 'Phạm Văn A', 5, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(217, 26, 'Trần Văn M', 1, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(218, 26, 'Huỳnh Kim B', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(219, 26, 'Nguyễn Hữu G', 1, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(220, 27, 'Hoàng Ngọc K', 4, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(221, 27, 'Huỳnh Văn G', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(222, 27, 'Lê Hoài F', 5, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(223, 27, 'Lê Thanh I', 4, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(224, 27, 'Đặng Minh G', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(225, 27, 'Nguyễn Thanh J', 4, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(226, 27, 'Phan Ngọc I', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(227, 27, 'Phan Kim A', 1, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(228, 28, 'Trần Thanh H', 4, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(229, 28, 'Đặng Thu N', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(230, 28, 'Trần Hoài B', 2, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(231, 28, 'Bùi Thu K', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(232, 28, 'Huỳnh Văn A', 3, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(233, 28, 'Phạm Thị B', 2, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(234, 28, 'Vũ Hữu M', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(235, 28, 'Trần Văn J', 5, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(236, 28, 'Huỳnh Minh G', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(237, 28, 'Hoàng Kim B', 5, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(238, 28, 'Huỳnh Quốc J', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(239, 28, 'Phạm Quốc H', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(240, 28, 'Vũ Hữu B', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(241, 28, 'Vũ Hoài I', 2, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(242, 28, 'Trần Hữu A', 5, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(243, 28, 'Phạm Quốc L', 1, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(244, 28, 'Trần Minh J', 2, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(245, 28, 'Huỳnh Văn A', 2, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(246, 28, 'Huỳnh Minh B', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(247, 28, 'Huỳnh Minh E', 2, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(248, 29, 'Huỳnh Thanh B', 3, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(249, 29, 'Phan Thu E', 1, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(250, 29, 'Đặng Hữu J', 4, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(251, 29, 'Nguyễn Thu A', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(252, 29, 'Trần Minh L', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(253, 29, 'Hoàng Hoài H', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(254, 29, 'Phạm Ngọc K', 5, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(255, 29, 'Phạm Văn L', 4, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(256, 29, 'Huỳnh Hữu C', 3, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(257, 29, 'Nguyễn Kim F', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(258, 29, 'Bùi Hữu D', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(259, 29, 'Vũ Thị M', 5, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(260, 29, 'Phạm Hoài C', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(261, 29, 'Phạm Kim I', 2, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(262, 30, 'Huỳnh Thanh I', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(263, 30, 'Phạm Thanh M', 1, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(264, 30, 'Phạm Thanh M', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(265, 30, 'Trần Văn N', 2, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(266, 30, 'Phạm Quốc L', 2, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(267, 30, 'Vũ Hữu M', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(268, 30, 'Trần Ngọc C', 2, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(269, 31, 'Trần Thị N', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(270, 31, 'Phan Thu H', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(271, 31, 'Bùi Hoài I', 1, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(272, 31, 'Phạm Quốc D', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(273, 31, 'Nguyễn Thị M', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(274, 31, 'Vũ Thu G', 4, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(275, 31, 'Phạm Thanh C', 3, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(276, 31, 'Vũ Ngọc L', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(277, 31, 'Lê Văn F', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(278, 31, 'Huỳnh Văn N', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(279, 31, 'Trần Thị N', 5, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(280, 31, 'Vũ Thị N', 3, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(281, 31, 'Phan Quốc D', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(282, 31, 'Huỳnh Hữu A', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(283, 31, 'Đặng Hoài J', 1, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(284, 31, 'Hoàng Thu I', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(285, 32, 'Vũ Hữu M', 4, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(286, 32, 'Trần Văn F', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(287, 32, 'Đặng Minh I', 3, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(288, 32, 'Trần Thị B', 2, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(289, 32, 'Huỳnh Hữu K', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(290, 32, 'Lê Hoài F', 5, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(291, 32, 'Lê Văn F', 1, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(292, 32, 'Hoàng Quốc C', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(293, 32, 'Lê Kim G', 2, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(294, 32, 'Phan Thị F', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(295, 32, 'Nguyễn Văn M', 1, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(296, 32, 'Nguyễn Thị G', 1, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(297, 32, 'Đặng Quốc C', 1, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(298, 32, 'Trần Minh G', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(299, 32, 'Nguyễn Quốc C', 1, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(300, 32, 'Phan Quốc H', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(301, 33, 'Đặng Ngọc M', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(302, 33, 'Lê Thị N', 1, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(303, 33, 'Nguyễn Thị N', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(304, 33, 'Hoàng Thanh B', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(305, 33, 'Hoàng Quốc L', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(306, 33, 'Lê Thanh I', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(307, 33, 'Phạm Kim L', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(308, 33, 'Bùi Thanh C', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(309, 33, 'Trần Thanh M', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(310, 33, 'Bùi Thanh M', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(311, 33, 'Đặng Văn D', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(312, 33, 'Phạm Ngọc M', 2, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(313, 33, 'Nguyễn Văn M', 1, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(314, 33, 'Trần Quốc M', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(315, 33, 'Phan Minh B', 5, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(316, 33, 'Hoàng Thu D', 1, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(317, 33, 'Trần Thanh C', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(318, 34, 'Đặng Văn D', 2, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(319, 34, 'Bùi Minh G', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(320, 34, 'Phạm Thu I', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(321, 34, 'Nguyễn Thị B', 5, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(322, 34, 'Trần Hữu L', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(323, 34, 'Vũ Quốc H', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(324, 34, 'Trần Kim M', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(325, 34, 'Nguyễn Ngọc C', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(326, 34, 'Phan Kim A', 5, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(327, 34, 'Vũ Ngọc F', 1, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(328, 35, 'Hoàng Kim M', 5, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(329, 35, 'Huỳnh Minh B', 4, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(330, 35, 'Bùi Quốc I', 2, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(331, 35, 'Bùi Kim J', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(332, 35, 'Phan Minh J', 2, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(333, 35, 'Huỳnh Thu I', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(334, 35, 'Bùi Thị N', 4, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(335, 35, 'Huỳnh Quốc A', 3, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(336, 35, 'Trần Quốc J', 3, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(337, 35, 'Phan Thu D', 4, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(338, 35, 'Lê Văn F', 4, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(339, 35, 'Phan Quốc N', 4, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(340, 35, 'Lê Thị G', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(341, 35, 'Nguyễn Thu I', 5, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(342, 35, 'Nguyễn Ngọc D', 2, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(343, 35, 'Trần Hữu D', 1, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(344, 35, 'Bùi Thanh A', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(345, 35, 'Hoàng Thanh D', 5, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(346, 35, 'Lê Hoài H', 4, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(347, 35, 'Đặng Thu N', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(348, 36, 'Vũ Thanh I', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(349, 36, 'Phạm Thị F', 3, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(350, 36, 'Nguyễn Văn B', 5, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(351, 36, 'Huỳnh Kim N', 5, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(352, 36, 'Lê Hữu F', 3, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(353, 36, 'Nguyễn Kim N', 4, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(354, 36, 'Trần Thị F', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(355, 36, 'Trần Kim J', 2, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(356, 36, 'Huỳnh Ngọc D', 4, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(357, 36, 'Hoàng Hữu M', 5, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(358, 36, 'Vũ Văn I', 1, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(359, 36, 'Trần Thu M', 4, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(360, 36, 'Đặng Văn J', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(361, 36, 'Huỳnh Kim F', 4, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(362, 36, 'Lê Ngọc G', 4, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(363, 36, 'Bùi Thu M', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(364, 36, 'Phạm Minh A', 1, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(365, 37, 'Trần Ngọc C', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(366, 37, 'Hoàng Hữu L', 2, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(367, 37, 'Lê Kim F', 1, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(368, 37, 'Bùi Hữu N', 2, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(369, 37, 'Nguyễn Kim D', 5, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(370, 38, 'Hoàng Kim N', 3, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(371, 38, 'Huỳnh Hoài M', 2, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(372, 38, 'Vũ Văn E', 5, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(373, 38, 'Đặng Ngọc N', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(374, 38, 'Phan Ngọc J', 2, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(375, 38, 'Huỳnh Hoài M', 3, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(376, 38, 'Vũ Minh H', 4, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(377, 38, 'Huỳnh Thu C', 3, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(378, 38, 'Bùi Minh B', 3, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(379, 38, 'Phạm Thu L', 3, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(380, 38, 'Phạm Thị M', 5, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(381, 38, 'Phan Quốc B', 3, 'Chụp ảnh đẹp, camera chất lượng.', '2025-11-28 22:17:49'),
(382, 38, 'Huỳnh Ngọc B', 5, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(383, 38, 'Đặng Quốc F', 4, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(384, 38, 'Trần Thanh K', 4, 'Màn hình sắc nét, xem phim hay.', '2025-11-28 22:17:49'),
(385, 38, 'Trần Thanh A', 2, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(386, 38, 'Lê Ngọc N', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(387, 38, 'Hoàng Thu I', 3, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(388, 38, 'Phan Hữu L', 2, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(389, 39, 'Lê Hữu I', 1, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(390, 39, 'Huỳnh Hữu B', 2, 'Kết nối mạng ổn định.', '2025-11-28 22:17:49'),
(391, 39, 'Đặng Kim I', 3, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(392, 39, 'Trần Minh L', 1, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(393, 39, 'Phan Thanh I', 1, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(394, 39, 'Vũ Thu H', 1, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(395, 39, 'Hoàng Hữu J', 3, 'Pin lâu, sạc nhanh.', '2025-11-28 22:17:49'),
(396, 40, 'Đặng Minh A', 2, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(397, 40, 'Phạm Ngọc G', 4, 'Hiệu năng mạnh, chơi game mượt.', '2025-11-28 22:17:49'),
(398, 40, 'Hoàng Thu E', 2, 'Thiết kế mỏng nhẹ, cầm vừa tay.', '2025-11-28 22:17:49'),
(399, 40, 'Vũ Hữu L', 4, 'Cập nhật hệ điều hành thường xuyên.', '2025-11-28 22:17:49'),
(400, 40, 'Nguyễn Hoài E', 5, 'Bảo mật tốt, vân tay nhanh.', '2025-11-28 22:17:49'),
(401, 40, 'Lê Văn H', 3, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(402, 40, 'Vũ Minh N', 1, 'Âm thanh tốt, loa ngoài to.', '2025-11-28 22:17:49'),
(403, 40, 'Phan Hoài N', 4, 'Giá hơi cao nhưng đáng tiền.', '2025-11-28 22:17:49'),
(404, 41, 'Lê Minh D', 2, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(405, 41, 'Bùi Thu N', 1, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(406, 41, 'Đặng Kim K', 1, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(407, 41, 'Vũ Ngọc G', 5, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(408, 41, 'Vũ Ngọc N', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(409, 41, 'Đặng Thanh H', 5, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(410, 41, 'Phạm Thanh A', 2, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(411, 41, 'Bùi Ngọc B', 2, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(412, 41, 'Phạm Kim N', 1, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(413, 41, 'Đặng Văn G', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(414, 41, 'Phạm Minh J', 4, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(415, 41, 'Hoàng Kim N', 1, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(416, 41, 'Đặng Văn E', 3, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(417, 42, 'Nguyễn Văn I', 2, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(418, 42, 'Hoàng Hoài H', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(419, 42, 'Đặng Hữu D', 2, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(420, 42, 'Trần Ngọc F', 4, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(421, 42, 'Huỳnh Thu F', 3, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(422, 42, 'Bùi Thanh N', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(423, 42, 'Phạm Hữu H', 2, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(424, 42, 'Đặng Quốc G', 3, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(425, 42, 'Phạm Thị I', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(426, 42, 'Đặng Văn G', 2, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(427, 42, 'Bùi Quốc A', 4, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(428, 42, 'Trần Thu A', 2, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(429, 42, 'Trần Quốc K', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(430, 42, 'Nguyễn Hữu F', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(431, 43, 'Lê Ngọc E', 2, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(432, 43, 'Trần Quốc B', 5, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(433, 43, 'Nguyễn Kim E', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(434, 43, 'Phan Thanh F', 5, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(435, 43, 'Huỳnh Minh H', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(436, 43, 'Đặng Quốc N', 2, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(437, 43, 'Nguyễn Văn B', 4, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(438, 43, 'Huỳnh Kim D', 4, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(439, 43, 'Lê Quốc F', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(440, 43, 'Nguyễn Văn I', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(441, 43, 'Hoàng Hữu N', 3, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(442, 43, 'Vũ Thanh G', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(443, 43, 'Lê Ngọc E', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(444, 43, 'Bùi Minh J', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(445, 44, 'Hoàng Thanh H', 3, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(446, 44, 'Trần Văn E', 2, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(447, 44, 'Phan Thu K', 5, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(448, 44, 'Phan Quốc H', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(449, 44, 'Đặng Ngọc C', 3, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(450, 44, 'Hoàng Hữu F', 4, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(451, 44, 'Nguyễn Kim J', 1, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(452, 44, 'Hoàng Ngọc A', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(453, 44, 'Đặng Hữu M', 2, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(454, 44, 'Phan Hoài N', 1, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(455, 45, 'Trần Hoài A', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(456, 45, 'Vũ Thanh M', 1, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(457, 45, 'Phạm Thu M', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(458, 45, 'Huỳnh Thu M', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(459, 46, 'Hoàng Thu G', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(460, 46, 'Hoàng Thị B', 2, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(461, 46, 'Huỳnh Ngọc K', 1, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(462, 46, 'Phan Thu A', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(463, 46, 'Đặng Văn F', 1, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(464, 46, 'Bùi Kim D', 5, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(465, 46, 'Phạm Ngọc J', 5, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(466, 46, 'Lê Kim H', 2, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(467, 46, 'Hoàng Quốc C', 2, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(468, 46, 'Trần Thị A', 1, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(469, 46, 'Đặng Ngọc B', 4, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(470, 47, 'Phạm Thanh G', 2, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(471, 47, 'Huỳnh Hữu B', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(472, 47, 'Phan Thanh K', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(473, 47, 'Phan Hoài D', 5, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(474, 47, 'Đặng Văn E', 5, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(475, 47, 'Lê Quốc D', 5, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(476, 47, 'Huỳnh Minh N', 1, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(477, 47, 'Lê Minh F', 3, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(478, 47, 'Phạm Hữu I', 3, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(479, 47, 'Đặng Hữu K', 3, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(480, 48, 'Huỳnh Minh N', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(481, 48, 'Trần Thu H', 3, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(482, 48, 'Nguyễn Thanh G', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(483, 48, 'Nguyễn Kim K', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(484, 48, 'Nguyễn Minh F', 1, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(485, 48, 'Bùi Thị C', 2, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(486, 48, 'Hoàng Hữu E', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(487, 48, 'Đặng Hoài D', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(488, 48, 'Lê Hoài B', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(489, 48, 'Huỳnh Hoài K', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(490, 48, 'Huỳnh Quốc A', 2, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(491, 48, 'Phạm Thanh M', 5, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(492, 48, 'Lê Thu H', 3, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(493, 48, 'Đặng Minh D', 2, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(494, 48, 'Hoàng Thanh H', 3, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(495, 48, 'Phan Thu J', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(496, 48, 'Huỳnh Minh A', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(497, 48, 'Phạm Văn A', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(498, 48, 'Huỳnh Ngọc L', 4, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(499, 49, 'Phạm Thu G', 3, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(500, 49, 'Đặng Hữu B', 5, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(501, 49, 'Phan Ngọc I', 4, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(502, 49, 'Phạm Thu G', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(503, 49, 'Nguyễn Kim B', 4, 'Kết nối bluetooth ổn định.', '2025-11-28 22:17:49'),
(504, 49, 'Đặng Hữu A', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(505, 49, 'Phạm Ngọc E', 1, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(506, 49, 'Huỳnh Văn G', 4, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(507, 49, 'Lê Ngọc I', 4, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(508, 49, 'Trần Văn C', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(509, 49, 'Bùi Hữu M', 3, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(510, 49, 'Bùi Kim I', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(511, 49, 'Nguyễn Thanh B', 5, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(512, 49, 'Phạm Thanh D', 1, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(513, 49, 'Vũ Quốc H', 2, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(514, 49, 'Bùi Thị A', 3, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(515, 50, 'Đặng Thị I', 4, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(516, 50, 'Hoàng Ngọc L', 1, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(517, 50, 'Trần Hoài F', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(518, 50, 'Vũ Hoài M', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(519, 50, 'Phạm Thị H', 4, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(520, 50, 'Vũ Văn I', 3, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(521, 50, 'Nguyễn Hữu D', 2, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(522, 50, 'Bùi Thanh C', 3, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(523, 50, 'Lê Quốc B', 4, 'Khử noise tốt, nghe ở nơi ồn ào.', '2025-11-28 22:17:49'),
(524, 50, 'Bùi Ngọc J', 5, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(525, 50, 'Vũ Minh M', 3, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(526, 50, 'Lê Văn B', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(527, 50, 'Phan Ngọc D', 4, 'Có nhiều chế độ âm thanh.', '2025-11-28 22:17:49'),
(528, 50, 'Phan Văn E', 3, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(529, 50, 'Vũ Kim B', 5, 'Thiết kế thoải mái, đeo lâu không đau.', '2025-11-28 22:17:49'),
(530, 50, 'Hoàng Ngọc K', 1, 'Âm thanh chất lượng cao, bass mạnh.', '2025-11-28 22:17:49'),
(531, 50, 'Hoàng Văn A', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(532, 50, 'Nguyễn Kim F', 2, 'Pin lâu, dùng cả ngày.', '2025-11-28 22:17:49'),
(533, 50, 'Bùi Hoài E', 1, 'Chất lượng build tốt, bền.', '2025-11-28 22:17:49'),
(534, 50, 'Bùi Minh B', 1, 'Mic rõ, gọi điện tốt.', '2025-11-28 22:17:49'),
(535, 51, 'Hoàng Thu I', 1, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(536, 51, 'Trần Ngọc A', 4, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(537, 51, 'Hoàng Văn G', 5, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(538, 51, 'Trần Thanh B', 5, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(539, 51, 'Hoàng Văn I', 5, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(540, 51, 'Vũ Thu G', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(541, 51, 'Lê Thị B', 3, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(542, 51, 'Huỳnh Thị D', 1, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(543, 51, 'Bùi Thu F', 4, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(544, 51, 'Phan Quốc E', 2, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(545, 51, 'Lê Hữu K', 3, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(546, 51, 'Lê Hữu N', 2, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(547, 51, 'Vũ Quốc F', 3, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(548, 51, 'Phạm Thanh H', 1, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(549, 51, 'Đặng Văn M', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(550, 51, 'Vũ Kim L', 3, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(551, 51, 'Lê Văn C', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(552, 51, 'Huỳnh Hữu B', 3, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(553, 51, 'Đặng Ngọc M', 2, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(554, 52, 'Bùi Hoài A', 3, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(555, 52, 'Trần Minh B', 2, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(556, 52, 'Phan Thu L', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(557, 52, 'Nguyễn Minh D', 1, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(558, 52, 'Nguyễn Hữu F', 1, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(559, 52, 'Đặng Hoài J', 5, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(560, 52, 'Bùi Thanh B', 4, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(561, 52, 'Phạm Thanh E', 3, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(562, 52, 'Lê Kim N', 5, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(563, 52, 'Nguyễn Thị I', 1, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(564, 52, 'Đặng Quốc D', 3, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(565, 52, 'Huỳnh Ngọc A', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(566, 52, 'Phạm Thị L', 4, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(567, 52, 'Huỳnh Thanh I', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(568, 52, 'Vũ Hoài J', 3, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(569, 52, 'Phan Hoài A', 5, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(570, 52, 'Phạm Văn D', 2, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(571, 52, 'Lê Kim I', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(572, 53, 'Hoàng Hữu F', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(573, 53, 'Huỳnh Thanh L', 5, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(574, 53, 'Hoàng Thanh G', 1, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(575, 53, 'Phạm Hữu J', 4, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(576, 53, 'Đặng Văn M', 2, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(577, 53, 'Vũ Hoài J', 3, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(578, 53, 'Phạm Ngọc M', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(579, 53, 'Đặng Minh N', 3, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(580, 53, 'Vũ Quốc G', 4, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(581, 53, 'Trần Thị N', 2, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(582, 53, 'Đặng Kim M', 3, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(583, 53, 'Đặng Hoài M', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(584, 53, 'Bùi Thanh B', 1, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(585, 53, 'Nguyễn Thu J', 1, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(586, 53, 'Nguyễn Hoài J', 3, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(587, 54, 'Đặng Thị A', 4, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(588, 54, 'Huỳnh Minh M', 5, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(589, 54, 'Huỳnh Minh E', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(590, 54, 'Trần Văn N', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(591, 54, 'Đặng Thanh N', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(592, 55, 'Huỳnh Thị N', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(593, 55, 'Huỳnh Ngọc A', 2, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(594, 55, 'Lê Quốc E', 3, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(595, 55, 'Phạm Minh C', 4, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(596, 55, 'Phạm Thanh J', 1, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(597, 55, 'Đặng Kim F', 4, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(598, 55, 'Nguyễn Minh N', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(599, 55, 'Hoàng Kim H', 5, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(600, 55, 'Huỳnh Thanh I', 1, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(601, 55, 'Nguyễn Thanh I', 3, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(602, 56, 'Bùi Thị I', 5, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(603, 56, 'Trần Ngọc C', 1, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(604, 56, 'Bùi Thị L', 2, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(605, 56, 'Phan Ngọc B', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(606, 56, 'Đặng Quốc C', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(607, 56, 'Vũ Văn I', 2, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(608, 56, 'Phan Minh J', 4, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(609, 56, 'Lê Thanh E', 5, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(610, 56, 'Lê Thanh D', 4, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(611, 56, 'Trần Hoài A', 3, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(612, 56, 'Lê Thị J', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(613, 56, 'Đặng Hoài N', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(614, 56, 'Phạm Quốc I', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(615, 56, 'Huỳnh Văn C', 5, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(616, 56, 'Phạm Văn L', 1, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(617, 57, 'Lê Thu K', 3, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(618, 57, 'Vũ Kim B', 2, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(619, 57, 'Vũ Thu E', 3, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(620, 57, 'Huỳnh Ngọc L', 1, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(621, 57, 'Hoàng Minh L', 1, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(622, 57, 'Phan Thanh K', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(623, 58, 'Vũ Văn B', 3, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(624, 58, 'Bùi Minh F', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49');
INSERT INTO `reviews` (`id`, `product_id`, `user_name`, `rating`, `comment`, `created_at`) VALUES
(625, 58, 'Bùi Thanh D', 5, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(626, 58, 'Nguyễn Minh J', 5, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(627, 58, 'Lê Hoài B', 4, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(628, 58, 'Phan Ngọc M', 5, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(629, 58, 'Vũ Thanh N', 5, 'Màn hình sáng, dễ đọc.', '2025-11-28 22:17:49'),
(630, 58, 'Vũ Thị M', 1, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(631, 58, 'Đặng Ngọc E', 2, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(632, 58, 'Vũ Thị F', 3, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(633, 58, 'Đặng Ngọc J', 3, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(634, 58, 'Trần Văn L', 5, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(635, 58, 'Lê Ngọc I', 5, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(636, 58, 'Phạm Ngọc A', 5, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(637, 58, 'Nguyễn Hữu N', 4, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(638, 58, 'Trần Thu F', 2, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(639, 58, 'Phạm Thị F', 2, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(640, 58, 'Phạm Hoài J', 5, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(641, 58, 'Huỳnh Kim K', 3, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(642, 58, 'Phan Thanh K', 1, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(643, 59, 'Trần Thanh N', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(644, 59, 'Lê Hữu N', 2, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(645, 59, 'Lê Hoài J', 3, 'Kết nối với điện thoại mượt.', '2025-11-28 22:17:49'),
(646, 59, 'Bùi Minh I', 1, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(647, 59, 'Đặng Thị N', 4, 'Nhiều mặt đồng hồ tùy chỉnh.', '2025-11-28 22:17:49'),
(648, 59, 'Bùi Quốc K', 5, 'Pin lâu, dùng vài ngày.', '2025-11-28 22:17:49'),
(649, 59, 'Trần Quốc G', 1, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(650, 59, 'Phan Kim D', 3, 'Thiết kế đẹp, sang trọng.', '2025-11-28 22:17:49'),
(651, 59, 'Vũ Ngọc K', 3, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(652, 60, 'Đặng Kim F', 1, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(653, 60, 'Huỳnh Kim J', 2, 'Nhẹ, đeo thoải mái.', '2025-11-28 22:17:49'),
(654, 60, 'Vũ Kim M', 4, 'Cập nhật phần mềm thường xuyên.', '2025-11-28 22:17:49'),
(655, 60, 'Hoàng Thu J', 2, 'Giá phải chăng.', '2025-11-28 22:17:49'),
(656, 60, 'Nguyễn Thanh C', 5, 'Theo dõi sức khỏe chính xác.', '2025-11-28 22:17:49'),
(657, 60, 'Hoàng Hữu C', 2, 'Chống nước tốt.', '2025-11-28 22:17:49'),
(658, 61, 'Huỳnh Quốc M', 3, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(659, 61, 'Bùi Thu C', 1, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(660, 61, 'Đặng Ngọc B', 2, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(661, 61, 'Phạm Kim H', 3, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(662, 61, 'Đặng Ngọc K', 2, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(663, 62, 'Phạm Minh I', 5, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(664, 62, 'Nguyễn Thanh N', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(665, 62, 'Vũ Kim N', 4, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(666, 62, 'Nguyễn Thu F', 1, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(667, 62, 'Hoàng Văn A', 1, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(668, 62, 'Huỳnh Thị E', 5, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(669, 62, 'Huỳnh Thị H', 5, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(670, 62, 'Phan Minh I', 3, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(671, 62, 'Phạm Văn H', 4, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(672, 63, 'Huỳnh Thu A', 2, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(673, 63, 'Vũ Quốc G', 1, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(674, 63, 'Trần Ngọc N', 5, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(675, 63, 'Bùi Thu G', 4, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(676, 63, 'Vũ Kim F', 5, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(677, 63, 'Trần Hoài D', 4, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(678, 63, 'Phan Kim J', 3, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(679, 63, 'Đặng Hữu J', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(680, 63, 'Trần Minh I', 3, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(681, 63, 'Lê Thanh N', 5, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(682, 64, 'Đặng Thu E', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(683, 64, 'Phan Ngọc G', 4, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(684, 64, 'Huỳnh Ngọc G', 1, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(685, 65, 'Nguyễn Văn B', 4, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(686, 65, 'Nguyễn Thu F', 2, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(687, 65, 'Vũ Hữu G', 3, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(688, 65, 'Nguyễn Kim E', 4, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(689, 65, 'Vũ Hữu H', 5, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(690, 65, 'Đặng Hoài F', 1, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(691, 65, 'Phan Ngọc N', 4, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(692, 65, 'Vũ Thanh A', 4, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(693, 65, 'Huỳnh Văn I', 4, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(694, 65, 'Đặng Thanh N', 2, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(695, 65, 'Bùi Hoài C', 5, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(696, 65, 'Lê Hữu D', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(697, 65, 'Bùi Hữu D', 3, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(698, 66, 'Huỳnh Thanh E', 1, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(699, 66, 'Vũ Minh C', 1, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(700, 66, 'Huỳnh Quốc N', 5, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(701, 66, 'Bùi Minh G', 2, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(702, 66, 'Phạm Thanh F', 1, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(703, 66, 'Trần Quốc C', 1, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(704, 66, 'Trần Thu M', 5, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(705, 66, 'Phạm Kim J', 2, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(706, 66, 'Bùi Quốc K', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(707, 66, 'Nguyễn Minh K', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(708, 66, 'Phạm Thanh A', 2, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(709, 66, 'Phan Hữu H', 1, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(710, 66, 'Nguyễn Ngọc A', 1, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(711, 66, 'Nguyễn Minh H', 4, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(712, 66, 'Vũ Văn C', 2, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(713, 66, 'Hoàng Văn H', 5, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(714, 66, 'Hoàng Văn N', 3, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(715, 67, 'Vũ Hoài N', 1, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(716, 67, 'Vũ Thanh F', 3, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(717, 67, 'Huỳnh Hoài B', 3, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(718, 67, 'Lê Văn J', 1, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(719, 67, 'Nguyễn Quốc L', 3, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(720, 67, 'Lê Minh F', 3, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(721, 67, 'Nguyễn Ngọc K', 5, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(722, 67, 'Phạm Hữu D', 1, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(723, 67, 'Phan Hoài E', 2, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(724, 67, 'Trần Hoài A', 3, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(725, 67, 'Bùi Quốc I', 4, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(726, 67, 'Đặng Thị I', 1, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(727, 68, 'Lê Minh B', 3, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(728, 68, 'Lê Minh N', 5, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(729, 68, 'Lê Hoài J', 1, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(730, 68, 'Hoàng Kim A', 1, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(731, 68, 'Lê Quốc C', 3, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(732, 68, 'Huỳnh Minh M', 4, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(733, 68, 'Phan Hữu D', 5, 'Hiệu năng tốt, đa nhiệm mượt.', '2025-11-28 22:17:49'),
(734, 68, 'Phan Hoài D', 5, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(735, 68, 'Đặng Ngọc I', 1, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(736, 69, 'Phan Kim C', 4, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(737, 69, 'Vũ Hoài C', 3, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(738, 69, 'Nguyễn Văn H', 2, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(739, 69, 'Bùi Kim M', 2, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(740, 69, 'Huỳnh Quốc K', 5, 'Pin trâu, dùng lâu.', '2025-11-28 22:17:49'),
(741, 69, 'Lê Ngọc A', 2, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(742, 69, 'Huỳnh Thanh K', 2, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(743, 69, 'Phạm Kim A', 2, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(744, 69, 'Huỳnh Hữu A', 4, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(745, 69, 'Nguyễn Hữu J', 1, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(746, 69, 'Lê Hữu A', 1, 'Cập nhật hệ điều hành.', '2025-11-28 22:17:49'),
(747, 69, 'Lê Thanh C', 4, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(748, 69, 'Lê Quốc E', 3, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(749, 69, 'Phạm Kim A', 4, 'Màn hình lớn, xem phim hay.', '2025-11-28 22:17:49'),
(750, 70, 'Nguyễn Hoài H', 5, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(751, 70, 'Nguyễn Thanh E', 1, 'Giá hợp lý.', '2025-11-28 22:17:49'),
(752, 70, 'Vũ Kim G', 4, 'Bút stylus chính xác.', '2025-11-28 22:17:49'),
(753, 70, 'Nguyễn Quốc G', 1, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(754, 70, 'Phan Ngọc C', 2, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(755, 70, 'Vũ Hữu D', 2, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(756, 70, 'Nguyễn Hữu M', 2, 'Loa nghe tốt.', '2025-11-28 22:17:49'),
(757, 70, 'Nguyễn Ngọc H', 3, 'Nhẹ, dễ cầm.', '2025-11-28 22:17:49'),
(758, 70, 'Nguyễn Kim C', 2, 'Kết nối phụ kiện dễ dàng.', '2025-11-28 22:17:49'),
(759, 70, 'Huỳnh Thanh D', 4, 'Thiết kế mỏng.', '2025-11-28 22:17:49'),
(760, 71, 'Trần Văn M', 5, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(761, 71, 'Trần Văn E', 5, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(762, 71, 'Nguyễn Thanh H', 3, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(763, 71, 'Huỳnh Minh E', 2, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(764, 71, 'Bùi Hoài L', 4, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(765, 71, 'Vũ Hoài G', 5, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(766, 71, 'Lê Minh H', 2, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(767, 71, 'Vũ Kim H', 4, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(768, 71, 'Bùi Thu H', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(769, 71, 'Hoàng Hoài B', 3, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(770, 71, 'Hoàng Thị N', 2, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(771, 71, 'Huỳnh Ngọc I', 4, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(772, 71, 'Nguyễn Hữu E', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(773, 71, 'Huỳnh Kim E', 5, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(774, 71, 'Nguyễn Thanh J', 3, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(775, 71, 'Đặng Ngọc C', 2, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(776, 71, 'Huỳnh Kim A', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(777, 72, 'Hoàng Văn L', 1, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(778, 72, 'Phan Hữu K', 1, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(779, 72, 'Hoàng Thu M', 5, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(780, 72, 'Đặng Kim G', 4, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(781, 72, 'Bùi Thanh I', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(782, 72, 'Bùi Thị M', 4, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(783, 72, 'Huỳnh Văn G', 5, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(784, 72, 'Trần Hoài I', 3, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(785, 72, 'Phan Hoài B', 3, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(786, 72, 'Bùi Hoài H', 4, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(787, 72, 'Hoàng Ngọc A', 5, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(788, 72, 'Trần Thị F', 4, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(789, 73, 'Huỳnh Ngọc K', 1, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(790, 73, 'Trần Hoài I', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(791, 73, 'Hoàng Thị M', 5, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(792, 73, 'Phan Minh K', 2, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(793, 73, 'Đặng Minh H', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(794, 73, 'Trần Kim N', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(795, 73, 'Phan Hoài H', 3, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(796, 73, 'Đặng Kim H', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(797, 73, 'Bùi Hoài D', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(798, 73, 'Nguyễn Hoài I', 4, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(799, 73, 'Trần Thị A', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(800, 73, 'Đặng Văn D', 5, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(801, 73, 'Trần Hữu M', 3, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(802, 73, 'Bùi Hoài B', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(803, 74, 'Nguyễn Hoài K', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(804, 74, 'Nguyễn Kim N', 2, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(805, 74, 'Lê Ngọc G', 2, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(806, 74, 'Phan Hữu C', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(807, 74, 'Nguyễn Hoài N', 3, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(808, 74, 'Đặng Quốc F', 3, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(809, 74, 'Bùi Thanh M', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(810, 74, 'Huỳnh Thị K', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(811, 74, 'Nguyễn Hữu I', 1, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(812, 74, 'Huỳnh Kim D', 4, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(813, 74, 'Bùi Thị H', 4, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(814, 74, 'Nguyễn Ngọc D', 4, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(815, 74, 'Bùi Thanh D', 3, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(816, 74, 'Trần Thu K', 1, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(817, 74, 'Vũ Minh M', 3, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(818, 75, 'Phạm Hoài E', 3, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(819, 75, 'Bùi Thu C', 2, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(820, 75, 'Phan Thanh C', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(821, 75, 'Nguyễn Minh K', 3, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(822, 75, 'Phạm Hoài C', 1, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(823, 75, 'Phạm Hoài L', 2, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(824, 75, 'Huỳnh Thanh B', 3, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(825, 75, 'Huỳnh Thị D', 2, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(826, 75, 'Phạm Minh I', 2, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(827, 75, 'Phan Ngọc D', 1, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(828, 75, 'Vũ Minh K', 4, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(829, 76, 'Trần Kim B', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(830, 76, 'Lê Minh A', 4, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(831, 76, 'Vũ Văn I', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(832, 76, 'Nguyễn Thị I', 5, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(833, 76, 'Nguyễn Kim I', 3, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(834, 76, 'Lê Hoài E', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(835, 76, 'Nguyễn Thanh L', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(836, 76, 'Nguyễn Hoài N', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(837, 76, 'Huỳnh Quốc M', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(838, 76, 'Đặng Minh C', 2, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(839, 76, 'Phan Hoài A', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(840, 77, 'Phan Quốc I', 4, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(841, 77, 'Đặng Hữu L', 1, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(842, 77, 'Nguyễn Minh A', 4, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(843, 77, 'Phan Hoài I', 3, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(844, 77, 'Phan Minh G', 1, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(845, 77, 'Trần Hoài D', 4, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(846, 77, 'Nguyễn Thị F', 2, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(847, 77, 'Nguyễn Thanh G', 4, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(848, 77, 'Trần Minh A', 4, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(849, 77, 'Hoàng Hữu B', 4, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(850, 77, 'Vũ Ngọc L', 1, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(851, 77, 'Đặng Hoài B', 4, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(852, 77, 'Trần Minh B', 2, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(853, 77, 'Nguyễn Hoài B', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(854, 78, 'Phạm Kim L', 4, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(855, 78, 'Lê Minh N', 5, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(856, 78, 'Nguyễn Hữu E', 3, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(857, 78, 'Đặng Văn B', 5, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(858, 78, 'Trần Văn D', 2, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(859, 78, 'Phạm Hoài F', 5, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(860, 78, 'Đặng Văn K', 4, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(861, 78, 'Phạm Hữu G', 2, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(862, 78, 'Phạm Văn B', 2, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(863, 78, 'Lê Thu F', 2, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(864, 78, 'Huỳnh Hữu H', 4, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(865, 78, 'Bùi Thu H', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(866, 79, 'Vũ Văn B', 3, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(867, 79, 'Phan Thu N', 2, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(868, 79, 'Nguyễn Thu A', 4, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(869, 79, 'Đặng Minh D', 1, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(870, 79, 'Trần Hoài L', 3, 'Chụp ảnh nét, chất lượng cao.', '2025-11-28 22:17:49'),
(871, 79, 'Vũ Quốc G', 4, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(872, 79, 'Lê Quốc H', 5, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(873, 80, 'Hoàng Thị H', 5, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(874, 80, 'Vũ Văn K', 4, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(875, 80, 'Phạm Minh B', 4, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(876, 80, 'Phạm Thanh H', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(877, 80, 'Đặng Ngọc L', 1, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(878, 80, 'Lê Minh I', 1, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(879, 80, 'Nguyễn Thu F', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(880, 81, 'Trần Hữu M', 4, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(881, 81, 'Bùi Minh N', 2, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(882, 81, 'Phạm Ngọc M', 3, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(883, 81, 'Đặng Thanh J', 1, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(884, 81, 'Huỳnh Minh H', 1, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(885, 81, 'Phan Thị H', 5, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(886, 81, 'Hoàng Quốc B', 3, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(887, 81, 'Trần Hữu J', 4, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(888, 81, 'Vũ Quốc A', 2, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(889, 81, 'Vũ Kim C', 5, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(890, 82, 'Lê Hữu G', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(891, 82, 'Trần Thanh D', 2, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(892, 82, 'Bùi Thị K', 1, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(893, 82, 'Phan Kim N', 1, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(894, 82, 'Vũ Thu I', 3, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(895, 82, 'Trần Kim A', 3, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(896, 82, 'Huỳnh Quốc H', 1, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(897, 82, 'Phạm Minh I', 4, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(898, 82, 'Huỳnh Thanh C', 4, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(899, 83, 'Trần Hữu D', 3, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(900, 83, 'Vũ Văn D', 2, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(901, 83, 'Hoàng Minh L', 1, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(902, 83, 'Bùi Kim C', 3, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(903, 83, 'Hoàng Hoài A', 1, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(904, 83, 'Lê Thị C', 4, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(905, 83, 'Huỳnh Thị I', 3, 'Màn hình xem lại đẹp.', '2025-11-28 22:17:49'),
(906, 83, 'Huỳnh Văn D', 4, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(907, 83, 'Huỳnh Quốc H', 2, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(908, 83, 'Đặng Văn N', 3, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(909, 83, 'Phan Thanh F', 1, 'Nhiều chế độ chụp.', '2025-11-28 22:17:49'),
(910, 84, 'Trần Thanh C', 1, 'Giá đáng tiền.', '2025-11-28 22:17:49'),
(911, 84, 'Lê Kim H', 4, 'Zoom tốt, chụp xa rõ.', '2025-11-28 22:17:49'),
(912, 84, 'Hoàng Ngọc D', 5, 'Kết nối wifi nhanh.', '2025-11-28 22:17:49'),
(913, 84, 'Lê Văn C', 3, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(914, 84, 'Nguyễn Văn A', 5, 'Chống rung tốt.', '2025-11-28 22:17:49'),
(915, 84, 'Hoàng Văn L', 2, 'Bền bỉ, chống chịu tốt.', '2025-11-28 22:17:49'),
(916, 84, 'Phan Quốc H', 1, 'Pin lâu, chụp nhiều ảnh.', '2025-11-28 22:17:49'),
(917, 84, 'Nguyễn Thanh N', 1, 'Nhẹ, dễ mang theo.', '2025-11-28 22:17:49'),
(918, 2, 'a', 5, 'a', '2025-11-28 22:55:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` enum('admin','member') DEFAULT 'member',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@techstore.com', '123456', NULL, NULL, 'admin', '2025-11-28 22:17:48'),
(2, 'Nguyễn Văn A', 'user@gmail.com', '123456', NULL, NULL, 'member', '2025-11-28 22:17:48'),
(3, 'ton viet tri', 'tonviettri2004@gmail.com', '$2y$10$FBKeth5i3BAnY.F5z.GNz.1LgI9nzeeSevzJBTfHFpVKN5RnZg0a2', '0814988798', 'abc', 'member', '2025-11-28 22:41:07');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=919;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
