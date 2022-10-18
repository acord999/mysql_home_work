USE vk;

DROP TABLE IF EXISTS publications;
CREATE TABLE publications (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
owner_id BIGINT UNSIGNED NOT NULL COMMENT 'user id of owner',
published_at DATETIME DEFAULT NOW(),
body VARCHAR(150),
attachments_id BIGINT UNSIGNED,
who_liked BIGINT UNSIGNED,
INDEX body_idx(body),
FOREIGN KEY (owner_id) REFERENCES users(id),
FOREIGN KEY (attachments_id) REFERENCES media(id),
FOREIGN KEY (who_liked) REFERENCES likes(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
commentator_id BIGINT UNSIGNED NOT NULL,
body VARCHAR(150),
attachments_id BIGINT UNSIGNED,
INDEX body_idx(body),
FOREIGN KEY (commentator_id) REFERENCES users(id),
FOREIGN KEY (attachments_id) REFERENCES media(id)
);


DROP TABLE IF EXISTS ads;
CREATE TABLE ads (
id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_company VARCHAR(70) NOT NULL,
title VARCHAR(15) NOT NULL,
body VARCHAR (150),
INDEX body_idx(body),
attachments_id BIGINT UNSIGNED,
FOREIGN KEY (attachments_id) REFERENCES media(id)
)
