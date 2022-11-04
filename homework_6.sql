USE vk;


/* 1 Пусть задан некоторый пользователь. Из всех пользователей соц. сети 
найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений). */
SELECT from_user_id AS id,
(SELECT firstname FROM users WHERE id = from_user_id) AS f_name,
(SELECT lastname  FROM users WHERE id = from_user_id) AS l_name,
COUNT(*) FROM messages
WHERE to_user_id = 24
GROUP BY from_user_id
LIMIT 1;



/* 2 Подсчитать общее количество лайков, которые получили пользователи младше 10 лет. */
SELECT COUNT(*) FROM likes
INNER JOIN profiles ON profiles.user_id = likes.user_id 
WHERE YEAR(NOW()) - YEAR(profiles.birthday) <= 10;


/* 3 Определить кто больше поставил лайков (всего): мужчины или женщины. */
SELECT COUNT(*) AS amount, p.gender  FROM likes l
INNER JOIN profiles p ON p.user_id = l.user_id 
GROUP BY p.gender
ORDER BY amount DESC
LIMIT 1;


