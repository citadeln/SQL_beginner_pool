CREATE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO person_audit 
        SELECT now(), 'U', OLD.*;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();
    
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

SELECT tgname FROM pg_trigger;
SELECT * FROM information_schema.routines WHERE routine_type = 'FUNCTION' AND specific_name LIKE 'fnc_trg_%';

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10; UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;