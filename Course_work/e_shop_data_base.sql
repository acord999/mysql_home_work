-- скрипты создания структуры БД

DROP DATABASE IF EXISTS e_shop;
CREATE DATABASE e_shop;
USE e_shop;

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
 	password_hash VARCHAR(100), 	
	phone BIGINT UNSIGNED UNIQUE, 
    INDEX users_firstname_lastname_idx(firstname, lastname)
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(70) UNIQUE,
	description VARCHAR(200)
);

DROP TABLE IF EXISTS images;
CREATE TABLE images (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`path` VARCHAR(50)
);

DROP TABLE IF EXISTS manufacturers;
CREATE TABLE manufacturers (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(20),
	country VARCHAR(20),
	logo_id BIGINT UNSIGNED,
	FOREIGN KEY (logo_id) REFERENCES images(id)
	
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(70),
	description VARCHAR(200),
	category_id BIGINT UNSIGNED,
	manufacturer_id BIGINT UNSIGNED,
	image_id BIGINT UNSIGNED,
	available_to_ord INT UNSIGNED,
	FOREIGN KEY (category_id) REFERENCES categories(id),
	FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id),
	FOREIGN KEY (image_id) REFERENCES images(id)
	
);

DROP TABLE IF EXISTS pickup_points;
CREATE TABLE pickup_points (
id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50),
address VARCHAR(90),
working_hours VARCHAR(100)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_id BIGINT UNSIGNED NOT NULL,
	client_id BIGINT UNSIGNED NOT NULL,
	order_date DATETIME DEFAULT NOW(),
	pickup_point_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (client_id) REFERENCES clients(id),
	FOREIGN KEY (pickup_point_id) REFERENCES pickup_points(id)
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	product_id BIGINT UNSIGNED NOT NULL,
	author_id BIGINT UNSIGNED NOT NULL,
	body varchar(250),
	order_id BIGINT UNSIGNED,
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (author_id) REFERENCES clients(id),
	FOREIGN KEY (order_id) REFERENCES orders(id)
);

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	discount DECIMAL UNSIGNED NOT NULL,
	product_id BIGINT UNSIGNED NOT NULL,
	start_date DATETIME,
	end_date DATETIME,
	FOREIGN KEY (product_id) REFERENCES products(id)
);

DROP TABLE IF EXISTS staff;
CREATE TABLE staff (
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE,
	phone BIGINT UNSIGNED UNIQUE, 
    pickup_point_id BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (pickup_point_id) REFERENCES pickup_points(id)
);



-- скрипты наполнения БД данными
INSERT INTO clients (id, firstname, lastname, email, password_hash, phone)
VALUES (1, 'Efrem', 'Pavlov', 'contact@efrempavlov.ru', 'vjkdfhjkghfdjkhgkjdghfjkdhgjkh433', 123456789),
(2, 'Ivan', 'Pavlov', 'ffjdww54@djkdgdjkj.vom', 'fgjdfghjkdfhgjhdjkdeewwwww5', 753567329),
(3, 'Elena', 'Pavlova', 'ejelcsn@fjfj.com', 'kgjhglkdfjgkljd7k', 8996950400),
(4, 'Tim', 'Pavlov', 'gkgfkgfgkd@gjg.ru', 'ewwetydxxvgjjj78', 87059403987),
(5, 'Maxim', 'Petrov', 'fgxkslalx@fk5.tu', 'rtehrfduffihojgfjsd6', 79805386837);

INSERT INTO pickup_points (title, working_hours, address)
VALUES ('Пункт выдачи Ростов, ул. Карла Либкнехта', 'Ежедневно с 09:00 до 20:00', 'Ярославская область, Ростов, ул Карла Либкнехта, 5, 1 этаж'),
('Пункт выдачи Ярославль, пр-кт Ленинградский', 'Ежедневно с 10:00 до 21:00', 'Ярославская область, Ярославль, пр-кт Ленинградский, 64, 1 этаж'),
('Пункт выдачи Углич, ул. Ярославская', 'Ежедневно с 10:00 до 21:00', 'Ярославская область, Углич, ул Ярославская, 50, 1 этаж');

INSERT INTO staff (id, firstname, lastname, email, phone, pickup_point_id)
VALUES (1, 'Ivan', 'Ivanov', 'contact@efv.ru', 123456789, 1),
(2, 'Petr', 'Petrov', 'dww54@djkdgdjkj.vom', 753567329, 2),
(3, 'Elena', 'Pavlova', 'ejsn@fjj.com', 8996950400, 3),
(4, 'Alisa', 'Pavlova', 'gkggfgkd@gjg.ru', 87059403987, 1),
(5, 'Maxim', 'Maximov', 'fgxksla@fk5.tu', 79805386837, 2);


