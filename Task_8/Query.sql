--1.1 Выбрать в таблице Orders заказы, которые были доставлены после 6 мая 1998 года (колонка ShippedDate) 
--включительно и которые доставлены с ShipVia >= 2. 
--Формат указания даты должен быть верным при любых региональных настройках, 
--согласно требованиям статьи “Writing International Transact-SQL Statements” в Books Online 
--раздел “Accessing and Changing Relational Data Overview”. Этот метод использовать далее для всех заданий.
--Запрос должен высвечивать только колонки OrderID, ShippedDate и ShipVia. 
SELECT 
[OrderID],
[ShippedDate], 
[ShipVia]  
FROM 
[Northwind].[Orders]
WHERE 
[ShippedDate] BETWEEN CAST('1998-05-06' AS datetime) AND GETDATE() AND [ShipVia] > = 2 

--1.2 Написать запрос, который выводит только недоставленные заказы из таблицы Orders.
--В результатах запроса высвечивать для колонки ShippedDate вместо значений NULL строку ‘Not Shipped’ – 
--использовать системную функцию CASЕ. Запрос должен высвечивать только колонки OrderID и ShippedDate. 
SELECT 
[OrderID],
CASE 
	WHEN 
	[ShippedDate] IS NULL
		THEN 
		'Not Shipped'
END
[ShippedDate]
FROM
[Northwind].[Orders]
WHERE
[ShippedDate] IS NULL

--1.3 Выбрать в таблице Orders заказы, которые были доставлены после 6 мая 1998 года (ShippedDate) 
--не включая эту дату или которые еще не доставлены. 
--В запросе должны высвечиваться только колонки OrderID (переименовать в Order Number) 
--и ShippedDate (переименовать в Shipped Date). 
--В результатах запроса высвечивать для колонки ShippedDate вместо значений NULL строку ‘Not Shipped’,
--для остальных значений высвечивать дату в формате по умолчанию. 
SELECT 
[OrderID] 
AS [Order Number],
CASE
	WHEN 
	[ShippedDate] IS NULL 
	THEN 'Not Shipped'
	ELSE 
	CONVERT(char,[ShippedDate])
END AS 
[Shipped Date]
FROM 
[Northwind].[Orders]
WHERE 
([ShippedDate] BETWEEN CAST('1998-05-07' AS datetime) AND GETDATE()) 
OR
([ShippedDate] IS NULL)

--2.1 Выбрать из таблицы Customers всех заказчиков, проживающих в USA и Canada.
--Запрос сделать с только помощью оператора IN.
--Высвечивать колонки с именем пользователя и названием страны в результатах запроса.
--Упорядочить результаты запроса по имени заказчиков и по месту проживания.
SELECT 
[ContactName], 
[Country]
FROM 
[Northwind].[Customers]
WHERE 
[Country] IN ('USA', 'Canada')
ORDER BY 
[ContactName], 
[Address]

--2.2 Выбрать из таблицы Customers всех заказчиков, не проживающих в USA и Canada.
--Запрос сделать с помощью оператора IN.
--Высвечивать колонки с именем пользователя и названием страны в результатах запроса.
--Упорядочить результаты запроса по имени заказчиков. 
SELECT 
[ContactName], 
[Country]
FROM 
[Northwind].[Customers]
WHERE 
[Country] NOT IN ('USA', 'Canada')
ORDER BY 
[ContactName]

--2.3 Выбрать из таблицы Customers все страны, в которых проживают заказчики. 
--Страна должна быть упомянута только один раз и список отсортирован по убыванию. 
--Не использовать предложение GROUP BY. Высвечивать только одну колонку в результатах запроса. 
SELECT DISTINCT 
[Country]
FROM 
[Northwind].[Customers]
ORDER BY 
[Country] DESC

--3.1 Выбрать все заказы (OrderID) из таблицы Order Details (заказы не должны повторяться),
--где встречаются продукты с количеством от 3 до 10 включительно – это колонка Quantity в таблице Order Details.
--Использовать оператор BETWEEN. Запрос должен высвечивать только колонку OrderID. 
SELECT DiSTINCT 
[OrderID]
FROM 
[Northwind].[Order Details]
WHERE 
[Quantity]
BETWEEN 3 AND 10

