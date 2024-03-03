CREATE TABLE users2(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(64) NOT NULL,
  last_name VARCHAR(64) NOT NULL,
  email VARCHAR(64) NOT NULL UNIQUE,
  birthday DATE CHECK(birthday BETWEEN '1950-01-01' AND current_date),
  is_male BOOLEAN DEFAULT true,
  height NUMERIC CHECK(height BETWEEN 0.3 AND 3) DEFAULT 1.65,
  weight_user NUMERIC,
  CONSTRAINT "first + last name must be unique" UNIQUE (first_name, last_name)
);


--@block delete DB users2
DROP TABLE users2;


--@block
INSERT INTO users2(
  first_name, last_name, email, birthday, is_male, height, weight_user
) VALUES
('Jon', 'Dou', 'czfgxhb@gmail.com', '1950-01-12',false, DEFAULT, 50),
('Emma', 'Weens', 'olivrtb@gmail.com', '1998-02-02',DEFAULT, 2.9, 50);

--@block
DELETE FROM users2 WHERE id = 2 AND 3;


-- @block delete data in table
-- удаление всех записей в таблице
DELETE FROM users2 RETURNING *;

--@block
UPDATE users2 SET first_name = 'Lusya' WHERE id = 7;

--@block
UPDATE users2 SET weight_user = 120 WHERE is_male = true;

--@block
ALTER TABLE users2
ALTER COLUMN weight_user
DROP DEFAULT;

--@block
ALTER TABLE users2
ALTER COLUMN weight_user
SET DEFAULT NOT NULL;

--@block
ALTER TABLE users2
ALTER COLUMN weight_user
TYPE text;

--@block
UPDATE users2 SET weight_user = weight_user * 1.20 WHERE is_male;


--@block
ALTER TABLE users2
ALTER COLUMN  birthday
TYPE money;


--@block
SELECT * FROM users2;


--@block
SELECT first_name AS "NAME" FROM users2


--@block
SELECT * FROM users2
WHERE NAME;