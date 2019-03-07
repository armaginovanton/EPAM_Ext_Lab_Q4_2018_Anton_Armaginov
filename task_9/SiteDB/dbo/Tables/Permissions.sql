CREATE TABLE [dbo].[Permissions] (
    [PermissionID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50)  NULL,
    [Description]  VARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([PermissionID] ASC)
);

