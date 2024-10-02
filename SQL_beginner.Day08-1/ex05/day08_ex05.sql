-- Let’s check one of the famous “Phantom Reads” database pattern but under READ COMMITTED isolation level. 
-- Please summarize all ratings for all pizzerias in a transaction mode for session #1 and after that make UPDATE of rating to 1 value for “Pizza Hut” restaurant in session #2 (in the same order as in the picture).

BEGIN;
SHOW TRANSACTION ISOLATION LEVEL;

-- Session #1
SELECT SUM(rating) AS sum_of_all_ratings FROM pizzeria;

-- Session #2
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut'; 
COMMIT;

-- Session #1
SELECT SUM(rating) AS sum_of_all_ratings FROM pizzeria;
COMMIT;
SELECT SUM(rating) AS sum_of_all_ratings FROM pizzeria;

-- Session #2
SELECT SUM(rating) AS sum_of_all_ratings FROM pizzeria;