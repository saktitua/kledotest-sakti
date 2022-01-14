-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jan 2022 pada 20.42
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kledo_assignment`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasbon`
--

CREATE TABLE `kasbon` (
  `id` int(6) NOT NULL,
  `tanggal_diajukan` date NOT NULL,
  `tanggal_disetujui` date DEFAULT NULL,
  `pegawai_id` int(6) NOT NULL,
  `total_kasbon` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kasbon`
--

INSERT INTO `kasbon` (`id`, `tanggal_diajukan`, `tanggal_disetujui`, `pegawai_id`, `total_kasbon`, `created_at`, `updated_at`) VALUES
(1, '2022-01-14', '2022-01-15', 1, 1200000, '2022-01-14 18:33:35', NULL),
(2, '2022-01-13', '2022-01-14', 2, 500000, '2022-01-14 18:33:35', NULL),
(3, '2021-01-10', '2021-01-10', 3, 450000, '2022-01-14 12:22:19', '2022-01-14 12:22:19'),
(4, '2021-01-10', '2021-01-11', 2, 120000, '2022-01-14 12:23:01', '2022-01-14 12:23:01'),
(5, '2021-01-10', '2022-01-14', 2, 120000, '2022-01-14 19:33:05', '2022-01-14 12:33:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(6) NOT NULL,
  `nama` varchar(10) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `total_gaji` int(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `tanggal_masuk`, `total_gaji`, `created_at`, `updated_at`) VALUES
(1, 'sakti tua ', '2022-01-15', 2000000, '2022-01-14 17:38:45', '0000-00-00 00:00:00'),
(2, 'lova mar', '2022-01-16', 2500000, '2022-01-15 17:51:19', '2022-01-14 17:51:27'),
(3, 'martin si', '2021-01-10', 450000, '2022-01-14 12:02:09', '2022-01-14 12:02:09'),
(5, 'susi san', '2021-01-10', 450000, '2022-01-14 12:26:32', '2022-01-14 12:26:32');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kasbon`
--
ALTER TABLE `kasbon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kasbon`
--
ALTER TABLE `kasbon`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
