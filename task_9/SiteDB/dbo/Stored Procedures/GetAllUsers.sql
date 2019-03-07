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
	[RoleID]
FROM dbo.Users;