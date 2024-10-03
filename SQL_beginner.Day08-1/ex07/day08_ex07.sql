-- Please write any SQL statement with any isolation level (you can use default setting) on the pizzeria table to reproduce this deadlock situation.

BEGIN;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session #1
UPDATE pizzeria SET rating = 4.0 WHERE id = 1;

-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE id = 2;

-- Session #1
UPDATE pizzeria SET rating = 4.0 WHERE id = 2;

-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;

-- Session #1
COMMIT;

-- Session #2
COMMIT;

-- SELECT *, xmin, xmax FROM pizzeria;
