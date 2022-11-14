“Транзакции,переменные, представления”

1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйтетранзакции. (В моей таблице shops поля id и name)

START TRANSACTION;
INSERT INTO sample SELECT NULL, name FROM shop WHERE id=1;
DELETE FROM shop WHERE id=1;
COMMIT;

2. Создайте представление, которое выводит название name товарной позиции из таблицыproducts и соответствующее название каталога name из таблицы catalogs.

CREATE VIEW items_with_category(item, catalog) AS 
SELECT p.name, c.name 
FROM 
catalog AS c 
JOIN 
products AS p 
ON p.catalog_id=c.id;


4. (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайтезапрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежихзаписей.

PREPARE stmt FROM "DELETE FROM posts ORDER BY created_at LIMIT ?";
SET @cnt=(SELECT COUNT(1)-5 FROM posts);
EXECUTE stmt USING @cnt;



“Хранимые процедуры и функции, триггеры"
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрыйвечер", с 00:00 до 6:00 — "Доброй ночи".
DROP PROCEDURE IF EXISTS hello;
CREATE PROCEDURE hello()
BEGIN
SET @time = HOUR(NOW());
CASE
WHEN (@time > 0 AND @time < 6) THEN SELECT 'Good night'; 
WHEN (@time > 6 AND @time < 12) THEN SELECT 'Good morning';
WHEN (@time > 12 AND @time < 18) THEN SELECT 'Good day';
WHEN (@time > 18 AND @time < 24) THEN SELECT 'Good evening';
END CASE;
END//
CALL hello()//
2. В таблице products есть два текстовых поля: name с названием товара и description с егоописанием. Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поляпринимают неопределенное значение NULL неприемлема. Используя триггеры, добейтесьтого, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полямNULL-значение необходимо отменить операцию.
DROP TRIGGER IF EXISTS check_description_name;
CREATE TRIGGER check_description_name BEFORE UPDATE ON products
FOR EACH ROW BEGIN
SELECT CONCAT(NEW.name,NEW.description) INTO @count FROM products LIMIT 1;
IF @count=NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='DELETE canceled';
END IF;
END//

