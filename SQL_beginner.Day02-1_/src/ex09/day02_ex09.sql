WITH zapros AS
    (SELECT *
    FROM person p
           JOIN person_order po ON po.person_id = p.id
           JOIN menu ON po.menu_id = menu.id
    WHERE p.gender = 'female')
SELECT z1.name
FROM zapros z1
WHERE z1.pizza_name = 'pepperoni pizza'
INTERSECT
SELECT z2.name
FROM zapros z2
WHERE z2.pizza_name = 'cheese pizza'
ORDER BY name