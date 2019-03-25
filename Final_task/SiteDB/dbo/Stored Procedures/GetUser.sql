CREATE PROCEDURE [dbo].[GetUser]
	@ID int
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
WHERE [UserID] = @ID;