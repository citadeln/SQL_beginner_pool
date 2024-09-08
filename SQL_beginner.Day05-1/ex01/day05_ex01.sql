SET enable_seqscan = on;

EXPLAIN (ANALYZE, TIMING OFF)
SELECT  pizza_name,
        pz.name AS pizzeria_name
FROM menu
JOIN pizzeria pz ON menu.pizzeria_id = pz.id;

SET enable_seqscan = off;
SET max_parallel_workers_per_gather = 0;
EXPLAIN (ANALYZE, TIMING OFF)
SELECT  pizza_name,
        pz.name AS pizzeria_name
FROM menu
JOIN pizzeria pz ON menu.pizzeria_id = pz.id;