CREATE MATERIALIZED VIEW IF NOT EXISTS mv_dmitriy_visits_and_eats AS
(SELECT pizzeria.name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
WHERE pv.visit_date = '2022-01-08' AND p.name = 'Dmitriy')
INTERSECT
(SELECT pizzeria.name
FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
WHERE m.price < 800);

-- SELECT *
-- FROM mv_dmitriy_visits_and_eats