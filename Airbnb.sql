SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



use `Airbnb-Seattle`;

DROP SCHEMA IF EXISTS `Airbnb-Seattle`;
DROP TABLE listings;

-- Table structure for table `listings`


CREATE TABLE listings (
  `id` INT UNSIGNED NOT NULL,
  `listing_url` TEXT DEFAULT NULL,
  `scrape_id` BIGINT DEFAULT NULL,
  `last_scraped` DATE DEFAULT NULL,
  `name` VARCHAR(100) DEFAULT NULL,
  `summary` TEXT DEFAULT NULL,
  `space` TEXT DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `experiences_offered` VARCHAR(10) DEFAULT NULL,
  `neighborhood_overview` TEXT DEFAULT NULL,
  `notes` TEXT DEFAULT NULL,
  `transit` TEXT DEFAULT NULL,
  `thumbnail_url` TEXT DEFAULT NULL,
  `medium_url` TEXT DEFAULT NULL,
  `picture_url` TEXT DEFAULT NULL,
  `xl_picture_url` TEXT DEFAULT NULL,
  `host_id` INT UNSIGNED DEFAULT NULL,
  `host_uRL` TEXT DEFAULT NULL,
  `host_name` VARCHAR (100) DEFAULT NULL,
  `host_since` DATE DEFAULT NULL,
  `host_location` VARCHAR (100) DEFAULT NULL,
  `host_about` TEXT DEFAULT NULL, 
  `host_response_time` VARCHAR(100) DEFAULT NULL,
  `host_response_rate` VARCHAR(10) DEFAULT NULL,
  `host_acceptance_rate` VARCHAR(10) DEFAULT NULL,
  `host_is_superhost` VARCHAR(1) DEFAULT NULL,
  `host_thumbnail_url` TEXT DEFAULT NULL,
  `host_picture_url` TEXT DEFAULT NULL,
  `host_neighbourhood` VARCHAR (100) DEFAULT NULL,
  `host_listings_count` INT DEFAULT NULL,
  `host_total_listings_count` INT DEFAULT NULL,
  `host_verifications` VARCHAR (500) DEFAULT NULL,
  `host_has_profile_pic` VARCHAR(1) DEFAULT NULL,
  `host_identity_verified` VARCHAR(1) DEFAULT NULL,
  `street` TEXT DEFAULT NULL,
  `neighbourhood` VARCHAR (100) NOT NULL,
  `neighbourhood_cleansed` VARCHAR (100) NOT NULL,
  `neighbourhood_group_cleansed` VARCHAR (100) NOT NULL,
  `city` VARCHAR (100) NOT NULL,
  `state` VARCHAR (10) NOT NULL,
  `zipcode` INT NOT NULL,
  `market` VARCHAR(50) NULL DEFAULT 'Seattle',
    `smart_location` VARCHAR(50) NULL DEFAULT 'Seattle, WA',
    `country_code` VARCHAR(2) NOT NULL DEFAULT 'US',
    `country` VARCHAR(50) NOT NULL DEFAULT 'United States',
    `latitude` VARCHAR(50) NULL DEFAULT NULL,
    `longitude` VARCHAR(50) NULL DEFAULT NULL,
    `is_location_exact` VARCHAR(1) NULL DEFAULT NULL,
    `property_type` VARCHAR(50) NULL DEFAULT NULL,
    `room_type` VARCHAR(50) NULL DEFAULT NULL,
    `accommodates` SMALLINT UNSIGNED NULL,
    `bathrooms` FLOAT UNSIGNED NOT NULL,
    `bedrooms` SMALLINT UNSIGNED NOT NULL,
    `beds` SMALLINT UNSIGNED NULL,
    `bed_type` VARCHAR(50) NULL DEFAULT NULL,
    `amenities` TEXT NULL DEFAULT NULL, -- Could be changed to object maybe?
    `square_feet` BIGINT DEFAULT NULL,
    `price` VARCHAR(10) DEFAULT NULL,
    `weekly_price` VARCHAR(10) DEFAULT NULL,
    `monthly_price` VARCHAR(10) DEFAULT NULL,
    `security_deposit` VARCHAR(10) DEFAULT NULL,
    `cleaning_fee` VARCHAR(10) DEFAULT NULL,
    `guests_included` SMALLINT UNSIGNED NOT NULL,
    `extra_people` VARCHAR(10) DEFAULT NULL,
    `minimum_nights` SMALLINT UNSIGNED NOT NULL,
    `maximum_nights` SMALLINT UNSIGNED NOT NULL,
    `calendar_updated` VARCHAR(50) NULL DEFAULT NULL,
    `has_availability` VARCHAR(1) DEFAULT NULL,
    `availability_30` SMALLINT UNSIGNED NOT NULL,
    `availability_60` SMALLINT UNSIGNED NOT NULL,
    `availability_90` SMALLINT UNSIGNED NOT NULL,
    `availability_365` SMALLINT UNSIGNED NOT NULL,
    `calendar_last_scraped` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `number_of_reviews` SMALLINT UNSIGNED NULL,
    `first_review` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `last_review` DATE DEFAULT NULL,
    `review_scores_rating` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_accuracy` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_cleanliness` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_checkin` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_communication` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_location` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_value` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `requires_license` VARCHAR(1) DEFAULT NULL,
    `license` VARCHAR(50) NULL DEFAULT NULL,
    `jurisdiction_names` VARCHAR(50) NULL DEFAULT 'WASHINGTON',
    `instant_bookable` VARCHAR(1) DEFAULT NULL,
    `cancellation_policy` VARCHAR(50) NULL DEFAULT NULL,
    `require_guest_profile_picture` VARCHAR(1) DEFAULT NULL,
    `require_guest_phone_verification` VARCHAR(1) DEFAULT NULL,
    `calculated_host_listings_count` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `reviews_per_month` FLOAT UNSIGNED NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX index_id_scrape_id
ON listings (id, scrape_id );


drop table `calendar`;

CREATE TABLE `calendar` (
  `calendar_id` int not null auto_increment,
  `listing_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `available` TEXT DEFAULT NULL,
  `price` text not NULL,
  PRIMARY KEY (`calendar_id`,`listing_id`) # Composite Primary Key
  #FOREIGN KEY (`listing_id`) REFERENCES listings(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



drop table `reviews`;


CREATE TABLE `reviews` (
  `listing_id` int NOT NULL,
  `id` int,
  `date` date,
  `reviewer_id` int DEFAULT NULL,
  `reviewer_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
  #FOREIGN KEY (`listing_id`) REFERENCES listings(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;





LOAD DATA LOCAL INFILE '/Users/ruddysimonpour/Desktop/University of Sandiego - Curriculum/ADS507-Practical Data Engineering/ADS507-Practical-Data-Engineering/Dataset/calendar.csv'
INTO TABLE calendar 
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


show global variables like 'local_infile';

