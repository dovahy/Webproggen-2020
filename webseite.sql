-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2020 at 11:31 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webseite`
--

-- --------------------------------------------------------

--
-- Table structure for table `agenre`
--

CREATE TABLE `agenre` (
  `genreid` int(11) NOT NULL,
  `genre` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agenre`
--

INSERT INTO `agenre` (`genreid`, `genre`) VALUES
(1, 'Action'),
(2, 'Drama'),
(3, 'Sci-Fi'),
(4, 'Comedy'),
(5, 'Adventure'),
(6, 'Slice of Life');

-- --------------------------------------------------------

--
-- Table structure for table `anime`
--

CREATE TABLE `anime` (
  `NUM` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT '',
  `TYPE` varchar(6) DEFAULT '',
  `EP` int(11) NOT NULL,
  `STUDIO` varchar(30) DEFAULT '',
  `SEASON` varchar(7) DEFAULT '',
  `YEAR` int(11) DEFAULT 0,
  `STATUS` varchar(50) DEFAULT '',
  `SYN` varchar(5000) DEFAULT '',
  `IMG` varchar(270) DEFAULT '',
  `SOURCE` varchar(20) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anime`
--

INSERT INTO `anime` (`NUM`, `NAME`, `TYPE`, `EP`, `STUDIO`, `SEASON`, `YEAR`, `STATUS`, `SYN`, `IMG`, `SOURCE`) VALUES
(1, 'Cowboy Bebop', 'TV', 26, 'Sunrise', 'Spring', 1998, 'Finished Airing', 'In the year 2071, humanity has colonized several of the planets and moons of the solar system leaving the now uninhabitable surface of planet Earth behind. The Inter Solar System Police attempts to keep peace in the galaxy, aided in part by outlaw bounty hunters, referred to as \"Cowboys.\" The ragtag team aboard the spaceship Bebop are two such individuals.\r\n\r\nMellow and carefree Spike Spiegel is balanced by his boisterous, pragmatic partner Jet Black as the pair makes a living chasing bounties and collecting rewards. Thrown off course by the addition of new members that they meet in their travels Ein, a genetically engineered, highly intelligent Welsh Corgi; femme fatale Faye Valentine, an enigmatic trickster with memory loss; and the strange computer whiz kid Edward Wong the crew embarks on thrilling adventures that unravel each member\'s dark and mysterious past little by little.\r\n\r\nWell balanced with high density action and light hearted comedy, Cowboy Bebop is a space Western classic and an homage to the smooth and improvised music it is named after.\r\n', 'img/cowboyb.png', 'Original'),
(2, 'Fullmetal Alchemist', 'TV', 51, 'Bones', 'Fall', 2003, 'Finished Airing', 'Edward Elric, a young, brilliant alchemist, has lost much in his twelve-year life: when he and his brother Alphonse try to resurrect their dead mother through the forbidden act of human transmutation, Edward loses his brother as well as two of his limbs. With his supreme alchemy skills, Edward binds Alphonse\'s soul to a large suit of armor.\r\n\r\nA year later, Edward, now promoted to the fullmetal alchemist of the state, embarks on a journey with his younger brother to obtain the Philosopher\'s Stone. The fabled mythical object is rumored to be capable of amplifying an alchemist\'s abilities by leaps and bounds, thus allowing them to override the fundamental law of alchemy: to gain something, an alchemist must sacrifice something of equal value. Edward hopes to draw into the military\'s resources to find the fabled stone and restore his and Alphonse\'s bodies to normal. However, the Elric brothers soon discover that there is more to the legendary stone than meets the eye, as they are led to the epicenter of a far darker battle than they could have ever imagined.', 'img/fullalch.png', 'Manga'),
(3, 'Darker than Black', 'TV', 25, 'Bones', 'Spring', 2007, 'Finished Airing', 'It has been 10 years since Heaven\'s Gate appeared in South America and Hells Gate appeared in Japan, veiling the once familiar night sky with an oppressive skyscape. Their purposes unknown, these Gates are spaces in which the very laws of physics are ignored. With the appearance of the Gates emerged Contractors, who, in exchange for their humanity, are granted supernatural abilities.\r\n\r\nIn the Japanese city surrounding Hells Gate, Section 4 Chief Misaki Kirihara finds herself at odds with an infamous Contractor codenamed Hei. Called \"Black Reaper\" in the underground world, Hei, like his associates, undertakes missions for the mysterious and ruthless Syndicate while slowly peeling back the dark layers covering a nefarious plot that threatens the very existence of Contractors.\r\n\r\nFrom the mind of Tensai Okamura comes a sci-fi thriller taking the form of a subtle expose on a war in which political positions and justice have no sway a war waged exclusively in the shadows.\r\n', 'img/dtb.png', 'Original'),
(4, 'Baccano!', 'TV', 13, 'Brains Base', 'Summer', 2007, 'Finished Airing', 'During the early 1930s in Chicago, the transcontinental train, Flying Pussyfoot, is starting its legendary journey that will leave a trail of blood all over the country. At the same time in New York, the ambitious scientist Szilard and his unwilling aide Ennis are looking for missing bottles of the immortality elixir. In addition, a war between the mafia groups is getting worse. On board the Advena Avis, in 1711, alchemists are about to learn the price of immortality.\r\n\r\nBased on the award-winning light novels of the same name, Baccano! follows several events that initially seem unrelated, both in time and place, but are part of a much bigger story—one of alchemy, survival, and immortality. Merging these events together are the kindhearted would-be thieves, Isaac and Miria, connecting various people, all of them with their own hidden ambitions and agendas, and creating lifelong bonds and consequences for everyone involved.\r\n', 'img/baccano.png', 'Light novel'),
(5, 'Phantom: Requiem for the Phantom', 'TV', 26, 'Bee Train', 'Spring', 2009, 'Finished Airing', 'Mafia is rife in America where assassinations are a regular occurrence on the streets. Inferno, a mysterious company, is behind most of these dealings through the use of their near-invincible human weapon, \"Phantom.\"\r\n\r\nOne day, a Japanese tourist accidentally witnesses Phantom\'s latest murder. Desperate to escape, the tourist hides in a secluded building. However, Phantom, revealed to be a young woman named Ein, and the leader of Inferno \"Scythe Master\" captures the tourist and brainwashes him.\r\n\r\nGiven the name \"Zwei,\" this once peaceful tourist is now a puppet of Inferno with no memories. Drawn into a world of lies, deceit, and violence, Zwei must fight to survive, hopefully to one day regain his memories and escape from this world where he is constantly on the brink of death.', 'img/phantom.png', 'Visual Novel'),
(6, 'Ergo Proxy', 'TV', 23, 'Manglobe', 'Winter', 2006, 'Finished Airing', 'Within the domed city of Romdo lies one of the last human civilizations on Earth. Thousands of years ago, a global ecological catastrophe doomed the planet; now, life outside these domes is virtually impossible. To expedite mankind\'s recovery, \"AutoReivs,\" humanoid-like robots, have been created to assist people in their day-to-day lives. However, AutoReivs have begun contracting an enigmatic disease called the \"Cogito Virus\" which grants them self-awareness. Re-l Mayer, granddaughter of Romdo\'s ruler, is assigned to investigate this phenomenon alongside her AutoReiv partner Iggy. But what begins as a routine investigation quickly spirals into a conspiracy as Re-l is confronted by humanity\'s darkest sins.\r\n\r\nElsewhere in Romdo, an AutoReiv specialist by the name of Vincent Law must also face his demons when surreal events begin occurring around him. Re-l, Iggy, Vincent, and the child AutoReiv named Pino, will form an unlikely faction as they struggle to uncover Romdo\'s mysteries and ultimately, discover the true purpose of the mythical beings called \"Proxies.\"', 'img/ergo.png', 'Original'),
(7, 'Hunter x Hunter (2011)', 'TV', 148, 'Madhouse', 'Fall', 2011, 'Finished Airing', 'Hunter x Hunter is set in a world where Hunters exist to perform all manner of dangerous tasks like capturing criminals and bravely searching for lost treasures in uncharted territories. Twelve-year-old Gon Freecss is determined to become the best Hunter possible in hopes of finding his father, who was a Hunter himself and had long ago abandoned his young son. However, Gon soon realizes the path to achieving his goals is far more challenging than he could have ever imagined.\r\n\r\nAlong the way to becoming an official Hunter, Gon befriends the lively doctor-in-training Leorio, vengeful Kurapika, and rebellious ex-assassin Killua. To attain their own goals and desires, together the four of them take the Hunter Exam, notorious for its low success rate and high probability of death. Throughout their journey, Gon and his friends embark on an adventure that puts them through many hardships and struggles. They will meet a plethora of monsters, creatures, and characters—all while learning what being a Hunter truly means.', 'img/hunter.png', 'Manga'),
(8, 'Dr. Stone', 'TV', 24, 'TMS', 'Summer', 2019, 'Finished Airing', 'After five years of harboring unspoken feelings, high-schooler Taiju Ooki is finally ready to confess his love to Yuzuriha Ogawa. Just when Taiju begins his confession however, a blinding green light strikes the Earth and petrifies mankind around the world turning every single human into stone.\r\n\r\nSeveral millennia later, Taiju awakens to find the modern world completely nonexistent, as nature has flourished in the years humanity stood still. Among a stone world of statues, Taiju encounters one other living human: his science-loving friend Senkuu, who has been active for a few months. Taiju learns that Senkuu has developed a grand scheme to launch the complete revival of civilization with science. Taiju\'s brawn and Senkuu\'s brains combine to forge a formidable partnership, and they soon uncover a method to revive those petrified.\r\n\r\nHowever, Senkuu\'s master plan is threatened when his ideologies are challenged by those who awaken. All the while, the reason for mankind\'s petrification remains unknown.\r\n', 'img/stone.png', 'Manga'),
(9, 'Jujutsu Kaisen', 'TV', 25, 'Mappa', 'Fall', 2020, 'Currently Airing', 'In a world where demons feed on unsuspecting humans, fragments of the legendary and feared demon Ryoumen Sukuna were lost and scattered about. Should any demon consume Sukuna\'s body parts, the power they gain could destroy the world as we know it. Fortunately, there exists a mysterious school of Jujutsu Sorcerers who exist to protect the precarious existence of the living from the undead!\r\n\r\nYuuji Itadori is high schooler who spends his days visiting his bedridden grandfather. Although he looks like your average teenager, his immense physical strength is something to behold! Every sports club wants him to join, but Itadori would rather hang out with the school outcasts in the Occult Club. One day, the club manages to get their hands on a sealed cursed object, but little do they know the terror they\'ll unleash when they break the seal... ', 'img/juju.png', 'Manga'),
(10, 'Golden Kamuy 3rd Season', 'TV', 12, 'Geno', 'Fall', 2020, 'Not yet aired', 'Third season of Golden Kamuy. ', 'img/kamuy3.png', 'Manga'),
(11, 'Jin-Rou', 'Movie', 1, 'Production I.G', 'Summer', 2000, 'Finished Airing', 'After witnessing the suicide bombing of a terrorist girl, Constable Kazuki Fuse becomes haunted by her image, and is forced to undergo retraining for his position in the Capital Police\'s Special Unit. However, unknown to him, he becomes a key player in a dispute between Capital and Local Police forces, as he finds himself increasingly involved with the sister of the very girl he saw die.', 'img/rou.png', 'Manga'),
(12, 'Dorohedoro', 'TV', 12, 'Mappa', 'Winter', 2020, 'Finished Airing', 'Hole a dark, decrepit, and disorderly district where the strong prey on the weak and death is an ordinary occurrence—is all but befitting of the name given to it. A realm separated from law and ethics, it is a testing ground to the magic users who dominate it. As a race occupying the highest rungs of their society, the magic users think of the denizens of Hole as no more than insects. Murdered, mutilated, and made experiments without a second thought, the powerless Hole dwellers litter the halls of Hole\'s hospital on a daily basis.\r\n\r\nPossessing free access to and from the cesspool, and with little challenge to their authority, the magic users appear indomitable to most—aside for a few. Kaiman, more reptile than man, is one such individual. He hunts them on a heedless quest for answers with only a trusted pair of bayonets and his immunity to magic. Cursed by his appearance and tormented by nightmares, magic users are his only clue to restoring his life to normal. With his biggest obstacle being his stomach, his female companion Nikaidou, who runs the restaurant Hungry Bug, is his greatest ally.\r\n\r\nSet in a gritty world of hellish design, Dorohedoro manages a healthy blend of comedy and lightheartedness with death and carnage. Taking plenty of twists and turns while following the lives of Hole\'s residents, it weaves a unique world of unearthly origin and dreary appearance not for the squeamish or easily disturbed.\r\n', 'img/doro.png', 'Manga'),
(13, 'Trigun', 'TV', 26, 'Madhouse', 'Spring', 1998, 'Finished Airing', 'Vash the Stampede is the man with a $$60,000,000,000 bounty on his head. The reason: he\'s a merciless villain who lays waste to all those that oppose him and flattens entire cities for fun, garnering him the title \"The Humanoid Typhoon.\" He leaves a trail of death and destruction wherever he goes, and anyone can count themselves dead if they so much as make eye contact—or so the rumors say. In actuality, Vash is a huge softie who claims to have never taken a life and avoids violence at all costs.\r\n\r\nWith his crazy doughnut obsession and buffoonish attitude in tow, Vash traverses the wasteland of the planet Gunsmoke, all the while followed by two insurance agents, Meryl Stryfe and Milly Thompson, who attempt to minimize his impact on the public. But soon, their misadventures evolve into life-or-death situations as a group of legendary assassins are summoned to bring about suffering to the trio. Vash\'s agonizing past will be unraveled and his morality and principles pushed to the breaking point.\r\n', 'img/trigun.png', 'Manga'),
(14, 'Perfect Blue', 'Movie', 1, 'Madhouse', 'Winter', 1998, 'Finished Airing', 'J-pop idol group CHAM! has spent the last two years entertaining its fans. Sadly, all good things must come to an end, and CHAM! must see one of its members, Mima Kirigoe, leave the group to pursue her acting career. While Mima\'s choice is met with a mixed response, she hopes her fans will continue to support her.\r\n\r\nHowever, Mima\'s life begins to change drastically after her departure from the group. Wanting to shed her pop-idol image, she takes on a role in a crime drama series, and her career as an actress gradually becomes more demanding and taxing for both Mima and her manager, Rumi Hidaka. To add to Mima\'s growing unease, an obsessed fan who is incapable of accepting that Mima has quit being an innocent idol, begins stalking her; a new anonymous website begins to impersonate her life with intricate detail; and CHAM! also appears to be doing better without her. One by one, each disturbing development drives Mima to become increasingly unhinged and unable to distinguish reality from fantasy.\r\n', 'img/blue.png', 'Novel');

-- --------------------------------------------------------

--
-- Table structure for table `animegenre`
--

CREATE TABLE `animegenre` (
  `animegenreid` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `genreid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `animegenre`
--

INSERT INTO `animegenre` (`animegenreid`, `num`, `genreid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenre`
--
ALTER TABLE `agenre`
  ADD PRIMARY KEY (`genreid`);

--
-- Indexes for table `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`NUM`);

--
-- Indexes for table `animegenre`
--
ALTER TABLE `animegenre`
  ADD PRIMARY KEY (`animegenreid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
