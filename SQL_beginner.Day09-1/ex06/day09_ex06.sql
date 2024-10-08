CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy', 
    pprice numeric DEFAULT 500, 
    pdate date DEFAULT '2022-01-08')
RETURNS TABLE (
    pizzeria_name varchar
) AS
$$
BEGIN
    RETURN QUERY
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
    INNER JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    INNER JOIN menu m ON pz.id = m.pizzeria_id
    INNER JOIN person p ON pv.person_id = p.id
    WHERE visit_date = pdate AND p.name = pperson AND price < pprice;
END;
$$ LANGUAGE plpgsql;

-- DROP FUNCTION fnc_person_visits_and_eats_on_date(varchar, numeric, date);
-- SELECT * FROM information_schema.routines WHERE routine_type = 'FUNCTION' AND specific_name LIKE 'fnc_%';

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