--3.2 Выбрать всех заказчиков из таблицы Customers, 
-- у которых название страны начинается на буквы из диапазона b и g. Использовать оператор BETWEEN. 
--Проверить, что в результаты запроса попадает Germany. 
--Запрос должен высвечивать только колонки CustomerID и Country и отсортирован по Country.
SELECT 
[CustomerID],
[Country]
FROM 
[Northwind].[Customers]
WHERE 
SUBSTRING([Country],1,1) BETWEEN 'b' AND 'g'
ORDER BY 
[Country]

--3.3 Выбрать всех заказчиков из таблицы Customers, у которых название страны начинается на буквы 
-- из диапазона b и g, не используя оператор BETWEEN.
--С помощью опции “Execution Plan” определить какой запрос предпочтительнее 3.2
--или 3.3 – для этого надо ввести в скрипт выполнение текстового Execution Plan-a для двух этих запросов,
--результаты выполнения Execution Plan надо ввести в скрипт в виде комментария
--и по их результатам дать ответ на вопрос – по какому параметру было проведено сравнение. 
--Запрос должен высвечивать только колонки CustomerID и Country и отсортирован по Country. 
SELECT 
[CustomerID],
[Country]
FROM 
[Northwind].[Customers]
WHERE 
SUBSTRING([Country],1,1) >= 'b' 
AND 
SUBSTRING([Country],1,1) <= 'h'
ORDER BY
[Country]

--4.1 В таблице Products найти все продукты (колонка ProductName), где встречается подстрока 'chocolade'. 
--Известно, что в подстроке 'chocolade' может быть изменена одна буква 'c' в середине - найти все продукты,
--которые удовлетворяют этому условию. Подсказка: результаты запроса должны высвечивать 2 строки. 
SELECT 
[ProductName]
FROM 
[Northwind].[Products]
WHERE 
[ProductName] LIKE '%cho_olade%'

--5.1 Найти общую сумму всех заказов из таблицы Order Details с учетом количества закупленных товаров и скидок по ним.
--Результат округлить до сотых и высветить в стиле 1 для типа данных money. 
--Скидка (колонка Discount) составляет процент из стоимости для данного товара.
--Для определения действительной цены на проданный продукт надо вычесть скидку из указанной в колонке UnitPrice цены.
--Результатом запроса должна быть одна запись с одной колонкой с названием колонки 'Totals'.
SELECT 
ROUND(SUM(([UnitPrice] - [UnitPrice]*[Discount])*[Quantity]),2) AS
[Total]
FROM
[Northwind].[Order Details]

--5.2 По таблице Orders найти количество заказов, которые еще не были доставлены 
--(т.е. в колонке ShippedDate нет значения даты доставки). 
--Использовать при этом запросе только оператор COUNT. Не использовать предложения WHERE и GROUP. 
SELECT
COUNT(*) - COUNT([ShippedDate])
AS 
[Not shipped count]
FROM 
[Northwind].[Orders]

--5.3 По таблице Orders найти количество различных покупателей (CustomerID), сделавших заказы.
--Использовать функцию COUNT и не использовать предложения WHERE и GROUP. 
SELECT 
COUNT(DISTINCT [CustomerID]) 
AS 
[Disctinct custimer count]
FROM 
[Northwind].[Orders]

--6.1 По таблице Orders найти количество заказов с группировкой по годам. 
--В результатах запроса надо высвечивать две колонки c названиями Year и Total.
--Написать проверочный запрос, который вычисляет количество всех заказов. 
SELECT 
COUNT([OrderID]) AS [Total],
YEAR([OrderDate]) AS [Year] 
FROM
[Northwind].[Orders]
GROUP BY
(YEAR([OrderDate]))

SELECT 
COUNT([OrderID])
FROM 
[Northwind].[Orders]

--6.2 По таблице Orders найти количество заказов, cделанных каждым продавцом.
--Заказ для указанного продавца – это любая запись в таблице Orders, 
--где в колонке EmployeeID задано значение для данного продавца. 
--В результатах запроса надо высвечивать колонку с именем продавца 
--(Должно высвечиваться имя полученное конкатенацией LastName & FirstName.
--Эта строка LastName & FirstName должна быть получена отдельным запросом в колонке основного запроса.
--Также основной запрос должен использовать группировку по EmployeeID.) с названием колонки ‘Seller’
--и колонку c количеством заказов высвечивать с названием 'Amount'.
--Результаты запроса должны быть упорядочены по убыванию количества заказов. 
SELECT  
[FirstName] + ' ' + [LastName]  AS [Seller],
COUNT([OrderID]) AS [Amount]
FROM 
[Northwind].[Orders]
INNER JOIN 
[Northwind].[Employees]
ON 
[Employees].[EmployeeID] = [Orders].[EmployeeID]
GROUP BY 
[FirstName] + ' ' + [LastName]
ORDER BY 
[Amount]
DESC

