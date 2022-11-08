USE shop;

/* 1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/
-- Заполню orders данными
INSERT INTO orders  (user_id, created_at, updated_at) 
VALUES
(1, NOW(), NOW()),
(5, NOW(), NOW());

SELECT name FROM users u
JOIN orders o ON u.id = o.user_id 
GROUP BY u.id ;

/* 2 Выведите список товаров products и разделов catalogs, который соответствует товару. */

SELECT p.name, c.name FROM products p
JOIN catalogs c ON p.catalog_id = c.id 
GROUP BY p.id;