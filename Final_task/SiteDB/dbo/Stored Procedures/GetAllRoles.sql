CREATE PROCEDURE [dbo].[GetAllRoles]
AS 
SELECT  
	[RoleID],
	[Name]
FROM [dbo].[Roles];