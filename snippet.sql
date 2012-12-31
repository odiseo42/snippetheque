-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 31, 2012 at 05:32 PM
-- Server version: 5.5.28
-- PHP Version: 5.3.10-1ubuntu3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `snippet`
--

-- --------------------------------------------------------

--
-- Table structure for table `snippets`
--

CREATE TABLE IF NOT EXISTS `snippets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `snippets`
--

INSERT INTO `snippets` (`id`, `user_id`, `content`, `timestamp`) VALUES
(1, 1, 'foreach ($db->application() as $application) { // get all applications\r\n	echo "$application[title]\\n"; // print application title\r\n}', '2012-12-31 18:33:59'),
(2, 1, '$application = $db->application[1]; // get by primary key\r\n$application = $db->application("title = ?", "Adminer")->fetch();', '2012-12-31 18:33:59'),
(3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at convallis urna. Donec justo est, faucibus eu pellentesque quis, lobortis at augue. Vestibulum neque lacus, posuere vel porta eu, porta sed diam. Suspendisse ligula nisl, fringilla sed mattis ac, tincidunt sed urna. Aliquam nec felis eros, vulputate faucibus felis. Mauris tempus, magna eget egestas tristique, ipsum dolor convallis lacus, non eleifend est felis vitae elit. Sed ut mollis dui. Nullam sit amet arcu enim. Vivamus aliquet consequat volutpat. Suspendisse potenti.\r\n', '2012-12-31 18:34:28'),
(4, 1, 'Suspendisse vel tellus id justo tempus posuere sit amet et libero. Donec sollicitudin consequat nunc, eget convallis massa cursus at. Vivamus tortor lorem, pellentesque at ultricies sed, vulputate vitae elit. Integer molestie tincidunt augue a auctor. Vivamus velit dui, lacinia porttitor pulvinar ut, pulvinar et dolor. Praesent adipiscing lorem id sem suscipit ut iaculis tortor convallis. In facilisis, tortor eu luctus ullamcorper, felis nisi auctor neque, a ullamcorper nunc neque sed neque. Nunc accumsan augue quis dolor laoreet et egestas metus dapibus. Pellentesque lobortis lectus nec ante dapibus venenatis. Donec sed massa nibh. Suspendisse potenti. Nunc dictum, leo vel laoreet venenatis, sem lectus consequat augue, ut hendrerit purus leo ut ligula. Nullam vestibulum dolor aliquam nisi ornare vestibulum. Quisque pellentesque justo ac ligula laoreet luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n', '2012-12-31 18:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`) VALUES
(1, 'wapper'),
(2, 'negas');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
