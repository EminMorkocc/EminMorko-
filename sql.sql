--
-- Structure of the table `forum_amis`
--

CREATE TABLE IF NOT EXISTS `forum_amis` (
  `ami_from` int(11) NOT NULL,
  `ami_to` int(11) NOT NULL,
  `ami_confirm` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ami_date` int(11) NOT NULL,
    PRIMARY KEY  (`ami_to`,`ami_from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- --------------------------------------------------------

--
-- Structure of the table `forum_announce`
--

CREATE TABLE IF NOT EXISTS `forum_announce` (
  `header` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `statut` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'on'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contents of the table `forum_announce`
--

INSERT INTO `forum_announce` (`header`, `message`, `color`, `statut`) VALUES
('Advert!', 'This is a customized message that can be disabled by the Admin.', 'info', 'on');

-- --------------------------------------------------------

--
-- Structure of the table `forum_automess`
--

CREATE TABLE IF NOT EXISTS `forum_automess` (
  `automess_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `automess_mess` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `automess_titre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY  (`automess_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;

--
-- Contents of the table `forum_automess`
--

INSERT INTO `forum_automess` (`automess_id`, `automess_mess`, `automess_titre`) VALUES
(1, 'Hello, this is an automatic reply generated by a Moderator or Administrator, the subject has been locked.', 'Topic is resolved so locked');

-- --------------------------------------------------------

--
-- Structure of the table `forum_categorie`
--

CREATE TABLE IF NOT EXISTS `forum_categorie` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_ordre` int(11) NOT NULL,
    PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_ordre` (`cat_ordre`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contents of the table `forum_categorie`
--

INSERT INTO `forum_categorie` (`cat_id`, `cat_nom`, `cat_ordre`) VALUES
(1, 'General', 10),
(2, 'Lorem', 20),
(3, 'Other', 30);

-- --------------------------------------------------------

--
-- Structure of the table `forum_config`
--

CREATE TABLE IF NOT EXISTS `forum_config` (
  `config_nom` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_valeur` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contents of the table `forum_config`
--

INSERT INTO `forum_config` (`config_nom`, `config_valeur`) VALUES
('forum_titre', 'Osiris'),
('forum_description', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
('forum_color', 'violet'),
('avatar_default', 'avatardefault.jpg'),
('avatar_maxsize', '40000'),
('avatar_maxh', '500'),
('avatar_maxl', '500'),
('sign_maxl', '200'),
('auth_bbcode_sign', 'non'),
('pseudo_maxsize', '15'),
('pseudo_minsize', '3'),
('topic_par_page', '15'),
('post_par_page', '10'),
('member_par_page', '15'),
('temps_flood', '15');

-- --------------------------------------------------------

--
-- Structure of the table `forum_forum`
--

CREATE TABLE IF NOT EXISTS `forum_forum` (
  `forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_cat_id` mediumint(8) NOT NULL,
  `forum_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forum_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `forum_ordre` mediumint(8) NOT NULL,
  `forum_last_post_id` int(11) NOT NULL,
  `forum_topic` mediumint(8) NOT NULL,
  `forum_post` mediumint(8) NOT NULL,
  `auth_view` tinyint(4) NOT NULL,
  `auth_post` tinyint(4) NOT NULL,
  `auth_topic` tinyint(4) NOT NULL,
  `auth_annonce` tinyint(4) NOT NULL,
  `auth_modo` tinyint(4) NOT NULL,
    PRIMARY KEY  (`forum_id`)
) ENGINE=MyISAM  AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contents of the table `forum_forum`
--

INSERT INTO `forum_forum` (`forum_id`, `forum_cat_id`, `forum_name`, `forum_desc`, `forum_ordre`, `forum_last_post_id`, `forum_topic`, `forum_post`, `auth_view`, `auth_post`, `auth_topic`, `auth_annonce`, `auth_modo`) VALUES
(1, 1, 'Presentation', 'New on the forum? Come and introduce yourself here!', 60, 0, 0, 0, 1, 2, 2, 3, 3),
(2, 1, 'The News', 'The news from the site are here', 50, 0, 0, 0, 1, 2, 2, 3, 3),
(3, 1, 'General Discussions', 'Here you can talk about everything on all subjects', 40, 0, 0, 0, 1, 2, 2, 3, 3),
(4, 2, 'Discussion forum 01', 'Lorem ipsum dolor sit amet...', 60, 0, 0, 0, 2, 2, 2, 3, 3),
(5, 2, 'Discussion forum 02', 'Lorem ipsum dolor sit amet...', 50, 0, 0, 0, 1, 2, 2, 3, 3),
(6, 3, 'Curabitur vestibulum', 'Etiam a finibus dui...', 60, 0, 0, 0, 1, 2, 2, 3, 3),
(7, 3, 'Donec vestibulum', 'Praesent bibendum mauris odio', 50, 0, 0, 0, 1, 2, 2, 3, 3);

-- --------------------------------------------------------

--
-- Structure of the table `forum_membres`
--

CREATE TABLE IF NOT EXISTS `forum_membres` (
  `membre_id` int(11) NOT NULL AUTO_INCREMENT,
  `membre_pseudo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_mdp` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_btag` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_siteweb` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_avatar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'avatardefault.jpg',
  `membre_signature` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_localisation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `membre_inscrit` int(11) NOT NULL,
  `membre_derniere_visite` int(11) NOT NULL,
  `membre_rang` tinyint(4) DEFAULT '2',
  `membre_post` int(11) NOT NULL,
  PRIMARY KEY (`membre_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;



-- --------------------------------------------------------

--
-- Structure of the table `forum_mp`
--

CREATE TABLE IF NOT EXISTS `forum_mp` (
  `mp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_expediteur` int(11) NOT NULL,
  `mp_receveur` int(11) NOT NULL,
  `mp_titre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_time` int(11) NOT NULL,
  `mp_lu` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY  (`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1;



-- --------------------------------------------------------

--
-- Structure of the table `forum_post`
--

CREATE TABLE IF NOT EXISTS `forum_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_createur` int(11) NOT NULL,
  `post_texte` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_time` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `post_forum_id` int(11) NOT NULL,
    PRIMARY KEY  (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure of the table `forum_topic`
--

CREATE TABLE IF NOT EXISTS `forum_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `forum_id` int(11) NOT NULL,
  `topic_titre` char(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_createur` int(11) NOT NULL,
  `topic_vu` mediumint(8) NOT NULL,
  `topic_time` int(11) NOT NULL,
  `topic_genre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_last_post` int(11) NOT NULL,
  `topic_first_post` int(11) NOT NULL,
  `topic_post` mediumint(8) NOT NULL,
  `topic_locked` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY  (`topic_id`),
  UNIQUE KEY `topic_last_post` (`topic_last_post`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure of the table `forum_topic_view`
--

CREATE TABLE IF NOT EXISTS `forum_topic_view` (
  `tv_id` int(11) NOT NULL,
  `tv_topic_id` int(11) NOT NULL,
  `tv_forum_id` int(11) NOT NULL,
  `tv_post_id` int(11) NOT NULL,
  `tv_poste` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY  (`tv_id`,`tv_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- --------------------------------------------------------

--
-- Structure of the table `forum_whosonline`
--

CREATE TABLE IF NOT EXISTS `forum_whosonline` (
  `online_id` int(11) NOT NULL,
  `online_time` int(11) NOT NULL,
  `online_ip` int(15) NOT NULL,
    PRIMARY KEY  (`online_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;