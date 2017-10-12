CREATE TABLE `book` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`title` varchar(255) NOT NULL,
	`discription` TEXT NOT NULL,
	`price` varchar(255) NOT NULL,
	`img` varchar(255) NOT NULL DEFAULT 'no_image.jpg',
	`discount` FLOAT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name_author` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `genre` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name_genre` varchar(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `book_to_ganre` (
	`id_book` int(11) NOT NULL,
	`id_genre` int(11) NOT NULL
);

CREATE TABLE `book_to_author` (
	`id_book` int(11) NOT NULL,
	`id_author` int(11) NOT NULL
);

CREATE TABLE `client` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`login` varchar(255) NOT NULL,
	`password` varchar(100) NOT NULL,
	`hash` varchar(255) NOT NULL,
	`role` enum('admin','user') NOT NULL,
	`discount` FLOAT(10) NOT NULL DEFAULT '0',
	`active` enum('yes','no') NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cart` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`id_book` int(11) NOT NULL,
	`id_client` int(11) NOT NULL,
	`count` int(11) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `orders` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`id_client` int(11) NOT NULL AUTO_INCREMENT,
	`id_status` int(11) NOT NULL AUTO_INCREMENT,
	`time` DATE NOT NULL,
	`id_payment` int NOT NULL,
	`total_price` FLOAT(10) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `payment` (
	`id` int(5) NOT NULL AUTO_INCREMENT,
	`name_pay` int(5) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `order_status` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name_statut` int(11) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `history_book` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`author` varchar(255) NOT NULL,
	`genre` varchar(255) NOT NULL,
	`price` int(11) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `orders_full_info` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`id_order` int(11) NOT NULL,
	`id_book` int(11) NOT NULL,
	`title_book` varchar(255) NOT NULL,
	`price` varchar(255) NOT NULL,
	`discount_book` TEXT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `book_to_ganre` ADD CONSTRAINT `book_to_ganre_fk0` FOREIGN KEY (`id_book`) REFERENCES `book`(`id`);

ALTER TABLE `book_to_ganre` ADD CONSTRAINT `book_to_ganre_fk1` FOREIGN KEY (`id_genre`) REFERENCES `genre`(`id`);

ALTER TABLE `book_to_author` ADD CONSTRAINT `book_to_author_fk0` FOREIGN KEY (`id_book`) REFERENCES `book`(`id`);

ALTER TABLE `book_to_author` ADD CONSTRAINT `book_to_author_fk1` FOREIGN KEY (`id_author`) REFERENCES `author`(`id`);

ALTER TABLE `cart` ADD CONSTRAINT `cart_fk0` FOREIGN KEY (`id_book`) REFERENCES `book`(`id`);

ALTER TABLE `cart` ADD CONSTRAINT `cart_fk1` FOREIGN KEY (`id_client`) REFERENCES `client`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`id_client`) REFERENCES `client`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`id_status`) REFERENCES `order_status`(`id`);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`id_payment`) REFERENCES `payment`(`id`);

ALTER TABLE `orders_full_info` ADD CONSTRAINT `orders_full_info_fk0` FOREIGN KEY (`id_order`) REFERENCES `orders`(`id`);

ALTER TABLE `orders_full_info` ADD CONSTRAINT `orders_full_info_fk1` FOREIGN KEY (`id_book`) REFERENCES `book`(`id`);

