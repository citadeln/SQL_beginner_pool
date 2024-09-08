INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT  ROW_NUMBER() OVER() AS id,
        person_id,
        pizzeria_id,
        CASE
            WHEN (SELECT COUNT(*) FROM person_order WHERE person_id = po.person_id) = 1 THEN 10.5
            WHEN (SELECT COUNT(*) FROM person_order WHERE person_id = po.person_id) = 2 THEN 22
            ELSE 30
        END
FROM person_order po
JOIN menu ON po.menu_id = menu.id;
