CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$
        (SELECT * FROM person
         WHERE person.gender = 'female');
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) AS $$
        (SELECT * FROM person
         WHERE person.gender = 'male');
$$ LANGUAGE sql;

SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();

/*
CREATE OR REPLACE VIEW v_persons_female AS
SELECT *
FROM person p
WHERE p.gender = 'female';

CREATE OR REPLACE VIEW v_persons_male AS
SELECT *
FROM person p
WHERE p.gender = 'male';

SELECT table_name
FROM information_schema.tables
WHERE table_type = 'VIEW' AND table_schema = 'public';

CREATE OR REPLACE FUNCTION fnc_persons_male() RETURNS SETOF person AS
$$
SELECT * FROM v_persons_male;
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION fnc_persons_female() RETURNS SETOF person AS
$$
SELECT * FROM v_persons_female;
$$ LANGUAGE sql;

DROP VIEW IF EXISTS v_persons_female;
DROP VIEW IF EXISTS v_persons_male;
*/
