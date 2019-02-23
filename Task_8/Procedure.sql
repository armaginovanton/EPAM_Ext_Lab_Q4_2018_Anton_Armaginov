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
CREATE PROCEDURE [GreatestOrders] @year INT, @Count INT
AS SELECT TOP (@Count)
[e].[FirstName] +' '+ [e].[LastName] AS [Employee name],
[o].[OrderID],
(([od].[UnitPrice] * (1 - [od].[Discount])) * [od].[Quantity]) AS [Price]
FROM
[Northwind].[Employees] [e] INNER JOIN [Northwind].[Orders] [o]
ON
[e].[EmployeeID] = [o].[EmployeeID] INNER JOIN [Northwind].[Order Details] [od]
ON
[od].[OrderID] = [o].[OrderID] 
INNER JOIN (SELECT
			[o].[EmployeeID],
			MAX(([UnitPrice] * (1 - [Discount])) * [Quantity]) as [max]
			FROM
			[Northwind].[Orders] [o] INNER JOIN [Northwind].[Order Details] [od]
			ON
			[od].[OrderID] = [o].[OrderID]
			WHERE
			YEAR([o].[OrderDate]) = @year
			GROUP BY [o].[EmployeeID]
			) [ood]
ON [ood].[EmployeeID] = [e].[EmployeeID] 
AND [ood].[max] = (([od].[UnitPrice] * (1 - [od].[Discount])) * [od].[Quantity])
WHERE YEAR([o].[OrderDate]) = @year
ORDER BY (([od].[UnitPrice] * (1 - [od].[Discount])) * [od].[Quantity]) DESC

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
DATEDIFF([d], [OrderDate], [ShippedDate]) AS [ShippedDelay],
(@day) as [SpecifiedDelay]
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
CREATE PROCEDURE [SubordinationInfo] (
    @id INT,
	@SPACE nvarchar(50) = default
)
AS
BEGIN
	IF @SPACE IS NULL SET @SPACE = '';
	SET NOCOUNT ON;
	DECLARE @OUT_table TABLE(
		[id] INT
	);
	INSERT @OUT_table SELECT [EmployeeID]
						  FROM [Northwind].[Employees] 
						  WHERE [ReportsTo] = @id;

	DECLARE @result nvarchar(50);
	SET @result = (SELECT @SPACE+[FirstName]+' '+[LastName]
			FROM [Northwind].[Employees] 
			WHERE [EmployeeID] = @id);
	PRINT @result;

	DECLARE @uslCont integer;
	SET @uslCont=(SELECT count(*)
				  FROM [Northwind].[Employees] 
				  WHERE [ReportsTo] = @id);
	IF @uslCont>0
	BEGIN
		SET @SPACE = @SPACE + '   ';
		DECLARE @e INT;
		DECLARE c1 CURSOR FOR 
			SELECT [ID]
			FROM  @OUT_table;
		OPEN c1
		FETCH NEXT FROM c1 INTO @e
		WHILE @@fetch_status = 0
		BEGIN
			EXEC [SubordinationInfo] @e, @SPACE;
			FETCH NEXT FROM c1 INTO @e;
		END;
		CLOSE c1
		DEALLOCATE c1
	END
END;

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

--14 На основе диаграммы классов проработайте архитектуру базы данных вашего финального проекта.
--Напишите скрипт создания сущностей пользователя, ролей и зависимых сущностей 
--(достаточных для выполнения CRUD операций над пользователями и выдачи им определенных ролей)
--*Напишите скрипт создания оставшихся сущностей вашей диаграммы. 

--Таблица ролей
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Roles' AND xtype = 'U') 
BEGIN 
	CREATE TABLE [Roles](
		[RoleID] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
		[Name] VARCHAR(50) NULL)
END;

--Таблица прав
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Permissions' AND xtype = 'U') 
BEGIN 
	CREATE TABLE Permissions(
		[PermissionID] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY, 
		[Name] VARCHAR(50) NULL, 
		[Description] VARCHAR(100) NULL)
END;

--Таблица наличия прав к ролях
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'RolePermissions' AND xtype = 'U') 
BEGIN 
	CREATE TABLE [RolePermissions](
		[RPID] INT NOT NULL PRIMARY KEY, 
		[PermissionID] INT NULL, 
		[RoleID] INT NULL, 
		FOREIGN KEY ([PermissionID]) REFERENCES [Permissions]([PermissionID]), 
		FOREIGN KEY ([RoleID]) REFERENCES [Roles]([RoleID]))
END;

--Таблица пользователей
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Users' AND xtype = 'U') 
BEGIN 
	CREATE TABLE [Users](
		[UserID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[LastName] [nvarchar](20) NOT NULL,
		[FirstName] [nvarchar](10) NOT NULL,
		[BirthDate] [datetime] NULL,
		[RegistationDate] [datetime] NULL,
		[City] [nvarchar](15) NULL,
		[Region] [nvarchar](15) NULL,
		[Country] [nvarchar](15) NULL,
		[Phone] [nvarchar](24) NULL,
		[Photo] [image] NULL,
		[RoleID] [int] NULL,
		FOREIGN KEY ([RoleID]) REFERENCES [Roles]([RoleID]))
END;

--Таблица файлов
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Files' AND xtype = 'U') 
BEGIN 
	CREATE TABLE [Files](
		[FileID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[UserID] [int] NULL,
		[Reference] [nvarchar](255) NULL,
		[Name] [nvarchar](50) NOT NULL,
		[Size] [int] NOT NULL,
		[DateLoad] [datetime] NULL,
		[Type] [nvarchar](20) NULL,
		[Extention] [nvarchar](20) NULL,
		FOREIGN KEY ([UserID]) REFERENCES [Users]([UserID]))
END;

