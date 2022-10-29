USE vk;

-- Задание 1
-- добвляю в таблицу users необходимые столбцы
ALTER TABLE users ADD created_at DATETIME;
ALTER TABLE users ADD updated_at DATETIME;

UPDATE users 
set 
created_at = NOW()
WHERE created_at IS NULL;

UPDATE users 
set 
updated_at = NOW()
WHERE updated_at  IS NULL;

-- Задание 2

-- Добавлю заведомо не корректные данные в таблицу
ALTER TABLE users DROP created_at, DROP updated_at;
ALTER TABLE users ADD created_at VARCHAR(255);
ALTER TABLE users ADD updated_at VARCHAR(255);

INSERT INTO users (firstname, lastname, email, created_at, updated_at)
VALUES ('Test', 'Testov', 'gb2@mail.ru', '20.10.2013 8:10', '20.10.2020 8:10'),
('Vernite', 'Vebinary', 'dislike!@mail.ru', '20.10.2019 13:10', '20.10.2022 8:10');

UPDATE users
set
	created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%i'),
		updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%i');
	
ALTER TABLE users 
	CHANGE created_at created_at DATETIME DEFAULT NOW();
	
ALTER TABLE users 
	CHANGE updated_at updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();
SELECT * FROM users

-- Задание 3

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
    storehouse_id int unsigned,
    product_id int unsigned,
    value int unsigned comment 'Запас товарной позиции на складе',
    created_at DATETIME default current_timestamp COMMENT 'Дата регистрации',
    updated_at DATETIME default current_timestamp ON UPDATE current_timestamp COMMENT 'Дата последнего обновления записи'
) COMMENT = 'Склады и продукты';

INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
  (1, 1, 0),
    (1, 2, 4),
    (1, 3, 0),
    (2, 4, 7),
    (2, 5, 56),
    (1, 6, 0),
    (1, 7, 4);
 
SELECT * FROM storehouses_products ORDER BY IF(value > 0, 0, 1), value;

SELECT * FROM users

-- Задание 1
ALTER TABLE users ADD birthday DATE;
INSERT INTO users (firstname, birthday) VALUES ('Testo', "2001-01-10"), ('Testo3', "2005-03-04");
SELECT
      avg(
         (YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d')) 
          )
 FROM users

 
 -- Задание 2

SELECT
    DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday, 6, 10))) AS week_day_of_birthday_in_this_Year,
    COUNT(*) AS amount_of_birthday
FROM
    users
GROUP BY 
    week_day_of_birthday_in_this_Year
ORDER BY
	amount_of_birthday DESC;


