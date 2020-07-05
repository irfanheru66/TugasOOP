-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.1.37-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5459
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ta_oop
CREATE DATABASE IF NOT EXISTS `ta_oop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ta_oop`;

-- Dumping structure for table ta_oop.asuransi
CREATE TABLE IF NOT EXISTS `asuransi` (
  `no_asuransi` int(5) NOT NULL AUTO_INCREMENT,
  `nama_asuransi` varchar(50) DEFAULT '0',
  `potongan` int(3) DEFAULT '0',
  PRIMARY KEY (`no_asuransi`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.asuransi: ~10 rows (approximately)
/*!40000 ALTER TABLE `asuransi` DISABLE KEYS */;
REPLACE INTO `asuransi` (`no_asuransi`, `nama_asuransi`, `potongan`) VALUES
	(10001, 'AIA', 35),
	(10002, 'ACA', 20),
	(10003, 'Prudential', 15),
	(10004, 'Adira', 25),
	(10005, 'AXA', 30),
	(10006, 'Jasa Raharja', 10),
	(10007, 'BPJS', 100),
	(10008, 'BPJS Ketenagakerjaan', 75),
	(10009, 'Jiwasraya', 5),
	(10010, 'Allianz', 50);
/*!40000 ALTER TABLE `asuransi` ENABLE KEYS */;

-- Dumping structure for table ta_oop.dokter
CREATE TABLE IF NOT EXISTS `dokter` (
  `id_dokter` int(5) NOT NULL AUTO_INCREMENT,
  `jumlahpasien` int(3) NOT NULL DEFAULT '0',
  `harga` int(12) NOT NULL DEFAULT '0',
  `nama` varchar(50) DEFAULT NULL,
  `spesialis` enum('Bedah Onkologi','Bedah Toraks','Bedah Digestif','Bedah ObGyn','Bedah Saraf') DEFAULT NULL,
  `jadwal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  PRIMARY KEY (`id_dokter`)
) ENGINE=InnoDB AUTO_INCREMENT=15011 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.dokter: ~10 rows (approximately)
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
REPLACE INTO `dokter` (`id_dokter`, `jumlahpasien`, `harga`, `nama`, `spesialis`, `jadwal`, `jam`) VALUES
	(15001, 100, 12500000, 'Vayne', 'Bedah Saraf', '2020-07-03', '09:00:00'),
	(15002, 50, 15000000, 'Rais', 'Bedah Saraf', '2020-07-05', '10:00:00'),
	(15003, 75, 10000000, 'Tomo', 'Bedah ObGyn', '2020-07-04', '11:00:00'),
	(15004, 100, 20000000, 'Ica', 'Bedah ObGyn', '2020-07-01', '10:00:00'),
	(15005, 50, 10000000, 'Mar', 'Bedah Digestif', '2020-07-05', '11:00:00'),
	(15006, 70, 15000000, 'Raj', 'Bedah Digestif', '2020-07-03', '09:00:00'),
	(15007, 100, 12500000, 'Kram', 'Bedah Toraks', '2020-07-04', '09:00:00'),
	(15008, 20, 20000000, 'Yyan', 'Bedah Toraks', '2020-07-01', '12:00:00'),
	(15009, 75, 22500000, 'Adli', 'Bedah Onkologi', '2020-07-02', '09:00:00'),
	(15010, 25, 1000000, 'Kal', 'Bedah Onkologi', '2020-07-02', '11:00:00');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;

-- Dumping structure for table ta_oop.pasien
CREATE TABLE IF NOT EXISTS `pasien` (
  `no_ktp` int(16) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `penyakit` enum('Kanker Hati','Kanker Otak','Gagal Nafas','TBC','Usus Buntu','Nekrosis Usus','Lahir Sesar','Komplikasi Bayi','Rusak Saraf','Stroke') DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `no_asuransi` int(5) DEFAULT NULL,
  PRIMARY KEY (`no_ktp`),
  KEY `FK_pasien_asuransi` (`no_asuransi`),
  CONSTRAINT `FK_pasien_asuransi` FOREIGN KEY (`no_asuransi`) REFERENCES `asuransi` (`no_asuransi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2147483648 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.pasien: ~5 rows (approximately)
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
REPLACE INTO `pasien` (`no_ktp`, `nama`, `alamat`, `no_hp`, `penyakit`, `tgl_lahir`, `no_asuransi`) VALUES
	(0, 'Muslim', 'UBI', '1234567891011', 'Kanker Hati', '2020-07-05', 10001),
	(1, 'Coki', 'SK', '1212121212121', 'Kanker Otak', '2020-07-05', 10004),
	(2, 'Dustin', 'BB', '1313131313131', 'Gagal Nafas', '2020-07-03', 10002),
	(3, 'Hitler', 'SS', '6666666666666', 'TBC', '2020-07-03', 10010),
	(4, 'Stalin', 'RS', '0000000000000', 'Usus Buntu', '2020-07-04', 10009),
	(5, 'Budi', 'HH', '1414141414141', 'Nekrosis Usus', '2020-07-04', 10005),
	(6, 'Ana', 'HS', '1515151515151', 'Lahir Sesar', '2020-07-02', 10007),
	(7, 'Indah', 'GG', '1616161616161', 'Komplikasi Bayi', '2020-07-01', 10008),
	(8, 'Cantika', 'WP', '1717171717171', 'Rusak Saraf', '2020-06-30', 10006),
	(9, 'Mana', 'ML', '1818181818181', 'Stroke', '2020-06-30', 10003);
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;

-- Dumping structure for table ta_oop.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `no_bayar` int(5) NOT NULL AUTO_INCREMENT,
  `jumlah_bayar` int(12) DEFAULT NULL,
  `id_dokter` int(5) DEFAULT NULL,
  `id_pasien` int(16) DEFAULT NULL,
  PRIMARY KEY (`no_bayar`),
  KEY `id_dokter` (`id_dokter`),
  KEY `id_pasien` (`id_pasien`),
  CONSTRAINT `FK_pembayaran_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_pembayaran_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`no_ktp`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.pembayaran: ~0 rows (approximately)
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
REPLACE INTO `pembayaran` (`no_bayar`, `jumlah_bayar`, `id_dokter`, `id_pasien`) VALUES
	(1, 20000000, 15001, 1),
	(2, 15000000, 15007, 2),
	(3, 22500000, 15005, 3),
	(4, 10000000, 15004, 4),
	(5, 17500000, 15002, 5);
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
