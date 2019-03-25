CREATE PROCEDURE [dbo].[GetAllFiles]
AS 
SELECT  
	[FileID],
	[UserID],
	[Reference],
	[Name]
FROM [dbo].[Files];