-- MySQL dump 10.13  Distrib 8.4.6, for Linux (x86_64)
--
-- Host: localhost    Database: luxur_dbever
-- ------------------------------------------------------
-- Server version	8.4.6

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `luxur_server`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `luxur_server` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `luxur_server`;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (1,'Piscina'),(2,'Gimnasio'),(3,'Parqueadero'),(4,'Zona BBQ'),(5,'Salón comunal'),(6,'Ascensor'),(7,'Jardín'),(8,'Zona infantil'),(9,'Terraza'),(10,'Balcón'),(11,'Sauna'),(12,'Turco'),(13,'Cancha de fútbol'),(14,'Cancha de baloncesto'),(15,'Cancha de tenis'),(16,'Ciclovía'),(17,'Sendero peatonal'),(18,'Zona de coworking'),(19,'Sala de cine'),(20,'Biblioteca'),(21,'Sala de juegos'),(22,'Billar'),(23,'Ping pong'),(24,'Jacuzzi'),(25,'Lago artificial'),(26,'Zona de camping'),(27,'Huerta comunitaria'),(28,'Paneles solares'),(29,'Seguridad 24h'),(30,'Portería'),(31,'Sistema de cámaras'),(32,'Wifi en zonas comunes'),(33,'Coworking al aire libre'),(34,'Pet friendly'),(35,'Lavandería'),(36,'Cafetería'),(37,'Minimarket'),(38,'Zona de reciclaje'),(39,'Taller de bicicletas'),(40,'Parque para mascotas'),(41,'Chimenea'),(42,'Zona de masajes'),(43,'Estudio de yoga'),(44,'Sala de conferencias'),(45,'Salón de eventos'),(46,'Zona de trote'),(47,'Cancha de squash'),(48,'Auditorio'),(49,'Restaurante'),(50,'Helipuerto'),(51,'Club house'),(52,'Campo de golf'),(53,'Playa privada'),(54,'Mirador'),(55,'Zona de picnic'),(56,'Horno de leña'),(57,'Kiosko social'),(58,'Rooftop'),(59,'Coworking privado'),(60,'Zona de arte'),(61,'Jardín'),(62,'Chimenea'),(63,'Cámaras de seguridad'),(64,'Garaje privado'),(65,'Sistema de casa inteligente'),(66,'Balcón'),(67,'Sala de juegos'),(68,'Bodega de vinos'),(69,'Techo verde'),(70,'Terraza en la azotea'),(71,'Sauna'),(72,'Baño turco'),(73,'Zona para mascotas'),(74,'Cocina exterior'),(75,'Sala de cine'),(76,'Parque infantil'),(77,'Espacio de co-working'),(78,'Parqueadero de bicicletas'),(79,'Piscina cubierta'),(80,'Parqueadero para visitantes'),(81,'Cancha de tenis'),(82,'Cancha de baloncesto'),(83,'Cancha de fútbol'),(84,'Pista de atletismo'),(85,'Biblioteca'),(86,'Sala de música'),(87,'Sala de meditación'),(88,'Muelle privado'),(89,'Helipuerto'),(90,'Vista panorámica'),(91,'Lavandería'),(92,'Cuarto de almacenamiento'),(93,'Paneles solares'),(94,'Zona de BBQ'),(95,'Salón comunal'),(96,'Sala de yoga'),(97,'Jardín interior'),(98,'Fuente de agua'),(99,'Servicio de conserjería'),(100,'Parqueadero con valet');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_evaluations`
--

DROP TABLE IF EXISTS `client_evaluations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_evaluations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `rating` int DEFAULT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_eval_client` (`client_id`),
  CONSTRAINT `fk_eval_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `client_evaluations_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_evaluations`
--

