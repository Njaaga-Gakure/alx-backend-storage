-- creating a table

-- Add an enum when creating the table
-- Default value of the enum is its first value
CREATE TABLE IF NOT EXISTS users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(255) NOT NULL UNIQUE,
	name VARCHAR(255),
	country ENUM("US", "CO", "TN") DEFAULT "US" NOT NULL
);
