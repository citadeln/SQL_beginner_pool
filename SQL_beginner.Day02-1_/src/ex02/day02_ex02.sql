SELECT coalesce(person.name, '-'),
       visit_date,
       coalesce(pizzeria.name, '-')
FROM (SELECT visit_date, person_id, pizzeria_id FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') as person_visits2
FULL JOIN person ON person.id = person_id
FULL JOIN  pizzeria ON pizzeria.id = pizzeria_id
ORDER BY 1, 2, 3