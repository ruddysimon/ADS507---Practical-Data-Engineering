SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA `airbnb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `airbnb`;

--
-- Table structure for table `listings`
--

CREATE TABLE `airbnb`.`listings` (
    `id` BIGINT NOT NULL AUTO_INCREMENT, -- might already be included
    `review_id` SMALLINT UNSIGNED NOT NULL,  -- might already be included
    `calendar_id` SMALLINT UNSIGNED NOT NULL,  -- might already be included
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
    `amenities` TEXT NULL DEFAULT NULL, -- Could be changed to object maybe?
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
    CONSTRAINT `fk_reviews`  -- might already be included
        FOREIGN KEY (`review_id`)
        REFERENCES `airbnb`.`reviews` (`review_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
    CONSTRAINT `fk_calendar`  -- might already be included
        FOREIGN KEY (`calendar_id`)
        REFERENCES `airbnb`.`calendar` (`calendar_id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
