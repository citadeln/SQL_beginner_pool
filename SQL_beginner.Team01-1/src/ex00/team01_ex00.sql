with lastrate AS(
	SELECT currency.id, currency.name, currency.rate_to_usd, currency.updated
	FROM currency
	JOIN (
	    SELECT id, name, MAX(updated) AS max_updated
	    FROM currency
	    GROUP BY id, name) 
		AS latest ON currency.id = latest.id AND currency.name = latest.name 
		AND currency.updated = latest.max_updated),
		
	prep AS(
	SELECT DISTINCT 
		COALESCE(public.user.name, 'not defined') AS name, 
		COALESCE(public.user.lastname, 'not defined') as lastname, 
		type, 
		money, 
		COALESCE(currency.name, 'not defined') AS currency_name,
		COALESCE(lastrate.rate_to_usd, 1) AS rate_to_usd
	FROM balance
	FULL JOIN public.user ON public.user.id = balance.user_id
	FULL JOIN currency on currency.id = balance.currency_id
	FULL JOIN lastrate ON lastrate.id = balance.currency_id)
	
SELECT name, lastname, type, SUM(money) AS volume, currency_name, 
	rate_to_usd AS last_rate_to_usd, (SUM(money) * rate_to_usd) AS total_volume_in_usd
	from prep
	group by name, lastname, type, currency_name, rate_to_usd
	ORDER BY name DESC, lastname, type;