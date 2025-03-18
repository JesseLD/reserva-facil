CREATE TABLE `AppVersion` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `platform` ENUM ('android', 'ios', 'web', 'all'),
  `target` ENUM ('all', 'partner', 'app'),
  `track` ENUM ('dev', 'production', 'test'),
  `version` VARCHAR(10),
  `buildNumber` INT,
  `isMandatory` TINYINT(1) DEFAULT 0,
  `releaseNotes` TEXT,
  `internalReleaseNotes` TEXT,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Config` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `configName` VARCHAR(255),
  `configValue` VARCHAR(255),
  `description` TEXT
);

CREATE TABLE `States` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `uf` VARCHAR(255),
  `name` VARCHAR(255)
);

CREATE TABLE `NotificationTypes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100)
);

CREATE TABLE `StoreCategories` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `description` VARCHAR(255)
);

CREATE TABLE `Permissions` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `key` VARCHAR(100),
  `name` VARCHAR(100),
  `description` VARCHAR(255)
);

CREATE TABLE `Roles` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `key` VARCHAR(100),
  `description` VARCHAR(255),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Role_Permissions` (
  `roleId` INT,
  `permissionId` INT,
  PRIMARY KEY (`roleId`, `permissionId`),
  FOREIGN KEY (`roleId`) REFERENCES `Roles` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`permissionId`) REFERENCES `Permissions` (`id`) ON DELETE CASCADE
);

CREATE TABLE `Users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `email` VARCHAR(150) UNIQUE,
  `password` VARCHAR(255),
  `phone` VARCHAR(15),
  `birthDate` DATE,
  `cpfCnpj` VARCHAR(14) UNIQUE,
  `imageUrl` VARCHAR(300),
  `active` TINYINT(1) DEFAULT 1,
  `verified` TINYINT DEFAULT 0,
  `verifiedAt` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Store` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100),
  `email` VARCHAR(255) UNIQUE,
  `password` VARCHAR(255),
  `description` TEXT,
  `cpfCnpj` VARCHAR(255) UNIQUE,
  `active` TINYINT(1) DEFAULT 1,
  `visibility` ENUM ('full', 'limited') DEFAULT 'full',
  `logoUrl` VARCHAR(255),
  `phone` VARCHAR(20),
  `reservationCapacity` INT,
  `maxPartySize` INT,
  `categoryId` INT,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`categoryId`) REFERENCES `StoreCategories` (`id`) ON DELETE SET NULL
);

CREATE TABLE `OpeningTimes` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `storeId` INT,
  `weekDay` SMALLINT,
  `openingTime` TIME,
  `closeTime` TIME,
  `active` TINYINT(1),
  FOREIGN KEY (`storeId`) REFERENCES `Store` (`id`) ON DELETE CASCADE
);

CREATE TABLE `Employees` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `storeId` INT,
  `name` VARCHAR(100),
  `email` VARCHAR(150),
  `phone` VARCHAR(15),
  `roleId` INT,
  `active` TINYINT(1),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`storeId`) REFERENCES `Store` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`roleId`) REFERENCES `Roles` (`id`) ON DELETE SET NULL
);

CREATE TABLE `StoreLocalization` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `storeId` INT,
  `cep` VARCHAR(9),
  `stateId` INT,
  `city` VARCHAR(100),
  `address` VARCHAR(100),
  `latitude` DECIMAL(10,8),
  `longitude` DECIMAL(11,8),
  `mapUrl` VARCHAR(255),
  FOREIGN KEY (`storeId`) REFERENCES `Store` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`stateId`) REFERENCES `States` (`id`) ON DELETE CASCADE
);

CREATE TABLE `UserAddresses` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `userId` INT,
  `cep` VARCHAR(9),
  `stateId` INT,
  `city` VARCHAR(100),
  `address` VARCHAR(255),
  `latitude` DECIMAL(10,8),
  `longitude` DECIMAL(11,8),
  FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`stateId`) REFERENCES `States` (`id`) ON DELETE CASCADE
);

CREATE TABLE `Reservation` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `userId` INT,
  `storeId` INT,
  `reservationDate` TIMESTAMP,
  `status` ENUM ('pending', 'confirmed', 'finished', 'cancelledByStore', 'cancelledByUser', 'cancelledBySystem', 'attended', 'notAttended'),
  `enterDate` TIMESTAMP,
  `exitDate` TIMESTAMP,
  `observation` VARCHAR(255),
  `partySize` INT,
  `totalValue` DECIMAL(10,2),
  `paidValue` DECIMAL(10,2),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`userId`) REFERENCES `Users` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`storeId`) REFERENCES `Store` (`id`) ON DELETE CASCADE
);

CREATE TABLE `Notifications` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `reservationId` INT,
  `typeId` INT,
  `sent` TINYINT(1),
  `sendDate` TIMESTAMP,
  `sentAt` TIMESTAMP,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`typeId`) REFERENCES `NotificationTypes` (`id`) ON DELETE SET NULL
);
