SELECT order_date AS acion_date,
       person_id AS person_id
FROM person_order
INTERSECT
SELECT visit_date,
       person_id
FROM person_visits
ORDER BY acion_date, person_id DESC;
