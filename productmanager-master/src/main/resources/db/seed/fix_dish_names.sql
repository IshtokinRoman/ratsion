-- Чинит названия с артефактом PowerShell ".Trim()" и убирает дубли-мусор,
-- если блюдо ещё не попало в сохранённые планы.

BEGIN;

-- 1) Блюда с .Trim(), которые нигде не используются — удаляем (cascade на состав/типы)
DELETE FROM dish d
WHERE d.name LIKE '%.Trim()%'
  AND NOT EXISTS (SELECT 1 FROM meal m WHERE m.dish_id = d.id);

-- 2) Оставшиеся (уже в планах) — хотя бы убираем .Trim() и лишние пробелы
UPDATE dish
SET name = trim(both FROM regexp_replace(replace(name, '.Trim()', ''), '\s+', ' ', 'g'))
WHERE name LIKE '%.Trim()%';

-- 3) Частые кривые формы рода
UPDATE dish SET name = replace(name, 'Тушённая ', 'Тушёные ') WHERE name LIKE 'Тушённая %';
UPDATE dish SET name = replace(name, 'Жаренная ', 'Жареные ') WHERE name LIKE 'Жаренная %';
UPDATE dish SET name = replace(name, 'Запечённая ', 'Запечённые ') WHERE name LIKE 'Запечённая %';

COMMIT;
