CREATE PROCEDURE [dbo].[GetAutorizeUser]
	@login NVARCHAR (20) = NULL,
	@password NVARCHAR (15) = NULL
AS 
SELECT 
	[UserID],
	[LastName],
	[FirstName],
	[BirthDate],
	[RegistationDate],
	[City],
	[Region],
	[Country],
	[Phone],
	[Photo],
	[RoleID],
	[Password],
	[login]
FROM dbo.Users
WHERE [login] = @login and [Password] = @password;