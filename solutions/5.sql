/*
 Вывести все записи из Outcome и Income, даты которых отстоят не менее чем на 2 календарных месяца от максимальной даты
 в обеих таблицах (т.е. при максимальной дате 2009-12-05 последняя выводимая дата должна быть меньше 2009-10-01).
Выполнить помесячное разбиение этих записей, присвоив порядковый номер каждому месяцу (с учётом года), попавшему в выборку.
Вывод: порядковый номер месяца, первый день месяца в формате "yyyy-mm-dd",
 последний день месяца в формате "yyyy-mm-dd", код записи, пункт, дата, сумма (для таблицы Outcome должна быть отрицательной)
 */

SELECT *
from OutCome out,
     Income inc
WHERE out.date <= DATEADD(month, 2, (SELECT MAX(date) FROM Outcome))
  AND inc.date <= DATEADD(month, 2, (SELECT MAX(date) FROM Income));

/*
 Верное решение
 */
with unionOutAndInc as (
    select date, code, point, -out sum
    FROM Outcome
    union all
    select date, code, point, inc sum
    FROM Income)
SELECT DENSE_RANK() OVER (ORDER BY YEAR(date), MONTH(date)) num,
       CAST(DATEADD(month, DATEDIFF(month, 0, date), 0) AS DATE) startDate,
       CAST(EOMONTH(date) AS DATE) endDate,
       code,
       point,
       date,
       sum
FROM unionOutAndInc
WHERE date <= DATEADD(month, -3, (SELECT MAX(date) FROM unionOutAndInc))
