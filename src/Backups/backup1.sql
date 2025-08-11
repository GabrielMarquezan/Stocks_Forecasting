-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: stock_forecasting
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `name` varchar(100) NOT NULL,
  `Ticker` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES ('Banco do Brasil','BBAS3'),('Gold','-'),('Marfrig','MRFG3'),('Oil','-'),('SLC Agrícola','SLCE3'),('Soy','-'),('Steel','-'),('USD','-');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `emotion` enum('very positive','positive','neutral','negative','very negative') NOT NULL,
  `assetName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assetName` (`assetName`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`assetName`) REFERENCES `assets` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Banco do Brasil começa a semana no foco do mercado após cair quase 7% na sexta-feira','2025-08-04','negative','Banco do Brasil'),(2,'Entenda a desvalorização de quase 7% do Banco do Brasil no Ibovespa','2025-08-01','negative','Banco do Brasil'),(3,'Pix: em dia de investigação sobre meio de pagamento bolsa cai assim como ações dos bancões','2025-07-16','negative','Banco do Brasil'),(4,'Tarifas, BB, Mundial e mais: um resumo da semana um resumo para você em 5 pontos','2025-07-13','neutral','Banco do Brasil'),(5,'Qual bancão está mais atrativo agora? Veja o raio-x técnico de ITUB4, BBAS3 e BBDC4','2025-08-07','neutral','Banco do Brasil'),(6,'Banco do Brasil (BBAS3) acumula perdas no ano; não há sinal de reversão; veja análise','2025-07-30','negative','Banco do Brasil'),(7,'De LREN3 a BBAS3: os possíveis destaques positivos e negativos na temporada do 2º tri','2025-07-23','neutral','Banco do Brasil'),(8,'Bradesco (BBDC4) e BB (BBAS3) negam ter recebido proposta formal do iFood pela Alelo','2025-07-24','neutral','Banco do Brasil'),(9,'Investidor estrangeiro movimenta R$ 1,4 trilhão na Bolsa no 1º semestre','2025-07-31','positive','Banco do Brasil'),(10,'Banco do Brasil (BBAS3) anuncia 5 novos nomes para comando de empresas do grupo','2025-07-21','positive','Banco do Brasil'),(11,'BBAS3: quão ruim o 2T será? Mercado piora projeções e vê outro “vilão” além do agro','2025-07-16','very negative','Banco do Brasil'),(12,'BBAS3: piora no rural não acabou e Bradesco BBI corta projeções – e vê BBSE3 afetada','2025-07-30','very negative','Banco do Brasil'),(13,'BBAS3: o que fez a ação do Banco do Brasil sair da estabilidade e cair 7% nesta sexta','2025-08-01','negative','Banco do Brasil'),(14,'Ações do BB caem mais de 2% após J.P. Morgan cortar preço-alvo e mostrar preocupação com o banco','2025-07-16','negative','Banco do Brasil'),(15,'Confira as seis ações de dividendos mais recomendadas para investir em agosto','2025-08-05','positive','Banco do Brasil'),(16,'Quando a Petrobras (PETR4) paga dividendos em 2025? Veja como receber renda todo mês','2025-08-07','positive','Banco do Brasil'),(17,'Banco do Brasil, Bradesco, Azul, Taurus, Brava e mais ações para acompanhar hoje','2025-07-24','neutral','Banco do Brasil'),(18,'Petrobras, BB, Rede D’Or, Fleury, Ambev e mais ações para acompanhar hoje','2025-07-21','neutral','Banco do Brasil'),(19,'Crédito desacelera, inadimplência elevada: os dados do BC que desanimaram os bancos','2025-07-29','negative','Banco do Brasil'),(20,'Banco do Brasil: JPMorgan revisa projeções e corta preço-alvo após lucro de maio','2025-08-08','negative','Banco do Brasil'),(21,'Quais ações para atravessar turbulência recente? BBI aposta em pagadoras de dividendo','2025-07-28','positive','Banco do Brasil'),(22,'Ação do Banco do Brasil reage e sobe até 3% após tombo com receios sobre 2º tri','2025-08-04','positive','Banco do Brasil'),(23,'BB em baixa, Itaú em alta: o que BC disse sobre bancos que ainda não soltaram balanço','2025-08-04','negative','Banco do Brasil'),(24,'Ibovespa tem 7 baixas seguidas e tem mais longa série negativa desde agosto de 2023','2025-07-15','negative','Banco do Brasil'),(25,'Criptos tomam emprestada a confiança nos bancões para avançar no Brasil','2025-07-24','positive','Banco do Brasil'),(26,'BB de um lado, Itaú do outro: o que você precisa saber do 2T dos bancos em 8 pontos','2025-07-29','neutral','Banco do Brasil'),(29,'Marfrig eleva participação na BRF para 58,87% em meio a impasse sobre fusão','2025-07-13','neutral','Marfrig'),(30,'Cemig, Azul, WEG, BRF, Marfrig e mais ações para acompanhar hoje','2025-08-04','neutral','Marfrig'),(31,'Grupo de controle passa a deter 75,33% da Marfrig (MRFG3)','2025-07-15','neutral','Marfrig'),(32,'Conclusão breve para fusão BRF-Marfrig no Cade se torna mais improvável','2025-07-18','negative','Marfrig'),(33,'Marfrig, BRF e Minerva caem até 10% na B3 – setor aparece como perdedor com tarifaço','2025-07-31','very negative','Marfrig'),(34,'Previ vende fatia na BRF por R$ 1,9 bi e vê riscos com fusão; ação BRFS3 cai 4,55%','2025-07-14','negative','Marfrig'),(35,'Marfrig e BRF sobem com reavaliação do efeito do tarifaço; Embraer cai após euforia','2025-08-01','negative','Marfrig'),(36,'Marfrig e BRF aprovam fusão em assembleias: como os analistas veem as ações?','2025-08-06','positive','Marfrig'),(37,'Marfrig, BRF, Tim, B3, BrasilAgro e mais ações para acompanhar hoje','2025-07-15','neutral','Marfrig'),(38,'Marfrig suspende produção para os EUA em meio ao tarifaço de Trump, diz jornal','2025-07-30','negative','Marfrig'),(39,'Apesar de grandes RJs, não há crise estrutural no agronegócio, dizem especialistas','2025-07-26','neutral','SLC Agrícola'),(40,'Clã da SLC constrói império agrícola com valorização de 935%','2025-08-08','positive','SLC Agrícola'),(41,'SLC Agrícola, o \'Rei do Agro\', investe R$ 900 milhões para ter 53.200 hectares irrigados','2025-07-18','positive','SLC Agrícola'),(42,'O ‘berço’ da SLC Agrícola (SLCE3) e a história da ‘cultura mais rentável do Brasil','2025-07-17','positive','SLC Agrícola'),(43,'SLC deflagra megaprojeto de R$ 900 milhões para irrigar o oeste baiano','2025-07-15','positive','SLC Agrícola'),(44,'CEO da SLC Agrícola critica ‘viés político’ da Europa e diz que Brasil ‘não precisa mais desmatar’','2025-07-17','neutral','SLC Agrícola'),(45,'Ágora recomenda ações da SLC Agrícola (SLCE3) para ganho de até 4,02% hoje (30); veja a operação','2025-07-30','positive','SLC Agrícola'),(46,'É hora de adicionar SLC Agrícola (SLCE3) na carteira e três analistas dizem o que chama atenção nas ações','2025-07-11','positive','SLC Agrícola'),(47,'Santander corta projeção da SLC Agrícola (SLCE3), mas eleva preço-alvo das ações; entenda','2025-07-29','neutral','SLC Agrícola'),(48,'Citi faz previsão para balanço da SLC Agrícola (SLCE3) no 2º trimestre, final de 2025 e 2026; confira','2025-07-28','neutral','SLC Agrícola'),(49,'‘Somente com o agro o Brasil não se transformará em país rico’, diz CEO da SLC Agrícola','2025-07-20','neutral','SLC Agrícola'),(50,'SLC (SLCE3) | Prévia de resultados do 2T25: Trimestre fácil, caminho difícil','2025-08-05','neutral','SLC Agrícola'),(51,'BB-BI comenta iniciativas trazidas no Farm Day da SLC Agrícola (SLCE3)','2025-07-11','neutral','SLC Agrícola'),(52,'S&P eleva rating global da BRF (BRFS3) após fusão com a Marfrig (MRFG3); confira os detalhes','2025-08-08','positive','Marfrig');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `openingOrClosing` enum('opening','closing') NOT NULL,
  `assetName` varchar(100) NOT NULL,
  PRIMARY KEY (`date`,`openingOrClosing`,`assetName`),
  KEY `assetName` (`assetName`),
  CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`assetName`) REFERENCES `assets` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selic`
--

DROP TABLE IF EXISTS `selic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selic` (
  `definitionDate` date NOT NULL,
  `rate` decimal(2,2) NOT NULL,
  PRIMARY KEY (`definitionDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selic`
--

LOCK TABLES `selic` WRITE;
/*!40000 ALTER TABLE `selic` DISABLE KEYS */;
/*!40000 ALTER TABLE `selic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-11 18:04:04
