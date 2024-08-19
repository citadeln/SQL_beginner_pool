((SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'female')
EXCEPT
(SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'male'))
UNION
((SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'male')
EXCEPT
(SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_order ON person.id = person_order.person_id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE gender = 'female'))
ORDER BY 1
