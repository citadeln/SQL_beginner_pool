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
    JOIN person_order po ON pv.person_id = po.person_id
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN menu m ON po.menu_id = m.id AND pz.id = m.pizzeria_id
    JOIN person p ON po.person_id = p.id AND pv.person_id = p.id
    WHERE po.order_date = pdate AND p.name = pperson AND price < pprice;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION fnc_person_visits_and_eats_on_date(varchar, numeric, date);

SELECT * FROM information_schema.routines WHERE routine_type = 'FUNCTION' AND specific_name LIKE 'fnc_%';

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
