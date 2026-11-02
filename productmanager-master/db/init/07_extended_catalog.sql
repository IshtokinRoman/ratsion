-- Расширенный каталог продуктов и блюд (идемпотентно)
-- КБЖУ на 100 г; ингредиенты — граммы на порцию
BEGIN;

INSERT INTO product (name, category, calories, protein, fat, carbohydrates)
SELECT v.name, v.category, v.calories, v.protein, v.fat, v.carbohydrates
FROM (VALUES
  ('Ячневые хлопья', 'GRAINS', 340, 11, 2.5, 68),
  ('Полба (спельта)', 'GRAINS', 338, 14.6, 2.4, 70),
  ('Амарант', 'GRAINS', 371, 13.6, 7, 65),
  ('Рис жасмин', 'GRAINS', 350, 7, 0.6, 80),
  ('Рис басмати', 'GRAINS', 350, 7.5, 0.6, 78),
  ('Овсяные отруби', 'GRAINS', 246, 17, 7, 66),
  ('Пшеничные отруби', 'GRAINS', 165, 16, 3.8, 16.6),
  ('Макароны цельнозерновые', 'PASTA', 330, 13, 2.5, 65),
  ('Спагетти', 'PASTA', 344, 10.4, 1.1, 71.5),
  ('Лапша яичная (сухая)', 'PASTA', 384, 14, 4.4, 71),
  ('Тортилья пшеничная', 'BREAD', 312, 8.5, 7.5, 52),
  ('Багет', 'BREAD', 274, 9, 1.5, 55),
  ('Чиабатта', 'BREAD', 271, 9, 3.5, 50),
  ('Творог 2%', 'DAIRY', 103, 18, 2, 3.3),
  ('Творожная масса 5%', 'DAIRY', 180, 7.5, 5, 25),
  ('Сырок глазированный', 'DAIRY', 407, 8.5, 25, 36),
  ('Сыр творожный', 'DAIRY', 223, 6, 20, 4),
  ('Сыр гауда', 'DAIRY', 356, 25, 27, 2.2),
  ('Сыр чеддер', 'DAIRY', 402, 25, 33, 1.3),
  ('Сыр фета', 'DAIRY', 264, 14, 21, 4),
  ('Пармезан', 'DAIRY', 392, 33, 26, 3.2),
  ('Рикотта', 'DAIRY', 174, 11, 13, 3),
  ('Молоко топлёное 4%', 'DAIRY', 67, 3, 4, 4.7),
  ('Айран', 'DAIRY', 24, 1.5, 1, 2),
  ('Снежок', 'DAIRY', 80, 2.8, 2.5, 12),
  ('Яйцо варёное', 'EGGS', 155, 12.6, 10.6, 1.1),
  ('Куриные крылья', 'MEAT', 186, 19, 12, 0),
  ('Куриный фарш', 'MEAT', 143, 17.7, 8.1, 0),
  ('Индейка (голень)', 'MEAT', 144, 19, 7.2, 0),
  ('Индейка (фарш)', 'MEAT', 148, 20, 7.5, 0),
  ('Говядина (вырезка)', 'MEAT', 137, 20, 6, 0),
  ('Говяжьи котлеты (сырые)', 'MEAT', 220, 15, 17, 2),
  ('Свиная вырезка', 'MEAT', 142, 21, 6.5, 0),
  ('Свиные рёбра', 'MEAT', 321, 15, 28, 0),
  ('Бекон', 'MEAT', 500, 12, 45, 0.5),
  ('Ветчина', 'MEAT', 145, 18, 8, 1),
  ('Буженина', 'MEAT', 233, 15, 19, 0),
  ('Кролик', 'MEAT', 183, 21, 11, 0),
  ('Утка (филе)', 'MEAT', 240, 18, 18, 0),
  ('Сердце куриное', 'MEAT', 159, 16, 10, 0.8),
  ('Куриный желудочек', 'MEAT', 114, 21, 3.7, 0.6),
  ('Дорада', 'FISH', 96, 18, 3, 0),
  ('Сибас', 'FISH', 97, 18.4, 3, 0),
  ('Пангасиус', 'FISH', 89, 15.5, 3, 0),
  ('Тилапия', 'FISH', 96, 20, 1.7, 0),
  ('Камбала', 'FISH', 83, 16.5, 1.8, 0),
  ('Сельдь слабосолёная', 'FISH', 161, 18, 9.5, 0),
  ('Горбуша консервированная', 'FISH', 136, 21, 6, 0),
  ('Шпроты в масле', 'FISH', 363, 17, 32, 0),
  ('Икра красная', 'FISH', 249, 32, 15, 0),
  ('Осьминог', 'SEAFOOD', 82, 15, 1, 2),
  ('Гребешок', 'SEAFOOD', 88, 17, 0.8, 2),
  ('Батат', 'VEGETABLES', 86, 1.6, 0.1, 20),
  ('Свекла варёная', 'VEGETABLES', 49, 1.8, 0.1, 10),
  ('Картофель варёный', 'VEGETABLES', 82, 2, 0.4, 16.7),
  ('Капуста пекинская', 'VEGETABLES', 16, 1.2, 0.2, 2),
  ('Капуста краснокочанная', 'VEGETABLES', 26, 1.4, 0.1, 5.5),
  ('Капуста брюссельская', 'VEGETABLES', 43, 3.4, 0.3, 5.2),
  ('Спаржа', 'VEGETABLES', 21, 2.2, 0.1, 3.1),
  ('Артишок', 'VEGETABLES', 47, 3.3, 0.2, 6),
  ('Сельдерей стеблевой', 'VEGETABLES', 13, 0.9, 0.1, 2.1),
  ('Фенхель', 'VEGETABLES', 31, 1.2, 0.2, 4),
  ('Имбирь свежий', 'VEGETABLES', 80, 1.8, 0.8, 16),
  ('Авокадо', 'VEGETABLES', 160, 2, 14.7, 1.8),
  ('Кукуруза свежая', 'VEGETABLES', 86, 3.3, 1.4, 16.3),
  ('Горошек свежий', 'VEGETABLES', 81, 5.4, 0.4, 13.3),
  ('Руккола', 'VEGETABLES', 25, 2.6, 0.7, 2.1),
  ('Салат айсберг', 'VEGETABLES', 14, 0.9, 0.1, 2),
  ('Салат листовой', 'VEGETABLES', 17, 1.4, 0.2, 2),
  ('Помидоры черри', 'VEGETABLES', 18, 0.9, 0.2, 2.8),
  ('Корнишоны', 'VEGETABLES', 14, 0.8, 0.1, 2.5),
  ('Тыква мускатная', 'VEGETABLES', 45, 1, 0.1, 10),
  ('Кабачки цукини', 'VEGETABLES', 17, 1.2, 0.3, 2.5),
  ('Грибы вешенки', 'VEGETABLES', 33, 3.3, 0.4, 3.8),
  ('Грибы белые свежие', 'VEGETABLES', 34, 3.7, 1.7, 1.1),
  ('Грибы лисички', 'VEGETABLES', 20, 1.5, 1, 1),
  ('Маш (сухой)', 'LEGUMES', 300, 24, 1.2, 46),
  ('Чёрная фасоль (сухая)', 'LEGUMES', 341, 21.6, 1.4, 62),
  ('Эдамаме', 'LEGUMES', 122, 11, 5, 10),
  ('Горох консервированный', 'LEGUMES', 69, 4.9, 0.4, 10),
  ('Нут консервированный', 'LEGUMES', 119, 7, 2.5, 17),
  ('Чечевица варёная', 'LEGUMES', 116, 9, 0.4, 20),
  ('Хурма', 'FRUITS', 67, 0.5, 0.2, 15.9),
  ('Гранат', 'FRUITS', 72, 0.7, 0.6, 14.5),
  ('Инжир свежий', 'FRUITS', 74, 0.8, 0.3, 16),
  ('Инжир сушёный', 'FRUITS', 257, 3.1, 0.8, 58),
  ('Финики', 'FRUITS', 282, 2.5, 0.4, 70),
  ('Ананас', 'FRUITS', 49, 0.4, 0.1, 11.8),
  ('Манго', 'FRUITS', 60, 0.8, 0.4, 13.5),
  ('Нектарин', 'FRUITS', 44, 1.1, 0.3, 9),
  ('Абрикос', 'FRUITS', 44, 0.9, 0.1, 9),
  ('Дыня', 'FRUITS', 35, 0.6, 0.3, 7.3),
  ('Арбуз', 'FRUITS', 30, 0.6, 0.1, 7.1),
  ('Лимон', 'FRUITS', 29, 1.1, 0.3, 3),
  ('Лайм', 'FRUITS', 30, 0.7, 0.2, 7.7),
  ('Кокос мякоть', 'FRUITS', 354, 3.3, 33.5, 6.2),
  ('Облепиха', 'BERRIES', 82, 1.2, 5.4, 5.7),
  ('Брусника', 'BERRIES', 46, 0.7, 0.5, 8.2),
  ('Ежевика', 'BERRIES', 43, 1.4, 0.5, 5.4),
  ('Голубика', 'BERRIES', 57, 0.7, 0.3, 12.1),
  ('Крыжовник', 'BERRIES', 44, 0.7, 0.2, 9.1),
  ('Фисташки', 'NUTS', 560, 20, 45, 17),
  ('Бразильский орех', 'NUTS', 659, 14, 67, 4),
  ('Пекан', 'NUTS', 691, 9, 72, 4),
  ('Кунжут', 'NUTS', 565, 19, 49, 12),
  ('Тахини', 'NUTS', 595, 17, 54, 21),
  ('Хумус', 'LEGUMES', 166, 8, 10, 14),
  ('Кокосовое масло', 'OIL', 899, 0, 99.9, 0),
  ('Кунжутное масло', 'OIL', 899, 0, 99.9, 0),
  ('Горчица', 'SAUCES', 162, 5.7, 10, 8),
  ('Хрен', 'SAUCES', 92, 2.5, 0.5, 16),
  ('Аджика', 'SAUCES', 59, 1, 0.5, 12),
  ('Песто', 'SAUCES', 392, 5, 40, 5),
  ('Теріяки соус', 'SAUCES', 89, 5.9, 0, 12),
  ('Уксус бальзамический', 'SAUCES', 88, 0.5, 0, 17),
  ('Патока', 'SWEETS', 290, 0, 0, 75),
  ('Кленовый сироп', 'SWEETS', 260, 0, 0, 67),
  ('Стевия (порошок)', 'SWEETS', 0, 0, 0, 0),
  ('Какао-порошок', 'SWEETS', 289, 24, 15, 11),
  ('Белый шоколад', 'SWEETS', 541, 6, 32, 58),
  ('Молочный шоколад', 'SWEETS', 535, 7, 30, 57),
  ('Мармелад', 'SWEETS', 293, 0.4, 0.1, 76),
  ('Пастила', 'SWEETS', 310, 0.5, 0, 80),
  ('Вафли', 'SWEETS', 540, 3.5, 30, 65),
  ('Халва подсолнечная', 'SWEETS', 516, 11.6, 29.7, 54),
  ('Компот из сухофруктов', 'BEVERAGES', 60, 0.5, 0, 15),
  ('Кисель ягодный', 'BEVERAGES', 53, 0.2, 0, 13),
  ('Морс клюквенный', 'BEVERAGES', 36, 0.2, 0.1, 8.5),
  ('Смузи зелёный (база)', 'BEVERAGES', 45, 1.5, 0.5, 8),
  ('Какао на молоке', 'BEVERAGES', 85, 3.2, 2.8, 12),
  ('Вода минеральная', 'BEVERAGES', 0, 0, 0, 0),
  ('Квас хлебный', 'BEVERAGES', 27, 0.2, 0, 5.2)
) AS v(name, category, calories, protein, fat, carbohydrates)
WHERE NOT EXISTS (SELECT 1 FROM product x WHERE lower(x.name) = lower(v.name));

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Сырники запечённые', 'Творожные сырники в духовке со сметаной', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Сырники запечённые'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Творог 5%', 180), ('Яйцо куриное', 50), ('Мука пшеничная', 30), ('Сахар', 10), ('Сметана 15%', 30)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Омлет с сыром и помидорами', 'Пышный омлет с сыром и помидорами', 15
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Омлет с сыром и помидорами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Яйцо куриное', 120), ('Молоко 2,5%', 40), ('Сыр моцарелла', 40), ('Помидоры', 80), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Яичница с беконом и тостами', 'Глазунья, бекон и цельнозерновой тост', 12
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Яичница с беконом и тостами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Яйцо куриное', 100), ('Бекон', 40), ('Хлеб цельнозерновой', 40), ('Помидоры черри', 60)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Каша пшённая с тыквой', 'Пшено с тыквой на молоке', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Каша пшённая с тыквой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пшено', 60), ('Тыква', 120), ('Молоко 2,5%', 180), ('Масло сливочное 82,5%', 8), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Каша кукурузная на молоке', 'Нежная кукурузная каша', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Каша кукурузная на молоке'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кукурузная крупа', 55), ('Молоко 3,2%', 200), ('Масло сливочное 82,5%', 8), ('Сахар', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гранола с йогуртом и ягодами', 'Домашняя подача гранолы с йогуртом', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гранола с йогуртом и ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 50), ('Греческий йогурт 2%', 150), ('Ягоды замороженные (смесь)', 80), ('Мёд', 12), ('Миндаль', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тосты с авокадо и яйцом', 'Цельнозерновой хлеб, авокадо и яйцо пашот', 15
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тосты с авокадо и яйцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хлеб цельнозерновой', 60), ('Авокадо', 70), ('Яйцо куриное', 50), ('Помидоры черри', 50), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Блинчики на молоке с творогом', 'Тонкие блины с творожной начинкой', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Блинчики на молоке с творогом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мука пшеничная', 70), ('Молоко 2,5%', 150), ('Яйцо куриное', 50), ('Творог 5%', 100), ('Сахар', 15), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовая каша с курагой', 'Молочный рис с курагой', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовая каша с курагой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 55), ('Молоко 3,2%', 200), ('Курага', 30), ('Масло сливочное 82,5%', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Смузи боул с бананом', 'Густой смузи из банана, ягод и йогурта', 8
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Смузи боул с бананом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Банан', 120), ('Ягоды замороженные (смесь)', 100), ('Греческий йогурт 2%', 120), ('Овсяные хлопья', 20), ('Семена чиа', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Творожная запеканка с изюмом', 'Запеканка из творога с изюмом', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Творожная запеканка с изюмом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Творог 5%', 200), ('Яйцо куриное', 50), ('Манная крупа', 30), ('Изюм', 25), ('Сахар', 15), ('Сметана 15%', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Каша из полбы с яблоком', 'Полба на воде с яблоком и корицей', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Каша из полбы с яблоком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Полба (спельта)', 60), ('Яблоко', 100), ('Мёд', 10), ('Грецкий орех', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Вареники с картофелем (порция)', 'Отварные вареники со сметаной', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Вареники с картофелем (порция)'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мука пшеничная', 70), ('Картофель', 120), ('Лук репчатый', 40), ('Яйцо куриное', 25), ('Сметана 15%', 30), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсяноблин с сыром', 'Овсяный блин с сыром и зеленью', 12
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсяноблин с сыром'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 40), ('Яйцо куриное', 50), ('Молоко 2,5%', 40), ('Сыр российский', 30), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Ячневая каша с маслом', 'Рассыпчатая ячневая каша', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Ячневая каша с маслом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Ячневая крупа', 60), ('Масло сливочное 82,5%', 10), ('Молоко 2,5%', 50)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Куриные котлеты на пару с гречкой', 'Паровые котлеты из куриного фарша с гречкой', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Куриные котлеты на пару с гречкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриный фарш', 150), ('Яйцо куриное', 25), ('Хлеб пшеничный', 20), ('Гречневая крупа', 60), ('Лук репчатый', 30)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Стейк из индейки с бататом', 'Запечённая индейка и батат', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Стейк из индейки с бататом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 160), ('Батат', 180), ('Оливковое масло', 8), ('Чеснок', 5), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Говядина тушёная с овощами', 'Тушёная говядина с морковью и луком', 90
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Говядина тушёная с овощами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 160), ('Морковь', 80), ('Лук репчатый', 60), ('Томатная паста', 15), ('Подсолнечное масло', 8), ('Картофель', 100)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Свиная вырезка с гречкой', 'Запечённая вырезка и гарнир из гречки', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Свиная вырезка с гречкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свиная вырезка', 150), ('Гречневая крупа', 60), ('Подсолнечное масло', 5), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Курица терияки с рисом', 'Филе в соусе терияки с рисом', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Курица терияки с рисом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Рис белый', 60), ('Теріяки соус', 25), ('Кунжут', 5), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Фрикадельки в томатном соусе с пастой', 'Мясные фрикадельки и спагетти', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Фрикадельки в томатном соусе с пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свино-говяжий фарш', 140), ('Спагетти', 70), ('Томатная паста', 25), ('Лук репчатый', 40), ('Чеснок', 5), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Плов с курицей', 'Рассыпчатый плов с курицей и морковью', 60
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Плов с курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис белый', 70), ('Куриное бедро без кожи', 150), ('Морковь', 80), ('Лук репчатый', 50), ('Подсолнечное масло', 12), ('Чеснок', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Лазанья мясная (порция)', 'Слоёная лазанья с фаршем и сыром', 70
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Лазанья мясная (порция)'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Макароны (сухие)', 60), ('Говяжий фарш', 120), ('Сыр моцарелла', 50), ('Томатная паста', 30), ('Молоко 2,5%', 80), ('Мука пшеничная', 10), ('Лук репчатый', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Бефстроганов с пюре', 'Говядина в сметанном соусе с картофельным пюре', 50
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Бефстроганов с пюре'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (вырезка)', 150), ('Сметана 15%', 40), ('Лук репчатый', 50), ('Картофель', 180), ('Масло сливочное 82,5%', 10), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Куриный стейк с киноа и овощами', 'Гриль-филе, киноа и овощи гриль', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Куриный стейк с киноа и овощами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 160), ('Киноа', 50), ('Перец болгарский', 80), ('Кабачки цукини', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кролик тушёный со сметаной', 'Кролик в сметанном соусе с рисом', 80
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кролик тушёный со сметаной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кролик', 160), ('Сметана 15%', 40), ('Лук репчатый', 40), ('Рис белый', 55), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Индейка с брокколи и рисом бурым', 'Диетический ужин с индейкой', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Индейка с брокколи и рисом бурым'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Брокколи', 150), ('Рис бурый', 55), ('Оливковое масло', 7)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Котлета по-киевски с картофелем', 'Классика с картофельным гарниром', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Котлета по-киевски с картофелем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 150), ('Масло сливочное 82,5%', 20), ('Хлеб пшеничный', 30), ('Яйцо куриное', 25), ('Картофель', 180), ('Подсолнечное масло', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Чахохбили из курицы', 'Курица в томатно-луковом соусе с хлебом', 55
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Чахохбили из курицы'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Курица (целая тушка)', 180), ('Помидоры', 150), ('Лук репчатый', 80), ('Перец болгарский', 60), ('Хлеб пшеничный', 40), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тефтели с рисом в соусе', 'Тефтели из фарша с рисовым гарниром', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тефтели с рисом в соусе'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говяжий фарш', 120), ('Рис белый', 80), ('Яйцо куриное', 25), ('Лук репчатый', 40), ('Томатная паста', 20), ('Сметана 15%', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Жаркое по-домашнему', 'Мясо, картофель и овощи в горшочке', 70
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Жаркое по-домашнему'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свинина (мякоть)', 140), ('Картофель', 180), ('Морковь', 60), ('Лук репчатый', 50), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Фахитас с курицей', 'Курица с овощами в тортилье', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Фахитас с курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 140), ('Тортилья пшеничная', 60), ('Перец болгарский', 100), ('Лук репчатый', 50), ('Помидоры', 60), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Паста карбонара', 'Спагетти с беконом и сыром', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Паста карбонара'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Спагетти', 80), ('Бекон', 50), ('Яйцо куриное', 50), ('Пармезан', 30), ('Чеснок', 3)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Паста болоньезе', 'Спагетти с мясным соусом', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Паста болоньезе'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Спагетти', 80), ('Говяжий фарш', 120), ('Томатная паста', 30), ('Лук репчатый', 40), ('Морковь', 40), ('Пармезан', 20), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рис с овощами и тофу', 'Растительный боул с тофу', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рис с овощами и тофу'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Рис бурый', 60), ('Тофу', 120), ('Брокколи', 100), ('Морковь', 60), ('Соевый соус', 15), ('Кунжутное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Чечевица с овощами и курицей', 'Тёплая чечевица с куриным филе', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Чечевица с овощами и курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Чечевица (сухая)', 60), ('Куриное филе (грудка)', 120), ('Морковь', 60), ('Лук репчатый', 40), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Нут с овощами карри', 'Нут в пряном томатном соусе с рисом', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Нут с овощами карри'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Нут (сухой)', 60), ('Рис белый', 55), ('Помидоры', 120), ('Лук репчатый', 40), ('Чеснок', 5), ('Кокосовое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Фаршированный перец', 'Перец с мясным фаршем и рисом', 60
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Фаршированный перец'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Перец болгарский', 200), ('Говяжий фарш', 120), ('Рис белый', 40), ('Лук репчатый', 40), ('Томатная паста', 20), ('Сметана 15%', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Голубцы ленивые', 'Запеканка из капусты и фарша', 50
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Голубцы ленивые'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Капуста белокочанная', 150), ('Говяжий фарш', 120), ('Рис белый', 40), ('Лук репчатый', 40), ('Яйцо куриное', 50), ('Сметана 15%', 25), ('Томатная паста', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Шашлык куриный с лавашом', 'Запечённые куриные кусочки с лавашом и овощами', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Шашлык куриный с лавашом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 160), ('Лаваш тонкий', 50), ('Помидоры', 80), ('Лук репчатый', 40), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Люля-кебаб с рисом', 'Люля из фарша с гарниром', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Люля-кебаб с рисом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Баранина', 140), ('Лук репчатый', 40), ('Рис белый', 60), ('Зелень (укроп, петрушка)', 10), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Печень куриная с луком и гречкой', 'Классический гарнир к печени', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Печень куриная с луком и гречкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриная печень', 150), ('Лук репчатый', 70), ('Гречневая крупа', 60), ('Подсолнечное масло', 10), ('Сметана 15%', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Сердечки куриные с пюре', 'Тушёные сердечки и картофельное пюре', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Сердечки куриные с пюре'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сердце куриное', 150), ('Картофель', 180), ('Лук репчатый', 40), ('Сметана 15%', 25), ('Масло сливочное 82,5%', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Дорада запечённая с овощами', 'Целая дорада с овощами', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Дорада запечённая с овощами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Дорада', 200), ('Лимон', 30), ('Помидоры черри', 80), ('Кабачки цукини', 100), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Сибас на гриле с киноа', 'Сибас и гарнир из киноа', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Сибас на гриле с киноа'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сибас', 180), ('Киноа', 50), ('Руккола', 40), ('Оливковое масло', 8), ('Лимон', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тилапия с рисом и брокколи', 'Нежная белая рыба на пару', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тилапия с рисом и брокколи'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тилапия', 160), ('Рис белый', 55), ('Брокколи', 120), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Камбала в духовке с картофелем', 'Запечённая камбала и картофель', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Камбала в духовке с картофелем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Камбала', 160), ('Картофель', 180), ('Лимон', 20), ('Оливковое масло', 8), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Сельдь с картофелем и луком', 'Классическая подача сельди', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Сельдь с картофелем и луком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сельдь слабосолёная', 100), ('Картофель варёный', 180), ('Лук репчатый', 40), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тунец со спаржей и киноа', 'Лёгкий белковый ужин', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тунец со спаржей и киноа'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 120), ('Спаржа', 120), ('Киноа', 45), ('Оливковое масло', 7), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Паста с креветками и чесноком', 'Спагетти с креветками', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Паста с креветками и чесноком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Спагетти', 80), ('Креветки', 120), ('Чеснок', 8), ('Оливковое масло', 10), ('Пармезан', 15), ('Лимон', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кальмары фаршированные', 'Кальмары с рисом и овощами', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кальмары фаршированные'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кальмар', 180), ('Рис белый', 40), ('Морковь', 40), ('Лук репчатый', 40), ('Яйцо куриное', 25), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Мидии в томатном соусе', 'Мидии с хлебом', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Мидии в томатном соусе'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мидии', 200), ('Помидоры', 120), ('Чеснок', 6), ('Оливковое масло', 8), ('Хлеб пшеничный', 50)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Форель со шпинатом', 'Запечённая форель и шпинат', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Форель со шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Форель', 160), ('Шпинат', 100), ('Лимон', 20), ('Оливковое масло', 7)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Горбуша под сыром', 'Запечённая горбуша с сыром и овощами', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Горбуша под сыром'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Горбуша', 160), ('Сыр российский', 30), ('Помидоры', 80), ('Лук репчатый', 30), ('Сметана 15%', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рыбные котлеты из минтая', 'Котлеты с картофельным пюре', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рыбные котлеты из минтая'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Минтай', 160), ('Хлеб пшеничный', 30), ('Яйцо куриное', 25), ('Лук репчатый', 30), ('Картофель', 180), ('Подсолнечное масло', 12)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Борщ со сметаной', 'Классический борщ с говядиной', 90
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Борщ со сметаной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 80), ('Свёкла', 80), ('Капуста белокочанная', 80), ('Картофель', 80), ('Морковь', 40), ('Сметана 15%', 20), ('Хлеб ржаной (бородинский)', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Щи из свежей капусты', 'Щи на курином бульоне', 60
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Щи из свежей капусты'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное бедро без кожи', 80), ('Капуста белокочанная', 120), ('Картофель', 80), ('Морковь', 40), ('Сметана 15%', 15), ('Хлеб ржаной (бородинский)', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Солянка мясная', 'Солянка с колбасой и огурцами', 50
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Солянка мясная'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 60), ('Колбаса «Докторская»', 40), ('Огурцы солёные', 40), ('Томатная паста', 15), ('Сметана 15%', 15), ('Лимон', 10), ('Хлеб ржаной (бородинский)', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Уха из судака', 'Прозрачная уха', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Уха из судака'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Судак', 120), ('Картофель', 80), ('Морковь', 40), ('Лук репчатый', 40), ('Зелень (укроп, петрушка)', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Грибной крем-суп', 'Крем-суп из шампиньонов', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Грибной крем-суп'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Шампиньоны', 150), ('Картофель', 80), ('Сливки 10%', 50), ('Лук репчатый', 40), ('Хлеб пшеничный', 40), ('Масло сливочное 82,5%', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тыквенный крем-суп', 'Нежный суп из тыквы', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тыквенный крем-суп'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тыква мускатная', 250), ('Сливки 10%', 40), ('Лук репчатый', 40), ('Морковь', 40), ('Хлеб цельнозерновой', 40), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Куриный суп с лапшой', 'Домашний куриный суп', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Куриный суп с лапшой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 80), ('Лапша яичная (сухая)', 40), ('Морковь', 40), ('Картофель', 80), ('Лук репчатый', 30), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Чечевичный суп', 'Густой суп из красной чечевицы', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Чечевичный суп'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Чечевица (сухая)', 60), ('Морковь', 50), ('Лук репчатый', 40), ('Томатная паста', 15), ('Оливковое масло', 8), ('Хлеб цельнозерновой', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Минестроне', 'Итальянский овощной суп с пастой', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Минестроне'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Макароны (сухие)', 30), ('Кабачок', 80), ('Помидоры', 100), ('Фасоль консервированная', 60), ('Морковь', 40), ('Оливковое масло', 8), ('Пармезан', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Том ям с креветками (адаптация)', 'Острый суп с креветками', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Том ям с креветками (адаптация)'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Креветки', 100), ('Шампиньоны', 60), ('Помидоры черри', 60), ('Лимон', 20), ('Кокосовое масло', 5), ('Рис белый', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Цезарь с курицей', 'Салат с курицей, сыром и хлебцами', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Цезарь с курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 100), ('Салат айсберг', 80), ('Пармезан', 20), ('Хлебцы ржаные', 20), ('Помидоры черри', 60), ('Оливковое масло', 10), ('Яйцо куриное', 50)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Греческий салат', 'Классика с фетой', 15
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Греческий салат'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Помидоры', 120), ('Огурцы', 100), ('Перец болгарский', 60), ('Сыр фета', 60), ('Оливковое масло', 12), ('Лук репчатый', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Салат с тунцом и яйцом', 'Белковый салат', 15
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Салат с тунцом и яйцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тунец консервированный (в собственном соку)', 100), ('Яйцо куриное', 50), ('Салат листовой', 60), ('Огурцы', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Винегрет', 'Классический винегрет', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Винегрет'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Свекла варёная', 80), ('Картофель варёный', 80), ('Морковь', 50), ('Огурцы солёные', 40), ('Зелёный горошек консервированный', 40), ('Подсолнечное масло', 12)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Оливье лёгкий', 'Оливье на йогурте', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Оливье лёгкий'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Картофель варёный', 80), ('Морковь', 40), ('Яйцо куриное', 50), ('Куриное филе (грудка)', 80), ('Зелёный горошек консервированный', 40), ('Огурцы солёные', 40), ('Греческий йогурт 2%', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тёплый салат с индейкой', 'Индейка, руккола и овощи', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тёплый салат с индейкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 120), ('Руккола', 50), ('Помидоры черри', 80), ('Авокадо', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Хумус с овощами и лавашом', 'Перекус/лёгкий обед', 10
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Хумус с овощами и лавашом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хумус', 100), ('Лаваш тонкий', 50), ('Огурцы', 80), ('Морковь', 60), ('Перец болгарский', 60)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Творог с персиком и мёдом', 'Лёгкий белковый перекус', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Творог с персиком и мёдом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Творог 2%', 180), ('Персик', 120), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Йогурт с гранолой и манго', 'Йогуртный перекус', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Йогурт с гранолой и манго'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Йогурт натуральный 2,5%', 200), ('Овсяные хлопья', 25), ('Манго', 100), ('Мёд', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Смузи из шпината и банана', 'Зелёный смузи', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Смузи из шпината и банана'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Шпинат', 50), ('Банан', 100), ('Кефир 1%', 200), ('Семена льна', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Бутерброд с авокадо и фетой', 'Цельнозерновой тост', 8
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Бутерброд с авокадо и фетой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хлеб цельнозерновой', 50), ('Авокадо', 60), ('Сыр фета', 30), ('Помидоры черри', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рисовые хлебцы с арахисовой пастой', 'Быстрый перекус', 3
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рисовые хлебцы с арахисовой пастой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хлебцы ржаные', 30), ('Арахисовая паста', 20), ('Банан', 80)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Протеиновый творожный десерт', 'Творог с какао и бананом', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Протеиновый творожный десерт'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Творог 0%', 200), ('Банан', 80), ('Какао-порошок', 8), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Орехово-фруктовый микс', 'Горсть орехов и сухофруктов', 2
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Орехово-фруктовый микс'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Грецкий орех', 15), ('Миндаль', 15), ('Курага', 25), ('Изюм', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кефир с овсяными хлопьями', 'Ночной/дневной перекус', 3
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кефир с овсяными хлопьями'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кефир 1%', 250), ('Овсяные хлопья', 30), ('Яблоко', 80)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Омлет-рулет с начинкой', 'Омлет с сыром и зеленью', 12
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Омлет-рулет с начинкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Яйцо куриное', 100), ('Сыр моцарелла', 30), ('Шпинат', 40), ('Помидоры', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Хумус и морковные палочки', 'Лёгкий снек', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Хумус и морковные палочки'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хумус', 80), ('Морковь', 120)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);



WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Боул с лососем', 'Рис, лосось, авокадо и овощи', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Боул с лососем'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 100), ('Рис бурый', 55), ('Авокадо', 50), ('Огурцы', 60), ('Соевый соус', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Ягодный парфе', 'Слои йогурта и ягод с овсянкой', 5
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Ягодный парфе'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Греческий йогурт 2%', 180), ('Ягоды замороженные (смесь)', 100), ('Мёд', 10), ('Овсяные хлопья', 20)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овсяные панкейки', 'Панкейки из овсянки и банана', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овсяные панкейки'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Овсяные хлопья', 50), ('Банан', 80), ('Яйцо куриное', 50), ('Молоко 2,5%', 40), ('Мёд', 10), ('Подсолнечное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Кускус с овощами и фетой', 'Тёплый кускус-салат', 20
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Кускус с овощами и фетой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Кускус', 60), ('Помидоры черри', 80), ('Огурцы', 60), ('Сыр фета', 50), ('Оливковое масло', 10), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Булгур с курицей и овощами', 'Булгур как гарнир к курице', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Булгур с курицей и овощами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Булгур', 60), ('Куриное филе (грудка)', 140), ('Кабачок', 100), ('Морковь', 50), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Картофельные зразы с мясом', 'Зразы с мясной начинкой', 45
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Картофельные зразы с мясом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Картофель', 200), ('Говяжий фарш', 100), ('Лук репчатый', 40), ('Яйцо куриное', 25), ('Мука пшеничная', 20), ('Подсолнечное масло', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Рататуй с курицей', 'Овощной рататуй и куриное филе', 40
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Рататуй с курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Куриное филе (грудка)', 140), ('Баклажан', 100), ('Кабачок', 100), ('Помидоры', 100), ('Перец болгарский', 80), ('Оливковое масло', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Киш с курицей и шпинатом', 'Открытый пирог', 50
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Киш с курицей и шпинатом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Мука пшеничная', 60), ('Масло сливочное 82,5%', 25), ('Яйцо куриное', 100), ('Куриное филе (грудка)', 80), ('Шпинат', 80), ('Сыр моцарелла', 40), ('Сливки 10%', 50)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тыквенные оладьи со сметаной', 'Оладьи из тыквы', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тыквенные оладьи со сметаной'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Тыква', 150), ('Мука пшеничная', 50), ('Яйцо куриное', 50), ('Сахар', 10), ('Сметана 15%', 30), ('Подсолнечное масло', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гречка с грибами и луком', 'Постный/лёгкий гарнир-блюдо', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гречка с грибами и луком'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Гречневая крупа', 70), ('Шампиньоны', 120), ('Лук репчатый', 60), ('Подсолнечное масло', 10), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Макароны с сыром и курицей', 'Простой сытный ужин', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Макароны с сыром и курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Макароны (сухие)', 80), ('Куриное филе (грудка)', 100), ('Сыр российский', 40), ('Сливки 10%', 40), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Запечённый лосось с киноа', 'Сёмга и киноа', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Запечённый лосось с киноа'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Сёмга', 150), ('Киноа', 50), ('Лимон', 20), ('Спаржа', 100), ('Оливковое масло', 7)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Индейка с чечевицей', 'Белковый ужин', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Индейка с чечевицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Индейка (филе)', 150), ('Чечевица (сухая)', 55), ('Морковь', 50), ('Лук репчатый', 40), ('Оливковое масло', 7)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Овощное рагу с нутом', 'Сытное постное блюдо', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Овощное рагу с нутом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Нут консервированный', 150), ('Кабачок', 100), ('Помидоры', 100), ('Морковь', 60), ('Перец болгарский', 80), ('Оливковое масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Творожные маффины', 'Запечённые маффины к завтраку', 35
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Творожные маффины'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Творог 5%', 150), ('Яйцо куриное', 50), ('Мука пшеничная', 40), ('Банан', 80), ('Мёд', 15)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Сэндвич с индейкой', 'Перекус на цельнозерновом хлебе', 10
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Сэндвич с индейкой'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хлеб цельнозерновой', 60), ('Индейка (филе)', 80), ('Сыр творожный', 20), ('Салат листовой', 20), ('Помидоры', 40)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Какао с бутербродом с сыром', 'Лёгкий перекус', 8
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Какао с бутербродом с сыром'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Какао на молоке', 200), ('Хлеб пшеничный', 40), ('Сыр российский', 30), ('Масло сливочное 82,5%', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('SNACK'), ('SECOND_SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Фриттата с овощами', 'Яичная запеканка с овощами', 30
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Фриттата с овощами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Яйцо куриное', 150), ('Кабачок', 80), ('Перец болгарский', 60), ('Помидоры черри', 60), ('Сыр моцарелла', 40), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('LUNCH')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Киноа с овощами и яйцом', 'Боул для обеда', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Киноа с овощами и яйцом'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Киноа', 55), ('Яйцо куриное', 50), ('Авокадо', 50), ('Помидоры черри', 60), ('Шпинат', 40), ('Оливковое масло', 7)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Картофель по-деревенски с курицей', 'Запечённый картофель и куриные бёдра', 50
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Картофель по-деревенски с курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Картофель', 200), ('Куриное бедро без кожи', 160), ('Чеснок', 5), ('Подсолнечное масло', 10), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Пангасиус с овощами на пару', 'Диетическая рыба', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Пангасиус с овощами на пару'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Пангасиус', 160), ('Брокколи', 120), ('Морковь', 60), ('Лимон', 15), ('Оливковое масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Эдамаме с рисом и курицей', 'Азиатский боул', 25
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Эдамаме с рисом и курицей'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Эдамаме', 100), ('Рис белый', 55), ('Куриное филе (грудка)', 120), ('Соевый соус', 15), ('Кунжутное масло', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Тост с лососем и творожным сыром', 'Перекус/завтрак', 8
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Тост с лососем и творожным сыром'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Хлеб цельнозерновой', 50), ('Сыр творожный', 30), ('Сёмга', 50), ('Огурцы', 40), ('Зелень (укроп, петрушка)', 5)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Чиа-пудинг с ягодами', 'Пудинг на молоке с чиа', 10
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Чиа-пудинг с ягодами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Семена чиа', 25), ('Молоко 2,5%', 180), ('Ягоды замороженные (смесь)', 80), ('Мёд', 10)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('BREAKFAST'), ('SNACK')) AS t(meal_type);

WITH d AS (
  INSERT INTO dish (name, description, cooking_time)
  SELECT 'Гуляш с макаронами', 'Говяжий гуляш', 70
  WHERE NOT EXISTS (SELECT 1 FROM dish WHERE lower(name) = lower('Гуляш с макаронами'))
  RETURNING id
), ing AS (
  INSERT INTO dish_ingredient (dish_id, product_id, amount)
  SELECT d.id, p.id, v.amount
  FROM d CROSS JOIN (VALUES ('Говядина (мякоть)', 150), ('Макароны (сухие)', 70), ('Лук репчатый', 50), ('Перец болгарский', 60), ('Томатная паста', 20), ('Подсолнечное масло', 8)) AS v(pname, amount)
  JOIN product p ON lower(p.name) = lower(v.pname)
)
INSERT INTO meal_type_by_dish (dish_id, meal_type)
SELECT d.id, t.meal_type FROM d CROSS JOIN (VALUES ('LUNCH'), ('DINNER')) AS t(meal_type);


COMMIT;
