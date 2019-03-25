CREATE PROCEDURE [dbo].[SaveUser]
	@UserID				INT = NULL,           
	@LastName			NVARCHAR (20) = NULL,
	@FirstName			NVARCHAR (10) = NULL,
	@BirthDate			DATETIME = NULL,
	@RegistationDate	DATETIME = NULL,
	@City				NVARCHAR (15) = NULL,
	@Region				NVARCHAR (15) = NULL,
	@Password			NVARCHAR (15) = NULL,
	@Country			NVARCHAR (15) = NULL,
	@Phone				NVARCHAR (24) = NULL,
	@Photo				IMAGE = NULL,
	@RoleID				INT = NULL,
	@login				NVARCHAR (20) = NULL
AS
BEGIN
IF NOT EXISTS (SELECT [UserID] FROM [dbo].[Users] WHERE [UserID] = @UserID) OR @UserID IS NULL
BEGIN
INSERT [dbo].[Users](
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
	[Login])
VALUES(
	@LastName,
	@FirstName,		
	@BirthDate,		
	@RegistationDate,
	@City	,		
	@Region	,		
	@Country,		
	@Phone	,		
	@Photo	,		
	@RoleID,
	@Password,
	@login)
END
ELSE 
BEGIN
UPDATE [dbo].[Users]
SET [LastName] = @LastName,
	[FirstName] = @FirstName,
	[BirthDate] = @BirthDate,
	[RegistationDate] = @RegistationDate,
	[City] = @City,
	[Region] = @Region,
	[Country] = @Country,
	[Phone] = @Phone,
	[Photo] = @Photo,
	[RoleID] = @RoleID,
	[Password] = @Password,
	[Login] = @login
WHERE [UserID] = @UserID
END;
IF @@ROWCOUNT = 0 RETURN 1 
ELSE RETURN 0
END;