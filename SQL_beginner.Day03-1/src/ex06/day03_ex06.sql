WITH    pz2 AS (
    SELECT  pizza_name,
            pz.name,
            price
    FROM menu JOIN pizzeria pz ON pz.id = menu.pizzeria_id
    ),
        pz1 AS (
    SELECT  pizza_name,
            pz.name,
            price
    FROM menu JOIN pizzeria pz ON pz.id = menu.pizzeria_id
    )
SELECT  pz2.pizza_name,        
        pz1.name AS pizzzeria_name_1,
        pz2.name AS pizzzeria_name_2,
        pz2.price
FROM pz2
JOIN pz1 ON pz2.price = pz1.price AND pz1.pizza_name = pz2.pizza_name
WHERE pz2.name > pz1.name
ORDER BY pizza_name