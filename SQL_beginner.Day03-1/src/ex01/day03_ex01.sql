SELECT menu.id menu_ID
FROM menu
LEFT JOIN person_order ON person_order.menu_id = menu.id
WHERE person_order.menu_id is NULL
ORDER BY 1;