INSERT INTO categories (title, description)
VALUES ('Материнские платы', 'Одним из самых важных компонентов компьютера, безусловно, можно назвать материнскую плату, которая выступает в роли связующего звена между всеми комплектующими ПК.'),
('Корпусы', 'физически представляет собой базовую несущую конструкцию (шасси), которая предназначена для последующего наполнения аппаратным обеспечением с целью создания компьютера.' ),
('Процессоры', 'это устройство, обрабатывающее программные инструкции.'),
('Видеокарты', 'Видеокарта - важный компонент компьютера/ноутбука, отвечающий за обработку и подготовку графики к отображению на экране.'),
('Блоки питания', 'это электронное устройство, формирующее напряжение, необходимое определенному компоненту ПК'),
('Оперативная паиять', 'это энергозависимая память, в которой хранятся исполняемые файлы программ или данные, необходимые компьютеру для работы в данный момент');

INSERT INTO images (`path`)
VALUES ('1.jpg'), ('2.jpg'), ('3.jpg'), ('4.jpg'), ('5.jpg'), ('6.jpg'), ('7.jpg'), ('8.jpg'), ('9.jpg'), ('10.jpg');

INSERT INTO manufacturers (title, country, logo_id)
VALUES ('ASUS', 'Китай', 1), ('AMD', 'США', 2), ('Crucial', 'США', 3), ('AeroCool', 'Китай', 4);

INSERT INTO products (title, description, category_id, manufacturer_id, image_id)
VALUES ('ASUS TUF Gaming B550M-Plus', 'Soc-AM4 AMD B550 4xDDR4 mATX AC`97 8ch(7.1) 2.5Gg RAID+HDMI+DP Ret', 1, 1, 5),
('AMD Ryzen 5 5600X OEM', 'Процессор AMD Ryzen 5 5600X OEM представляет собой производительное решение для игровых систем', 3, 2, 6),
('ASUS Dual GeForce RTX 3060 V2 OC Edition ', 'Видеокарта ASUS Dual GeForce RTX 3060 предлагает всю мощь новейшей графической микроархитектуры NVIDIA Ampere, ', 4, 1, 7);

INSERT INTO orders (product_id, client_id, pickup_point_id)
VALUES (1, 2, 1), (2, 4, 2), (3, 1, 3), (1, 3, 1);

INSERT INTO reviews (product_id, author_id, order_id, body)
VALUES (1, 2, 1, 'Лучшая материнка'), (3, 1, 3, 'Ножки были погнуты');

-- скрипты характерных выборок 

-- Детальная информация по заказу
SELECT orders.id, clients.firstname , clients.lastname, orders.product_id, orders.order_date, orders.pickup_point_id
FROM orders
JOIN clients ON orders.client_id=clients.id;

-- Количество продаж
SELECT orders.product_id, products.title, COUNT(*) AS val
FROM orders
JOIN products ON orders.product_id = products.id
GROUP BY orders.product_id 
ORDER BY val DESC;

-- тестовые данные для следующей выборки
INSERT INTO orders (product_id, client_id, pickup_point_id)
VALUES (1, 1, 3); 
-- Самый новый заказ
SELECT id 
FROM orders
WHERE order_date = (SELECT MAX(order_date) FROM orders);


-- Представления


-- Отзывы с описанием
CREATE VIEW reviews_for_product AS
SELECT products.id , products.title, reviews.body
FROM reviews
JOIN products ON reviews.product_id=products.id; 

-- Распределение работников по точкам выдачи
CREATE VIEW staff_on_points AS
SELECT staff.firstname, staff.lastname, pickup_points.title AS Title_of_point
FROM staff
JOIN pickup_points ON  staff.pickup_point_id = pickup_points.id; 



-- Процедура заполнения таблички products
DELIMITER //

DROP PROCEDURE IF EXISTS insert_to_products//
CREATE PROCEDURE insert_to_products (IN title VARCHAR(70), IN category_id BIGINT, IN manufacturer_id BIGINT, IN available_to_ord BIGINT)
BEGIN
  INSERT INTO products(title, category_id, manufacturer_id, available_to_ord)
  VALUES(title, category_id, manufacturer_id, available_to_ord);
END//

SELECT * FROM products//

CALL insert_to_products('CRUCIAL BALLISTX 8 GB', 6, 1, 200)//

SELECT * FROM products//

DELIMITER ;












