-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2024 at 09:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pfa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `creation_date`) VALUES
(4, 'issam', 'test@test.com', '$2b$10$C7p.5XsH02/3NfHZZJZ9uO1JLwzDgz5lSUTg2oU2pCf', '2024-04-08 02:29:20'),
(5, 'issam1', 'issam@gmail.com', 'issam', '2024-04-10 01:11:15');

-- --------------------------------------------------------

--
-- Table structure for table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `id_tourist` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `createur`
--

CREATE TABLE `createur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `biographie` text NOT NULL,
  `date_n` date NOT NULL,
  `photo` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `createur`
--

INSERT INTO `createur` (`id`, `nom`, `biographie`, `date_n`, `photo`, `admin_id`) VALUES
(1, 'Hassan II bin Mohammed al-Alaoui', 'Hassan II, né le 9 juillet 1929 à Rabat et décédé le 23 juillet 1999 à Rabat, était le roi du Maroc de 1961 jusqu\'à sa mort en 1999. Il est largement connu pour avoir supervisé la construction de la Mosquée Hassan II à Casablanca, l\'une des réalisations architecturales les plus emblématiques du Maroc.', '1929-07-29', 'https://b.top4top.io/p_3045kquxu1.jpg', 5),
(2, 'Jacques Majorelle', 'Jacques Majorelle était un peintre français né le 7 mars 1886 à Nancy, en France. Il est principalement connu pour avoir créé le Jardin Majorelle à Marrakech, au Maroc, où il s\'est installé en 1919. Inspiré par la beauté et les couleurs de la nature marocaine, Majorelle a transformé le jardin en un lieu magique, combinant sa passion pour la botanique avec son talent artistique. Son utilisation distinctive du bleu cobalt dans le jardin est devenue emblématique et a donné son nom à la couleur \"bleu Majorelle\". Majorelle est décédé en 1962 à Paris, laissant derrière lui un héritage artistique et botanique durable.', '1886-03-07', 'https://k.top4top.io/p_3045acqrv1.jpg', 5),
(4, 'Almohades (Dynastie)', 'Les Almohades étaient une dynastie berbère d\'origine marocaine qui a régné sur une grande partie du Maghreb et de l\'Espagne au 12ème et 13ème siècle. Fondée par Ibn Tumart, un prédicateur religieux et politicien, la dynastie Almohade a établi son pouvoir en renversant les Almoravides et en unifiant la région sous un gouvernement islamique. Les Almohades ont construit plusieurs monuments emblématiques, dont la Kasbah des Oudayas à Rabat, témoignant de leur importance dans l\'histoire architecturale et politique du Maroc et de la région.', '1147-01-01', '', 5),
(7, 'si moussa ben ahmed', 'Si Moussa ben Ahmed, grand vizir du sultan Hassan Ier du Maroc au XIXe siècle, est surtout connu pour avoir initié la construction du somptueux Palais de la Bahia à Marrakech en 1866. Occupant une position de pouvoir et d\'influence, il a joué un rôle crucial dans la gestion des affaires de l\'État et la mise en œuvre des politiques royales. Après sa mort, son fils Ba Ahmed ben Moussa a poursuivi et achevé les travaux du palais, faisant de cet édifice un chef-d\'œuvre de l\'architecture marocaine et un symbole durable de la grandeur de la cour des Alaouites.', '1500-01-01', 'https://e.top4top.io/p_3057l6hvx1.jpg', 5),
(8, 'testtest', 'test', '2024-05-14', 'test', 5);

-- --------------------------------------------------------

--
-- Table structure for table `monument`
--

CREATE TABLE `monument` (
  `id` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `localisation` varchar(50) NOT NULL,
  `longitude` varchar(150) DEFAULT NULL,
  `latitude` varchar(150) DEFAULT NULL,
  `ville` varchar(50) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `createur` varchar(50) DEFAULT NULL,
  `horaire` varchar(50) NOT NULL,
  `frais` varchar(20) NOT NULL,
  `avis` int(11) NOT NULL,
  `images` text DEFAULT NULL,
  `date_creation` datetime NOT NULL DEFAULT current_timestamp(),
  `createur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monument`
--

INSERT INTO `monument` (`id`, `titre`, `description`, `localisation`, `longitude`, `latitude`, `ville`, `id_admin`, `createur`, `horaire`, `frais`, `avis`, `images`, `date_creation`, `createur_id`) VALUES
(1, 'Hassan II Mosque', 'The Hassan II Mosque is a mosque in Casablanca, Morocco. It is the largest mosque in Africa, and the 5th largest in the world. Its minaret is the world\'s tallest at 210 meters (689 ft).', 'Boulevard Sidi Mohammed Ben Abdallah', '-6.364951', '32.337240', 'Casablanca', 5, 'Moroccan Ministry of Islamic Affairs', '9:00 AM - 6:00 PM', '20 MAD', 5, 'https://c.top4top.io/p_3035xklkh1.jpg,https://e.top4top.io/p_3035ivs2f1.jpg,https://f.top4top.io/p_3035m41ca1.jpg', '2024-04-09 00:36:57', 1),
(2, 'Jardin Majorelle', 'Le Jardin Majorelle, autrefois la résidence du peintre français Jacques Majorelle, est un jardin botanique enchanteur situé à Marrakech, au Maroc. Créé dans les années 1920 et 1930, il offre aux visiteurs une oasis de verdure luxuriante, avec une grande variété de plantes exotiques, des sentiers ombragés et des structures peintes dans des tons de bleu Majorelle distinctifs.\r\nLocalisation : Rue Yves Saint Laurent, Marrakech, Maroc', 'Rue Yves Saint Laurent', ' -7.9743', '31.6340', 'Marrakech', 5, 'Jacques Majorelle', '8:00 AM - 6:00 PM', '70 MAD', 4, 'https://l.top4top.io/p_30386nmzt1.jpg,https://c.top4top.io/p_30389apr21.jpg', '2024-04-09 00:36:57', 2),
(3, 'Kasbah of the Udayas', 'La Kasbah des Oudayas est une ancienne citadelle historique située à Rabat, la capitale du Maroc. Construite au 12ème siècle par les Almohades, cette kasbah est perchée au sommet d\'une falaise surplombant l\'embouchure du fleuve Bouregreg et l\'océan Atlantique. Elle est entourée de murailles fortifiées qui témoignent de son passé militaire et stratégique.', 'Rue Alcazar', '-6.835810', '34.031390', 'Rabat', 5, 'Almohad Dynasty', '9:00 AM - 5:00 PM', '30 MAD', 5, 'https://a.top4top.io/p_3038yfghx1.jpg,https://e.top4top.io/p_3038brgph1.jpg', '2024-04-09 00:36:57', 4),
(24, 'Palais de la Bahia', 'test', '31.6248,7.9891', NULL, NULL, 'Marrakech', 5, 'Si Moussa', '09:00 AM 06:00 PM', '50 DH', 5, 'https://l.top4top.io/p_3035jsrq81.jpg', '2024-04-23 17:29:55', NULL),
(28, 'Mosquée Koutoubia', 'The Koutoubia Mosque is a masterpiece of Almohad architecture, towering over the city with its minaret, the tallest structure in Marrakech. It\'s a symbol of the city\'s rich history and religious significance.', '31.6252,7.9911', NULL, NULL, 'Marrakech', 5, 'Almohad Caliphs', 'Daily, 24 hours', 'Free', 5, 'https://i.top4top.io/p_30383of5i1.jpeg,https://f.top4top.io/p_30388sgps1.jpeg,https://i.top4top.io/p_30386xqr71.jpeg', '2024-04-26 14:53:50', NULL),
(29, 'Medersa Ben Youssef', 'This 14th-century Islamic college is a marvel of Moroccan architecture, adorned with intricate tilework, carved cedar wood, and serene courtyards. It served as a center for learning and spiritual development for centuries.', '31.6297, 7.9891', NULL, NULL, 'Marrakech', 5, 'Marinid Sultan Abu al-Hassan', 'Daily, 9 AM - 5 PM', '70 MAD', 5, 'https://e.top4top.io/p_3038o3med1.jpeg,https://i.top4top.io/p_30382t6mv1.jpeg,https://l.top4top.io/p_3038l3u591.jpeg', '2024-04-26 14:59:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tourist`
--

