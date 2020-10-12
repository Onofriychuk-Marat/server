CREATE DATABASE wordpress;
CREATE USER 'utoomey'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO 'utoomey'@'localhost';
FLUSH PRIVILEGES;