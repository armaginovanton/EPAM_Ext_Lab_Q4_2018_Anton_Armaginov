CREATE TABLE [dbo].[RolePermissions] (
    [RPID]         INT NOT NULL,
    [PermissionID] INT NULL,
    [RoleID]       INT NULL,
    PRIMARY KEY CLUSTERED ([RPID] ASC),
    FOREIGN KEY ([PermissionID]) REFERENCES [dbo].[Permissions] ([PermissionID]),
    FOREIGN KEY ([RoleID]) REFERENCES [dbo].[Roles] ([RoleID])
);

