--13.1 Написать процедуру, которая возвращает самый крупный заказ для каждого из продавцов за определенный год. 
--В результатах не может быть несколько заказов одного продавца, должен быть только один и самый крупный.
--В результатах запроса должны быть выведены следующие колонки: 
--колонка с именем и фамилией продавца (FirstName и LastName – пример: Nancy Davolio), номер заказа и его стоимость. 
--В запросе надо учитывать Discount при продаже товаров. 
--Процедуре передается год, за который надо сделать отчет, и количество возвращаемых записей. 
--Результаты запроса должны быть упорядочены по убыванию суммы заказа.
--Процедура должна быть реализована с использованием оператора SELECT и БЕЗ ИСПОЛЬЗОВАНИЯ КУРСОРОВ. 
--Название функции соответственно GreatestOrders. Необходимо продемонстрировать использование этих процедур.
--Также помимо демонстрации вызовов процедур в скрипте Query.sql надо написать
--отдельный ДОПОЛНИТЕЛЬНЫЙ проверочный запрос для тестирования правильности работы процедуры GreatestOrders.
--Проверочный запрос должен выводить в удобном для сравнения с результатами работы процедур виде 
--для определенного продавца для всех его заказов за определенный указанный год в результатах следующие колонки:
--имя продавца, номер заказа, сумму заказа. Проверочный запрос не должен повторять запрос, написанный в процедуре, - 
--он должен выполнять только то, что описано в требованиях по нему.
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'GreatestOrders')
                    AND TYPE IN ( N'P', N'PC' ) ) 
                    DROP PROCEDURE [GreatestOrders]
GO
CREATE PROCEDURE [GreatestOrders] @year INT
AS SELECT
[e].[FirstName],
[e].[LastName],
[o].[OrderID],
(([od].[UnitPrice] * (1 - [od].[Discount])) * [od].[Quantity]) AS [Price]
FROM
[Northwind].[Employees] [e]
INNER JOIN
[Northwind].[Orders] [o]
ON
[e].[EmployeeID] = [o].[EmployeeID]
INNER JOIN
[Northwind].[Order Details] [od]
ON
[od].[OrderID] = [o].[OrderID]
WHERE
YEAR([o].[OrderDate]) = @year
AND
(([UnitPrice] * (1 - [Discount])) * [Quantity]) = (
SELECT
MAX(([UnitPrice] * (1 - [Discount])) * [Quantity])
FROM
[Northwind].[Orders] [o]
INNER JOIN
[Northwind].[Order Details] [od]
ON
[od].[OrderID] = [o].[OrderID]
WHERE
YEAR([o].[OrderDate]) = @year
)

--13.2 Написать процедуру, которая возвращает заказы в таблице Orders, согласно указанному сроку доставки в днях (разница между OrderDate и ShippedDate).  
--В результатах должны быть возвращены заказы, срок которых превышает переданное значение или еще недоставленные заказы.
--Значению по умолчанию для передаваемого срока 35 дней. Название процедуры ShippedOrdersDiff. 
--Процедура должна высвечивать следующие колонки: OrderID, OrderDate, ShippedDate, ShippedDelay (разность в днях между ShippedDate и OrderDate), 
--SpecifiedDelay (переданное в процедуру значение).  Необходимо продемонстрировать использование этой процедуры.
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'ShippedOrdersDiff')
                    AND TYPE IN ( N'P', N'PC' ) ) 
                    DROP PROCEDURE [ShippedOrdersDiff]
GO
CREATE PROCEDURE [ShippedOrdersDiff] @day INT = 35
AS SELECT
[OrderID],
[OrderDate],
[ShippedDate],
DATEDIFF([d], [OrderDate], [ShippedDate]) AS [ShippedDelay]
FROM
[Northwind].[Orders]
WHERE
DATEDIFF([d], [OrderDate], [ShippedDate]) > @day
OR
[ShippedDate] IS NULL

--13.3 Написать процедуру, которая высвечивает всех подчиненных заданного продавца, как непосредственных, так и подчиненных его подчиненных. 
--В качестве входного параметра функции используется EmployeeID. 
--Необходимо распечатать имена подчиненных и выровнять их в тексте (использовать оператор PRINT) согласно иерархии подчинения.
--Продавец, для которого надо найти подчиненных также должен быть высвечен. Название процедуры SubordinationInfo.
--В качестве алгоритма для решения этой задачи надо использовать пример,
--приведенный в Books Online и рекомендованный Microsoft для решения подобного типа задач. Продемонстрировать использование процедуры.
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'SubordinationInfo')
                    AND TYPE IN ( N'P', N'PC' ) ) 
                    DROP PROCEDURE [SubordinationInfo]
GO
CREATE PROCEDURE [SubordinationInfo]
@EmployerID integer
AS
DECLARE @SPACE nvarchar(50) = '';
DECLARE @result nvarchar(50);
WHILE (@EmployerID IS NOT NULL)
BEGIN
SET @result = 
(
	SELECT 
	@SPACE + [LastName] 
	FROM 
	[Northwind].[Employees] 
	WHERE 
	[EmployeeID] = @EmployerID
)
PRINT @result
SET 
@EmployerID = (
	SELECT
	[ReportsTo] 
	FROM 
	[Northwind].[Employees]
	WHERE 
	[EmployeeID] = @EmployerID
)
SET 
@SPACE = @SPACE + '  '
END

--13.4 Написать функцию, которая определяет, есть ли у продавца подчиненные. 
--Возвращает тип данных BIT. В качестве входного параметра функции используется EmployeeID.
--Название функции IsBoss. Продемонстрировать использование функции для всех продавцов из таблицы Employees. 
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'IsBoss')
                    AND TYPE IN ( N'P', N'PC', N'U') ) 
                    DROP FUNCTION [IsBoss]
GO
CREATE FUNCTION [IsBoss]
(@EmployeeID INT)
RETURNS BIT
AS 
BEGIN
IF EXISTS(
	SELECT
		[EmployeeID]
	FROM
		[Northwind].[Employees]
	WHERE
		[ReportsTo] = @EmployeeID
	)
		RETURN 1
	RETURN 0
END