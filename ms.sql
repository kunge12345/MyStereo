-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: mystereo
-- ------------------------------------------------------
-- Server version	5.6.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mbid` varchar(45) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `releaseDate` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `summary` varchar(3000) DEFAULT NULL,
  `artistId` int(11) DEFAULT NULL,
  PRIMARY KEY (`albumId`),
  KEY `artistId_idx` (`artistId`),
  CONSTRAINT `artistId` FOREIGN KEY (`artistId`) REFERENCES `artist` (`artistId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (47,'The Very Best of Cher','6000ec97-993e-436c-8fde-5cfb7ba844b0','http://www.last.fm/music/Cher/The+Very+Best+of+Cher','    3 May 2005, 00:00','http://userserve-ak.last.fm/serve/174s/71997588.png','No Information Found!',101),(48,'Meteora','6d4734bf-6d00-43ec-ad1f-63c1a7c814c4','http://www.last.fm/music/Linkin+Park/Meteora','    25 Mar 2003, 00:00','http://userserve-ak.last.fm/serve/174s/52490659.png','Meteora is the second studio album by American rock band Linkin Park, released on March 25, 2003. Following the collaboration album Reanimation which featured remixes of their debut album Hybrid Theory. Linkin Park released singles from Meteora for over a year, including &quot;Somewhere I Belong&quot;, &quot;Faint&quot;, &quot;Lying from You&quot;, &quot;From the Inside&quot;, &quot;Breaking the Habit&quot; and &quot;Numb&quot;.  It is the most successful album in the history of the Modern Rock Tracks chart, a chart that specializes in radio play of alternative rock songs.',102);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `artistId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mbid` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `summary` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (101,'Cher','bfcc6d75-a6a5-4bc6-8282-47aec8531818','http://www.last.fm/music/Cher','http://userserve-ak.last.fm/serve/126/62360425.png','\n                Cher (born Cherilyn Sarkisian; May 20, 1946) is an Oscar - and Grammy- winning American singer and actress. A major figure for over five decades in the world of popular culture, she is often referred to as the Goddess of Pop for having first brought the sense of female autonomy and self-actualization into the entertainment industry.  She is known for her distinctive contralto and for having worked extensively across media, as well as for continuously reinventing both her music and image, the latter of which has been known to induce controversy. \n\n        <a href=\"http://www.last.fm/music/Cher\">Read more about Cher on Last.fm</a>.\n    \n    '),(102,'Linkin Park','f59c5520-5f46-4d2c-b2c4-822eabf53419','http://www.last.fm/music/Linkin+Park','http://userserve-ak.last.fm/serve/126/50034821.png','\n                Linkin Park is an American band from Agoura Hills, California. Formed in 1996, the band rose to international fame with their debut album, Hybrid Theory, which was certified Diamond by the RIAA in 2005 and multi-platinum in several other countries. Its following studio album, Meteora, continued the band\'s success, topping the Billboard 200 album chart in 2003, and was followed by extensive touring and charity work around the world. In 2003, MTV2 named Linkin Park the sixth greatest band of the music video era and the third best of the new millennium behind <a href=\"http://www.last.fm/music/Oasis\" class=\"bbcode_artist\">Oasis</a> and <a href=\"http://www.last.fm/music/Coldplay\" class=\"bbcode_artist\">Coldplay</a>. \n\n        <a href=\"http://www.last.fm/music/Linkin+Park\">Read more about Linkin Park on Last.fm</a>.\n    \n    ');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `uId` int(11) DEFAULT NULL,
  `msId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c2u_idx` (`uId`),
  KEY `c2m_idx` (`msId`),
  CONSTRAINT `c2m` FOREIGN KEY (`msId`) REFERENCES `music` (`msid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `c2u` FOREIGN KEY (`uId`) REFERENCES `user` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `follow` int(11) DEFAULT NULL,
  `followed` int(11) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `follow_idx` (`follow`),
  KEY `followed_idx` (`followed`),
  CONSTRAINT `follow` FOREIGN KEY (`follow`) REFERENCES `user` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `followed` FOREIGN KEY (`followed`) REFERENCES `user` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (2,2,1),(3,2,3),(4,4,2);
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `msid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mbid` varchar(45) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `albumId` int(11) DEFAULT NULL,
  `summary` varchar(20480) DEFAULT NULL,
  PRIMARY KEY (`msid`),
  KEY `albumId_idx` (`albumId`),
  CONSTRAINT `albumId` FOREIGN KEY (`albumId`) REFERENCES `album` (`albumId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (45,'Believe','13194c93-89c6-4ab4-aaf2-15db5d73b74e','http://www.last.fm/music/Cher/_/Believe',47,'&quot;Believe&quot; is a Grammy Award winning global number one, Multi-Platinum Dance Song which served as the world-wide lead single for American singer Cher\'s twenty-third studio album Believe. It is noted for its use of a peculiar sound effect on the singer\'s vocals, which is referred to as the Cher effect today.  &quot;Believe&quot; was written by a number of writers including Paul Barry, Matt Gray, Brian Higgins, Stuart McLellan, Timothy Powell, and Steven Torch.'),(46,'Numb','22520b2e-f854-4aea-9e38-76e1caa7cd07','http://www.last.fm/music/Linkin+Park/_/Numb',48,'Overview\n &quot;Numb&quot; is the thirteenth and final song on the 2003 album <a title=\"Linkin Park - Meteora\" href=\"http://www.last.fm/music/Linkin+Park/Meteora\" class=\"bbcode_album\">Meteora</a> by the American nu metal band <a href=\"http://www.last.fm/music/Linkin+Park\" class=\"bbcode_artist\">Linkin Park</a>. It was released as album\'s third single. One of <a href=\"http://www.last.fm/music/Linkin+Park\" class=\"bbcode_artist\">Linkin Park</a>\'s most well known and popular tracks, &quot;Numb&quot; topped the Billboard Hot Modern Rock Tracks chart for 12 weeks. The song spent six weeks at the top of the chart in 2003 and six weeks in 2004, making it the only song in history to be the most successful song of the year on the Hot Modern Rock Tracks chart for two years.');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `pId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`pId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (12,'123',2),(13,'123',3),(14,'hahah',4),(15,'nc',4);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist2music`
--

DROP TABLE IF EXISTS `playlist2music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist2music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlistId` int(11) NOT NULL,
  `musicId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `playlist_idx` (`playlistId`),
  KEY `music_idx` (`musicId`),
  CONSTRAINT `music` FOREIGN KEY (`musicId`) REFERENCES `music` (`msid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `playlist` FOREIGN KEY (`playlistId`) REFERENCES `playlist` (`pId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist2music`
--

LOCK TABLES `playlist2music` WRITE;
/*!40000 ALTER TABLE `playlist2music` DISABLE KEYS */;
INSERT INTO `playlist2music` VALUES (24,14,45),(30,14,46),(32,12,45);
/*!40000 ALTER TABLE `playlist2music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `description` varchar(10250) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uId`),
  UNIQUE KEY `userName_UNIQUE` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aloha','gggg','male','123','user'),(2,'1','1','female','123','admin'),(3,'a','a','male','asd','user'),(4,'123','123','male','ewqewe','user'),(5,'','','male','','user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-27 11:53:22
