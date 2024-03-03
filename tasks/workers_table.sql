
DROP TABLE workers

--@block
CREATE TABLE workers(
  id SERIAL PRIMARY KEY,
  birthday DATE NOT NULL,
  name VARCHAR(64),
  salary NUMERIC CONSTRAINT "Salary must be positive" CHECK (salary > 0)
);

--@block
ALTER TABLE workers
ADD COLUMN is_male BOOLEAN,
ADD COLUMN email VARCHAR(64) CONSTRAINT "Email must be unique"  CHECK (email ~ '[A-Za-z0-9]{3,32}@[a-z]{2,8}\.[a-z]{2,8}'),
ADD COLUMN department VARCHAR(64)

--@block
ALTER TABLE workers
ADD UNIQUE (email);

--@block
ALTER TABLE workers
DROP department;

--@block
ALTER TABLE workers
ALTER COLUMN salary
SET DEFAULT 150;

--@block
ALTER TABLE workers
ALTER COLUMN salary
SET NOT NULL;


--@block
ALTER TABLE workers RENAME TO employees;

--@block
INSERT INTO employees
(birthday, name, salary, is_male, email)
VALUES
('1990-09-20', 'Nikita', 300, true, 'nikita@mail.com' );

--@block
INSERT INTO employees
(birthday, name, salary, is_male, email)
VALUES
('1990-12-31', 'Svetlana', 1200, false, 'svetlana@mail.com' );

--@block
INSERT INTO employees
(birthday, name, salary, is_male, email)
VALUES
('1980-12-31', 'Yaroslav', 1200, true, 'yaroslav@mail.com' ),
('1993-12-21', 'Petro', 1200, true, 'petro@mail.com' );


--@block
UPDATE employees SET salary = 1000 WHERE id = 4;

--@block
INSERT INTO employees
(birthday, name, salary, is_male, email)
VALUES
('1999-12-31', 'Dinna', 30000, false, 'dinna@mail.com' ),
('1993-12-21', 'Pirate', 3200, true, 'perate@mail.com' ),
('1993-12-21', 'Slava', 1200, true, 'slava@mail.com' ),
('1993-12-21', 'Kristine', 1200, false, 'kristine@mail.com' ),
('1993-12-21', 'Klara', 800, false, 'klara@mail.com' ),
('1993-12-21', 'Bot1', 100, true, 'bot1@mail.com' ),
('1993-12-21', 'Bot2', 200 , true, 'bot2@mail.com' ),
('1993-12-21', 'Bot3', 300, true, 'bot3@mail.com' ),
('1993-12-21', 'Bot4', 400, true, 'bot4@mail.com' ),
('1993-12-21', 'Bot5', 500, true, 'bot5@mail.com' );


--@block
SELECT * From employees
WHERE id = 3;


--@block
SELECT * From employees
WHERE salary >= 400;

--@block
SELECT * From employees
WHERE salary != 400;

--@block
SELECT * From employees
WHERE name LIKE 'Petro';

--@block
SELECT * From employees
WHERE name <> 'Petro';

--@block
SELECT * From (
  SELECT salary, name, extract(year from AGE (birthday))::int
  FROM employees
) AS new_info
WHERE name = 'Petro';

--@block
SELECT * From (
  SELECT salary, name, extract(year from AGE (birthday))::int
  FROM employees
) AS new_info
WHERE extract = 30 or salary = 1000;

--@block
SELECT * From (
  SELECT salary, name, extract(year from AGE (birthday))::int
  FROM employees
) AS new_info
WHERE extract BETWEEN 32 AND 33 or salary = 1000;


--@block
SELECT * From (
  SELECT salary, name, extract(year from AGE (birthday))::int
  FROM employees
) AS new_info
WHERE extract BETWEEN 32 AND 33 or salary BETWEEN 400 AND 1000;


--@block
SELECT * From (
  SELECT salary, name, extract(year from AGE (birthday))
  FROM employees
) AS new_info
WHERE extract = 30 or salary != 400;

--@block
UPDATE employees 
SET salary = 425
WHERE name = 'Nikita';


--@block
UPDATE employees 
SET birthday = '1975-12-12'
WHERE id = 4;


--@block
UPDATE employees 
SET salary = 888
WHERE id BETWEEN 3 AND 5;

--@block
UPDATE employees 
SET name = 'EVGEN', email = 'evgen@mail.com'
WHERE name = 'Bot1';

--@block
DELETE FROM employees
WHERE id = 2;

--@block
DELETE FROM employees
WHERE name = 'Klara';

--@block
DELETE FROM employees
WHERE salary <= 800 ;