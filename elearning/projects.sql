-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 10:42 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmuhdela`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(3) NOT NULL,
  `username` varchar(100) NOT NULL DEFAULT 'administrator',
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'admin',
  `alamat` text NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`, `level`, `alamat`, `no_telp`, `email`, `blokir`, `id_session`) VALUES
(3, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Nuzul Ramadhan', 'admin', 'Jl Trunojoyo', '089675925082', 'business.mynddigital@gmail.com', 'N', 'qljgs2fh24unigca98crodd946');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file_materi`
--

CREATE TABLE `file_materi` (
  `id_file` int(7) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(5) NOT NULL,
  `nama_file` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(50) NOT NULL,
  `hits` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE `jawaban` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_quiz` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `jawaban` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(5) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `id_siswa` int(9) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `id_kelas`, `nama`, `id_pengajar`, `id_siswa`) VALUES
(8, '7c', 'VII - C', 6, 0),
(6, '7a', 'VII - A', 1, 5),
(12, '8b', 'VIII - B', 0, 0),
(13, '8c', 'VIII - C', 0, 0),
(14, '8d', 'VIII - D', 0, 0),
(15, '8e', 'VIII - E', 0, 0),
(16, '9a', 'VIIII - A', 0, 0),
(17, '9b', 'VIIII - B', 0, 0),
(18, '9c', 'VIIII - C', 0, 0),
(19, '9d', 'VIIII - D', 0, 0),
(20, '9e', 'VIIII - E', 0, 0),
(27, '7b', 'VII - B', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id` int(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_pengajar` int(9) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id`, `id_matapelajaran`, `nama`, `id_kelas`, `id_pengajar`, `deskripsi`) VALUES
(11, 'BI1', 'Bahasa Indonesia', '7a', 0, ''),
(10, 'M1', 'Matematika', '7a', 1, ''),
(12, 'B1', 'Bahasa Inggris', '7a', 0, ''),
(13, 'G1', 'Geografi', '7a', 0, ''),
(15, 'BI2', 'Bahasa Indonesia', '7b', 6, ''),
(16, 'B2', 'Bahasa Inggris', '7b', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `gambar` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `publish` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `status` enum('pengajar','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'Y',
  `urutan` int(5) NOT NULL,
  `link_seo` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `gambar`, `publish`, `status`, `aktif`, `urutan`, `link_seo`) VALUES
(2, 'Manajemen Admin', '?module=admin', '', '', 'N', 'admin', 'N', 2, ''),
(18, 'Materi', '?module=materi', '', '', 'N', 'pengajar', 'Y', 6, 'semua-berita.html'),
(37, 'Manajemen Siswa', '?module=siswa', '', 'gedungku.jpg', 'Y', 'admin', 'Y', 3, 'profil-kami.html'),
(10, 'Manajemen Modul', '?module=modul', '', '', 'N', 'admin', 'N', 1, ''),
(31, 'Mata Pelajaran', '?module=matapelajaran', '', '', 'Y', 'pengajar', 'Y', 5, ''),
(63, 'Manajemen Quiz', '?module=quiz', '', '', 'N', 'pengajar', 'Y', 7, ''),
(41, 'Manajemen Kelas', ' ?module=kelas', '', '', 'N', 'pengajar', 'Y', 4, 'semua-agenda.html'),
(65, 'Registrasi Siswa', '?module=registrasi', '', '', 'Y', 'admin', 'Y', 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `benar` int(10) NOT NULL,
  `salah` int(10) NOT NULL,
  `tidak_dikerjakan` int(50) NOT NULL,
  `persentase` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_soal_esay`
--

CREATE TABLE `nilai_soal_esay` (
  `id` int(50) NOT NULL,
  `id_tq` int(50) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `nilai` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `online`
--

CREATE TABLE `online` (
  `ip` varchar(20) NOT NULL,
  `id_siswa` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `online` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `online`
--

INSERT INTO `online` (`ip`, `id_siswa`, `tanggal`, `online`) VALUES
('::1', 7, '2019-12-02', 'T'),
('127.0.0.1', 5, '2011-07-14', 'T'),
('::1', 9, '2011-12-28', 'T'),
('::1', 11, '2019-12-02', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `pengajar`
--

CREATE TABLE `pengajar` (
  `id_pengajar` int(9) NOT NULL,
  `nip` char(12) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(100) NOT NULL,
  `password_login` varchar(100) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT 'pengajar',
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `jabatan` varchar(200) NOT NULL,
  `blokir` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_esay`
--

CREATE TABLE `quiz_esay` (
  `id_quiz` int(9) NOT NULL,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'esay'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_pilganda`
--

CREATE TABLE `quiz_pilganda` (
  `id_quiz` int(10) NOT NULL,
  `id_tq` int(9) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `kunci` varchar(1) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(50) NOT NULL DEFAULT 'pilganda'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_siswa`
--

CREATE TABLE `registrasi_siswa` (
  `id_registrasi` int(9) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(50) NOT NULL,
  `password_login` varchar(50) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `th_masuk` varchar(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `blokir` enum('Y','N') NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `id_session_soal` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'siswa'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(9) NOT NULL,
  `nis` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `username_login` varchar(50) NOT NULL,
  `password_login` varchar(50) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `jabatan` varchar(200) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(100) NOT NULL,
  `nama_ibu` varchar(100) NOT NULL,
  `th_masuk` varchar(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `foto` varchar(150) NOT NULL,
  `blokir` enum('Y','N') NOT NULL,
  `id_session` varchar(100) NOT NULL,
  `id_session_soal` varchar(100) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'siswa'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama_lengkap`, `username_login`, `password_login`, `id_kelas`, `jabatan`, `alamat`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `th_masuk`, `email`, `no_telp`, `foto`, `blokir`, `id_session`, `id_session_soal`, `level`) VALUES
(11, '181999212', 'Ishaq Maulana', 'ishaqmaulana', 'fb49beb22db72ab2104203d2eb78ba74', '7a', 'Siswa', 'Jl Trunojoyo', 'Jember', '2004-12-02', 'L', 'Islam', 'Mboh', 'Mboh', '2009', 'nuzulzaif@gmail.com', '089675925082', 'tutor.jpg', 'N', 'pp1eeafck9um16po77mklc8e07', '181999212', 'siswa');

-- --------------------------------------------------------

--
-- Table structure for table `siswa_sudah_mengerjakan`
--

CREATE TABLE `siswa_sudah_mengerjakan` (
  `id` int(20) NOT NULL,
  `id_tq` int(20) NOT NULL,
  `id_siswa` varchar(200) NOT NULL,
  `dikoreksi` varchar(1) NOT NULL DEFAULT 'B',
  `hits` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id_templates` int(5) NOT NULL,
  `judul` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pembuat` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `folder` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id_templates`, `judul`, `pembuat`, `folder`, `aktif`) VALUES
(4, 'Standar', 'ATOOR - Digital Creative Product', 'templates/almazari', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `topik_quiz`
--

CREATE TABLE `topik_quiz` (
  `id_tq` int(9) NOT NULL,
  `judul` varchar(150) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(100) NOT NULL,
  `waktu_pengerjaan` int(50) NOT NULL,
  `info` text NOT NULL,
  `terbit` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_materi`
--
ALTER TABLE `file_materi`
  ADD PRIMARY KEY (`id_file`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_soal_esay`
--
ALTER TABLE `nilai_soal_esay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `online`
--
ALTER TABLE `online`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `pengajar`
--
ALTER TABLE `pengajar`
  ADD PRIMARY KEY (`id_pengajar`);

--
-- Indexes for table `quiz_esay`
--
ALTER TABLE `quiz_esay`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indexes for table `quiz_pilganda`
--
ALTER TABLE `quiz_pilganda`
  ADD PRIMARY KEY (`id_quiz`);

--
-- Indexes for table `registrasi_siswa`
--
ALTER TABLE `registrasi_siswa`
  ADD PRIMARY KEY (`id_registrasi`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `siswa_sudah_mengerjakan`
--
ALTER TABLE `siswa_sudah_mengerjakan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id_templates`);

--
-- Indexes for table `topik_quiz`
--
ALTER TABLE `topik_quiz`
  ADD PRIMARY KEY (`id_tq`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_materi`
--
ALTER TABLE `file_materi`
  MODIFY `id_file` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `nilai_soal_esay`
--
ALTER TABLE `nilai_soal_esay`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pengajar`
--
ALTER TABLE `pengajar`
  MODIFY `id_pengajar` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `quiz_esay`
--
ALTER TABLE `quiz_esay`
  MODIFY `id_quiz` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `quiz_pilganda`
--
ALTER TABLE `quiz_pilganda`
  MODIFY `id_quiz` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `registrasi_siswa`
--
ALTER TABLE `registrasi_siswa`
  MODIFY `id_registrasi` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `siswa_sudah_mengerjakan`
--
ALTER TABLE `siswa_sudah_mengerjakan`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id_templates` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `topik_quiz`
--
ALTER TABLE `topik_quiz`
  MODIFY `id_tq` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
