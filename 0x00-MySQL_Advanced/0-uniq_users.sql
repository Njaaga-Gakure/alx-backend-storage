-- create a users table

-- creates the table if it doesn't exist 
CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255)
);
