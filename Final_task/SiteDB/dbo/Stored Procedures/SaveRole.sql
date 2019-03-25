CREATE PROCEDURE [dbo].[SaveRole]         
	@RoleName			NVARCHAR (20) = NULL,
	@RoleID			INT = NULL 
AS
BEGIN
IF NOT EXISTS (SELECT [RoleID] FROM [dbo].[Roles] WHERE [RoleID] = @RoleID) OR @RoleID IS NULL
BEGIN
INSERT [dbo].[Roles]([Name]) VALUES(@RoleName)
END
ELSE 
BEGIN
UPDATE [dbo].[Roles] SET [Name] = @RoleName
WHERE [RoleID] = @RoleID
END;
IF @@ROWCOUNT = 0 RETURN 1 
ELSE RETURN 0
END;