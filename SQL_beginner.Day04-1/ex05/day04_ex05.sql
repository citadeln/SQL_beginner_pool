CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT  person.name,
        pizza_name,
        price,
        price - price * 0.1::int AS discount_price
FROM menu
INNER JOIN person_order ON person_order.menu_id = menu.id
FULL JOIN person ON person_order.person_id = person.id
ORDER BY person.name, pizza_name;