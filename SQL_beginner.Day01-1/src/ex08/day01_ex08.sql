SELECT order_date,
       CONCAT(person.name, ' (age:', age, ')') AS person_information
    FROM person_order AS person_order(person_id, id)
NATURAL JOIN person
ORDER BY order_date, person_information;
