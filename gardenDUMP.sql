-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: gardendb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` varchar(50) NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_region_id` (`region_id`),
  CONSTRAINT `FK_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Sevilla',1),(2,'Málaga',1),(3,'Barcelona',2),(4,'Madrid',3),(5,'Valencia',4),(6,'Vigo',5),(7,'Bilbao',6),(8,'Valladolid',7),(9,'Toledo',8),(10,'Zaragoza',9),(11,'Palma de Mallorca',10),(12,'Las Palmas de Gran Canaria',11),(13,'Oviedo',12),(14,'Santander',13),(15,'Murcia',14),(16,'Mérida',15),(17,'Logroño',16),(18,'Pamplona',17),(19,'Ceuta',18),(20,'Melilla',19);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ciudadconoficinaempleados`
--

DROP TABLE IF EXISTS `ciudadconoficinaempleados`;
/*!50001 DROP VIEW IF EXISTS `ciudadconoficinaempleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ciudadconoficinaempleados` AS SELECT 
 1 AS `nombre_ciudad`,
 1 AS `Cantidad empleados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ciudadesconoficinayid`
--

DROP TABLE IF EXISTS `ciudadesconoficinayid`;
/*!50001 DROP VIEW IF EXISTS `ciudadesconoficinayid`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ciudadesconoficinayid` AS SELECT 
 1 AS `codigo oficina`,
 1 AS `ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_1_cliente` varchar(50) NOT NULL,
  `apellido_2_cliente` varchar(50) NOT NULL,
  `rep_ventas_id` int DEFAULT NULL,
  `limite_credito` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_rep_ventas_id_fkey` (`rep_ventas_id`),
  CONSTRAINT `cliente_rep_ventas_id_fkey` FOREIGN KEY (`rep_ventas_id`) REFERENCES `empleado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Daniel','Melendez','Mejía',8,1500),(2,'María','Gómez','Martínez',8,2000),(3,'Juan','Pérez','López',6,1800),(4,'Ana','Sánchez','García',6,1700),(5,'Carlos','Rodríguez','Hernández',10,1600),(6,'Laura','Fernández','Díaz',4,1900),(7,'Pedro','González','Ruiz',10,1750),(8,'Sofía','Díaz','Torres',5,1650),(9,'Luis','Martínez','Vázquez',5,1550),(10,'Paula','López','Fernández',10,1850),(11,'Javier','Hernández','Gómez',5,1950),(12,'Carmen','Ruiz','Pérez',3,2100),(13,'Diego','Vázquez','Sánchez',2,2200),(14,'Marta','Torres','Díaz',7,2250),(15,'Pablo','Fernández','González',2,2050),(16,'Elena','García','Martínez',6,2400),(17,'Andrés','Mejía','Sánchez',5,2300),(18,'Patricia','Martínez','López',5,2150),(19,'Francisco','López','Hernández',10,2600),(20,'Alejandra','González','Ruiz',3,2700),(21,'Felipe','Mendoza','Pineda',9,10000);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientesysusrepresentantes`
--

DROP TABLE IF EXISTS `clientesysusrepresentantes`;
/*!50001 DROP VIEW IF EXISTS `clientesysusrepresentantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientesysusrepresentantes` AS SELECT 
 1 AS `empleado`,
 1 AS `jefe`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_contacto` varchar(50) NOT NULL,
  `apellido_contacto` varchar(30) NOT NULL,
  `emai_contacto` varchar(30) DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cliente_id` (`cliente_id`),
  CONSTRAINT `FK_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'Juan','García','juangarcia@example.com',1),(2,'Ana','López','analopez@example.com',2),(3,'María','Fernández','mariafernandez@example.com',3),(4,'Carlos','Martínez','carlosmartinez@example.com',4),(5,'Laura','Sánchez','laurasanchez@example.com',5),(6,'Pedro','Díaz','pedrodiaz@example.com',6),(7,'Sofía','Ruiz','sofiaruiz@example.com',7),(8,'Luis','Torres','luistorres@example.com',8),(9,'Paula','Gómez','paulagomez@example.com',9),(10,'Javier','Vázquez','javiervazquez@example.com',10);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedido_id` int NOT NULL,
  `detalle_producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unidad` decimal(10,0) NOT NULL,
  `numero_linea` int NOT NULL,
  `transaccion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detalle_producto_id` (`detalle_producto_id`),
  KEY `FK_transaccion_id` (`transaccion_id`),
  KEY `fK_pedido_id` (`pedido_id`),
  CONSTRAINT `FK_detalle_producto_id` FOREIGN KEY (`detalle_producto_id`) REFERENCES `detalle_producto` (`id`),
  CONSTRAINT `fK_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK_transaccion_id` FOREIGN KEY (`transaccion_id`) REFERENCES `transaccion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,2,25,1,1),(2,1,2,1,40,2,1),(3,2,3,3,30,1,2),(4,2,4,1,15,2,2),(5,3,5,2,20,1,3),(6,3,1,1,25,2,3),(7,4,2,4,40,1,4),(8,4,3,2,30,2,4),(9,5,4,1,15,1,5),(10,5,5,3,20,2,5);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_gama` int NOT NULL,
  `id_dimension` int NOT NULL,
  `id_proveedor` int DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `precio_venta` decimal(10,0) NOT NULL,
  `precio_proveedor` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dimension_id` (`id_dimension`),
  KEY `FK_gama_id` (`id_gama`),
  KEY `FK_producto_id` (`id_producto`),
  KEY `FK_proveedor_id` (`id_proveedor`),
  CONSTRAINT `FK_dimension_id` FOREIGN KEY (`id_dimension`) REFERENCES `dimension` (`id`),
  CONSTRAINT `FK_gama_id` FOREIGN KEY (`id_gama`) REFERENCES `gama` (`id`),
  CONSTRAINT `FK_producto_id` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`),
  CONSTRAINT `FK_proveedor_id` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES (1,1,5,1,5,'Camisa de algodón',100,25,15),(2,2,5,2,5,'Pantalón vaquero',80,35,20),(3,3,5,3,5,'Zapatos de cuero',120,50,30),(4,4,5,15,5,'Corbata de seda',150,15,8),(5,5,5,14,5,'Bolso de mano',90,40,25);
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dimension` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dimension` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,'S'),(2,'M'),(3,'L'),(4,'XL'),(5,'28'),(6,'30'),(7,'32'),(8,'34'),(9,'36'),(10,'7'),(11,'8'),(12,'9'),(13,'10'),(14,'11'),(15,'Única'),(16,'Pequeño'),(17,'Mediano'),(18,'Grande');
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_cliente`
--

DROP TABLE IF EXISTS `direccion_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `linea_1` varchar(50) NOT NULL,
  `linea_2` varchar(50) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `ciudad_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ciudad_id` (`ciudad_id`),
  KEY `FK_cliente_idd` (`cliente_id`),
  CONSTRAINT `FK_ciudad_id` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `FK_cliente_idd` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_cliente`
--

LOCK TABLES `direccion_cliente` WRITE;
/*!40000 ALTER TABLE `direccion_cliente` DISABLE KEYS */;
INSERT INTO `direccion_cliente` VALUES (1,'Calle 55a ','24-45',10000,1,1),(2,'Calle 65a ','34-55',20000,1,2),(3,'Calle 65a ','34-55',30000,2,3),(4,'Avenida las palmas','34-55',67800,16,4),(5,'Avenida Gonzalez valencia','1204',98540,20,5),(6,'Avenida los edredones','45-55',67800,16,6),(7,'Calle Principal 3','NULL',28002,3,3),(8,'Calle Ejemplo 4','Piso 3',28003,4,4),(9,'Avenida Principal 5','NULL',28004,5,5),(10,'Calle Principal 6','Piso 4',28005,6,6),(11,'Avenida Ejemplo 7','NULL',28006,7,7),(12,'Calle Principal 8','NULL',28007,8,8),(13,'Avenida Ejemplo 9','Piso 5',28008,9,9),(14,'Calle Ejemplo 10','NULL',28009,10,10),(15,'Avenida Principal 11','Piso 6',28010,11,11),(16,'Calle Principal 12','NULL',28011,12,12),(17,'Avenida Ejemplo 13','Piso 7',28012,13,13),(18,'Calle Principal 14','NULL',28013,14,14),(19,'Cuadrada 63b','208_265',68001,5,21);
/*!40000 ALTER TABLE `direccion_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion_oficina`
--

DROP TABLE IF EXISTS `direccion_oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion_oficina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `linea_1` varchar(50) NOT NULL,
  `linea_2` varchar(50) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `ciudad_id` int NOT NULL,
  `oficina_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oficina_id` (`oficina_id`),
  KEY `FK_ciudad_idd` (`ciudad_id`),
  CONSTRAINT `FK_ciudad_idd` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `FK_oficina_id` FOREIGN KEY (`oficina_id`) REFERENCES `oficina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion_oficina`
--

LOCK TABLES `direccion_oficina` WRITE;
/*!40000 ALTER TABLE `direccion_oficina` DISABLE KEYS */;
INSERT INTO `direccion_oficina` VALUES (1,'Calle de la Plaza 10','Piso 3',41010,1,1),(2,'Avenida del Mar 20',NULL,29002,2,2),(3,'Calle Mayor 15','Piso 1',8002,3,3),(4,'Paseo de la Castellana 100',NULL,28003,4,4),(5,'Plaza de la Constitución 5','Oficina 7',46001,5,5),(6,'Avenida de los Pinos 30',NULL,32001,6,6),(7,'Calle del Río 25','Piso 4',26002,7,7),(8,'Plaza de la Libertad 8',NULL,34003,8,8),(9,'Avenida de la Revolución 45',NULL,10001,9,9),(10,'Calle de la Independencia 12',NULL,50002,10,10);
/*!40000 ALTER TABLE `direccion_oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_empleado` varchar(50) NOT NULL,
  `apellido_1` varchar(50) NOT NULL,
  `apellido_2` varchar(50) DEFAULT NULL,
  `oficina_id` int NOT NULL,
  `codigo_jefe` int DEFAULT NULL,
  `id_puesto` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jefe_id` (`codigo_jefe`),
  KEY `FK_puesto_id` (`id_puesto`),
  KEY `FK_oficina_id_empleado` (`oficina_id`),
  CONSTRAINT `FK_jefe_id` FOREIGN KEY (`codigo_jefe`) REFERENCES `empleado` (`id`),
  CONSTRAINT `FK_oficina_id_empleado` FOREIGN KEY (`oficina_id`) REFERENCES `oficina` (`id`),
  CONSTRAINT `FK_puesto_id` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Eduardo','Hernández','López',1,2,1),(2,'María','García','Fernández',2,1,2),(3,'Juan','Martínez','Pérez',3,1,3),(4,'Laura','Sánchez','Gómez',4,2,4),(5,'Carlos','Rodríguez','Ruiz',5,1,5),(6,'Ana','López','Díaz',6,1,6),(7,'Pedro','Fernández','Torres',7,2,7),(8,'Felipe','Mendoza','Pineda',8,1,8),(9,'Luis','Martínez','González',9,1,9),(10,'Paula','Gómez','Hernández',10,1,10);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empleadosnorepresentantes`
--

DROP TABLE IF EXISTS `empleadosnorepresentantes`;
/*!50001 DROP VIEW IF EXISTS `empleadosnorepresentantes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleadosnorepresentantes` AS SELECT 
 1 AS `nombre_empleado`,
 1 AS `apellido_1`,
 1 AS `apellido_2`,
 1 AS `nombre_puesto`,
 1 AS `numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Pendiente'),(2,'En proceso'),(3,'Enviado'),(4,'Entregado'),(5,'Rechazado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!50001 DROP VIEW IF EXISTS `estados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estados` AS SELECT 
 1 AS `id`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `filtarcantidaclientespais`
--

DROP TABLE IF EXISTS `filtarcantidaclientespais`;
/*!50001 DROP VIEW IF EXISTS `filtarcantidaclientespais`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `filtarcantidaclientespais` AS SELECT 
 1 AS `nombre_ciudad`,
 1 AS `Cantidad de clientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
INSERT INTO `forma_pago` VALUES (1,'Transferencia bancaria'),(2,'Tarjeta de crédito'),(3,'Cheque'),(4,'PayPal'),(5,'Efectivo');
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pago_cliente`
--

DROP TABLE IF EXISTS `forma_pago_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pago_cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_forma_pago` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id`,`id_forma_pago`,`id_cliente`),
  KEY `FK_cliente` (`id_cliente`),
  KEY `FK_forma_pago` (`id_forma_pago`),
  CONSTRAINT `FK_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_forma_pago` FOREIGN KEY (`id_forma_pago`) REFERENCES `forma_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago_cliente`
--

LOCK TABLES `forma_pago_cliente` WRITE;
/*!40000 ALTER TABLE `forma_pago_cliente` DISABLE KEYS */;
INSERT INTO `forma_pago_cliente` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,1,6),(7,2,7),(8,3,8),(9,4,9),(10,5,10),(11,1,11),(12,2,12),(13,3,13),(14,4,14),(15,5,15),(16,1,16),(17,2,17),(18,3,18),(19,4,19),(20,5,20);
/*!40000 ALTER TABLE `forma_pago_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gama`
--

DROP TABLE IF EXISTS `gama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gama` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion_texto` text,
  `descripcion_html` text,
  `imagen` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gama`
--

LOCK TABLES `gama` WRITE;
/*!40000 ALTER TABLE `gama` DISABLE KEYS */;
INSERT INTO `gama` VALUES (1,'Electrodomésticos','<p>Productos electrónicos para el hogar.</p>','electrodomesticos.jpg'),(2,'Electrónica de Consumo','<p>Dispositivos electrónicos de uso diario.</p>','electronica_consumo.jpg'),(3,'Juguetes','<p>Productos para el entretenimiento infantil.</p>','juguetes.jpg'),(4,'Artículos Deportivos','<p>Equipos y accesorios para deportes.</p>','deportes.jpg'),(5,'Hogar y Jardín','<p>Productos para el hogar y actividades al aire libre.</p>','hogar_jardin.jpg'),(7,'Mecánica','achetemeele','imagen.jpg'),(8,'NO Gaming','dsdadasfachetemeele','saaaimagen.jpg');
/*!40000 ALTER TABLE `gama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `gamascompradasclientes`
--

DROP TABLE IF EXISTS `gamascompradasclientes`;
/*!50001 DROP VIEW IF EXISTS `gamascompradasclientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `gamascompradasclientes` AS SELECT 
 1 AS `cliente`,
 1 AS `gama`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `oficina`
--

DROP TABLE IF EXISTS `oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_oficina` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficina`
--

LOCK TABLES `oficina` WRITE;
/*!40000 ALTER TABLE `oficina` DISABLE KEYS */;
INSERT INTO `oficina` VALUES (1,'Centro de Operaciones'),(2,'Sede Principal'),(3,'Oficina Central de Ventas'),(4,'Centro de Innovación'),(5,'Oficina Ejecutiva'),(6,'Sede Regional Norte'),(7,'Centro Logístico'),(8,'Oficina de Desarrollo'),(9,'Centro de Servicio al Cliente'),(10,'Sede Administrativa');
/*!40000 ALTER TABLE `oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pagoscllientesrepresentanteoficina`
--

DROP TABLE IF EXISTS `pagoscllientesrepresentanteoficina`;
/*!50001 DROP VIEW IF EXISTS `pagoscllientesrepresentanteoficina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pagoscllientesrepresentanteoficina` AS SELECT 
 1 AS `cliente`,
 1 AS `empleado`,
 1 AS `oficina`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'España'),(2,'Francia'),(3,'Alemania'),(4,'Italia'),(5,'Reino Unido'),(6,'Estados Unidos'),(7,'Canadá'),(8,'Australia'),(9,'Brasil'),(10,'Argentina'),(11,'México'),(12,'Japón'),(13,'China'),(14,'India'),(15,'Rusia'),(16,'Corea del Sur'),(17,'Sudáfrica'),(18,'Chile'),(19,'Colombia'),(20,'Perú');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_pedido` date NOT NULL,
  `fecha_esperada` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `comentarios` varchar(50) DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `estado_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estado_id` (`estado_id`),
  KEY `FK_cliente_id_pedido` (`id_cliente`),
  CONSTRAINT `FK_cliente_id_pedido` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2009-05-01','2009-05-10',NULL,'Pedido urgente',1,1),(2,'2009-05-02','2009-05-12',NULL,'Pedido estándar',2,2),(3,'2009-05-03','2009-05-15',NULL,'Pedido regular',3,3),(4,'2009-05-04','2009-05-18','2009-05-16','Pedido atrasado',4,4),(5,'2009-05-05','2009-05-20',NULL,'Pedido de última hora',5,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Camisa'),(2,'Pantalón'),(3,'Zapatos'),(4,'Corbata'),(5,'Bolso');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `productomenosstock`
--

DROP TABLE IF EXISTS `productomenosstock`;
/*!50001 DROP VIEW IF EXISTS `productomenosstock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productomenosstock` AS SELECT 
 1 AS `nombre_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Electrodomésticos y Más Distribuidores'),(2,'Electrónica Innovadora S.A.'),(3,'Juguetes Divertidos Ltda.'),(4,'Artículos Deportivos Rápido y Fuerte'),(5,'Hogar y Jardín Exteriores Inc.');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Director General'),(2,'Gerente de Ventas'),(3,'Analista de Marketing'),(4,'Especialista en Recursos Humanos'),(5,'Ingeniero de Desarrollo de Software'),(6,'Contador Financiero'),(7,'Asistente Administrativo'),(8,'Técnico de Soporte Técnico'),(9,'Asesor Comercial'),(10,'Técnico Auxiliar');
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_region` varchar(50) NOT NULL,
  `pais_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pais_id` (`pais_id`),
  CONSTRAINT `FK_pais_id` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Andalucía',1),(2,'Cataluña',1),(3,'Madrid',1),(4,'Comunidad Valenciana',1),(5,'Galicia',1),(6,'País Vasco',1),(7,'Castilla y León',1),(8,'Castilla-La Mancha',1),(9,'Aragón',1),(10,'Islas Baleares',1),(11,'Canarias',1),(12,'Asturias',1),(13,'Cantabria',1),(14,'Murcia',1),(15,'Extremadura',1),(16,'La Rioja',1),(17,'Navarra',1),(18,'Ceuta',1),(19,'Melilla',1),(20,'Comunidad Foral de Navarra',1);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_cliente`
--

DROP TABLE IF EXISTS `telefono_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_cliente` (
  `cliente_id` int NOT NULL,
  `tipo_telefono_id` int NOT NULL,
  `numero` int DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`cliente_id`,`tipo_telefono_id`),
  KEY `FK_tipo_telefono` (`tipo_telefono_id`),
  KEY `FK_cliente_id_tel` (`cliente_id`),
  CONSTRAINT `FK_cliente_id_tel` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_tipo_telefono` FOREIGN KEY (`tipo_telefono_id`) REFERENCES `tipo_telefono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_cliente`
--

LOCK TABLES `telefono_cliente` WRITE;
/*!40000 ALTER TABLE `telefono_cliente` DISABLE KEYS */;
INSERT INTO `telefono_cliente` VALUES (1,1,123456789,NULL,1),(1,2,987654321,NULL,2),(2,1,234567890,NULL,3),(2,2,876543210,NULL,4),(3,1,345678901,NULL,5),(3,2,765432109,NULL,6),(4,1,456789012,NULL,7),(4,2,654321098,NULL,8),(5,1,567890123,NULL,9),(5,2,543210987,NULL,10),(6,1,678901234,NULL,11),(6,2,432109876,NULL,12),(7,1,789012345,NULL,13),(7,2,321098765,NULL,14),(8,1,890123456,NULL,15),(8,2,210987654,NULL,16),(9,1,901234567,NULL,17),(9,2,109876543,NULL,18),(10,1,12345678,NULL,19),(10,2,98765432,NULL,20),(11,1,112233445,NULL,21),(11,2,112233445,NULL,22),(12,1,223344556,NULL,23),(12,2,223344556,NULL,24),(13,1,334455667,NULL,25),(13,2,334455667,NULL,26),(14,1,445566778,NULL,27),(14,2,445566778,NULL,28),(15,1,556677889,NULL,29),(15,2,556677889,NULL,30),(16,1,667788990,NULL,31),(16,2,667788990,NULL,32),(17,1,778899001,NULL,33),(17,2,778899001,NULL,34),(18,1,889900112,NULL,35),(18,2,889900112,NULL,36),(19,1,990011223,NULL,37),(19,2,990011223,NULL,38),(20,1,1122334,NULL,39),(20,2,1122334,NULL,40),(21,1,316588090,'784555',41);
/*!40000 ALTER TABLE `telefono_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_contacto`
--

DROP TABLE IF EXISTS `telefono_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_contacto` (
  `numero` int NOT NULL,
  `tipo_telefono` int NOT NULL,
  `contacto_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_contacto_id` (`contacto_id`),
  KEY `FK_tipo_telefono_id` (`tipo_telefono`),
  CONSTRAINT `FK_contacto_id` FOREIGN KEY (`contacto_id`) REFERENCES `contacto` (`id`),
  CONSTRAINT `FK_tipo_telefono_id` FOREIGN KEY (`tipo_telefono`) REFERENCES `tipo_telefono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_contacto`
--

LOCK TABLES `telefono_contacto` WRITE;
/*!40000 ALTER TABLE `telefono_contacto` DISABLE KEYS */;
INSERT INTO `telefono_contacto` VALUES (123456789,1,1,1),(987654321,2,2,2),(555555555,1,3,3),(666666666,2,4,4),(777777777,3,5,5);
/*!40000 ALTER TABLE `telefono_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_empleado`
--

DROP TABLE IF EXISTS `telefono_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_empleado` (
  `tipo_telefono` int NOT NULL,
  `empleado_id` int NOT NULL,
  `numero` int NOT NULL,
  `extension` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_empleado_id` (`empleado_id`),
  KEY `FK_tipo_telefono_empleado` (`tipo_telefono`),
  CONSTRAINT `FK_empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`),
  CONSTRAINT `FK_tipo_telefono_empleado` FOREIGN KEY (`tipo_telefono`) REFERENCES `tipo_telefono` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_empleado`
--

LOCK TABLES `telefono_empleado` WRITE;
/*!40000 ALTER TABLE `telefono_empleado` DISABLE KEYS */;
INSERT INTO `telefono_empleado` VALUES (1,1,5551234,100,1),(1,2,5555678,101,2),(1,3,5559101,102,3),(1,4,5552345,103,4),(1,5,5556789,104,5),(1,6,5553456,100,6),(1,7,5557890,101,7),(1,8,5554321,102,8),(1,9,5558765,103,9),(1,10,5552109,104,10);
/*!40000 ALTER TABLE `telefono_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono_oficina`
--

DROP TABLE IF EXISTS `telefono_oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono_oficina` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_telefono` int NOT NULL,
  `oficina_id` int NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`tipo_telefono`,`oficina_id`),
  KEY `FK_oficina_idd` (`oficina_id`),
  CONSTRAINT `FK_oficina_idd` FOREIGN KEY (`oficina_id`) REFERENCES `oficina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono_oficina`
--

LOCK TABLES `telefono_oficina` WRITE;
/*!40000 ALTER TABLE `telefono_oficina` DISABLE KEYS */;
INSERT INTO `telefono_oficina` VALUES (1,1,1,'1234567890'),(2,2,2,'9876543210'),(3,1,3,'5555555555'),(4,1,4,'6666666666'),(5,2,5,'7777777777'),(6,1,6,'8888888888'),(7,1,7,'9999999999'),(8,2,8,'1111111111'),(9,1,9,'2222222222'),(10,1,10,'3333333333');
/*!40000 ALTER TABLE `telefono_oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefono` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefono`
--

LOCK TABLES `tipo_telefono` WRITE;
/*!40000 ALTER TABLE `tipo_telefono` DISABLE KEYS */;
INSERT INTO `tipo_telefono` VALUES (1,'Teléfono fijo'),(2,'Teléfono móvil'),(3,'Fax');
/*!40000 ALTER TABLE `tipo_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_forma_pago_cliente` int NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `total` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_forma_pago_cliente_id` (`id_forma_pago_cliente`),
  CONSTRAINT `FK_forma_pago_cliente_id` FOREIGN KEY (`id_forma_pago_cliente`) REFERENCES `forma_pago_cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
INSERT INTO `transaccion` VALUES (1,1,'2009-05-01',1000),(2,2,'2009-05-02',1500),(3,3,'2009-05-03',800),(4,4,'2009-05-04',1200),(5,5,'2009-05-05',2000),(6,1,'2009-05-01',120),(7,2,'2009-05-02',250),(8,3,'2009-05-03',180),(9,4,'2009-05-04',300),(10,5,'2009-05-05',150);
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ciudadconoficinaempleados`
--

/*!50001 DROP VIEW IF EXISTS `ciudadconoficinaempleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ciudadconoficinaempleados` AS select `ci`.`nombre_ciudad` AS `nombre_ciudad`,count(`e`.`id`) AS `Cantidad empleados` from ((`empleado` `e` join `direccion_oficina` `d_o` on((`e`.`oficina_id` = `d_o`.`oficina_id`))) join `ciudad` `ci` on((`d_o`.`ciudad_id` = `ci`.`id`))) group by `ci`.`nombre_ciudad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ciudadesconoficinayid`
--

/*!50001 DROP VIEW IF EXISTS `ciudadesconoficinayid`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ciudadesconoficinayid` AS select `o`.`id` AS `codigo oficina`,`c`.`nombre_ciudad` AS `ciudad` from (`oficina` `o` join `ciudad` `c` on((`c`.`id` = `o`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clientesysusrepresentantes`
--

/*!50001 DROP VIEW IF EXISTS `clientesysusrepresentantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientesysusrepresentantes` AS select `e`.`nombre_empleado` AS `empleado`,`j`.`nombre_empleado` AS `jefe` from (`empleado` `e` left join `empleado` `j` on((`e`.`codigo_jefe` = `j`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleadosnorepresentantes`
--

/*!50001 DROP VIEW IF EXISTS `empleadosnorepresentantes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleadosnorepresentantes` AS select `e`.`nombre_empleado` AS `nombre_empleado`,`e`.`apellido_1` AS `apellido_1`,`e`.`apellido_2` AS `apellido_2`,`p`.`nombre_puesto` AS `nombre_puesto`,`te`.`numero` AS `numero` from ((`empleado` `e` join `puesto` `p` on((`e`.`id_puesto` = `p`.`id`))) left join `telefono_empleado` `te` on((`e`.`id` = `te`.`empleado_id`))) where `e`.`id` in (select `cliente`.`rep_ventas_id` from `cliente` where (`cliente`.`rep_ventas_id` is not null)) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estados`
--

/*!50001 DROP VIEW IF EXISTS `estados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estados` AS select `estado`.`id` AS `id`,`estado`.`estado` AS `estado` from `estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `filtarcantidaclientespais`
--

/*!50001 DROP VIEW IF EXISTS `filtarcantidaclientespais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `filtarcantidaclientespais` AS select `ci`.`nombre_ciudad` AS `nombre_ciudad`,count(`c`.`id`) AS `Cantidad de clientes` from ((`cliente` `c` join `direccion_cliente` `d_c` on((`c`.`id` = `d_c`.`cliente_id`))) join `ciudad` `ci` on((`d_c`.`ciudad_id` = `ci`.`id`))) group by `ci`.`nombre_ciudad` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `gamascompradasclientes`
--

/*!50001 DROP VIEW IF EXISTS `gamascompradasclientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `gamascompradasclientes` AS select `c`.`nombre_cliente` AS `cliente`,`g`.`descripcion_texto` AS `gama` from ((((`cliente` `c` join `pedido` `pe` on((`c`.`id` = `pe`.`id_cliente`))) join `detalle_pedido` `dp` on((`pe`.`id` = `dp`.`pedido_id`))) join `detalle_producto` `dpt` on((`dp`.`detalle_producto_id` = `dpt`.`id`))) join `gama` `g` on((`dpt`.`id_gama` = `g`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pagoscllientesrepresentanteoficina`
--

/*!50001 DROP VIEW IF EXISTS `pagoscllientesrepresentanteoficina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pagoscllientesrepresentanteoficina` AS select `c`.`nombre_cliente` AS `cliente`,`e`.`nombre_empleado` AS `empleado`,`o`.`nombre_oficina` AS `oficina` from (((`cliente` `c` join `pedido` `pe` on((`c`.`id` = `pe`.`id_cliente`))) join `empleado` `e` on((`c`.`rep_ventas_id` = `e`.`id`))) join `oficina` `o` on((`e`.`oficina_id` = `o`.`id`))) where (`pe`.`id_cliente` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productomenosstock`
--

/*!50001 DROP VIEW IF EXISTS `productomenosstock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productomenosstock` AS select `p`.`nombre_producto` AS `nombre_producto` from (`producto` `p` join `detalle_producto` `dp` on((`p`.`id` = `dp`.`id_producto`))) where `dp`.`stock` <= all (select `detalle_producto`.`stock` from `detalle_producto`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14  7:30:47
