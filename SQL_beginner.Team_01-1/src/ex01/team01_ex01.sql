insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION get_nearest_rate_to_usd(pcurrency_id INTEGER, pbalance_date TIMESTAMP)
RETURNS NUMERIC AS $$
DECLARE
    nearest_rate NUMERIC;
BEGIN
    SELECT rate_to_usd INTO nearest_rate
    FROM currency
    WHERE id = pcurrency_id
    AND updated <= pbalance_date
    ORDER BY updated DESC
    LIMIT 1;
    
    IF nearest_rate IS NULL THEN
        SELECT rate_to_usd INTO nearest_rate
        FROM currency
        WHERE id = pcurrency_id
        AND updated > pbalance_date
        ORDER BY updated ASC
        LIMIT 1;
    END IF;

    RETURN COALESCE(nearest_rate, 1);
END;
$$ LANGUAGE plpgsql;
SELECT 
    COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency.name AS currency_name,
    balance.money * get_nearest_rate_to_usd(balance.currency_id, balance.updated) AS currency_in_usd
FROM balance 
FULL JOIN "user" ON "user".id = balance.user_id
INNER JOIN (select DISTINCT id, name 
            from currency) as currency
        ON currency.id = balance.currency_id
ORDER BY 1 DESC, 2 ASC, 3 ASC;
