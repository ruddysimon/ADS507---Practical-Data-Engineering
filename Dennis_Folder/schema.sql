SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA `airbnb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `airbnb`;

--
-- Table structure for table `listings`
--

DROP TABLE `listings`;

CREATE TABLE `airbnb`.`listings` (
    `listing_id` BIGINT NOT NULL AUTO_INCREMENT,
    `review_id` SMALLINT UNSIGNED NOT NULL, 
    `calendar_id` SMALLINT UNSIGNED NOT NULL, 
    `listing_url` TEXT NOT NULL,
    `scrape_id` BIGINT NOT NULL,
    `last_scraped` DATE NOT NULL,
    `listing_name` VARCHAR(100) NOT NULL,
    `summary` TEXT NOT NULL,
    `listing_space` TEXT NOT NULL,
    `listing_description` TEXT NOT NULL,
    `experiences_offered` VARCHAR(10) NOT NULL,
    `neighborhood_overview` TEXT NOT NULL,
    `notes` TEXT NOT NULL,
    `transit` TEXT NOT NULL,
    `thumbnail_url` TEXT NOT NULL,
    `medium_url` TEXT NOT NULL,
    `picture_url` TEXT NOT NULL,
    `xl_picture_url` TEXT NOT NULL,
    `host_id` INT UNSIGNED NOT NULL,
    `host_uRL` TEXT NOT NULL,
    `host_name` VARCHAR (100) NOT NULL,
    `host_since` DATE NOT NULL,
    `host_location` VARCHAR (100) NOT NULL,
    `host_about` TEXT NOT NULL, 
    `host_response_time` VARCHAR(100) NOT NULL,
    `host_response_rate` DECIMAL (5,2) NOT NULL,
    `host_acceptance_rate` DECIMAL (5,2) NOT NULL,
    `host_is_superhost` VARCHAR (2) NOT NULL,
    `host_thumbnail_url` TEXT NOT NULL,
    `host_picture_url` TEXT NOT NULL,
    `host_neighbourhood` VARCHAR (100) NOT NULL,
    `host_listings_count` INT NOT NULL,
    `host_total_listings_count` INT NOT NULL,
    `host_verifications` VARCHAR (500) NOT NULL,
    `host_has_profile_pic` VARCHAR (1) NOT NULL,
    `host_identity_verified` VARCHAR (1) NOT NULL,
    `street` TEXT NOT NULL,
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
    `is_location_exact` BOOLEAN NULL DEFAULT NULL,
    `property_type` VARCHAR(50) NULL DEFAULT NULL,
    `room_type` VARCHAR(50) NULL DEFAULT NULL,
    `accommodates` SMALLINT UNSIGNED NULL,
    `bathrooms` FLOAT UNSIGNED NOT NULL,
    `bedrooms` SMALLINT UNSIGNED NOT NULL,
    `beds` SMALLINT UNSIGNED NULL,
    `bed_type` VARCHAR(50) NULL DEFAULT NULL,
    `amenities` TEXT NULL DEFAULT NULL, -- Make Amentities Table during ETL?
    `square_feet` BIGINT NULL DEFAULT NULL,
    `price` FLOAT UNSIGNED NOT NULL,
    `weekly_price` FLOAT UNSIGNED NOT NULL,
    `monthly_price` FLOAT UNSIGNED NOT NULL,
    `security_deposit` FLOAT UNSIGNED NOT NULL,
    `cleaning_fee` FLOAT UNSIGNED NOT NULL,
    `guests_included` SMALLINT UNSIGNED NOT NULL,
    `extra_people` FLOAT UNSIGNED NOT NULL,
    `minimum_nights` SMALLINT UNSIGNED NOT NULL,
    `maximum_nights` SMALLINT UNSIGNED NOT NULL,
    `calendar_updated` VARCHAR(50) NULL DEFAULT NULL,
    `has_availability` BOOLEAN NULL DEFAULT NULL,
    `availability_30` SMALLINT UNSIGNED NOT NULL,
    `availability_60` SMALLINT UNSIGNED NOT NULL,
    `availability_90` SMALLINT UNSIGNED NOT NULL,
    `availability_365` SMALLINT UNSIGNED NOT NULL,
    `calendar_last_scraped` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `number_of_reviews` SMALLINT UNSIGNED NULL,
    `first_review` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `last_review` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `review_scores_rating` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_accuracy` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_cleanliness` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_checkin` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_communication` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_location` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `review_scores_value` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `requires_license` BOOLEAN NULL DEFAULT NULL,
    `license` VARCHAR(50) NULL DEFAULT NULL,
    `jurisdiction_names` VARCHAR(50) NULL DEFAULT 'WASHINGTON',
    `instant_bookable` BOOLEAN NULL DEFAULT NULL,
    `cancellation_policy` VARCHAR(50) NULL DEFAULT NULL,
    `require_guest_profile_picture` BOOLEAN NULL DEFAULT NULL,
    `require_guest_phone_verification` BOOLEAN NULL DEFAULT NULL,
    `calculated_host_listings_count` SMALLINT UNSIGNED NULL DEFAULT NULL,
    `reviews_per_month` FLOAT UNSIGNED NULL,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- might already be included
    PRIMARY KEY  (`listing_id`)
    CONSTRAINT `fk_reviews`
        FOREIGN KEY (`review_id`)
        REFERENCES `airbnb`.`reviews` (`review_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    CONSTRAINT `fk_calendar`
        FOREIGN KEY (`calendar_id`)
        REFERENCES `airbnb`.`calendar` (`calendar_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- What is Customer? 
-- Are we making another table for Customer?
CREATE INDEX `index_listing_id_scrape_id`
ON Customer (`listing_id`, `scrape_id` );

--
-- Table structure for table `calendar`
--

CREATE TABLE `airbnb`.`calendar` (
    `calendar_id` BIGINT NOT NULL AUTO_INCREMENT,
    `listing_id` int NOT NULL,
    `date` date DEFAULT NULL,
    `available` varchar(45) DEFAULT NULL,
    `price` float DEFAULT NULL,
    PRIMARY KEY (`calendar_id`)
    CONSTRAINT `fk_listing`
        FOREIGN KEY (`listing_id`)
        REFERENCES `airbnb`.`listing` (`listing_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `reviews`
--

CREATE TABLE `airbnb`.`reviews` (
    `review_id` BIGINT NOT NULL AUTO_INCREMENT,
    `listing_id` int NOT NULL,
    `id` int DEFAULT NULL,
    `date` date DEFAULT NULL,
    `reviewe_id` int DEFAULT NULL,
    `reviewe_name` varchar(45) DEFAULT NULL,
    `comments` varchar(300) DEFAULT NULL,
    PRIMARY KEY (`review_id`)
    CONSTRAINT `fk_listing`
        FOREIGN KEY (`listing_id`)
        REFERENCES `airbnb`.`listing` (`listing_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
