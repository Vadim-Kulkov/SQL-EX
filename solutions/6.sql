/*
 Для каждой страны определить год, когда на воду было спущено максимальное количество ее кораблей.
 В случае, если окажется несколько таких лет, взять минимальный из них.
 Вывод: страна, количество кораблей, год
 */

WITH CCL AS (SELECT country, COUNT(*) counted, launched
             FROM Ships b
                      RIGHT JOIN Classes a ON b.class = a.class
             WHERE launched IS NOT NULL
             GROUP BY country, launched
)
SELECT country, MAX(counted) Qty, MIN(launched) Year
FROM CCL
GROUP BY country;

/*
  "* Неверное число записей (меньше на 1)"
 Никак не выводились null-ы в нужных местах, подсмотрел
 */

WITH CCL AS (SELECT country, COUNT(launched) counted, launched
             FROM Ships b
                      RIGHT JOIN Classes a ON b.class = a.class AND launched IS NOT NULL
             GROUP BY country, launched
)
SELECT country, IIF(MIN(launched) IS NULL, NULL, MAX(counted)) Qty, MIN(launched) Year
FROM CCL CCLFIRST
WHERE counted = (SELECT MAX(counted) FROM CCL WHERE country = CCLFIRST.country)
GROUP BY country;

