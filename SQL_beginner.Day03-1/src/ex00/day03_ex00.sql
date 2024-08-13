SELECT  pizza_name,
        price,
        pizzeria.name AS pizzeria_name,
        visit_date
FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE   person.name = 'Kate' 
        AND price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;
        