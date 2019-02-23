--1.1 ������� � ������� Orders ������, ������� ���� ���������� ����� 6 ��� 1998 ���� (������� ShippedDate) 
--������������ � ������� ���������� � ShipVia >= 2. 
--������ �������� ���� ������ ���� ������ ��� ����� ������������ ����������, 
--�������� ����������� ������ �Writing International Transact-SQL Statements� � Books Online 
--������ �Accessing and Changing Relational Data Overview�. ���� ����� ������������ ����� ��� ���� �������.
--������ ������ ����������� ������ ������� OrderID, ShippedDate � ShipVia. 
SELECT 
[OrderID],
[ShippedDate], 
[ShipVia]  
FROM 
[Northwind].[Orders]
WHERE 
[ShippedDate] BETWEEN CAST('1998-05-06' AS datetime) AND GETDATE() AND [ShipVia] > = 2 

--1.2 �������� ������, ������� ������� ������ �������������� ������ �� ������� Orders.
--� ����������� ������� ����������� ��� ������� ShippedDate ������ �������� NULL ������ �Not Shipped� � 
--������������ ��������� ������� CAS�. ������ ������ ����������� ������ ������� OrderID � ShippedDate. 
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

--1.3 ������� � ������� Orders ������, ������� ���� ���������� ����� 6 ��� 1998 ���� (ShippedDate) 
--�� ������� ��� ���� ��� ������� ��� �� ����������. 
--� ������� ������ ������������� ������ ������� OrderID (������������� � Order Number) 
--� ShippedDate (������������� � Shipped Date). 
--� ����������� ������� ����������� ��� ������� ShippedDate ������ �������� NULL ������ �Not Shipped�,
--��� ��������� �������� ����������� ���� � ������� �� ���������. 
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

--2.1 ������� �� ������� Customers ���� ����������, ����������� � USA � Canada.
--������ ������� � ������ ������� ��������� IN.
--����������� ������� � ������ ������������ � ��������� ������ � ����������� �������.
--����������� ���������� ������� �� ����� ���������� � �� ����� ����������.
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

--2.2 ������� �� ������� Customers ���� ����������, �� ����������� � USA � Canada.
--������ ������� � ������� ��������� IN.
--����������� ������� � ������ ������������ � ��������� ������ � ����������� �������.
--����������� ���������� ������� �� ����� ����������. 
SELECT 
[ContactName], 
[Country]
FROM 
[Northwind].[Customers]
WHERE 
[Country] NOT IN ('USA', 'Canada')
ORDER BY 
[ContactName]

--2.3 ������� �� ������� Customers ��� ������, � ������� ��������� ���������. 
--������ ������ ���� ��������� ������ ���� ��� � ������ ������������ �� ��������. 
--�� ������������ ����������� GROUP BY. ����������� ������ ���� ������� � ����������� �������. 
SELECT DISTINCT 
[Country]
FROM 
[Northwind].[Customers]
ORDER BY 
[Country] DESC

--3.1 ������� ��� ������ (OrderID) �� ������� Order Details (������ �� ������ �����������),
--��� ����������� �������� � ����������� �� 3 �� 10 ������������ � ��� ������� Quantity � ������� Order Details.
--������������ �������� BETWEEN. ������ ������ ����������� ������ ������� OrderID. 
SELECT DiSTINCT 
[OrderID]
FROM 
[Northwind].[Order Details]
WHERE 
[Quantity]
BETWEEN 3 AND 10

--3.2 ������� ���� ���������� �� ������� Customers, 
-- � ������� �������� ������ ���������� �� ����� �� ��������� b � g. ������������ �������� BETWEEN. 
--���������, ��� � ���������� ������� �������� Germany. 
--������ ������ ����������� ������ ������� CustomerID � Country � ������������ �� Country.
SELECT 
[CustomerID],
[Country]
FROM 
[Northwind].[Customers]
WHERE 
SUBSTRING([Country],1,1) BETWEEN 'b' AND 'g'
ORDER BY 
[Country]

