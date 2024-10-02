-- Let’s check one of the famous “Non-Repeatable Reads” database pattern but under READ COMMITTED isolation level. 
-- Please check a rating for “Pizza Hut” in a transaction mode for session #1 and after that make UPDATE of rating to 3.6 value in session #2 (in the same order as in the picture).

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

-- Session #1
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; 
COMMIT;

-- Session #1
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';