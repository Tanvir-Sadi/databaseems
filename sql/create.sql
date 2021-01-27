CREATE TABLE `person` (
  `person_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `email` TINYTEXT NOT NULL,
  `password` TINYTEXT NOT NULL,
  `address_id` INT(20),
  `gender` VARCHAR(6),
  `created_at` TIMESTAMP DEFAULT NOW(),
  `status_id` INT(20)
);

CREATE TABLE `package` (
  `package_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `description` LONGTEXT,
  `venue_id` INT(20)
);

CREATE TABLE `items` (
  `item_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `description` LONGTEXT,
  `cost` INT(10) NOT NULL,
  `price` INT(10) NOT NULL,
  `catagory` VARCHAR(20) NOT NULL
);

CREATE TABLE `works` (
  `package_id` INT(20),
  `stuff_id` INT(20),
  PRIMARY KEY (`package_id`, `stuff_id`)
);

CREATE TABLE `services` (
  `package_id` INT(20),
  `item_id` INT(20),
  `amount` INT(10),
  PRIMARY KEY (`package_id`, `item_id`)
);

CREATE TABLE `venue` (
  `venue_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `description` LONGTEXT,
  `cost` INT(10) NOT NULL,
  `price` INT(10) NOT NULL,
  `address_id` INT(20) NOT NULL
);

CREATE TABLE `address` (
  `address_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `division_id` INT(20),
  `district_id` INT(20),
  `area_id` INT(20)
);

CREATE TABLE `location` (
  `id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `catagory` TINYTEXT NOT NULL
);

CREATE TABLE `projects` (
  `project_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `user_id` INT(20) NOT NULL,
  `package_id` INT(20) NOT NULL,
  `created_at` TIMESTAMP DEFAULT NOW();
);

CREATE TABLE `position` (
  `position_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `cost` INT(20) NOT NULL
);

CREATE TABLE `rank` (
  `rank_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `bonus` DECIMAL(2,1) NOT NULL
);

CREATE TABLE `status` (
  `status_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `position_id` INT(20) NOT NULL,
  `rank_id` INT(20) NOT NULL
);

CREATE TABLE `admin` (
  `admin_id` INT(20) NOT NULL
);

CREATE TABLE `messege` (
  `messege_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `from` INT(20),
  `to` INT(20),
  `subject` MEDIUMTEXT,
  `text_messege` LONGTEXT,
  `status` TINYTEXT DEFAULT 'unseen',
  `sent_at` TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `transaction` (
  `tran_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `project_id` INT(20),
  `total_cost` INT(20) NOT NULL,
  `total_price` INT(20) NOT NULL,
  `created_at` TIMESTAMP DEFAULT NOW();
);