CREATE TABLE `tourist` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp(),
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tourist`
--

INSERT INTO `tourist` (`id`, `username`, `email`, `password`, `creation_date`, `id_admin`) VALUES
(1, 'ahmed1985', 'ahmed1985@example.com', 'password123', '2024-04-10 02:53:12', 4),
(2, 'fatima91', 'fatima91@example.com', 'securepass', '2024-04-10 02:53:12', 4),
(3, 'mohamed_khan', 'mohamed.khan@example.com', 'p@ssw0rd!', '2024-04-10 02:53:12', 4),
(4, 'sara_mor', 'sara.mor@example.com', 'strongpass123', '2024-04-10 02:53:12', 4),
(7, 'omar2000', 'omar2000@example.com', 'omarpass', '2024-04-10 02:53:12', 4),
(8, 'layla88', 'layla88@example.com', 'pass1234', '2024-04-10 02:53:12', 4),
(9, 'khalid76', 'khalid76@example.com', 'khalidpass', '2024-04-10 02:53:12', 4),
(10, 'nadia93', 'nadia93@example.com', 'nadiapassword', '2024-04-10 02:53:12', 4),
(11, 'youssef_m', 'youssef.m@example.com', 'youssefpass', '2024-04-10 02:53:12', 4),
(12, 'hiba_xyz', 'hiba.xyz@example.com', 'password!', '2024-04-10 02:53:12', 4),
(13, 'adam_22', 'adam.22@example.com', 'password2022', '2024-04-10 02:53:12', 4),
(14, 'salma_aa', 'salma.aa@example.com', 'secure123', '2024-04-10 02:53:12', 4),
(15, 'zakaria123', 'zakaria123@example.com', 'zakariapass', '2024-04-10 02:53:12', 4),
(16, 'leila_79', 'leila.79@example.com', 'leilapassword', '2024-04-10 02:53:12', 4),
(19, 'omar.jamal', 'omar.jamal@example.com', 'omar1234', '2024-04-10 02:53:12', 4),
(20, 'amina_el', 'amina.el@example.com', 'aminapass', '2024-04-10 02:53:12', 4),
(21, 'AhmedElMaghribi', 'ahmed@example.ma', 'password1', '2024-04-18 20:42:56', 4),
(22, 'FatimaFassi', 'fatima@example.ma', 'password2', '2024-04-18 20:42:56', 4),
(23, 'YoussefRabat', 'youssef@example.ma', 'password3', '2024-04-18 20:42:56', 4),
(24, 'NadiaCasablanca', 'nadia@example.ma', 'password4', '2024-04-18 20:42:56', 4),
(25, 'KarimMarrakech', 'karim@example.ma', 'password5', '2024-04-18 20:42:56', 4),
(26, 'AminaTangier', 'amina@example.ma', 'password6', '2024-04-18 20:42:56', 4),
(27, 'HassanFez', 'hassan@example.ma', 'password7', '2024-04-18 20:42:56', 4),
(28, 'SaraAgadir', 'sara@example.ma', 'password8', '2024-04-18 20:42:56', 4),
(29, 'MehdiOujda', 'mehdi@example.ma', 'password9', '2024-04-18 20:42:56', 4),
(30, 'ZinebKenitra', 'zineb@example.ma', 'password10', '2024-04-18 20:42:56', 4),
(31, 'OmarTetouan', 'omar@example.ma', 'password11', '2024-04-18 20:42:56', 4),
(32, 'LailaRabat', 'laila@example.ma', 'password12', '2024-04-18 20:42:56', 4),
(33, 'MohamedCasablanca', 'mohamed@example.ma', 'password13', '2024-04-18 20:42:56', 4),
(34, 'SofiaMarrakech', 'sofia@example.ma', 'password14', '2024-04-18 20:42:56', 4),
(35, 'AbdullahTangier', 'abdullah@example.ma', 'password15', '2024-04-18 20:42:56', 4),
(36, 'HoudaFez', 'houda@example.ma', 'password16', '2024-04-18 20:42:56', 4),
(37, 'YassinAgadir', 'yassin@example.ma', 'password17', '2024-04-18 20:42:56', 4),
(39, 'ImaneKenitra', 'imane@example.ma', 'password19', '2024-04-18 20:42:56', 4),
(47, 'test', 'test67@test.com', 'test', '2024-04-26 16:42:08', 4),
(49, 'issam', 'issam@gmail.com', 'issam', '2024-05-12 18:14:48', 4),
(50, 'issam', 'issa', '', '2024-05-12 18:14:48', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tourist` (`id_tourist`);

--
-- Indexes for table `createur`
--
ALTER TABLE `createur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_admin_id` (`admin_id`);

--
-- Indexes for table `monument`
--
ALTER TABLE `monument`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `fk_createur_id` (`createur_id`);

--
-- Indexes for table `tourist`
--
ALTER TABLE `tourist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`id_admin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `createur`
--
ALTER TABLE `createur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `monument`
--
ALTER TABLE `monument`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tourist`
--
ALTER TABLE `tourist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id`);

--
-- Constraints for table `createur`
--
ALTER TABLE `createur`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`);

--
-- Constraints for table `monument`
--
ALTER TABLE `monument`
  ADD CONSTRAINT `fk_createur_id` FOREIGN KEY (`createur_id`) REFERENCES `createur` (`id`),
  ADD CONSTRAINT `monument_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);

--
-- Constraints for table `tourist`
--
ALTER TABLE `tourist`
  ADD CONSTRAINT `admin_id` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
