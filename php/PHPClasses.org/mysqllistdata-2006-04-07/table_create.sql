-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.19-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema pustaka
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ pustaka;
USE pustaka;

--
-- Table structure for table `pustaka`.`m_anggota`
--

DROP TABLE IF EXISTS `m_anggota`;
CREATE TABLE `m_anggota` (
  `id` varchar(5) NOT NULL default '' COMMENT 'No identitas / anggota',
  `nama` varchar(50) default NULL,
  `alamat` varchar(100) default NULL,
  `rt` char(3) default NULL,
  `rw` char(3) default NULL,
  `kode_pos` varchar(8) default NULL,
  `phone` varchar(12) default NULL,
  `mobile` varchar(12) default NULL,
  `tempat_lahir` varchar(40) default NULL,
  `tgl_lahir` date default NULL,
  `pendidikan` varchar(45) default NULL,
  `pekerjaan` varchar(45) default NULL,
  `email` varchar(45) default NULL,
  `no_id` varchar(20) NOT NULL default '',
  `sex` enum('P','L') NOT NULL default 'P',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='master anggota perpustakaan';

--
-- Dumping data for table `pustaka`.`m_anggota`
--

/*!40000 ALTER TABLE `m_anggota` DISABLE KEYS */;
INSERT INTO `m_anggota` (`id`,`nama`,`alamat`,`rt`,`rw`,`kode_pos`,`phone`,`mobile`,`tempat_lahir`,`tgl_lahir`,`pendidikan`,`pekerjaan`,`email`,`no_id`,`sex`) VALUES 
 ('0001','EKA DYSTIANT AULIA NASUTION','JALAN SINABUNG NO. 6','005','007','12120','021-7243449','08158351430','MEDAN','1972-01-09','SARJANA','SWASTA','melinuxid@yahoo.com','09.5307.090172.0259','L'),
 ('0002','DONY SETIAWAN','JALAN RAYA','009','007','10290','01920129','09102910','P. BRANDAN','1973-03-01','SARJANA','SWASTA','dhons@yahoo.com','010473-909-9390-9039','L'),
 ('0003','RADEN DEVANTIAR','SERANG','005','006','12120','021-7243449','08158351430','JAKARTA','1980-01-01','SD','SWASTA','devan@yahoo.com','1212121','L'),
 ('0009','M. FIERZA MUCHAROM','JALAN SINABUNG NO. 6','005','006','12120','128909','9810298','P. BRANDAN','1976-12-01','SARJANA','DOSEN','fierza@yahoo.com','12890-293802-89','L');
/*!40000 ALTER TABLE `m_anggota` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
