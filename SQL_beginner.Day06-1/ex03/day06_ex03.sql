CREATE INDEX IF NOT EXISTS idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id)

SET enable_seqscan = off;
SET max_parallel_workers_per_gather = 0;

EXPLAIN ANALYSE
SELECT  p.name,
        pizza_name,
        price,
        price - price * discount / 100 AS discount_price,
        pz.name
FROM person_order po
JOIN menu ON po.menu_id = menu.id
JOIN pizzeria pz ON menu.pizzeria_id = pz.id
JOIN person p ON po.person_id = p.id
JOIN person_discounts pd ON pz.id = pd.pizzeria_id AND p.id = pd.person_id
ORDER BY 1, 2
