SELECT p.name
    FROM person p
           JOIN person_order po ON po.person_id = p.id
           JOIN menu ON po.menu_id = menu.id
WHERE p.address in ('Moscow', 'Samara')
    AND menu.pizza_name in ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC
