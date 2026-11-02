-- Массовое расширение каталога блюд (~800), нормальные названия
BEGIN;

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным филе с гречкой и брокколи', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным филе с гречкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Гречневая крупа', 60), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным филе с рисом и цветной капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным филе с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Рис белый', 60), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным филе с бурым рисом и спаржей', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным филе с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным филе с басмати и кабачком', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным филе с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Рис басмати', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным филе с киноа и цукини', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным филе с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным филе с булгуром и баклажаном', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным филе с булгуром и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Булгур', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным филе с кускусом и морковью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным филе с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным филе с пшеном и перцем', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным филе с пшеном и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Пшено', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным филе с перловкой и помидорами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным филе с перловкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Перловая крупа', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным филе с ячневой кашей и черри', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным филе с ячневой кашей и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Ячневая крупа', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным филе с полбой и шпинатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным филе с полбой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Полба (спельта)', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным филе с макаронами и стручковой фасолью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным филе с макаронами и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Макароны (сухие)', 70), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным филе с спагетти и шампиньонами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным филе с спагетти и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Спагетти', 70), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным филе с цельнозерновой пастой и вешенками', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным филе с цельнозерновой пастой и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Макароны цельнозерновые', 70), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным филе с картофелем и тыквой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным филе с картофелем и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Картофель', 180), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным филе с бататом и капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным филе с бататом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Батат', 180), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным филе с чечевицей и пекинской капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным филе с чечевицей и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Чечевица (сухая)', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным филе с нутом и свёклой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным филе с нутом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Нут (сухой)', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным бедром с гречкой и огурцом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным бедром с гречкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Гречневая крупа', 60), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным бедром с рисом и авокадо', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным бедром с рисом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Рис белый', 60), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным бедром с бурым рисом и рукколой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным бедром с бурым рисом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Рис бурый', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным бедром с басмати и салатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным бедром с басмати и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Рис басмати', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным бедром с киноа и брокколи', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным бедром с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным бедром с булгуром и цветной капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным бедром с булгуром и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Булгур', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным бедром с кускусом и спаржей', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным бедром с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным бедром с пшеном и кабачком', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным бедром с пшеном и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Пшено', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным бедром с перловкой и цукини', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным бедром с перловкой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Перловая крупа', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным бедром с ячневой кашей и баклажаном', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным бедром с ячневой кашей и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Ячневая крупа', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным бедром с полбой и морковью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным бедром с полбой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Полба (спельта)', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным бедром с макаронами и перцем', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным бедром с макаронами и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Макароны (сухие)', 70), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным бедром с спагетти и помидорами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным бедром с спагетти и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Спагетти', 70), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным бедром с цельнозерновой пастой и черри', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным бедром с цельнозерновой пастой и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Макароны цельнозерновые', 70), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным бедром с картофелем и шпинатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным бедром с картофелем и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Картофель', 180), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным бедром с бататом и стручковой фасолью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным бедром с бататом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Батат', 180), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным бедром с чечевицей и шампиньонами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным бедром с чечевицей и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Чечевица (сухая)', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным бедром с нутом и вешенками', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным бедром с нутом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 150), ('Нут (сухой)', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным фаршем с гречкой и тыквой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным фаршем с гречкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Гречневая крупа', 60), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным фаршем с рисом и капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным фаршем с рисом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Рис белый', 60), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным фаршем с бурым рисом и пекинской капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным фаршем с бурым рисом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Рис бурый', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным фаршем с басмати и свёклой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным фаршем с басмати и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Рис басмати', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным фаршем с киноа и огурцом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным фаршем с киноа и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Киноа', 50), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным фаршем с булгуром и авокадо', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным фаршем с булгуром и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Булгур', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным фаршем с кускусом и рукколой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным фаршем с кускусом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Кускус', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным фаршем с пшеном и салатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным фаршем с пшеном и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Пшено', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным фаршем с перловкой и брокколи', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным фаршем с перловкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Перловая крупа', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным фаршем с ячневой кашей и цветной капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным фаршем с ячневой кашей и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Ячневая крупа', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным фаршем с полбой и спаржей', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным фаршем с полбой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Полба (спельта)', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным фаршем с макаронами и кабачком', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным фаршем с макаронами и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Макароны (сухие)', 70), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным фаршем с спагетти и цукини', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным фаршем с спагетти и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Спагетти', 70), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриным фаршем с цельнозерновой пастой и баклажаном', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриным фаршем с цельнозерновой пастой и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Макароны цельнозерновые', 70), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриным фаршем с картофелем и морковью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриным фаршем с картофелем и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Картофель', 180), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриным фаршем с бататом и перцем', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриным фаршем с бататом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Батат', 180), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриным фаршем с чечевицей и помидорами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриным фаршем с чечевицей и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Чечевица (сухая)', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриным фаршем с нутом и черри', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриным фаршем с нутом и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 140), ('Нут (сухой)', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные индейкой с гречкой и шпинатом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные индейкой с гречкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Гречневая крупа', 60), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые индейкой с рисом и стручковой фасолью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые индейкой с рисом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Рис белый', 60), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные индейкой с бурым рисом и шампиньонами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные индейкой с бурым рисом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Рис бурый', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: индейкой с басмати и вешенками', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: индейкой с басмати и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Рис басмати', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: индейкой с киноа и тыквой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: индейкой с киноа и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Киноа', 50), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные индейкой с булгуром и капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные индейкой с булгуром и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Булгур', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые индейкой с кускусом и пекинской капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые индейкой с кускусом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Кускус', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные индейкой с пшеном и свёклой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные индейкой с пшеном и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Пшено', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: индейкой с перловкой и огурцом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: индейкой с перловкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Перловая крупа', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: индейкой с ячневой кашей и авокадо', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: индейкой с ячневой кашей и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Ячневая крупа', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные индейкой с полбой и рукколой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные индейкой с полбой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Полба (спельта)', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые индейкой с макаронами и салатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые индейкой с макаронами и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Макароны (сухие)', 70), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные индейкой с спагетти и брокколи', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные индейкой с спагетти и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Спагетти', 70), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: индейкой с цельнозерновой пастой и цветной капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: индейкой с цельнозерновой пастой и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Макароны цельнозерновые', 70), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: индейкой с картофелем и спаржей', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: индейкой с картофелем и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Картофель', 180), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные индейкой с бататом и кабачком', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные индейкой с бататом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Батат', 180), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые индейкой с чечевицей и цукини', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые индейкой с чечевицей и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Чечевица (сухая)', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные индейкой с нутом и баклажаном', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные индейкой с нутом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Нут (сухой)', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем индейки с гречкой и морковью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем индейки с гречкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Гречневая крупа', 60), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем индейки с рисом и перцем', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем индейки с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Рис белый', 60), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем индейки с бурым рисом и помидорами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем индейки с бурым рисом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Рис бурый', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем индейки с басмати и черри', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем индейки с басмати и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Рис басмати', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем индейки с киноа и шпинатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем индейки с киноа и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Киноа', 50), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем индейки с булгуром и стручковой фасолью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем индейки с булгуром и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Булгур', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем индейки с кускусом и шампиньонами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем индейки с кускусом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Кускус', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем индейки с пшеном и вешенками', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем индейки с пшеном и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Пшено', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем индейки с перловкой и тыквой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем индейки с перловкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Перловая крупа', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем индейки с ячневой кашей и капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем индейки с ячневой кашей и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Ячневая крупа', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем индейки с полбой и пекинской капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем индейки с полбой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Полба (спельта)', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем индейки с макаронами и свёклой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем индейки с макаронами и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Макароны (сухие)', 70), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем индейки с спагетти и огурцом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем индейки с спагетти и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Спагетти', 70), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем индейки с цельнозерновой пастой и авокадо', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем индейки с цельнозерновой пастой и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Макароны цельнозерновые', 70), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем индейки с картофелем и рукколой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем индейки с картофелем и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Картофель', 180), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем индейки с бататом и салатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем индейки с бататом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Батат', 180), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем индейки с чечевицей и брокколи', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем индейки с чечевицей и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Чечевица (сухая)', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем индейки с нутом и цветной капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем индейки с нутом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (фарш)', 140), ('Нут (сухой)', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говядиной с гречкой и спаржей', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говядиной с гречкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Гречневая крупа', 60), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говядиной с рисом и кабачком', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говядиной с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Рис белый', 60), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говядиной с бурым рисом и цукини', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говядиной с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говядиной с басмати и баклажаном', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говядиной с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Рис басмати', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говядиной с киноа и морковью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говядиной с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говядиной с булгуром и перцем', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говядиной с булгуром и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Булгур', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говядиной с кускусом и помидорами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говядиной с кускусом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Кускус', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говядиной с пшеном и черри', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говядиной с пшеном и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Пшено', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говядиной с перловкой и шпинатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говядиной с перловкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Перловая крупа', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говядиной с ячневой кашей и стручковой фасолью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говядиной с ячневой кашей и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Ячневая крупа', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говядиной с полбой и шампиньонами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говядиной с полбой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Полба (спельта)', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говядиной с макаронами и вешенками', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говядиной с макаронами и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Макароны (сухие)', 70), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говядиной с спагетти и тыквой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говядиной с спагетти и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Спагетти', 70), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говядиной с цельнозерновой пастой и капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говядиной с цельнозерновой пастой и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Макароны цельнозерновые', 70), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говядиной с картофелем и пекинской капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говядиной с картофелем и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Картофель', 180), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говядиной с бататом и свёклой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говядиной с бататом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Батат', 180), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говядиной с чечевицей и огурцом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говядиной с чечевицей и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Чечевица (сухая)', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говядиной с нутом и авокадо', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говядиной с нутом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Нут (сухой)', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей вырезкой с гречкой и рукколой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей вырезкой с гречкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Гречневая крупа', 60), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей вырезкой с рисом и салатом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей вырезкой с рисом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Рис белый', 60), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей вырезкой с бурым рисом и брокколи', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей вырезкой с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей вырезкой с басмати и цветной капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей вырезкой с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Рис басмати', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей вырезкой с киноа и спаржей', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей вырезкой с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей вырезкой с булгуром и кабачком', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей вырезкой с булгуром и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Булгур', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей вырезкой с кускусом и цукини', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей вырезкой с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей вырезкой с пшеном и баклажаном', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей вырезкой с пшеном и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Пшено', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей вырезкой с перловкой и морковью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей вырезкой с перловкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Перловая крупа', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей вырезкой с ячневой кашей и перцем', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей вырезкой с ячневой кашей и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Ячневая крупа', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей вырезкой с полбой и помидорами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей вырезкой с полбой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Полба (спельта)', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей вырезкой с макаронами и черри', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей вырезкой с макаронами и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Макароны (сухие)', 70), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей вырезкой с спагетти и шпинатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей вырезкой с спагетти и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Спагетти', 70), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей вырезкой с цельнозерновой пастой и стручковой фасолью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей вырезкой с цельнозерновой пастой и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Макароны цельнозерновые', 70), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей вырезкой с картофелем и шампиньонами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей вырезкой с картофелем и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Картофель', 180), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей вырезкой с бататом и вешенками', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей вырезкой с бататом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Батат', 180), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей вырезкой с чечевицей и тыквой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей вырезкой с чечевицей и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Чечевица (сухая)', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей вырезкой с нутом и капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей вырезкой с нутом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 140), ('Нут (сухой)', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьим фаршем с гречкой и пекинской капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьим фаршем с гречкой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Гречневая крупа', 60), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьим фаршем с рисом и свёклой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьим фаршем с рисом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Рис белый', 60), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьим фаршем с бурым рисом и огурцом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьим фаршем с бурым рисом и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Рис бурый', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьим фаршем с басмати и авокадо', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьим фаршем с басмати и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Рис басмати', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьим фаршем с киноа и рукколой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьим фаршем с киноа и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Киноа', 50), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьим фаршем с булгуром и салатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьим фаршем с булгуром и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Булгур', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьим фаршем с кускусом и брокколи', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьим фаршем с кускусом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Кускус', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьим фаршем с пшеном и цветной капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьим фаршем с пшеном и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Пшено', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьим фаршем с перловкой и спаржей', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьим фаршем с перловкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Перловая крупа', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьим фаршем с ячневой кашей и кабачком', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьим фаршем с ячневой кашей и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Ячневая крупа', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьим фаршем с полбой и цукини', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьим фаршем с полбой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Полба (спельта)', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьим фаршем с макаронами и баклажаном', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьим фаршем с макаронами и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Макароны (сухие)', 70), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьим фаршем с спагетти и морковью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьим фаршем с спагетти и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Спагетти', 70), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьим фаршем с цельнозерновой пастой и перцем', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьим фаршем с цельнозерновой пастой и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Макароны цельнозерновые', 70), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьим фаршем с картофелем и помидорами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьим фаршем с картофелем и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Картофель', 180), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьим фаршем с бататом и черри', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьим фаршем с бататом и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Батат', 180), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьим фаршем с чечевицей и шпинатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьим фаршем с чечевицей и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Чечевица (сухая)', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьим фаршем с нутом и стручковой фасолью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьим фаршем с нутом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 140), ('Нут (сухой)', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свининой с гречкой и шампиньонами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свининой с гречкой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Гречневая крупа', 60), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свининой с рисом и вешенками', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свининой с рисом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Рис белый', 60), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свининой с бурым рисом и тыквой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свининой с бурым рисом и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Рис бурый', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свининой с басмати и капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свининой с басмати и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Рис басмати', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свининой с киноа и пекинской капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свининой с киноа и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Киноа', 50), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свининой с булгуром и свёклой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свининой с булгуром и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Булгур', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свининой с кускусом и огурцом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свининой с кускусом и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Кускус', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свининой с пшеном и авокадо', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свининой с пшеном и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Пшено', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свининой с перловкой и рукколой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свининой с перловкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Перловая крупа', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свининой с ячневой кашей и салатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свининой с ячневой кашей и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Ячневая крупа', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свининой с полбой и брокколи', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свининой с полбой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Полба (спельта)', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свининой с макаронами и цветной капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свининой с макаронами и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Макароны (сухие)', 70), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свининой с спагетти и спаржей', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свининой с спагетти и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Спагетти', 70), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свининой с цельнозерновой пастой и кабачком', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свининой с цельнозерновой пастой и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Макароны цельнозерновые', 70), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свининой с картофелем и цукини', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свининой с картофелем и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Картофель', 180), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свининой с бататом и баклажаном', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свининой с бататом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Батат', 180), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свининой с чечевицей и морковью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свининой с чечевицей и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Чечевица (сухая)', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свининой с нутом и перцем', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свининой с нутом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Нут (сухой)', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свиной вырезкой с гречкой и помидорами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свиной вырезкой с гречкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Гречневая крупа', 60), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свиной вырезкой с рисом и черри', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свиной вырезкой с рисом и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Рис белый', 60), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свиной вырезкой с бурым рисом и шпинатом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свиной вырезкой с бурым рисом и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Рис бурый', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свиной вырезкой с басмати и стручковой фасолью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свиной вырезкой с басмати и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Рис басмати', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свиной вырезкой с киноа и шампиньонами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свиной вырезкой с киноа и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Киноа', 50), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свиной вырезкой с булгуром и вешенками', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свиной вырезкой с булгуром и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Булгур', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свиной вырезкой с кускусом и тыквой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свиной вырезкой с кускусом и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Кускус', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свиной вырезкой с пшеном и капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свиной вырезкой с пшеном и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Пшено', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свиной вырезкой с перловкой и пекинской капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свиной вырезкой с перловкой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Перловая крупа', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свиной вырезкой с ячневой кашей и свёклой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свиной вырезкой с ячневой кашей и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Ячневая крупа', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свиной вырезкой с полбой и огурцом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свиной вырезкой с полбой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Полба (спельта)', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свиной вырезкой с макаронами и авокадо', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свиной вырезкой с макаронами и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Макароны (сухие)', 70), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свиной вырезкой с спагетти и рукколой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свиной вырезкой с спагетти и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Спагетти', 70), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые свиной вырезкой с цельнозерновой пастой и салатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые свиной вырезкой с цельнозерновой пастой и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Макароны цельнозерновые', 70), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные свиной вырезкой с картофелем и брокколи', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные свиной вырезкой с картофелем и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Картофель', 180), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: свиной вырезкой с бататом и цветной капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: свиной вырезкой с бататом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Батат', 180), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: свиной вырезкой с чечевицей и спаржей', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: свиной вырезкой с чечевицей и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Чечевица (сухая)', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные свиной вырезкой с нутом и кабачком', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные свиной вырезкой с нутом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 140), ('Нут (сухой)', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые телятиной с гречкой и цукини', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые телятиной с гречкой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Гречневая крупа', 60), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные телятиной с рисом и баклажаном', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные телятиной с рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Рис белый', 60), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: телятиной с бурым рисом и морковью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: телятиной с бурым рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Рис бурый', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: телятиной с басмати и перцем', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: телятиной с басмати и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Рис басмати', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные телятиной с киноа и помидорами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные телятиной с киноа и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Киноа', 50), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые телятиной с булгуром и черри', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые телятиной с булгуром и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Булгур', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные телятиной с кускусом и шпинатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные телятиной с кускусом и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Кускус', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: телятиной с пшеном и стручковой фасолью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: телятиной с пшеном и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Пшено', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: телятиной с перловкой и шампиньонами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: телятиной с перловкой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Перловая крупа', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные телятиной с ячневой кашей и вешенками', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные телятиной с ячневой кашей и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Ячневая крупа', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые телятиной с полбой и тыквой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые телятиной с полбой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Полба (спельта)', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные телятиной с макаронами и капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные телятиной с макаронами и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Макароны (сухие)', 70), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: телятиной с спагетти и пекинской капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: телятиной с спагетти и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Спагетти', 70), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: телятиной с цельнозерновой пастой и свёклой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: телятиной с цельнозерновой пастой и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Макароны цельнозерновые', 70), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные телятиной с картофелем и огурцом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные телятиной с картофелем и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Картофель', 180), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые телятиной с бататом и авокадо', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые телятиной с бататом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Батат', 180), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные телятиной с чечевицей и рукколой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные телятиной с чечевицей и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Чечевица (сухая)', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: телятиной с нутом и салатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: телятиной с нутом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Телятина', 140), ('Нут (сухой)', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кроликом с гречкой и брокколи', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кроликом с гречкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Гречневая крупа', 60), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кроликом с рисом и цветной капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кроликом с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Рис белый', 60), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кроликом с бурым рисом и спаржей', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кроликом с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные кроликом с басмати и кабачком', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные кроликом с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Рис басмати', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: кроликом с киноа и цукини', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: кроликом с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кроликом с булгуром и баклажаном', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кроликом с булгуром и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Булгур', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кроликом с кускусом и морковью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кроликом с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кроликом с пшеном и перцем', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кроликом с пшеном и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Пшено', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные кроликом с перловкой и помидорами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные кроликом с перловкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Перловая крупа', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: кроликом с ячневой кашей и черри', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: кроликом с ячневой кашей и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Ячневая крупа', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кроликом с полбой и шпинатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кроликом с полбой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Полба (спельта)', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кроликом с макаронами и стручковой фасолью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кроликом с макаронами и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Макароны (сухие)', 70), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кроликом с спагетти и шампиньонами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кроликом с спагетти и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Спагетти', 70), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные кроликом с цельнозерновой пастой и вешенками', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные кроликом с цельнозерновой пастой и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Макароны цельнозерновые', 70), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: кроликом с картофелем и тыквой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: кроликом с картофелем и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Картофель', 180), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кроликом с бататом и капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кроликом с бататом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Батат', 180), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кроликом с чечевицей и пекинской капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кроликом с чечевицей и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Чечевица (сухая)', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кроликом с нутом и свёклой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кроликом с нутом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 150), ('Нут (сухой)', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриной печенью с гречкой и огурцом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриной печенью с гречкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Гречневая крупа', 60), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриной печенью с рисом и авокадо', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриной печенью с рисом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Рис белый', 60), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриной печенью с бурым рисом и рукколой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриной печенью с бурым рисом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Рис бурый', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриной печенью с басмати и салатом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриной печенью с басмати и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Рис басмати', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриной печенью с киноа и брокколи', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриной печенью с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриной печенью с булгуром и цветной капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриной печенью с булгуром и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Булгур', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриной печенью с кускусом и спаржей', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриной печенью с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриной печенью с пшеном и кабачком', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриной печенью с пшеном и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Пшено', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриной печенью с перловкой и цукини', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриной печенью с перловкой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Перловая крупа', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриной печенью с ячневой кашей и баклажаном', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриной печенью с ячневой кашей и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Ячневая крупа', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриной печенью с полбой и морковью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриной печенью с полбой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Полба (спельта)', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриной печенью с макаронами и перцем', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриной печенью с макаронами и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Макароны (сухие)', 70), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриной печенью с спагетти и помидорами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриной печенью с спагетти и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Спагетти', 70), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриной печенью с цельнозерновой пастой и черри', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриной печенью с цельнозерновой пастой и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Макароны цельнозерновые', 70), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриной печенью с картофелем и шпинатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриной печенью с картофелем и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Картофель', 180), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриной печенью с бататом и стручковой фасолью', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриной печенью с бататом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Батат', 180), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриной печенью с чечевицей и шампиньонами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриной печенью с чечевицей и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Чечевица (сухая)', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриной печенью с нутом и вешенками', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриной печенью с нутом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 140), ('Нут (сухой)', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей печенью с гречкой и тыквой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей печенью с гречкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Гречневая крупа', 60), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей печенью с рисом и капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей печенью с рисом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Рис белый', 60), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей печенью с бурым рисом и пекинской капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей печенью с бурым рисом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Рис бурый', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей печенью с басмати и свёклой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей печенью с басмати и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Рис басмати', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей печенью с киноа и огурцом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей печенью с киноа и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Киноа', 50), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей печенью с булгуром и авокадо', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей печенью с булгуром и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Булгур', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей печенью с кускусом и рукколой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей печенью с кускусом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Кускус', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей печенью с пшеном и салатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей печенью с пшеном и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Пшено', 55), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей печенью с перловкой и брокколи', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей печенью с перловкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Перловая крупа', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей печенью с ячневой кашей и цветной капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей печенью с ячневой кашей и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Ячневая крупа', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей печенью с полбой и спаржей', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей печенью с полбой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Полба (спельта)', 55), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей печенью с макаронами и кабачком', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей печенью с макаронами и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Макароны (сухие)', 70), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей печенью с спагетти и цукини', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей печенью с спагетти и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Спагетти', 70), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: говяжьей печенью с цельнозерновой пастой и баклажаном', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: говяжьей печенью с цельнозерновой пастой и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Макароны цельнозерновые', 70), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: говяжьей печенью с картофелем и морковью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: говяжьей печенью с картофелем и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Картофель', 180), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные говяжьей печенью с бататом и перцем', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные говяжьей печенью с бататом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Батат', 180), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые говяжьей печенью с чечевицей и помидорами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые говяжьей печенью с чечевицей и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Чечевица (сухая)', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные говяжьей печенью с нутом и черри', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные говяжьей печенью с нутом и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжья печень', 140), ('Нут (сухой)', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриными сердечками с гречкой и шпинатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриными сердечками с гречкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Гречневая крупа', 60), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриными сердечками с рисом и стручковой фасолью', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриными сердечками с рисом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Рис белый', 60), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриными сердечками с бурым рисом и шампиньонами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриными сердечками с бурым рисом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Рис бурый', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриными сердечками с басмати и вешенками', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриными сердечками с басмати и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Рис басмати', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриными сердечками с киноа и тыквой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриными сердечками с киноа и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Киноа', 50), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриными сердечками с булгуром и капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриными сердечками с булгуром и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Булгур', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриными сердечками с кускусом и пекинской капустой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриными сердечками с кускусом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Кускус', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриными сердечками с пшеном и свёклой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриными сердечками с пшеном и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Пшено', 55), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриными сердечками с перловкой и огурцом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриными сердечками с перловкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Перловая крупа', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриными сердечками с ячневой кашей и авокадо', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриными сердечками с ячневой кашей и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Ячневая крупа', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриными сердечками с полбой и рукколой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриными сердечками с полбой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Полба (спельта)', 55), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриными сердечками с макаронами и салатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриными сердечками с макаронами и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Макароны (сухие)', 70), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриными сердечками с спагетти и брокколи', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриными сердечками с спагетти и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Спагетти', 70), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые куриными сердечками с цельнозерновой пастой и цветной капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые куриными сердечками с цельнозерновой пастой и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Макароны цельнозерновые', 70), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные куриными сердечками с картофелем и спаржей', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные куриными сердечками с картофелем и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Картофель', 180), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: куриными сердечками с бататом и кабачком', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: куриными сердечками с бататом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Батат', 180), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: куриными сердечками с чечевицей и цукини', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: куриными сердечками с чечевицей и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Чечевица (сухая)', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные куриными сердечками с нутом и баклажаном', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные куриными сердечками с нутом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 140), ('Нут (сухой)', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые бараниной с гречкой и морковью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые бараниной с гречкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Гречневая крупа', 60), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные бараниной с рисом и перцем', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные бараниной с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Рис белый', 60), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: бараниной с бурым рисом и помидорами', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: бараниной с бурым рисом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Рис бурый', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: бараниной с басмати и черри', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: бараниной с басмати и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Рис басмати', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные бараниной с киноа и шпинатом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные бараниной с киноа и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Киноа', 50), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые бараниной с булгуром и стручковой фасолью', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые бараниной с булгуром и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Булгур', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные бараниной с кускусом и шампиньонами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные бараниной с кускусом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Кускус', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: бараниной с пшеном и вешенками', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: бараниной с пшеном и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Пшено', 55), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: бараниной с перловкой и тыквой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: бараниной с перловкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Перловая крупа', 55), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные бараниной с ячневой кашей и капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные бараниной с ячневой кашей и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Ячневая крупа', 55), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые бараниной с полбой и пекинской капустой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые бараниной с полбой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Полба (спельта)', 55), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные бараниной с макаронами и свёклой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные бараниной с макаронами и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Макароны (сухие)', 70), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: бараниной с спагетти и огурцом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: бараниной с спагетти и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Спагетти', 70), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: бараниной с цельнозерновой пастой и авокадо', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: бараниной с цельнозерновой пастой и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Макароны цельнозерновые', 70), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные бараниной с картофелем и рукколой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные бараниной с картофелем и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Картофель', 180), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые бараниной с бататом и салатом', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые бараниной с бататом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Батат', 180), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные бараниной с чечевицей и брокколи', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные бараниной с чечевицей и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Чечевица (сухая)', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: бараниной с нутом и цветной капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: бараниной с нутом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Нут (сухой)', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем с гречкой и спаржей', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем с гречкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Гречневая крупа', 60), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем с рисом и кабачком', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Рис белый', 60), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем с бурым рисом и цукини', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем с басмати и баклажаном', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Рис басмати', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем с киноа и морковью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем с булгуром и перцем', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем с булгуром и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Булгур', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем с кускусом и помидорами', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем с кускусом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Кускус', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем с пшеном и черри', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем с пшеном и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Пшено', 55), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем с перловкой и шпинатом', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем с перловкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Перловая крупа', 55), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем с ячневой кашей и стручковой фасолью', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем с ячневой кашей и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Ячневая крупа', 55), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем с полбой и шампиньонами', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем с полбой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Полба (спельта)', 55), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем с макаронами и вешенками', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем с макаронами и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Макароны (сухие)', 70), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем с спагетти и тыквой', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем с спагетти и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Спагетти', 70), ('Тыква', 150), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные фаршем с цельнозерновой пастой и капустой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные фаршем с цельнозерновой пастой и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Макароны цельнозерновые', 70), ('Капуста белокочанная', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: фаршем с картофелем и пекинской капустой', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: фаршем с картофелем и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Картофель', 180), ('Капуста пекинская', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: фаршем с бататом и свёклой', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: фаршем с бататом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Батат', 180), ('Свёкла', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные фаршем с чечевицей и огурцом', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные фаршем с чечевицей и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Чечевица (сухая)', 55), ('Огурцы', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые фаршем с нутом и авокадо', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые фаршем с нутом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Нут (сухой)', 55), ('Авокадо', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные ветчиной с гречкой и рукколой', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные ветчиной с гречкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Гречневая крупа', 60), ('Руккола', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: ветчиной с рисом и салатом', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: ветчиной с рисом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Рис белый', 60), ('Салат листовой', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: ветчиной с бурым рисом и брокколи', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: ветчиной с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные ветчиной с басмати и цветной капустой', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные ветчиной с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Рис басмати', 55), ('Цветная капуста', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые ветчиной с киноа и спаржей', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые ветчиной с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные ветчиной с булгуром и кабачком', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные ветчиной с булгуром и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Булгур', 55), ('Кабачок', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: ветчиной с кускусом и цукини', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: ветчиной с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: ветчиной с пшеном и баклажаном', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: ветчиной с пшеном и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Пшено', 55), ('Баклажан', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные ветчиной с перловкой и морковью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные ветчиной с перловкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Перловая крупа', 55), ('Морковь', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые ветчиной с ячневой кашей и перцем', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые ветчиной с ячневой кашей и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Ячневая крупа', 55), ('Перец болгарский', 100), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные ветчиной с полбой и помидорами', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные ветчиной с полбой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Полба (спельта)', 55), ('Помидоры', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: ветчиной с макаронами и черри', 'Горячее блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: ветчиной с макаронами и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Макароны (сухие)', 70), ('Помидоры черри', 80), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: ветчиной с спагетти и шпинатом', 'Горячее блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: ветчиной с спагетти и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Спагетти', 70), ('Шпинат', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные ветчиной с цельнозерновой пастой и стручковой фасолью', 'Горячее блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные ветчиной с цельнозерновой пастой и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Макароны цельнозерновые', 70), ('Стручковая фасоль', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые ветчиной с картофелем и шампиньонами', 'Горячее блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые ветчиной с картофелем и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Картофель', 180), ('Шампиньоны', 120), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные ветчиной с бататом и вешенками', 'Горячее блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные ветчиной с бататом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ветчина', 80), ('Батат', 180), ('Грибы вешенки', 120), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые треской с гречкой и брокколи', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые треской с гречкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Гречневая крупа', 60), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные треской с рисом и цветной капустой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные треской с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Рис белый', 60), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: треской с бурым рисом и спаржей', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: треской с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: треской с басмати и кабачком', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: треской с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Рис басмати', 55), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные треской с киноа и цукини', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные треской с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые треской с булгуром и баклажаном', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые треской с булгуром и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Булгур', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные треской с кускусом и морковью', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные треской с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: треской с пшеном и перцем', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: треской с пшеном и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Пшено', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: треской с перловкой и помидорами', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: треской с перловкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Перловая крупа', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные треской с ячневой кашей и черри', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные треской с ячневой кашей и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Ячневая крупа', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые треской с полбой и шпинатом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые треской с полбой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Полба (спельта)', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные треской с макаронами и стручковой фасолью', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные треской с макаронами и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Треска', 160), ('Макароны (сухие)', 70), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: минтаем с гречкой и шампиньонами', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: минтаем с гречкой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Гречневая крупа', 60), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: минтаем с рисом и вешенками', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: минтаем с рисом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Рис белый', 60), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные минтаем с бурым рисом и тыквой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные минтаем с бурым рисом и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Рис бурый', 55), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые минтаем с басмати и капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые минтаем с басмати и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Рис басмати', 55), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные минтаем с киноа и пекинской капустой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные минтаем с киноа и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Киноа', 50), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: минтаем с булгуром и свёклой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: минтаем с булгуром и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Булгур', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: минтаем с кускусом и огурцом', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: минтаем с кускусом и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Кускус', 55), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные минтаем с пшеном и авокадо', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные минтаем с пшеном и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Пшено', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые минтаем с перловкой и рукколой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые минтаем с перловкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Перловая крупа', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные минтаем с ячневой кашей и салатом', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные минтаем с ячневой кашей и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Ячневая крупа', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: минтаем с полбой и брокколи', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: минтаем с полбой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Полба (спельта)', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: минтаем с макаронами и цветной капустой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: минтаем с макаронами и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Макароны (сухие)', 70), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные хеком с гречкой и спаржей', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные хеком с гречкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Гречневая крупа', 60), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые хеком с рисом и кабачком', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые хеком с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Рис белый', 60), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные хеком с бурым рисом и цукини', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные хеком с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: хеком с басмати и баклажаном', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: хеком с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Рис басмати', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: хеком с киноа и морковью', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: хеком с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные хеком с булгуром и перцем', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные хеком с булгуром и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Булгур', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые хеком с кускусом и помидорами', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые хеком с кускусом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Кускус', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные хеком с пшеном и черри', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные хеком с пшеном и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Пшено', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: хеком с перловкой и шпинатом', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: хеком с перловкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Перловая крупа', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: хеком с ячневой кашей и стручковой фасолью', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: хеком с ячневой кашей и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Ячневая крупа', 55), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные хеком с полбой и шампиньонами', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные хеком с полбой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Полба (спельта)', 55), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые хеком с макаронами и вешенками', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые хеком с макаронами и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хек', 160), ('Макароны (сухие)', 70), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные горбушей с гречкой и тыквой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные горбушей с гречкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Гречневая крупа', 60), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: горбушей с рисом и капустой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: горбушей с рисом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Рис белый', 60), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: горбушей с бурым рисом и пекинской капустой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: горбушей с бурым рисом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Рис бурый', 55), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные горбушей с басмати и свёклой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные горбушей с басмати и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Рис басмати', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые горбушей с киноа и огурцом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые горбушей с киноа и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Киноа', 50), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные горбушей с булгуром и авокадо', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные горбушей с булгуром и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Булгур', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: горбушей с кускусом и рукколой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: горбушей с кускусом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Кускус', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: горбушей с пшеном и салатом', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: горбушей с пшеном и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Пшено', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные горбушей с перловкой и брокколи', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные горбушей с перловкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Перловая крупа', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые горбушей с ячневой кашей и цветной капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые горбушей с ячневой кашей и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Ячневая крупа', 55), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные горбушей с полбой и спаржей', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные горбушей с полбой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Полба (спельта)', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: горбушей с макаронами и кабачком', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: горбушей с макаронами и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 150), ('Макароны (сухие)', 70), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сёмгой с гречкой и цукини', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сёмгой с гречкой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Гречневая крупа', 60), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сёмгой с рисом и баклажаном', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сёмгой с рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Рис белый', 60), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые сёмгой с бурым рисом и морковью', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые сёмгой с бурым рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Рис бурый', 55), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные сёмгой с басмати и перцем', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные сёмгой с басмати и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Рис басмати', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: сёмгой с киноа и помидорами', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: сёмгой с киноа и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Киноа', 50), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сёмгой с булгуром и черри', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сёмгой с булгуром и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Булгур', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сёмгой с кускусом и шпинатом', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сёмгой с кускусом и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Кускус', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые сёмгой с пшеном и стручковой фасолью', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые сёмгой с пшеном и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Пшено', 55), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные сёмгой с перловкой и шампиньонами', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные сёмгой с перловкой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Перловая крупа', 55), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: сёмгой с ячневой кашей и вешенками', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: сёмгой с ячневой кашей и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Ячневая крупа', 55), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сёмгой с полбой и тыквой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сёмгой с полбой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Полба (спельта)', 55), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сёмгой с макаронами и капустой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сёмгой с макаронами и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 140), ('Макароны (сухие)', 70), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые форелью с гречкой и пекинской капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые форелью с гречкой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Гречневая крупа', 60), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные форелью с рисом и свёклой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные форелью с рисом и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Рис белый', 60), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: форелью с бурым рисом и огурцом', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: форелью с бурым рисом и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Рис бурый', 55), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: форелью с басмати и авокадо', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: форелью с басмати и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Рис басмати', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные форелью с киноа и рукколой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные форелью с киноа и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Киноа', 50), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые форелью с булгуром и салатом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые форелью с булгуром и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Булгур', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные форелью с кускусом и брокколи', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные форелью с кускусом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Кускус', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: форелью с пшеном и цветной капустой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: форелью с пшеном и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Пшено', 55), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: форелью с перловкой и спаржей', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: форелью с перловкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Перловая крупа', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные форелью с ячневой кашей и кабачком', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные форелью с ячневой кашей и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Ячневая крупа', 55), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые форелью с полбой и цукини', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые форелью с полбой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Полба (спельта)', 55), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные форелью с макаронами и баклажаном', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные форелью с макаронами и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 150), ('Макароны (сухие)', 70), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: скумбрией с гречкой и морковью', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: скумбрией с гречкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Гречневая крупа', 60), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: скумбрией с рисом и перцем', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: скумбрией с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Рис белый', 60), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные скумбрией с бурым рисом и помидорами', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные скумбрией с бурым рисом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Рис бурый', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые скумбрией с басмати и черри', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые скумбрией с басмати и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Рис басмати', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные скумбрией с киноа и шпинатом', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные скумбрией с киноа и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Киноа', 50), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: скумбрией с булгуром и стручковой фасолью', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: скумбрией с булгуром и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Булгур', 55), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: скумбрией с кускусом и шампиньонами', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: скумбрией с кускусом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Кускус', 55), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные скумбрией с пшеном и вешенками', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные скумбрией с пшеном и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Пшено', 55), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые скумбрией с перловкой и тыквой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые скумбрией с перловкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Перловая крупа', 55), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные скумбрией с ячневой кашей и капустой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные скумбрией с ячневой кашей и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Ячневая крупа', 55), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: скумбрией с полбой и пекинской капустой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: скумбрией с полбой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Полба (спельта)', 55), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: скумбрией с макаронами и свёклой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: скумбрией с макаронами и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Скумбрия', 140), ('Макароны (сухие)', 70), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные судаком с гречкой и огурцом', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные судаком с гречкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Гречневая крупа', 60), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые судаком с рисом и авокадо', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые судаком с рисом и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Рис белый', 60), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные судаком с бурым рисом и рукколой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные судаком с бурым рисом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Рис бурый', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: судаком с басмати и салатом', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: судаком с басмати и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Рис басмати', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: судаком с киноа и брокколи', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: судаком с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные судаком с булгуром и цветной капустой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные судаком с булгуром и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Булгур', 55), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые судаком с кускусом и спаржей', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые судаком с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные судаком с пшеном и кабачком', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные судаком с пшеном и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Пшено', 55), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: судаком с перловкой и цукини', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: судаком с перловкой и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Перловая крупа', 55), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: судаком с ячневой кашей и баклажаном', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: судаком с ячневой кашей и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Ячневая крупа', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные судаком с полбой и морковью', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные судаком с полбой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Полба (спельта)', 55), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые судаком с макаронами и перцем', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые судаком с макаронами и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 160), ('Макароны (сухие)', 70), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные дорадой с гречкой и помидорами', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные дорадой с гречкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Гречневая крупа', 60), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: дорадой с рисом и черри', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: дорадой с рисом и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Рис белый', 60), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: дорадой с бурым рисом и шпинатом', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: дорадой с бурым рисом и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Рис бурый', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные дорадой с басмати и стручковой фасолью', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные дорадой с басмати и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Рис басмати', 55), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые дорадой с киноа и шампиньонами', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые дорадой с киноа и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Киноа', 50), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные дорадой с булгуром и вешенками', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные дорадой с булгуром и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Булгур', 55), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: дорадой с кускусом и тыквой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: дорадой с кускусом и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Кускус', 55), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: дорадой с пшеном и капустой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: дорадой с пшеном и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Пшено', 55), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные дорадой с перловкой и пекинской капустой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные дорадой с перловкой и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Перловая крупа', 55), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые дорадой с ячневой кашей и свёклой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые дорадой с ячневой кашей и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Ячневая крупа', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные дорадой с полбой и огурцом', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные дорадой с полбой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Полба (спельта)', 55), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: дорадой с макаронами и авокадо', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: дорадой с макаронами и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 180), ('Макароны (сухие)', 70), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сибасом с гречкой и рукколой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сибасом с гречкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Гречневая крупа', 60), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сибасом с рисом и салатом', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сибасом с рисом и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Рис белый', 60), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые сибасом с бурым рисом и брокколи', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые сибасом с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные сибасом с басмати и цветной капустой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные сибасом с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Рис басмати', 55), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: сибасом с киноа и спаржей', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: сибасом с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сибасом с булгуром и кабачком', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сибасом с булгуром и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Булгур', 55), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сибасом с кускусом и цукини', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сибасом с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые сибасом с пшеном и баклажаном', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые сибасом с пшеном и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Пшено', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные сибасом с перловкой и морковью', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные сибасом с перловкой и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Перловая крупа', 55), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: сибасом с ячневой кашей и перцем', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: сибасом с ячневой кашей и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Ячневая крупа', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: сибасом с полбой и помидорами', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: сибасом с полбой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Полба (спельта)', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные сибасом с макаронами и черри', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные сибасом с макаронами и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 170), ('Макароны (сухие)', 70), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые тилапией с гречкой и шпинатом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые тилапией с гречкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Гречневая крупа', 60), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тилапией с рисом и стручковой фасолью', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тилапией с рисом и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Рис белый', 60), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: тилапией с бурым рисом и шампиньонами', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: тилапией с бурым рисом и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Рис бурый', 55), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: тилапией с басмати и вешенками', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: тилапией с басмати и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Рис басмати', 55), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные тилапией с киноа и тыквой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные тилапией с киноа и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Киноа', 50), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые тилапией с булгуром и капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые тилапией с булгуром и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Булгур', 55), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тилапией с кускусом и пекинской капустой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тилапией с кускусом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Кускус', 55), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: тилапией с пшеном и свёклой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: тилапией с пшеном и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Пшено', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: тилапией с перловкой и огурцом', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: тилапией с перловкой и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Перловая крупа', 55), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные тилапией с ячневой кашей и авокадо', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные тилапией с ячневой кашей и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Ячневая крупа', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые тилапией с полбой и рукколой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые тилапией с полбой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Полба (спельта)', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тилапией с макаронами и салатом', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тилапией с макаронами и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Макароны (сухие)', 70), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: камбалой с гречкой и брокколи', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: камбалой с гречкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Гречневая крупа', 60), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: камбалой с рисом и цветной капустой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: камбалой с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Рис белый', 60), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные камбалой с бурым рисом и спаржей', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные камбалой с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые камбалой с басмати и кабачком', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые камбалой с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Рис басмати', 55), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные камбалой с киноа и цукини', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные камбалой с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: камбалой с булгуром и баклажаном', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: камбалой с булгуром и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Булгур', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: камбалой с кускусом и морковью', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: камбалой с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные камбалой с пшеном и перцем', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные камбалой с пшеном и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Пшено', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые камбалой с перловкой и помидорами', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые камбалой с перловкой и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Перловая крупа', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные камбалой с ячневой кашей и черри', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные камбалой с ячневой кашей и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Ячневая крупа', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: камбалой с полбой и шпинатом', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: камбалой с полбой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Полба (спельта)', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: камбалой с макаронами и стручковой фасолью', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: камбалой с макаронами и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Макароны (сухие)', 70), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные пангасиусом с гречкой и шампиньонами', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные пангасиусом с гречкой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Гречневая крупа', 60), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые пангасиусом с рисом и вешенками', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые пангасиусом с рисом и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Рис белый', 60), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные пангасиусом с бурым рисом и тыквой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные пангасиусом с бурым рисом и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Рис бурый', 55), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: пангасиусом с басмати и капустой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: пангасиусом с басмати и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Рис басмати', 55), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: пангасиусом с киноа и пекинской капустой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: пангасиусом с киноа и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Киноа', 50), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные пангасиусом с булгуром и свёклой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные пангасиусом с булгуром и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Булгур', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые пангасиусом с кускусом и огурцом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые пангасиусом с кускусом и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Кускус', 55), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные пангасиусом с пшеном и авокадо', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные пангасиусом с пшеном и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Пшено', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: пангасиусом с перловкой и рукколой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: пангасиусом с перловкой и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Перловая крупа', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: пангасиусом с ячневой кашей и салатом', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: пангасиусом с ячневой кашей и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Ячневая крупа', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные пангасиусом с полбой и брокколи', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные пангасиусом с полбой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Полба (спельта)', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые пангасиусом с макаронами и цветной капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые пангасиусом с макаронами и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Макароны (сухие)', 70), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тунцом с гречкой и спаржей', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тунцом с гречкой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Гречневая крупа', 60), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: тунцом с рисом и кабачком', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: тунцом с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Рис белый', 60), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: тунцом с бурым рисом и цукини', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: тунцом с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные тунцом с басмати и баклажаном', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные тунцом с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Рис басмати', 55), ('Баклажан', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые тунцом с киноа и морковью', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые тунцом с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тунцом с булгуром и перцем', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тунцом с булгуром и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Булгур', 55), ('Перец болгарский', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: тунцом с кускусом и помидорами', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: тунцом с кускусом и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Кускус', 55), ('Помидоры', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: тунцом с пшеном и черри', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: тунцом с пшеном и черри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Пшено', 55), ('Помидоры черри', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные тунцом с перловкой и шпинатом', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные тунцом с перловкой и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Перловая крупа', 55), ('Шпинат', 80), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые тунцом с ячневой кашей и стручковой фасолью', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые тунцом с ячневой кашей и стручковой фасолью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Ячневая крупа', 55), ('Стручковая фасоль', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные тунцом с полбой и шампиньонами', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные тунцом с полбой и шампиньонами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Полба (спельта)', 55), ('Шампиньоны', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: тунцом с макаронами и вешенками', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: тунцом с макаронами и вешенками'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Макароны (сухие)', 70), ('Грибы вешенки', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кетой с гречкой и тыквой', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кетой с гречкой и тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Гречневая крупа', 60), ('Тыква', 150), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кетой с рисом и капустой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кетой с рисом и капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Рис белый', 60), ('Капуста белокочанная', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кетой с бурым рисом и пекинской капустой', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кетой с бурым рисом и пекинской капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Рис бурый', 55), ('Капуста пекинская', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные кетой с басмати и свёклой', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные кетой с басмати и свёклой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Рис басмати', 55), ('Свёкла', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: кетой с киноа и огурцом', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: кетой с киноа и огурцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Киноа', 50), ('Огурцы', 100), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кетой с булгуром и авокадо', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кетой с булгуром и авокадо'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Булгур', 55), ('Авокадо', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кетой с кускусом и рукколой', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кетой с кускусом и рукколой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Кускус', 55), ('Руккола', 50), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённые кетой с пшеном и салатом', 'Рыбное блюдо (в духовке)', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённые кетой с пшеном и салатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Пшено', 55), ('Салат листовой', 60), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тушёные кетой с перловкой и брокколи', 'Рыбное блюдо (тушёные)', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тушёные кетой с перловкой и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Перловая крупа', 55), ('Брокколи', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На пару: кетой с ячневой кашей и цветной капустой', 'Рыбное блюдо (на пару)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На пару: кетой с ячневой кашей и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Ячневая крупа', 55), ('Цветная капуста', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'На гриле: кетой с полбой и спаржей', 'Рыбное блюдо (на гриле)', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('На гриле: кетой с полбой и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Полба (спельта)', 55), ('Спаржа', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жареные кетой с макаронами и кабачком', 'Рыбное блюдо (на сковороде)', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жареные кетой с макаронами и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кета', 150), ('Макароны (сухие)', 70), ('Кабачок', 120), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис белый', 60), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с бурым рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с бурым рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис бурый', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с басмати и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с басмати и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Рис басмати', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с киноа и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с киноа и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Киноа', 50), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с кускусом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с кускусом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Кускус', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Креветками с спагетти и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Креветками с спагетти и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 140), ('Спагетти', 70), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис белый', 60), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с бурым рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с бурым рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис бурый', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с басмати и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с басмати и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Рис басмати', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с киноа и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с киноа и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Киноа', 50), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с кускусом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с кускусом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Кускус', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмаром с спагетти и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмаром с спагетти и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 150), ('Спагетти', 70), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис белый', 60), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с бурым рисом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с бурым рисом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис бурый', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с басмати и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с басмати и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Рис басмати', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с киноа и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с киноа и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Киноа', 50), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с кускусом и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с кускусом и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Кускус', 55), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и брокколи', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Брокколи', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и цветной капустой', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и цветной капустой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Цветная капуста', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и спаржей', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и спаржей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Спаржа', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и кабачком', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и кабачком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Кабачок', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и цукини', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и цукини'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Кабачки цукини', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и баклажаном', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и баклажаном'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Баклажан', 120), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и морковью', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и морковью'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Морковь', 80), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидиями с спагетти и перцем', 'Морепродукты с гарниром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидиями с спагетти и перцем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 180), ('Спагетти', 70), ('Перец болгарский', 100), ('Оливковое масло', 8), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 2,5% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 2,5% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 2,5%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на молоке 3,2% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на молоке 3,2% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Молоко 3,2%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсянка на воде с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсянка на воде с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 55), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 2,5% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 2,5% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 2,5%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на молоке 3,2% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на молоке 3,2% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Молоко 3,2%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречневая каша на воде с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречневая каша на воде с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 55), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 2,5% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 2,5% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 2,5%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на молоке 3,2% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на молоке 3,2% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша на воде с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша на воде с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с клубникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с клубникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Клубника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с малиной', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с малиной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Малина', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с черникой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с черникой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Черника', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с курагой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с изюмом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Изюм', 25), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с черносливом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с черносливом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Чернослив', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с грецким орехом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с грецким орехом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Грецкий орех', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с миндалём', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с миндалём'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Миндаль', 15), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с тыквой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Тыква', 100), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с мёдом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Мёд', 12), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 2,5% с арахисовой пастой', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 2,5% с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 2,5%', 200), ('Арахисовая паста', 15), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 3,2% с бананом', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 3,2% с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 3,2%', 200), ('Банан', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 3,2% с яблоком', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 3,2% с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 3,2%', 200), ('Яблоко', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 3,2% с грушей', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 3,2% с грушей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 3,2%', 200), ('Груша', 80), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пшённая каша на молоке 3,2% с ягодами', 'Каша на завтрак', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пшённая каша на молоке 3,2% с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 55), ('Молоко 3,2%', 200), ('Ягоды замороженные (смесь)', 70), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

COMMIT;
