WITH last_currency_rate AS (
    SELECT currency.id, currency.name, currency.rate_to_usd, currency.updated
	FROM currency
	JOIN (
	    SELECT id, name, MAX(updated) AS last_updated
	    FROM currency
	    GROUP BY id, name) AS last_rate 
            ON currency.id = last_rate.id 
            AND currency.name = last_rate.name 
		    AND currency.updated = last_rate.last_updated),
            
user_balance AS (
    SELECT 
    COALESCE(u.id, b.user_id) AS id,
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
        b.type,
        SUM(b.money) AS volume,
        b.currency_id
    FROM balance b
    LEFT JOIN public.user u ON u.id = b.user_id
    GROUP BY COALESCE(u.id, b.user_id), COALESCE(u.name, 'not defined'), COALESCE(u.lastname, 'not defined'), b.type, b.currency_id
    ORDER BY COALESCE(u.name, 'not defined') DESC, lastname, type)

SELECT ub.name, ub.lastname, type, volume, 
    COALESCE(l.name, 'not defined') AS currency_name, 
    COALESCE(l.rate_to_usd, 1) AS last_rate_to_usd, 
    (COALESCE(l.rate_to_usd, 1) * volume)::real AS total_volume_in_usd
FROM user_balance ub
LEFT JOIN last_currency_rate l ON ub.currency_id = l.id
ORDER BY ub.name DESC, lastname, type;
