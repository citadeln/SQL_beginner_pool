/*
DROP FUNCTION fnc_persons_female, fnc_persons_male;

SELECT * FROM information_schema.routines WHERE routine_type = 'FUNCTION' AND specific_name LIKE 'fnc_trg_%';
*/

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS
$$
SELECT * FROM person
WHERE gender = pgender;
$$ 
LANGUAGE sql;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
