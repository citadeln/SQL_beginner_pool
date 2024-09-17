-- Active: 1718038112143@@127.0.0.1@5432@pool2@public
SELECT  person_id,
        COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1;

--pg_dump -U monroe -h 127.0.0.1 -p 5432 -d pool2 > backup.sql