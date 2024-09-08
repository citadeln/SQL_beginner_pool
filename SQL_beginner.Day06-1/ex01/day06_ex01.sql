INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
WITH count_of_orders AS (
    SELECT  person_id, 
            pizzeria_id, 
            COUNT(*) AS count
    FROM person_order po
    JOIN menu ON po.menu_id = menu.id
    GROUP BY po.person_id, menu.pizzeria_id)
SELECT  ROW_NUMBER() OVER (), 
        person_id, 
        pizzeria_id,
        CASE 
            WHEN count = 1 THEN 10.5 
            WHEN count = 2 THEN 22 
            ELSE 30 
        END
FROM count_of_orders;

--DELETE FROM person_discounts;
