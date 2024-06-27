SELECT pizza_name as object_name
FROM menu
UNION ALL
SELECT name
FROM person
ORDER BY object_name;