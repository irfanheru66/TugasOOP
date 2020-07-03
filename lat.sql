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
DROP DATABASE IF EXISTS `ta_oop`;
CREATE DATABASE IF NOT EXISTS `ta_oop` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ta_oop`;

-- Dumping structure for table ta_oop.dokter
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE IF NOT EXISTS `dokter` (
  `id_dokter` int(10) NOT NULL,
  `id_pasien` int(10) DEFAULT NULL,
  `spesialis` varchar(20) DEFAULT NULL,
  `jadwal` date DEFAULT NULL,
  `ruangan` varchar(4) DEFAULT NULL,
  `departement` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_dokter`),
  KEY `id_pasien` (`id_pasien`),
  CONSTRAINT `FK_dokter_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.dokter: ~2 rows (approximately)
/*!40000 ALTER TABLE `dokter` DISABLE KEYS */;
REPLACE INTO `dokter` (`id_dokter`, `id_pasien`, `spesialis`, `jadwal`, `ruangan`, `departement`) VALUES
	(1, NULL, 'mata', '2020-07-02', '1', 'onthology'),
	(2, NULL, 'kandungan', '2020-07-02', '2', 'Ob\\Gyn');
/*!40000 ALTER TABLE `dokter` ENABLE KEYS */;

-- Dumping structure for table ta_oop.pasien
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE IF NOT EXISTS `pasien` (
  `id_pasien` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(13) DEFAULT NULL,
  `status` enum('Dokter','Pasien') DEFAULT NULL,
  `penyakit` varchar(50) DEFAULT NULL,
  `riwayat_penyakit` longtext,
  `asuransi` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.pasien: ~0 rows (approximately)
/*!40000 ALTER TABLE `pasien` DISABLE KEYS */;
REPLACE INTO `pasien` (`id_pasien`, `nama`, `alamat`, `no_hp`, `status`, `penyakit`, `riwayat_penyakit`, `asuransi`) VALUES
	(1, 'a', 'a', '1', 'Pasien', 'a', 'a', 'Y');
/*!40000 ALTER TABLE `pasien` ENABLE KEYS */;

-- Dumping structure for table ta_oop.pembayaran
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `no_bayar` int(10) NOT NULL AUTO_INCREMENT,
  `id_pasien` int(10) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_bayar`),
  KEY `tanggungan` (`id_pasien`),
  CONSTRAINT `FK_pembayaran_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table ta_oop.pembayaran: ~0 rows (approximately)
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
REPLACE INTO `pembayaran` (`no_bayar`, `id_pasien`, `jumlah`, `total`) VALUES
	(1, 1, 0, 0);
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
