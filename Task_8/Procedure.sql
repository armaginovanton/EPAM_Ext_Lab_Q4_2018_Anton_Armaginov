--13.1 �������� ���������, ������� ���������� ����� ������� ����� ��� ������� �� ��������� �� ������������ ���. 
--� ����������� �� ����� ���� ��������� ������� ������ ��������, ������ ���� ������ ���� � ����� �������.
--� ����������� ������� ������ ���� �������� ��������� �������: 
--������� � ������ � �������� �������� (FirstName � LastName � ������: Nancy Davolio), ����� ������ � ��� ���������. 
--� ������� ���� ��������� Discount ��� ������� �������. 
--��������� ���������� ���, �� ������� ���� ������� �����, � ���������� ������������ �������. 
--���������� ������� ������ ���� ����������� �� �������� ����� ������.
--��������� ������ ���� ����������� � �������������� ��������� SELECT � ��� ������������� ��������. 
--�������� ������� �������������� GreatestOrders. ���������� ������������������ ������������� ���� ��������.
--����� ������ ������������ ������� �������� � ������� Query.sql ���� ��������
--��������� �������������� ����������� ������ ��� ������������ ������������ ������ ��������� GreatestOrders.
--����������� ������ ������ �������� � ������� ��� ��������� � ������������ ������ �������� ���� 
--��� ������������� �������� ��� ���� ��� ������� �� ������������ ��������� ��� � ����������� ��������� �������:
--��� ��������, ����� ������, ����� ������. ����������� ������ �� ������ ��������� ������, ���������� � ���������, - 
--�� ������ ��������� ������ ��, ��� ������� � ����������� �� ����.
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

--13.2 �������� ���������, ������� ���������� ������ � ������� Orders, �������� ���������� ����� �������� � ���� (������� ����� OrderDate � ShippedDate).  
--� ����������� ������ ���� ���������� ������, ���� ������� ��������� ���������� �������� ��� ��� �������������� ������.
--�������� �� ��������� ��� ������������� ����� 35 ����. �������� ��������� ShippedOrdersDiff. 
--��������� ������ ����������� ��������� �������: OrderID, OrderDate, ShippedDate, ShippedDelay (�������� � ���� ����� ShippedDate � OrderDate), 
--SpecifiedDelay (���������� � ��������� ��������).  ���������� ������������������ ������������� ���� ���������.
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

--13.3 �������� ���������, ������� ����������� ���� ����������� ��������� ��������, ��� ����������������, ��� � ����������� ��� �����������. 
--� �������� �������� ��������� ������� ������������ EmployeeID. 
--���������� ����������� ����� ����������� � ��������� �� � ������ (������������ �������� PRINT) �������� �������� ����������.
--��������, ��� �������� ���� ����� ����������� ����� ������ ���� ��������. �������� ��������� SubordinationInfo.
--� �������� ��������� ��� ������� ���� ������ ���� ������������ ������,
--����������� � Books Online � ��������������� Microsoft ��� ������� ��������� ���� �����. ������������������ ������������� ���������.
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

--13.4 �������� �������, ������� ����������, ���� �� � �������� �����������. 
--���������� ��� ������ BIT. � �������� �������� ��������� ������� ������������ EmployeeID.
--�������� ������� IsBoss. ������������������ ������������� ������� ��� ���� ��������� �� ������� Employees. 
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