SELECT order_date AS acion_date,
       name AS person_name
FROM person_order JOIN person ON person_order.person_id = person.id
INTERSECT
SELECT visit_date,
       name
FROM person_visits JOIN person ON person_visits.person_id = person.id
ORDER BY acion_date, person_name DESC;
