-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2022 pada 14.52
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sispak_motor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Gejala'),
(4, 'Kerusakan'),
(5, 'Pengetahuan'),
(6, 'Laporan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gejala`
--

CREATE TABLE `tbl_gejala` (
  `id_gejala` int(11) NOT NULL,
  `kode_gejala` char(3) NOT NULL,
  `nama_gejala` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_gejala`
--

INSERT INTO `tbl_gejala` (`id_gejala`, `kode_gejala`, `nama_gejala`) VALUES
(1, 'G01', 'Performa mesin kendaraan berkurang'),
(2, 'G02', 'Air Radiator cepat habis/kering'),
(3, 'G03', 'Indikator lampu suhu temperatur menyala'),
(4, 'G04', 'Mesin mengalami panas berlebih'),
(5, 'G05', 'Mesin kendaraan tiba-tiba mati saat sedang jalan'),
(6, 'G06', 'Mesin kendaraan tidak dapat menyala'),
(7, 'G07', 'Kelistrikan kendaraan mati total'),
(8, 'G08', 'Voltase pada battery/aki tidak normal atau tidak mengisi'),
(9, 'G09', 'Lampu-lampu sering kali putus'),
(10, 'G10', 'Kiprok tidak bekerja secara normal'),
(11, 'G11', 'Busi tidak memercikan bunga api'),
(12, 'G12', 'Hilang nya kompresi pada mesin kendaraan'),
(13, 'G13', 'Rem terasa blong saat handle ditekan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_hasil_diagnosa`
--

CREATE TABLE `tbl_hasil_diagnosa` (
  `id_hasil` int(11) NOT NULL,
  `hasil_probabilitas` float NOT NULL,
  `nama_kerusakan` varchar(100) NOT NULL,
  `nama_user` varchar(25) NOT NULL,
  `solusi` text NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_hasil_diagnosa`
--

INSERT INTO `tbl_hasil_diagnosa` (`id_hasil`, `hasil_probabilitas`, `nama_kerusakan`, `nama_user`, `solusi`, `waktu`) VALUES
(47, 9, 'Rusak pada bagian sistem perkabelan (Wiring System)', 'Supratno', 'Bongkar seluruh body-body motor, lalu periksa jalur kabel-kabel sensitif yang menuju ECU/CDI yang menyebabkan motor mati total, kabel menuju lampu-lampu yang menyebabkan lampu utama, lampu kota, lampu rem, lampu sein tidak menyala, kabel menuju kunci kontak (ignition switch) yang menyebabkan motor tidak dapat menyala ketika kunci kontak posisi ON. Apabila ada kerusakan (putus) sambung dan periksa sambungan pada kabel agar tidak bercampur dengan kabel lainnya (Konsleting) ', 1657466253),
(48, 100, 'Rusak pada bagian sistem pendingin (Radiator)', 'Supratno', 'Memeriksa kebocoran komponen seal-seal yang ada pada radiator, jika terjadi kebocoran pada seal-seal radiator segera diganti dan lalukan pergantian air coolant yang baru.', 1657469739),
(49, 92, 'Rusak pada bagian sistem perkabelan (Wiring System)', 'Supratno', 'Bongkar seluruh body-body motor, lalu periksa jalur kabel-kabel sensitif yang menuju ECU/CDI yang menyebabkan motor mati total, kabel menuju lampu-lampu yang menyebabkan lampu utama, lampu kota, lampu rem, lampu sein tidak menyala, kabel menuju kunci kontak (ignition switch) yang menyebabkan motor tidak dapat menyala ketika kunci kontak posisi ON. Apabila ada kerusakan (putus) sambung dan periksa sambungan pada kabel agar tidak bercampur dengan kabel lainnya (Konsleting) ', 1657469759),
(55, 100, 'Rusak pada bagian sistem pengisian', 'Supratno', 'Periksa terlebih dahulu tegangan pada battery (aki) motor, apabila tegangan berada pada angka 12,4V atau lebih berati pengisian pada motor normal, apabila kurang dari 12,4V artinya ada yang bermasalah pada sistem pengisian. Jika terjadi tegangan kurang pada battery (tidak mengisi) segera lakukan pergantian Kiprok pada kendaraan motor tersebut.', 1657469895),
(57, 100, 'Rusak pada bagian sistem pengereman', 'Supratno', 'Melakukan service pada sistem pengereman dan mengecek pad (kampas), membersihkan saluran selang rem dari kotoran dengan cara melakukan bleeding dan lakukan pergantian brake pad (kampas rem) apabila sudah tipis ', 1657470490);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kerusakan`
--

CREATE TABLE `tbl_kerusakan` (
  `id_kerusakan` int(11) NOT NULL,
  `kode_kerusakan` char(3) NOT NULL,
  `nama_kerusakan` varchar(100) NOT NULL,
  `solusi` text NOT NULL,
  `probabilitas` float NOT NULL,
  `gambar` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kerusakan`
--

INSERT INTO `tbl_kerusakan` (`id_kerusakan`, `kode_kerusakan`, `nama_kerusakan`, `solusi`, `probabilitas`, `gambar`) VALUES
(1, 'K01', 'Rusak pada bagian sistem pendingin (Radiator)', 'Memeriksa kebocoran komponen seal-seal yang ada pada radiator, jika terjadi kebocoran pada seal-seal radiator segera diganti dan lalukan pergantian air coolant yang baru.', 0.2, 'sistem_pendingin12.jpg'),
(2, 'K02', 'Rusak pada bagian sistem perkabelan (Wiring System)', 'Bongkar seluruh body-body motor, lalu periksa jalur kabel-kabel sensitif yang menuju ECU/CDI yang menyebabkan motor mati total, kabel menuju lampu-lampu yang menyebabkan lampu utama, lampu kota, lampu rem, lampu sein tidak menyala, kabel menuju kunci kontak (ignition switch) yang menyebabkan motor tidak dapat menyala ketika kunci kontak posisi ON. Apabila ada kerusakan (putus) sambung dan periksa sambungan pada kabel agar tidak bercampur dengan kabel lainnya (Konsleting) ', 0.2, 'wiring_system.jpg'),
(3, 'K03', 'Rusak pada bagian sistem pengisian', 'Periksa terlebih dahulu tegangan pada battery (aki) motor, apabila tegangan berada pada angka 12,4V atau lebih berati pengisian pada motor normal, apabila kurang dari 12,4V artinya ada yang bermasalah pada sistem pengisian. Jika terjadi tegangan kurang pada battery (tidak mengisi) segera lakukan pergantian Kiprok pada kendaraan motor tersebut.', 0.1, 'sistem_pengisian1.jpg'),
(4, 'K04', 'Rusak pada bagian sistem pembakaran', 'Melakukan pengecekan pada koil dan busi. Ganti busi/coil apabila terdapat kerusakan (missfire) pada sistem pembakaran kendaraan bermotor.', 0.3, 'busi11.jpg'),
(5, 'K05', 'Rusak pada bagian sistem pengereman', 'Melakukan service pada sistem pengereman dan mengecek pad (kampas), membersihkan saluran selang rem dari kotoran dengan cara melakukan bleeding dan lakukan pergantian brake pad (kampas rem) apabila sudah tipis ', 0.2, 'sistem_pengereman12.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengetahuan`
--

CREATE TABLE `tbl_pengetahuan` (
  `id` int(11) NOT NULL,
  `id_kerusakan` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `probabilitas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengetahuan`
--

INSERT INTO `tbl_pengetahuan` (`id`, `id_kerusakan`, `id_gejala`, `probabilitas`) VALUES
(110, 1, 1, 0.5),
(111, 1, 2, 1),
(112, 1, 3, 1),
(113, 1, 4, 1),
(114, 1, 5, 0.33),
(115, 1, 6, 0.5),
(116, 1, 7, 0),
(117, 1, 8, 0),
(118, 1, 9, 0),
(119, 1, 10, 0),
(120, 1, 11, 0),
(121, 1, 12, 0),
(122, 1, 13, 0),
(123, 2, 1, 0.33),
(124, 2, 2, 0),
(125, 2, 3, 0),
(126, 2, 4, 0),
(127, 2, 5, 0.5),
(128, 2, 6, 1),
(129, 2, 7, 1),
(130, 2, 8, 0.5),
(131, 2, 9, 0.5),
(132, 2, 10, 0),
(133, 2, 11, 0.33),
(134, 2, 12, 0),
(135, 2, 13, 0),
(136, 3, 1, 0.5),
(137, 3, 2, 0),
(138, 3, 3, 0),
(139, 3, 4, 0),
(140, 3, 5, 0),
(141, 3, 6, 0.33),
(142, 3, 7, 0.5),
(143, 3, 8, 1),
(144, 3, 9, 1),
(145, 3, 10, 1),
(146, 3, 11, 0),
(147, 3, 12, 0),
(148, 3, 13, 0),
(149, 4, 1, 0.5),
(150, 4, 2, 0),
(151, 4, 3, 0),
(152, 4, 4, 0),
(153, 4, 5, 0.5),
(154, 4, 6, 0.5),
(155, 4, 7, 0),
(156, 4, 8, 0),
(157, 4, 9, 0),
(158, 4, 10, 0),
(159, 4, 11, 1),
(160, 4, 12, 1),
(161, 4, 13, 0),
(162, 5, 1, 0),
(163, 5, 2, 0),
(164, 5, 3, 0),
(165, 5, 4, 0),
(166, 5, 5, 0),
(167, 5, 6, 0),
(168, 5, 7, 0),
(169, 5, 8, 0),
(170, 5, 9, 0),
(171, 5, 10, 0),
(172, 5, 11, 0),
(173, 5, 12, 0),
(174, 5, 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `image` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `username`, `image`, `password`, `role_id`, `date_created`) VALUES
(1, 'Faris Sofyan Wiganda', 'admin', 'Faris_Presiden_out.png', '$2y$10$lr3qHfnzloXDuXi7NVk1aehqjYiIpT/WNRcESTPoTwaeU4gm6e.SS', 1, 1657293862),
(7, 'Member', 'Member', 'default.jpg', '$2y$10$gam52naGqUaHYPkQ49WDn.NtUmAUqZ5jdoMwKGAkw8DW8daCdLmoW', 2, 1575266061),
(15, 'Supratno', 'mekanik1', 'default.jpg', '$2y$10$O5l3uwOE3Z.0RAWshyHTSeUq39L12.19w/ZQwDEeWLjgjnmldCh6G', 2, 1657465769);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_final`
--

CREATE TABLE `tmp_final` (
  `id` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL,
  `id_kerusakan` int(11) NOT NULL,
  `probabilitas` float NOT NULL,
  `hasil_probabilitas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_final`
--

INSERT INTO `tmp_final` (`id`, `id_gejala`, `id_kerusakan`, `probabilitas`, `hasil_probabilitas`) VALUES
(1, 13, 1, 0, 0),
(2, 13, 2, 0, 0),
(3, 13, 3, 0, 0),
(4, 13, 4, 0, 0),
(5, 13, 5, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tmp_gejala`
--

CREATE TABLE `tmp_gejala` (
  `id_user` int(11) NOT NULL,
  `id_gejala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tmp_gejala`
--

INSERT INTO `tmp_gejala` (`id_user`, `id_gejala`) VALUES
(15, 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(8, 1, 3),
(9, 1, 4),
(10, 1, 5),
(11, 1, 6);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_gejala`
--
ALTER TABLE `tbl_gejala`
  ADD PRIMARY KEY (`id_gejala`);

--
-- Indeks untuk tabel `tbl_hasil_diagnosa`
--
ALTER TABLE `tbl_hasil_diagnosa`
  ADD PRIMARY KEY (`id_hasil`);

--
-- Indeks untuk tabel `tbl_kerusakan`
--
ALTER TABLE `tbl_kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`);

--
-- Indeks untuk tabel `tbl_pengetahuan`
--
ALTER TABLE `tbl_pengetahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_gejala` (`id_gejala`),
  ADD KEY `id_kerusakan` (`id_kerusakan`);

--
-- Indeks untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `tmp_final`
--
ALTER TABLE `tmp_final`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_gejala`
--
ALTER TABLE `tbl_gejala`
  MODIFY `id_gejala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tbl_hasil_diagnosa`
--
ALTER TABLE `tbl_hasil_diagnosa`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `tbl_kerusakan`
--
ALTER TABLE `tbl_kerusakan`
  MODIFY `id_kerusakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengetahuan`
--
ALTER TABLE `tbl_pengetahuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT untuk tabel `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `tmp_final`
--
ALTER TABLE `tmp_final`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_pengetahuan`
--
ALTER TABLE `tbl_pengetahuan`
  ADD CONSTRAINT `tbl_pengetahuan_ibfk_1` FOREIGN KEY (`id_kerusakan`) REFERENCES `tbl_kerusakan` (`id_kerusakan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
