CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name))

SELECT * FROM pg_indexes;

SET enable_seqscan = off;
SET max_parallel_workers_per_gather = 0;

EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'ANNA';

--SET enable_seqscan = on;