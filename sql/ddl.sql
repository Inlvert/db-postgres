CREATE TABLE users(
  -- id UUID NOT NULL UNIQUE DEFAULT gen_random_uuid() PRIMARY KEY,
  id SERIAL PRIMARY KEY,
  email VARCHAR(128) NOT NULL CONSTRAINT "Email must be unique" UNIQUE CHECK(email ~ '[A-Za-z]{3,32}@[a-z]{2,8}\.[a-z]{2,8}'),
  first_name VARCHAR(64) NOT NULL CHECK(first_name != ''),
  last_name VARCHAR(64) NOT NULL,
  birthday DATE CHECK(birthday BETWEEN '1950-01-01' AND current_date),
  is_male BOOLEAN,
  current_balance NUMERIC(10, 2) NOT NULL CONSTRAINT "balens must be +" CHECK(current_balance >= 0) -- CONSTRAINT "Email must be unique" UNIQUE (email)
);
-- @block 
CREATE TABLE users3(
  email text,
  firstName text,
  lastName text
) 
-- @block delete table
DROP TABLE users;
-- @block
ALTER TABLE users
ADD COLUMN weight DECIMAL;
ALTER TABLE users DROP COLUMN weight;