--6.3 По таблице Orders найти количество заказов, cделанных каждым продавцом и для каждого покупателя. 
--Необходимо определить это только для заказов сделанных в 1998 году.
--В результатах запроса надо высвечивать колонку с именем продавца (название колонки ‘Seller’),
--колонку с именем покупателя (название колонки ‘Customer’)  и колонку c количеством заказов высвечивать с названием 'Amount'. 
--В запросе необходимо использовать специальный оператор языка T-SQL для работы с выражением GROUP
-- (Этот же оператор поможет выводить строку “ALL” в результатах запроса).
--Группировки должны быть сделаны по ID продавца и покупателя.
--Результаты запроса должны быть упорядочены по продавцу, покупателю и по убыванию количества продаж.
SELECT CASE WHEN [EmployeeID] is null 
			THEN 'All'
            ELSE (SELECT [LastName] + ' ' + [FirstName]
	              FROM [Northwind].[Employees]
				  WHERE [Employees].[EmployeeID] = [Orders].[EmployeeID]) 
	   END AS [Seller],
       CASE WHEN [CustomerID] is null 
			THEN 'All'
            ELSE (SELECT [CompanyName]
	              FROM [Northwind].[Customers]
	              WHERE [Customers].[CustomerID] = [Orders].[CustomerID]) 
	   END AS [Customer],
       [Amount]
FROM (SELECT [EmployeeID], [CustomerID], COUNT(*) AS Amount, GROUPING(EmployeeID) AS [Grouping]
      FROM [Northwind].[Orders]
	  WHERE 
	  [OrderDate] BETWEEN CAST('1998-01-01' AS datetime) AND CAST('1998-12-31' AS datetime)
      GROUP BY [EmployeeID], [CustomerID] 
	  WITH CUBE 
      ) [Orders]
ORDER BY [Seller], [Customer], [Amount] DESC

--6.4 Найти покупателей и продавцов, которые живут в одном городе.
--Если в городе живут только один или несколько продавцов или только один или несколько покупателей, 
--то информация о таких покупателя и продавцах не должна попадать в результирующий набор.
--Не использовать конструкцию JOIN.
--В результатах запроса необходимо вывести следующие заголовки для результатов запроса: 
--		‘Person’, ‘Type’ (здесь надо выводить строку ‘Customer’ или  ‘Seller’ в завимости от типа записи), ‘City’.
--Отсортировать результаты запроса по колонке ‘City’ и по ‘Person’. 
SELECT 
CASE 
	WHEN 
	NOT [Employees].[FirstName] IS NULL 
	AND NOT [Customers].[ContactName] IS NULL 
	THEN 
	[Employees].[FirstName] + ' ' + [Employees].[LastName] +' AND '+ [Customers].[ContactName]
END 
AS 
[Person],
[Employees].[City]
AS 
[City]
FROM 
[Northwind].[Employees],[Northwind].[Customers] 
WHERE 
[Employees].[City] = [Customers].[City]
ORDER BY 
[City], 
[Person]

--6.5 Найти всех покупателей, которые живут в одном городе.
--В запросе использовать соединение таблицы Customers c собой - самосоединение.
--Высветить колонки CustomerID и City. Запрос не должен высвечивать дублируемые записи.
--Для проверки написать запрос, который высвечивает города, которые встречаются более одного раза в таблице Customers.
--Это позволит проверить правильность запроса. 
SELECT 
[Customer1].[CustomerID], 
[Customer1].[City]
FROM 
[Northwind].[Customers] [Customer1]
JOIN 
[Northwind].[Customers] [Customer2] 
ON 
[Customer1].[City] = [Customer2].[City]
GROUP BY 
[Customer1].[CustomerID],[Customer1].[City]
HAVING 
COUNT([Customer1].[City]) > 1
ORDER BY 
[Customer1].[City]


SELECT 
[City], 
COUNT([City]) 
AS 
Count
FROM 
[Northwind].[Customers] 
GROUP BY 
[City]
having 
count([City]) > 1

