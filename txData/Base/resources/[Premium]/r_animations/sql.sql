CREATE TABLE IF NOT EXISTS `rd_animations_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `sets` longtext COLLATE utf8mb4_bin,
  `walkstyle` longtext COLLATE utf8mb4_bin,
  `face` longtext COLLATE utf8mb4_bin,

  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `rd_animations_favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `animation` varchar(100) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;