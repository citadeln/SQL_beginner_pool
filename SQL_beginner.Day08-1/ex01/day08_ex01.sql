-- Please check a rating for “Pizza Hut” in a transaction mode for both Sessions and after that make UPDATE of rating to 4 value in session #1 and make UPDATE of rating to 3.6 value in session #2 (in the same order as in the picture).

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; -- не выполняется, ждет комита в первой сессии

-- Session #1
COMMIT;

-- Session #2
COMMIT;

-- Session #1
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';