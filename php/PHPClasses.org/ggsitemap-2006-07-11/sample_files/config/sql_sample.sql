
CREATE TABLE `map` (
  `id_map` int(10) unsigned NOT NULL auto_increment,
  `path` varchar(255) NOT NULL default '',
  `date` date NOT NULL default '0000-00-00',
  `freq` varchar(30) NOT NULL default '',
  `priority` float(2,1) NOT NULL default '0.0',
  PRIMARY KEY  (`id_map`)
) TYPE=InnoDB;


INSERT INTO `map` VALUES (1, 'http://www.test.com/index.php?cat=boutique&id=20', '2006-07-10', 'never', 5.2);
INSERT INTO `map` VALUES (2, 'http://www.test.com/index.php?cat=boutique&id=21', '2006-07-09', 'always', 8.9);