--3.3 ������� ���� ���������� �� ������� Customers, � ������� �������� ������ ���������� �� ����� 
-- �� ��������� b � g, �� ��������� �������� BETWEEN.
--� ������� ����� �Execution Plan� ���������� ����� ������ ���������������� 3.2
--��� 3.3 � ��� ����� ���� ������ � ������ ���������� ���������� Execution Plan-a ��� ���� ���� ��������,
--���������� ���������� Execution Plan ���� ������ � ������ � ���� �����������
--� �� �� ����������� ���� ����� �� ������ � �� ������ ��������� ���� ��������� ���������. 
--������ ������ ����������� ������ ������� CustomerID � Country � ������������ �� Country. 
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
-- �� ������� ������� ����� ��������� 3.2 � 3.3

--4.1 � ������� Products ����� ��� �������� (������� ProductName), ��� ����������� ��������� 'chocolade'. 
--��������, ��� � ��������� 'chocolade' ����� ���� �������� ���� ����� 'c' � �������� - ����� ��� ��������,
--������� ������������� ����� �������. ���������: ���������� ������� ������ ����������� 2 ������. 
SELECT 
[ProductName]
FROM 
[Northwind].[Products]
WHERE 
[ProductName] LIKE '%cho_olade%'

--5.1 ����� ����� ����� ���� ������� �� ������� Order Details � ������ ���������� ����������� ������� � ������ �� ���.
--��������� ��������� �� ����� � ��������� � ����� 1 ��� ���� ������ money. 
--������ (������� Discount) ���������� ������� �� ��������� ��� ������� ������.
--��� ����������� �������������� ���� �� ��������� ������� ���� ������� ������ �� ��������� � ������� UnitPrice ����.
--����������� ������� ������ ���� ���� ������ � ����� �������� � ��������� ������� 'Totals'.
SELECT 
ROUND(SUM(([UnitPrice] - [UnitPrice]*[Discount])*[Quantity]),2) AS
[Total]
FROM
[Northwind].[Order Details]

--5.2 �� ������� Orders ����� ���������� �������, ������� ��� �� ���� ���������� 
--(�.�. � ������� ShippedDate ��� �������� ���� ��������). 
--������������ ��� ���� ������� ������ �������� COUNT. �� ������������ ����������� WHERE � GROUP. 
SELECT
COUNT(*) - COUNT([ShippedDate])
AS 
[Not shipped count]
FROM 
[Northwind].[Orders]

--5.3 �� ������� Orders ����� ���������� ��������� ����������� (CustomerID), ��������� ������.
--������������ ������� COUNT � �� ������������ ����������� WHERE � GROUP. 
SELECT 
COUNT(DISTINCT [CustomerID]) 
AS 
[Disctinct custimer count]
FROM 
[Northwind].[Orders]

--6.1 �� ������� Orders ����� ���������� ������� � ������������ �� �����. 
--� ����������� ������� ���� ����������� ��� ������� c ���������� Year � Total.
--�������� ����������� ������, ������� ��������� ���������� ���� �������. 
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

--6.2 �� ������� Orders ����� ���������� �������, c�������� ������ ���������.
--����� ��� ���������� �������� � ��� ����� ������ � ������� Orders, 
--��� � ������� EmployeeID ������ �������� ��� ������� ��������. 
--� ����������� ������� ���� ����������� ������� � ������ �������� 
--(������ ������������� ��� ���������� ������������� LastName & FirstName.
--��� ������ LastName & FirstName ������ ���� �������� ��������� �������� � ������� ��������� �������.
--����� �������� ������ ������ ������������ ����������� �� EmployeeID.) � ��������� ������� �Seller�
--� ������� c ����������� ������� ����������� � ��������� 'Amount'.
--���������� ������� ������ ���� ����������� �� �������� ���������� �������. 
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

--6.3 �� ������� Orders ����� ���������� �������, c�������� ������ ��������� � ��� ������� ����������. 
--���������� ���������� ��� ������ ��� ������� ��������� � 1998 ����.
--� ����������� ������� ���� ����������� ������� � ������ �������� (�������� ������� �Seller�),
--������� � ������ ���������� (�������� ������� �Customer�)  � ������� c ����������� ������� ����������� � ��������� 'Amount'. 
--� ������� ���������� ������������ ����������� �������� ����� T-SQL ��� ������ � ���������� GROUP
-- (���� �� �������� ������� �������� ������ �ALL� � ����������� �������).
--����������� ������ ���� ������� �� ID �������� � ����������.
--���������� ������� ������ ���� ����������� �� ��������, ���������� � �� �������� ���������� ������.
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

