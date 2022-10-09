CREATE DATABASE example;

USE example;

CREATE TABLE users (
  id INT,
  name CHAR);

mysqldump -u root -p example > sample.sql
mysql -u root -p sample < sample.sql  
mysql -u root -p
SHOW DATABASES;


mysqldump -u root -p --opt --where="1 limit 100" mysql help_keyword > 100_rows_help.sql