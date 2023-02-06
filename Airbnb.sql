use `Airbnb-Seattle`;

DROP SCHEMA IF EXISTS `Airbnb-Seattle`;


-- Table structure for table `customer`

DROP TABLE listings;

CREATE TABLE listings (
  listing_id INT UNSIGNED NOT NULL,
  listing_url TEXT NOT NULL,
  scrape_id BIGINT NOT NULL,
  last_scraped DATE NOT NULL,
  listing_name VARCHAR(100) NOT NULL,
  summary TEXT NOT NULL,
  listing_space TEXT NOT NULL,
  listing_description TEXT NOT NULL,
  experiences_offered VARCHAR(10) NOT NULL,
  neighborhood_overview TEXT NOT NULL,
  notes TEXT NOT NULL,
  transit TEXT NOT NULL,
  thumbnail_url TEXT NOT NULL,
  medium_url TEXT NOT NULL,
  picture_url TEXT NOT NULL,
  xl_picture_url TEXT NOT NULL,
  host_id INT UNSIGNED NOT NULL,
  host_uRL TEXT NOT NULL,
  host_name VARCHAR (100) NOT NULL,
  host_since DATE NOT NULL,
  host_location VARCHAR (100) NOT NULL,
  host_about TEXT NOT NULL, 
  host_response_time VARCHAR(100) NOT NULL,
  host_response_rate DECIMAL (5,2) NOT NULL,
  host_acceptance_rate DECIMAL (5,2) NOT NULL,
  host_is_superhost VARCHAR (2) NOT NULL,
  host_thumbnail_url TEXT NOT NULL,
  host_picture_url TEXT NOT NULL,
  host_neighbourhood VARCHAR (100) NOT NULL,
  host_listings_count INT NOT NULL,
  host_total_listings_count INT NOT NULL,
  host_verifications VARCHAR (500) NOT NULL,
  host_has_profile_pic VARCHAR (1) NOT NULL,
  host_identity_verified VARCHAR (1) NOT NULL,
  street TEXT NOT NULL,
  neighbourhood VARCHAR (100) NOT NULL,
  neighbourhood_cleansed VARCHAR (100) NOT NULL,
  neighbourhood_group_cleansed VARCHAR (100) NOT NULL,
  city VARCHAR (100) NOT NULL,
  state VARCHAR (10) NOT NULL,
  zipcode INT NOT NULL,
  
  
  
  
  
  PRIMARY KEY  (listing_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE INDEX index_listing_id_scrape_id
ON Customer (listing_id, scrape_id );








