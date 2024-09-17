SELECT  name,
        count,
        action_type
FROM
    (SELECT  pz.name,
            count(*) AS count,
            'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    LIMIT 3) AS n1
    UNION ALL
    (SELECT  pz.name,
            count(*) AS count,
            'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name    
    LIMIT 3)
ORDER BY action_type, count DESC;