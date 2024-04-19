-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 19 avr. 2024 à 15:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_moto_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Essai', 'essai'),
(2, 'Nouveauté', 'nouveaute'),
(3, 'World SBK', 'world-sbk'),
(4, 'Actualités', 'actualites'),
(5, 'Equipements', 'equipements');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `deleted_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `published_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `title`, `slug`, `image`, `content`, `created_at`, `updated_at`, `deleted_at`, `published_at`, `user_id`) VALUES
(16, 'Essai comparatif Kawasaki ZX-4RR / ZX-6R', 'Essai-comparatif-Kawasaki-ZX-4RR-ZX-6R', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Ninja_ZX-6R_GN1_STU__2_.png', 'Avec la ZX-4R et la ZX-6R, c’est le grand retour des hystériques des hauts régimes, des symphonies en turbine majeure. Kawasaki relance en effet sa fameuse ZX-6R et dévoile en même temps sa ZX-4RR, harpie de poche des circuits. Fan des screamers, vous pouvez de nouveau hurler de plaisir, avec le choix des armes et des pistardes. Essai...', '2024-04-15 14:38:33', '2024-04-15 14:38:33', NULL, '2024-04-15 14:38:33', 19),
(17, 'Kawasaki Z500', 'kawasaki-z500', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Z500_SE_RD1_STU__2_.png', 'Incontournable succès des ventes de Kawasaki sur le segment midsize dès son apparition en 2004, les roadsters midsize Z750 et ses descendantes Z800 et Z900 affolent les compteurs. Décliné en Z125 et Z400, le roadster se dote ainsi d’une famille à succès. Mais les petite-moyennes cylindrées du modèle ont désormais fort à faire avec une concurrence toujours plus pressante sur le marché A2. Après son Eliminator 500, le constructeur d’Akashi met à jour sa Z avec une évolution en version « 500 ». Deux déclinaisons sont disponibles, standard et SE. C’est cette dernière que nous emmenons dans l’arrière-pays d’Alicante (Espagne) sur un racé soigneusement choisi par la marque japonaise pour nous permettre de juger des qualités de son roadster de poche.', '2024-04-10 14:38:33', '2024-04-10 14:38:33', NULL, '2024-04-10 14:38:33', 20),
(18, 'Comparo roadsters Honda Hornet, Kawasaki Z650 et Yamaha MT-07', 'comparo-roadsters-honda-hornet-kawasaki-z650-et-yamaha-mt-07', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/23MY_Z650_GY1_STU__2_.png', 'Dans la catégorie roadster midsize, je demande la moto la plus vendue : et je nomme la Yamaha MT-07. Car la MT07 domine le segment depuis des années, avec encore 4.363 modèles vendus en 2022., loin devant une certaine Kawasaki Z650 à 1.316 modèles vendus, derrière même une certaine Honda CB650R. Et puis arrive la Honda CB750 Hornet à un tarif quasi identique, mais avec un moteur bien plus puissant. Peut-on encore parler de comparatif, tellement les différences sont grandes pour envisager un duel à armes égales ? Essai, vidéo à l\'appui des modèles, version A2 comprise.', '2024-04-12 14:38:33', '2024-04-12 14:38:33', NULL, '2024-04-12 14:38:33', 21),
(19, 'Essai moto Kawasaki Ninja 7 Hybrid', 'essai-moto-kawasaki-ninja-7-hybrid', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Ninja%207%20Hybrid_SL1_STU%20(1).001.png', 'On se demandait qui oserait en premier sortir une motorisation hybride sur une moto ou un scooter. Quoi de plus naturel qu\'un motoriste de renom, doublé d\'un constructeur sachant innover, soit à la pointe d’une nouvelle technologie ? C\'est donc Kawasaki qui s\'y colle et tâte le terrain au travers de cette première mondiale. Un terrain connu dans le monde automobile, dont Kawasaki ne fait d’ailleurs pas partie contrairement à Honda ou à Suzuki, mais un terrain totalement vierge dans l\'univers du deux roues motorisé de série. Kawasaki, c\'est aussi une « marque ». La River Marque, en l’occurrence, arborée par les modèles d\'exception. Et cette nouvelle Ninja 7 Hybrid la porte. Quant à savoir ce qu\'elle apporte, ou devrait apporter, voyons ensemble. Essai, vidéo incluse...', '2024-04-14 14:38:33', '2024-04-14 14:38:33', NULL, '2024-04-14 14:38:33', 21),
(20, 'Essai Kawasaki Versys 650', 'Essai-Kawasaki-Versys-650', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Versys_650_BK1_STU__2_.png', 'Bicylindre de 649 cm3, 69 chevaux, 210 kilos, version A2, \"euro5 ready\"', '2024-04-19 14:04:58', '2024-04-19 14:04:58', NULL, '2024-04-19 14:04:00', 20),
(21, 'Kawasaki Ninja H2R', 'Kawasaki-Ninja-H2R', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/19ZX1000Y_201GY3DRS1CG_A.png', '<h2>Le moteur 4 cylindres en ligne et son compresseur d&eacute;veloppent 300 chevaux</h2>\r\n\r\n<h3>Une version homologu&eacute;e pour la route sera d&eacute;voil&eacute;e &agrave; l&#39;EICMA</h3>\r\n\r\n<p>Cela fait maintenant plusieurs semaines que&nbsp;<a href=\"http://www.lerepairedesmotards.com/essais/essais-kawasaki.php\">Kawasaki</a>&nbsp;entretenait le suspens&nbsp;<a href=\"http://www.lerepairedesmotards.com/actualites/2014/actu_140901-kawasaki-ninja-h2.php\">autour de sa Ninja H2</a>, une sportive d&eacute;crite par le constructeur comme &quot;<a href=\"http://www.lerepairedesmotards.com/actualites/2014/actu_140909-kawasaki-ninja-h2-teasing.php\">d&eacute;passant les limites</a>&quot; et aliment&eacute;e par un compresseur.</p>\r\n\r\n<p>La marque n&#39;aura pas en effet pas l&eacute;sin&eacute; sur la performance puisque sa sportive atteint une puissance stratosph&eacute;rique de 300 chevaux, soit plus qu&#39;une machine d&#39;une MotoGP ! Pour l&#39;heure, Kawasaki vient de pr&eacute;senter la version piste de sa Ninja, la H2R et d&eacute;voilera une version homologu&eacute;e pour la route - &eacute;galement moiti&eacute; moins cher - &agrave; l&#39;occasion du Salon EICMA de Milan.</p>', '2024-04-19 14:41:14', '2024-04-19 14:41:14', NULL, '2024-04-19 14:40:00', 20),
(22, 'Essai moto Kawasaki Z H2', 'Essai-moto-Kawasaki-Z-H2', 'https://storage.kawasaki.eu/public/kawasaki.eu/en-EU/model/24MY_Z_H2_GY1_STU__3_.png', '<h2>Apocalypse 998</h2>\r\n\r\n<h3>4 cylindres &agrave; compresseur, 998 cm3, 200 cv, 137 Nm de couple, 239 kg, 17.099 euros</h3>\r\n\r\n<p>La Roadst&rsquo;&egrave;re, &eacute;poque r&eacute;chauff&eacute;e de la frise chronologique moto, a d&eacute;but&eacute; en 1993 avec la Ducati 900 Mostro, aimable vieillarde qui s&rsquo;approche aujourd&rsquo;hui des portes des collectionneurs. La Triumph T 301 l&rsquo;a suivi de pr&egrave;s, &eacute;vocation lointaine mais &eacute;l&eacute;gante des&nbsp;<a href=\"http://www.lerepairedesmotards.com/dossiers/definitions/cafe-racer.php\">caf&eacute; racers des ann&eacute;es 60</a>. Puis le surv&ecirc;t&rsquo; a surclass&eacute; le cuir, avec l&rsquo;arriv&eacute;e de la Suzuki Bandit 600 en 1995. La course &agrave; l&rsquo;&eacute;chalote s&rsquo;est emball&eacute;e &agrave; partir de l&agrave;. 600 Hornet et Fazer, Z 1000 et Z 750, Speed Triple etc. Les roadsters filent maintenant le train des sportives.</p>', '2024-04-19 15:28:56', '2024-04-19 15:28:56', NULL, '2024-04-19 15:27:00', 20);

-- --------------------------------------------------------

--
-- Structure de la table `post_category`
--

CREATE TABLE `post_category` (
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_category`
--

INSERT INTO `post_category` (`post_id`, `category_id`) VALUES
(20, 2),
(21, 2),
(22, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`) VALUES
(19, 'admin@moto.blog', '[\"ROLE_ADMIN\"]', '$2y$13$jI5dgek55tNrY.G3AAp0w.UjYUcEr/WIcX.c3fIqTqzD2dcKNK6Ge', 'Admin', 'Test'),
(20, 'reporter@moto.blog', '[\"ROLE_REPORTER\"]', '$2y$13$fliSYbhY.wvw/LakC.sXJ.kiX7aBf3VP1izmSaTjtYwi5efz12wmO', 'Reporter', 'Test'),
(21, 'user@moto.blog', '[\"ROLE_USER\"]', '$2y$13$YCTLopH4uaQCas6e9csjP.kaEu0e2t4QGTeZTvrY30RE14NaL7Gcm', 'User', 'Test');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_5A8A6C8D989D9B62` (`slug`),
  ADD KEY `IDX_5A8A6C8DA76ED395` (`user_id`);

--
-- Index pour la table `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`post_id`,`category_id`),
  ADD KEY `IDX_B9A190604B89032C` (`post_id`),
  ADD KEY `IDX_B9A1906012469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post_category`
--
ALTER TABLE `post_category`
  ADD CONSTRAINT `FK_B9A1906012469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B9A190604B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
