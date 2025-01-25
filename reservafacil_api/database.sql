CREATE TABLE `StoreCategories` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `description` VARCHAR(255)
);

CREATE TABLE `Managers` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `email` VARCHAR(150),
  `phone` VARCHAR(15)
);

CREATE TABLE `ReservationStatus` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50)
);

CREATE TABLE `MenuCategories` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100)
);

CREATE TABLE `NotificationTypes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100)
);

CREATE TABLE `ClientType` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(50)
);

CREATE TABLE `Users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `email` VARCHAR(150) UNIQUE,
  `password` VARCHAR(255),
  `phone` VARCHAR(15),
  `birthDate` DATE,
  `cpfCnpj` VARCHAR(14) UNIQUE,
  `storeId` INT,
  `active` BOOLEAN,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `UserAddresses` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `userId` INT,
  `cep` VARCHAR(9),
  `state` CHAR(2),
  `city` VARCHAR(100),
  `neighborhood` VARCHAR(100),
  `addressLine` VARCHAR(100),
  `latitude` DECIMAL(10,8),
  `longitude` DECIMAL(11,8),
  FOREIGN KEY (`userId`) REFERENCES `Users`(`id`)
);

CREATE TABLE `StoreResponsible` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `cpf` VARCHAR(11),
  `email` VARCHAR(150),
  `phone` VARCHAR(15),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Store` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `description` TEXT,
  `active` BOOLEAN,
  `logoUrl` VARCHAR(255),
  `phone` VARCHAR(15),
  `reservationCapacity` INT,
  `categoryId` INT,
  `responsibleId` INT,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`categoryId`) REFERENCES `StoreCategories`(`id`),
  FOREIGN KEY (`responsibleId`) REFERENCES `StoreResponsible`(`id`)
);

CREATE TABLE `OpeningTimes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `storeId` INT,
  `weekDay` SMALLINT,
  `openingTime` TIME,
  `closeTime` TIME,
  `active` BOOLEAN,
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`)
);

CREATE TABLE `StoreManagers` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `storeId` INT,
  `managerId` INT,
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`),
  FOREIGN KEY (`managerId`) REFERENCES `Managers`(`id`)
);

CREATE TABLE `Localization` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `storeId` INT,
  `cep` VARCHAR(9),
  `state` CHAR(2),
  `city` VARCHAR(100),
  `neighborhood` VARCHAR(100),
  `complement` VARCHAR(100),
  `latitude` DECIMAL(10,8),
  `longitude` DECIMAL(11,8),
  `mapUrl` VARCHAR(255),
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`)
);

CREATE TABLE `Reservation` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `userId` INT,
  `storeId` INT,
  `reservationDate` TIMESTAMP,
  `statusId` INT,
  `enterDate` TIMESTAMP,
  `exitDate` TIMESTAMP,
  `observation` VARCHAR(255),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `totalValue` DECIMAL(10,2),
  `paidValue` DECIMAL(10,2),
  FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`),
  FOREIGN KEY (`statusId`) REFERENCES `ReservationStatus`(`id`)
);

CREATE TABLE `Menu` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `storeId` INT,
  `name` VARCHAR(100),
  `description` TEXT,
  `price` DECIMAL(10,2),
  `categoryId` INT,
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`),
  FOREIGN KEY (`categoryId`) REFERENCES `MenuCategories`(`id`)
);

CREATE TABLE `Reviews` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `userId` INT,
  `storeId` INT,
  `note` SMALLINT,
  `comment` TEXT,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`userId`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`)
);

CREATE TABLE `Notifications` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `reservationId` INT,
  `typeId` INT,
  `sent` BOOLEAN,
  `sendDate` TIMESTAMP,
  `sentAt` TIMESTAMP,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`reservationId`) REFERENCES `Reservation`(`id`),
  FOREIGN KEY (`typeId`) REFERENCES `NotificationTypes`(`id`)
);

CREATE TABLE `ActiveSessions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `clientId` INT,
  `clientTypeId` INT,
  `sessionToken` VARCHAR(255),
  `ipAddress` VARCHAR(45),
  `userAgent` VARCHAR(255),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastActivity` TIMESTAMP,
  `expired` BOOLEAN,
  FOREIGN KEY (`clientTypeId`) REFERENCES `ClientType`(`id`)
);

CREATE TABLE `Roles` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `description` VARCHAR(255),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Permissions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100),
  `description` VARCHAR(255)
);

CREATE TABLE `RolePermissions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `roleId` INT,
  `permissionId` INT,
  FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`),
  FOREIGN KEY (`permissionId`) REFERENCES `Permissions`(`id`)
);

CREATE TABLE `Employees` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `storeId` INT,
  `name` VARCHAR(100),
  `email` VARCHAR(150) UNIQUE,
  `phone` VARCHAR(15),
  `roleId` INT,
  `active` BOOLEAN,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`storeId`) REFERENCES `Store`(`id`),
  FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`)
);

CREATE TABLE `EmployeePermissions` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `employeeId` INT,
  `roleId` INT,
  `assignedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`employeeId`) REFERENCES `Employees`(`id`),
  FOREIGN KEY (`roleId`) REFERENCES `Roles`(`id`)
);

CREATE TABLE `Config` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `configName` VARCHAR(255),
  `configValue` VARCHAR(255),
  `description` TEXT
);
