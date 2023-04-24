/*
Найти квадраты, время между первой и последней окраской которых превышает среднее время по всем окрашенным квадратам.
Вывести название квадрата и наибольшее время между двумя его последовательными окрасками в секундах.

    Нашли максимальные разницы в diffMax,
    Первое выражение для условия "наибольшее время между двумя его поледовательными окрасками в секундах"
*/

WITH innerMax AS
         (SELECT b.b_q_id,
                 (DATEDIFF(SECOND,
                           b.b_datetime,
                           (SELECT TOP 1 b_datetime
                            FROM utB
                            WHERE b_q_id = b.b_q_id
                              AND b_datetime > b.b_datetime
                            ORDER BY b_datetime)
                     )) columnDiffmax
          FROM utB b),

     diffMax AS
         (SELECT b.b_q_id id,
                 DATEDIFF(SECOND, MIN(b.b_datetime), MAX(b.b_datetime)) diff

          FROM utB b
          GROUP BY b.b_q_id)

SELECT (SELECT q_name FROM utQ WHERE Q_ID = id) QNAME,
       (SELECT max(columnDiffmax) FROM innerMax WHERE b_q_id = id) PAUSE
FROM diffMax
WHERE diff > (SELECT avg(diff) FROM diffMax)
