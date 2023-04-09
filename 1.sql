/*
Задание: 1 ($erges: 2008-06-21)
Дима и Миша пользуются продуктами от одного и того же производителя.
Тип Таниного принтера не такой, как у Вити, но признак "цветной или нет" - совпадает.
Размер экрана Диминого ноутбука на 3 дюйма больше Олиного.
Мишин ПК в 4 раза дороже Таниного принтера.
Номера моделей Витиного принтера и Олиного ноутбука отличаются только третьим символом.

У Костиного ПК скорость процессора, как у Мишиного ПК; объем жесткого диска, как у Диминого ноутбука;
объем памяти, как у Олиного ноутбука, а цена - как у Витиного принтера.
Вывести все возможные номера моделей Костиного ПК.

8 Зависимостей:
    4 исконные зависимости:
        KostyaPC.speed = MishaPC.speed
        KostyaPC.hd = DimaLaptop.hd
        KostyaPC.ram = OlyaLaptop.ram
        KostyaPC.price = VityaPrinter.price

    4 случайных:
        1) DimaProduct.maker = MishaProduct.maker

        2) TanyaPrinter.type != VityaPrinter.type
            TanyaPrinter.color = VityaPrinter.color

        3) Номера моделей Витиного принтера и Олиного ноутбука отличаются только третьим символом.

        4) DimaLaptop.screen - OlyaLaptop.screen = 3

        5) MishaPC.price = 4 * TanyaPrinter.price


Решение 1, все исконные условия и 2 случайное в JOIN, всё остальное в WHERE
*/
SELECT DISTINCT PC.model
FROM PC
         INNER JOIN PC MishaPC ON PC.speed = MishaPC.speed
         INNER JOIN Laptop DimaLaptop ON PC.hd = DimaLaptop.hd
         INNER JOIN Laptop OlyaLaptop ON PC.ram = OlyaLaptop.ram
         INNER JOIN Printer VityaPrinter ON PC.price = VityaPrinter.price
         INNER JOIN Printer TanyaPrinter
                    ON (VityaPrinter.type <> TanyaPrinter.type AND VityaPrinter.color = TanyaPrinter.color)

WHERE (SELECT maker
       FROM Product DimaProduct
       WHERE DimaProduct.model = DimaLaptop.model) IN
      (SELECT maker FROM Product MishaProduct WHERE MishaPC.model = MishaProduct.model)
  AND DimaLaptop.screen = OlyaLaptop.screen + 3
  AND stuff(OlyaLaptop.model, 3, 1, '') = stuff(VityaPrinter.model, 3, 1, '')
  AND MishaPC.price = 4 * TanyaPrinter.price


