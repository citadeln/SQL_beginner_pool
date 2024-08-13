SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
EXCEPT ALL
(SELECT pizzeria.name AS pizzeria_name
FROM person
INNER JOIN person_visits ON person.id = person_visits.person_id
INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
HAVING  SUM(CASE WHEN person.gender = 'female' THEN 1 ELSE 0 END) = SUM(CASE WHEN person.gender = 'male' THEN 1 ELSE 0 END)
UNION ALL
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id is NULL
)
ORDER BY pizzeria_name
