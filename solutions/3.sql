/*
 Для таблицы Product получить результирующий набор в виде таблицы со столбцами maker, pc, laptop и printer,
в которой для каждого производителя требуется указать, производит он (yes) или нет (no) соответствующий тип продукции.
В первом случае (yes) указать в скобках без пробела количество имеющихся в наличии
(т.е. находящихся в таблицах PC, Laptop и Printer) различных по номерам моделей соответствующего типа.

 Вывод: "Ваш запрос вернул правильные данные на основной базе, но не прошел тест на проверочной базе.
* Несовпадение данных (9)"

 Никак не получается
 */

SELECT maker,
       CONCAT(
               IIF(SUM(PC.code) IS NULL,
                   'no',
                   'yes('),
               IIF(COUNT(PC.model) = 0, NULL, COUNT(DISTINCT PC.model)),
               IIF(COUNT(PC.model) = 0, NULL, ')')
           ) pc,
       CONCAT(
               IIF(SUM(Laptop.code) IS NULL,
                   'no',
                   'yes('),
               IIF(SUM(Laptop.code) IS NULL, NULL, COUNT(DISTINCT Laptop.model)),
               IIF(SUM(Laptop.code) IS NULL, NULL, ')')
           )
             laptop,
       CONCAT(
               IIF(SUM(Printer.code) IS NULL,
                   'no',
                   'yes('),
               IIF(SUM(Printer.code) IS NULL, NULL, COUNT(DISTINCT Printer.model)),
               IIF(SUM(Printer.code) IS NULL, NULL, ')')
           ) printer
FROM Product
         LEFT JOIN PC
                   ON Product.model = PC.model
         LEFT JOIN Laptop
                   ON Product.model = Laptop.model
         LEFT JOIN Printer
                   ON Product.model = Printer.model
GROUP BY maker
ORDER BY maker;
