SELECT missing_date::date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') as missing_date
LEFT JOIN (select * FROM person_visits WHERE person_visits.person_id = 1 OR person_visits.person_id = 2) as person_visits2 ON visit_date = missing_date
WHERE person_visits2.visit_date is NULL
ORDER BY missing_date;
