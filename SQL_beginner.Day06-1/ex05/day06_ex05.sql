COMMENT ON TABLE person_discounts IS 'personal discounts for people';
COMMENT ON COLUMN person_discounts.id IS 'Primary Key';
COMMENT ON COLUMN person_discounts.person_id IS 'foreign Key for table person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'foreign Key for table pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'personal discount in percent';
