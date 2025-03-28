-- Table Reviews {
--   id int [pk, increment]
--   userId int [unique]
--   storeId int [unique]
--   reservationId int [unique]
--   note smallint
--   comment text
--   createdAt timestamp [default: `NOW()`]
-- }

CREATE TABLE Reviews (
	id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT,
    storeId INT,
    reservationId INT,
    note SMALLINT,
    comment TEXT,
    createdAt TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (userId) REFERENCES Users(id),
    FOREIGN KEY (storeId) REFERENCES Stores(id),
    FOREIGN KEY (reservationId) REFERENCES Reservations(id)
    
);