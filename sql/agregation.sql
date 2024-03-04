
SELECT min (height) AS "Min height in table"
FROM users;

--@block
SELECT max (height) AS "Max height in table"
FROM users;

--@block
SELECT avg (height) AS "Average height in table"
FROM users;

--@block
SELECT count (height) FROM users
WHERE is_male = false;