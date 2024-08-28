INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date) 
VALUES ((SELECT MAX(id) FROM person_visits) + 1, 
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT m.pizzeria_id
            FROM menu m
            JOIN pizzeria pz ON m.pizzeria_id = pz.id
            WHERE m.price < 800 AND pz.name != 'Papa Johns'
            LIMIT 1), 
        '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats

SELECT *
FROM mv_dmitriy_visits_and_eats