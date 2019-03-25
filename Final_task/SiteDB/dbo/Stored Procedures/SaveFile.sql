CREATE PROCEDURE [dbo].[SaveFile]         
	@ID			    INT = NULL,
	@UserID			INT = NULL,
	@referense      NVARCHAR (225) = NULL,
	@Name			NVARCHAR (50)
AS
BEGIN
IF NOT EXISTS (SELECT [FileID] FROM [dbo].[Files] WHERE [FileID] = @ID) OR @ID IS NULL
BEGIN
INSERT [dbo].[Files]([UserID],[Reference],[Name]) VALUES(@UserID,@referense,@Name)
END
ELSE 
BEGIN
UPDATE [dbo].[Files] SET [UserID] = @UserID, [Reference] = @referense, [Name] = @Name
WHERE [FileID] = @ID
END;
IF @@ROWCOUNT = 0 RETURN 1 
ELSE RETURN 0
END;