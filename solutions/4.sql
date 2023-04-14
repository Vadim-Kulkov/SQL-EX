/*
 Посчитать сумму цифр в номере каждой модели из таблицы Product
 Вывод: номер модели, сумма цифр

 Первое решение,  total cost	0.0033708000555634
 */

SELECT model,
       (
           ISNULL(TRY_CAST(SUBSTRING (model, 1, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 2, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 3, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 4, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 5, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 6, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 7, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 8, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 9, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 10, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 11, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 12, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 13, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 14, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 15, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 16, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 17, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 18, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 19, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 20, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 21, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 22, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 23, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 24, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 25, 1) AS INT), 0) +

           ISNULL(TRY_CAST(SUBSTRING (model, 26, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 27, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 28, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 29, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 30, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 31, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 32, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 33, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 34, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 35, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 36, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 37, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 38, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 39, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 40, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 41, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 42, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 43, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 44, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 45, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 46, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 47, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 48, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 49, 1) AS INT), 0) +
           ISNULL (TRY_CAST(SUBSTRING (model, 50, 1) AS INT), 0)
           ) AS qty
FROM Product

/*
 Нашел на гитхабе решение поаккуратнее
 */

select model,
       (datalength(model)-datalength(REPLACE(model, '1', '')))*1 +
       (datalength(model)-datalength(REPLACE(model, '2', '')))*2 +
       (datalength(model)-datalength(REPLACE(model, '3', '')))*3 +
       (datalength(model)-datalength(REPLACE(model, '4', '')))*4 +
       (datalength(model)-datalength(REPLACE(model, '5', '')))*5 +
       (datalength(model)-datalength(REPLACE(model, '6', '')))*6 +
       (datalength(model)-datalength(REPLACE(model, '7', '')))*7 +
       (datalength(model)-datalength(REPLACE(model, '8', '')))*8 +
       (datalength(model)-datalength(REPLACE(model, '9', '')))*9
from product