--6.4 ����� ����������� � ���������, ������� ����� � ����� ������.
--���� � ������ ����� ������ ���� ��� ��������� ��������� ��� ������ ���� ��� ��������� �����������, 
--�� ���������� � ����� ���������� � ��������� �� ������ �������� � �������������� �����.
--�� ������������ ����������� JOIN.
--� ����������� ������� ���������� ������� ��������� ��������� ��� ����������� �������: 
--		�Person�, �Type� (����� ���� �������� ������ �Customer� ���  �Seller� � ��������� �� ���� ������), �City�.
--������������� ���������� ������� �� ������� �City� � �� �Person�. 
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

--6.5 ����� ���� �����������, ������� ����� � ����� ������.
--� ������� ������������ ���������� ������� Customers c ����� - ��������������.
--��������� ������� CustomerID � City. ������ �� ������ ����������� ����������� ������.
--��� �������� �������� ������, ������� ����������� ������, ������� ����������� ����� ������ ���� � ������� Customers.
--��� �������� ��������� ������������ �������. 
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

--6.6 �� ������� Employees ����� ��� ������� �������� ��� ������������, �.�. ���� �� ������ �������. 
--��������� ������� � ������� 'User Name' (LastName) � 'Boss'. � �������� ������ ���� ��������� ����� �� ������� LastName. 
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

--7.1 ���������� ���������, ������� ����������� ������ 'Western' (������� Region).
--���������� ������� ������ ����������� ��� ����: 
--'LastName' �������� � �������� ������������� ���������� ('TerritoryDescription' �� ������� Territories).
--������ ������ ������������ JOIN � ����������� FROM. 
--��� ����������� ������ ����� ��������� Employees � Territories ���� ������������ ����������� ��������� ��� ���� Northwind. 
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

--8.1 ��������� � ����������� ������� ����� ���� ���������� �� ������� Customers � ��������� ���������� �� ������� �� ������� Orders. 
--������� �� ��������, ��� � ��������� ���������� ��� �������, �� ��� ����� ������ ���� �������� � ����������� �������. 
--����������� ���������� ������� �� ����������� ���������� �������. 
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

--9.1 ��������� ���� ����������� ������� CompanyName � ������� Suppliers, 
--� ������� ��� ���� �� ������ �������� �� ������ (UnitsInStock � ������� Products ����� 0). 
--������������ ��������� SELECT ��� ����� ������� � �������������� ��������� IN. 
--����� �� ������������ ������ ��������� IN �������� '=' ? 
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
-- �������� '=' ������ ������������ �.�. ���������� ����������� �������� ����� ���� ������ ��� 1

--10.1 ��������� ���� ���������, ������� ����� ����� 150 �������. ������������ ��������� ��������������� SELECT. 
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

--11.1 ��������� ���� ���������� (������� Customers), ������� �� ����� �� ������ ������ (��������� �� ������� Orders).
--������������ ��������������� SELECT � �������� EXISTS. 
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

--12.1 ��� ������������ ����������� ��������� Employees ��������� �� ������� Employees ������ ������ ��� ���� ��������, 
--� ������� ���������� ������� Employees (������� LastName ) �� ���� �������. 
--���������� ������ ������ ���� ������������ �� �����������
SELECT 
DISTINCT 
SUBSTRING([LastName],1,1) 
AS [INDEX]
FROM [Northwind].[Employees]
ORDER BY [INDEX]

--13.1 
exec [dbo].[GreatestOrders] 1997, 10;

--13.2 
exec [dbo].[ShippedOrdersDiff] 30;

--13.3 
EXEC dbo.SubordinationInfo 2;

--13.4 
SELECT LastName +' '+ FirstName [Name], dbo.IsBoss(EmployeeID) [IsBoss]
FROM [Northwind].[Employees]