SELECT  name,
        total_count
FROM    (SELECT name, SUM(count) AS total_count
        FROM    ((SELECT  pz.name, count(*) AS count
                FROM person_visits pv
                JOIN pizzeria pz ON pv.pizzeria_id = pz.id
                GROUP BY pz.name) 
                UNION ALL
                (SELECT  pz.name, count(*) AS count
                FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria pz ON m.pizzeria_id = pz.id
                GROUP BY pz.name)) AS n1
        GROUP BY name) AS n2
ORDER BY total_count DESC, name;
