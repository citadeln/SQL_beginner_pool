WITH 
ALL_PIZZAS AS
    (SELECT pizza_name,
        pizzeria.name AS pizzeria_name,
        menu.id AS menu_id
    FROM menu
    INNER JOIN pizzeria ON pizzeria_id = pizzeria.id
    ORDER BY pizza_name, pizzeria_name),
ALL_ORDERS AS
    (SELECT menu_id
    FROM person_order
    INNER JOIN person ON person_order.person_id = person.id
    WHERE person.name in ('Denis', 'Anna'))
SELECT pizza_name,
       pizzeria_name
FROM ALL_PIZZAS
INNER JOIN ALL_ORDERS ON ALL_PIZZAS.menu_id = ALL_ORDERS.menu_id