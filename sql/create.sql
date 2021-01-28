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
  `address_id` INT(20)
);

CREATE TABLE `address` (
  `address_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `division_id` INT(20),
  `district_id` INT(20)
);

CREATE TABLE `location` (
  `id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `catagory` TINYTEXT NOT NULL
);

CREATE TABLE `projects` (
  `project_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `user_id` INT(20),
  `package_id` INT(20),
  `created_at` TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `position` (
  `position_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `cost` INT(20) NOT NULL
);

CREATE TABLE `rank` (
  `rank_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `name` TINYTEXT NOT NULL,
  `bonus` DECIMAL(3,2) NOT NULL
);

CREATE TABLE `status` (
  `status_id` INT(20) PRIMARY KEY AUTO_INCREMENT,
  `position_id` INT(20) NOT NULL,
  `rank_id` INT(20)
);

CREATE TABLE `admin` (
  `admin_id` INT(20)
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
  `created_at` TIMESTAMP DEFAULT NOW()
);

ALTER TABLE `messege`
ADD FOREIGN KEY (`from`)
REFERENCES `person`(`person_id`)
ON DELETE SET NULL;

ALTER TABLE `messege`
ADD FOREIGN KEY (`to`)
REFERENCES `person`(`person_id`)
ON DELETE SET NULL;

ALTER TABLE `status`
ADD FOREIGN KEY (`position_id`)
REFERENCES `position`(`position_id`)
ON DELETE CASCADE,
ADD FOREIGN KEY (`rank_id`)
REFERENCES `rank`(`rank_id`)
ON DELETE CASCADE;

ALTER TABLE `admin`
ADD FOREIGN KEY (`admin_id`)
REFERENCES `person`(`person_id`)
ON DELETE CASCADE;

ALTER TABLE `person`
ADD FOREIGN KEY (`status_id`)
REFERENCES `status`(`status_id`)
ON DELETE SET NULL,
ADD FOREIGN KEY (`address_id`)
REFERENCES `address`(`address_id`)
ON DELETE SET NULL;

ALTER TABLE `venue`
ADD FOREIGN KEY(`address_id`)
REFERENCES `address`(`address_id`)
ON DELETE SET NULL;

ALTER TABLE `services`
ADD FOREIGN KEY (`package_id`)
REFERENCES `package`(`package_id`)
ON DELETE CASCADE,
ADD FOREIGN KEY (`item_id`)
REFERENCES `items`(`item_id`)
ON DELETE CASCADE;

ALTER TABLE `works`
ADD FOREIGN KEY (`package_id`)
REFERENCES `package`(`package_id`)
ON DELETE CASCADE,
ADD FOREIGN KEY (`stuff_id`)
REFERENCES `person`(`person_id`)
ON DELETE CASCADE;

ALTER TABLE `package`
ADD FOREIGN KEY (`venue_id`)
REFERENCES `venue`(`venue_id`)
ON DELETE SET NULL;


ALTER TABLE `address`
ADD FOREIGN KEY (`division_id`)
REFERENCES `location`(`id`)
ON DELETE SET NULL,
ADD FOREIGN KEY (`district_id`)
REFERENCES `location`(`id`)
ON DELETE SET NULL;

ALTER TABLE `transaction`
ADD FOREIGN KEY (`project_id`)
REFERENCES `projects`(project_id)
ON DELETE SET NULL;

ALTER TABLE `projects`
ADD FOREIGN KEY (`user_id`)
REFERENCES `person`(`person_id`)
ON DELETE SET NULL,
ADD FOREIGN KEY (`package_id`)
REFERENCES `package`(`package_id`)
ON DELETE SET NULL;