--6.6 По таблице Employees найти для каждого продавца его руководителя, т.е. кому он делает репорты. 
--Высветить колонки с именами 'User Name' (LastName) и 'Boss'. В колонках должны быть высвечены имена из колонки LastName. 
SELECT 
[b].[LastName] AS [UserName], 
[u].[LastName] AS [BOSS] 
FROM 
[Northwind].[Employees] [u]
RIGHT JOIN 
[Northwind].[Employees] [b]
ON 
[u].[EmployeeID] = [b].[ReportsTo]
ORDER BY 
[BOSS]

--7.1 Определить продавцов, которые обслуживают регион 'Western' (таблица Region).
--Результаты запроса должны высвечивать два поля: 
--'LastName' продавца и название обслуживаемой территории ('TerritoryDescription' из таблицы Territories).
--Запрос должен использовать JOIN в предложении FROM. 
--Для определения связей между таблицами Employees и Territories надо использовать графические диаграммы для базы Northwind. 
SELECT 
[LastName],
[TerritoryDescription]
FROM 
[Northwind].[Employees]
INNER JOIN 
[Northwind].[EmployeeTerritories] 
ON 
[Employees].[EmployeeID] = [EmployeeTerritories].[EmployeeID]
INNER JOIN 
[Northwind].[Territories]
ON 
[EmployeeTerritories].[TerritoryID] = [Territories].[TerritoryID]
INNER JOIN 
[Northwind].[Region]
ON [Territories].[RegionID] = [Region].[RegionID]
WHERE 
[RegionDescription] = 'Western'

--8.1 Высветить в результатах запроса имена всех заказчиков из таблицы Customers и суммарное количество их заказов из таблицы Orders. 
--Принять во внимание, что у некоторых заказчиков нет заказов, но они также должны быть выведены в результатах запроса. 
--Упорядочить результаты запроса по возрастанию количества заказов. 
SELECT 
[Customers].CustomerID, 
COUNT([Orders].OrderID) 
AS 
[Orders count]
FROM 
[Northwind].[Customers]
LEFT JOIN 
[Northwind].[Orders]
ON 
[Customers].[CustomerID] = [Orders].[CustomerID]
GROUP BY 
[Customers].[CustomerID]
ORDER BY 
[Orders count]

--9.1 Высветить всех поставщиков колонка CompanyName в таблице Suppliers, 
--у которых нет хотя бы одного продукта на складе (UnitsInStock в таблице Products равно 0). 
--Использовать вложенный SELECT для этого запроса с использованием оператора IN. 
--Можно ли использовать вместо оператора IN оператор '=' ? 
SELECT 
[CompanyName]
FROM 
[Northwind].[Suppliers]
INNER JOIN 
[Northwind].[Products]
ON 
[Products].[SupplierID] = [Suppliers].[SupplierID]
WHERE 
[Products].[SupplierID] 
IN 
(
	SELECT 
	[SupplierID]
	FROM  
	[Northwind].[Suppliers]
	WHERE 
	[UnitsInStock] = 0
)

--10.1 Высветить всех продавцов, которые имеют более 150 заказов. Использовать вложенный коррелированный SELECT. 
SELECT 
[Employees].[LastName] 
FROM 
[Northwind].[Employees]
WHERE 
[EmployeeID] 
IN (
	SELECT 
	[EmployeeID] 
	FROM 
	[Northwind].[Orders]
	GROUP BY 
	[EmployeeID] 
	HAVING 
	COUNT([OrderID]) > 150
)

--11.1 Высветить всех заказчиков (таблица Customers), которые не имеют ни одного заказа (подзапрос по таблице Orders).
--Использовать коррелированный SELECT и оператор EXISTS. 
SELECT 
[CompanyName] 
FROM 
[Northwind].[Customers] [c]
WHERE 
NOT EXISTS (
	SELECT 
	[CustomerID]
	FROM 
	[Northwind].[Orders] [o]
	WHERE [c].[CustomerID] = [o].[CustomerID]
)

--12.1 Для формирования алфавитного указателя Employees высветить из таблицы Employees список только тех букв алфавита, 
--с которых начинаются фамилии Employees (колонка LastName ) из этой таблицы. 
--Алфавитный список должен быть отсортирован по возрастанию
SELECT 
DISTINCT 
SUBSTRING([LastName],1,1) 
AS [INDEX]
FROM [Northwind].[Employees]
ORDER BY [INDEX]

--13.1 
exec dbo.MaxPriceOrders 1996;

--13.2 
exec dbo.SpecifiedDelay

--13.3 
EXEC dbo.SubordinationInfo 2;

--13.4 
EXEC dbo.IsBoss 2;