SELECT DISTINCT name
FROM pizzeria
WHERE id NOT IN (SELECT pizzeria_id FROM person_visits);

SELECT DISTINCT name
FROM pizzeria
WHERE !EXISTS (SELECT pizzeria_id FROM person_visits);
