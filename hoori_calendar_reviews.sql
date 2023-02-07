SELECT * FROM Airbnb_db_calendar_reviews.calendar;CREATE TABLE `calendar` (
  `listing_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `available` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `reviews` (
  `listing_id` int NOT NULL,
  `id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `reviewe_id` int DEFAULT NULL,
  `reviewe_name` varchar(45) DEFAULT NULL,
  `comments` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
