DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(325) NOT NULL UNIQUE,
  `password` varchar(256) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL UNIQUE,
  `name` varchar(100) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`account_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mattresses`;
CREATE TABLE `mattresses` (
  `mattress_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL UNIQUE,
  `name` varchar(100) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`mattress_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pockets`;
CREATE TABLE `pockets` (
  `pocket_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`pocket_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `goals`;
CREATE TABLE `goals` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `balance` decimal(15,2) NOT NULL DEFAULT 0.00,
  `target` decimal(15,2) NOT NULL,
  `ending_date` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`goal_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE `account_transactions` (
  `account_transaction_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `type` enum('deposit','withdrawal') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`account_transaction_id`),
  FOREIGN KEY (`account_id`) REFERENCES `accounts`(`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `mattress_transactions`;
CREATE TABLE `mattress_transactions` (
  `mattress_transaction_id` int NOT NULL AUTO_INCREMENT,
  `mattress_id` int NOT NULL,
  `type` enum('deposit','withdrawal') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`mattress_transaction_id`),
  FOREIGN KEY (`mattress_id`) REFERENCES `mattresses`(`mattress_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pocket_transactions`;
CREATE TABLE `pocket_transactions` (
  `pocket_transaction_id` int NOT NULL AUTO_INCREMENT,
  `pocket_id` int NOT NULL,
  `type` enum('deposit','withdrawal') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`pocket_transaction_id`),
  FOREIGN KEY (`pocket_id`) REFERENCES `pockets`(`pocket_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `goal_transactions`;
CREATE TABLE `goal_transactions` (
  `goal_transaction_id` int NOT NULL AUTO_INCREMENT,
  `goal_id` int NOT NULL,
  `type` enum('deposit','withdrawal') NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`goal_transaction_id`),
  FOREIGN KEY (`goal_id`) REFERENCES `goals`(`goal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `account_account_transfers`;
CREATE TABLE `account_account_transfers` (
  `account_account_transfer_id` int NOT NULL AUTO_INCREMENT,
  `source_account_id` int NOT NULL,
  `destination_account_id` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`account_account_transfer_id`),
  FOREIGN KEY (`source_account_id`) REFERENCES `accounts`(`account_id`) ON DELETE CASCADE,
  FOREIGN KEY (`destination_account_id`) REFERENCES `accounts`(`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `pocket_account_transfers`;
CREATE TABLE `pocket_account_transfers` (
  `pocket_account_transfer_id` int NOT NULL AUTO_INCREMENT,
  `pocket_id` int NOT NULL,
  `account_id` int NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT NOW(),
  `description` varchar(255),
  `created_at` timestamp NOT NULL DEFAULT NOW(),
  `updated_at` timestamp NOT NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`pocket_account_transfer_id`),
  FOREIGN KEY (`pocket_id`) REFERENCES `pockets`(`pocket_id`) ON DELETE CASCADE,
  FOREIGN KEY (`account_id`) REFERENCES `accounts`(`account_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
