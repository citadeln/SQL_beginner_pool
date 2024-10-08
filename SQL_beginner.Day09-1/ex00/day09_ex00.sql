CREATE TABLE person_audit (
created	timestamp with time zone NOT NULL DEFAULT current_timestamp,
type_event char(1) NOT NULL DEFAULT 'I'
    constraint ch_type_event 
    check (type_event in ('I', 'D', 'U')),
row_id bigint NOT NULL,
name varchar,
age	integer,
gender	varchar,
address	varchar
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit 
        SELECT now(), 'I', NEW.*;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
SELECT * FROM person_audit;

-- DROP TRIGGER trg_person_insert_audit ON person;
-- DROP FUNCTION fnc_trg_person_insert_audit;
-- SELECT tgname FROM pg_trigger;
