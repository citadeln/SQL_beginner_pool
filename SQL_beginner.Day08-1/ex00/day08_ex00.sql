-- Provide a proof that your parallel session can’t see your changes until you will make a COMMIT

-- Session #1
-- update of rating for “Pizza Hut” to 5 points in a transaction mode .
-- check that you can see a changes in session #1

BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2
-- check that you can’t see a changes in session #2
BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #1
-- publish your changes for all parallel sessions.
COMMIT;
-- Session #2
-- check that you can see a changes in session #2
COMMIT;
SELECT *, xmin, xmax FROM pizzeria WHERE name = 'Pizza Hut';
