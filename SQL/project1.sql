1. Create a table named friends with three columns:
  id that stores INTEGER
  name that stores TEXT
  birthday that stores DATE

-- CREATE
CREATE TABLE friends(
  id INTEGER,
  name TEXT,
  birthday DATE
);

2. Beneath your current code, add Ororo Munroe to friends.
Her birthday is May 30th, 1940.

-- INSERT INTO friends()VALUES()
INSERT INTO friends(id, name, birthday)
VALUES(1, 'Ororo', '1940-05-30');

3. Add two more friends to the table

INSERT INTO friends(id, name, birthday)
VALUES(2, 'Jack', '1990-02-12');

INSERT INTO friends(id, name, birthday)
VALUES(3, 'Joel', '2000-09-11');

4. Add a new column 'email'

-- ALTER TABLE friends
ALTER TABLE friends
ADD COLUMN email;

5. Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”.

-- UPDATE friends SET column_name = '' WHERE id = 
UPDATE friends
SET name = 'Storm'
WHERE id = 1;

6. Update email addresses for everyone

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'jack@yahoo.com'
WHERE id = 2;

UPDATE friends
SET email = 'joel.now@re.ke'
WHERE id = 3;

7. Remove friend 1 from the table.

-- DELETE FROM friends WHERE column_name = ''
DELETE FROM friends
WHERE id = 1;

8. Confirm the table

SELECT * FROM friends;
