WITH n1 AS
    (SELECT name AS person_name1,
            address,
            id
    FROM person)
SELECT  person_name1,
        name AS person_name2,
        n1.address AS common_address
FROM n1
CROSS JOIN person
WHERE person.id < n1.id
    AND person.address = n1.address
ORDER BY 1, 2, 3
