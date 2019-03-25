CREATE PROCEDURE [dbo].[GetRole]
	@ID int
AS 
SELECT  
	[RoleID],
	[Name]
FROM [dbo].[Roles]
WHERE [RoleID] = @ID