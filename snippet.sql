-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 02, 2013 at 12:10 AM
-- Server version: 5.5.25
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `snippet`
--

-- --------------------------------------------------------

--
-- Table structure for table `snippets`
--

CREATE TABLE `snippets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `content` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `snippets`
--

INSERT INTO `snippets` (`id`, `user_id`, `content`, `timestamp`) VALUES
(1, 1, 'foreach ($db->application() as $application) { // get all applications\r\n	echo "$application[title]\\n"; // print application title\r\n}', '2012-12-31 18:33:59'),
(2, 1, '$application = $db->application[1]; // get by primary key\r\n$application = $db->application("title = ?", "Adminer")->fetch();', '2012-12-31 18:33:59'),
(3, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at convallis urna. Donec justo est, faucibus eu pellentesque quis, lobortis at augue. Vestibulum neque lacus, posuere vel porta eu, porta sed diam. Suspendisse ligula nisl, fringilla sed mattis ac, tincidunt sed urna. Aliquam nec felis eros, vulputate faucibus felis. Mauris tempus, magna eget egestas tristique, ipsum dolor convallis lacus, non eleifend est felis vitae elit. Sed ut mollis dui. Nullam sit amet arcu enim. Vivamus aliquet consequat volutpat. Suspendisse potenti.\r\n', '2012-12-31 18:34:28'),
(4, 1, 'Suspendisse vel tellus id justo tempus posuere sit amet et libero. Donec sollicitudin consequat nunc, eget convallis massa cursus at. Vivamus tortor lorem, pellentesque at ultricies sed, vulputate vitae elit. Integer molestie tincidunt augue a auctor. Vivamus velit dui, lacinia porttitor pulvinar ut, pulvinar et dolor. Praesent adipiscing lorem id sem suscipit ut iaculis tortor convallis. In facilisis, tortor eu luctus ullamcorper, felis nisi auctor neque, a ullamcorper nunc neque sed neque. Nunc accumsan augue quis dolor laoreet et egestas metus dapibus. Pellentesque lobortis lectus nec ante dapibus venenatis. Donec sed massa nibh. Suspendisse potenti. Nunc dictum, leo vel laoreet venenatis, sem lectus consequat augue, ut hendrerit purus leo ut ligula. Nullam vestibulum dolor aliquam nisi ornare vestibulum. Quisque pellentesque justo ac ligula laoreet luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;\r\n', '2012-12-31 18:34:28'),
(5, 1, 'h2 {\r\n  height: 40px;             /* Specifying the height and line-height prevents */\r\n  line-height: 40px;        /* extra space from being added to the bottom.    */\r\n  text-align: justify;\r\n  text-align-last: justify; /* Internet Explorer 6+ */\r\n}\r\n\r\nh2:after {                  /* All other browsers */\r\n  content: ".";\r\n  display: inline-block;\r\n  width: 100%;\r\n  height: 0;\r\n  visibility: hidden;\r\n}', '2013-01-01 18:51:24'),
(6, 1, '.center {\r\n	display: block;\r\n	margin-left: auto;\r\n	margin-right: auto;\r\n}', '2013-01-01 18:51:24'),
(7, 1, '<html>\r\n<body>\r\n\r\nThis document is displayed in:\r\n<script>\r\ndocument.write(document.documentMode);\r\n</script>\r\n\r\n</body>\r\n</html>', '2013-01-01 18:52:18'),
(8, 1, 'The full URL of this document is: \r\n<script>\r\ndocument.write(document.URL);\r\n</script>\r\n', '2013-01-01 18:52:18'),
(9, 1, 'Document - A resource representation.\r\nCollection - A collection of server-managed data.\r\nStore - A collection of client-managed data.\r\nController - An action to perform.', '2013-01-01 18:52:26'),
(10, 1, '<script>\r\n\r\nvar x=document.getElementsByName("x");\r\nalert(x.length);\r\n\r\n</script>', '2013-01-01 18:52:26'),
(11, 1, '<style>\r\n.boxGrn {\r\n    display:inline;\r\n    float:left;\r\n    -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box;\r\n    width:174px; height:38px;\r\n    border-top:1px solid #666;\r\n    background: -o-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -moz-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -webkit-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -ms-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -webkit-gradient(linear, left top, left bottom, from(#87C031), to(#618A13));\r\n    background: linear-gradient(top, #87C031 0%, #618A13 100%);\r\n}\r\na.buttonGrn:link, a.buttonGrn:visited  {\r\n    text-transform:uppercase;\r\n    display:inline;\r\n    float:left;\r\n    -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box;\r\n    width:160px; height:26px;\r\n    margin:5px 6px;\r\n    font-weight:bold;\r\n    font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#fff; line-height:27px; font-weight:bold; text-decoration:none;\r\n    padding-left:26px;\r\n    background: -o-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -moz-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -webkit-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -ms-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -webkit-gradient(linear, left top, left bottom, from(rgba(0,0,0,0)), to(rgba(0,0,0,0)), color-stop(.5,rgba(0,0,0,0)), color-stop(.5,rgba(0,0,0,.2)));\r\n    background: linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background-position:0px 0px;\r\n    background-repeat:no-repeat;\r\n    background-color:rgba(156,209,78,.6);\r\n    -webkit-border-radius:4px; border-radius:4px;\r\n    -webkit-box-shadow:0px 1px 5px rgba(0,0,0,0.8); box-shadow:0px 1px 5px rgba(0,0,0,0.8);\r\n    -o-transition:all 0.4s ease; -moz-transition:all 0.4s ease; -webkit-transition:all 0.4s ease; transition:all 0.4s ease; \r\n}\r\na.buttonGrn:hover, a.buttonGrn:focus {\r\n    color:#333;\r\n    background-color:rgba(255,255,255,1);\r\n    -webkit-box-shadow:0px 1px 6px rgba(0,0,0,1); box-shadow:0px 1px 6px rgba(0,0,0,1);\r\n}\r\n</style>\r\n\r\n<div class="boxGrn">\r\n<a href="javascript:;" onclick="return false;" class="buttonGrn">Hows my Button?</a>\r\n</div>', '2013-01-01 21:54:27'),
(12, 1, 'if( !is_admin()){\r\n \r\nwp_deregister_script(''jquery'');\r\nwp_register_script(''jquery'', ("http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"), false, ''1.7.2'');\r\nwp_enqueue_script(''jquery'');\r\n}', '2013-01-01 21:54:27'),
(13, 1, '<style>\r\n.boxGrn {\r\n    display:inline;\r\n    float:left;\r\n    -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box;\r\n    width:174px; height:38px;\r\n    border-top:1px solid #666;\r\n    background: -o-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -moz-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -webkit-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -ms-linear-gradient(top, #87C031 0%, #618A13 100%);\r\n    background: -webkit-gradient(linear, left top, left bottom, from(#87C031), to(#618A13));\r\n    background: linear-gradient(top, #87C031 0%, #618A13 100%);\r\n}\r\na.buttonGrn:link, a.buttonGrn:visited  {\r\n    text-transform:uppercase;\r\n    display:inline;\r\n    float:left;\r\n    -moz-box-sizing:border-box; -webkit-box-sizing:border-box; box-sizing:border-box;\r\n    width:160px; height:26px;\r\n    margin:5px 6px;\r\n    font-weight:bold;\r\n    font-family:Arial, Helvetica, sans-serif; font-size:12px; color:#fff; line-height:27px; font-weight:bold; text-decoration:none;\r\n    padding-left:26px;\r\n    background: -o-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -moz-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -webkit-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -ms-linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background: -webkit-gradient(linear, left top, left bottom, from(rgba(0,0,0,0)), to(rgba(0,0,0,0)), color-stop(.5,rgba(0,0,0,0)), color-stop(.5,rgba(0,0,0,.2)));\r\n    background: linear-gradient(top, rgba(0,0,0,0) 50%, rgba(0,0,0,.2) %50, rgba(0,0,0,0) 100%);\r\n    background-position:0px 0px;\r\n    background-repeat:no-repeat;\r\n    background-color:rgba(156,209,78,.6);\r\n    -webkit-border-radius:4px; border-radius:4px;\r\n    -webkit-box-shadow:0px 1px 5px rgba(0,0,0,0.8); box-shadow:0px 1px 5px rgba(0,0,0,0.8);\r\n    -o-transition:all 0.4s ease; -moz-transition:all 0.4s ease; -webkit-transition:all 0.4s ease; transition:all 0.4s ease; \r\n}\r\na.buttonGrn:hover, a.buttonGrn:focus {\r\n    color:#333;\r\n    background-color:rgba(255,255,255,1);\r\n    -webkit-box-shadow:0px 1px 6px rgba(0,0,0,1); box-shadow:0px 1px 6px rgba(0,0,0,1);\r\n}\r\n</style>\r\n\r\n<div class="boxGrn">\r\n<a href="javascript:;" onclick="return false;" class="buttonGrn">Hows my Button?</a>\r\n</div>', '2013-01-01 21:54:27'),
(14, 1, 'if( !is_admin()){\r\n \r\nwp_deregister_script(''jquery'');\r\nwp_register_script(''jquery'', ("http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"), false, ''1.7.2'');\r\nwp_enqueue_script(''jquery'');\r\n}', '2013-01-01 21:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
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
