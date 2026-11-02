-- Имена планов (вместо «План № N» в UI)
ALTER TABLE meal_plan ADD COLUMN IF NOT EXISTS name VARCHAR(100);
UPDATE meal_plan
SET name = 'Меню на ' || days || ' дн.'
WHERE name IS NULL OR btrim(name) = '';
ALTER TABLE meal_plan ALTER COLUMN name SET DEFAULT 'Меню';
ALTER TABLE meal_plan ALTER COLUMN name SET NOT NULL;