LOCK TABLES `client_evaluations` WRITE;
/*!40000 ALTER TABLE `client_evaluations` DISABLE KEYS */;
INSERT INTO `client_evaluations` VALUES (1,'Muy satisfecho con el servicio.',5,1),(2,'La propiedad estaba bien ubicada.',5,2),(3,'El precio me pareció algo alto.',3,3),(4,'Excelente atención por parte del propietario.',5,4),(5,'La visita fue rápida y clara.',4,5),(6,'El contrato fue transparente.',5,6),(7,'El pago fue sencillo de realizar.',4,7),(8,'El apartamento estaba en buen estado.',5,8),(9,'El agente fue poco puntual.',3,9),(10,'La casa cumplió con mis expectativas.',5,10),(11,'El vecindario es muy tranquilo.',4,11),(12,'El mantenimiento podría mejorar.',4,12),(13,'La zona es muy accesible.',4,13),(14,'Me gustó el diseño de la propiedad.',5,14),(15,'Demasiado ruido en los alrededores.',3,15),(16,'Excelente relación calidad-precio.',5,16),(17,'El proceso fue muy demorado.',3,17),(18,'Muy buena experiencia en general.',5,18),(19,'Los documentos fueron claros.',5,19),(20,'La propiedad no coincidía con las fotos.',3,20),(21,'La ubicación es estratégica.',5,21),(22,'El contrato fue flexible.',5,22),(23,'El precio estaba justificado.',4,23),(24,'Muy buen acompañamiento en la visita.',5,24),(25,'La zona no me pareció segura.',3,25),(26,'Recomiendo totalmente el servicio.',5,26),(27,'Los pagos fueron cómodos.',4,27),(28,'La propiedad tenía humedad.',3,28),(29,'Muy amables en la atención.',5,29),(30,'La visita fue muy completa.',4,30),(31,'La propiedad estaba mal mantenida.',3,31),(32,'El agente fue muy cordial.',5,32),(33,'Los trámites fueron rápidos.',5,33),(34,'El apartamento es moderno.',5,34),(35,'Demasiado tráfico en la zona.',3,35),(36,'Me encantó la distribución.',5,36),(37,'El pago fue complicado.',3,37),(38,'Muy profesionales en todo el proceso.',5,38),(39,'El barrio es muy bonito.',4,39),(40,'El contrato tenía cláusulas confusas.',3,40),(41,'Todo salió como esperaba.',5,41),(42,'El inmueble estaba limpio.',5,42),(43,'El agente no fue claro.',3,43),(44,'Recomiendo este servicio.',5,44),(45,'La zona es muy comercial.',4,45),(46,'Los pagos se adaptaron a mi presupuesto.',4,46),(47,'Demasiado tiempo de espera.',3,47),(48,'La propiedad tenía buenos acabados.',5,48),(49,'El propietario fue poco flexible.',3,49),(50,'Muy buen seguimiento postventa.',5,50),(51,'El lugar estaba en remodelación.',3,51),(52,'La zona es tranquila y segura.',5,52),(53,'El contrato fue justo.',5,53),(54,'El inmueble estaba sobrevalorado.',3,54),(55,'Me ayudaron en todo el proceso.',5,55),(56,'El transporte público es cercano.',4,56),(57,'El vecindario no era lo esperado.',3,57),(58,'Todo fue muy organizado.',5,58),(59,'Muy amables y atentos.',5,59),(60,'El pago fue seguro.',4,60),(61,'La propiedad estaba sucia.',3,61),(62,'Muy recomendable el servicio.',5,62),(63,'El precio era competitivo.',5,63),(64,'Falta de información inicial.',3,64),(65,'Muy satisfecho con la experiencia.',5,65),(66,'La zona tenía mucho ruido.',3,66),(67,'Buen acompañamiento en el proceso.',5,67),(68,'El contrato fue muy largo.',3,68),(69,'La casa tenía jardín bonito.',5,69),(70,'Excelente todo, sin problemas.',5,70),(71,'Muy satisfecho con la atención',5,71),(72,'El proceso fue rápido y confiable',4,72),(73,'Atención al cliente excelente',5,73),(74,'Hubo algunos retrasos en la respuesta',3,74),(75,'Muy buena experiencia en general',4,75),(76,'La información no fue clara',2,76),(77,'Excelente servicio, volvería a usarlo',5,77),(78,'El contrato tuvo algunos errores menores',3,78),(79,'Todo salió perfecto',5,79),(80,'Recomiendo ampliamente la empresa',5,80),(81,'La gestión fue aceptable, pero puede mejorar',3,81),(82,'Muy buena asesoría recibida',4,82),(83,'El tiempo de espera fue demasiado',2,83),(84,'Excelente acompañamiento en el proceso',5,84),(85,'Un poco complicado al inicio',3,85),(86,'La comunicación fue clara y oportuna',4,86),(87,'Muy satisfecho con el resultado final',5,87),(88,'Algunos detalles no fueron explicados',2,88),(89,'En general todo estuvo correcto',4,89),(90,'Excelente profesionalismo',5,90),(91,'El servicio fue un poco lento',3,91),(92,'Muy agradecido con el apoyo recibido',5,92),(93,'La asesoría no fue suficiente',2,93),(94,'Todo bien, sin complicaciones',4,94),(95,'Muy recomendable el servicio',5,95),(96,'El seguimiento podría ser mejor',3,96),(97,'Muy satisfecho con el trato recibido',5,97),(98,'Hubo confusión en algunos documentos',2,98),(99,'Buen servicio y trato cordial',4,99),(100,'Excelente en todos los aspectos',5,100);
/*!40000 ALTER TABLE `client_evaluations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Juan','Pérez','juan.perez1@email.com'),(2,'Laura','Martínez','laura.mtz2@email.com'),(3,'Pedro','Ramírez','pedro.ramirez3@email.com'),(4,'Sofía','García','sofia.garcia4@email.com'),(5,'Andrés','López','andres.lopez5@email.com'),(6,'Camila','Torres','camila.torres6@email.com'),(7,'Diego','Hernández','diego.hernandez7@email.com'),(8,'Valentina','Moreno','valentina.moreno8@email.com'),(9,'Felipe','Castro','felipe.castro9@email.com'),(10,'Isabella','Rojas','isabella.rojas10@email.com'),(11,'Daniel','Vargas','daniel.vargas11@email.com'),(12,'Mariana','Cárdenas','mariana.cardenas12@email.com'),(13,'Santiago','Suárez','santiago.suarez13@email.com'),(14,'Paula','Mendoza','paula.mendoza14@email.com'),(15,'Alejandro','Ortiz','alejandro.ortiz15@email.com'),(16,'Natalia','Guzmán','natalia.guzman16@email.com'),(17,'Mateo','Salazar','mateo.salazar17@email.com'),(18,'Gabriela','Patiño','gabriela.patino18@email.com'),(19,'Sebastián','Acosta','sebastian.acosta19@email.com'),(20,'Daniela','Mejía','daniela.mejia20@email.com'),(21,'Tomás','Reyes','tomas.reyes21@email.com'),(22,'Lucía','Muñoz','lucia.munoz22@email.com'),(23,'Emilio','Rivera','emilio.rivera23@email.com'),(24,'Ana','Jiménez','ana.jimenez24@email.com'),(25,'Simón','Herrera','simon.herrera25@email.com'),(26,'Carolina','Peña','carolina.pena26@email.com'),(27,'Martín','Romero','martin.romero27@email.com'),(28,'Juliana','Vega','juliana.vega28@email.com'),(29,'Esteban','Gallo','esteban.gallo29@email.com'),(30,'Claudia','Serrano','claudia.serrano30@email.com'),(31,'Camilo','Peralta','camilo.peralta31@email.com'),(32,'Valeria','Arias','valeria.arias32@email.com'),(33,'Hugo','Villalba','hugo.villalba33@email.com'),(34,'Elena','Santos','elena.santos34@email.com'),(35,'Ricardo','Quintero','ricardo.quintero35@email.com'),(36,'Ángela','Montoya','angela.montoya36@email.com'),(37,'Cristian','Rincón','cristian.rincon37@email.com'),(38,'Daniela','Nieves','daniela.nieves38@email.com'),(39,'Leonardo','Bermúdez','leonardo.bermudez39@email.com'),(40,'Adriana','Córdoba','adriana.cordoba40@email.com'),(41,'Mauricio','Parra','mauricio.parra41@email.com'),(42,'Tatiana','Ramos','tatiana.ramos42@email.com'),(43,'Nicolás','Beltrán','nicolas.beltran43@email.com'),(44,'Catalina','Molina','catalina.molina44@email.com'),(45,'Óscar','García','oscar.garcia45@email.com'),(46,'Sandra','Valdés','sandra.valdes46@email.com'),(47,'Fernando','Ortega','fernando.ortega47@email.com'),(48,'Diana','Forero','diana.forero48@email.com'),(49,'Julián','Guerrero','julian.guerrero49@email.com'),(50,'Carla','Martínez','carla.martinez50@email.com'),(51,'Iván','Salamanca','ivan.salamanca51@email.com'),(52,'Rosa','Cárdenas','rosa.cardenas52@email.com'),(53,'Jorge','Ramos','jorge.ramos53@email.com'),(54,'Álvaro','Lara','alvaro.lara54@email.com'),(55,'Clara','Vargas','clara.vargas55@email.com'),(56,'Pablo','Rey','pablo.rey56@email.com'),(57,'Marcela','Bustos','marcela.bustos57@email.com'),(58,'Hernán','Fonseca','hernan.fonseca58@email.com'),(59,'Liliana','Cuéllar','liliana.cuellar59@email.com'),(60,'Ramiro','Torres','ramiro.torres60@email.com'),(61,'Gloria','Martínez','gloria.martinez61@email.com'),(62,'Jaime','Durán','jaime.duran62@email.com'),(63,'Patricia','Londoño','patricia.londono63@email.com'),(64,'Rodrigo','Pardo','rodrigo.pardo64@email.com'),(65,'Luisa','Zamora','luisa.zamora65@email.com'),(66,'Ernesto','Salcedo','ernesto.salcedo66@email.com'),(67,'Teresa','Pérez','teresa.perez67@email.com'),(68,'Andrés','Sarmiento','andres.sarmiento68@email.com'),(69,'Verónica','Beltrán','veronica.beltran69@email.com'),(70,'Rafael','Cruz','rafael.cruz70@email.com'),(71,'Manuel','Benítez','manuel.benitez71@gmail.com'),(72,'Rosa','Delgado','rosa.delgado72@hotmail.com'),(73,'Héctor','Silva','hector.silva73@gmail.com'),(74,'Adriana','Navarro','adriana.navarro74@hotmail.com'),(75,'Francisco','Cortés','francisco.cortes75@gmail.com'),(76,'Marta','Pérez','marta.perez76@gmail.com'),(77,'Luis','Molina','luis.molina77@hotmail.com'),(78,'Silvia','Giraldo','silvia.giraldo78@gmail.com'),(79,'Álvaro','Montes','alvaro.montes79@gmail.com'),(80,'Lorena','Cano','lorena.cano80@hotmail.com'),(81,'Esteban','Soto','esteban.soto81@gmail.com'),(82,'Paola','Del Valle','paola.delvalle82@hotmail.com'),(83,'Julián','Osorio','julian.osorio83@gmail.com'),(84,'Natalia','Palacios','natalia.palacios84@hotmail.com'),(85,'Felipe','Cárdenas','felipe.cardenas85@gmail.com'),(86,'Claudia','Mejía','claudia.mejia86@gmail.com'),(87,'Andrés','Buitrago','andres.buitrago87@gmail.com'),(88,'Marcela','Quintana','marcela.quintana88@hotmail.com'),(89,'Mauricio','Camacho','mauricio.camacho89@gmail.com'),(90,'Liliana','Valencia','liliana.valencia90@hotmail.com'),(91,'Iván','Sierra','ivan.sierra91@gmail.com'),(92,'Gabriela','López','gabriela.lopez92@hotmail.com'),(93,'Diego','Fajardo','diego.fajardo93@gmail.com'),(94,'Patricia','Guzmán','patricia.guzman94@hotmail.com'),(95,'Ricardo','Mendoza','ricardo.mendoza95@gmail.com'),(96,'Carolina','Peña','carolina.pena96@hotmail.com'),(97,'Fernando','Torres','fernando.torres97@gmail.com'),(98,'Angela','Morales','angela.morales98@hotmail.com'),(99,'Óscar','Ruiz','oscar.ruiz99@gmail.com'),(100,'Sandra','Salazar','sandra.salazar100@hotmail.com');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_clients_audit` AFTER INSERT ON `clients` FOR EACH ROW INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
VALUES (
  NEW.id,
  'INSERT',
  NULL,
  JSON_OBJECT(
    'id', NEW.id,
    'first_name', NEW.first_name,
    'last_name', NEW.last_name,
    'email', NEW.email
  )
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_clients_audit` AFTER UPDATE ON `clients` FOR EACH ROW INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
VALUES (
  NEW.id,
  'UPDATE',
  JSON_OBJECT(
    'id', OLD.id,
    'first_name', OLD.first_name,
    'last_name', OLD.last_name,
    'email', OLD.email
  ),
  JSON_OBJECT(
    'id', NEW.id,
    'first_name', NEW.first_name,
    'last_name', NEW.last_name,
    'email', NEW.email
  )
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_clients_audit` AFTER DELETE ON `clients` FOR EACH ROW INSERT INTO clients_audit (client_id, actionClient, before_data, after_data)
VALUES (
  OLD.id,
  'DELETE',
  JSON_OBJECT(
    'id', OLD.id,
    'first_name', OLD.first_name,
    'last_name', OLD.last_name,
    'email', OLD.email
  ),
  NULL
) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clients_audit`
--

DROP TABLE IF EXISTS `clients_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint NOT NULL,
  `actionClient` enum('UPDATE','DELETE','INSERT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Admin',
  `before_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  CONSTRAINT `clients_audit_chk_1` CHECK (json_valid(`before_data`)),
  CONSTRAINT `clients_audit_chk_2` CHECK (json_valid(`after_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_audit`
--

LOCK TABLES `clients_audit` WRITE;
/*!40000 ALTER TABLE `clients_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bii_clients_audit_guard_insert` BEFORE INSERT ON `clients_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_clients_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en clients_audit solo permitido desde triggers de clients.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biu_clients_audit_block_update` BEFORE UPDATE ON `clients_audit` FOR EACH ROW SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'clients_audit es inmutable: UPDATE prohibido.' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bid_clients_audit_block_delete` BEFORE DELETE ON `clients_audit` FOR EACH ROW SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'clients_audit es inmutable: DELETE prohibido.' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contract_documents`
--

DROP TABLE IF EXISTS `contract_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `document` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contractdoc_contract` (`contract_id`),
  CONSTRAINT `fk_contractdoc_contract` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_documents`
--

LOCK TABLES `contract_documents` WRITE;
/*!40000 ALTER TABLE `contract_documents` DISABLE KEYS */;
INSERT INTO `contract_documents` VALUES (1,1,'Contrato_1.pdf'),(2,2,'Contrato_2.pdf'),(3,3,'Contrato_3.pdf'),(4,4,'Contrato_4.pdf'),(5,5,'Contrato_5.pdf'),(6,6,'Contrato_6.pdf'),(7,7,'Contrato_7.pdf'),(8,8,'Contrato_8.pdf'),(9,9,'Contrato_9.pdf'),(10,10,'Contrato_10.pdf'),(11,11,'Contrato_11.pdf'),(12,12,'Contrato_12.pdf'),(13,13,'Contrato_13.pdf'),(14,14,'Contrato_14.pdf'),(15,15,'Contrato_15.pdf'),(16,16,'Contrato_16.pdf'),(17,17,'Contrato_17.pdf'),(18,18,'Contrato_18.pdf'),(19,19,'Contrato_19.pdf'),(20,20,'Contrato_20.pdf'),(21,21,'Contrato_21.pdf'),(22,22,'Contrato_22.pdf'),(23,23,'Contrato_23.pdf'),(24,24,'Contrato_24.pdf'),(25,25,'Contrato_25.pdf'),(26,26,'Contrato_26.pdf'),(27,27,'Contrato_27.pdf'),(28,28,'Contrato_28.pdf'),(29,29,'Contrato_29.pdf'),(30,30,'Contrato_30.pdf'),(31,31,'Contrato_31.pdf'),(32,32,'Contrato_32.pdf'),(33,33,'Contrato_33.pdf'),(34,34,'Contrato_34.pdf'),(35,35,'Contrato_35.pdf'),(36,36,'Contrato_36.pdf'),(37,37,'Contrato_37.pdf'),(38,38,'Contrato_38.pdf'),(39,39,'Contrato_39.pdf'),(40,40,'Contrato_40.pdf'),(41,41,'Contrato_41.pdf'),(42,42,'Contrato_42.pdf'),(43,43,'Contrato_43.pdf'),(44,44,'Contrato_44.pdf'),(45,45,'Contrato_45.pdf'),(46,46,'Contrato_46.pdf'),(47,47,'Contrato_47.pdf'),(48,48,'Contrato_48.pdf'),(49,49,'Contrato_49.pdf'),(50,50,'Contrato_50.pdf'),(51,51,'Contrato_51.pdf'),(52,52,'Contrato_52.pdf'),(53,53,'Contrato_53.pdf'),(54,54,'Contrato_54.pdf'),(55,55,'Contrato_55.pdf'),(56,56,'Contrato_56.pdf'),(57,57,'Contrato_57.pdf'),(58,58,'Contrato_58.pdf'),(59,59,'Contrato_59.pdf'),(60,60,'Contrato_60.pdf'),(61,61,'Contrato_61.pdf'),(62,62,'Contrato_62.pdf'),(63,63,'Contrato_63.pdf'),(64,64,'Contrato_64.pdf'),(65,65,'Contrato_65.pdf'),(66,66,'Contrato_66.pdf'),(67,67,'Contrato_67.pdf'),(68,68,'Contrato_68.pdf'),(69,69,'Contrato_69.pdf'),(70,70,'Contrato_70.pdf'),(131,61,'Anexo de Propiedad 71'),(132,62,'Informe de Inspección 72'),(133,63,'Comprobante de Pago 73'),(134,64,'Anexo Fotográfico 74'),(135,65,'Contrato Escaneado 75'),(136,66,'Informe de Avalúo 76'),(137,67,'Comprobante de Pago 77'),(138,68,'Plano Arquitectónico 78'),(139,69,'Certificado de Tradición 79'),(140,70,'Contrato Escaneado 80'),(141,81,'Anexo de Propiedad 81'),(142,82,'Informe de Inspección 82'),(143,83,'Comprobante de Pago 83'),(144,84,'Anexo Fotográfico 84'),(145,85,'Contrato Escaneado 85'),(146,86,'Informe de Avalúo 86'),(147,87,'Comprobante de Pago 87'),(148,88,'Plano Arquitectónico 88'),(149,89,'Certificado de Tradición 89'),(150,90,'Contrato Escaneado 90'),(151,91,'Anexo de Propiedad 91'),(152,92,'Informe de Inspección 92'),(153,93,'Comprobante de Pago 93'),(154,94,'Anexo Fotográfico 94'),(155,95,'Contrato Escaneado 95'),(156,96,'Informe de Avalúo 96'),(157,97,'Comprobante de Pago 97'),(158,98,'Plano Arquitectónico 98'),(159,99,'Certificado de Tradición 99'),(160,100,'Contrato Escaneado 100');
/*!40000 ALTER TABLE `contract_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contract_property` (`property_id`),
  KEY `fk_contract_client` (`client_id`),
  CONSTRAINT `fk_contract_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_contract_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (1,1,'2022-01-10','2023-01-09',1),(2,2,'2022-02-15','2023-02-14',2),(3,3,'2022-03-01','2023-02-28',3),(4,4,'2022-04-05','2023-04-04',4),(5,5,'2022-05-12','2023-05-11',5),(6,6,'2022-06-20','2023-06-19',6),(7,7,'2022-07-01','2023-06-30',7),(8,8,'2022-08-18','2023-08-17',8),(9,9,'2022-09-10','2023-09-09',9),(10,10,'2022-10-01','2023-09-30',10),(11,11,'2022-11-15','2023-11-14',11),(12,12,'2022-12-01','2023-11-30',12),(13,13,'2023-01-10','2024-01-09',13),(14,14,'2023-02-05','2024-02-04',14),(15,15,'2023-03-12','2024-03-11',15),(16,16,'2023-04-01','2024-03-31',16),(17,17,'2023-05-09','2024-05-08',17),(18,18,'2023-06-20','2024-06-19',18),(19,19,'2023-07-01','2024-06-30',19),(20,20,'2023-08-14','2024-08-13',20),(21,21,'2023-09-01','2024-08-31',21),(22,22,'2023-10-10','2024-10-09',22),(23,23,'2023-11-05','2024-11-04',23),(24,24,'2023-12-01','2024-11-30',24),(25,25,'2024-01-10','2025-01-09',25),(26,26,'2024-02-15','2025-02-14',26),(27,27,'2024-03-01','2025-02-28',27),(28,28,'2024-04-12','2025-04-11',28),(29,29,'2024-05-20','2025-05-19',29),(30,30,'2024-06-01','2025-05-31',30),(31,31,'2024-07-05','2025-07-04',31),(32,32,'2024-08-12','2025-08-11',32),(33,33,'2024-09-01','2025-08-31',33),(34,34,'2024-10-15','2025-10-14',34),(35,35,'2024-11-01','2025-10-31',35),(36,36,'2024-12-10','2025-12-09',36),(37,37,'2022-01-15','2023-01-14',37),(38,38,'2022-02-20','2023-02-19',38),(39,39,'2022-03-05','2023-03-04',39),(40,40,'2022-04-18','2023-04-17',40),(41,41,'2022-05-10','2023-05-09',41),(42,42,'2022-06-01','2023-05-31',42),(43,43,'2022-07-12','2023-07-11',43),(44,44,'2022-08-25','2023-08-24',44),(45,45,'2022-09-14','2023-09-13',45),(46,46,'2022-10-05','2023-10-04',46),(47,47,'2022-11-20','2023-11-19',47),(48,48,'2022-12-01','2023-11-30',48),(49,49,'2023-01-18','2024-01-17',49),(50,50,'2023-02-22','2024-02-21',50),(51,51,'2023-03-10','2024-03-09',51),(52,52,'2023-04-05','2024-04-04',52),(53,53,'2023-05-15','2024-05-14',53),(54,54,'2023-06-01','2024-05-31',54),(55,55,'2023-07-20','2024-07-19',55),(56,56,'2023-08-08','2024-08-07',56),(57,57,'2023-09-12','2024-09-11',57),(58,58,'2023-10-01','2024-09-30',58),(59,59,'2023-11-18','2024-11-17',59),(60,60,'2023-12-05','2024-12-04',60),(61,61,'2024-01-15','2025-01-14',61),(62,62,'2024-02-20','2025-02-19',62),(63,63,'2024-03-08','2025-03-07',63),(64,64,'2024-04-12','2025-04-11',64),(65,65,'2024-05-22','2025-05-21',65),(66,66,'2024-06-10','2025-06-09',66),(67,67,'2024-07-18','2025-07-17',67),(68,68,'2024-08-05','2025-08-04',68),(69,69,'2024-09-15','2025-09-14',69),(70,70,'2024-10-01','2025-09-30',70),(81,81,'2025-01-10','2026-01-10',81),(82,82,'2025-01-15','2026-01-15',82),(83,83,'2025-01-20','2026-01-20',83),(84,84,'2025-02-01','2026-02-01',84),(85,85,'2025-02-05','2026-02-05',85),(86,86,'2025-02-12','2026-02-12',86),(87,87,'2025-02-20','2026-02-20',87),(88,88,'2025-03-01','2026-03-01',88),(89,89,'2025-03-05','2026-03-05',89),(90,90,'2025-03-12','2026-03-12',90),(91,91,'2025-03-18','2026-03-18',91),(92,92,'2025-04-01','2026-04-01',92),(93,93,'2025-04-07','2026-04-07',93),(94,94,'2025-04-15','2026-04-15',94),(95,95,'2025-04-20','2026-04-20',95),(96,96,'2025-05-01','2026-05-01',96),(97,97,'2025-05-05','2026-05-05',97),(98,98,'2025-05-12','2026-05-12',98),(99,99,'2025-05-20','2026-05-20',99),(100,100,'2025-06-01','2026-06-01',100);
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_contracts_audit` AFTER INSERT ON `contracts` FOR EACH ROW BEGIN
  SET @from_contracts_trigger = 1;

  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'property_id', NEW.property_id,
      'start_date', NEW.start_date,
      'end_date', NEW.end_date,
      'client_id', NEW.client_id
    )
  );

  SET @from_contracts_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_contracts_audit` AFTER UPDATE ON `contracts` FOR EACH ROW BEGIN
  SET @from_contracts_trigger = 1;

  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'property_id', OLD.property_id,
      'start_date', OLD.start_date,
      'end_date', OLD.end_date,
      'client_id', OLD.client_id
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'property_id', NEW.property_id,
      'start_date', NEW.start_date,
      'end_date', NEW.end_date,
      'client_id', NEW.client_id
    )
  );

  SET @from_contracts_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_contracts_audit` AFTER DELETE ON `contracts` FOR EACH ROW BEGIN
  SET @from_contracts_trigger = 1;

  INSERT INTO contracts_audit (contract_id, actionContract, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'property_id', OLD.property_id,
      'start_date', OLD.start_date,
      'end_date', OLD.end_date,
      'client_id', OLD.client_id
    ),
    NULL
  );

  SET @from_contracts_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contracts_audit`
--

DROP TABLE IF EXISTS `contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contracts_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint NOT NULL,
  `actionContract` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Admin',
  `before_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  CONSTRAINT `contracts_audit_chk_1` CHECK (json_valid(`before_data`)),
  CONSTRAINT `contracts_audit_chk_2` CHECK (json_valid(`after_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts_audit`
--

LOCK TABLES `contracts_audit` WRITE;
/*!40000 ALTER TABLE `contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bii_contracts_audit_guard_insert` BEFORE INSERT ON `contracts_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_contracts_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en contracts_audit solo permitido desde triggers de contracts.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biu_contracts_audit_block_update` BEFORE UPDATE ON `contracts_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'contracts_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bid_contracts_audit_block_delete` BEFORE DELETE ON `contracts_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'contracts_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES (1,'Carlos','Ramírez','carlos.ramirez@example.com'),(2,'María','Gómez','maria.gomez@example.com'),(3,'José','Martínez','jose.martinez@example.com'),(4,'Ana','Fernández','ana.fernandez@example.com'),(5,'Luis','Torres','luis.torres@example.com'),(6,'Laura','Hernández','laura.hernandez@example.com'),(7,'Pedro','Díaz','pedro.diaz@example.com'),(8,'Lucía','Moreno','lucia.moreno@example.com'),(9,'Miguel','Castro','miguel.castro@example.com'),(10,'Elena','Vargas','elena.vargas@example.com'),(11,'Andrés','Mendoza','andres.mendoza@example.com'),(12,'Patricia','Ruiz','patricia.ruiz@example.com'),(13,'Jorge','Jiménez','jorge.jimenez@example.com'),(14,'Isabel','Navarro','isabel.navarro@example.com'),(15,'Fernando','López','fernando.lopez@example.com'),(16,'Gabriela','Ortega','gabriela.ortega@example.com'),(17,'Raúl','Gutiérrez','raul.gutierrez@example.com'),(18,'Carmen','Soto','carmen.soto@example.com'),(19,'Héctor','Vega','hector.vega@example.com'),(20,'Rosa','Castillo','rosa.castillo@example.com'),(21,'Ricardo','Silva','ricardo.silva@example.com'),(22,'Paula','Ramos','paula.ramos@example.com'),(23,'Adrián','Cruz','adrian.cruz@example.com'),(24,'Marta','Aguilar','marta.aguilar@example.com'),(25,'Diego','Paredes','diego.paredes@example.com'),(26,'Claudia','Campos','claudia.campos@example.com'),(27,'Iván','Guerrero','ivan.guerrero@example.com'),(28,'Teresa','Flores','teresa.flores@example.com'),(29,'Álvaro','León','alvaro.leon@example.com'),(30,'Julia','Peña','julia.pena@example.com'),(31,'Sergio','Romero','sergio.romero@example.com'),(32,'Beatriz','Reyes','beatriz.reyes@example.com'),(33,'Óscar','Campos','oscar.campos@example.com'),(34,'Natalia','Figueroa','natalia.figueroa@example.com'),(35,'Francisco','Ponce','francisco.ponce@example.com'),(36,'Silvia','Ríos','silvia.rios@example.com'),(37,'Esteban','Mora','esteban.mora@example.com'),(38,'Lorena','Mejía','lorena.mejia@example.com'),(39,'Julián','Cordero','julian.cordero@example.com'),(40,'Daniela','Salazar','daniela.salazar@example.com'),(41,'Mauricio','Ibáñez','mauricio.ibanez@example.com'),(42,'Alejandra','Villalobos','alejandra.villalobos@example.com'),(43,'Gonzalo','Arroyo','gonzalo.arroyo@example.com'),(44,'Verónica','Esquivel','veronica.esquivel@example.com'),(45,'Eduardo','Durán','eduardo.duran@example.com'),(46,'Rafael','Cáceres','rafael.caceres@example.com'),(47,'Susana','Correa','susana.correa@example.com'),(48,'Felipe','Acosta','felipe.acosta@example.com'),(49,'Monica','Pérez','monica.perez@example.com'),(50,'Alfredo','Luna','alfredo.luna@example.com'),(51,'Carlos','Martinez','carlos.martinez@gmail.com'),(52,'Laura','Ramirez','laura.ramirez@hotmail.com'),(53,'Andres','Gonzalez','andres.gonzalez@gmail.com'),(54,'Maria','Fernandez','maria.fernandez@hotmail.com'),(55,'Julian','Torres','julian.torres@gmail.com'),(56,'Paola','Vargas','paola.vargas@hotmail.com'),(57,'Felipe','Castro','felipe.castro@gmail.com'),(58,'Natalia','Rojas','natalia.rojas@hotmail.com'),(59,'Santiago','Cardenas','santiago.cardenas@gmail.com'),(60,'Camila','Ortega','camila.ortega@hotmail.com'),(61,'Miguel','Lopez','miguel.lopez@gmail.com'),(62,'Valentina','Mendoza','valentina.mendoza@hotmail.com'),(63,'David','Moreno','david.moreno@gmail.com'),(64,'Diana','Salazar','diana.salazar@hotmail.com'),(65,'Ricardo','Guerrero','ricardo.guerrero@gmail.com'),(66,'Angela','Pena','angela.pena@hotmail.com'),(67,'Esteban','Camacho','esteban.camacho@gmail.com'),(68,'Carolina','Mejia','carolina.mejia@hotmail.com'),(69,'Jorge','Rincon','jorge.rincon@gmail.com'),(70,'Tatiana','Suarez','tatiana.suarez@hotmail.com'),(71,'Sebastian','Peralta','sebastian.peralta@gmail.com'),(72,'Viviana','Parra','viviana.parra@hotmail.com'),(73,'Oscar','Reyes','oscar.reyes@gmail.com'),(74,'Monica','Guzman','monica.guzman@hotmail.com'),(75,'Fernando','Acosta','fernando.acosta@gmail.com'),(76,'Patricia','Villalba','patricia.villalba@hotmail.com'),(77,'Hernan','Beltran','hernan.beltran@gmail.com'),(78,'Claudia','Arevalo','claudia.arevalo@hotmail.com'),(79,'Mauricio','Figueroa','mauricio.figueroa@gmail.com'),(80,'Lorena','Bonilla','lorena.bonilla@hotmail.com'),(81,'Ivan','Cordoba','ivan.cordoba@gmail.com'),(82,'Marcela','Pardo','marcela.pardo@hotmail.com'),(83,'Hugo','Valencia','hugo.valencia@gmail.com'),(84,'Juliana','Cruz','juliana.cruz@hotmail.com'),(85,'Cristian','Barrios','cristian.barrios@gmail.com'),(86,'Liliana','Ariza','liliana.ariza@hotmail.com'),(87,'Alvaro','Carrillo','alvaro.carrillo@gmail.com'),(88,'Daniela','Hoyos','daniela.hoyos@hotmail.com'),(89,'Ramiro','Montoya','ramiro.montoya@gmail.com'),(90,'Catalina','Fonseca','catalina.fonseca@hotmail.com'),(91,'Jhon','Perez','jhon.perez@gmail.com'),(92,'Melissa','Ruiz','melissa.ruiz@hotmail.com'),(93,'Edgar','Silva','edgar.silva@gmail.com'),(94,'Rosa','Bermudez','rosa.bermudez@hotmail.com'),(95,'Orlando','Forero','orlando.forero@gmail.com'),(96,'Martha','Gaitan','martha.gaitan@hotmail.com'),(97,'Alex','Serrano','alex.serrano@gmail.com'),(98,'Veronica','Nieto','veronica.nieto@hotmail.com'),(99,'German','Ibanez','german.ibanez@gmail.com'),(100,'Clara','Maldonado','clara.maldonado@hotmail.com');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_owners_audit` AFTER INSERT ON `owners` FOR EACH ROW BEGIN
  SET @from_owners_trigger = 1;
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT('id', NEW.id, 'first_name', NEW.first_name, 'last_name', NEW.last_name, 'email', NEW.email)
  );
  SET @from_owners_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_owners_audit` AFTER UPDATE ON `owners` FOR EACH ROW BEGIN
  SET @from_owners_trigger = 1;
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT('id', OLD.id, 'first_name', OLD.first_name, 'last_name', OLD.last_name, 'email', OLD.email),
    JSON_OBJECT('id', NEW.id, 'first_name', NEW.first_name, 'last_name', NEW.last_name, 'email', NEW.email)
  );
  SET @from_owners_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_owners_audit` AFTER DELETE ON `owners` FOR EACH ROW BEGIN
  SET @from_owners_trigger = 1;
  INSERT INTO owners_audit (owner_id, actionOwner, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT('id', OLD.id, 'first_name', OLD.first_name, 'last_name', OLD.last_name, 'email', OLD.email),
    NULL
  );
  SET @from_owners_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `owners_audit`
--

DROP TABLE IF EXISTS `owners_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` bigint NOT NULL,
  `actionOwner` enum('UPDATE','DELETE','INSERT') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Admin',
  `before_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  CONSTRAINT `owners_audit_chk_1` CHECK (json_valid(`before_data`)),
  CONSTRAINT `owners_audit_chk_2` CHECK (json_valid(`after_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners_audit`
--

LOCK TABLES `owners_audit` WRITE;
/*!40000 ALTER TABLE `owners_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `owners_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bii_owners_audit_guard_insert` BEFORE INSERT ON `owners_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_owners_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en owners_audit solo permitido desde triggers de owners.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biu_owners_audit_block_update` BEFORE UPDATE ON `owners_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'owners_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bid_owners_audit_block_delete` BEFORE DELETE ON `owners_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'owners_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_payment_contract` (`contract_id`),
  CONSTRAINT `fk_payment_contract` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'2022-01-10',2500.00),(2,1,'2022-04-10',2500.00),(3,2,'2022-02-15',3200.00),(4,2,'2022-05-15',3200.00),(5,3,'2022-03-01',4100.00),(6,3,'2022-06-01',4100.00),(7,4,'2022-04-05',2800.00),(8,4,'2022-07-05',2800.00),(9,5,'2022-05-12',3500.00),(10,5,'2022-08-12',3500.00),(11,6,'2022-06-20',5000.00),(12,6,'2022-09-20',5000.00),(13,7,'2022-07-01',2200.00),(14,7,'2022-10-01',2200.00),(15,8,'2022-08-18',4600.00),(16,8,'2022-11-18',4600.00),(17,9,'2022-09-10',3900.00),(18,9,'2022-12-10',3900.00),(19,10,'2022-10-01',6000.00),(20,10,'2023-01-01',6000.00),(21,11,'2022-11-15',3400.00),(22,11,'2023-02-15',3400.00),(23,12,'2022-12-01',2700.00),(24,12,'2023-03-01',2700.00),(25,13,'2023-01-10',4200.00),(26,13,'2023-04-10',4200.00),(27,14,'2023-02-05',3100.00),(28,14,'2023-05-05',3100.00),(29,15,'2023-03-12',3800.00),(30,15,'2023-06-12',3800.00),(31,16,'2023-04-01',2900.00),(32,16,'2023-07-01',2900.00),(33,17,'2023-05-09',4600.00),(34,17,'2023-08-09',4600.00),(35,18,'2023-06-20',5100.00),(36,18,'2023-09-20',5100.00),(37,19,'2023-07-01',2800.00),(38,19,'2023-10-01',2800.00),(39,20,'2023-08-14',3300.00),(40,20,'2023-11-14',3300.00),(41,21,'2023-09-01',4500.00),(42,21,'2023-12-01',4500.00),(43,22,'2023-10-10',3900.00),(44,22,'2024-01-10',3900.00),(45,23,'2023-11-05',3700.00),(46,23,'2024-02-05',3700.00),(47,24,'2023-12-01',4900.00),(48,24,'2024-03-01',4900.00),(49,25,'2024-01-10',3200.00),(50,25,'2024-04-10',3200.00),(51,26,'2024-02-15',4100.00),(52,26,'2024-05-15',4100.00),(53,27,'2024-03-01',2800.00),(54,27,'2024-06-01',2800.00),(55,28,'2024-04-12',5000.00),(56,28,'2024-07-12',5000.00),(57,29,'2024-05-20',3600.00),(58,29,'2024-08-20',3600.00),(59,30,'2024-06-01',4300.00),(60,30,'2024-09-01',4300.00),(61,31,'2024-07-05',3900.00),(62,31,'2024-10-05',3900.00),(63,32,'2024-08-12',4800.00),(64,32,'2024-11-12',4800.00),(65,33,'2024-09-01',3500.00),(66,33,'2024-12-01',3500.00),(67,34,'2024-10-15',4200.00),(68,34,'2025-01-15',4200.00),(69,35,'2024-11-01',3000.00),(70,35,'2025-02-01',3000.00),(71,36,'2024-12-10',4600.00),(72,36,'2025-03-10',4600.00),(73,37,'2022-01-15',2700.00),(74,37,'2022-04-15',2700.00),(75,38,'2022-02-20',5200.00),(76,38,'2022-05-20',5200.00),(77,39,'2022-03-05',3100.00),(78,39,'2022-06-05',3100.00),(79,40,'2022-04-18',4000.00),(80,40,'2022-07-18',4000.00),(81,21,'2025-01-15',850.00),(82,22,'2025-01-20',1200.00),(83,23,'2025-02-05',970.00),(84,24,'2025-02-10',650.00),(85,25,'2025-02-18',1430.00),(86,26,'2025-03-01',1110.00),(87,27,'2025-03-05',780.00),(88,28,'2025-03-15',930.00),(89,29,'2025-03-22',1340.00),(90,30,'2025-04-01',1500.00),(91,31,'2025-04-07',890.00),(92,32,'2025-04-12',1220.00),(93,33,'2025-04-19',1040.00),(94,34,'2025-04-25',970.00),(95,35,'2025-05-02',1600.00),(96,36,'2025-05-10',1180.00),(97,37,'2025-05-15',700.00),(98,38,'2025-05-22',1350.00),(99,39,'2025-05-28',990.00),(100,40,'2025-06-05',1450.00);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_payments_audit` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
  -- marcar que la inserción viene del trigger autorizado
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'contract_id', NEW.contract_id,
      'payment_date', NEW.payment_date,
      'amount', NEW.amount
    )
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_payments_audit` AFTER UPDATE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'contract_id', OLD.contract_id,
      'payment_date', OLD.payment_date,
      'amount', OLD.amount
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'contract_id', NEW.contract_id,
      'payment_date', NEW.payment_date,
      'amount', NEW.amount
    )
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_payments_audit` AFTER DELETE ON `payments` FOR EACH ROW BEGIN
  SET @from_payments_trigger = 1;

  INSERT INTO payments_audit (payment_id, actionPayment, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'contract_id', OLD.contract_id,
      'payment_date', OLD.payment_date,
      'amount', OLD.amount
    ),
    NULL
  );

  SET @from_payments_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments_audit`
--

DROP TABLE IF EXISTS `payments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint NOT NULL,
  `actionPayment` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `before_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  CONSTRAINT `payments_audit_chk_1` CHECK (json_valid(`before_data`)),
  CONSTRAINT `payments_audit_chk_2` CHECK (json_valid(`after_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_audit`
--

LOCK TABLES `payments_audit` WRITE;
/*!40000 ALTER TABLE `payments_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bii_payments_audit_guard_insert` BEFORE INSERT ON `payments_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_payments_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en payments_audit solo permitido desde triggers de payments.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biu_payments_audit_block_update` BEFORE UPDATE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'payments_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bid_payments_audit_block_delete` BEFORE DELETE ON `payments_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'payments_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `property_type_id` int NOT NULL,
  `owner_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_properties_owner` (`owner_id`),
  KEY `fk_properties_type` (`property_type_id`),
  CONSTRAINT `fk_properties_owner` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  CONSTRAINT `fk_properties_type` FOREIGN KEY (`property_type_id`) REFERENCES `property_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'Calle 10 #5-20, Bogotá',250000000.00,1,1),(2,'Carrera 15 #45-30, Medellín',180000000.00,2,2),(3,'Av. Siempre Viva #123, Cali',320000000.00,3,3),(4,'Calle 8 #12-40, Barranquilla',210000000.00,4,4),(5,'Carrera 25 #34-15, Cartagena',400000000.00,5,5),(6,'Calle 30 #20-50, Bucaramanga',150000000.00,6,6),(7,'Carrera 50 #80-90, Bogotá',270000000.00,1,7),(8,'Calle 60 #10-25, Medellín',350000000.00,2,8),(9,'Calle 25 #15-33, Cali',220000000.00,3,9),(10,'Carrera 12 #45-67, Barranquilla',500000000.00,4,10),(11,'Calle 18 #8-22, Cartagena',175000000.00,5,11),(12,'Carrera 40 #25-60, Bucaramanga',280000000.00,6,12),(13,'Calle 100 #20-10, Bogotá',330000000.00,1,13),(14,'Carrera 7 #50-75, Medellín',195000000.00,2,14),(15,'Calle 9 #14-28, Cali',265000000.00,3,15),(16,'Carrera 19 #33-44, Barranquilla',410000000.00,4,16),(17,'Calle 15 #22-50, Cartagena',210000000.00,5,17),(18,'Carrera 30 #60-70, Bucaramanga',145000000.00,6,18),(19,'Calle 55 #100-200, Bogotá',375000000.00,1,19),(20,'Carrera 80 #60-10, Medellín',290000000.00,2,20),(21,'Calle 12 #90-33, Cali',200000000.00,3,21),(22,'Carrera 3 #15-70, Barranquilla',450000000.00,4,22),(23,'Calle 77 #23-15, Cartagena',320000000.00,5,23),(24,'Carrera 45 #66-80, Bucaramanga',160000000.00,6,24),(25,'Calle 33 #70-21, Bogotá',280000000.00,1,25),(26,'Carrera 11 #55-18, Medellín',190000000.00,2,26),(27,'Calle 88 #30-44, Cali',310000000.00,3,27),(28,'Carrera 66 #12-25, Barranquilla',240000000.00,4,28),(29,'Calle 45 #5-80, Cartagena',420000000.00,5,29),(30,'Carrera 20 #18-77, Bucaramanga',170000000.00,6,30),(31,'Calle 40 #22-15, Bogotá',260000000.00,1,31),(32,'Carrera 75 #33-19, Medellín',310000000.00,2,32),(33,'Calle 50 #80-45, Cali',230000000.00,3,33),(34,'Carrera 27 #18-30, Barranquilla',480000000.00,4,34),(35,'Calle 90 #14-70, Cartagena',350000000.00,5,35),(36,'Carrera 12 #33-22, Bucaramanga',155000000.00,6,36),(37,'Calle 13 #70-33, Bogotá',270000000.00,1,37),(38,'Carrera 18 #22-11, Medellín',210000000.00,2,38),(39,'Calle 34 #55-80, Cali',290000000.00,3,39),(40,'Carrera 8 #10-15, Barranquilla',390000000.00,4,40),(41,'Calle 60 #7-90, Cartagena',205000000.00,5,41),(42,'Carrera 100 #25-66, Bucaramanga',175000000.00,6,42),(43,'Calle 77 #44-55, Bogotá',330000000.00,1,43),(44,'Carrera 55 #88-99, Medellín',300000000.00,2,44),(45,'Calle 12 #45-20, Cali',215000000.00,3,45),(46,'Carrera 11 #66-77, Barranquilla',460000000.00,4,46),(47,'Calle 88 #23-40, Cartagena',370000000.00,5,47),(48,'Carrera 66 #20-33, Bucaramanga',165000000.00,6,48),(49,'Calle 44 #77-21, Bogotá',295000000.00,1,49),(50,'Carrera 19 #10-80, Medellín',220000000.00,2,50),(51,'Calle 90 #55-30, Cali',280000000.00,3,1),(52,'Carrera 3 #33-11, Barranquilla',405000000.00,4,2),(53,'Calle 25 #60-44, Cartagena',315000000.00,5,3),(54,'Carrera 22 #77-50, Bucaramanga',150000000.00,6,4),(55,'Calle 10 #44-88, Bogotá',270000000.00,1,5),(56,'Carrera 33 #12-66, Medellín',195000000.00,2,6),(57,'Calle 88 #66-22, Cali',320000000.00,3,7),(58,'Carrera 55 #44-30, Barranquilla',255000000.00,4,8),(59,'Calle 22 #20-40, Cartagena',410000000.00,5,9),(60,'Carrera 60 #90-33, Bucaramanga',185000000.00,6,10),(61,'Calle 12 #50-22, Bogotá',290000000.00,1,11),(62,'Carrera 80 #30-15, Medellín',310000000.00,2,12),(63,'Calle 33 #14-55, Cali',235000000.00,3,13),(64,'Carrera 27 #18-40, Barranquilla',470000000.00,4,14),(65,'Calle 70 #45-99, Cartagena',360000000.00,5,15),(66,'Carrera 100 #20-18, Bucaramanga',160000000.00,6,16),(67,'Calle 50 #33-40, Bogotá',280000000.00,1,17),(68,'Carrera 18 #22-55, Medellín',205000000.00,2,18),(69,'Calle 12 #66-10, Cali',270000000.00,3,19),(70,'Carrera 77 #33-22, Barranquilla',395000000.00,4,20),(71,'Calle 88 #12-45, Cartagena',345000000.00,5,21),(72,'Carrera 55 #14-77, Bucaramanga',155000000.00,6,22),(73,'Calle 15 #60-30, Bogotá',265000000.00,1,23),(74,'Carrera 20 #11-25, Medellín',215000000.00,2,24),(75,'Calle 70 #45-80, Cali',310000000.00,3,25),(76,'Carrera 12 #33-66, Barranquilla',420000000.00,4,26),(77,'Calle 90 #55-22, Cartagena',350000000.00,5,27),(78,'Carrera 30 #60-40, Bucaramanga',170000000.00,6,28),(79,'Calle 45 #80-12, Bogotá',285000000.00,1,29),(80,'Carrera 22 #70-18, Medellín',295000000.00,2,30),(81,'Calle 81 #45-20, Ciudad 9',250000.00,1,5),(82,'Carrera 52 #12-34, Ciudad 7',180000.00,2,3),(83,'Avenida Libertad 100, Ciudad 5',320000.00,3,8),(84,'Calle 15 #23-90, Ciudad 2',145000.00,1,4),(85,'Calle 9 #60-12, Ciudad 6',275000.00,2,6),(86,'Carrera 8 #33-45, Ciudad 10',310000.00,3,2),(87,'Avenida Central 77, Ciudad 4',400000.00,1,7),(88,'Calle 22 #14-56, Ciudad 1',120000.00,2,9),(89,'Carrera 90 #40-11, Ciudad 8',210000.00,3,1),(90,'Calle 70 #50-99, Ciudad 3',290000.00,1,10),(91,'Calle 101 #15-43, Ciudad 2',305000.00,2,5),(92,'Carrera 77 #44-88, Ciudad 7',260000.00,1,3),(93,'Avenida Sur 15, Ciudad 6',330000.00,3,4),(94,'Calle 60 #33-21, Ciudad 5',175000.00,2,6),(95,'Carrera 12 #10-14, Ciudad 8',295000.00,1,2),(96,'Calle 44 #12-32, Ciudad 9',215000.00,3,7),(97,'Carrera 30 #18-55, Ciudad 4',185000.00,1,9),(98,'Avenida Norte 120, Ciudad 10',340000.00,2,1),(99,'Calle 11 #25-67, Ciudad 3',270000.00,1,8),(100,'Carrera 55 #14-23, Ciudad 2',360000.00,3,5);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ai_properties_audit` AFTER INSERT ON `properties` FOR EACH ROW BEGIN
  -- permitir insert si el guard en properties_audit lo requiere
  SET @from_properties_trigger = 1;

  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    NEW.id,
    'INSERT',
    NULL,
    JSON_OBJECT(
      'id', NEW.id,
      'address', NEW.address,
      'price', NEW.price,
      'property_type_id', NEW.property_type_id,
      'owner_id', NEW.owner_id
    )
  );

  SET @from_properties_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `au_properties_audit` AFTER UPDATE ON `properties` FOR EACH ROW BEGIN
  SET @from_properties_trigger = 1;

  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    NEW.id,
    'UPDATE',
    JSON_OBJECT(
      'id', OLD.id,
      'address', OLD.address,
      'price', OLD.price,
      'property_type_id', OLD.property_type_id,
      'owner_id', OLD.owner_id
    ),
    JSON_OBJECT(
      'id', NEW.id,
      'address', NEW.address,
      'price', NEW.price,
      'property_type_id', NEW.property_type_id,
      'owner_id', NEW.owner_id
    )
  );

  SET @from_properties_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ad_properties_audit` AFTER DELETE ON `properties` FOR EACH ROW BEGIN
  SET @from_properties_trigger = 1;

  INSERT INTO properties_audit (property_id, actionProperty, before_data, after_data)
  VALUES (
    OLD.id,
    'DELETE',
    JSON_OBJECT(
      'id', OLD.id,
      'address', OLD.address,
      'price', OLD.price,
      'property_type_id', OLD.property_type_id,
      'owner_id', OLD.owner_id
    ),
    NULL
  );

  SET @from_properties_trigger = NULL;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `properties_audit`
--

DROP TABLE IF EXISTS `properties_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties_audit` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `property_id` bigint NOT NULL,
  `actionProperty` enum('INSERT','UPDATE','DELETE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'INSERT',
  `changed_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Admin',
  `before_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `after_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  CONSTRAINT `properties_audit_chk_1` CHECK (json_valid(`before_data`)),
  CONSTRAINT `properties_audit_chk_2` CHECK (json_valid(`after_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_audit`
--

LOCK TABLES `properties_audit` WRITE;
/*!40000 ALTER TABLE `properties_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_audit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bii_properties_audit_guard_insert` BEFORE INSERT ON `properties_audit` FOR EACH ROW BEGIN
  IF COALESCE(@from_properties_trigger, 0) <> 1 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INSERT en properties_audit solo permitido desde triggers de properties.';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `biu_properties_audit_block_update` BEFORE UPDATE ON `properties_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'properties_audit es inmutable: UPDATE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `bid_properties_audit_block_delete` BEFORE DELETE ON `properties_audit` FOR EACH ROW BEGIN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'properties_audit es inmutable: DELETE prohibido.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `property_amenities`
--

DROP TABLE IF EXISTS `property_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_amenities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propamenities_property` (`property_id`),
  KEY `fk_propamenities_amenity` (`amenity_id`),
  CONSTRAINT `fk_propamenities_amenity` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`),
  CONSTRAINT `fk_propamenities_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenities`
--

LOCK TABLES `property_amenities` WRITE;
/*!40000 ALTER TABLE `property_amenities` DISABLE KEYS */;
INSERT INTO `property_amenities` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57),(58,58,58),(59,59,59),(60,60,60),(61,21,35),(62,21,40),(63,22,15),(64,22,70),(65,23,10),(66,23,55),(67,24,28),(68,24,76),(69,25,8),(70,25,61),(71,26,45),(72,26,80),(73,27,7),(74,27,50),(75,28,22),(76,28,99),(77,29,5),(78,29,66),(79,30,38),(80,30,73),(81,31,12),(82,31,47),(83,32,18),(84,32,85),(85,33,20),(86,33,60),(87,34,14),(88,34,88),(89,35,2),(90,35,95),(91,36,25),(92,36,78),(93,37,30),(94,37,44),(95,38,16),(96,38,62),(97,39,9),(98,39,71),(99,40,27),(100,40,53);
/*!40000 ALTER TABLE `property_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_types`
--

DROP TABLE IF EXISTS `property_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_types`
--

LOCK TABLES `property_types` WRITE;
/*!40000 ALTER TABLE `property_types` DISABLE KEYS */;
INSERT INTO `property_types` VALUES (1,'Casa'),(2,'Apartamento'),(3,'Oficina'),(4,'Local'),(5,'Finca'),(6,'Bodega'),(7,'Apartamento'),(8,'Casa'),(9,'Villa'),(10,'Cabaña'),(11,'Finca'),(12,'Estudio'),(13,'Dúplex'),(14,'Penthouse'),(15,'Loft'),(16,'Oficina'),(17,'Local comercial'),(18,'Bodega'),(19,'Garaje'),(20,'Parqueadero'),(21,'Consultorio'),(22,'Clínica'),(23,'Hospital'),(24,'Hotel'),(25,'Hostal'),(26,'Motel'),(27,'Cabaña ecológica'),(28,'Casa campestre'),(29,'Apartamento dúplex'),(30,'Apartamento tipo estudio'),(31,'Apartamento amoblado'),(32,'Apartamento en sótano'),(33,'Apartamento en ático'),(34,'Apartamento con balcón'),(35,'Apartamento con terraza'),(36,'Apartamento inteligente'),(37,'Terreno urbano'),(38,'Terreno rural'),(39,'Lote industrial'),(40,'Lote residencial'),(41,'Parcela agrícola'),(42,'Parcela ganadera'),(43,'Hacienda'),(44,'Quinta'),(45,'Casa de playa'),(46,'Casa de montaña'),(47,'Casa adosada'),(48,'Casa bifamiliar'),(49,'Casa trifamiliar'),(50,'Casa unifamiliar'),(51,'Casa colonial'),(52,'Casa moderna'),(53,'Casa prefabricada'),(54,'Casa móvil'),(55,'Casa flotante'),(56,'Casa ecológica'),(57,'Edificio'),(58,'Edificio comercial'),(59,'Edificio residencial'),(60,'Edificio mixto'),(61,'Edificio corporativo'),(62,'Edificio industrial'),(63,'Centro comercial'),(64,'Centro empresarial'),(65,'Rascacielos'),(66,'Torre residencial'),(67,'Depósito'),(68,'Almacén'),(69,'Hangar'),(70,'Establo'),(71,'Granero'),(72,'Invernadero'),(73,'Chalet'),(74,'Caserío'),(75,'Casa rural'),(76,'Casa patrimonial'),(77,'Penthouse dúplex'),(78,'Penthouse tríplex'),(79,'Suite'),(80,'Suite presidencial'),(81,'Suite junior'),(82,'Suite ejecutiva'),(83,'Estudio amoblado'),(84,'Estudio minimalista'),(85,'Loft industrial'),(86,'Loft moderno'),(87,'Apartamento turístico'),(88,'Apartamento vacacional'),(89,'Apartamento corporativo'),(90,'Apartamento compartido'),(91,'Habitación en arriendo'),(92,'Habitación amoblada'),(93,'Habitación compartida'),(94,'Habitación de hotel'),(95,'Residencia estudiantil'),(96,'Residencia universitaria'),(97,'Casa inteligente'),(98,'Casa sostenible'),(99,'Casa de lujo'),(100,'Casa minimalista'),(101,'Casa tipo chalet'),(102,'Casa modular'),(103,'Casa de campo'),(104,'Casa tradicional'),(105,'Casa señorial'),(106,'Casa antigua');
/*!40000 ALTER TABLE `property_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int NOT NULL,
  `visit_date` date NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_visit_property` (`property_id`),
  KEY `fk_visit_client` (`client_id`),
  CONSTRAINT `fk_visit_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_visit_property` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,1,'2022-01-15',3),(2,2,'2022-01-18',7),(3,3,'2022-01-20',12),(4,4,'2022-01-25',8),(5,5,'2022-02-01',15),(6,6,'2022-02-05',20),(7,7,'2022-02-10',9),(8,8,'2022-02-12',14),(9,9,'2022-02-15',5),(10,10,'2022-02-20',18),(11,11,'2022-02-25',21),(12,12,'2022-03-01',2),(13,13,'2022-03-05',25),(14,14,'2022-03-08',30),(15,15,'2022-03-12',11),(16,16,'2022-03-15',6),(17,17,'2022-03-18',19),(18,18,'2022-03-20',28),(19,19,'2022-03-25',10),(20,20,'2022-04-01',4),(21,21,'2022-04-05',16),(22,22,'2022-04-10',23),(23,23,'2022-04-12',27),(24,24,'2022-04-15',13),(25,25,'2022-04-20',33),(26,26,'2022-04-25',17),(27,27,'2022-04-28',22),(28,28,'2022-05-01',31),(29,29,'2022-05-05',26),(30,30,'2022-05-10',29),(31,31,'2022-05-15',34),(32,32,'2022-05-20',9),(33,33,'2022-05-25',15),(34,34,'2022-06-01',20),(35,35,'2022-06-05',7),(36,36,'2022-06-10',18),(37,37,'2022-06-15',25),(38,38,'2022-06-20',30),(39,39,'2022-06-25',11),(40,40,'2022-07-01',4),(41,41,'2022-07-05',13),(42,42,'2022-07-10',29),(43,43,'2022-07-15',8),(44,44,'2022-07-20',22),(45,45,'2022-07-25',17),(46,46,'2022-08-01',6),(47,47,'2022-08-05',21),(48,48,'2022-08-10',35),(49,49,'2022-08-15',14),(50,50,'2022-08-20',32),(51,1,'2022-09-01',28),(52,2,'2022-09-05',19),(53,3,'2022-09-10',27),(54,4,'2022-09-15',12),(55,5,'2022-09-20',16),(56,6,'2022-09-25',24),(57,7,'2022-10-01',31),(58,8,'2022-10-05',5),(59,9,'2022-10-10',23),(60,10,'2022-10-15',2),(61,11,'2022-10-20',18),(62,12,'2022-10-25',26),(63,13,'2022-11-01',7),(64,14,'2022-11-05',10),(65,15,'2022-11-10',20),(66,16,'2022-11-15',33),(67,17,'2022-11-20',6),(68,18,'2022-11-25',15),(69,19,'2022-12-01',9),(70,20,'2022-12-05',22),(71,21,'2022-12-10',3),(72,22,'2022-12-15',27),(73,23,'2022-12-20',13),(74,24,'2022-12-25',19),(75,25,'2023-01-05',25),(76,26,'2023-01-10',14),(77,27,'2023-01-15',32),(78,28,'2023-01-20',17),(79,29,'2023-01-25',8),(80,30,'2023-02-01',12),(81,31,'2023-02-05',21),(82,32,'2023-02-10',34),(83,33,'2023-02-15',5),(84,34,'2023-02-20',20),(85,35,'2023-02-25',30),(86,36,'2023-03-01',11),(87,37,'2023-03-05',28),(88,38,'2023-03-10',15),(89,39,'2023-03-15',7),(90,40,'2023-03-20',22),(91,41,'2023-03-25',10),(92,42,'2023-04-01',35),(93,43,'2023-04-05',19),(94,44,'2023-04-10',16),(95,45,'2023-04-15',2),(96,46,'2023-04-20',23),(97,47,'2023-04-25',18),(98,48,'2023-05-01',27),(99,49,'2023-05-05',29),(100,50,'2023-05-10',6);
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'luxur_dbever'
--

--
-- Dumping routines for database 'luxur_dbever'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_begin_query` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_begin_query`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE client_first_name VARCHAR(100);
    DECLARE client_last_name VARCHAR(100);
    DECLARE payment_amount DECIMAL(10,2);
    DECLARE cur CURSOR FOR 
        SELECT c.first_name, c.last_name, p.amount
        FROM payments p
        JOIN contracts ct ON p.contract_id = ct.id
        JOIN clients c ON ct.client_id = c.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO client_first_name, client_last_name, payment_amount;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT(client_first_name, ' ', client_last_name) AS client, payment_amount AS payment_amount;
    END LOOP;
    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_clients_like` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clients_like`()
BEGIN
    SELECT id, first_name AS client_name, last_name AS client_last_name, email
    FROM clients
    WHERE last_name LIKE 'G%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consulta_join` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consulta_join`()
BEGIN
    SELECT 
        c.first_name AS client_first_name,
        c.last_name AS client_last_name,
        pr.address AS property_address,
        pr.price AS property_price,
        con.start_date AS contract_start_date,
        con.end_date AS contract_end_date
    FROM contracts con
    JOIN clients c ON con.client_id = c.id
    JOIN properties pr ON con.property_id = pr.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_payments_between_dates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payments_between_dates`()
BEGIN
    SELECT id, contract_id, payment_date, amount AS payment_amount
    FROM payments
    WHERE payment_date BETWEEN '2024-01-01' AND '2024-12-31';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_properties_equal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_properties_equal`()
BEGIN
    SELECT id, address AS property_address, price AS property_price
    FROM properties
    WHERE price = 250000;
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

-- Dump completed on 2025-10-15 22:05:26
