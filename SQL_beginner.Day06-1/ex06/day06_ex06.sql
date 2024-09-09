--pg_dump pool > your_backup.sql;

CREATE SEQUENCE IF NOT EXISTS seq_person_discounts MINVALUE 1 NO MAXVALUE

--SELECT * FROM seq_person_discounts;

-- ALTER TABLE person_discounts ADD COLUMN id BIGSERIAL PRIMARY KEY;  -- добавляем первичный ключ

ALTER SEQUENCE seq_person_discounts OWNED BY person_discounts.id;  -- устанавливаем привязку последовательности

ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));  -- синхронизируем последовательность с данными таблицы (если вы начали заполнять таблицу без автоинкремента)

-- проверка
-- INSERT INTO person_discounts (person_id, pizzeria_id, discount)
-- VALUES (5, 5, 5);