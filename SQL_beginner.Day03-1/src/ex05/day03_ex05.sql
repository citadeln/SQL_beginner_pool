(SELECT pizzeria.name AS pizzeria_name
FROM person p
INNER JOIN person_visits ON p.id = person_visits.person_id
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE p.name = 'Andrey')
EXCEPT
(SELECT pizzeria.name AS pizzeria_name
FROM person p
INNER JOIN person_order ON p.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE p.name = 'Andrey')
ORDER BY 1
