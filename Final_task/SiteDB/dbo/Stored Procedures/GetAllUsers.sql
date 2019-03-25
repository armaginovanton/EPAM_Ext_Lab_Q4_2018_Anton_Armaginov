CREATE PROCEDURE [dbo].[GetAllUsers]
	@top int
AS 
SELECT TOP (@top) 
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
FROM dbo.Users;