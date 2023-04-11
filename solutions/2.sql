/*
Classes (class, type, country, numGuns, bore, displacement)
Ships (name, class, launched)
Battles (name, date)
Outcomes (ship, battle, result)

Задание 2
Для каждого месяца (с учетом года) из таблицы Battles посчитать сколько раз повторяется каждый день недели в этом месяце.
Вывод: месяц (в формате "YYYY-ММ"), количество понедельников, вторников, ...воскресений.

1) В Classes.class либо имя первого корабля по проекту, либо уникальное имя проекта
2) В отношение Outcomes могут входить корабли, отсутствующие в отношении Ships.
3) Потопленный корабль в последующих битвах участия не принимает.

1. Решение только для Sat: Группируем по году и месяцу -> высчитываем для каждого дня разницу в неделях между двумя датами,
которые группируются(по году и месяцу), разница между которыми 1 месяц в DATEDIFF
2. Далее нашел какой день месяца отвечает за какой день недели и нахожу между ними разницу,
разница находится по ПРИСУТСТВУЮЩИМ в БД датам, поэтому работает

Даже не знаю, будут ли влиять високосные года на результат
 */

SELECT FORMAT(date, 'yyyy-MM') AS m,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-06', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-06')) AS Mon,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-05', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-05')) AS Tue,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-04', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-04')) AS Wed,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-03', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-03')) AS Thu,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-02', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-02')) AS Fri,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-01', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-01')) AS Sat,
       DATEDIFF(WEEK, FORMAT(date, 'yyyy-MM') + '-07', DATEADD(MONTH, 1, FORMAT(date, 'yyyy-MM') + '-07')) AS Sun
FROM Battles
GROUP BY FORMAT(date, 'yyyy-MM');
