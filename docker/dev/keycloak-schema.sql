-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: agrisud_keycloak
-- ------------------------------------------------------
-- Server version	8.0.26

use `agrisud_keycloak`;

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0730a499-714e-4d79-8fc9-83c61495ddeb',NULL,'client-secret','agrisud','b1b5bb6a-387c-49d7-a126-d3e48aa126b4',2,10,_binary '\0',NULL,NULL),('08083ae0-8443-4356-9826-9536e86181e9',NULL,'idp-email-verification','master','7096abd3-e0f9-43dd-9ed8-2cab6474bb1a',2,10,_binary '\0',NULL,NULL),('0876621f-9a04-47bd-bdf1-f61b3bd2f446',NULL,'identity-provider-redirector','master','319c13a1-6569-40d0-bf28-f8e3f5657311',2,25,_binary '\0',NULL,NULL),('11162c43-d61e-43bc-b4c5-b278ae7a634d',NULL,'direct-grant-validate-password','master','07e39fac-ea99-4346-b3b5-ea2bb228ba46',0,20,_binary '\0',NULL,NULL),('115f7a8e-ecf5-4302-b244-5c23e81e205f',NULL,NULL,'master','c800b2b8-ac09-46fc-8c79-5e7b0888fb42',0,20,_binary '','4c82d5b7-12ce-4eb2-8e42-1f7ea8923c75',NULL),('1336b413-3c7e-4c61-b24c-990aa1cad7d5',NULL,NULL,'master','318664a0-b631-4dc7-b60e-c96e300b079a',1,20,_binary '','e126cdfb-9e16-4458-8ffe-8a432a7a7a35',NULL),('17d8625f-f543-40cc-8e84-41b1237c5153',NULL,'conditional-user-configured','agrisud','6b5b409e-09b0-4521-b1a4-9fa63a36f997',0,10,_binary '\0',NULL,NULL),('1e3ea38c-bab7-42da-b11c-a0865479ca7c',NULL,'no-cookie-redirect','agrisud','392f8112-b5c3-413e-900d-1370ad3a9621',0,10,_binary '\0',NULL,NULL),('20164663-ac4a-4bf1-ae79-6955982ecf00',NULL,'client-secret-jwt','master','d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c',2,30,_binary '\0',NULL,NULL),('201b3777-c85b-4e42-9532-686883f59c09',NULL,'reset-password','master','277a93a8-a71f-471c-b22c-392de87d2b66',0,30,_binary '\0',NULL,NULL),('272612df-b074-4f26-8370-8823aef518d0',NULL,'registration-page-form','agrisud','24653e8b-6aa8-4106-b4c1-4dc05f5f7421',0,10,_binary '','08e3ac60-bc66-4591-8bfc-b58f973ad787',NULL),('29af8680-3e8f-469d-b9b3-0fcee13c8508',NULL,'direct-grant-validate-password','agrisud','5439e4a1-8b92-456e-8b40-a8a1958613c0',0,20,_binary '\0',NULL,NULL),('2c699376-d887-4072-b2c3-c8fe65c8c54b',NULL,'reset-credentials-choose-user','agrisud','406d9d48-df76-4f3e-96e0-3a10337ffae6',0,10,_binary '\0',NULL,NULL),('369fb9e3-848f-413e-a457-df6f48c82096',NULL,'no-cookie-redirect','master','c800b2b8-ac09-46fc-8c79-5e7b0888fb42',0,10,_binary '\0',NULL,NULL),('3974e1d5-d6ad-4147-91c3-257c843128d5',NULL,'idp-username-password-form','agrisud','fb6a052d-df70-4541-9450-fc89266f2152',0,10,_binary '\0',NULL,NULL),('3b58f769-1d36-4d3f-a6ce-800ecb9b6e17',NULL,'auth-otp-form','master','e126cdfb-9e16-4458-8ffe-8a432a7a7a35',0,20,_binary '\0',NULL,NULL),('416bf98d-aabe-41bc-a685-91c3a29149eb',NULL,NULL,'agrisud','a6ab944f-f53c-4377-841a-5fe101187813',0,20,_binary '','82035b31-3abb-45ec-99f6-3e732c6a6521',NULL),('43aa4ac2-b9fa-4959-a976-c80926985f87',NULL,'conditional-user-configured','agrisud','42195ff9-7cbc-4c85-b736-c0b474e4ede4',0,10,_binary '\0',NULL,NULL),('44ca552d-69de-43c8-a56c-7b87a4859b5c',NULL,'idp-confirm-link','agrisud','a6ab944f-f53c-4377-841a-5fe101187813',0,10,_binary '\0',NULL,NULL),('49c9c832-c51a-4ceb-910d-0dac9006a42a',NULL,'direct-grant-validate-otp','master','fc4bdcd7-24bb-4ff2-a74c-6f52273912a9',0,20,_binary '\0',NULL,NULL),('4b81dbbc-d440-4fbf-b4c3-8e4a95c15905',NULL,'reset-credential-email','agrisud','406d9d48-df76-4f3e-96e0-3a10337ffae6',0,20,_binary '\0',NULL,NULL),('4bba84b6-a562-448a-b865-bf680f42cf4f',NULL,'docker-http-basic-authenticator','agrisud','5289f23c-81f8-4065-bee5-a967534da220',0,10,_binary '\0',NULL,NULL),('4bc76f8f-20f6-44fa-bc3d-b1f4c4b6846f',NULL,'auth-cookie','agrisud','b30a09d0-2021-465a-ae1c-ae4553308637',2,10,_binary '\0',NULL,NULL),('4e961019-c28e-4c6a-8bfb-2cb7b4823d1e',NULL,'conditional-user-configured','agrisud','5069734f-54bd-4917-a2ab-c8016ea6c0a3',0,10,_binary '\0',NULL,NULL),('55c615db-0db5-4741-9e12-dd278a20d177',NULL,'registration-page-form','master','247d9bed-9c13-436c-8d10-2e1a02bba450',0,10,_binary '','935f8a37-06ab-409f-949a-e6ec74614870',NULL),('563d38b2-d971-436c-a78f-3a1fe12e0652',NULL,NULL,'agrisud','82035b31-3abb-45ec-99f6-3e732c6a6521',2,20,_binary '','fb6a052d-df70-4541-9450-fc89266f2152',NULL),('5685f287-f16f-4435-a2b3-3f9c9a64c983',NULL,NULL,'master','07e39fac-ea99-4346-b3b5-ea2bb228ba46',1,30,_binary '','fc4bdcd7-24bb-4ff2-a74c-6f52273912a9',NULL),('57187c08-ab27-4e75-8c2d-f0a960dfedce',NULL,'client-jwt','master','d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c',2,20,_binary '\0',NULL,NULL),('5b05f517-aef2-4c23-9251-9c4eb4cb0743',NULL,'client-x509','agrisud','b1b5bb6a-387c-49d7-a126-d3e48aa126b4',2,40,_binary '\0',NULL,NULL),('5bb5131d-231b-4447-8490-f6cc985b1a44',NULL,'reset-otp','master','445f2458-2938-4400-bbae-08142511b49f',0,20,_binary '\0',NULL,NULL),('5cff4e76-b455-4947-963f-bf631796dc52',NULL,NULL,'agrisud','fb6a052d-df70-4541-9450-fc89266f2152',1,20,_binary '','6b5b409e-09b0-4521-b1a4-9fa63a36f997',NULL),('5e7ad0e0-d83c-40bf-bc2a-f0544d21608f',NULL,'auth-otp-form','master','870cb402-0451-4e08-93d8-874d5254f77a',0,20,_binary '\0',NULL,NULL),('63a8742f-aba8-4ce5-8493-e4e1eba0173c',NULL,'basic-auth','master','4c82d5b7-12ce-4eb2-8e42-1f7ea8923c75',0,10,_binary '\0',NULL,NULL),('63cb0f6d-a8d4-44f7-a9e8-dd5c6cb52ddf',NULL,NULL,'agrisud','5439e4a1-8b92-456e-8b40-a8a1958613c0',1,30,_binary '','42195ff9-7cbc-4c85-b736-c0b474e4ede4',NULL),('675c821c-b19a-45ae-adbe-ae2d5c57ffb4',NULL,NULL,'master','f0d08f6a-99e5-434e-8f51-209d1ae4863d',1,20,_binary '','870cb402-0451-4e08-93d8-874d5254f77a',NULL),('69d884b4-6ef0-4783-aaf4-00a9fd03fda3',NULL,'idp-create-user-if-unique','agrisud','b43c7601-2a16-4fb2-a919-8287ca955147',2,10,_binary '\0',NULL,'5de712d3-09ec-4928-ad07-6ea93b705411'),('6b5b4630-bef1-4486-8c44-27f06b84ea03',NULL,'client-jwt','agrisud','b1b5bb6a-387c-49d7-a126-d3e48aa126b4',2,20,_binary '\0',NULL,NULL),('6ebbdcee-d808-4ad6-86f2-f0615ee88870',NULL,NULL,'master','768f7dca-929b-41ee-9146-e972965f12d1',0,20,_binary '','5223160f-ec3c-4f5a-8cec-f03ebb9ac546',NULL),('6f6dd800-0ea0-479e-8eff-460e3d0e2cc6',NULL,NULL,'master','319c13a1-6569-40d0-bf28-f8e3f5657311',2,30,_binary '','318664a0-b631-4dc7-b60e-c96e300b079a',NULL),('70a0e740-08ae-4de0-8f32-568b461060b8',NULL,'registration-profile-action','master','935f8a37-06ab-409f-949a-e6ec74614870',0,40,_binary '\0',NULL,NULL),('71c29e7c-0d9e-4705-9787-817b6374fffe',NULL,'auth-spnego','agrisud','b30a09d0-2021-465a-ae1c-ae4553308637',3,20,_binary '\0',NULL,NULL),('76f62713-a797-4285-8c77-b08f761148b5',NULL,NULL,'agrisud','54eb353f-b3d1-4c17-a10c-c5e31808bf33',1,20,_binary '','a1d2b8bd-16dc-4632-929c-ba8ef26f7d1b',NULL),('7af5bf32-344b-4cfd-94ca-dd6237ab127b',NULL,'direct-grant-validate-username','agrisud','5439e4a1-8b92-456e-8b40-a8a1958613c0',0,10,_binary '\0',NULL,NULL),('7f2ac5bd-a854-4e40-a140-407234a6d793',NULL,'auth-username-password-form','master','318664a0-b631-4dc7-b60e-c96e300b079a',0,10,_binary '\0',NULL,NULL),('83de0dd4-7e97-4025-b06a-af87a0b0e54d',NULL,NULL,'master','5223160f-ec3c-4f5a-8cec-f03ebb9ac546',2,20,_binary '','493bceaf-faa9-4654-8e56-d82cebf5fd57',NULL),('8637d46b-31a8-48f5-9c72-b86ac8f32bf7',NULL,'auth-spnego','master','4c82d5b7-12ce-4eb2-8e42-1f7ea8923c75',3,30,_binary '\0',NULL,NULL),('86461d84-89d9-4bc4-b31c-b811cb01e065',NULL,'basic-auth-otp','master','4c82d5b7-12ce-4eb2-8e42-1f7ea8923c75',3,20,_binary '\0',NULL,NULL),('89438b91-3764-4230-80bc-291e3531251b',NULL,'registration-profile-action','agrisud','08e3ac60-bc66-4591-8bfc-b58f973ad787',0,40,_binary '\0',NULL,NULL),('900a4c2d-cf6f-4037-a6c9-a79be8aa9e94',NULL,'auth-username-password-form','agrisud','54eb353f-b3d1-4c17-a10c-c5e31808bf33',0,10,_binary '\0',NULL,NULL),('91b9e9d5-76ba-4591-9ae5-8131917c34b6',NULL,'basic-auth-otp','agrisud','9f6f977e-de97-403f-98f1-16eef6789230',3,20,_binary '\0',NULL,NULL),('93f5ae0d-ec02-4ecb-9eaa-202850becb7d',NULL,'auth-spnego','master','319c13a1-6569-40d0-bf28-f8e3f5657311',3,20,_binary '\0',NULL,NULL),('9590c9f9-4fc3-499d-b1fe-e3ccf073c97a',NULL,'auth-spnego','agrisud','9f6f977e-de97-403f-98f1-16eef6789230',3,30,_binary '\0',NULL,NULL),('95a453c0-9b90-4059-baac-88584ba8c860',NULL,NULL,'agrisud','406d9d48-df76-4f3e-96e0-3a10337ffae6',1,40,_binary '','5069734f-54bd-4917-a2ab-c8016ea6c0a3',NULL),('95a7c386-46da-4015-a9ee-2ba40eb950b1',NULL,'conditional-user-configured','master','870cb402-0451-4e08-93d8-874d5254f77a',0,10,_binary '\0',NULL,NULL),('97464078-6ea6-437f-9ec4-795b4c3eee44',NULL,'idp-username-password-form','master','f0d08f6a-99e5-434e-8f51-209d1ae4863d',0,10,_binary '\0',NULL,NULL),('98db059c-3f84-4213-bca4-ed60eabbc37b',NULL,NULL,'agrisud','b43c7601-2a16-4fb2-a919-8287ca955147',2,20,_binary '','a6ab944f-f53c-4377-841a-5fe101187813',NULL),('9c73dfa9-3e13-43cc-95c7-45c683b1330b',NULL,'auth-otp-form','agrisud','6b5b409e-09b0-4521-b1a4-9fa63a36f997',0,20,_binary '\0',NULL,NULL),('9dbcd219-1545-42bf-956f-027735084cab',NULL,'registration-user-creation','agrisud','08e3ac60-bc66-4591-8bfc-b58f973ad787',0,20,_binary '\0',NULL,NULL),('9f2b5ded-2105-428d-babc-5d2014a9876e',NULL,'basic-auth','agrisud','9f6f977e-de97-403f-98f1-16eef6789230',0,10,_binary '\0',NULL,NULL),('accefbfb-01e3-419d-b88a-5a34988f491d',NULL,'idp-create-user-if-unique','master','5223160f-ec3c-4f5a-8cec-f03ebb9ac546',2,10,_binary '\0',NULL,'038d6da6-353e-418b-859c-90e4cb508650'),('aed4379e-61aa-43c4-bd21-be4a8e1aeece',NULL,NULL,'master','277a93a8-a71f-471c-b22c-392de87d2b66',1,40,_binary '','445f2458-2938-4400-bbae-08142511b49f',NULL),('af3dbeb6-d76b-42e9-a0b7-b94c66ff6373',NULL,'auth-cookie','master','319c13a1-6569-40d0-bf28-f8e3f5657311',2,10,_binary '\0',NULL,NULL),('b8bdd365-ff96-4fdb-877f-9a8341b5acbf',NULL,'conditional-user-configured','master','445f2458-2938-4400-bbae-08142511b49f',0,10,_binary '\0',NULL,NULL),('bb0a09cc-b5ce-42aa-a735-f4f87c37c1f2',NULL,'registration-recaptcha-action','agrisud','08e3ac60-bc66-4591-8bfc-b58f973ad787',3,60,_binary '\0',NULL,NULL),('bd02a4dc-012f-421a-9068-9a9a2f594bcf',NULL,'idp-confirm-link','master','493bceaf-faa9-4654-8e56-d82cebf5fd57',0,10,_binary '\0',NULL,NULL),('be59a4f0-805e-408c-8674-25ac93116227',NULL,NULL,'agrisud','94b7c46f-e95d-4b8e-9b57-8d7d542b8994',0,20,_binary '','b43c7601-2a16-4fb2-a919-8287ca955147',NULL),('c24c7f7f-c83a-4316-bba2-0127919673a0',NULL,'registration-password-action','master','935f8a37-06ab-409f-949a-e6ec74614870',0,50,_binary '\0',NULL,NULL),('c25aa7c6-71d8-47c0-950e-b79ae9e28b26',NULL,'idp-review-profile','agrisud','94b7c46f-e95d-4b8e-9b57-8d7d542b8994',0,10,_binary '\0',NULL,'b1cdba70-2b28-48aa-9ead-41a0264f8cd9'),('c6cf2106-1084-43b5-8370-d00f59616a6c',NULL,'registration-password-action','agrisud','08e3ac60-bc66-4591-8bfc-b58f973ad787',0,50,_binary '\0',NULL,NULL),('cd72b4e3-c4a7-45f2-8e4b-063ca918b334',NULL,'direct-grant-validate-otp','agrisud','42195ff9-7cbc-4c85-b736-c0b474e4ede4',0,20,_binary '\0',NULL,NULL),('d2e212ea-5d43-42f3-ac7b-6f06727890cc',NULL,'direct-grant-validate-username','master','07e39fac-ea99-4346-b3b5-ea2bb228ba46',0,10,_binary '\0',NULL,NULL),('d3481dce-4549-4134-b915-cc7858c9a349',NULL,'idp-review-profile','master','768f7dca-929b-41ee-9146-e972965f12d1',0,10,_binary '\0',NULL,'f34657b0-ecd6-4ecc-a571-27bf9eea1ad3'),('d40bad8c-0f4e-46cd-9861-598e4cd6e417',NULL,NULL,'agrisud','392f8112-b5c3-413e-900d-1370ad3a9621',0,20,_binary '','9f6f977e-de97-403f-98f1-16eef6789230',NULL),('d7725682-6796-433b-840f-75a1f9dccdf8',NULL,'reset-credential-email','master','277a93a8-a71f-471c-b22c-392de87d2b66',0,20,_binary '\0',NULL,NULL),('d8d6727d-5a11-4c27-b927-adf9d647c0cf',NULL,'idp-email-verification','agrisud','82035b31-3abb-45ec-99f6-3e732c6a6521',2,10,_binary '\0',NULL,NULL),('d963d491-5b96-406a-bb54-f06ad1793510',NULL,'registration-user-creation','master','935f8a37-06ab-409f-949a-e6ec74614870',0,20,_binary '\0',NULL,NULL),('daff8109-b8ec-435c-a88e-7e73457fb412',NULL,'reset-credentials-choose-user','master','277a93a8-a71f-471c-b22c-392de87d2b66',0,10,_binary '\0',NULL,NULL),('db446b0d-2bf7-45e8-996f-ff5cb6c3553b',NULL,'auth-otp-form','agrisud','a1d2b8bd-16dc-4632-929c-ba8ef26f7d1b',0,20,_binary '\0',NULL,NULL),('dbcffc4d-089b-4199-be3b-ca238efc3c6a',NULL,NULL,'agrisud','b30a09d0-2021-465a-ae1c-ae4553308637',2,30,_binary '','54eb353f-b3d1-4c17-a10c-c5e31808bf33',NULL),('dbe94360-c902-41f1-8dc6-2ebb866d47bb',NULL,NULL,'master','493bceaf-faa9-4654-8e56-d82cebf5fd57',0,20,_binary '','7096abd3-e0f9-43dd-9ed8-2cab6474bb1a',NULL),('de6708ba-0264-46cc-9fa0-06fbe92cd85b',NULL,'docker-http-basic-authenticator','master','60992f0b-25b3-47a1-bace-f3bba362e1f4',0,10,_binary '\0',NULL,NULL),('df32eefc-7af4-4073-8683-002cf1ca326b',NULL,'registration-recaptcha-action','master','935f8a37-06ab-409f-949a-e6ec74614870',3,60,_binary '\0',NULL,NULL),('dfb6c598-9fa7-4027-9853-badff9073e8e',NULL,NULL,'master','7096abd3-e0f9-43dd-9ed8-2cab6474bb1a',2,20,_binary '','f0d08f6a-99e5-434e-8f51-209d1ae4863d',NULL),('e4805acf-9fef-47cc-8d11-2ec2c946553f',NULL,'http-basic-authenticator','master','91282429-f0fc-4a9e-880c-923e55224b9c',0,10,_binary '\0',NULL,NULL),('e9426fde-affb-4db1-9e41-9636b0d7f904',NULL,'conditional-user-configured','agrisud','a1d2b8bd-16dc-4632-929c-ba8ef26f7d1b',0,10,_binary '\0',NULL,NULL),('ebd0d85a-4047-4dfb-abec-639cb12304f7',NULL,'client-secret','master','d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c',2,10,_binary '\0',NULL,NULL),('ef482ddb-d5f8-45aa-ae03-46690ac93996',NULL,'reset-otp','agrisud','5069734f-54bd-4917-a2ab-c8016ea6c0a3',0,20,_binary '\0',NULL,NULL),('ef91844f-29eb-4e85-9592-e810c78eaea2',NULL,'client-x509','master','d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c',2,40,_binary '\0',NULL,NULL),('efaebb6e-f6e1-4741-8a33-1823bee0c665',NULL,'client-secret-jwt','agrisud','b1b5bb6a-387c-49d7-a126-d3e48aa126b4',2,30,_binary '\0',NULL,NULL),('f014d19e-7ef8-4610-940f-c64b46cac394',NULL,'conditional-user-configured','master','fc4bdcd7-24bb-4ff2-a74c-6f52273912a9',0,10,_binary '\0',NULL,NULL),('f19929d3-c341-45db-8632-aac2d5faa807',NULL,'conditional-user-configured','master','e126cdfb-9e16-4458-8ffe-8a432a7a7a35',0,10,_binary '\0',NULL,NULL),('f33dffcf-7f89-4041-991a-98d0859e8fff',NULL,'http-basic-authenticator','agrisud','77dacf4f-eb53-4855-8c26-c5af400762be',0,10,_binary '\0',NULL,NULL),('f58e60cc-8305-452e-bc65-f9d3b8832bb3',NULL,'identity-provider-redirector','agrisud','b30a09d0-2021-465a-ae1c-ae4553308637',2,25,_binary '\0',NULL,NULL),('fe05f6b2-1333-4de1-a4b3-0de9a6bd54bd',NULL,'reset-password','agrisud','406d9d48-df76-4f3e-96e0-3a10337ffae6',0,30,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('07e39fac-ea99-4346-b3b5-ea2bb228ba46','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('08e3ac60-bc66-4591-8bfc-b58f973ad787','registration form','registration form','agrisud','form-flow',_binary '\0',_binary ''),('24653e8b-6aa8-4106-b4c1-4dc05f5f7421','registration','registration flow','agrisud','basic-flow',_binary '',_binary ''),('247d9bed-9c13-436c-8d10-2e1a02bba450','registration','registration flow','master','basic-flow',_binary '',_binary ''),('277a93a8-a71f-471c-b22c-392de87d2b66','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('318664a0-b631-4dc7-b60e-c96e300b079a','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('319c13a1-6569-40d0-bf28-f8e3f5657311','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('392f8112-b5c3-413e-900d-1370ad3a9621','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','agrisud','basic-flow',_binary '',_binary ''),('406d9d48-df76-4f3e-96e0-3a10337ffae6','reset credentials','Reset credentials for a user if they forgot their password or something','agrisud','basic-flow',_binary '',_binary ''),('42195ff9-7cbc-4c85-b736-c0b474e4ede4','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','agrisud','basic-flow',_binary '\0',_binary ''),('445f2458-2938-4400-bbae-08142511b49f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('493bceaf-faa9-4654-8e56-d82cebf5fd57','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('4c82d5b7-12ce-4eb2-8e42-1f7ea8923c75','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('5069734f-54bd-4917-a2ab-c8016ea6c0a3','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','agrisud','basic-flow',_binary '\0',_binary ''),('5223160f-ec3c-4f5a-8cec-f03ebb9ac546','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('5289f23c-81f8-4065-bee5-a967534da220','docker auth','Used by Docker clients to authenticate against the IDP','agrisud','basic-flow',_binary '',_binary ''),('5439e4a1-8b92-456e-8b40-a8a1958613c0','direct grant','OpenID Connect Resource Owner Grant','agrisud','basic-flow',_binary '',_binary ''),('54eb353f-b3d1-4c17-a10c-c5e31808bf33','forms','Username, password, otp and other auth forms.','agrisud','basic-flow',_binary '\0',_binary ''),('60992f0b-25b3-47a1-bace-f3bba362e1f4','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('6b5b409e-09b0-4521-b1a4-9fa63a36f997','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','agrisud','basic-flow',_binary '\0',_binary ''),('7096abd3-e0f9-43dd-9ed8-2cab6474bb1a','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('768f7dca-929b-41ee-9146-e972965f12d1','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('77dacf4f-eb53-4855-8c26-c5af400762be','saml ecp','SAML ECP Profile Authentication Flow','agrisud','basic-flow',_binary '',_binary ''),('82035b31-3abb-45ec-99f6-3e732c6a6521','Account verification options','Method with which to verity the existing account','agrisud','basic-flow',_binary '\0',_binary ''),('870cb402-0451-4e08-93d8-874d5254f77a','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('91282429-f0fc-4a9e-880c-923e55224b9c','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('935f8a37-06ab-409f-949a-e6ec74614870','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('94b7c46f-e95d-4b8e-9b57-8d7d542b8994','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','agrisud','basic-flow',_binary '',_binary ''),('9f6f977e-de97-403f-98f1-16eef6789230','Authentication Options','Authentication options.','agrisud','basic-flow',_binary '\0',_binary ''),('a1d2b8bd-16dc-4632-929c-ba8ef26f7d1b','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','agrisud','basic-flow',_binary '\0',_binary ''),('a6ab944f-f53c-4377-841a-5fe101187813','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','agrisud','basic-flow',_binary '\0',_binary ''),('b1b5bb6a-387c-49d7-a126-d3e48aa126b4','clients','Base authentication for clients','agrisud','client-flow',_binary '',_binary ''),('b30a09d0-2021-465a-ae1c-ae4553308637','browser','browser based authentication','agrisud','basic-flow',_binary '',_binary ''),('b43c7601-2a16-4fb2-a919-8287ca955147','User creation or linking','Flow for the existing/non-existing user alternatives','agrisud','basic-flow',_binary '\0',_binary ''),('c800b2b8-ac09-46fc-8c79-5e7b0888fb42','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('e126cdfb-9e16-4458-8ffe-8a432a7a7a35','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('f0d08f6a-99e5-434e-8f51-209d1ae4863d','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('fb6a052d-df70-4541-9450-fc89266f2152','Verify Existing Account by Re-authentication','Reauthentication of existing account','agrisud','basic-flow',_binary '\0',_binary ''),('fc4bdcd7-24bb-4ff2-a74c-6f52273912a9','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('038d6da6-353e-418b-859c-90e4cb508650','create unique user config','master'),('5de712d3-09ec-4928-ad07-6ea93b705411','create unique user config','agrisud'),('b1cdba70-2b28-48aa-9ead-41a0264f8cd9','review profile config','agrisud'),('f34657b0-ecd6-4ecc-a571-27bf9eea1ad3','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('038d6da6-353e-418b-859c-90e4cb508650','false','require.password.update.after.registration'),('5de712d3-09ec-4928-ad07-6ea93b705411','false','require.password.update.after.registration'),('b1cdba70-2b28-48aa-9ead-41a0264f8cd9','missing','update.profile.on.first.login'),('f34657b0-ecd6-4ecc-a571-27bf9eea1ad3','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/agrisud/account/',_binary '\0',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1c120fd8-01d1-491a-8848-1a075edb2ea4',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('1c85b59f-27c8-4953-a16c-b359702ede9b',_binary '',_binary '','agrisud-elearning-web',0,_binary '',NULL,'http://localhost:3000',_binary '\0',NULL,_binary '\0','agrisud','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','http://localhost:3000',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5309c50b-a361-4d19-9941-123e7777bc98',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('8b291110-88e3-4e1c-a252-27eb8e918e90',_binary '',_binary '','agrisud-mediatheque-api',0,_binary '\0','5eeeac13-a62d-4697-a2dc-51b595dcb686',NULL,_binary '',NULL,_binary '\0','agrisud','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332',_binary '',_binary '','agrisud-mediatheque-web',0,_binary '\0','6da11efe-90fc-4fbc-be7a-624e1569588b',NULL,_binary '\0',NULL,_binary '\0','agrisud','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/agrisud/console/',_binary '\0',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6',_binary '',_binary '','agrisud-website',0,_binary '\0','521f1108-b33e-4c42-b18d-5fa59d549e6d',NULL,_binary '\0',NULL,_binary '\0','agrisud','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e244f86d-20c4-4333-a98b-a26078cd5453',_binary '',_binary '\0','agrisud-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','agrisud Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ecbca5b7-b72d-4daf-abbe-586752c7fabf',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/agrisud/account/',_binary '\0',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f9605229-fec1-471e-ab8a-6dd8be258811',_binary '',_binary '','agrisud-elearning-api',0,_binary '\0','6ed23ce3-735a-4489-a8fd-b0ec41b5bd55',NULL,_binary '',NULL,_binary '\0','agrisud','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','agrisud','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('1c85b59f-27c8-4953-a16c-b359702ede9b','false','backchannel.logout.revoke.offline.tokens'),('1c85b59f-27c8-4953-a16c-b359702ede9b','true','backchannel.logout.session.required'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','client_credentials.use_refresh_token'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','display.on.consent.screen'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','exclude.session.state.from.auth.response'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','id.token.as.detached.signature'),('1c85b59f-27c8-4953-a16c-b359702ede9b','agrisud','login_theme'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','oauth2.device.authorization.grant.enabled'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','oidc.ciba.grant.enabled'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','require.pushed.authorization.requests'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml_force_name_id_format'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.artifact.binding'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.assertion.signature'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.authnstatement'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.client.signature'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.encrypt'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.force.post.binding'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.multivalued.roles'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.onetimeuse.condition'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.server.signature'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','saml.server.signature.keyinfo.ext'),('1c85b59f-27c8-4953-a16c-b359702ede9b','false','tls.client.certificate.bound.access.tokens'),('1c85b59f-27c8-4953-a16c-b359702ede9b','true','use.refresh.tokens'),('43378dab-19d9-48f5-957b-93d75cef9405','S256','pkce.code.challenge.method'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','backchannel.logout.revoke.offline.tokens'),('8b291110-88e3-4e1c-a252-27eb8e918e90','true','backchannel.logout.session.required'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','client_credentials.use_refresh_token'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','display.on.consent.screen'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','exclude.session.state.from.auth.response'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','id.token.as.detached.signature'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','oauth2.device.authorization.grant.enabled'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','oidc.ciba.grant.enabled'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml_force_name_id_format'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.artifact.binding'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.assertion.signature'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.authnstatement'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.client.signature'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.encrypt'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.force.post.binding'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.multivalued.roles'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.onetimeuse.condition'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.server.signature'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','saml.server.signature.keyinfo.ext'),('8b291110-88e3-4e1c-a252-27eb8e918e90','false','tls.client.certificate.bound.access.tokens'),('8b291110-88e3-4e1c-a252-27eb8e918e90','true','use.refresh.tokens'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','backchannel.logout.revoke.offline.tokens'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','true','backchannel.logout.session.required'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','client_credentials.use_refresh_token'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','display.on.consent.screen'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','exclude.session.state.from.auth.response'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','id.token.as.detached.signature'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','agrisud','login_theme'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','oauth2.device.authorization.grant.enabled'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','oidc.ciba.grant.enabled'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','require.pushed.authorization.requests'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml_force_name_id_format'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.artifact.binding'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.assertion.signature'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.authnstatement'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.client.signature'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.encrypt'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.force.post.binding'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.multivalued.roles'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.onetimeuse.condition'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.server.signature'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','saml.server.signature.keyinfo.ext'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','false','tls.client.certificate.bound.access.tokens'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','true','use.refresh.tokens'),('992dc2a9-4481-409c-a2cd-e9f763708966','S256','pkce.code.challenge.method'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','S256','pkce.code.challenge.method'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','backchannel.logout.revoke.offline.tokens'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','true','backchannel.logout.session.required'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','client_credentials.use_refresh_token'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','display.on.consent.screen'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','exclude.session.state.from.auth.response'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','id.token.as.detached.signature'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','agrisud','login_theme'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','oauth2.device.authorization.grant.enabled'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','oidc.ciba.grant.enabled'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','require.pushed.authorization.requests'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml_force_name_id_format'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.artifact.binding'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.assertion.signature'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.authnstatement'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.client.signature'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.encrypt'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.force.post.binding'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.multivalued.roles'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.onetimeuse.condition'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.server.signature'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','saml.server.signature.keyinfo.ext'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','false','tls.client.certificate.bound.access.tokens'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','true','use.refresh.tokens'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','S256','pkce.code.challenge.method'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','backchannel.logout.revoke.offline.tokens'),('f9605229-fec1-471e-ab8a-6dd8be258811','true','backchannel.logout.session.required'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','client_credentials.use_refresh_token'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','display.on.consent.screen'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','exclude.session.state.from.auth.response'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','id.token.as.detached.signature'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','oauth2.device.authorization.grant.enabled'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','oidc.ciba.grant.enabled'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml_force_name_id_format'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.artifact.binding'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.assertion.signature'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.authnstatement'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.client.signature'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.encrypt'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.force.post.binding'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.multivalued.roles'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.onetimeuse.condition'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.server.signature'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','saml.server.signature.keyinfo.ext'),('f9605229-fec1-471e-ab8a-6dd8be258811','false','tls.client.certificate.bound.access.tokens'),('f9605229-fec1-471e-ab8a-6dd8be258811','true','use.refresh.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0654dad5-2c79-4125-9ccb-bd00a13ac1cf','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('20cc646a-3639-43c7-9f31-25314eadaa62','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('25b4588f-774f-414b-bf22-6ac6139d40ea','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('29acc8c5-7077-4e34-9b55-1bc135e17a0f','profile','agrisud','OpenID Connect built-in scope: profile','openid-connect'),('388f9f49-c6b0-430c-84fa-9759dd8cc94a','email','agrisud','OpenID Connect built-in scope: email','openid-connect'),('41faad61-0e8d-4fea-ae72-af8a0790f77b','address','master','OpenID Connect built-in scope: address','openid-connect'),('46065d8d-b927-4302-acdc-a4008e3add1b','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('487d2c24-7bde-46f2-9b79-2942b8e522f2','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('521ddc59-071b-4f7c-81b3-ea0dae531137','role_list','master','SAML role list','saml'),('5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40','web-origins','agrisud','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('79ac4992-fa14-4fef-a5c0-140cdb6a3a97','email','master','OpenID Connect built-in scope: email','openid-connect'),('85de2f58-e5fe-4430-bc04-5eb8db4fa9c3','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('97df87ed-55f8-4994-a849-42240c78940e','address','agrisud','OpenID Connect built-in scope: address','openid-connect'),('a5695cb1-b801-4d4b-944f-32461e5b34b5','offline_access','agrisud','OpenID Connect built-in scope: offline_access','openid-connect'),('c276b458-e2d8-491a-8c07-0fe68498213b','roles','agrisud','OpenID Connect scope for add user roles to the access token','openid-connect'),('cd9f3f92-4c84-4c45-b282-7d33501d567e','phone','agrisud','OpenID Connect built-in scope: phone','openid-connect'),('e458043d-d5ee-4208-b037-2206550c765a','role_list','agrisud','SAML role list','saml'),('f94c648f-9cab-4ade-9556-851c690cf6b3','microprofile-jwt','agrisud','Microprofile - JWT built-in scope','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0654dad5-2c79-4125-9ccb-bd00a13ac1cf','${offlineAccessScopeConsentText}','consent.screen.text'),('0654dad5-2c79-4125-9ccb-bd00a13ac1cf','true','display.on.consent.screen'),('20cc646a-3639-43c7-9f31-25314eadaa62','${rolesScopeConsentText}','consent.screen.text'),('20cc646a-3639-43c7-9f31-25314eadaa62','true','display.on.consent.screen'),('20cc646a-3639-43c7-9f31-25314eadaa62','false','include.in.token.scope'),('25b4588f-774f-414b-bf22-6ac6139d40ea','${profileScopeConsentText}','consent.screen.text'),('25b4588f-774f-414b-bf22-6ac6139d40ea','true','display.on.consent.screen'),('25b4588f-774f-414b-bf22-6ac6139d40ea','true','include.in.token.scope'),('29acc8c5-7077-4e34-9b55-1bc135e17a0f','${profileScopeConsentText}','consent.screen.text'),('29acc8c5-7077-4e34-9b55-1bc135e17a0f','true','display.on.consent.screen'),('29acc8c5-7077-4e34-9b55-1bc135e17a0f','true','include.in.token.scope'),('388f9f49-c6b0-430c-84fa-9759dd8cc94a','${emailScopeConsentText}','consent.screen.text'),('388f9f49-c6b0-430c-84fa-9759dd8cc94a','true','display.on.consent.screen'),('388f9f49-c6b0-430c-84fa-9759dd8cc94a','true','include.in.token.scope'),('41faad61-0e8d-4fea-ae72-af8a0790f77b','${addressScopeConsentText}','consent.screen.text'),('41faad61-0e8d-4fea-ae72-af8a0790f77b','true','display.on.consent.screen'),('41faad61-0e8d-4fea-ae72-af8a0790f77b','true','include.in.token.scope'),('46065d8d-b927-4302-acdc-a4008e3add1b','false','display.on.consent.screen'),('46065d8d-b927-4302-acdc-a4008e3add1b','true','include.in.token.scope'),('487d2c24-7bde-46f2-9b79-2942b8e522f2','${phoneScopeConsentText}','consent.screen.text'),('487d2c24-7bde-46f2-9b79-2942b8e522f2','true','display.on.consent.screen'),('487d2c24-7bde-46f2-9b79-2942b8e522f2','true','include.in.token.scope'),('521ddc59-071b-4f7c-81b3-ea0dae531137','${samlRoleListScopeConsentText}','consent.screen.text'),('521ddc59-071b-4f7c-81b3-ea0dae531137','true','display.on.consent.screen'),('5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40','','consent.screen.text'),('5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40','false','display.on.consent.screen'),('5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40','false','include.in.token.scope'),('79ac4992-fa14-4fef-a5c0-140cdb6a3a97','${emailScopeConsentText}','consent.screen.text'),('79ac4992-fa14-4fef-a5c0-140cdb6a3a97','true','display.on.consent.screen'),('79ac4992-fa14-4fef-a5c0-140cdb6a3a97','true','include.in.token.scope'),('85de2f58-e5fe-4430-bc04-5eb8db4fa9c3','','consent.screen.text'),('85de2f58-e5fe-4430-bc04-5eb8db4fa9c3','false','display.on.consent.screen'),('85de2f58-e5fe-4430-bc04-5eb8db4fa9c3','false','include.in.token.scope'),('97df87ed-55f8-4994-a849-42240c78940e','${addressScopeConsentText}','consent.screen.text'),('97df87ed-55f8-4994-a849-42240c78940e','true','display.on.consent.screen'),('97df87ed-55f8-4994-a849-42240c78940e','true','include.in.token.scope'),('a5695cb1-b801-4d4b-944f-32461e5b34b5','${offlineAccessScopeConsentText}','consent.screen.text'),('a5695cb1-b801-4d4b-944f-32461e5b34b5','true','display.on.consent.screen'),('c276b458-e2d8-491a-8c07-0fe68498213b','${rolesScopeConsentText}','consent.screen.text'),('c276b458-e2d8-491a-8c07-0fe68498213b','true','display.on.consent.screen'),('c276b458-e2d8-491a-8c07-0fe68498213b','false','include.in.token.scope'),('cd9f3f92-4c84-4c45-b282-7d33501d567e','${phoneScopeConsentText}','consent.screen.text'),('cd9f3f92-4c84-4c45-b282-7d33501d567e','true','display.on.consent.screen'),('cd9f3f92-4c84-4c45-b282-7d33501d567e','true','include.in.token.scope'),('e458043d-d5ee-4208-b037-2206550c765a','${samlRoleListScopeConsentText}','consent.screen.text'),('e458043d-d5ee-4208-b037-2206550c765a','true','display.on.consent.screen'),('f94c648f-9cab-4ade-9556-851c690cf6b3','false','display.on.consent.screen'),('f94c648f-9cab-4ade-9556-851c690cf6b3','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('09fe7b43-39f4-4ce6-8bf6-64fb50f06440','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('1c120fd8-01d1-491a-8848-1a075edb2ea4','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('1c120fd8-01d1-491a-8848-1a075edb2ea4','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('1c120fd8-01d1-491a-8848-1a075edb2ea4','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('1c120fd8-01d1-491a-8848-1a075edb2ea4','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('1c120fd8-01d1-491a-8848-1a075edb2ea4','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('1c120fd8-01d1-491a-8848-1a075edb2ea4','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('1c120fd8-01d1-491a-8848-1a075edb2ea4','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('1c120fd8-01d1-491a-8848-1a075edb2ea4','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('1c85b59f-27c8-4953-a16c-b359702ede9b','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('1c85b59f-27c8-4953-a16c-b359702ede9b','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('1c85b59f-27c8-4953-a16c-b359702ede9b','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('1c85b59f-27c8-4953-a16c-b359702ede9b','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('1c85b59f-27c8-4953-a16c-b359702ede9b','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('1c85b59f-27c8-4953-a16c-b359702ede9b','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('1c85b59f-27c8-4953-a16c-b359702ede9b','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('1c85b59f-27c8-4953-a16c-b359702ede9b','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('43378dab-19d9-48f5-957b-93d75cef9405','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('43378dab-19d9-48f5-957b-93d75cef9405','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('43378dab-19d9-48f5-957b-93d75cef9405','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('43378dab-19d9-48f5-957b-93d75cef9405','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('4f324fe9-5ffe-488f-a239-e31831b6b504','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('4f324fe9-5ffe-488f-a239-e31831b6b504','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('4f324fe9-5ffe-488f-a239-e31831b6b504','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('4f324fe9-5ffe-488f-a239-e31831b6b504','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('4f324fe9-5ffe-488f-a239-e31831b6b504','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('4f324fe9-5ffe-488f-a239-e31831b6b504','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('4f324fe9-5ffe-488f-a239-e31831b6b504','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('4f324fe9-5ffe-488f-a239-e31831b6b504','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('5309c50b-a361-4d19-9941-123e7777bc98','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('5309c50b-a361-4d19-9941-123e7777bc98','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('5309c50b-a361-4d19-9941-123e7777bc98','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('5309c50b-a361-4d19-9941-123e7777bc98','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('5309c50b-a361-4d19-9941-123e7777bc98','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('5309c50b-a361-4d19-9941-123e7777bc98','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('5309c50b-a361-4d19-9941-123e7777bc98','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('5309c50b-a361-4d19-9941-123e7777bc98','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('8b291110-88e3-4e1c-a252-27eb8e918e90','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('8b291110-88e3-4e1c-a252-27eb8e918e90','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('8b291110-88e3-4e1c-a252-27eb8e918e90','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('8b291110-88e3-4e1c-a252-27eb8e918e90','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('8b291110-88e3-4e1c-a252-27eb8e918e90','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('8b291110-88e3-4e1c-a252-27eb8e918e90','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('8b291110-88e3-4e1c-a252-27eb8e918e90','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('8b291110-88e3-4e1c-a252-27eb8e918e90','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('992dc2a9-4481-409c-a2cd-e9f763708966','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('992dc2a9-4481-409c-a2cd-e9f763708966','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('992dc2a9-4481-409c-a2cd-e9f763708966','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('992dc2a9-4481-409c-a2cd-e9f763708966','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('ecbca5b7-b72d-4daf-abbe-586752c7fabf','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary ''),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('f9605229-fec1-471e-ab8a-6dd8be258811','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('f9605229-fec1-471e-ab8a-6dd8be258811','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('f9605229-fec1-471e-ab8a-6dd8be258811','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('f9605229-fec1-471e-ab8a-6dd8be258811','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('f9605229-fec1-471e-ab8a-6dd8be258811','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('f9605229-fec1-471e-ab8a-6dd8be258811','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('f9605229-fec1-471e-ab8a-6dd8be258811','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('f9605229-fec1-471e-ab8a-6dd8be258811','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('fa291eb0-7114-4956-ab7b-b00e2bd0d68f','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('0654dad5-2c79-4125-9ccb-bd00a13ac1cf','105f7b94-91f6-451a-a2d4-ae8eb3a6bc1c'),('a5695cb1-b801-4d4b-944f-32461e5b34b5','ad417a7a-c720-4230-bb84-a291bc72305b');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('155b776c-321c-42e4-82a9-c216cc5c92c6','aes-generated','agrisud','aes-generated','org.keycloak.keys.KeyProvider','agrisud',NULL),('1c9ebf2b-bfb3-4dd7-a030-250f8237f6e7','Trusted Hosts','agrisud','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('1d5910e4-b154-471e-a1a1-7962304f49de','Consent Required','agrisud','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('23ecdab8-adb1-46c2-a002-14436133352e','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('39a9c42c-fd60-4084-b898-66a97cddde83','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('45408158-12c3-4041-b8db-40651c7aafed','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('48d9ab39-3eab-41c0-b873-842e970da540','Allowed Client Scopes','agrisud','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','authenticated'),('4ab3afa2-7774-41e0-8be6-9e8de567a7a0',NULL,'agrisud','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','agrisud',NULL),('5d3d0d5e-19a8-4a5c-ae4c-32cded7cf6d9','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5e733265-1227-4c18-affb-e16f2d34775e','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5f3f914c-7451-4ac0-a1b3-221051dce7e9','hmac-generated','agrisud','hmac-generated','org.keycloak.keys.KeyProvider','agrisud',NULL),('680c8123-0833-4e97-b9e9-d909ccd668d5','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('72746efc-faa2-4853-a512-0e5f31dcb4bc','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('736915de-0cec-415f-b0e6-9bf9590de130','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('8cc553cb-a134-4ed6-9131-360a49572727','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9183fb84-0a87-4aa5-9f98-8a788dc51c1b','Allowed Protocol Mapper Types','agrisud','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','authenticated'),('989b24cf-8295-446e-a1cb-70351135a441','Allowed Protocol Mapper Types','agrisud','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('9cabb299-4ebf-4934-b0dc-516ad3125e81','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('af018084-4dd6-49f9-bb8a-0ef7b2fb1f9e','Max Clients Limit','agrisud','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('b5de2020-4609-4655-97db-3047eff6447a','Full Scope Disabled','agrisud','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('d1fcc700-9853-43ab-b551-8ef35c6c97b4','Allowed Client Scopes','agrisud','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','agrisud','anonymous'),('ef1e5b77-d875-40cf-894e-5279b43794b6','rsa-generated','agrisud','rsa-generated','org.keycloak.keys.KeyProvider','agrisud',NULL),('f201fb8d-a6a6-4939-a568-59a881625f4c','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('00a2f591-f7c7-4460-8e64-1f75aa02ab24','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('05c8fc1f-ca01-4a00-bdd8-8a70e095162e','d1fcc700-9853-43ab-b551-8ef35c6c97b4','allow-default-scopes','true'),('09931679-0d07-4aa1-8475-a7eb4a1b71d8','5f3f914c-7451-4ac0-a1b3-221051dce7e9','secret','Rc_Sqj9dIyIEyz1DQPNlLIp4UTGzd-n4sn4Vkuc-Ca7rCMzceZiJNW20gmR2H1lNtZ7nRpy5Sr8n34GTzxX8mA'),('15cc2e7d-1c34-4ed1-998c-049aa037743a','48d9ab39-3eab-41c0-b873-842e970da540','allow-default-scopes','true'),('16c992ce-8b8e-45ba-bbb3-937e0afb7f87','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1ee2e743-1d9d-4e2e-bb76-230d2840b679','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('23cbf7cd-7ca0-4651-bb3a-402259e49bce','1c9ebf2b-bfb3-4dd7-a030-250f8237f6e7','host-sending-registration-request-must-match','true'),('24913b0b-3cf5-4a55-a195-e643f9cc88e5','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','saml-role-list-mapper'),('28347436-6011-4acd-97a2-237636546c91','f201fb8d-a6a6-4939-a568-59a881625f4c','allow-default-scopes','true'),('2e7fe922-91be-4f33-8082-79f4bd1b6bb6','ef1e5b77-d875-40cf-894e-5279b43794b6','priority','100'),('32729414-b2cc-4348-a4c6-d10cfa9f7baa','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('37c265d1-6564-4026-bf89-f22afb1a585a','9cabb299-4ebf-4934-b0dc-516ad3125e81','algorithm','HS256'),('3ed3007d-1712-4ab9-b150-a9950227b526','39a9c42c-fd60-4084-b898-66a97cddde83','secret','Di9RmWjea49N_6NQtl13fw'),('3f17f3f1-fdf1-44ba-bb77-fc92bdfc6652','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','oidc-full-name-mapper'),('3f4b555d-ac5e-47dc-aead-4da38bba0374','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','oidc-address-mapper'),('4183ce65-c28c-47ad-8713-db3656742eec','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('419d68e7-9e8b-4486-90a4-7e16226da7e9','ef1e5b77-d875-40cf-894e-5279b43794b6','certificate','MIICnTCCAYUCBgF67iP4IjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdhZ3Jpc3VkMB4XDTIxMDcyODE3MjExMloXDTMxMDcyODE3MjI1MlowEjEQMA4GA1UEAwwHYWdyaXN1ZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALb+E3mJ9cp0PNTVG9ORQWXAAUEdF20JOezTLmpLP9tOEp6hMJbS2pml+AuKfl9QgANh5qa7R7Rlr9OpTjK2mkXe4qS4zhpFLeEBLhUDqISqI6DksVE0E6XEaSYR3hqO15faoS9d4W3Me5BzFgfVCZTYaVLg9F3pTGPKjHKm00dWm8oQBFWLrEmMA7gyU83y+Bw6y8LawziDPaszzZVuMaqPw2FLUEt8DQukmwCZEjhMd6dLP0ibW64S53B96HwvwiRuZvugHvUonkcla/Yozy48py+f0K4zCZhsfsEizVAVFvCcqYI7ZGx0MXgcJoPDTE6o7Pm1RyYCHcMBzqOj9zkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAVhTTLE1tLplX9brQBx+gzZ8KJYzv0M1I9OCDbHAH5edJPGoY1bL9PICmENEzPlY7S3YGxvVqiujTfWJ0TUwqqhDCz61Jm8dYodH1S6G9CNpTFai00jOBwq3eIE4Gt/8cv+9csh6mMaHJmNlS0iqfUiCcy5o5YysWIfnN/EfV3D/70v7+I7QszqJ3NATGEfdoV8lAaFQ3LrSvEeC33RKSQ7lJBktxksdtlUC//jCS+jxAU8LuYeF+kwbN59xo7okVpvdEG/WeWFNYJ2M1RgZVWO+3QjK2SsE9eChlP3CqnqQWgpBse3/kLT1dWTFYAzfe8hiqzrvJQJAjj0ruYE1yHQ=='),('41d721f9-c172-484f-bb86-b9e739c81bee','9cabb299-4ebf-4934-b0dc-516ad3125e81','kid','10cff0c2-0699-46cd-bf28-82dfcde4dd8b'),('42bfb79e-bbd9-4a38-bfb7-c70e2db27fe5','5f3f914c-7451-4ac0-a1b3-221051dce7e9','priority','100'),('4ccc4ee3-a1f7-42ad-b98f-35e29fc4f73d','39a9c42c-fd60-4084-b898-66a97cddde83','priority','100'),('506246ed-7bdf-4301-98ca-7ba09d699e8f','ef1e5b77-d875-40cf-894e-5279b43794b6','privateKey','MIIEpAIBAAKCAQEAtv4TeYn1ynQ81NUb05FBZcABQR0XbQk57NMuaks/204SnqEwltLamaX4C4p+X1CAA2HmprtHtGWv06lOMraaRd7ipLjOGkUt4QEuFQOohKojoOSxUTQTpcRpJhHeGo7Xl9qhL13hbcx7kHMWB9UJlNhpUuD0XelMY8qMcqbTR1abyhAEVYusSYwDuDJTzfL4HDrLwtrDOIM9qzPNlW4xqo/DYUtQS3wNC6SbAJkSOEx3p0s/SJtbrhLncH3ofC/CJG5m+6Ae9SieRyVr9ijPLjynL5/QrjMJmGx+wSLNUBUW8JypgjtkbHQxeBwmg8NMTqjs+bVHJgIdwwHOo6P3OQIDAQABAoIBAGgGAP4bPd0LvLTkPEBFl16HCm+AYRu7nfERj5YfFrrNI+qHCP8D9/5WCa5N2U7HjS3fDmYDmlxjXdM9sFVF1mcXr9EhuQ/X+Z+psw+BF9/qc/x3ZJEbwHuALqHUkGSahNYvE2fAv3BSSH+x3HkxUpQJfb3+YQutnp4vuy1Fxl8LVFRuMF0k1SUN4GkFReb/rEKMSmS5r1akxHTHXrrCOGQtscYSdxbahqxw70zZE3XRKy88j/M4/Jt+u0fGTN/rpNvOpBdu1hjzUTddBdEsRXP/tkXpewXBC0XnotIwiDyg/lPKxucJc7oMruxW6Sd067cr9KBNLz/nUC3LA19c2gECgYEA/+n8JNhM3e8iIGZRINgLQ7Oyggqzs96FtsculSBbg8MsgGAlyC/y5v+/Zc0APg4tOyfRolgdD708M3e4Yu3iNz6sRUAzyc1Jcp6MYb4P2nCwAcL6K9Gi/2Mssv7iWpdvBLFYYQ5/pM6+bEK35KFZB6HLjSpNAM5KAEy/5gn7JUECgYEAtw3Ra2faUj1lFqMqYbg8WowjE7//1i9L7kUDf8iB/2CRL0jiUeAA0C/A+5QAnV1U2SVpRy8PMQkJudRo/6CshBPrBKv59W+2CUaGdwBgGZAyKp5SwLee5WB1TL7+AQtACuqp0b2CyrCHRw2s1piieDYZVHvtEFvrtMlm6u1W+/kCgYEA3ob8zKEU/erBdwDhTLjv2pf4AeICbsZw6QV7+Qpg6UseeCai09b11W3PZVsD+fHj3Mt8GzmZU6VOIsbYm5WUnksuCy2PmsuaMUOyeA+Hw383XODJHq80l/QJ2z+NXg7N53u6iPLNhWaM6KB/PRwbyWokEIUW3juC143lU8ecDcECgYB/FFezQbi96SNZkNKmXll/3tOnLV51mgYTltO0DUW6PZbtBaMgherqnIxT2s6GcLmruh4ZLeFVAFpBKOXvuOKrGozIhH+V1QTB8bT9vkP42zMIhTsb0R29TbaBHgKGRQIj0f8svWykO+Ld/+9iVzpLS/tPvGy6M6YxrrQFGdmOOQKBgQDlOBywSLLFYMSxwKxi/ZK0rtLOVgK3SLZIUDI0Wo431GWFyLedaphgN8NRp3wXoJzFkPmLVRVG4MX+tfBENkB7ykQQnUNklB3Dfi+nxHoP+VnpS5NOGEWWgXEtrIWSc5nvghUtOh3W9Pta/B5xfS1WK2/rzmJToYmZXMsvY7nJcA=='),('53b84a79-6ba7-47aa-b9be-0f339d9ce691','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','saml-user-property-mapper'),('54bb988e-56a7-4bc0-bdf6-917ac8c2d4d6','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('55ba0705-244b-4b8a-9591-3ed9bed8a012','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('5857ff28-3b07-4bb0-818c-daac9922fa20','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('59031f7f-2bcb-42e6-8b47-0ba32030ee02','155b776c-321c-42e4-82a9-c216cc5c92c6','priority','100'),('5aa7ad15-e74b-4155-93d5-68ff17ea596a','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','oidc-address-mapper'),('603a53a8-70e5-4d12-8dca-05628f64ae0e','5e733265-1227-4c18-affb-e16f2d34775e','client-uris-must-match','true'),('63e01642-c484-4188-a929-f0859d2baf11','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','saml-user-property-mapper'),('6665d806-d139-4615-ab82-89276185c98a','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','oidc-address-mapper'),('67634908-d9dc-43d8-978e-66425e193d82','39a9c42c-fd60-4084-b898-66a97cddde83','kid','57815951-5664-4ffa-aaa4-9d2a00e07bac'),('6bca1d5e-94a3-4ca5-b25d-9905e983b8a9','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6f6127c0-1022-40de-a13b-2befb3aaa97c','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('7f84bf90-6606-4e44-9a90-9212abfa0438','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('842fa7c1-5e05-4848-acf5-3fdd0ce6759b','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('8439977c-81b0-4259-8dde-09c5dbb9c976','5f3f914c-7451-4ac0-a1b3-221051dce7e9','kid','ad3a333b-1b17-4d3f-b4d2-d0913bb21c06'),('875e23bb-ef7e-4631-a7ee-2c778e93668c','9cabb299-4ebf-4934-b0dc-516ad3125e81','secret','m4_XliGviIjrDNw8A2jSC0SY4LdDHM_rjWpp4ryLUZ-PtXdwxZQVE7mZc94UXqzMmYCfij29DetqXQo37QQG7Q'),('895b1ad5-d0e0-4d9a-8083-c4663e6de7a0','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','saml-user-property-mapper'),('8f1c93c6-103d-42e9-9b68-11404ee4ef66','5f3f914c-7451-4ac0-a1b3-221051dce7e9','algorithm','HS256'),('96be2716-a1ba-458a-8171-dd78a3704049','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','oidc-address-mapper'),('a054dfbc-3dfc-4c69-aef0-8ed6b9ef8ac3','1c9ebf2b-bfb3-4dd7-a030-250f8237f6e7','client-uris-must-match','true'),('a135b928-1e3d-4894-b5de-6677f1917714','155b776c-321c-42e4-82a9-c216cc5c92c6','secret','JRr9bezEzpUSQ-ehqREk7g'),('a57297dc-d5c2-45eb-bd11-3ecf75b2b288','45408158-12c3-4041-b8db-40651c7aafed','priority','100'),('a82da062-bdb3-47d0-9d5e-7c074869da67','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','saml-role-list-mapper'),('a84f8984-f27e-4112-abd7-4bbd8511e477','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','saml-user-property-mapper'),('ac9bf221-91fc-40eb-a3c4-f4001793538e','45408158-12c3-4041-b8db-40651c7aafed','certificate','MIICmzCCAYMCBgF67iLWTTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjEwNzI4MTcxOTU4WhcNMzEwNzI4MTcyMTM4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDIBqL3r+daSJF+RMRkPYpuXFDDpSJZIDCnEX4/9lP+ofj1fxb4M+KhQXpGk/NyZNISl9WwlybgKWY4WusVQxDpVk61oV3aQbo+Stn8/5IkE1xHAWD+x33gfBw2bCDAckXAJ9m+j5vlzzHWYW89IF0psVrYqEQf8vc6xETt0nezDQ0bXnA1BPWIgylNYvwIr3/g7wpFeexV+SjmYNaOhttitC6KhGKKdmAsJu3mBFW5yHXJfr4Q99OZ7w0pU36KxbbmxLxmZQabYbbH+yQPjXemKHTVa/kB6Iunlng0TjLh8ORqzo+3p7sYKQTs5sYbTaRblendFZU7kdmuUFx8fgDtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAC4StDqtLjTpbucP9mzrP7sf/YV/BoJG4XQA31wr1yeJqX7gst93x3VT63U7SAwaHdsiE0jp5rFos6tJ/rt4J7g87zSbtK0R9n4taOW+xUXtqOIEv5LzULB7wMCBZfN2G1Gm73xKbv2uYN8CO+e8OXglYIRlIT+tTe2y0IRCTJJgy5KvYeXWKFxGQakSJm2RwEztke10YiTbqYC0yl6eN+tN4HD8dchM7nKkea5Hh5QsWNTD/FKo858BvabacwDaMWaJ7OHgtOrHEAbOfnfbS1N9vf+xfYzbXQ+sJuidIURbHN5cXVjfXErXLvO6LxWkKvPo1962eYQTfUuh6jp+cM0='),('ae336d5a-4d5f-4896-b125-f5f6640cc3c9','155b776c-321c-42e4-82a9-c216cc5c92c6','kid','6862d128-799e-4bcf-b64a-76def18f668b'),('b44599be-a676-4db3-8a71-b942668efc55','736915de-0cec-415f-b0e6-9bf9590de130','max-clients','200'),('b61b3e94-7623-43f8-a4bf-c26c47fc01d8','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','oidc-full-name-mapper'),('b81ba312-1c32-4dc9-bc11-6e190b22c12b','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','saml-role-list-mapper'),('bd9e6762-5cbb-4335-9d2d-1ff64f761483','680c8123-0833-4e97-b9e9-d909ccd668d5','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c4b31028-8d00-4813-ba52-e1db1c55b669','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c8d1c726-56c3-49e1-a9b1-22710d654e32','45408158-12c3-4041-b8db-40651c7aafed','privateKey','MIIEpAIBAAKCAQEAyAai96/nWkiRfkTEZD2KblxQw6UiWSAwpxF+P/ZT/qH49X8W+DPioUF6RpPzcmTSEpfVsJcm4ClmOFrrFUMQ6VZOtaFd2kG6PkrZ/P+SJBNcRwFg/sd94HwcNmwgwHJFwCfZvo+b5c8x1mFvPSBdKbFa2KhEH/L3OsRE7dJ3sw0NG15wNQT1iIMpTWL8CK9/4O8KRXnsVfko5mDWjobbYrQuioRiinZgLCbt5gRVuch1yX6+EPfTme8NKVN+isW25sS8ZmUGm2G2x/skD413pih01Wv5AeiLp5Z4NE4y4fDkas6Pt6e7GCkE7ObGG02kW5Xp3RWVO5HZrlBcfH4A7QIDAQABAoIBAQC9rq10PHckApUWLJgghstzhE+CeGJuKjx48fnLJgjY+zhfdbmOfYV4beNKcpr16+3ae+nEoFHZWOj6oB01+HddDt9tFi0uAA5hbBHz/VfUphdnrkMQ2JTiAE+wvDECzlqesiumrgCkmSslpRgb20j9dJY1xrtzoLAaJm1HKcMhIpw7KjDxchZ4aqBo314a1mcc2x4wEWY8NspzwWNf6WJH+sqToKGHKDmWXy1FSv64dXcVLjxlV4QteFWyXxzV/eQBbgr4cbTeb6/VPmydAC0hu4l7bzyaASY3jO/mNVyT3tRp5PllkL7TXisQUqnCXagLdTtXA1sifi62AuUkqBPxAoGBAPg0uZDUl+73jIAe0wwb1y7VNXKYVX41so/76v3g8qVCihCKWw3/+UFv3P2CGTmDRrYvSk4mVi6HASNd/RjO5WdveY2+mAGRcBx/4cXCa+J5BmxCzntJK5mMJuSYPXTxStetiMRapsP/fcAJ/eEZULNoY411Pe17YGLJOF/GYbH3AoGBAM5OmkcM19Qe1zhAgaO6Na68ZX+0uSxYFBXABEq5ntA+df+wmSdL60weTl9s7hviuLeIyI6dUplv8FKCeUgz8qhHWq9tiT7F4DXV0r28veOp9VoFkiNwrYXE897+l2ls60i6d0K6K9YTjp9Vbs80aNJD/mGxlNl4WVVUs27INqs7AoGAc3o8V6jBY1njEXzF3h1Z2R0zN7SuGgErqZegNiwhWEgD6jwkrvfH5O0BmSSdTcfI71xDKublM9J18hl5dsBTtPMFT7A8Eoay7V+GEDcrcHu0REw0uuFJGrA9LB+0gCL/GidPuWMfsZK908oSR1c6162am6bPgBzltDBAPTcUHvMCgYAarCzkDLQGt6oJmsVn/pYcLj1NIndiVUzbdwTXCGKQ99JXqWRToUwdfjmRusqaDljlWajcT1izf7ZpZHb7r8Oqn/cIgTfiRsDzFN73KuS9/2Y6Kkg3jsTQa6M/7Fh1B+DveTQcC2fJeKPS07/MyDDZJnNH/CaLazTZhGbiZr4yqwKBgQC1+6E9X1NJMd2PViFXJctTUpdMYcb6QqSW9/Vc4FDk1/EneRVM1xShl5aMBVcWRkZcbyrNUsc7s8z5fqksaIOVOHucP+2u5BYwhsIzxqNbS/2ixNUo7ovPZPxDN4ZRXQriPo2OHl6Bq8qj8SNhF3Z4tZTwZ/F3j7kbrz89I5A25Q=='),('ccd97d26-ae2f-4ec2-b7cc-b8eeb301039a','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ce5f61de-d979-4375-8961-a883685e73e1','af018084-4dd6-49f9-bb8a-0ef7b2fb1f9e','max-clients','200'),('d1723886-aeee-4183-84a7-0d8d5fdc9dae','989b24cf-8295-446e-a1cb-70351135a441','allowed-protocol-mapper-types','saml-role-list-mapper'),('d5d52e84-92a4-4b2f-8da4-e644bf32bc16','8cc553cb-a134-4ed6-9131-360a49572727','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d6d2e46f-052e-48b1-af7e-c1acc009988a','23ecdab8-adb1-46c2-a002-14436133352e','allow-default-scopes','true'),('e9643221-c263-4d40-a39f-7da42f406318','5e733265-1227-4c18-affb-e16f2d34775e','host-sending-registration-request-must-match','true'),('f0d1367b-078c-410c-b2fe-301b63624cce','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('f505b670-ac39-4252-a63e-a11bd851d89e','9183fb84-0a87-4aa5-9f98-8a788dc51c1b','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fda841b0-90db-4c90-a5bd-3eba348f857e','9cabb299-4ebf-4934-b0dc-516ad3125e81','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1ae12950-4d1f-4b1a-8f06-7c1014a11e40','62848005-b62c-4dbb-9a15-15bbf87efae2'),('2352388c-ab38-4880-aa87-c937384fbe86','2805022c-5f07-4f4b-bf47-30ba1350c796'),('2e962f5c-47d0-48ed-8454-a75a65514da3','08b54dc4-5623-4c6c-848c-54eb4bb0e415'),('2e962f5c-47d0-48ed-8454-a75a65514da3','105f7b94-91f6-451a-a2d4-ae8eb3a6bc1c'),('2e962f5c-47d0-48ed-8454-a75a65514da3','2352388c-ab38-4880-aa87-c937384fbe86'),('2e962f5c-47d0-48ed-8454-a75a65514da3','9602318a-69be-4851-bd2f-5086e15e9094'),('31e9d61f-397c-4256-890b-e998b54f5649','9ee0d4ab-38b6-43cc-bf20-b983a4ff2fa8'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','02f1f407-f828-4acc-a868-76efc073ae03'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','04aff469-5f14-4332-b6b9-0697b7dc70de'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','0df8783d-ea95-4314-906d-4e3c5a9fdfaa'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','11b4ca05-8eb6-4dc4-acda-704f625245cb'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','180e40f0-8f9a-4dc2-9ec7-e0417f5368ec'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','1c980178-d07d-41aa-af8c-7a12d07c6f0d'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','24dfd1ec-e75e-4aa1-841d-cadae5d3f228'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','2f151d21-e4c2-4dc9-b9d0-517657267942'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','2f9e9828-846b-4240-929b-38876cb14241'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','3eeb0e9b-452b-4e5c-9083-2a083bcaabc4'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','4b92df7a-8a55-404f-b4e1-087484b89cac'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','4c303a09-d873-4669-8b29-687cd9aa50ce'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','5146145d-5c2a-4a4c-8477-2dadc7cb167a'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','5d99a276-b740-4fb3-a0f5-9e3431cd9b05'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','5ddc4827-2c95-46c7-aaee-8ae968dfc378'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','66fbb120-fa30-49d7-bee1-324757029862'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','7b61eb93-9a68-436e-9fac-f21fc9bd1708'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','7baf784e-d941-452f-b0a2-78d882b438bd'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','7fed3e59-2c27-4127-adfd-dd965bea49c5'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','93f73903-90cf-4497-9581-4b3dfdcecf7c'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','a645ffb2-d384-4342-a726-932ad7b4d441'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','aaa48f4c-998b-411c-b9c7-504d6924d80d'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','abe5ab1a-755c-4a21-9f56-cea65b34ef55'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','b0c967b2-e1dc-439f-9193-40cc35d4a15a'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','b6043ca7-8a3f-40c7-8228-ab1873e9b416'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','bcb9d180-05a9-47ce-bca9-b9b77213fbf8'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','c02cf9b5-c9dd-4025-97f1-f24fc86dc524'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','c2479df4-cd87-4abf-a964-aacdaa7a6d50'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','c3c898be-e946-4540-b281-286f51cef37b'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','d74e8cb8-c0ca-4daa-b623-ef68e1471988'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','d7a92f10-20f2-4b81-8a5a-fac4042ddb8e'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','db9718e3-063a-436a-a55b-74bd9c6d70a6'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','e6e38a7b-b7c0-4959-83d6-798c480ab4a2'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','eb2d164f-dbea-45bf-af9b-68273ca3f454'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','ec6c436f-1555-4782-bd22-2236e5552391'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','eee688cf-6e6b-4ceb-8f5e-da9e0c2fd3d9'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','f3f0ce09-d717-4f80-a94e-44c36af15a89'),('7b61eb93-9a68-436e-9fac-f21fc9bd1708','5d99a276-b740-4fb3-a0f5-9e3431cd9b05'),('7b61eb93-9a68-436e-9fac-f21fc9bd1708','a645ffb2-d384-4342-a726-932ad7b4d441'),('91d1778a-35ed-487f-9128-a10116343e8b','1ae12950-4d1f-4b1a-8f06-7c1014a11e40'),('91d1778a-35ed-487f-9128-a10116343e8b','1f3338e1-caf2-421d-8638-3da3bff1148e'),('91d1778a-35ed-487f-9128-a10116343e8b','226ca9c1-ce96-43a6-b86e-2c998a10d0d5'),('91d1778a-35ed-487f-9128-a10116343e8b','24e43dee-f057-434d-9355-c5b01b903049'),('91d1778a-35ed-487f-9128-a10116343e8b','2e295b0a-8873-4428-9cd2-191dc980cb92'),('91d1778a-35ed-487f-9128-a10116343e8b','308ee83d-081b-4b2d-9cb0-d1743e8b3ae2'),('91d1778a-35ed-487f-9128-a10116343e8b','364d9c4c-a720-47f7-88d3-1a4f97d43270'),('91d1778a-35ed-487f-9128-a10116343e8b','3c9d027c-7cbc-4248-9ef4-c6b6d067a303'),('91d1778a-35ed-487f-9128-a10116343e8b','53b4d457-96b4-4e48-b730-22a79a7b1e8d'),('91d1778a-35ed-487f-9128-a10116343e8b','59bdfaf8-d4a1-4c5f-b666-a548f291ba83'),('91d1778a-35ed-487f-9128-a10116343e8b','62848005-b62c-4dbb-9a15-15bbf87efae2'),('91d1778a-35ed-487f-9128-a10116343e8b','8a3ee113-1173-440b-8739-d99d1d0829b6'),('91d1778a-35ed-487f-9128-a10116343e8b','a5d61c18-992c-4e08-b9ed-2fb31b9a9c35'),('91d1778a-35ed-487f-9128-a10116343e8b','a9bb23f9-d179-4a5a-8aec-fb671699d286'),('91d1778a-35ed-487f-9128-a10116343e8b','afb2fa97-fb39-4c35-843a-a90f46fec476'),('91d1778a-35ed-487f-9128-a10116343e8b','dcae6f10-2779-444c-b83d-28b47839b160'),('91d1778a-35ed-487f-9128-a10116343e8b','ed7e57d5-e9b8-4898-ac2e-d780cda7e048'),('91d1778a-35ed-487f-9128-a10116343e8b','fb576eb7-f7dd-42ea-89fb-f985846cce5b'),('92be6dc0-9473-43f0-8d9a-0f9bd2bb8ea0','d0c77d87-f05e-4b4a-befa-147a7f4985ad'),('afb2fa97-fb39-4c35-843a-a90f46fec476','364d9c4c-a720-47f7-88d3-1a4f97d43270'),('afb2fa97-fb39-4c35-843a-a90f46fec476','59bdfaf8-d4a1-4c5f-b666-a548f291ba83'),('c2fcc072-734a-4fab-ae50-042048b7a583','2a3127c0-3456-4523-ab3c-135b3d51485c'),('c2fcc072-734a-4fab-ae50-042048b7a583','31e9d61f-397c-4256-890b-e998b54f5649'),('c2fcc072-734a-4fab-ae50-042048b7a583','71c2f96f-2b48-438f-89c0-4dc68a8c790c'),('c2fcc072-734a-4fab-ae50-042048b7a583','ad417a7a-c720-4230-bb84-a291bc72305b'),('c3c898be-e946-4540-b281-286f51cef37b','24dfd1ec-e75e-4aa1-841d-cadae5d3f228'),('c3c898be-e946-4540-b281-286f51cef37b','7fed3e59-2c27-4127-adfd-dd965bea49c5'),('d2bd0c96-c03d-47c2-ac7b-4a0b041b088a','7a1c9f11-3b87-4698-9478-0c156e644feb'),('db9718e3-063a-436a-a55b-74bd9c6d70a6','e6e38a7b-b7c0-4959-83d6-798c480ab4a2'),('ec6c436f-1555-4782-bd22-2236e5552391','c2479df4-cd87-4abf-a964-aacdaa7a6d50');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('12ff7877-fedd-4a99-bc42-c51590b94713',NULL,'password','9b1feb5c-0418-43bb-9b98-1637dae15401',1629997636948,NULL,'{\"value\":\"6DyBosnwnkdytiXKTxAQvy3+zNO2qZ9BCs5O3zKWITAmM1XNfYD2aiTJJDpq37bx3Fi5b26Gqvw4ZgyiO8a72A==\",\"salt\":\"q5PHW+C1vBZB+VCV3aNTkA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('14379930-ac7b-4d58-a977-7986982a5685',NULL,'password','cb7d7c8f-a660-463d-97b2-650f475ebaf1',1627492899009,NULL,'{\"value\":\"c6F4dPoqay70wM+coEhK0y18Fk2o3Xzqb2vi7uJ/rXQeAOCVazWGwbYHaqnOUb3RqDvODXU1UoLauoWDOKDaKA==\",\"salt\":\"vTB1e5aVJREL+MnrFA7y2g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('326ca7b7-96ef-449b-a76a-88efadd81eb1',NULL,'password','c70b9f77-54d9-4d47-8739-f05013fe19cf',1628506529167,NULL,'{\"value\":\"I+L2h0i+TpQr1ZRRJOuhIzsZgq6rMYISMfUqyzCd6iif/3QtTFTjxvlBbFmfuEURGerQ5GwPjuPjzVsFRX8Kjw==\",\"salt\":\"xvv1mIOTjsbPu/felik/Ng==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a15ffba8-bf81-4561-b272-2b6f70da2e3e',NULL,'password','efec54f1-e3c7-4e88-a714-25bfcf32aef5',1628506540400,NULL,'{\"value\":\"C42A/LMeV4ttIJdO/BZbn5dj9alP2Ob0/CIBzf8j2rMX0z/Kg4x7yI6oYjrM7l3NP4+pkMPCu2m28WN5mEzR8g==\",\"salt\":\"1Zu1VOCgBVSvQ7/VM/f+iA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-07-28 17:20:18',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-07-28 17:20:18',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-07-28 17:20:19',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-07-28 17:20:19',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-07-28 17:20:24',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-07-28 17:20:24',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-07-28 17:20:29',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-07-28 17:20:29',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-07-28 17:20:29',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-07-28 17:20:34',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-07-28 17:20:36',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-07-28 17:20:36',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-07-28 17:20:37',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-28 17:20:37',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-28 17:20:37',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-28 17:20:37',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-07-28 17:20:38',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-07-28 17:20:41',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-07-28 17:20:44',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-07-28 17:20:44',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-07-28 17:20:44',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-07-28 17:20:44',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-07-28 17:20:44',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-07-28 17:20:45',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-07-28 17:20:45',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-07-28 17:20:46',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-07-28 17:20:50',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-07-28 17:20:50',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-07-28 17:20:52',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-07-28 17:20:53',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-07-28 17:20:54',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-07-28 17:20:54',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-28 17:20:54',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-28 17:20:54',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-28 17:20:58',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-07-28 17:20:58',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-07-28 17:20:58',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7492807142'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-07-28 17:20:59',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-07-28 17:20:59',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-28 17:20:59',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-28 17:20:59',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-07-28 17:20:59',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-07-28 17:21:03',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-07-28 17:21:03',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-28 17:21:03',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-28 17:21:03',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-28 17:21:03',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-28 17:21:07',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-07-28 17:21:07',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-07-28 17:21:10',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-07-28 17:21:10',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-07-28 17:21:10',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-07-28 17:21:11',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-07-28 17:21:11',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-28 17:21:11',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-28 17:21:11',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-28 17:21:14',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-07-28 17:21:21',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-07-28 17:21:23',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-07-28 17:21:23',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-07-28 17:21:24',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-07-28 17:21:24',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-07-28 17:21:24',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-07-28 17:21:24',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-07-28 17:21:24',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-07-28 17:21:25',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-07-28 17:21:25',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-07-28 17:21:25',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-07-28 17:21:25',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-07-28 17:21:25',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'7492807142'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-07-28 17:21:26',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'7492807142'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-28 17:21:26',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-28 17:21:26',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-28 17:21:26',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-28 17:21:28',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-07-28 17:21:28',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-28 17:21:28',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-28 17:21:29',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-28 17:21:31',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-07-28 17:21:31',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-28 17:21:31',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-28 17:21:31',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-28 17:21:31',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-28 17:21:31',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'7492807142'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-07-28 17:21:31',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'7492807142'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-07-28 17:21:31',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'7492807142'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-28 17:21:31',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-07-28 17:21:32',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'7492807142'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:32',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'7492807142'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:32',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'7492807142'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:32',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7492807142'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:32',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:32',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:33',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'7492807142'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:33',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'7492807142'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-07-28 17:21:33',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7492807142'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-28 17:21:33',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'7492807142'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-28 17:21:33',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7492807142'),('14.0.0-KEYCLOAK-18286-mysql','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-28 17:21:33',99,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'7492807142'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-28 17:21:33',100,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'7492807142'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-07-28 17:21:33',101,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'7492807142'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2021-08-09 10:47:35',102,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'8506055108');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('agrisud','29acc8c5-7077-4e34-9b55-1bc135e17a0f',_binary ''),('agrisud','388f9f49-c6b0-430c-84fa-9759dd8cc94a',_binary ''),('agrisud','5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40',_binary ''),('agrisud','97df87ed-55f8-4994-a849-42240c78940e',_binary '\0'),('agrisud','a5695cb1-b801-4d4b-944f-32461e5b34b5',_binary '\0'),('agrisud','c276b458-e2d8-491a-8c07-0fe68498213b',_binary ''),('agrisud','cd9f3f92-4c84-4c45-b282-7d33501d567e',_binary '\0'),('agrisud','e458043d-d5ee-4208-b037-2206550c765a',_binary ''),('agrisud','f94c648f-9cab-4ade-9556-851c690cf6b3',_binary '\0'),('master','0654dad5-2c79-4125-9ccb-bd00a13ac1cf',_binary '\0'),('master','20cc646a-3639-43c7-9f31-25314eadaa62',_binary ''),('master','25b4588f-774f-414b-bf22-6ac6139d40ea',_binary ''),('master','41faad61-0e8d-4fea-ae72-af8a0790f77b',_binary '\0'),('master','46065d8d-b927-4302-acdc-a4008e3add1b',_binary '\0'),('master','487d2c24-7bde-46f2-9b79-2942b8e522f2',_binary '\0'),('master','521ddc59-071b-4f7c-81b3-ea0dae531137',_binary ''),('master','79ac4992-fa14-4fef-a5c0-140cdb6a3a97',_binary ''),('master','85de2f58-e5fe-4430-bc04-5eb8db4fa9c3',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('86d130c2-7208-4a10-813f-1ff45046a5a4','27a109db-50ed-4ac9-8d5f-3fa0a87a4959'),('f80077c0-7f2a-40cd-a67f-5710162f2227','27a109db-50ed-4ac9-8d5f-3fa0a87a4959'),('641bee03-80e2-4b04-8764-c9d82fd50c7c','6ec9fad5-8d5c-4080-9f76-ab61f8eb556b'),('11cc8bdb-433b-4e3f-bdb6-ea1bb516f0d2','c159627d-6555-49fb-97f9-dd1a9ff0998e'),('b8c08f92-df80-4447-842b-071102219b13','c159627d-6555-49fb-97f9-dd1a9ff0998e'),('2a672f75-592b-4c0b-8c40-db218b8754b4','c52d3d10-d0dd-46fa-9b46-121719c3d31a'),('cdbeca26-74e0-4ac8-b45d-cd6982274eb1','c52d3d10-d0dd-46fa-9b46-121719c3d31a');
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('c52d3d10-d0dd-46fa-9b46-121719c3d31a','elearning-admins',' ','agrisud'),('c159627d-6555-49fb-97f9-dd1a9ff0998e','elearning-users',' ','agrisud'),('27a109db-50ed-4ac9-8d5f-3fa0a87a4959','mediatheque-admins',' ','agrisud'),('6ec9fad5-8d5c-4080-9f76-ab61f8eb556b','website-admins',' ','agrisud');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('02f1f407-f828-4acc-a868-76efc073ae03','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-realm}','manage-realm','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('04aff469-5f14-4332-b6b9-0697b7dc70de','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('08b54dc4-5623-4c6c-848c-54eb4bb0e415','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_view-profile}','view-profile','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('0df8783d-ea95-4314-906d-4e3c5a9fdfaa','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-authorization}','view-authorization','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('105f7b94-91f6-451a-a2d4-ae8eb3a6bc1c','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('10753f5e-1735-47af-83b6-d003f1fb31e7','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_delete-account}','delete-account','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('11b4ca05-8eb6-4dc4-acda-704f625245cb','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('11cc8bdb-433b-4e3f-bdb6-ea1bb516f0d2','1c85b59f-27c8-4953-a16c-b359702ede9b',_binary '','Utilisateur de la plateforme E-Learning','ROLE_ELEARNING_USER','agrisud','1c85b59f-27c8-4953-a16c-b359702ede9b',NULL),('180e40f0-8f9a-4dc2-9ec7-e0417f5368ec','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-identity-providers}','view-identity-providers','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('1ae12950-4d1f-4b1a-8f06-7c1014a11e40','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-clients}','view-clients','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('1c980178-d07d-41aa-af8c-7a12d07c6f0d','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-events}','view-events','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('1f3338e1-caf2-421d-8638-3da3bff1148e','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_query-realms}','query-realms','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('226ca9c1-ce96-43a6-b86e-2c998a10d0d5','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-users}','manage-users','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('2352388c-ab38-4880-aa87-c937384fbe86','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_manage-account}','manage-account','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('24dfd1ec-e75e-4aa1-841d-cadae5d3f228','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_query-users}','query-users','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('24e43dee-f057-434d-9355-c5b01b903049','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-events}','view-events','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('2805022c-5f07-4f4b-bf47-30ba1350c796','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_manage-account-links}','manage-account-links','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('2a3127c0-3456-4523-ab3c-135b3d51485c','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_view-profile}','view-profile','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('2a672f75-592b-4c0b-8c40-db218b8754b4','f9605229-fec1-471e-ab8a-6dd8be258811',_binary '',NULL,'ROLE_ELEARNING_ADMIN','agrisud','f9605229-fec1-471e-ab8a-6dd8be258811',NULL),('2e295b0a-8873-4428-9cd2-191dc980cb92','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-identity-providers}','manage-identity-providers','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('2e962f5c-47d0-48ed-8454-a75a65514da3','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('2f151d21-e4c2-4dc9-b9d0-517657267942','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_create-client}','create-client','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('2f9e9828-846b-4240-929b-38876cb14241','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-events}','manage-events','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('308ee83d-081b-4b2d-9cb0-d1743e8b3ae2','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-realm}','view-realm','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('31e9d61f-397c-4256-890b-e998b54f5649','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_manage-account}','manage-account','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('364d9c4c-a720-47f7-88d3-1a4f97d43270','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_query-users}','query-users','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('3c9d027c-7cbc-4248-9ef4-c6b6d067a303','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-identity-providers}','view-identity-providers','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('3eeb0e9b-452b-4e5c-9083-2a083bcaabc4','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-authorization}','manage-authorization','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('4b92df7a-8a55-404f-b4e1-087484b89cac','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-authorization}','manage-authorization','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('4c303a09-d873-4669-8b29-687cd9aa50ce','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_impersonation}','impersonation','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('5146145d-5c2a-4a4c-8477-2dadc7cb167a','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-users}','manage-users','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('53b4d457-96b4-4e48-b730-22a79a7b1e8d','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_impersonation}','impersonation','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('583f9872-cd7a-47ce-b913-4b03ff22ab18','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('59bdfaf8-d4a1-4c5f-b666-a548f291ba83','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_query-groups}','query-groups','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('5d99a276-b740-4fb3-a0f5-9e3431cd9b05','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_query-groups}','query-groups','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('5ddc4827-2c95-46c7-aaee-8ae968dfc378','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('62848005-b62c-4dbb-9a15-15bbf87efae2','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_query-clients}','query-clients','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('641bee03-80e2-4b04-8764-c9d82fd50c7c','b36703f1-0244-42d4-a6a2-83f7f7ecc0a6',_binary '',NULL,'ROLE_WEBSITE_ADMIN','agrisud','b36703f1-0244-42d4-a6a2-83f7f7ecc0a6',NULL),('66fbb120-fa30-49d7-bee1-324757029862','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-events}','view-events','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('71c2f96f-2b48-438f-89c0-4dc68a8c790c','agrisud',_binary '\0','${role_uma_authorization}','uma_authorization','agrisud',NULL,NULL),('7a1c9f11-3b87-4698-9478-0c156e644feb','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_view-consent}','view-consent','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('7b61eb93-9a68-436e-9fac-f21fc9bd1708','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-users}','view-users','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('7baf784e-d941-452f-b0a2-78d882b438bd','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-users}','manage-users','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('7fed3e59-2c27-4127-adfd-dd965bea49c5','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_query-groups}','query-groups','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('86d130c2-7208-4a10-813f-1ff45046a5a4','8b291110-88e3-4e1c-a252-27eb8e918e90',_binary '',NULL,'ROLE_MEDIATHEQUE_ADMIN','agrisud','8b291110-88e3-4e1c-a252-27eb8e918e90',NULL),('8a3ee113-1173-440b-8739-d99d1d0829b6','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_create-client}','create-client','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('91d1778a-35ed-487f-9128-a10116343e8b','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_realm-admin}','realm-admin','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('92be6dc0-9473-43f0-8d9a-0f9bd2bb8ea0','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_manage-consent}','manage-consent','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('93f73903-90cf-4497-9581-4b3dfdcecf7c','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-clients}','manage-clients','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('9602318a-69be-4851-bd2f-5086e15e9094','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('9ee0d4ab-38b6-43cc-bf20-b983a4ff2fa8','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_manage-account-links}','manage-account-links','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('a5d61c18-992c-4e08-b9ed-2fb31b9a9c35','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-authorization}','manage-authorization','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('a645ffb2-d384-4342-a726-932ad7b4d441','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_query-users}','query-users','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('a9bb23f9-d179-4a5a-8aec-fb671699d286','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-realm}','manage-realm','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('aa809b93-f4d4-4121-b405-c1985f3057d5','fa291eb0-7114-4956-ab7b-b00e2bd0d68f',_binary '','${role_read-token}','read-token','agrisud','fa291eb0-7114-4956-ab7b-b00e2bd0d68f',NULL),('aaa48f4c-998b-411c-b9c7-504d6924d80d','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_impersonation}','impersonation','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('abe5ab1a-755c-4a21-9f56-cea65b34ef55','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-realm}','manage-realm','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('ad417a7a-c720-4230-bb84-a291bc72305b','agrisud',_binary '\0','${role_offline-access}','offline_access','agrisud',NULL,NULL),('afb2fa97-fb39-4c35-843a-a90f46fec476','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-users}','view-users','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('b0c967b2-e1dc-439f-9193-40cc35d4a15a','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_query-realms}','query-realms','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('b6043ca7-8a3f-40c7-8228-ab1873e9b416','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_manage-clients}','manage-clients','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('b8c08f92-df80-4447-842b-071102219b13','f9605229-fec1-471e-ab8a-6dd8be258811',_binary '',NULL,'ROLE_ELEARNING_USER','agrisud','f9605229-fec1-471e-ab8a-6dd8be258811',NULL),('bcb9d180-05a9-47ce-bca9-b9b77213fbf8','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-authorization}','view-authorization','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('c023dcae-3144-42a9-87c2-b2f2dfe1006b','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_view-applications}','view-applications','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('c02cf9b5-c9dd-4025-97f1-f24fc86dc524','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_create-client}','create-client','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('c2479df4-cd87-4abf-a964-aacdaa7a6d50','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_query-clients}','query-clients','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('c2fcc072-734a-4fab-ae50-042048b7a583','agrisud',_binary '\0','${role_default-roles}','default-roles-agrisud','agrisud',NULL,NULL),('c3c898be-e946-4540-b281-286f51cef37b','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-users}','view-users','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('cdbeca26-74e0-4ac8-b45d-cd6982274eb1','1c85b59f-27c8-4953-a16c-b359702ede9b',_binary '',NULL,'ROLE_ELEARNING_ADMIN','agrisud','1c85b59f-27c8-4953-a16c-b359702ede9b',NULL),('d0c77d87-f05e-4b4a-befa-147a7f4985ad','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',_binary '','${role_view-consent}','view-consent','agrisud','040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed',NULL),('d2bd0c96-c03d-47c2-ac7b-4a0b041b088a','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_manage-consent}','manage-consent','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('d6f2baf0-38de-4db0-9976-9d256928a152','ecbca5b7-b72d-4daf-abbe-586752c7fabf',_binary '','${role_read-token}','read-token','master','ecbca5b7-b72d-4daf-abbe-586752c7fabf',NULL),('d74e8cb8-c0ca-4daa-b623-ef68e1471988','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_query-realms}','query-realms','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('d7a92f10-20f2-4b81-8a5a-fac4042ddb8e','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_manage-events}','manage-events','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('db9718e3-063a-436a-a55b-74bd9c6d70a6','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-clients}','view-clients','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('dbeb160c-8b39-41db-bba4-86a25cc4105f','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_view-applications}','view-applications','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL),('dcae6f10-2779-444c-b83d-28b47839b160','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_view-authorization}','view-authorization','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('e6e38a7b-b7c0-4959-83d6-798c480ab4a2','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_query-clients}','query-clients','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('eb2d164f-dbea-45bf-af9b-68273ca3f454','4f324fe9-5ffe-488f-a239-e31831b6b504',_binary '','${role_view-realm}','view-realm','master','4f324fe9-5ffe-488f-a239-e31831b6b504',NULL),('ec6c436f-1555-4782-bd22-2236e5552391','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-clients}','view-clients','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('ed7e57d5-e9b8-4898-ac2e-d780cda7e048','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-events}','manage-events','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('eee688cf-6e6b-4ceb-8f5e-da9e0c2fd3d9','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-identity-providers}','view-identity-providers','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('f3f0ce09-d717-4f80-a94e-44c36af15a89','e244f86d-20c4-4333-a98b-a26078cd5453',_binary '','${role_view-realm}','view-realm','master','e244f86d-20c4-4333-a98b-a26078cd5453',NULL),('f80077c0-7f2a-40cd-a67f-5710162f2227','931e5a38-8a0b-4c71-b1c2-3a238bcb1332',_binary '',NULL,'ROLE_MEDIATHEQUE_ADMIN','agrisud','931e5a38-8a0b-4c71-b1c2-3a238bcb1332',NULL),('fb576eb7-f7dd-42ea-89fb-f985846cce5b','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',_binary '','${role_manage-clients}','manage-clients','agrisud','09fe7b43-39f4-4ce6-8bf6-64fb50f06440',NULL),('fcd39f33-99b2-4470-91dc-b715a04c70f3','e1dc579e-71f7-4c0c-89e0-38231c3575f8',_binary '','${role_delete-account}','delete-account','master','e1dc579e-71f7-4c0c-89e0-38231c3575f8',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('6k30d','15.0.0',1628506058),('krr1j','14.0.0',1627492896);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('04439e65-6a16-4a11-a289-fb2e4c9c1718','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'388f9f49-c6b0-430c-84fa-9759dd8cc94a'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'46065d8d-b927-4302-acdc-a4008e3add1b'),('06353c7b-eff0-4c20-b11f-976ff069ea98','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('0896a6e8-40a4-4f8a-8243-e565d035deef','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'20cc646a-3639-43c7-9f31-25314eadaa62'),('0b4d2e9d-ad01-44c7-9129-dba318879d11','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'c276b458-e2d8-491a-8c07-0fe68498213b'),('0be230ae-f5df-4948-b6cc-e286e376087f','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('12105739-a928-42ec-a74b-35fb338f9165','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'46065d8d-b927-4302-acdc-a4008e3add1b'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('271f29a9-cf27-4a40-8b09-36c942f011ca','audience resolve','openid-connect','oidc-audience-resolve-mapper','f4a75e71-9a5e-44d7-975e-e9a9adff370f',NULL),('2c90ec6b-5829-47db-9ba8-519db5045e7b','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'c276b458-e2d8-491a-8c07-0fe68498213b'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('3a3f0aad-e351-4392-9cdc-9a3d0abbf6f7','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'20cc646a-3639-43c7-9f31-25314eadaa62'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('4662d731-6d13-4b9a-98c9-03ed45373377','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'20cc646a-3639-43c7-9f31-25314eadaa62'),('4a44aca6-3250-4f47-896e-e1797a96426b','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487d2c24-7bde-46f2-9b79-2942b8e522f2'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('52463847-914d-4bf2-92e4-117fb39c2ecc','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('59c82af9-0213-45ae-b0af-a8372df4802e','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c276b458-e2d8-491a-8c07-0fe68498213b'),('5b28763d-81c8-48b4-b1da-2b4477865777','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'85de2f58-e5fe-4430-bc04-5eb8db4fa9c3'),('645b42ed-0fbd-4d18-95d9-b51d61487783','role list','saml','saml-role-list-mapper',NULL,'e458043d-d5ee-4208-b037-2206550c765a'),('66c33ddb-c683-4376-8085-05645c6795f1','username','openid-connect','oidc-usermodel-property-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('8356de2b-ce23-46ae-83a1-09231ee16238','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('8e03f91b-17c3-4f4f-879b-14532459c3b4','full name','openid-connect','oidc-full-name-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'487d2c24-7bde-46f2-9b79-2942b8e522f2'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('99895294-f99e-46d0-a3f4-b0578e93654d','email','openid-connect','oidc-usermodel-property-mapper',NULL,'79ac4992-fa14-4fef-a5c0-140cdb6a3a97'),('99b40946-442f-4214-8111-06ae5685c5b6','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f94c648f-9cab-4ade-9556-851c690cf6b3'),('9a6f7385-dfce-4221-936e-e58dae485846','full name','openid-connect','oidc-full-name-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','username','openid-connect','oidc-usermodel-property-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','locale','openid-connect','oidc-usermodel-attribute-mapper','43378dab-19d9-48f5-957b-93d75cef9405',NULL),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','locale','openid-connect','oidc-usermodel-attribute-mapper','a87fb9da-86f7-40d3-bb39-8a490b2a4115',NULL),('a7f934ad-8567-4ed5-9367-e3658797c481','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'5aeebcad-f4f3-48fa-bc85-07cf6d7b5f40'),('b240305e-8d1a-43e4-9340-54d413e9f286','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('b2e1b14f-3e85-4252-aebe-256a0c82ed8b','role list','saml','saml-role-list-mapper',NULL,'521ddc59-071b-4f7c-81b3-ea0dae531137'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','address','openid-connect','oidc-address-mapper',NULL,'97df87ed-55f8-4994-a849-42240c78940e'),('b98eef6b-8574-455b-ae06-b890193b72c6','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'79ac4992-fa14-4fef-a5c0-140cdb6a3a97'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('ce198bfe-43c6-4a15-87c9-caa1ebaf3e24','audience resolve','openid-connect','oidc-audience-resolve-mapper','992dc2a9-4481-409c-a2cd-e9f763708966',NULL),('ce658da5-218d-4ae3-9392-25165083f83c','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','email','openid-connect','oidc-usermodel-property-mapper',NULL,'388f9f49-c6b0-430c-84fa-9759dd8cc94a'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cd9f3f92-4c84-4c45-b282-7d33501d567e'),('da334b39-445c-491e-9c9c-fa212ec18d66','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cd9f3f92-4c84-4c45-b282-7d33501d567e'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','address','openid-connect','oidc-address-mapper',NULL,'41faad61-0e8d-4fea-ae72-af8a0790f77b'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'29acc8c5-7077-4e34-9b55-1bc135e17a0f'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'25b4588f-774f-414b-bf22-6ac6139d40ea'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'f94c648f-9cab-4ade-9556-851c690cf6b3');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('04439e65-6a16-4a11-a289-fb2e4c9c1718','true','access.token.claim'),('04439e65-6a16-4a11-a289-fb2e4c9c1718','email_verified','claim.name'),('04439e65-6a16-4a11-a289-fb2e4c9c1718','true','id.token.claim'),('04439e65-6a16-4a11-a289-fb2e4c9c1718','boolean','jsonType.label'),('04439e65-6a16-4a11-a289-fb2e4c9c1718','emailVerified','user.attribute'),('04439e65-6a16-4a11-a289-fb2e4c9c1718','true','userinfo.token.claim'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','true','access.token.claim'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','upn','claim.name'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','true','id.token.claim'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','String','jsonType.label'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','username','user.attribute'),('047ff09b-b14e-4eb7-b0e8-22eb7aca7628','true','userinfo.token.claim'),('06353c7b-eff0-4c20-b11f-976ff069ea98','true','access.token.claim'),('06353c7b-eff0-4c20-b11f-976ff069ea98','middle_name','claim.name'),('06353c7b-eff0-4c20-b11f-976ff069ea98','true','id.token.claim'),('06353c7b-eff0-4c20-b11f-976ff069ea98','String','jsonType.label'),('06353c7b-eff0-4c20-b11f-976ff069ea98','middleName','user.attribute'),('06353c7b-eff0-4c20-b11f-976ff069ea98','true','userinfo.token.claim'),('0896a6e8-40a4-4f8a-8243-e565d035deef','true','access.token.claim'),('0896a6e8-40a4-4f8a-8243-e565d035deef','resource_access.${client_id}.roles','claim.name'),('0896a6e8-40a4-4f8a-8243-e565d035deef','String','jsonType.label'),('0896a6e8-40a4-4f8a-8243-e565d035deef','true','multivalued'),('0896a6e8-40a4-4f8a-8243-e565d035deef','foo','user.attribute'),('0be230ae-f5df-4948-b6cc-e286e376087f','true','access.token.claim'),('0be230ae-f5df-4948-b6cc-e286e376087f','zoneinfo','claim.name'),('0be230ae-f5df-4948-b6cc-e286e376087f','true','id.token.claim'),('0be230ae-f5df-4948-b6cc-e286e376087f','String','jsonType.label'),('0be230ae-f5df-4948-b6cc-e286e376087f','zoneinfo','user.attribute'),('0be230ae-f5df-4948-b6cc-e286e376087f','true','userinfo.token.claim'),('12105739-a928-42ec-a74b-35fb338f9165','true','access.token.claim'),('12105739-a928-42ec-a74b-35fb338f9165','profile','claim.name'),('12105739-a928-42ec-a74b-35fb338f9165','true','id.token.claim'),('12105739-a928-42ec-a74b-35fb338f9165','String','jsonType.label'),('12105739-a928-42ec-a74b-35fb338f9165','profile','user.attribute'),('12105739-a928-42ec-a74b-35fb338f9165','true','userinfo.token.claim'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','true','access.token.claim'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','groups','claim.name'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','true','id.token.claim'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','String','jsonType.label'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','true','multivalued'),('12576b91-e8f0-4cba-bf4d-0525e9f423bc','foo','user.attribute'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','true','access.token.claim'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','profile','claim.name'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','true','id.token.claim'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','String','jsonType.label'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','profile','user.attribute'),('1f909637-3969-4233-9ddf-95a4b0dbff1f','true','userinfo.token.claim'),('2c90ec6b-5829-47db-9ba8-519db5045e7b','true','access.token.claim'),('2c90ec6b-5829-47db-9ba8-519db5045e7b','resource_access.${client_id}.roles','claim.name'),('2c90ec6b-5829-47db-9ba8-519db5045e7b','String','jsonType.label'),('2c90ec6b-5829-47db-9ba8-519db5045e7b','true','multivalued'),('2c90ec6b-5829-47db-9ba8-519db5045e7b','foo','user.attribute'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','true','access.token.claim'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','nickname','claim.name'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','true','id.token.claim'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','String','jsonType.label'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','nickname','user.attribute'),('2cab0ef3-e629-4438-aba3-4b886dce7d10','true','userinfo.token.claim'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','true','access.token.claim'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','picture','claim.name'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','true','id.token.claim'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','String','jsonType.label'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','picture','user.attribute'),('3bad0566-fe4d-44cc-95f0-a88ff962512b','true','userinfo.token.claim'),('4662d731-6d13-4b9a-98c9-03ed45373377','true','access.token.claim'),('4662d731-6d13-4b9a-98c9-03ed45373377','realm_access.roles','claim.name'),('4662d731-6d13-4b9a-98c9-03ed45373377','String','jsonType.label'),('4662d731-6d13-4b9a-98c9-03ed45373377','true','multivalued'),('4662d731-6d13-4b9a-98c9-03ed45373377','foo','user.attribute'),('4a44aca6-3250-4f47-896e-e1797a96426b','true','access.token.claim'),('4a44aca6-3250-4f47-896e-e1797a96426b','phone_number_verified','claim.name'),('4a44aca6-3250-4f47-896e-e1797a96426b','true','id.token.claim'),('4a44aca6-3250-4f47-896e-e1797a96426b','boolean','jsonType.label'),('4a44aca6-3250-4f47-896e-e1797a96426b','phoneNumberVerified','user.attribute'),('4a44aca6-3250-4f47-896e-e1797a96426b','true','userinfo.token.claim'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','true','access.token.claim'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','middle_name','claim.name'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','true','id.token.claim'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','String','jsonType.label'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','middleName','user.attribute'),('4abda73d-2c58-43f2-900d-a7dc60041b6a','true','userinfo.token.claim'),('52463847-914d-4bf2-92e4-117fb39c2ecc','true','access.token.claim'),('52463847-914d-4bf2-92e4-117fb39c2ecc','website','claim.name'),('52463847-914d-4bf2-92e4-117fb39c2ecc','true','id.token.claim'),('52463847-914d-4bf2-92e4-117fb39c2ecc','String','jsonType.label'),('52463847-914d-4bf2-92e4-117fb39c2ecc','website','user.attribute'),('52463847-914d-4bf2-92e4-117fb39c2ecc','true','userinfo.token.claim'),('59c82af9-0213-45ae-b0af-a8372df4802e','true','access.token.claim'),('59c82af9-0213-45ae-b0af-a8372df4802e','realm_access.roles','claim.name'),('59c82af9-0213-45ae-b0af-a8372df4802e','String','jsonType.label'),('59c82af9-0213-45ae-b0af-a8372df4802e','true','multivalued'),('59c82af9-0213-45ae-b0af-a8372df4802e','foo','user.attribute'),('645b42ed-0fbd-4d18-95d9-b51d61487783','Role','attribute.name'),('645b42ed-0fbd-4d18-95d9-b51d61487783','Basic','attribute.nameformat'),('645b42ed-0fbd-4d18-95d9-b51d61487783','false','single'),('66c33ddb-c683-4376-8085-05645c6795f1','true','access.token.claim'),('66c33ddb-c683-4376-8085-05645c6795f1','preferred_username','claim.name'),('66c33ddb-c683-4376-8085-05645c6795f1','true','id.token.claim'),('66c33ddb-c683-4376-8085-05645c6795f1','String','jsonType.label'),('66c33ddb-c683-4376-8085-05645c6795f1','username','user.attribute'),('66c33ddb-c683-4376-8085-05645c6795f1','true','userinfo.token.claim'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','true','access.token.claim'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','locale','claim.name'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','true','id.token.claim'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','String','jsonType.label'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','locale','user.attribute'),('739c4d0f-4bd8-4df0-b400-2a071e920a37','true','userinfo.token.claim'),('8356de2b-ce23-46ae-83a1-09231ee16238','true','access.token.claim'),('8356de2b-ce23-46ae-83a1-09231ee16238','updated_at','claim.name'),('8356de2b-ce23-46ae-83a1-09231ee16238','true','id.token.claim'),('8356de2b-ce23-46ae-83a1-09231ee16238','String','jsonType.label'),('8356de2b-ce23-46ae-83a1-09231ee16238','updatedAt','user.attribute'),('8356de2b-ce23-46ae-83a1-09231ee16238','true','userinfo.token.claim'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','true','access.token.claim'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','family_name','claim.name'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','true','id.token.claim'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','String','jsonType.label'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','lastName','user.attribute'),('8c79edc1-ccc8-4a69-bc2a-9f6e2488ca34','true','userinfo.token.claim'),('8e03f91b-17c3-4f4f-879b-14532459c3b4','true','access.token.claim'),('8e03f91b-17c3-4f4f-879b-14532459c3b4','true','id.token.claim'),('8e03f91b-17c3-4f4f-879b-14532459c3b4','true','userinfo.token.claim'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','true','access.token.claim'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','phone_number','claim.name'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','true','id.token.claim'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','String','jsonType.label'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','phoneNumber','user.attribute'),('93c39ecc-c867-4fa2-b806-fe4c4029329b','true','userinfo.token.claim'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','true','access.token.claim'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','locale','claim.name'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','true','id.token.claim'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','String','jsonType.label'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','locale','user.attribute'),('98478d3f-744a-46ae-aea1-8b9f1b4d1632','true','userinfo.token.claim'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','true','access.token.claim'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','nickname','claim.name'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','true','id.token.claim'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','String','jsonType.label'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','nickname','user.attribute'),('989a40a9-1ee7-4596-9f4e-f221f4c05792','true','userinfo.token.claim'),('99895294-f99e-46d0-a3f4-b0578e93654d','true','access.token.claim'),('99895294-f99e-46d0-a3f4-b0578e93654d','email','claim.name'),('99895294-f99e-46d0-a3f4-b0578e93654d','true','id.token.claim'),('99895294-f99e-46d0-a3f4-b0578e93654d','String','jsonType.label'),('99895294-f99e-46d0-a3f4-b0578e93654d','email','user.attribute'),('99895294-f99e-46d0-a3f4-b0578e93654d','true','userinfo.token.claim'),('99b40946-442f-4214-8111-06ae5685c5b6','true','access.token.claim'),('99b40946-442f-4214-8111-06ae5685c5b6','groups','claim.name'),('99b40946-442f-4214-8111-06ae5685c5b6','true','id.token.claim'),('99b40946-442f-4214-8111-06ae5685c5b6','String','jsonType.label'),('99b40946-442f-4214-8111-06ae5685c5b6','true','multivalued'),('99b40946-442f-4214-8111-06ae5685c5b6','foo','user.attribute'),('9a6f7385-dfce-4221-936e-e58dae485846','true','access.token.claim'),('9a6f7385-dfce-4221-936e-e58dae485846','true','id.token.claim'),('9a6f7385-dfce-4221-936e-e58dae485846','true','userinfo.token.claim'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','true','access.token.claim'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','preferred_username','claim.name'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','true','id.token.claim'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','String','jsonType.label'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','username','user.attribute'),('9f932671-ae13-4fce-8949-88ae9f3adaf9','true','userinfo.token.claim'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','true','access.token.claim'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','gender','claim.name'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','true','id.token.claim'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','String','jsonType.label'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','gender','user.attribute'),('a05bcfe7-bbb3-4258-a1c0-362a7016337e','true','userinfo.token.claim'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','true','access.token.claim'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','locale','claim.name'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','true','id.token.claim'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','String','jsonType.label'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','locale','user.attribute'),('a3a528f2-1256-4ce5-b733-ff22aceef3d9','true','userinfo.token.claim'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','true','access.token.claim'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','locale','claim.name'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','true','id.token.claim'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','String','jsonType.label'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','locale','user.attribute'),('a4ca699b-ea72-4c2a-ad15-adaa9ed8d56f','true','userinfo.token.claim'),('b240305e-8d1a-43e4-9340-54d413e9f286','true','access.token.claim'),('b240305e-8d1a-43e4-9340-54d413e9f286','updated_at','claim.name'),('b240305e-8d1a-43e4-9340-54d413e9f286','true','id.token.claim'),('b240305e-8d1a-43e4-9340-54d413e9f286','String','jsonType.label'),('b240305e-8d1a-43e4-9340-54d413e9f286','updatedAt','user.attribute'),('b240305e-8d1a-43e4-9340-54d413e9f286','true','userinfo.token.claim'),('b2e1b14f-3e85-4252-aebe-256a0c82ed8b','Role','attribute.name'),('b2e1b14f-3e85-4252-aebe-256a0c82ed8b','Basic','attribute.nameformat'),('b2e1b14f-3e85-4252-aebe-256a0c82ed8b','false','single'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','true','access.token.claim'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','true','id.token.claim'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','country','user.attribute.country'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','formatted','user.attribute.formatted'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','locality','user.attribute.locality'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','postal_code','user.attribute.postal_code'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','region','user.attribute.region'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','street','user.attribute.street'),('b44028ce-a3e1-4773-9240-f78d3fa7382b','true','userinfo.token.claim'),('b98eef6b-8574-455b-ae06-b890193b72c6','true','access.token.claim'),('b98eef6b-8574-455b-ae06-b890193b72c6','email_verified','claim.name'),('b98eef6b-8574-455b-ae06-b890193b72c6','true','id.token.claim'),('b98eef6b-8574-455b-ae06-b890193b72c6','boolean','jsonType.label'),('b98eef6b-8574-455b-ae06-b890193b72c6','emailVerified','user.attribute'),('b98eef6b-8574-455b-ae06-b890193b72c6','true','userinfo.token.claim'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','true','access.token.claim'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','given_name','claim.name'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','true','id.token.claim'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','String','jsonType.label'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','firstName','user.attribute'),('bb9cfe26-1e09-4876-995c-6f5d1ab9f84d','true','userinfo.token.claim'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','true','access.token.claim'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','zoneinfo','claim.name'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','true','id.token.claim'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','String','jsonType.label'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','zoneinfo','user.attribute'),('be3c2dcd-eefa-4f28-9b18-acb8c328baf4','true','userinfo.token.claim'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','true','access.token.claim'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','website','claim.name'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','true','id.token.claim'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','String','jsonType.label'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','website','user.attribute'),('cdca2d5e-09c5-4622-b568-4543d32dcdec','true','userinfo.token.claim'),('ce658da5-218d-4ae3-9392-25165083f83c','true','access.token.claim'),('ce658da5-218d-4ae3-9392-25165083f83c','gender','claim.name'),('ce658da5-218d-4ae3-9392-25165083f83c','true','id.token.claim'),('ce658da5-218d-4ae3-9392-25165083f83c','String','jsonType.label'),('ce658da5-218d-4ae3-9392-25165083f83c','gender','user.attribute'),('ce658da5-218d-4ae3-9392-25165083f83c','true','userinfo.token.claim'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','true','access.token.claim'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','email','claim.name'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','true','id.token.claim'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','String','jsonType.label'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','email','user.attribute'),('d4ae497c-5e2d-45cd-aa0f-b6afbcd4f366','true','userinfo.token.claim'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','true','access.token.claim'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','birthdate','claim.name'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','true','id.token.claim'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','String','jsonType.label'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','birthdate','user.attribute'),('d86264f9-7a4d-4a9b-b34c-fb85ea6d4d4f','true','userinfo.token.claim'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','true','access.token.claim'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','phone_number','claim.name'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','true','id.token.claim'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','String','jsonType.label'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','phoneNumber','user.attribute'),('d8c4b2ea-ab7e-46ed-917c-96d1ba1ca054','true','userinfo.token.claim'),('da334b39-445c-491e-9c9c-fa212ec18d66','true','access.token.claim'),('da334b39-445c-491e-9c9c-fa212ec18d66','birthdate','claim.name'),('da334b39-445c-491e-9c9c-fa212ec18d66','true','id.token.claim'),('da334b39-445c-491e-9c9c-fa212ec18d66','String','jsonType.label'),('da334b39-445c-491e-9c9c-fa212ec18d66','birthdate','user.attribute'),('da334b39-445c-491e-9c9c-fa212ec18d66','true','userinfo.token.claim'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','true','access.token.claim'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','phone_number_verified','claim.name'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','true','id.token.claim'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','boolean','jsonType.label'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','phoneNumberVerified','user.attribute'),('e769cb24-6805-4fc8-aeb3-1353ae550b93','true','userinfo.token.claim'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','true','access.token.claim'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','true','id.token.claim'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','country','user.attribute.country'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','formatted','user.attribute.formatted'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','locality','user.attribute.locality'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','postal_code','user.attribute.postal_code'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','region','user.attribute.region'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','street','user.attribute.street'),('ec50fef7-c6c7-40f5-b484-0b55fad5e651','true','userinfo.token.claim'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','true','access.token.claim'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','given_name','claim.name'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','true','id.token.claim'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','String','jsonType.label'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','firstName','user.attribute'),('efddce32-6dda-4fe9-a7d8-c2abedaea298','true','userinfo.token.claim'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','true','access.token.claim'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','family_name','claim.name'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','true','id.token.claim'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','String','jsonType.label'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','lastName','user.attribute'),('fc817ea8-5209-4b8a-83f7-9edd98efff63','true','userinfo.token.claim'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','true','access.token.claim'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','picture','claim.name'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','true','id.token.claim'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','String','jsonType.label'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','picture','user.attribute'),('fce65b3d-473a-4e14-9c4b-d421b64f5340','true','userinfo.token.claim'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','true','access.token.claim'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','upn','claim.name'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','true','id.token.claim'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','String','jsonType.label'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','username','user.attribute'),('ff7f2a5a-c7bf-415c-b376-8507d0fa32f2','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('agrisud',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,'keycloak','agrisud',0,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','e244f86d-20c4-4333-a98b-a26078cd5453',1800,_binary '','fr',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','b30a09d0-2021-465a-ae1c-ae4553308637','24653e8b-6aa8-4106-b4c1-4dc05f5f7421','5439e4a1-8b92-456e-8b40-a8a1958613c0','406d9d48-df76-4f3e-96e0-3a10337ffae6','b1b5bb6a-387c-49d7-a126-d3e48aa126b4',2592000,_binary '\0',900,_binary '',_binary '\0','5289f23c-81f8-4065-bee5-a967534da220',0,_binary '\0',0,0,'c2fcc072-734a-4fab-ae50-042048b7a583'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','4f324fe9-5ffe-488f-a239-e31831b6b504',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','319c13a1-6569-40d0-bf28-f8e3f5657311','247d9bed-9c13-436c-8d10-2e1a02bba450','07e39fac-ea99-4346-b3b5-ea2bb228ba46','277a93a8-a71f-471c-b22c-392de87d2b66','d0f1cb24-9f1a-4e78-853c-b8c121ef9f2c',2592000,_binary '\0',900,_binary '',_binary '\0','60992f0b-25b3-47a1-bace-f3bba362e1f4',0,_binary '\0',0,0,'2e962f5c-47d0-48ed-8454-a75a65514da3');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','agrisud','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','agrisud',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','agrisud','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','agrisud','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','agrisud','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','agrisud','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','agrisud','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','agrisud','43200'),('actionTokenGeneratedByUserLifespan','agrisud','300'),('bruteForceProtected','agrisud','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','agrisud','login_hint'),('cibaBackchannelTokenDeliveryMode','agrisud','poll'),('cibaExpiresIn','agrisud','120'),('cibaInterval','agrisud','5'),('client-policies.policies','agrisud','{\"policies\":[]}'),('client-policies.profiles','agrisud','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','agrisud','0'),('clientOfflineSessionMaxLifespan','agrisud','0'),('clientSessionIdleTimeout','agrisud','0'),('clientSessionMaxLifespan','agrisud','0'),('defaultSignatureAlgorithm','agrisud','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','agrisud','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','agrisud','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','agrisud','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','agrisud','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','agrisud','600'),('oauth2DevicePollingInterval','agrisud','5'),('offlineSessionMaxLifespan','agrisud','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','agrisud','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','agrisud','60'),('permanentLockout','agrisud','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','agrisud','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','agrisud','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','agrisud','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','agrisud','not specified'),('webAuthnPolicyAuthenticatorAttachment','agrisud','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','agrisud','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','agrisud','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','agrisud','false'),('webAuthnPolicyCreateTimeout','agrisud','0'),('webAuthnPolicyCreateTimeoutPasswordless','agrisud','0'),('webAuthnPolicyRequireResidentKey','agrisud','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','agrisud','not specified'),('webAuthnPolicyRpEntityName','agrisud','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','agrisud','keycloak'),('webAuthnPolicyRpId','agrisud',''),('webAuthnPolicyRpIdPasswordless','agrisud',''),('webAuthnPolicySignatureAlgorithms','agrisud','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','agrisud','ES256'),('webAuthnPolicyUserVerificationRequirement','agrisud','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','agrisud','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('agrisud','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','agrisud'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
INSERT INTO `REALM_SMTP_CONFIG` VALUES ('agrisud','true','auth'),('agrisud','no.reply.agrisud@gmail.com','from'),('agrisud','smtp.gmail.com','host'),('agrisud','mysecretpassword','password'),('agrisud','true','ssl'),('agrisud','false','starttls'),('agrisud','no.reply.agrisud@gmail.com','user');
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('agrisud','en'),('agrisud','fr');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('040ad9e2-2c00-45b4-bb4d-1dd4e33a36ed','/realms/agrisud/account/*'),('1c85b59f-27c8-4953-a16c-b359702ede9b','http://localhost:3000/*'),('43378dab-19d9-48f5-957b-93d75cef9405','/admin/master/console/*'),('931e5a38-8a0b-4c71-b1c2-3a238bcb1332','*'),('992dc2a9-4481-409c-a2cd-e9f763708966','/realms/master/account/*'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','/admin/agrisud/console/*'),('b36703f1-0244-42d4-a6a2-83f7f7ecc0a6','*'),('e1dc579e-71f7-4c0c-89e0-38231c3575f8','/realms/master/account/*'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','/realms/agrisud/account/*'),('f9605229-fec1-471e-ab8a-6dd8be258811','*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0854af12-e956-4ff9-9079-72087264551c','VERIFY_EMAIL','Verify Email','agrisud',_binary '',_binary '\0','VERIFY_EMAIL',50),('1554ea7f-8df4-4ebf-bd2f-22befe12d97a','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('1d11539f-9670-4f29-95aa-8692d1bd830e','UPDATE_PROFILE','Update Profile','agrisud',_binary '',_binary '\0','UPDATE_PROFILE',40),('212184d2-951a-45fd-b6df-dd3ed52ddae6','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('2e58780a-136c-44d9-8299-1e05e9344243','UPDATE_PASSWORD','Update Password','agrisud',_binary '',_binary '\0','UPDATE_PASSWORD',30),('379a5430-4852-43e4-a9f3-e29e45216d4f','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('3d3bb47e-d052-4958-a99b-28138cfbad2d','update_user_locale','Update User Locale','agrisud',_binary '',_binary '\0','update_user_locale',1000),('54e18590-8a57-47dc-adee-413c80482dd8','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('5e704428-ae32-4c34-ae1d-2e85797dca5f','CONFIGURE_TOTP','Configure OTP','agrisud',_binary '',_binary '\0','CONFIGURE_TOTP',10),('8d45c175-b397-4dba-901a-7f59d8201ae8','delete_account','Delete Account','agrisud',_binary '\0',_binary '\0','delete_account',60),('9b2fd0f1-d473-486b-8db1-e5b9c9c0186f','terms_and_conditions','Terms and Conditions','agrisud',_binary '\0',_binary '\0','terms_and_conditions',20),('a18603b6-ddbc-47b3-8a0a-0308dd008e98','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('abf66664-a190-4129-bf6b-1a8895b984f7','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('aff7012b-26fb-41b2-8299-56821cb3ff8e','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('992dc2a9-4481-409c-a2cd-e9f763708966','2352388c-ab38-4880-aa87-c937384fbe86'),('f4a75e71-9a5e-44d7-975e-e9a9adff370f','31e9d61f-397c-4256-890b-e998b54f5649');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','cb7d7c8f-a660-463d-97b2-650f475ebaf1','ba73096b-9054-466c-96eb-f947baf2b952');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('9b1feb5c-0418-43bb-9b98-1637dae15401',NULL,'9ee1080f-b669-4d2c-9707-1eed384069d2',_binary '',_binary '',NULL,'Agrisud','admin','agrisud','agrisud-admin',1629997616453,NULL,0),('c70b9f77-54d9-4d47-8739-f05013fe19cf',NULL,'efb3a9fe-74df-4495-bbbb-6c8661d2fb1d',_binary '',_binary '',NULL,'admin','admin','agrisud','admin',1627493753878,NULL,0),('cb7d7c8f-a660-463d-97b2-650f475ebaf1','no.reply.agrisud@gmail.com','no.reply.agrisud@gmail.com',_binary '\0',_binary '',NULL,'Admin','Admin','master','admin',1627492898937,NULL,0),('efec54f1-e3c7-4e88-a714-25bfcf32aef5',NULL,'be941890-427c-445f-8533-3c3f80969f29',_binary '',_binary '',NULL,'user','user','agrisud','user',1627494010081,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES ('27a109db-50ed-4ac9-8d5f-3fa0a87a4959','c70b9f77-54d9-4d47-8739-f05013fe19cf'),('6ec9fad5-8d5c-4080-9f76-ab61f8eb556b','c70b9f77-54d9-4d47-8739-f05013fe19cf'),('c52d3d10-d0dd-46fa-9b46-121719c3d31a','c70b9f77-54d9-4d47-8739-f05013fe19cf'),('c159627d-6555-49fb-97f9-dd1a9ff0998e','efec54f1-e3c7-4e88-a714-25bfcf32aef5');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1ae12950-4d1f-4b1a-8f06-7c1014a11e40','9b1feb5c-0418-43bb-9b98-1637dae15401'),('226ca9c1-ce96-43a6-b86e-2c998a10d0d5','9b1feb5c-0418-43bb-9b98-1637dae15401'),('364d9c4c-a720-47f7-88d3-1a4f97d43270','9b1feb5c-0418-43bb-9b98-1637dae15401'),('a9bb23f9-d179-4a5a-8aec-fb671699d286','9b1feb5c-0418-43bb-9b98-1637dae15401'),('afb2fa97-fb39-4c35-843a-a90f46fec476','9b1feb5c-0418-43bb-9b98-1637dae15401'),('c2fcc072-734a-4fab-ae50-042048b7a583','9b1feb5c-0418-43bb-9b98-1637dae15401'),('c2fcc072-734a-4fab-ae50-042048b7a583','c70b9f77-54d9-4d47-8739-f05013fe19cf'),('2e962f5c-47d0-48ed-8454-a75a65514da3','cb7d7c8f-a660-463d-97b2-650f475ebaf1'),('583f9872-cd7a-47ce-b913-4b03ff22ab18','cb7d7c8f-a660-463d-97b2-650f475ebaf1'),('11cc8bdb-433b-4e3f-bdb6-ea1bb516f0d2','efec54f1-e3c7-4e88-a714-25bfcf32aef5'),('c2fcc072-734a-4fab-ae50-042048b7a583','efec54f1-e3c7-4e88-a714-25bfcf32aef5');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('1c85b59f-27c8-4953-a16c-b359702ede9b','http://localhost:3000'),('43378dab-19d9-48f5-957b-93d75cef9405','+'),('a87fb9da-86f7-40d3-bb39-8a490b2a4115','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 20:28:23
