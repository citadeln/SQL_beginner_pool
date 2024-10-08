CREATE FUNCTION fnc_fibonacci(pstop int DEFAULT 10)
RETURNS TABLE (
    fibonacci_number numeric
) AS
$$
WITH RECURSIVE FibonacciCTE(k, a, b) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT k + 1, b, a + b
    FROM FibonacciCTE
    WHERE a < pstop
)
SELECT a FROM FibonacciCTE WHERE a < pstop;
$$ 
LANGUAGE SQL;

-- DROP FUNCTION fnc_fibonacci;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
