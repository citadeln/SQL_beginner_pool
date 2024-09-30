-- Active: 1718038112143@@127.0.0.1@5432@pool
SELECT name
FROM v_persons_female
UNION
SELECT name
FROM v_persons_male
ORDER BY 1
