CREATE PROCEDURE [dbo].[CheckLogin]
@Login VARCHAR(20)
AS 
BEGIN
	SELECT
		[Login]
	FROM
		[dbo].[Users]
	WHERE
		[Login] = @Login
END;