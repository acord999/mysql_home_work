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


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	product_id BIGINT UNSIGNED NOT NULL,
	client_id BIGINT UNSIGNED NOT NULL,
	order_date DATETIME DEFAULT NOW(),
	FOREIGN KEY (product_id) REFERENCES products(id),
	FOREIGN KEY (client_id) REFERENCES clients(id)
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

INSERT INTO clients (id, firstname, lastname, email, password_hash, phone)
VALUES (1, 'Efrem', 'Pavlov', 'contact@efrempavlov.ru', 'vjkdfhjkghfdjkhgkjdghfjkdhgjkh433', 123456789),
(2, 'Ivan', 'Pavlov', 'ffjdww54@djkdgdjkj.vom', 'fgjdfghjkdfhgjhdjkdeewwwww5', 753567329),
(3, 'Elena', 'Pavlova', 'ejelcsn@fjfj.com', 'kgjhglkdfjgkljd7k', 8996950400),
(4, 'Tim', 'Pavlov', 'gkgfkgfgkd@gjg.ru', 'ewwetydxxvgjjj78', 87059403987),
(5, 'Maxim', 'Petrov', 'fgxkslalx@fk5.tu', 'rtehrfduffihojgfjsd6', 79805386837);

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

INSERT INTO orders (product_id, client_id)
VALUES (1, 2), (2, 4), (3, 1);

INSERT INTO reviews (product_id, author_id, order_id, body)
VALUES (1, 2, 1, 'Лучшая материнка'), (3, 1, 3, 'Ножки были погнуты')