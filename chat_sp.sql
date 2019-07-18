-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)
--
-- Host: localhost    Database: chat
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `msgs`
--

DROP TABLE IF EXISTS `msgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `msgs` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_body` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `msg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_id`),
  KEY `fk_user_msg` (`user_id`),
  CONSTRAINT `msgs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgs`
--

LOCK TABLES `msgs` WRITE;
/*!40000 ALTER TABLE `msgs` DISABLE KEYS */;
INSERT INTO `msgs` VALUES (1,'message10',2,'2019-07-17 09:58:35'),(2,'message10',2,'2019-07-17 09:59:04'),(3,'message1',2,'2019-07-17 09:59:40'),(5,'message1',2,'2019-07-17 10:05:51'),(6,'message2',5,'2019-07-17 10:05:51'),(7,'message5',4,'2019-07-17 10:05:51'),(8,'message4',2,'2019-07-17 10:05:51'),(9,'message5',5,'2019-07-17 10:05:51'),(10,'message6',4,'2019-07-17 10:05:51'),(11,'message7',2,'2019-07-17 10:05:51'),(12,'message9',5,'2019-07-17 10:05:51'),(13,'message10',4,'2019-07-17 10:05:51'),(14,'message1',2,'2019-07-17 10:05:51'),(15,'message2',5,'2019-07-17 10:05:51'),(16,'message5',4,'2019-07-17 10:05:51'),(17,'message4',2,'2019-07-17 10:05:51'),(18,'message5',5,'2019-07-17 10:05:51'),(19,'message6',4,'2019-07-17 10:05:51'),(20,'message7',2,'2019-07-17 10:05:51'),(21,'message9',4,'2019-07-17 10:05:51'),(22,'message10',2,'2019-07-17 10:05:51'),(23,'message1',5,'2019-07-17 10:05:51'),(24,'message2',4,'2019-07-17 10:05:51'),(25,'message5',2,'2019-07-17 10:05:51'),(26,'message4',5,'2019-07-17 10:05:51'),(27,'message5',4,'2019-07-17 10:05:51'),(28,'message6',2,'2019-07-17 10:05:51'),(29,'message7',5,'2019-07-17 10:05:51'),(30,'message9',4,'2019-07-17 10:05:51'),(31,'message10',2,'2019-07-17 10:05:51'),(32,'le premier message du chat',5,'2019-07-17 10:23:56'),(33,'le premier message du chat',5,'2019-07-17 10:32:24'),(36,'bobolbobobobob',5,'2019-07-17 10:37:34'),(37,'un autre message',8,'2019-07-17 10:47:59'),(38,'sdkksfksmldfkml',10,'2019-07-18 12:12:23'),(39,'msdfksfslfksmfksmlfksdflksdmlfksmlf',8,'2019-07-18 13:12:13'),(40,'msdfksfslfksmfksmlfksdflksdmlfksmlf',12,'2019-07-18 13:12:49'),(41,'sjkfsklfjgdfkljdfkljdklfjklgjkljgklf',8,'2019-07-18 13:32:02'),(42,'sjkfsklfjgdfkljdfkljdklfjklgjkljgklf',13,'2019-07-18 13:32:24'),(43,'sdmsdl √πflfk √πmlgdmk k g√πdfmlgk √πkd √πfklkl',14,'2019-07-18 14:07:07');
/*!40000 ALTER TABLE `msgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(70) NOT NULL,
  `user_pwd` blob NOT NULL,
  `user_status` tinyint(1) NOT NULL DEFAULT '1',
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name_unique` (`user_name`),
  UNIQUE KEY `user_email_unique` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user_name','user_email',_binary 'µ#¡∂\«Eπç\Á3b\…\‚≥',1,'2019-07-11 10:06:03'),(2,'patrick','patrick@gmail.com',_binary '\5>y9∏âæ?£\Í|\ﬂ',1,'2019-07-11 11:24:17'),(4,'francois','francois@gmail.com',_binary '\ÏhiEªPèo~∑æ7`¢',1,'2019-07-11 11:26:32'),(5,'jeff','jeff@gmail.com',_binary 'f3e731dfa293c7a83119d8aacfa41b5d2d780be9',1,'2019-07-11 12:00:21'),(6,'jacques','jacques.martin@gmail.com',_binary '05973a9b46bc1925d4e0314d9e005859ebf273ea',1,'2019-07-16 14:02:40'),(7,'martin','jacque@gmail.com',_binary '05973a9b46bc1925d4e0314d9e005859ebf273ea',1,'2019-07-16 14:03:21'),(8,'paulino','paulini@gmail.com',_binary '5413619e9c585d51e65bb71caf9dc5b52432ce26',1,'2019-07-16 14:45:28'),(9,'xavier','xaviere@gmail.com',_binary '402f589227669e58c0fcbd6e310f6c7ed68d95c7',1,'2019-07-18 08:25:43'),(10,'frederic','fredericque@gmail.com',_binary '58692fd42329d32571d999fbcdd2ddd08a5186db',1,'2019-07-18 08:29:38'),(11,'didiero','didier@gmail.com',_binary '65d0f74bf4e86747987eb7d8353e2423639501dc',1,'2019-07-18 09:05:00'),(12,'0','johnny@gmail.com',_binary 'b6589fc6ab0dc82cf12099d1c2d40ab994e8410c',1,'2019-07-18 09:20:44'),(13,'rolande','rolande@gmail.com',_binary '7ae812b2c0f056de38a30efca82cb5db4c642a3f',0,'2019-07-18 09:49:15'),(14,'fabienne','fabienne@gmail.com',_binary '3d5037bb5bc4554d627e736fd9781508b6b3b5a2',1,'2019-07-18 13:53:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'chat'
--
/*!50003 DROP PROCEDURE IF EXISTS `spAuthenticateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spAuthenticateUser`(
IN p_user_name varchar(70),
IN p_user_pwd varchar(70)
)
BEGIN

SELECT user_id, user_name FROM users WHERE user_name = p_user_name and user_pwd = sha1(p_user_pwd) AND user_status = 1
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spCreateUser`(
IN p_user_name varchar(70),
IN p_user_pwd varchar(70),
IN p_user_email varchar(70)
)
BEGIN

IF ( SELECT EXISTS (SELECT 1 FROM users WHERE user_name = p_user_name OR user_email = p_user_email) ) THEN

    SELECT 'utilisateur existe deja !!';

ELSE
	IF p_user_email NOT REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' THEN
	
        SIGNAL SQLSTATE VALUE '45000'
		SET MESSAGE_TEXT= ' adresse email non valide';
        
	ELSE
		
        INSERT IGNORE INTO users
		(
			user_name,
			user_pwd,
			user_email
		)
		VALUES
		(
			p_user_name,
			sha1(p_user_pwd),
			p_user_email
		);
		COMMIT;
	END IF;
    
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDeleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spDeleteUser`(
IN p_user_name varchar(70),
IN p_user_pwd varchar(70)
)
BEGIN

	UPDATE users
	SET user_status = 0
	WHERE user_name = p_user_name and user_pwd = sha1(p_user_pwd);
    COMMIT;
    SELECT user_id, user_name, user_status FROM users WHERE user_name = p_user_name and user_pwd = sha1(p_user_pwd);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spGetAllUsers`(IN p_user_status INT)
BEGIN
	SELECT user_id, user_name, user_email FROM users WHERE user_status = p_user_status;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLastTenMessages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spGetLastTenMessages`(IN p_user_id INT)
BEGIN
    
	IF ( SELECT EXISTS (SELECT user_id FROM users WHERE user_id = p_user_id AND user_status = 1) ) THEN
    
		SELECT user_name, msg_body FROM msgs NATURAL JOIN users ORDER BY msg_id DESC LIMIT 10 ;
        
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spGetUser`(IN p_user_id INT)
BEGIN
SELECT user_id, user_name, user_email FROM users WHERE user_id = p_user_id AND user_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPostMessage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spPostMessage`(
IN p_user_id INT,
IN p_msg_body TEXT
)
BEGIN

IF ( SELECT EXISTS (SELECT user_id FROM users WHERE user_id = p_user_id)) THEN
	IF p_msg_body NOT LIKE '' THEN
	
		INSERT INTO msgs
		(
			user_id,
			msg_body
		)
		VALUES
		(
			p_user_id,
			p_msg_body
		);
        
		COMMIT;
        
	ELSE
    
    SELECT 'msg_body non valide';
    
	END IF;

ELSE

    SELECT 'user_id non valide';
    
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`chat`@`localhost` PROCEDURE `spUpdateUser`(
IN p_user_id INT,
IN p_user_name varchar(70),
IN p_user_pwd varchar(70),
IN p_user_email varchar(70),
IN p_user_name_new varchar(70),
IN p_user_pwd_new varchar(70),
IN p_user_email_new varchar(70)

)
BEGIN

	IF ( SELECT EXISTS (SELECT 1 FROM users WHERE user_name = p_user_name AND user_email = p_user_email AND user_pwd = sha1(p_user_pwd) AND user_status = 1 AND user_id = p_user_id) ) THEN

		IF p_user_name_new NOT LIKE '0' AND p_user_name_new NOT LIKE '' THEN
			UPDATE IGNORE users
			SET user_name = p_user_name_new
			WHERE user_status = 1 AND user_id = p_user_id;
			COMMIT;
			SELECT user_id, user_name, user_status FROM users WHERE user_status = 1 AND user_id = p_user_id;
		END IF;

		IF p_user_pwd_new NOT LIKE '0' AND p_user_pwd_new NOT LIKE '' THEN
			UPDATE users
			SET user_pwd = sha1(p_user_pwd_new)
			WHERE user_status = 1 AND user_id = p_user_id;
			COMMIT;
		   SELECT user_id, user_name, user_status FROM users WHERE user_status = 1 AND user_id = p_user_id;
		END IF;

		IF p_user_email_new NOT LIKE '0' AND p_user_email_new NOT LIKE '' THEN
			IF p_user_email_new NOT REGEXP '^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$' THEN
				SIGNAL SQLSTATE VALUE '45000'
				SET MESSAGE_TEXT= 'adresse email non valide';
			ELSE
				UPDATE IGNORE users
				SET user_email = p_user_email_new
				WHERE user_status = 1 AND user_id = p_user_id;
				COMMIT;
				SELECT user_id, user_name, user_status FROM users WHERE user_status = 1 AND user_id = p_user_id;
			END IF;
            
		END IF;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-18 16:22:06
