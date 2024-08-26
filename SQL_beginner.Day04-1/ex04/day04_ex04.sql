CREATE OR REPLACE VIEW v_person_visits_a AS
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02';

CREATE OR REPLACE VIEW v_person_visits_b AS
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06';

CREATE OR REPLACE VIEW v_symmetric_union AS
(SELECT person_id
FROM v_person_visits_a
EXCEPT
SELECT person_id
FROM v_person_visits_b)
UNION
(SELECT person_id
FROM v_person_visits_b
EXCEPT
SELECT person_id
FROM v_person_visits_a)
ORDER BY 1
