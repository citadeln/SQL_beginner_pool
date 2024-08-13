SELECT  pizza_name,
        price,
        pizzeria.name AS pizzeria_name
FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE   order_date is NULL
ORDER BY 1, 2;
        